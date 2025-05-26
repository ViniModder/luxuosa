-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROXY
-----------------------------------------------------------------------------------------------------------------------------------------
cO = {}
Tunnel.bindInterface("lux_module",cO)
vSERVER = Tunnel.getInterface("lux_module")
vRPserver = Tunnel.getInterface("vRP","lux_module")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE MODULE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("module:close", "closenui", "keyboard", "ESCAPE")
RegisterCommand("module:close", function()
	TriggerEvent("module:closeInv")
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENT FIREWORK
-----------------------------------------------------------------------------------------------------------------------------------------
local fireWorks = nil
local fireWorksCreate = false
RegisterNetEvent("b03461cc:pd-inventory:fireworks")
AddEventHandler("b03461cc:pd-inventory:fireworks",function()
    local ped = PlayerPedId()
    local times = 20
    if fireWorksCreate then
        return
    end
    fireWorksCreate = true
    vRP._playAnim(false,{"anim@mp_fireworks","place_firework_3_box"},false)
    Citizen.Wait(2000)    
	local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.5,0.0)
	fireWorks = CreateObject(GetHashKey("ind_prop_firework_03"),coords.x,coords.y,coords.z,true,false,false)
	PlaceObjectOnGroundProperly(fireWorks)
    FreezeEntityPosition(fireWorks,true)
	Citizen.Wait(8000)
    repeat
        vRP.PtfxThis("scr_indep_fireworks")
	    StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst",GetEntityCoords(fireWorks),0.0,0.0,0.0,1.0,false,false,false,false)
	    times = times - 1
	    Citizen.Wait(2000)
    until times == 0    
    DeleteEntity(fireWorks)
    fireWorksCreate = false
	fireWorks = nil
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RETURN FIREWORK
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.returnfireWorks()
    return fireWorksCreate
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE USAR BANDAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
local bandagem = false
local tempoBandagem = 0
local oldHealth = 0

function cO.useBandagem()
	bandagem = true
	tempoBandagem = 60
	oldHealth = GetEntityHealth(PlayerPedId())
end

RegisterNUICallback("module:close",function(data, cb)
    SetNuiFocus(false,false);
		cb("ok")
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if bandagem then

			if GetEntityHealth(PlayerPedId()) > 150 then
				tempoBandagem = 0
				bandagem = false
				TriggerEvent("Notify","negado","<b>[BANDAGEM]</b> acabou a bandagem..", 5000)
			end

			if bandagem then
				tempoBandagem = tempoBandagem - 1
				
				if tempoBandagem <= 0 then
					tempoBandagem = 0
					bandagem = false
					TriggerEvent("Notify","negado","<b>[BANDAGEM]</b> acabou a bandagem..", 5000)
				end

				if oldHealth > GetEntityHealth(PlayerPedId()) and bandagem then
					tempoBandagem = 0
					bandagem = false
					TriggerEvent("Notify","negado","<b>[BANDAGEM]</b> Você sofreu algum dano.", 5000)
				end

				if GetEntityHealth(PlayerPedId()) <= 101 and bandagem then
					tempoBandagem = 0
					bandagem = false
					TriggerEvent("Notify","negado","<b>[BANDAGEM]</b> Você morreu.", 5000)
				end

				if GetEntityHealth(PlayerPedId()) > 101 and bandagem and GetEntityHealth(PlayerPedId()) < 150 then
					SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 2)
				end
				
				if GetEntityHealth(PlayerPedId()) >= 150 and bandagem then
					tempoBandagem = 0
					bandagem = false
					SetEntityHealth(PlayerPedId(), 150)
					TriggerEvent("Notify","negado","<b>[BANDAGEM]</b> acabou a bandagem..", 5000)
				end
			end
		end
		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = 5000
		if bandagem then
			oldHealth = GetEntityHealth(PlayerPedId())
		end
		Citizen.Wait(time)
	end
end)

RegisterNetEvent("cloneplates")
AddEventHandler("cloneplates", function(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    if vehicle and DoesEntityExist(vehicle) then
        SetVehicleNumberPlateText(vehicle,plate)
    end
end)

RegisterKeyMapping("module:close", "closenui", "keyboard", "ESCAPE")
RegisterCommand("module:close", function()
	TriggerEvent("module:closeInv")
end)