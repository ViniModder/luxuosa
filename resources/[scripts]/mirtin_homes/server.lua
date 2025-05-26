------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
propriedades = {}
proprietarios = {}
dentroProp = {}
houseOwner = {}

GlobalState.houseOwner = {}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
criarApartamento = function(interior, tipo,price,chaves, minBau, coords, permissao)
    if config.oxmysql then
        local rows = exports["oxmysql"]:executeSync([[ INSERT INTO mirtin_homes(`interior`,`tipo`,`price`,`chaves`,`minBau`,`coords`,`permissao`) VALUES (?,?,?,?,?,?,?) ]], { interior,tipo,price,chaves,minBau,json.encode({x=coords[1],y=coords[2],z=coords[3]}),permissao })
        if rows then
            local id = rows.insertId
            local newCoords = { x=coords[1], y=coords[2], z=coords[3] }

            propriedades[id] = { interior = interior, tipo = tipo, price = price, coords = newCoords, garagem = "{}", chaves = parseInt(chaves), minBau = minBau, maxMoradores = 5, permissao = permissao, porta = true }

            vCLIENT._updatePropriedadeID(-1, id, propriedades[id])
        end
    else
        vRP.execute("mirtin/criarPropriedade", { interior = interior, tipo = tipo, price = price, chaves = chaves, minBau = minBau, coords = json.encode({x=coords[1],y=coords[2],z=coords[3]}), permissao = permissao })
        refreshHomes()
    end
end

criarCasa = function(interior, tipo,price,minBau, coords, permissao)
    if config.oxmysql then
        local rows = exports["oxmysql"]:executeSync([[ INSERT INTO mirtin_homes(`interior`,`tipo`,`price`,`chaves`,`minBau`,`coords`,`permissao`) VALUES (?,?,?,?,?,?,?) ]], { interior,tipo,price,1,minBau,json.encode({x=coords[1],y=coords[2],z=coords[3]}),permissao })
        if rows then
            local id = rows.insertId
            local newCoords = { x=coords[1], y=coords[2], z=coords[3] }

            propriedades[id] = { interior = interior, tipo = tipo, price = price, coords = newCoords, garagem = "{}", chaves = 1, minBau = minBau, maxMoradores = 5, permissao = permissao, porta = true }

            vCLIENT._updatePropriedadeID(-1, id, propriedades[id])
        end
    else
        vRP.execute("mirtin/criarPropriedade", { interior = interior, tipo = tipo, price = price, chaves = 1, minBau = minBau, coords = json.encode({x=coords[1],y=coords[2],z=coords[3]}), permissao = permissao })
        refreshHomes()
    end
end

criarGaragem = function(id, coords, spawnCoords)
    local id = parseInt(id)
    if id then
        local value = { garagem = { x = coords[1], y = coords[2], z = coords[3] }, spawn = { x = spawnCoords[1], y = spawnCoords[2], z = spawnCoords[3], h = spawnCoords[4]  } }
        vRP.execute("mirtin/criarGaragem", { houseID = id, garagem = json.encode(value) })

        propriedades[id] = { interior = propriedades[id].interior, tipo = propriedades[id].tipo, price = propriedades[id].price, coords = propriedades[id].coords, garagem = value, chaves = parseInt(propriedades[id].chaves), minBau = propriedades[id].minBau, maxMoradores = 5, permissao = propriedades[id].permissao, porta = propriedades[id].porta }
        vCLIENT._updatePropriedadeID(-1, id, propriedades[id])

        if config.lotus then
            TriggerEvent("mirtin:getGarages", propriedades, id)
        end
    end
end

