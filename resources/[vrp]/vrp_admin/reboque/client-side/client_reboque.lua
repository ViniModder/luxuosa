local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

----------REBOQUE
local tow = nil
local towed = nil

RegisterNetEvent("vrp_player:startTow")
AddEventHandler("vrp_player:startTow", function(vehid01, vehid02, mod)
    local ped = PlayerPedId()
    local vehicle = GetPlayersLastVehicle()

    local isFlatBed = IsVehicleModel(vehicle, GetHashKey('energyrepairsr')) 
    local isLC = IsVehicleModel(vehicle, GetHashKey('energyrepairsr')) 

    if (isLC or isFlatBed) and not IsPedInAnyVehicle(ped) then
        towed = vRP.getNearestVehicle(11)
        if DoesEntityExist(vehicle) and DoesEntityExist(towed) then
            if tow then
				RequestAnimDict("mini@repair")
				while not HasAnimDictLoaded("mini@repair") do
					RequestAnimDict("mini@repair")
					Citizen.Wait(10)
				end
				TriggerEvent("progress",4000,"Retirando veiculo")
				TriggerEvent("cancelando", true)
				TaskTurnPedToFaceEntity(ped, towed, 5000)
				TaskPlayAnim(ped, "mini@repair", "fixing_a_player", 3.0, 3.0, -1, 50, 0, 0, 0, 0)
				Citizen.Wait(5000)
				TriggerEvent("cancelando", false)
				StopAnimTask(ped, "mini@repair", "fixing_a_player", 2.0)

                TriggerServerEvent("vrp_player:tryTow", VehToNet(vehicle), VehToNet(tow), "out")
                towed = nil
                tow = nil
            else
                if vehicle ~= towed then
                    RequestAnimDict("mini@repair")
                    while not HasAnimDictLoaded("mini@repair") do
                        RequestAnimDict("mini@repair")
                        Citizen.Wait(10)
                    end
					TriggerEvent("progress",4000,"Colocando veiculo")
                    TriggerEvent("cancelando", true)
                    TaskTurnPedToFaceEntity(ped, towed, 5000)
                    TaskPlayAnim(ped, "mini@repair", "fixing_a_player", 3.0, 3.0, -1, 50, 0, 0, 0, 0)
                    Citizen.Wait(5000)
                    TriggerEvent("cancelando", false)
                    TriggerServerEvent("vrp_player:tryTow", VehToNet(vehicle), VehToNet(towed), "in")
                    StopAnimTask(ped, "mini@repair", "fixing_a_player", 2.0)
                    tow = towed
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCTOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_player:syncTow")
AddEventHandler("vrp_player:syncTow", function(vehid01, vehid02, mod)
    if NetworkDoesNetworkIdExist(vehid01) and NetworkDoesNetworkIdExist(vehid02) then
        local vehicle = NetToEnt(vehid01)
        local towed = NetToEnt(vehid02)
		local bigodou = GetEntityBoneIndexByName(vehicle, "energyrepairsr")
		local min, max = GetModelDimensions(GetEntityModel(towed))
        if DoesEntityExist(vehicle) and DoesEntityExist(towed) then
            if mod == "in" then
                AttachEntityToEntity(towed, vehicle, bigodou, 0, -2.2, 0.4 - min.z, 0, 0, 0, 1, 1, 0, 1, 0, 1)
            elseif mod == "out" then
                AttachEntityToEntity(towed, vehicle, bigodou, -0.5, min.y - 8, -0.2, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
                DetachEntity(towed, false, false)
                SetVehicleOnGroundProperly(towed)
            end
        end
    end
end)