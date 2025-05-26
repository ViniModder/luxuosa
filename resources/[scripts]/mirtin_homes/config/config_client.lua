
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","mirtin_homes")

src = {}
Tunnel.bindInterface("mirtin_homes",src)
vSERVER = Tunnel.getInterface("mirtin_homes")
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {} -- Não mexer
sv_config = {} -- Não mexer

CreateThread(function()
    sv_config = vSERVER.ServerConfig()
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.limitZone = 30.0 -- Limite se o player se afastar muito ou nao carregar a casa, teleportar para o blip de entrada.
config.imagemDir = "http://localhost/carros/" -- Diretorio das imagens dos veiculos

config.drawlable = function(id, coords, tipo, porta)
    if tipo == "apartamento" then
        -- Configura a mensagem / blip que irá aparecer na propriedade do tipo "apartamento"
        DrawText3Ds(coords.x, coords.y, coords.z + 0.5, "~w~[Propriedade: ~g~" .. tonumber(id) .. "~w~]\n~w~[~g~E~w~] entrar/sair\n~w~[~g~F~w~] comprar")
        DrawMarker(21, coords.x, coords.y, coords.z - 0.7, 0, 0, 0, 0, 0, 130.0, 0.5, 1.0, 0.5, 0, 255, 0, 180, 1, 0, 0, 1)

    elseif tipo == "casa" then
        if porta then
            -- Mensagem para casa com porta fechada
            DrawText3Ds(coords.x, coords.y, coords.z + 0.5, "~w~[PROPRIEDADE: ~g~" .. tonumber(id) .. "~w~]\n~w~[~g~E~w~] entrar/sair\n~w~[~g~L~w~] destrancar\n~w~Porta: ~r~Fechada ")
            DrawMarker(21, coords.x, coords.y, coords.z - 0.7, 0, 0, 0, 0, 0, 130.0, 0.5, 1.0, 0.5, 255, 0, 0, 180, 1, 0, 0, 1)

        elseif porta2 then
            -- Mensagem para casa com porta aberta
            DrawText3Ds(coords.x, coords.y, coords.z + 0.5, "~w~[PROPRIEDADE: ~g~" .. tonumber(id) .. "~w~]\n~w~[~g~E~w~] entrar/sair\n~w~[~g~L~w~] trancar\n~w~Porta: ~g~Aberta ")
            DrawMarker(21, coords.x, coords.y, coords.z - 0.7, 0, 0, 0, 0, 0, 130.0, 0.5, 1.0, 0.5, 0, 255, 0, 180, 1, 0, 0, 1)

        else
            -- Mensagem para comprar garagem
            DrawText3Ds(coords.x, coords.y, coords.z + 0.5, "~w~[PROPRIEDADE: ~g~" .. tonumber(id) .. "~w~]\n~w~[~g~E~w~] entrar/sair\n~w~[~g~G~w~] Comprar garagem")
            DrawMarker(21, coords.x, coords.y, coords.z - 0.7, 0, 0, 0, 0, 0, 130.0, 0.5, 1.0, 0.5, 0, 255, 0, 180, 1, 0, 0, 1)
        end

    elseif tipo == "garagem" then
        -- Configura o marcador para a garagem
        DrawMarker(36, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 130.0, 0.5, 1.0, 0.5, 0, 255, 0, 180, 1, 0, 0, 1)

    elseif tipo == "armario" then
        -- Configura o marcador para o armário
        DrawMarker(0, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 130.0, 0.5, 0.5, 0.5, 0, 255, 0, 180, 1, 0, 0, 1)

    elseif tipo == "bau" then
        -- Configura o marcador para o baú
        DrawMarker(30, coords.x, coords.y, coords.z - 0.3, 0, 0, 0, 0, 0, 130.0, 0.5, 1.0, 0.5, 0, 255, 0, 180, 1, 0, 0, 1)
    end
end


config.lang = {
    trancar = function() return TriggerEvent("Notify", "importante", "Você <b>trancou</b> a porta.", 1000) end, -- Notificação quando a porta trancar
    destrancar = function() return TriggerEvent("Notify", "importante", "Você <b>destrancou</b> a porta.", 1000) end, -- Notificação quando a porta destrancar
    trancada = function() return TriggerEvent("Notify", "importante", "A porta está <b>trancada</b>, destranque para entrar.", 1000) end, -- Notificação quando a porta estiver trancada
    notownerGaragem = function() return TriggerEvent("Notify", "importante", "Você não tem acesso a essa garagem.", 1000) end, -- Notificação quando o jogador não tem acesso à garagem
    veiculoSpawnado = function() return TriggerEvent("Notify", "importante", "Este veículo já se encontra fora da garagem.", 1000) end, -- Notificação quando o veículo já está fora da garagem
    apGaragem = function() return TriggerEvent("Notify", "importante", "As vagas de garagem no apartamento são apenas para o proprietário.", 1000) end, -- Notificação quando o veículo já está fora da garagem
    notAccess = function() return TriggerEvent("Notify", "importante", "Você não possui acesso a isso.", 5000) end -- Notificação quando o jogador não tem acesso a uma ação
}

config.animLock = function() -- Animacao trancar/destrancar porta
	vRP._playAnim(true,{{"veh@mower@base","start_engine"}},false) -- Animacao
	Wait(2000) -- Tempo da Animacao
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS GARAGEM
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.tuningVehicle = function(custom, veh) -- Sua função de aplicar tunagem
	TriggerServerEvent("nation:syncApplyMods", custom,VehToNet(veh))
end

src.deleteVehicle = function(veh) -- Sua função de deletar veiculo
    exports['bm_module']:deleteVehicle(source, veh)
end


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.allDispHouses = function() -- Blips do comando /home disp
    houseOwner = GlobalState.houseOwner
    
    for k, v in pairs(propriedades) do
        -- Verificar se v.coords existe e se tem os valores x, y, z
        if v.coords and v.coords.x and v.coords.y and v.coords.z then
            if houseOwner[k] == nil or v.tipo == "apartamento" then
                local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
                SetBlipSprite(blip, 411)
                SetBlipAsShortRange(blip, true)
                SetBlipColour(blip, 2)
                SetBlipScale(blip, 0.4)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString("Propriedade Disponível")
                EndTextCommandSetBlipName(blip)
                
                SetTimeout(60000, function() 
                    if DoesBlipExist(blip) then 
                        RemoveBlip(blip) 
                    end 
                end)
            end
        else
            print("Erro: Coordenadas inválidas para propriedade " .. tostring(k))
        end
    end
end

src.myHouseBlip = function(coords) -- Blips da propriedades dos players
    -- Verificar se coords existe e se tem os valores x, y, z
    if coords and coords.x and coords.y and coords.z then
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 411)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 36)
        SetBlipScale(blip, 0.4)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Minha propriedade")
        EndTextCommandSetBlipName(blip)
    else
        print("Erro: Coordenadas inválidas para propriedade do jogador")
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTIMIZAÇÃO ( NAO MEXA AQUI )
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Thread principal para gerenciamento das interações com as casas e garagens
Citizen.CreateThread(function()
    while true do
        local time = 1000
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        -- Verificação se o jogador está dentro de um interior
        if in_interior then
            local distance = #(pedCoords - infoInterior.coords)

            -- Se o jogador estiver fora dos limites da zona, reposiciona ele
            if distance >= config.limitZone then
                SetEntityCoords(ped, infoInterior.coords[1], infoInterior.coords[2], infoInterior.coords[3])
            end

            if distance <= 2.0 then
                time = 1
                config.drawlable(infoInterior.houseID, infoInterior.coords, infoInterior.tipo, propriedades[infoInterior.houseID].porta)

                if infoInterior.tipo == "casa" then
                    -- Trancar/destrancar a porta da casa com a tecla 'L'
                    if IsControlJustReleased(1, 182) and segundos <= 0 then
                        segundos = 3
                        if vSERVER.checkEnterHouse(infoInterior.houseID) then
                            config.animLock()
                            propriedades[infoInterior.houseID].porta = not propriedades[infoInterior.houseID].porta
                            config.lang[propriedades[infoInterior.houseID].porta and 'trancar' or 'destrancar']()
                            vSERVER.syncLock(infoInterior.houseID, propriedades[infoInterior.houseID].porta)
                        end
                    end

                    -- Verificação para comprar a garagem com a tecla 'G'
                    -- Lado do Cliente
                if IsControlJustReleased(1, 47) and segundos <= 0 then -- Tecla 'G'
                segundos = 3
                local houseID = infoInterior.houseID
                local coords = { infoInterior.coords[1], infoInterior.coords[2], infoInterior.coords[3] }
                local spawnCoords = { coords[1] + 5, coords[2] + 5, coords[3] } -- Ajustar coordenadas de spawn da garagem
    
                -- Chamando a função do servidor para criar a garagem e salvar no banco de dados
                TriggerServerEvent('criar:garagem', houseID, coords, spawnCoords)
                end


                    -- Sair da propriedade com a tecla 'E'
                    if IsControlJustReleased(1, 51) and segundos <= 0 then
                        segundos = 3
                        if not propriedades[infoInterior.houseID].porta then
                            vSERVER.sairPropriedade(infoInterior.houseID)
                        else
                            config.lang['trancada']()
                        end
                    end

                elseif infoInterior.tipo == "apartamento" then
                    -- Sair do apartamento com a tecla 'E'
                    if IsControlJustReleased(1, 51) and segundos <= 0 then
                        segundos = 3
                        vSERVER.sairPropriedade(infoInterior.houseID)
                    end
                end
            end

        else
            -- Verificação das casas mais próximas quando o jogador está fora do interior
            if next(nearestHouse) then
                for k, house in pairs(nearestHouse) do
                    local distance = #(pedCoords - vec3(house.coords.x, house.coords.y, house.coords.z))
                    if distance <= 5.0 then
                        time = 5
                        config.drawlable(k, vec3(house.coords.x, house.coords.y, house.coords.z), house.tipo, house.porta)

                        if distance <= 2.0 then
                            if house.tipo == "casa" then
                                -- Trancar/destrancar com a tecla 'L'
                                if IsControlJustReleased(1, 182) and segundos <= 0 then
                                    segundos = 3
                                    if vSERVER.checkEnterHouse(k) then
                                        config.animLock()
                                        house.porta = not house.porta
                                        config.lang[house.porta and 'trancar' or 'destrancar']()
                                        vSERVER.syncLock(k, house.porta)
                                    end
                                end

                                -- Entrar ou comprar a propriedade com a tecla 'E'
                                if IsControlJustReleased(1, 51) and segundos <= 0 then
                                    segundos = 3
                                    if not house.porta then
                                        vSERVER.entrarPropriedade(k, house.tipo)
                                    else
                                        if vSERVER.comprarPropriedade(k, tostring(house.tipo)) then
                                            config.lang['trancada']()
                                        end
                                    end
                                end

                            elseif house.tipo == "apartamento" then
                                -- Usar o interfone do apartamento com a tecla 'E'
                                if IsControlJustReleased(1, 51) and segundos <= 0 then
                                    segundos = 3
                                    vSERVER.interfone(k)
                                end

                                -- Comprar o apartamento com a tecla 'Q'
                                if IsControlJustReleased(1, 145) and segundos <= 0 then
                                    segundos = 3
                                    vSERVER.comprarPropriedade(k, tostring(house.tipo))
                                end
                            end
                        end
                    end
                end
            end
        end

        Citizen.Wait(time)
    end
end)