RegisterNetEvent('comprarGaragem')
AddEventHandler('comprarGaragem', function(houseID, coords, spawnCoords)
    local user_id = vRP.getUserId(source)
    
    if user_id then
        -- Verifique se o usuário tem permissão ou dinheiro suficiente
        local hasPermission = vRP.hasPermission(user_id, 'proprietario')
        local canAfford = true -- Aqui você pode adicionar lógica para verificar se o usuário tem dinheiro suficiente

        if hasPermission and canAfford then
            -- Atualize o banco de dados para registrar a nova garagem
            local success = vRP.setGarage(houseID, coords, spawnCoords)

            if success then
                TriggerClientEvent('Notify', source, 'success', 'Garagem comprada com sucesso.')
                -- Aqui você pode adicionar lógica para criar fisicamente a garagem no mapa
            else
                TriggerClientEvent('Notify', source, 'error', 'Falha ao comprar a garagem.')
            end
        else
            TriggerClientEvent('Notify', source, 'error', 'Você não tem permissão ou dinheiro suficiente.')
        end
    end
end)

function vRP.setGarage(houseID, coords, spawnCoords)
    -- Aqui você deve adicionar a lógica para salvar a garagem no banco de dados
    -- Exemplo:
    local query = "INSERT INTO garages (house_id, coords_x, coords_y, coords_z, spawn_x, spawn_y, spawn_z) VALUES (@houseID, @coords_x, @coords_y, @coords_z, @spawn_x, @spawn_y, @spawn_z)"
    local params = {
        ["@houseID"] = houseID,
        ["@coords_x"] = coords[1],
        ["@coords_y"] = coords[2],
        ["@coords_z"] = coords[3],
        ["@spawn_x"] = spawnCoords[1],
        ["@spawn_y"] = spawnCoords[2],
        ["@spawn_z"] = spawnCoords[3]
    }
    return MySQL.Async.execute(query, params)
end



deletarPropriedade = function(id)
    local id = parseInt(id)
    if id then
        vRP.execute("mirtin/deletarPropriedade", { houseID = id })
        vRP.execute("mirtin/deleteUsers", { houseID = id })

        propriedades[parseInt(id)] = nil
        vCLIENT._updatePropriedadeID(-1, id, nil)
    end
end

comprarPropriedade = function(user_id, tipo, id, interior)
    local id = parseInt(id)
    if id then
        if config.lotus then
            if config.oxmysql then
                local rows = exports["oxmysql"]:executeSync([[INSERT INTO mirtin_users_homes (tipo,houseID,proprietario,interior,iptu) VALUES (?,?,?,?,?) ]], { tipo,id,user_id,interior,(os.time() + config.sellHouseIptu*24*60*60) })
                if rows then
                    local rowsID = rows.insertId
                    if rowsID then
                        if proprietarios[user_id] == nil then
                            proprietarios[user_id] = {}
                        end
        
                        proprietarios[user_id][tostring(id)] = { id = rowsID, houseID = id, proprietario = user_id, moradores = "{}", interior = interior, iptu = (os.time() + config.sellHouseIptu*24*60*60), maxChaves = parseInt(propriedades[parseInt(id)].chaves) }
                    end
                end
            else
                vRP.execute("mirtin/comprarPropriedade", { tipo = tipo, houseID = id, proprietario = user_id, interior = interior, iptu = (os.time() + config.sellHouseIptu*24*60*60) })
                refreshMoradores()
            end
        else
            if config.oxmysql then
                local rows = exports["oxmysql"]:executeSync([[INSERT INTO mirtin_users_homes (tipo,houseID,proprietario,interior,iptu) VALUES (?,?,?,?,?) ]], { tipo,id,user_id,interior,os.time() })
                if rows then
                    local rowsID = rows.insertId
                    if rowsID then
                        if proprietarios[user_id] == nil then
                            proprietarios[user_id] = {}
                        end
        
                        proprietarios[user_id][tostring(id)] = { id = rowsID, houseID = id, proprietario = user_id, moradores = "{}", interior = interior, iptu = os.time(), maxChaves = parseInt(propriedades[parseInt(id)].chaves) }
                    end
                end
            else
                vRP.execute("mirtin/comprarPropriedade", { tipo = tipo, houseID = id, proprietario = user_id, interior = interior, iptu = os.time() })
                refreshMoradores()
            end
        end
    end
end


