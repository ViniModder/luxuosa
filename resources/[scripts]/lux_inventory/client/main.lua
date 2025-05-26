local Tunnel <const>        = module("vrp","lib/Tunnel")
local RESOURCE_NAME <const> = GetCurrentResourceName()
local Proxy <const>         = module("vrp","lib/Proxy")

---@alias vector3 table

vRP = Proxy.getInterface("vRP")
vRPs = Tunnel.getInterface("vRP")

if not IsDuplicityVersion() and not _G["API"] then 
    _G["API"] = {}
    Tunnel.bindInterface(RESOURCE_NAME,API)
end

Remote = Tunnel.getInterface(RESOURCE_NAME)
local InventoryBlocked = 0
function API.SetInventoryBlocked(time)
    SendNUIMessage({route = "CLOSE_INVENTORY"})
    SetNuiFocus(false, false)
    InventoryBlocked = GetGameTimer() + (time * 1000)
end

function API.getSafe()
    return exports.vrp_admin:inSafeZone()
end

local in_arena = false
RegisterNetEvent("mirtin_survival:updateArena", function(boolean)
    in_arena = boolean
end)


RegisterKeyMapping("useslot 1", "Hotkey 1", "keyboard", "1")
RegisterKeyMapping("useslot 2", "Hotkey 2", "keyboard", "2")
RegisterKeyMapping("useslot 3", "Hotkey 3", "keyboard", "3")
RegisterKeyMapping("useslot 4", "Hotkey 4", "keyboard", "4")
RegisterKeyMapping("useslot 5", "Hotkey 5", "keyboard", "5")
RegisterKeyMapping("useslot 6", "Hotkey 6", "keyboard", "6")

RegisterCommand('useslot', function(source,args)
    local value = parseInt(args[1])
    if value > 0 and value <= 6 then
        if not useDelay then
            useDelay = true

            Remote._useItem(value, 1)

            SetTimeout(5 * 1000, function() useDelay = false end)
        end
    end
end)



RegisterCommand("abrirmochilahavanna",function()
    local ped = PlayerPedId()
    
    if in_arena then
        TriggerEvent("Notify","negado","Você não pode acessar seu inventario agora.",5000)
        return 
    end 

    if IsPauseMenuActive() then
        return 
    end

    if GetGameTimer() < InventoryBlocked or vRP.isHandcuffed() then
        TriggerEvent("Notify","negado","Você não pode acessar seu inventario agora.",5000)
        return 
    end

    if GetEntityHealth(ped) <= 101 or in_arena == true then 
        TriggerEvent("Notify", "negado", "Você não pode acessar seu inventario agora.",5000)
    return
    end
    
    SendNUIMessage({route = "OPEN_INVENTORY",})
    SetNuiFocus(true,true)
end)

CreateThread(function() 
    RegisterKeyMapping("abrirmochilahavanna","Abrir a mochila","keyboard","OEM_3")
    RegisterKeyMapping("openchest","Trunkchest Open","keyboard","PAGEUP")
end)









function API.getActivePlayers()
    local response = {}
    local players = GetActivePlayers()
    for i = 1,#players do 
        response[#response + 1] = GetPlayerServerId(players[i])
    end
    return response
end

function API.inVehicle()
    return IsPedInAnyVehicle(PlayerPedId())
end

function API.emitNuiEvent(ev)
    SendNUIMessage(ev)
end

AddEventHandler(GetCurrentResourceName()..":emitNuiEvent",function(ev)
    if IsNuiFocused() and not IsNuiFocusKeepingInput() then 
        SendNUIMessage(ev)
    end
end)

RegisterNetEvent('closeInventory')
AddEventHandler('closeInventory',function()
    SendNUIMessage({route = "CLOSE_INVENTORY",})
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 21, 41, 68)
end



function API.rechargeCheck(ammoType)
	local ped = PlayerPedId()
	if weapon_ammos[ammoType] then
		for k,v in pairs(weapon_ammos[ammoType]) do
			if HasPedGotWeapon(ped,v) then
				return v
			end
		end
	end
	return false
end

exports("setinsafe", function(status)
	insafezone = status
end)

exports("checkdrogas", function(status)
	inservicedrogas = status
end)
-------------------------------------------------------------------------


RegisterNetEvent("cloneplates")
AddEventHandler("cloneplates", function(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    if vehicle and DoesEntityExist(vehicle) then
        SetVehicleNumberPlateText(vehicle,plate)
    end
end)




