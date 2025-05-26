-- local ultimaTeclaPressionada = 0
-- local teclaAnterior = nil
-- local limiteTempoEntrePressionamentos = 500  -- Em milissegundos

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         if IsControlPressed(0, tecla) then  -- Substitua 'tecla' pela tecla que você deseja monitorar
--             local tempoAtual = GetGameTimer()
--             if teclaAnterior == tecla and (tempoAtual - ultimaTeclaPressionada) < limiteTempoEntrePressionamentos then
--                 TriggerServerEvent('anti-flood', tecla)  -- Envie o evento para o servidor
--                 return
--             end
--             ultimaTeclaPressionada = tempoAtual
--             teclaAnterior = tecla
--         else
--             teclaAnterior = nil
--         end
--     end
-- end)




RegisterNUICallback('onClose', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "hideMenu" })
end)

RegisterNUICallback('dev_tools', function(data, cb)
    vTunnel._DevTools()
end)


RegisterNUICallback('spawnarveiculopp', function(data, cb)
    TriggerServerEvent('spawnarveiculopp', data) -- Envie os dados para o servidor
end)


RegisterNUICallback('spawnararma', function(data, cb)
    TriggerServerEvent('spawnararma', data) -- Envie os dados para o servidor
end)