-- Comando para recarregar casas
RegisterCommand('reloadhomes', function(source)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "admin.permissao") then -- Permissão para recarregar as casas
            refreshHomes() -- Chama a função para atualizar as casas
            
            -- Mensagem de confirmação para o jogador
            TriggerClientEvent('chat:addMessage', source, {
                args = { "Sistema", "Casas recarregadas com sucesso!" }
            })
        else
            -- Mensagem de erro se não tiver permissão
            TriggerClientEvent('chat:addMessage', source, {
                args = { "Sistema", "Você não tem permissão para executar este comando." }
            })
        end
    else
        print("Erro: user_id é nil") -- Log de erro se o user_id não puder ser obtido
    end
end)

-- Função para atualizar propriedades
function refreshHomes()
    local rows = vRP.query("mirtin/allPropriedades", {})
    if rows then
        for k, v in pairs(rows) do
            propriedades[v.id] = {
                tipo = v.tipo,
                interior = v.interior,
                price = v.price,
                coords = json.decode(v.coords),
                garagem = json.decode(v.garagem),
                chaves = v.chaves,
                minBau = v.min,
                maxMoradores = v.maxMoradores,
                permissao = v.permissao,
                porta = true
            }
        end
        
        vCLIENT._updatePropriedades(-1, propriedades) -- Atualiza as propriedades no cliente
        TriggerEvent("mirtin:getGarages", propriedades) -- Chama o evento para atualizar garagens
        
        print("^2Propriedades Carregadas: ^0" .. #rows) -- Mensagem de log

        refreshMoradores() -- Atualiza os moradores
    end
end

-- Função para atualizar moradores
function refreshMoradores()
    local rows2 = vRP.query("mirtin/allMoradores", {})
    if rows2 and #rows2 > 0 then
        for k, v in pairs(rows2) do
            if propriedades[v.houseID] ~= nil then
                if proprietarios[v.proprietario] == nil then
                    proprietarios[v.proprietario] = {}
                end

                proprietarios[v.proprietario][v.houseID] = {
                    id = v.id,
                    houseID = v.houseID,
                    proprietario = v.proprietario,
                    moradores = v.moradores,
                    interior = v.interior,
                    iptu = v.iptu,
                    maxChaves = propriedades[v.houseID].chaves
                }
                houseOwner[v.houseID] = true
            end
        end        
        GlobalState.houseOwner = houseOwner -- Atualiza o estado global dos proprietários
    end
end


src.checkIdHouse = function(id)
    local houseId = #vRP.query("mirtin/selecionarPropriedade", { houseID = id })
    if houseId > 0 then
        return true
    end
end

src.returnPropriedades = function()
    return propriedades
end

src.checkEnterHouse = function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local owner = vRP.query("mirtin/ownerPropriedade", { houseID = id })
        if #owner > 0 then
            if user_id == parseInt(owner[1].proprietario) then
                return true
            end

            local moradores = json.decode(owner[1].moradores)
            if moradores[tostring(user_id)] ~= nil then
                return true
            end
        end
    end
end

src.checkEnterAp = function(user_id, id, proprietario) -- return 1 = entra ap, return 2 = toca campanhia, return 3 nao existe esse numero
    local owner = vRP.query("mirtin/allAPOwner", { houseID = id, proprietario = proprietario })
    if #owner > 0 then 
        if parseInt(proprietario) == parseInt(user_id) then
            return 1
        end

        local moradores = json.decode(owner[1].moradores)
        if moradores[tostring(user_id)] ~= nil then
            return 1
        end

        return 2
    else
        return 3
    end
end

src.syncLock = function(id, status)
    propriedades[id].porta = status
    vCLIENT._updatePropriedadesLock(-1, id, status)
end

src.getInfoHouseId = function(id, tipo, proprietario)
    if tipo == "casa" then
        local rows = vRP.query("mirtin/allHomeOwner", { houseID = id  })
        local house = rows[1]

        if #rows > 0 then
            return house.id,house.tipo,house.houseID,house.proprietario,house.moradores,house.bau,house.armario,house.interior,house.iptu
        end

    elseif tipo == "apartamento" then
        local rows = vRP.query("mirtin/allAPOwner", { houseID = id, proprietario = proprietario })
        local house = rows[1]

        if #rows > 0 then
            return house.id,house.tipo,house.houseID,house.proprietario,house.moradores,house.bau,house.armario,house.interior,house.iptu
        end
        
    end
end

src.entrarPropriedade = function(id, houseTipo, proprietario)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local id,tipo,houseID,proprietario,moradores,bau,armario,interior,iptu = src.getInfoHouseId(id, houseTipo, proprietario)
        if proprietario ~= nil then
            if config.interiors[parseInt(interior)] ~= nil then
                local houseInterior = config.interiors[parseInt(interior)]
                if houseInterior then
                    houseInterior.id = id
                    houseInterior.tipo = tipo
                    houseInterior.houseID = houseID
                    houseInterior.proprietario = proprietario

                    dentroProp[user_id] = houseID
                    
                    SetPlayerRoutingBucket(source, proprietario)
                    vCLIENT._enterCLhouse(source, houseInterior)

                    if config.voip == "pma-voice" then
                        exports["pma-voice"]:updateRoutingBucket(source, proprietario)
                    end
                end
            end
        end
    end
end

src.sairPropriedade = function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        dentroProp[user_id] = nil
        SetPlayerRoutingBucket(source, 0)
        vCLIENT._exitCLhouse(source, id)

        if config.voip == "pma-voice" then
            exports["pma-voice"]:updateRoutingBucket(source, 0)
        end
    end
end

src.checkIsOwner = function(user_id, id)
    local owner = vRP.query("mirtin/allAPOwner", { houseID = id, proprietario = user_id })
    if #owner > 0 then
        return owner[1]
    end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE GARAGEM
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.openGaragem = function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local vehicles = src.myVehicles(user_id)

        vCLIENT._openNUIGaragem(source, id, vehicles)
    end
end

src.checkOwnerVehicle = function(garagem, vehicle, placa, motor, lataria, gasolina)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local isMyVehicle = src.isMyVehicle(user_id, vehicle)
        local custom = src.getCustomVehicle(user_id, vehicle, placa)

        if isMyVehicle then
            vCLIENT._spawnarVeiculo(source, garagem, vehicle, placa, motor, lataria, gasolina, custom)
        end
    end
end

src.checkHouseGarage = function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local owner = vRP.query("mirtin/ownerPropriedade", { houseID = id })
        if #owner > 0 then
            if user_id == parseInt(owner[1].proprietario) then
                return true
            end

            local moradores = json.decode(owner[1].moradores)
            if moradores[tostring(user_id)] ~= nil then
                return true
            end
        end

        return false
    end
end

src.checkAPGarage = function(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local owner = vRP.query("mirtin/ownerPropriedade", { houseID = id })
        if #owner > 0 then
            for k,v in pairs(owner) do
                if parseInt(v.proprietario) == parseInt(user_id) then
                    return true
                end
            end
        end

        return false
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE BAU
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.getBau = function(id, houseID)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        src.openBau(user_id, id, houseID)
    end
end

src.checkOpenPermission = function(id, proprietario)
    local user_id = vRP.getUserId(source)
    if user_id then
        local owner = vRP.query("mirtin/allAPOwner", { houseID = id, proprietario = proprietario })

        if #owner > 0 then 
            if parseInt(proprietario) == parseInt(user_id) then
                return true
            end

            local moradores = json.decode(owner[1].moradores)
            if moradores[tostring(user_id)] ~= nil then
                return true
            end

            if vRP.hasPermission(user_id, "owner.permissao") then
                return true
            end
        end

        return false
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE ARMARIO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.getArmario = function(id, houseID)
    local rows = vRP.query("mirtin/allInfoHome", { id = id })
    if #rows > 0 then
        local armario = json.decode(rows[1].armario) or {}

        local formatArmario = {}
        for k,v in pairs(armario) do
            formatArmario[k] = v
        end

        return formatArmario
    end
end

src.salvarRoupas = function(id, name, custom)
    local rows = vRP.query("mirtin/allInfoHome", { id = id })
    local roupa = json.decode(rows[1].armario)
    if #rows > 0 then
        roupa[name] = custom
        vRP.execute("mirtin_homes/updateArmario", { id = id, armario = json.encode(roupa) })

        return true
    end
end

src.usarRoupas = function(id, name)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local rows = vRP.query("mirtin/allInfoHome", { id = id })
        local roupa = json.decode(rows[1].armario)
        if #rows > 0 then
            src.CuseRoupas(user_id, name, roupa[name])
        end
    end
end

src.deletarRoupa = function(id, name)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local rows = vRP.query("mirtin/allInfoHome", { id = id })
        local roupa = json.decode(rows[1].armario)
        if #rows > 0 then
            roupa[name] = nil
            vRP.execute("mirtin_homes/updateArmario", { id = id, armario = json.encode(roupa) })
            src.CdeletarRoupa(user_id, name)
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE MORADORES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.checkAddMorador = function(id, houseID)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        src.CaddMorador(user_id, id, houseID)
    end
end

src.checkRemMorador = function(id, houseID, morador)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local rows = vRP.query("mirtin/allInfoHome", { id = id })
        local moradores = json.decode(rows[1].moradores) or {}
        if #rows > 0 then
            moradores[tostring(morador)] = nil
            vRP.execute("mirtin/updateMorador", { id = id, moradores = json.encode(moradores) } )
            src.CremoveMorador(user_id, id,houseID,morador)
        end
    end
end

src.addMorador = function(id, morador, identidade)
    local rows = vRP.query("mirtin/allInfoHome", { id = id })
    local moradores = json.decode(rows[1].moradores) or {}
    if #rows > 0 then
        moradores[tostring(morador)] = identidade.nome.. " ".. identidade.sobrenome

        vRP.execute("mirtin/updateMorador", { id = id, moradores = json.encode(moradores) } )
    end
end

src.getMoradores = function(user_id, houseID)
   local source = vRP.getUserSource(user_id)
   local owner = vRP.query("mirtin/allAPOwner", { houseID = houseID, proprietario = user_id })
    if #owner > 0 then 
        local id = owner[1].id
        local moradores = json.decode(owner[1].moradores)

        vCLIENT._openNuiMoradores(source, houseID, id, moradores)
        return true
    else
        return false
    end
end

src.getNation = function()
    return not config.nationgarages
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTOS PADROES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if user_id then
        vCLIENT._updatePropriedades(source, propriedades)

        if proprietarios[user_id] ~= nil then
            for k,v in pairs(proprietarios[user_id]) do
                if v.iptu then
                    if v.iptu <= os.time() + config.iptuVencimento*24*60*60 then
                        local price = parseInt(propriedades[k].price*config.iptuValue) or 5000
                        TriggerClientEvent("Notify",source,"negado","O IPTU de sua propriedade ["..k.."] está <b>vencido</b>.<br> pague para evitar que sua casa seja vendida automaticamente. <br> <b>Caso deseje pagar pressione [Y]</b><br><b>Caso não deseje pagar pressione [U]</b>", 9000)

                        local payment = vRP.request(source, "Deseja fazer o pagamento do IPTU de sua propriedade no valor de <b>$ "..price.."</b>", 30)
                        if not payment then
                            return
                        end
    
                        if vRP.tryFullPayment(user_id, price) then
                            TriggerClientEvent("Notify",source,"sucesso","Você pagou o IPTU de sua propriedade.<br><b>Vencimento: "..os.date("%d/%m/%Y", (os.time() + config.sellHouseIptu*24*60*60 - config.iptuVencimento*24*60*60)).." </b>", 9000)
                            vRP._execute("mirtin/updateIptu", { iptu = (os.time() + config.sellHouseIptu*24*60*60) , id = v.id })
    
                            if proprietarios[user_id] == nil then
                                proprietarios[user_id] = {}
                            end
    
                            proprietarios[user_id][v.houseID] = { id = v.id, houseID = v.houseID, proprietario = v.proprietario, moradores = v.moradores, interior = v.interior, iptu = (os.time() + config.sellHouseIptu*24*60*60), maxChaves = propriedades[v.houseID].chaves }
                        end
                    end
                end
    
                vCLIENT._myHouseBlip(source, propriedades[v.houseID].coords)
            end
        end
    end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
    if user_id then
        if dentroProp[user_id] ~= nil then
            vRP.atualizarPosicao(user_id, propriedades[dentroProp[user_id]].coords.x,propriedades[dentroProp[user_id]].coords.y,propriedades[dentroProp[user_id]].coords.z)
            SetPlayerRoutingBucket(source, 0)
            dentroProp[user_id] = nil 
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

CreateThread(function()
    Wait(5000)
    refreshHomes()
end)


---------------------------------------------------------------------------------------
-------------------------------- comandos casas
---------------------------------------------------------------------------------------
-- RegisterCommand('casas', function(source,args) -- localizaçoes das casas blip
--     local user_id = vRP.getUserId(source)
--     if user_id then
--         TriggerClientEvent("Notify", source, "sucesso", "Você ativou as marcações das casas/apartamentos disponíveis no mapa.", 5000)
--         vCLIENT.allDispHouses(source)
--     end
-- end)
RegisterNetEvent("mirtin:Blips")
AddEventHandler("mirtin:Blips",function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        TriggerClientEvent("Notify", source, "sucesso", "Você ativou as marcações das casas/apartamentos disponíveis no mapa.", 5000)
        vCLIENT.allDispHouses(source)
    end
end)


function src.getUserPropertiesFromDB(user_id)
    local rows = vRP.query("mirtin/get_houses_by_user", { user_id = user_id })
    return rows 
end


RegisterNetEvent("mirtin:propriedades")
AddEventHandler("mirtin:propriedades",function(source,args)
    local user_id = vRP.getUserId(source) 
    if not user_id then 
        TriggerClientEvent("Notify", source, "negado", "Você não está logado.", 5000)
        return 
    end 
    local properties = src.getUserPropertiesFromDB(user_id) 
    if #properties == 0 then
        TriggerClientEvent("Notify", source, "negado", "Você não possui nenhuma propriedade.", 5000)
        return
    end

    local props = ""
    for _, property in ipairs(properties) do
        if propriedades[property.houseID] then
            local coords = propriedades[property.houseID].coords
            if coords and coords.x and coords.y and coords.z then
                local streetName = vRPclient.getStreetName(source, coords.x, coords.y, coords.z) -- Obtém o nome da rua
                props = props .. "^2(ID: " .. property.houseID .. ")^0 localizada em ^2" .. (streetName or "Rua Desconhecida") .. "^0.\n"
            else
                props = props .. "^2(ID: " .. property.houseID .. ")^0 localização desconhecida.\n"
            end
        else
            print("Propriedade não encontrada na tabela global: " .. property.houseID)
        end
    end
    if props ~= "" then
        TriggerClientEvent('chatMessage', source, '^1[PROPRIEDADES]:\n' .. props)
    else
        TriggerClientEvent("Notify", source, "negado", "Nenhuma propriedade válida encontrada.", 5000)
    end
end, false)


RegisterNetEvent("mirtin:moradores")
AddEventHandler("mirtin:moradores",function(source,args)
    local user_id = vRP.getUserId(source) 
    local houseInfo = src.getUserPropertyFromDB(user_id)
    if houseInfo then
        local houseId = houseInfo.houseID 
        local moradores = src.getMoradores(user_id, houseId)       
        if not moradores or type(moradores) ~= "table" then
            TriggerClientEvent("Notify", source, "negado", "Você não é o proprietário dessa casa ou não há moradores.", 5000)
            return
        end
        if #moradores > 0 then
            TriggerClientEvent("Notify", source, "sucesso", "Moradores da casa: " .. table.concat(moradores, ", "), 5000)
        else
            TriggerClientEvent("Notify", source, "erro", "Não há moradores registrados nesta casa.", 5000)
        end
    else
        TriggerClientEvent("Notify", source, "erro", "Você não possui casas cadastradas.", 5000)
    end
end)



RegisterCommand("ver", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source) 
    if not user_id then 
        TriggerClientEvent("Notify", source, "negado", "Você não está logado.", 5000)
        return 
    end 
    if not tonumber(args[1]) then
        TriggerClientEvent("Notify", source, "negado", "Por favor, forneça um ID de jogador válido.", 5000)
        return
    end
    local target_user_id = tonumber(args[1])
    local owner = vRP.query("mirtin/selectProprietario", { proprietario = target_user_id })
    if #owner == 0 then
        TriggerClientEvent("Notify", source, "negado", "Este jogador não possui nenhuma propriedade.", 5000)
        return
    end
    local props = ""
    for k, v in pairs(owner) do
        local streetName = vCLIENT.getStreetName(source, propriedades[v.houseID].coords.x, propriedades[v.houseID].coords.y, propriedades[v.houseID].coords.z)
        props = props .. "^2(ID: " .. v.houseID .. ")^0 localizada em ^2 " .. streetName .. "^0 .\n"
    end
    TriggerClientEvent('chatMessage', source, '^1[PROPRIEDADES]:\n' .. props)
    return
end, false)




RegisterNetEvent("mirtin:Vender")
AddEventHandler("mirtin:Vender",function(source,args)
    local user_id = vRP.getUserId(source) 
    if not user_id then return end 
    local property = src.getUserPropertyFromDB(user_id)
    
    if not property then
        TriggerClientEvent("Notify", source, "negado", "Você não possui propriedades para vender.", 5000)
        return
    end
    local propertyId = property.houseID
    local nplayer = vRPclient.getNearestPlayer(source, 3)
    if nplayer == nil then
        TriggerClientEvent("Notify", source, "negado", "Nenhum jogador próximo.", 5000)
        return
    end
    local nuser_id = vRP.getUserId(nplayer)
    local value = vRP.prompt(source, "Digite o valor que deseja vender", "")
    if value == "" or not tonumber(value) or tonumber(value) <= 0 then
        TriggerClientEvent("Notify", source, "negado", "Digite o valor corretamente.", 5000)
        return
    end
    local confirm = vRP.request(source, "Tem certeza que você deseja vender esta propriedade por <b>$ " .. vRP.format(value) .. "</b> para o ID <b>" .. nuser_id .. "</b>?", 30)
    if not confirm then
        return
    end
    TriggerClientEvent("Notify", source, "importante", "Proposta enviada... aguarde o jogador", 5000)

    local buyerConfirm = vRP.request(nplayer, "Você deseja comprar esta propriedade por <b>$ " .. vRP.format(value) .. "</b> do ID <b>" .. user_id .. "</b>?", 30)
    if not buyerConfirm then
        return
    end
    if not vRP.tryFullPayment(nuser_id, parseInt(value)) then
        TriggerClientEvent("Notify", source, "negado", "O jogador não possui dinheiro.", 5000)
        TriggerClientEvent("Notify", nplayer, "negado", "Você não possui dinheiro.", 5000)
        return
    end
    vRP.giveMoney(user_id, parseInt(value))
    TriggerClientEvent("Notify", source, "sucesso", "O jogador aceitou a proposta, <b>propriedade vendida.</b>", 5000)
    TriggerClientEvent("Notify", nplayer, "sucesso", "Parabéns!!! Você acabou de comprar essa propriedade.", 5000)
    vRP.execute("mirtin/updateOwner", { proprietario = nuser_id, id = propertyId })
    if proprietarios[nuser_id] == nil then
        proprietarios[nuser_id] = {}
    end
    proprietarios[nuser_id][propertyId] = {
        id = property.id,
        houseID = propertyId,
        proprietario = nuser_id,
        moradores = property.moradores,
        interior = property.interior,
        iptu = os.time(),
        maxChaves = propriedades[propertyId].chaves
    }
    proprietarios[user_id][propertyId] = nil  
    return
end, false)

vRP.prepare("mirtin/get_houses_by_user", "SELECT houseID, proprietario, iptu FROM mirtin_users_homes WHERE proprietario = @user_id")

function src.getUserPropertyFromDB(user_id)
    local rows = vRP.query("mirtin/get_houses_by_user", { user_id = user_id })
    if #rows > 0 then
        return rows[1] -- Retorna a primeira casa encontrada
    end
    return nil
end


RegisterNetEvent("mirtin:iptu")
AddEventHandler("mirtin:iptu",function(source,args)
--RegisterCommand('iptu', function(source, args)
    local user_id = vRP.getUserId(source)
    if user_id then
        local owner = src.getUserPropertyFromDB(user_id)

        if not owner then
            TriggerClientEvent("Notify", source, "negado", "Você não possui uma casa.", 5000)
            return
        end
        if owner.iptu <= os.time() + config.iptuVencimento * 24 * 60 * 60 then
            TriggerClientEvent("Notify", source, "negado", "O IPTU de sua propriedade está <b>vencido</b>.<br> Pague para evitar que sua casa seja vendida automaticamente.<br><b>Caso deseje pagar pressione [Y]</b><br><b>Caso não deseje pagar pressione [U]</b>", 5000)
            local price = propriedades[owner.houseID].price * config.iptuValue
            price = tonumber(price)

            if price <= 1000 then
                price = 1000
            end
            local payment = vRP.request(source, "Deseja fazer o pagamento do IPTU de sua propriedade no valor de <b>$ " .. price .. "</b>", 30)
            if not payment then
                return
            end
            if vRP.tryFullPayment(user_id, price) then
                print("ID: " .. user_id .. " PAGOU: " .. price .. " CASA: " .. owner.houseID)
                vRP.execute("mirtin/updateIptu", { iptu = (os.time() + config.sellHouseIptu * 24 * 60 * 60), id = owner.houseID })
                TriggerClientEvent("Notify", source, "sucesso", "Você pagou o IPTU de sua propriedade.<br><b>Vencimento: " .. os.date("%d/%m/%Y", (os.time() + config.sellHouseIptu * 24 * 60 * 60 - config.iptuVencimento * 24 * 60 * 60)) .. " </b>", 5000)
                if proprietarios[user_id] == nil then
                    proprietarios[user_id] = {}
                end

                proprietarios[user_id][owner.houseID] = { 
                    id = owner.houseID, 
                    houseID = owner.houseID, 
                    proprietario = owner.proprietario, 
                    moradores = {}, 
                    interior = {}, 
                    iptu = os.time(), 
                    maxChaves = propriedades[owner.houseID].chaves 
                }
            end
            return
        end
        TriggerClientEvent("Notify", source, "importante", "Status: <b>EM DIA</b>.<br>Vencimento: <b>" .. os.date("%d/%m/%Y", owner.iptu - config.iptuVencimento * 24 * 60 * 60) .. "</b><br>OBS: <b>Mantenha o pagamento em dia e evite que sua casa seja vendida automaticamente.</b>", 5000)
    end
end)




RegisterCommand("localizar", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if not user_id then 
        TriggerClientEvent("Notify", source, "negado", "Você não está logado.", 5000)
        return 
    end 
    if not tonumber(args[1]) then
        TriggerClientEvent("Notify", source, "negado", "Por favor, forneça um ID de propriedade válido.", 5000)
        return
    end

    local propertyId = tonumber(args[1])
    if propriedades[propertyId] == nil then
        TriggerClientEvent("Notify", source, "negado", "Esta propriedade não existe.", 5000)
        return
    end
    vRPclient._setGPS(source, propriedades[propertyId].coords.x, propriedades[propertyId].coords.y)
    TriggerClientEvent("Notify", source, "sucesso", "Você está localizando a propriedade <b>" .. propertyId .. "</b>.", 5000)
    return
end, false)

