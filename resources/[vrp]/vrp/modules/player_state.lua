----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR CONTA QUANDO ENTRAR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn", function(user_id, source, first_spawn)
    if user_id then
        local data = vRP.getUserDataTable(user_id)

        if first_spawn then
            if data then
                local colete = data.colete or 0
                local weapons = data.weapons or {}
                local health = data.health or 400 -- Definido como 300 por padrão

                -- Inicializa campos se estiverem vazios
                data.position = data.position or { x = 0, y = 0, z = 0 }
                data.customization = data.customization or { model = "mp_m_freemode_01" }

                -- Verifica se o campo 'customization' está corretamente configurado
                if not data.customization.model then
                    data.customization.model = "mp_m_freemode_01" -- Atribui um modelo padrão
                end

                -- Atraso para garantir que o jogador seja atualizado corretamente
                SetTimeout(5000, function()
                    local playerSource = vRP.getUserSource(user_id)

                    if playerSource then
                        vRPclient._giveWeapons(playerSource, weapons, true)
                        vRPclient._setHealth(playerSource, parseInt(health))
                        vRPclient._setArmour(playerSource, parseInt(colete))
                        vRPclient._setJogando(playerSource, true)
                       -- vRPclient._setCustomization(playerSource, data.customization)

                        -- Teleporta o jogador para a posição salva
                        if data.position.x and data.position.y and data.position.z then
                            vRPclient._teleport(playerSource, data.position.x, data.position.y, data.position.z)
                        end

                        -- Salva as roupas no banco de dados
                        -- if data.roupas then
                        --     tvRP.updateClothes(data.roupas)
                        -- end
                    end
                end)
            else
                print("Dados do usuário não encontrados para user_id: " .. user_id) -- Log de erro
            end
        else
            -- Atualiza roupas ao reaparecer
            -- if data.customization then
            --     vRPclient._setCustomization(source, data.customization)
            -- end
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE ACCOUNT
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tvRP.updatePos(x,y,z)
    local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.position = { x = tonumber(x), y = tonumber(y), z = tonumber(z) }
		end
	end
end

function tvRP.updateArmor(armor)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.colete = colete
		end
	end
end

function tvRP.updateWeapons(weapons)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.weapons = weapons
		end
	end
end

function tvRP.updateHealth(health)
	local user_id = vRP.getUserId(source)
	if user_id then
		local data = vRP.getUserDataTable(user_id)
		if data then
			data.health = health
		end
	end
end


function tvRP.updateClothes(clothes)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.execute("apparence/roupas",{ user_id = user_id, roupas = json.encode(clothes) })
        vRP.updateUserApparence(user_id, "clothes", clothes)
    end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CLEAR ACCOUNT
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.clearAccount(user_id)
    local source = vRP.getUserSource(user_id)
    if user_id then
        local data = vRP.getUserDataTable(user_id)

        data.inventory = {}
        data.weapons = {}

		vRPclient._setHandcuffed(source,false)
        vRPclient._replaceWeapons(source,{})

        if not vRP.hasPermission(user_id,"perm.mochila") then
            data.mochila = { quantidade = 0, perder = 0 }
        end
    end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BLOCK COMMANDS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local time = {
    users = {}
}

function time:set(user_id, segundos)
    if segundos > 0 then
        self.users[user_id] = ( os.time() + segundos )
        return
    end

    if self.users[user_id] then
        self.users[user_id] = nil
    end
end

function time:check(user_id)
    if self.users[user_id] then
        if (self.users[user_id] - os.time()) <= 0 then
            self.users[user_id] = nil
            return true
        end

        TriggerClientEvent("Notify", vRP.getUserSource(user_id),"negado","Você precisa esperar <b>"..(self.users[user_id] - os.time()).." segundo(s)</b> para executar essa ação.", 5000)
        return false
    end

    return true
end

Citizen.CreateThread(function()
    while true do
        for k in pairs(time.users) do
            if time.users[k] then
                if (time.users[k] - os.time()) <= 0 then
                    time.users[k] = nil
                end
            end
        end

        Wait(5 * 60 * 10)
    end
end)

exports("setBlockCommand", function(...)
    return time:set(...)
end)

exports("checkCommand", function(...)
    return time:check(...)
end)