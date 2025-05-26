local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface(GetCurrentResourceName())

inMenu = true
local Menu = true
local player = PlayerPedId()

local arsenal = {
	{-1105.22,-821.69,14.27}, --civil---liberdo rd
	{-2382.42,3298.7,37.69}, --EXESITO ok
	{ -1665.2,170.91,61.81 }, --PMERJ ok 
}

if Menu then
	Citizen.CreateThread(function()
	while true do
		Wait(0)
		for _,lugares in pairs(arsenal) do
			local x,y,z = table.unpack(lugares)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),x,y,z,true)
			DrawMarker(22,x,y+0.01,z-0.20,0,0,0,0,180.0,170.0,1.0,1.0,1.0,25,25,122,100,1,0,0,0)
			if distance <= 2 then
				if IsControlJustPressed(0, 51) then
					TriggerServerEvent('egzinn-arsenal:permissao')
				end
			end
		end
	end
		if IsControlJustPressed(1, 3) then
		  inMenu = false
		  SetNuiFocus(false)
		  SendNUIMessage({type = 'close'})
		end
	end)
end

RegisterNetEvent('egzinn-arsenal:permissao')
AddEventHandler('egzinn-arsenal:permissao',function()
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
end)

RegisterNUICallback('NUIFocusOff', function()
  inMenu = false
  SetNuiFocus(false)
  SendNUIMessage({type = 'closeAll'})
end)

-- callbacks das armas --

RegisterNUICallback('kit-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_NIGHTSTICK"] = {
			ammo = 200
		},
		["WEAPON_STUNGUN"] = {
			ammo = 200
		},
	}
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),1,0,0)
--	GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),1,0,0)
	TriggerEvent("Notify","sucesso","Você equipou o kit básico.")
end)

RegisterNUICallback('colete-egzinn6', function()
	TriggerServerEvent('egzinn-arsenal:colete')
	TriggerEvent("Notify","sucesso","Você equipou um colete.")
end)

RegisterNUICallback('teaser-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_STUNGUN"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_STUNGUN"),1,0,0)
	TriggerEvent("Notify","sucesso","Você equipou um taser.")
end)

RegisterNUICallback('lanterna-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_FLASHLIGHT"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
--	GiveWeaponToPed(ped,GetHashKey("WEAPON_FLASHLIGHT"),1,0,1)  
	TriggerEvent("Notify","sucesso","Você equipou uma lanterna.")
end)

RegisterNUICallback('cacetete-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_NIGHTSTICK"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_NIGHTSTICK"),1,0,1)
	TriggerEvent("Notify","sucesso","Você equipou um cacetete.")
end)

RegisterNUICallback('glock-egzinn6', function()
	local ped = PlayerPedId()	
	local weapons = {
		["WEAPON_COMBATPISTOL"] = {
			ammo = 200
		}
	}
	
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),100,0,1)
	TriggerEvent("Notify","sucesso","Você equipou uma glock.")
end)

RegisterNUICallback('micro-smg-egzinn6', function()---------------testando nova arma policia nao deu bom 
	local ped = PlayerPedId()	
	local weapons = {
		["WEAPON_MICROSMG"] = {
			ammo = 200
		}
	}
	
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPISTOL"),100,0,1)
	TriggerEvent("Notify","sucesso","Você equipou uma glock.")
end)

RegisterNUICallback('carbinerifle-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_CARBINERIFLE"] = {-----------------m4
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_CARBINERIFLE"),200,0,1)
	TriggerEvent("Notify","sucesso","Você equipou uma carbine rifle.")
end)

RegisterNUICallback('pdw-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_COMBATPDW"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_COMBATPDW"),200,0,1)
	TriggerEvent("Notify","sucesso","Você equipou uma pdw.")
end)

RegisterNUICallback('ak47-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_SPECIALCARBINE"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_SPECIALCARBINE"),200,0,1) 
	TriggerEvent("Notify","sucesso","Você equipou uma parafal.")
end)

RegisterNUICallback('ak47-egzinn6', function()---teste 
	local ped = PlayerPedId()
	local weapons = {
		[" WEAPON_MICROSMG"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	GiveWeaponToPed(ped,GetHashKey("WEAPON_MICROSMG"),200,0,1) 
	TriggerEvent("Notify","sucesso","Você equipou uma parafal.")
end)--estas vido duas armas de uam vez  uma  sub e uma pistola 



RegisterNUICallback('mp5-egzinn6', function()
	local ped = PlayerPedId()
	local weapons = {
		["WEAPON_SMG"] = {
			ammo = 200
		}
	}
	vRP.giveWeapons(weapons, false)
	--GiveWeaponToPed(ped,GetHashKey("WEAPON_SMG"),200,0,1)
	TriggerEvent("Notify","sucesso","Você equipou uma mp5.")
end)

RegisterNUICallback('celular-egzinn6', function()
	vSERVER.giveItem('celular')
	TriggerEvent("Notify","sucesso","Você equipou um celular.")
end)

RegisterNUICallback('energetico-egzinn6', function()
	vSERVER.giveItem('energetico')
	TriggerEvent("Notify","sucesso","Você equipou um celular.")
end)

RegisterNUICallback('radio-egzinn6', function()
	vSERVER.giveItem('radio')
	TriggerEvent("Notify","sucesso","Você equipou um radio.")
end)

RegisterNUICallback('limpar-armas-egzinn6', function()
	local ped = PlayerPedId()
	RemoveAllPedWeapons(ped,true)
	TriggerEvent("Notify","sucesso","Você guardou todos os equipamentos no arsenal.")
end)



































