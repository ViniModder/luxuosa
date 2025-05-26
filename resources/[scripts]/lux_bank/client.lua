bankModule = {}
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
bankServer = Tunnel.getInterface("lux_bank")
Tunnel.bindInterface("lux_bank", bankModule)
Proxy.addInterface("lux_bank", bankModule)

-- Citizen.CreateThread(function()
--     while true do
--         local sleep = 100
--         local ped = PlayerPedId()
--         local cds = GetEntityCoords(ped)
--         for bancos = 1,#BankConfig.cds do 
--             local dist = #(cds - BankConfig.cds[bancos])
--             if dist < 10.0 then 
--                 sleep = 3
--              DrawMarker(29, BankConfig.cds[bancos][1],BankConfig.cds[bancos][2],BankConfig.cds[bancos][3] - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 120, 58, 255, 255)
--              DrawMarker(1, BankConfig.cds[bancos][1],BankConfig.cds[bancos][2],BankConfig.cds[bancos][3] - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.3, 120, 58, 255, 255)
--                 if dist <= 2.0 then 
--                     if IsControlJustPressed(0, 38) then 
--                         TriggerEvent('emotes','atm')
--                         bankModule.clOpenNui()
--                     end
--                 end
--             end
--         end
--         Citizen.Wait(sleep)
--     end
-- end)


Citizen.CreateThread(function()
    while true do
        local sleep = 100
        local ped = PlayerPedId()
        local cds = GetEntityCoords(ped)
        local isInVehicle = IsPedInAnyVehicle(ped, false) -- Verifica se o jogador está em um veículo

        for bancos = 1, #BankConfig.cds do 
            local dist = #(cds - BankConfig.cds[bancos])
            
            if dist < 10.0 then 
                sleep = 3

                DrawMarker(29, BankConfig.cds[bancos][1], BankConfig.cds[bancos][2], BankConfig.cds[bancos][3] - 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 37, 22, 247, 255)
                DrawMarker(1, BankConfig.cds[bancos][1], BankConfig.cds[bancos][2], BankConfig.cds[bancos][3] - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.3, 37, 22, 247, 255)

                if dist <= 2.0 and not isInVehicle then -- Adiciona verificação se o jogador não está em um veículo
                    if IsControlJustPressed(0, 38) then 
                        TriggerEvent('emotes', 'atm')
                        bankModule.clOpenNui()
                    end
                end
            end
        end

        Citizen.Wait(sleep)
    end
end)


bankModule.clOpenNui = function()
	SetNuiFocus(true,true)
    SendNUIMessage({action = "setVisible", data = true})
end

RegisterNetEvent('banco:abrir')
AddEventHandler('banco:abrir',function()
    TriggerEvent('emotes','atm')
    bankModule.clOpenNui()
end)

RegisterNUICallback("requestBank",function(data,cb)
	local carteira,banco,nome,logs,multas,bankValues,photo =  bankServer.getInfos()
	cb({ carteira = carteira,  banco = banco, nome = nome, logs = logs, multas = multas, bankValues = bankValues, photo = photo })
end)


RegisterNUICallback("close",function(data, cb)
    vRP.stopAnim()
    SetNuiFocus(false, false)
    cb("ok")
end)
----------------------------------------------------------------
-- CALLBACKS
----------------------------------------------------------------
local cooldown = false

RegisterNUICallback("bankActions",function(data,cb)
	if not cooldown then
		cooldown = true
        if (bankServer[data.action]) then
            print(data.action)
            cb(bankServer[data.action](data.amount, data.id))
        end
		SetTimeout(2000,function()
			cooldown = false
		end)
	else
		TriggerEvent("Notify","negado","Você deve aguardar <b>2 segundos</b>.",5000)
	end
end)
