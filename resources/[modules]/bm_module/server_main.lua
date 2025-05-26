RegisterTunnel.DevTools = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.setBanned(user_id, true)
        vRP.kick(source, "OPA!!! Bobinho, Não pode não..")
    end
end


RegisterNetEvent('spawnarveiculopp')  -- Registre o evento spawnarveiculopp

AddEventHandler('spawnarveiculopp', function(data)  -- Manipulador para o evento spawnarveiculopp
    local source = source
    local user_id = vRP.getUserId(source)
    
    -- Verificar se o jogador está usando cheats para spawnar veículos
    local isUsingCheats = CheckIfUsingCheats(data)  -- Função fictícia para verificar se está usando cheats
    
    if isUsingCheats then
        -- Se estiver usando cheats, bane o jogador
        if user_id then
            vRP.setBanned(user_id, true)
            vRP.kick(source, "Você foi banido por usar cheats.")
        end
    else
        -- Se não estiver usando cheats, permita o spawn do veículo
        TriggerClientEvent('spawnarveiculopp', source, data)  -- Disparar o evento para todos os clientes
    end
end)


RegisterNetEvent('spawnararma')  -- Registre o evento spawnararma

AddEventHandler('spawnararma', function(data)  -- Manipulador para o evento spawnararma
    local source = source
    local user_id = vRP.getUserId(source)
    
    -- Verificar se o jogador está usando cheats para spawnar armas
    local isUsingCheats = CheckIfUsingCheatsForWeapons(data)  -- Função fictícia para verificar se está usando cheats
    
    if isUsingCheats then
        -- Se estiver usando cheats, bane o jogador
        if user_id then
            vRP.setBanned(user_id, true)
            vRP.kick(source, "Você foi banido por usar cheats.")
        end
    else
        -- Se não estiver usando cheats, permita o spawn da arma
        TriggerClientEvent('spawnararma', source, data)  -- Disparar o evento para todos os clientes
    end
end)

-- RegisterNetEvent('anti-flood')
-- AddEventHandler('anti-flood', function(tecla)
--     local source = source
--     local user_id = vRP.getUserId(source)
    
--     if user_id then
--         vRP.kick(source, "Você foi kickado por flood de teclas.")
--     end
-- end)