Citizen.CreateThread(function()
    local updateInterval = 100 -- Tempo de espera entre cada verificação da tecla G
    local nearestUpdateInterval = 1000 -- Tempo de espera para atualizar a lista de casas próximas

    while true do
        local player = PlayerPedId()
        local pedCoords = GetEntityCoords(player)
        
        -- Atualiza a lista de casas mais próximas a cada 1 segundo
        if not in_interior then
            for k, house in pairs(propriedades) do
                local houseCoords = vector3(house.coords.x, house.coords.y, house.coords.z)
                local distance = #(pedCoords - houseCoords)
                
                if distance < 10 then
                    nearestHouse[k] = house
                elseif nearestHouse[k] then
                    nearestHouse[k] = nil
                end
            end
        end
        
        -- Verifica se o jogador aperta a tecla G próximo a uma casa
        for k, house in pairs(nearestHouse) do
            local houseCoords = vector3(house.coords.x, house.coords.y, house.coords.z)
            local distance = #(pedCoords - houseCoords)

            if distance < 1 then
                if IsControlJustPressed(0, 47) then -- 47 é o código da tecla G
                    TriggerServerEvent('criar:garagem', house.id) -- Passa o ID da casa ou outra identificação se necessário
                end
            end
        end

        Citizen.Wait(updateInterval)
    end
end)


-- Variável para armazenar as coordenadas do veículo
local spawnCoords = nil

-- Evento para receber coordenadas do veículo do cliente
RegisterNetEvent('getSpawnVehicleCoords')
AddEventHandler('getSpawnVehicleCoords', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle and vehicle ~= 0 then
        local coords = GetEntityCoords(vehicle)
        spawnCoords = { x = coords.x, y = coords.y, z = coords.z }
        TriggerServerEvent('receiveSpawnVehicleCoords', spawnCoords) -- Envia coordenadas para o servidor
    else
        TriggerEvent('Notify', 'negado', 'Você precisa estar em um veículo.', 5000)
    end
end)

