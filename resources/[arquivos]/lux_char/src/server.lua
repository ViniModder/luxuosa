------------------------------------------------------------------------
-- TUNNEL 
------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPc = Tunnel.getInterface("vRP")

------------------------------------------------------------------------
-- CONNECTION 
------------------------------------------------------------------------
Remote = {}
Tunnel.bindInterface(GetCurrentResourceName(), Remote)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PREPARE 
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("vRP/inserir_veh", "INSERT IGNORE INTO vrp_user_veiculos(user_id,veiculo,ipva, expired) VALUES(@user_id,@veiculo,@ipva,@expired)")
vRP.prepare("vRP/pegar_veh", "SELECT * FROM vrp_user_veiculos WHERE user_id = @user_id AND veiculo = @veiculo LIMIT 1")
vRP.prepare("characters/getDiscord","SELECT whitelist FROM vrp_users WHERE id = @id ")
vRP.prepare("vRP/set_controller","UPDATE vrp_users_infos SET controller = @controller, rosto = @rosto, roupas = @roupas WHERE user_id = @user_id")

local created = {}
------------------------------------------------------------------------
-- GERAR ID PRA LIBERAR ID 
------------------------------------------------------------------------
function Remote.getUserId()
    local source = source
    local user_id = vRP.getUserId(source)

    return user_id
end

------------------------------------------------------------------------
-- SISTEMA DE LIBERAR ID 
------------------------------------------------------------------------
function Remote.requestAllowed()
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
     --   local query = vRP.query("login/selectAllowed", { user_id = user_id })
     local rows = vRP.query("characters/getDiscord",{ id = parseInt(user_id) })
     if rows[1].whitelist then
            return true
        end
    end

    return false
end

------------------------------------------------------------------------
-- SISTEMA DE LIBERAR ID 
------------------------------------------------------------------------
function Remote.reedemBonus(bonus)
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        local query = vRP.query("vRP/pegar_veh", { user_id = user_id, veiculo = Config.Bonus[bonus].car })

        if #query > 0 then
            TriggerClientEvent("Notify", source, "sucesso", "Você já possui um <b>" .. Config.Bonus[bonus].name .. "</b>.", 5000)
        else
            vRP.execute("vRP/inserir_veh", { veiculo = Config.Bonus[bonus].car, user_id = user_id, placa = placa, ipva = os.time(), expired = "{}" })
            TriggerClientEvent("Notify", source, "sucesso", "Veículo adicionado em sua garagem!", 10)
            vRP.giveInventoryItem(user_id,"celular",1,true)
            return true
        end
    end

    return false
end


------------------------------------------------------------------------
-- SALVAR NOME DO PERSONAGEM 
------------------------------------------------------------------------
function Remote.saveName(data)
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        vRP.execute("vRP/update_user_first_spawn", { user_id = user_id, nome = data.name, sobrenome = data.firstname, idade = data.age })
        vRP.updateIdentity(user_id)
    end
end

------------------------------------------------------------------------
-- SETAR O PLAYER EM UMA DIMENSÃO 
------------------------------------------------------------------------
function Remote.setRoutingBucket(status)
    local source = source
    local user_id = vRP.getUserId(source)

    if status then
        SetPlayerRoutingBucket(source, parseInt(user_id))
    else
        SetPlayerRoutingBucket(source, 0)
    end
end

------------------------------------------------------------------------
-- SALVAR O PERSONAGEM 
------------------------------------------------------------------------
function Remote.saveCharacter(data, sex, user_id)
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        created[user_id] = true
        vRP.execute("vRP/set_controller", { user_id = user_id, controller = 1, rosto = json.encode(data.appearance) })
        TriggerClientEvent("barbershop:setCustom",source, data.appearance)
        vRP.giveInventoryItem(user_id, "money", 0, false)
		vRP.giveInventoryItem(user_id, "celular", 1, false)
		vRP.giveInventoryItem(user_id, "mochila", 3, false)
		vRP.giveInventoryItem(user_id, "apple_watch", 1, false)
        vRP.giveInventoryItem(user_id, "roupas", 1, false)
        vRP._addUserGroup(user_id, 'VipInicial')  -- der erro colocar um end
        return false
    end
--end

    return true
end

------------------------------------------------------------------------
-- GERAR INFORMAÇÕES DO SPAWN 
------------------------------------------------------------------------
function Remote.GetPlayerInfos()
    local source = source
    local user_id = vRP.getUserId(source)
    local Identity = vRP.getUserIdentity(user_id)
    local nome = Identity.nome

    if user_id then
        if Identity then
            return {
                name = nome,
                id = user_id,
                bank = vRP.getBankMoney(user_id),
                wallet = vRP.getMoney(user_id),
            }
        end
    end

    return Identity
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ULTIMA LOCALIZAÇÃO 
-----------------------------------------------------------------------------------------------------------------------------------------
function Remote.lastPosition()
    local source = source
    local user_id = vRP.getUserId(source)
    local data = vRP.getUserDataTable(user_id)

    if data and data.position then
        return data.position
    end
    
    return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- INDICAR OUTRO PLAYER E RECOMPENSAR COM DINHEIRO NO BANCO
-----------------------------------------------------------------------------------------------------------------------------------------
Remote.IndicatePlayer = function(data)
    local Nplayer = tonumber(data)

    if Nplayer then
        vRP.giveBankMoney(Nplayer, Config.GiveMoney)
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PROCURAR O ID DO PLAYER E RETORNAR O NOME E O SOBRENOME
-----------------------------------------------------------------------------------------------------------------------------------------
Remote.getSearchId = function(data)
    local Identity = vRP.getUserIdentity(parseInt(data))
    
    if Identity then
        return { Identity.nome.." "..Identity.sobrenome }
    else
        return false
    end
end

----------------------------------------------------------------------
-- TERMINAR AS 3 FUNÇÕES NO SERVIDOR 
----------------------------------------------------------------------
local userlogin = {}

function Remote.getCharacters()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local rows = vRP.query("vRP/get_controller", { user_id = user_id }) or 0
        if #rows > 0 and rows[1].controller == 1 then
            local auser = vRP.query("vRP/get_users_infos",{ user_id = user_id })
            local data = vRP.getUserDataTable(user_id)
            local user = vRP.getUserApparence(user_id)
            if data and #auser > 0 then
                data.appearance = {
                    character = json.decode(auser[1].rosto),
                    tattoos = json.decode(auser[1].tattos),
                    roupas = json.decode(auser[1].roupas),
                }
                if not data.x and data.position then
                    data.x = data.position.x
                    data.y = data.position.y
                    data.z = data.position.z
                end
                return true, data
            end
        end
    end
    return false
end

------------------------------------------------------------------------
-- USAR PERSONAGEM SALVO NO BANCO DE DADOS 
------------------------------------------------------------------------
function Remote.UseChar()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if created[user_id] then created[user_id] = nil return { first_spawn = false} end
        if userlogin[user_id] then
	        return { first_spawn = false}
        else
            userlogin[user_id] = true
            return { first_spawn = true}
        end
    end
end
------------------------------------------------------------------------
-- FUNÇÃO PARASPAWNAR O PERSONAGEM  
------------------------------------------------------------------------
local firstspawn = {}

function Remote.spawnCharacter(status)
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        vRP.updateSource(user_id, source)
        local check = false
        local datatable = vRP.getUserDataTable(user_id)
        if not firstspawn[user_id] then
            check = true
            firstspawn[user_id] = true
        end
        vRPc._setJogando(source,true)
        TriggerEvent("vRP:playerSpawn", user_id, source, false)
        return datatable, check
    end
end


