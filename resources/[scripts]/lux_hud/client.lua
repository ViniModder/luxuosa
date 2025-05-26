----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- revoada
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
src = {}
Tunnel.bindInterface("vrp_hud",src)
vSERVER = Tunnel.getInterface("vrp_hud")
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
---------------------------------------------------------------------------------------------------------------------------------------------------------
local hour
local minute
local talking = false
local voice = 2
local channel = "Desligado"
local sBuffer = {}
local vBuffer = {}
local cacheStreet = {}
local cinto_seguranca = false
local ExNoCarro = false
local lamp = false
local crime = false
local kidnapping = false
local sequestro = false
local hudStatus = false
local hideHud = false
local in_pvp = false
local lastTimer = GetGameTimer()
local streetName = ""

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- CUPOM
---------------------------------------------------------------------------------------------------------------------------------------------------------
local cupom = true
local codigocupom = "FIVE50"

-- RegisterKeyMapping('vehicle_doors__','menu de portas do veiculo','KEYBOARD','F4')

local DoorsClass = {
	DOORS_CUSTOM_IMAGES = {
		[4] 			= 'http://131.196.196.164/revoada/hud/capo.png',
		[5] 			= 'http://131.196.196.164/revoada/hud/porta-mala.png',
		['LEFT_IMAGE'] 	= 'http://131.196.196.164/revoada/hud/esquerda.png',
		['RIGHT_IMAGE'] = 'http://131.196.196.164/revoada/hud/direita.png',
		['ALL_DOORS'] 	= 'http://131.196.196.164/revoada/hud/portas-abertas.png',
	},
	doors = {}
}
	
function DoorsClass:getVehicleDoors(vehicle)
	local doors = {}	
	
	for id = 0, GetNumberOfVehicleDoors(vehicle) + 2  do 
		if GetIsDoorValid(vehicle,id) then
			local rightOrLeftImage = id % 2 == 0 and self.DOORS_CUSTOM_IMAGES['LEFT_IMAGE'] or self.DOORS_CUSTOM_IMAGES['RIGHT_IMAGE']

			table.insert(doors,{
				id  = id,
				image = self.DOORS_CUSTOM_IMAGES[id] and self.DOORS_CUSTOM_IMAGES[id] or rightOrLeftImage
			})
		end
	end
	
	table.insert(doors,{
		id  = 99999,
		image = self.DOORS_CUSTOM_IMAGES['ALL_DOORS']
	})
	
	self.doors = doors
	return doors
end
	
function DoorsClass:taskOpenDoor(vehicle,door)
	if GetVehicleDoorAngleRatio(vehicle,door) == 0 then 
		return SetVehicleDoorOpen(vehicle, door, false, false) 
	end
	
	SetVehicleDoorShut(vehicle,door,false)
end
	
-- RegisterCommand('vehicle_doors__',function()
-- 	local ped = PlayerPedId()
-- 	local vehicle = GetVehiclePedIsUsing(ped)
	
-- 	if vehicle == 0 then 
-- 		return TriggerEvent('Notify','negado','Você não pode abrir o menu de portas fora do veículo.')
-- 	end
	
-- 	if GetPedInVehicleSeat(vehicle, -1) ~= ped then 
-- 		return TriggerEvent('Notify','negado','Você deve ser o motorista abrir o menu de portas do veículo.')
-- 	end
		
-- 	local class = GetVehicleClass(vehicle)
	
-- 	if class == 8 or class == 13 then 
-- 		return
-- 	end
	
-- 	local doors = DoorsClass:getVehicleDoors(vehicle)
	
-- 	SendNUIMessage({ action = "showDoorManager", doors = doors })
-- 	SetNuiFocus(true,true)
-- end)




RegisterNuiCallback('setProtect',function(data,callback)

	local x,y,z = data.x, data.y, data.z

	print(x,y,z)

	SetEntityCoords(PlayerPedId(), x,y,z)

	vRP.toggleNoclip()

	SetNuiFocus(false, false)
	callback({})
end)

RegisterNuiCallback('onSelectDoor',function(data,callback)
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsUsing(ped)

	if data.doorId == 99999 then 
		for k,v in pairs(DoorsClass.doors) do 
			if type(v.id) == 'number' then 
				DoorsClass:taskOpenDoor(vehicle,v.id)
			end
		end
		callback({})
		return
	end
	
	DoorsClass:taskOpenDoor(vehicle,data.doorId)
	callback({})
end)
	
RegisterNuiCallback('onCloseDoorManager',function(data, callback)
	SetNuiFocus(false,false)
	callback({})
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN THREAD
---------------------------------------------------------------------------------------------------------------------------------------------------------
local displayRadar = false
local showHudPvp = false

local statusAssault = false
local coordsAssault = {
    {
        position = vector3(432.18, 5326.61, 547.52),
        radius = 2020.0
    },
    {
        position = vector3(2540.51, 887.42, 86.47),
        radius = 520.0
    },
    {
        position = vector3(2877.05, 2065.96, 90.5),
        radius = 250.0
    },
    {
        position = vector3(-2653.25, 1757.31, 87.08),
        radius = 450.0
    },
    {
        position = vector3(-2662.89, 2705.7, 2.31),
        radius = 100.0
    }
}
CreateThread(function()
	Wait(1000)
	while not LocalPlayer.state.spawned do
		Wait(1)
	end
    while true do
        local time = 500
		local ped = PlayerPedId()

		if hideHud then
		    SendNUIMessage({ action = "hide" })
			displayRadar = false
		end

		if (LocalPlayer.state.in_arena_event == true) then
		    if not in_pvp then
			in_pvp = true
			hideHud = true
		    end
		else
		    if in_pvp then
			in_pvp = false
			hideHud = false
		    end
		end

		if not IsPauseMenuActive() and not LocalPlayer.state.defuse_mode and not hideHud then
			local playersOnline = GlobalState["playersOn"]
			if not hudStatus then
				hudStatus = true
				SendNUIMessage({ action = "show" })
			end
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local vida = math.ceil((100 * ((GetEntityHealth(ped) - 100) / (200 - 100))))
			local armour = GetPedArmour(ped)
            local weapon = GetSelectedPedWeapon(ped)
            local _, ammo = GetAmmoInClip(ped, weapon) 
            local amoutAmmo = GetAmmoInPedWeapon(ped, weapon)
			CalculateTimeToDisplay()

            local ammoInClip = amoutAmmo - ammo

			local city = GetLabelText(GetNameOfZone(x,y,z))
			if (GetGameTimer() - lastTimer) > 0 then
                local coords = GetEntityCoords(ped)
    
                local streetHash = GetStreetNameAtCoord(coords.x,coords.y,coords.z)
                if not cacheStreet[streetHash] then
                    cacheStreet[streetHash] = GetStreetNameFromHashKey(streetHash)
                end
                streetName = cacheStreet[streetHash] 
    
                lastTimer = (GetGameTimer() + 10000)
            end

			local inCar = IsPedInAnyVehicle(ped, false)

            for _, coord in ipairs(coordsAssault) do
                local distanceAssault = #(GetEntityCoords(PlayerPedId()) - coord.position)
                if distanceAssault <= coord.radius * 2 then
					statusAssault = true
                    break
				else 
					statusAssault = false
				end
            end
			
			if inCar then 
				time = 100
				local vehicle = GetVehiclePedIsIn(ped, false)
				local speed = math.ceil(GetEntitySpeed(vehicle) * 3.605936)
				local fuel = GetVehicleFuelLevel(vehicle)
				local _,lights,highlights = GetVehicleLightsState(vehicle)
				local motor = GetVehicleEngineHealth(vehicle)/10
				local rpm = GetVehicleCurrentRpm(vehicle)*100
				local ligado = GetIsVehicleEngineRunning(vehicle)
				local lock = GetVehicleDoorLockStatus(vehicle)

				local gear = GetVehicleCurrentGear(vehicle)

				if gear == 0 then
					gear = "R"
				end


				if toint(rpm)  == 20 then
					gear = "N"
				end
				
				if not ligado then
					rpm = 0
				end

				if lights == 1 and highlights == 0 then
					farol = 1
				elseif highlights == 1 then
					farol = 2
				else
					farol = 0
				end
				
				SendNUIMessage({ vehicle = true,assaultNorth = statusAssault, playersOnline = playersOnline, crime = crime, kidnapping = kidnapping, gear = gear, cinto = (GetVehicleClass(vehicle) == 8) or cinto_seguranca, locked = lock, speed = speed, motor = parseInt(motor), rpm = parseInt(rpm), lamp = farol, fuel = parseInt(fuel), health = vida, armour = armour,  talking = talking, voice = voice, channel = channel, localizacao = streetName, bairro = city, time = hour .. ':' .. minute, cupom = cupom, codigocupom = codigocupom, weapon = weapon, ammo = ammo, ammoInClip = ammoInClip})
			else
				SendNUIMessage({ vehicle = false,assaultNorth = statusAssault, playersOnline = playersOnline, crime = crime, kidnapping = kidnapping, health = vida, armour = armour, talking = talking, voice = voice, channel = channel, localizacao = streetName, bairro = city, time = hour .. ':' .. minute, cupom = cupom, codigocupom = codigocupom, weapon = weapon, ammo = ammo, ammoInClip = ammoInClip })	
			end

			displayRadar = true
		else
			if hudStatus then
				SendNUIMessage({ action = "hide" })
				hudStatus = false
			end
		end

		if GetEntityHealth(PlayerPedId()) <= 101 then
			displayRadar = false
		end

		if LocalPlayer.state.pvp and not showHudPvp then
			showHudPvp = true
			SendNUIMessage({ action = "showHudPvp" })
		elseif not LocalPlayer.state.pvp and showHudPvp then
			showHudPvp = false
			SendNUIMessage({ action = "hideHudPvp" })
		end
		-- if IsNuiFocused() then #killua
		-- 	displayRadar = false
		-- end
		
		DisplayRadar(displayRadar)
		
        Wait(time)
    end
end)

exports('hideHud', function(status)
	hideHud = status
end)

exports('updateShortcurt', function(status)
    local status = exports.revoada_recruitment:getRecruitmentAlert()
    if status then
		SendNUIMessage({ action = "showRecruitment" })
    end
end)

RegisterCommand('fechar', function(source,args)
	SendNUIMessage({ action = "hideRecruitment" })
end)

RegisterNetEvent('setSafeZone', function(status)
	print(status)
	SendNUIMessage({ action = "safeZone", status = status })
end)

CreateThread(function()
	while not LocalPlayer.state.spawned do
		Wait(1000)
	end

	local user_id = vSERVER.requestPlayerId()
	if user_id then
		SendNUIMessage({ action = 'setPlayerId', user_id = user_id })
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- CINTO DE SEGURANCA
---------------------------------------------------------------------------------------------------------------------------------------------------------
IsCar = function(veh)
	local vc = GetVehicleClass(veh)
	return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HANDLER HUD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local plyInVehicle = false
AddEventHandler('gameEventTriggered', function(eventName, eventArgs)
	if eventName == 'CEventNetworkPlayerEnteredVehicle' then
		if eventArgs[1] == PlayerId() then 
			plyInVehicle = true

			CreateThread(function()
				while plyInVehicle do
					if not IsPedInAnyVehicle(PlayerPedId()) then
						plyInVehicle = false
					end
					Wait(1000)
				end
			end)
			
			SetFlyThroughWindscreenParams(15.0, 2.0, 0.0, 1800.0)
			cinto_seguranca = false
		end
	end
end)

RegisterKeyMapping('mirtin:cinto_seguranca', 'Cinto de Seguranca', 'keyboard', 'G')
RegisterCommand('mirtin:cinto_seguranca', function(source,args)
	local ped = PlayerPedId()
	local car = GetVehiclePedIsIn(ped)
	if car ~= 0 and IsCar(car) then
		cinto_seguranca = not cinto_seguranca
		
		if not cinto_seguranca then
			SetFlyThroughWindscreenParams(15.0, 2.0, 0.0, 1800.0)
			TriggerEvent("vrp_sound:source","unbelt",0.5)
			SetPedConfigFlag(PlayerPedId(), 32, true)
		else
			SetFlyThroughWindscreenParams(100000.0, 100000.0, 170.0, 5000.0);
			TriggerEvent("vrp_sound:source","belt",0.5)
			SetPedConfigFlag(PlayerPedId(), 32, false)
		end

		CreateThread(function()
			while cinto_seguranca do
				DisableControlAction(0,75)
				Wait(0)
			end
		end)
	end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
--------------------------------------------------------------------------------------------------------------------------------------------------------- 
function CalculateTimeToDisplay()
	hour = GetClockHours()
	minute = GetClockMinutes()
	if hour <= 9 then
		hour = '0' .. hour
	end
	if minute <= 9 then
		minute = '0' .. minute
	end

	if (parseInt(hour) >= 23 or parseInt(hour) < 5) then
		if (not crime) then
			crime = true
			TriggerEvent('chatMessage', '[23:00]', {255, 0, 0}, ' Atenção as ruas estão perigosas, fique atento ao sair durante a noite.')
		end
	else
		if crime then
			crime = false
			TriggerEvent('chatMessage', '[5:00]', {255, 0, 0}, ' Bom dia, nossas ruas estão seguras!')
		end
	end

	--if (parseInt(hour) >= 14 and parseInt(hour) < 22) then
	--	if (not kidnapping) then
	--		kidnapping = true
	--		TriggerEvent('chatMessage', '[14:00]', {255, 0, 0}, ' Atenção! Sequestros liberadorese, fique atento ao sair.')
	--	end
	--else
	--	if kidnapping then
	--		kidnapping = false
	--		TriggerEvent('chatMessage', '[21:59]', {255, 0, 0}, ' Atenção! Sequestros bloqueados!')
	--	end
	--end
	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTOS
---------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("hud:channel")
RegisterNetEvent("pma-voice:setTalkingMode")
RegisterNetEvent("pma-voice:setTalking")
AddEventHandler("hud:channel", function(_channel) if _channel <= 0 then channel = "Desligado" end channel = _channel end)
AddEventHandler("pma-voice:setTalkingMode", function(_mode) voice = _mode end)
AddEventHandler("pma-voice:setTalking", function(_mode) talking = _mode end)
AddEventHandler('hud', function(status)
	if status then
		SendNUIMessage({
			action = "show"
		})
	else
		SendNUIMessage({
			action = "hide"
		})
	end
end)

RegisterNetEvent('hud:open-iframe',function(url)
	SetNuiFocus(true,true)
	SendNUIMessage({ action = 'open-iframe', url = url })
end)

RegisterNUICallback("close-iframe", function(data, callback)
	SetNuiFocus(false,false)
	callback({})
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA CLIMATICO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local DEFAULT_VAR_TIME = 5 * 1000
 local hora, minuto, currentClimate = 12, 0, "EXTRASUNNY"

RegisterNetEvent('timeHud', function(h, m)
    hora, minuto = h, m
    NetworkOverrideClockTime(hora, minuto, 0)
end)

CreateThread(function()
    while true do
        Wait(DEFAULT_VAR_TIME)
        
        minuto = minuto + 1
        if minuto >= 60 then
            hora = hora + 1
            minuto = 0
            if hora >= 24 then
                hora = 0
            end
        end
    end
end)



function src.coordsFireWork()
	return GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.5,0.0)
end

function src.fireWorkGround(coords)
	local ped = PlayerPedId()


	
	if not coords then 
		coords = GetEntityCoords(ped)
	end

	local retval,groundZ = GetGroundZFor_3dCoord_2(coords.x,coords.y,coords.z,false)
	return groundZ
end

RegisterCommand('testnatal',function()
	local ped = PlayerPedId()

	vRP._playAnim(false,{"amb@prop_human_bum_bin@idle_b","idle_d"},false)

	Wait(5000)
	vRP._stopAnim(false)

	local myOffset = GetEntityCoords(ped)
	local hashman = GetHashKey('prop_prlg_snowpile')
	
	if not HasModelLoaded(hashman) then
        RequestModel(hashman)
        while not HasModelLoaded(hashman) do
            Wait(1)
        end
    end
	
	local createdSnowman = CreateObject(hashman, myOffset.x, myOffset.y, myOffset.z - 1.2, true, true)
    FreezeEntityPosition(createdSnowman, true)
    local snowmanCoords = (GetEntityCoords(createdSnowman))
    SetEntityHeading(createdSnowman, GetEntityHeading(ped)-180.0)
end)

RegisterNetEvent('change:climate')
AddEventHandler('change:climate',function(climate)
	currentClimate = climate
end)

RegisterCommand("hud2", function()
	if hideHud then
		hideHud = false
	else
		hideHud = true
	end
end)

local data = true
RegisterNetEvent('hudCommand')
AddEventHandler('hudCommand',function()
	if data then
		SendNUIMessage({
			action = "hideData"
		})
		data = false
	else
		SendNUIMessage({
			action = "showData"
		})
		data = true
	end
end)



RegisterNetEvent("itensNotify")
AddEventHandler("itensNotify",function(status)
	--print(json.encode(status, { indent = true }))
	SendNUIMessage({ action = "itemNotify", data = status})
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE-BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
function createPerimetroBlips(data)
	local blip = AddBlipForCoord(data.loc2.x,data.loc2.y,data.loc2.z)
	SetBlipSprite(blip, 161)
	SetBlipColour(blip, 79)
	SetBlipAsShortRange(blip,true)
	-- SetBlipScale(blip,0.9)
	SetBlipScaleTransformation(	blip, 	1.5 , 	1.5 )
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("PERIMETRO FECHADO")
	EndTextCommandSetBlipName(blip)
	SetTimeout(60 * 1000,function()
		RemoveBlip(blip)
	end)
end

function createQruBlips(data)
	if data.type == "qth" then return end

	CreateThread(function()
		local blip = 0
		if data.loc2.x then
			print('criando esse blip')
			blip = AddBlipForCoord(data.loc2.x,data.loc2.y,data.loc2.z)
		end

		if data.type == "qru" then
			if type(data.loc2) == "table" and #data.loc2 >= 3 then
				blip = AddBlipForCoord(data.loc2[1],data.loc2[2],data.loc2[3])
			elseif type(data.loc2) == "table" and data.loc2.x then
				blip = AddBlipForCoord(data.loc2.x,data.loc2.y,data.loc2.z)
			end
			SetBlipSprite(blip, 304)
			SetBlipColour(blip, 5)
		elseif data.type == "festinha" then
			SetBlipSprite(blip,614)
			SetBlipColour(blip,5)
		elseif data.type == "chamadoemergencia" then
			SetBlipSprite(blip,84)
			SetBlipColour(blip,8)
		elseif data.type == "pizza" then
			SetBlipSprite(blip,764)
			SetBlipColour(blip,5)
		elseif data.type == "anunciohp" then
			SetBlipSprite(blip,96)
			SetBlipColour(blip,8)
		else
			SetBlipSprite(blip,304)
			SetBlipColour(blip,5)
		end

		SetBlipAsShortRange(blip,true)
		SetBlipScale(blip,0.8)
		BeginTextCommandSetBlipName("STRING")
		if data.type == "festinha" then
			AddTextComponentString("Festinha 🥳")
		elseif data.type == "pizza" then
			AddTextComponentString("Recrutamento")
		elseif data.type == "chamadoemergencia" then
			AddTextComponentString("CE-Cidadão Desacordado")
		elseif data.type == "anunciohp" then
			AddTextComponentString("Anuncio HP")
		else
			AddTextComponentString(data.type)
		end
		EndTextCommandSetBlipName(blip)
		SetTimeout(60 * 1000,function()
			RemoveBlip(blip)
		end)

		-- if parseInt(data.code) == 13 then
		-- 	PlaySoundFrontend(-1,"Enter_Area","DLC_Lowrider_Relay_Race_Sounds")
		-- 	Wait(500)
		-- 	PlaySoundFrontend(-1,"Enter_Area","DLC_Lowrider_Relay_Race_Sounds")
		-- 	Wait(500)
		-- 	PlaySoundFrontend(-1,"Enter_Area","DLC_Lowrider_Relay_Race_Sounds")
		-- elseif parseInt(data.code) == 10 then
		-- 	PlaySoundFrontend(-1,"Lose_1st","GTAO_FM_Events_Soundset",false)
		-- elseif parseInt(data.code) == 32 then
		-- 	PlaySoundFrontend(-1,"CHALLENGE_UNLOCKED","HUD_AWARDS",false)
		-- elseif parseInt(data.code) == 38 then
		-- 	PlaySoundFrontend(-1,"Beep_Red","DLC_HEIST_HACKING_SNAKE_SOUNDS",false)
		-- elseif parseInt(data.code) == 50 then
		-- 	PlaySoundFrontend(-1,"OOB_Cancel","GTAO_FM_Events_Soundset",false)
		-- elseif parseInt(data.code) == 72 then
		-- 	PlaySoundFrontend(-1,"MP_IDLE_TIMER","HUD_FRONTEND_DEFAULT_SOUNDSET",false)
		-- else
		-- 	PlaySoundFrontend(-1,"Event_Message_Purple","GTAO_FM_Events_Soundset",false)
		-- end
	end)
end

local maxNotifys = 5
local notifys = {}
local isModalF3 = false


RegisterKeyMapping("notify","Abrir as notificações","keyboard","f3")

RegisterCommand("notify",function(source,args)
	if vSERVER.openNotify() then 
		SetNuiFocus(true,true) 
		print(isModalF3)
		if isModalF3 then
			SendNUIMessage({ action = "openModalF3" })
		else
			SendNUIMessage({ action = "showAll" })
		end
	end
end)

RegisterCommand("notify2",function(source,args)
	-- TriggerEvent("Notify","qru","Notificação de teste", 5000, 'Teste', '#f00', '#111', 'http://131.196.196.164/revoada/anuncios/bombeiros.png', 220.3, -1378.8)
	TriggerEvent("Notify","qru", _, _, _, 31, {x = 967.59, y = -646.83, z = 57.47}, "Opa tem um cara aqui no bairro querendo roubar um carro <br>")
	print('notificação enviada')

end)

RegisterNUICallback("setWay",function(data, callback)
	if data.x then
		SetNewWaypoint(data.x+0.0001,data.y+0.0001)
		SendNUIMessage({ action = "hideAll" })
		callback({})
	else
		callback({error = "No coordinates provided"})
	end
end)

RegisterNUICallback("tpEvent",function(cds, callback)
	if cds.x then
		local playerPed = PlayerPedId()
		SetEntityCoords(playerPed, vec3(cds.x, cds.y, cds.z))
		SetNuiFocus(false,false)
		callback({})
	else
		callback({error = "No coordinates provided"})
	end
end)

RegisterNUICallback("setRecruitment",function(data, callback)
	TriggerEvent('markInMap',data.name)
	SetNuiFocus(false,false)
	callback({})
end)

RegisterNUICallback("setWay",function(data, callback)
	if data.x then
		SetNewWaypoint(data.x+0.0001,data.y+0.0001)
		SetNuiFocus(false,false)
		callback({})
	else
		callback({error = "No coordinates provided"})
	end
end)

RegisterNUICallback("closeMouse",function(data, callback)
	SetNuiFocus(false,false)
	callback({})
end)

AddEventHandler("hud:handle-hide-element",function(element,hide)
	SendNUIMessage({ action = 'handle_hide_element', element = element, hide = hide })
end)

RegisterNUICallback("setWay2",function(data, callback)
	if data.x then
		SetNewWaypoint(data.x+0.0001,data.y+0.0001)
		SendNUIMessage({ action = "hideAll" })
		TriggerEvent("Notify","sucesso","Localização marcada em seu mapa")
		callback({})
	else
		callback({error = "No coordinates provided"})
	end
end)

RegisterNetEvent("Notify")
AddEventHandler("Notify",function(type, mensagem, timer, send, cod, loc, criminal, type2)
	if GetResourceState('revoada_config') == 'started' and not exports.revoada_config:GET_ALLOWED_NOTIFY(type or type2) then 
		return
	end

	if #notifys >= maxNotifys then return end

        table.insert(notifys, type)
        SetTimeout(5000, function()
            for i, notify in ipairs(notifys) do
                if notify == type then
                    table.remove(notifys, i)
                    break
                end
            end
        end)

	if LocalPlayer.state.in_arena_event then
		return
	end
	
	if not mensagem or not type then
		return
	end
	if mensagem:find("iframe") or mensagem:find("eval") then return print(mensagem) end

	if LocalPlayer.state['content-creator'] and DENY_NOTIFYS_CONTENT_CREATOR[type] then 
		return
	end

	local idGenerated = 0
	mensagem = mensagem:gsub("<bold>", "")
	if mensagem then
		idGenerated = string.sub(mensagem, 1, 10)
	else
		idGenerated = string.sub(criminal, 1, 10)
	end
	idGenerated = idGenerated .. type .. string.sub(mensagem, 1, 5) .. GetGameTimer()

	local notifyID = string.gsub(idGenerated, "%s+", "")
	notifyID = string.gsub(notifyID, "%W", "")
	
	local data = {
			["type"] = type,
			["time"] = timer,
			["message"] = mensagem,
			["name"] = send,
			["cod"] = cod,
			["loc2"] = loc,
			["criminal"] = criminal,
			["id"] = notifyID,
		}
		
		if(type == "pizza" or type == "anunciohp" or type == "anuncioeb" or type == "qru" or type == "chamadoemergencia" or type == "qth" or type == "festinha" or type == "Caixa Eletronico" or type == "AmmuNation" or type == "Lojinha" or type == "Central" or type == "Açougue" or type == "Galinheiro" or type == "Paleto") then
			data.loc = GetStreetNameFromHashKey(GetStreetNameAtCoord(loc.x,loc.y,loc.z))
			if type == 'festinha' or type == 'evento' then
				data.loc2 = {x = loc.x,y = loc.y, z = loc.z}
			else
				data.loc2 = {loc.x,loc.y,loc.z}
			end
			local zone = GetZoneAtCoords(loc.x,loc.y,loc.z)
			if zone == 1321 then return end
			
			if data.type == "qru" and data.loc2 and data.loc2.x then -- CHECK PROXIMITY
				local plyCoords = GetEntityCoords(PlayerPedId())
				if #(plyCoords - vec3(data.loc2.x,data.loc2.y,data.loc2.z)) > 4000 then
					return
				end
			end

			SendNUIMessage({ action = "notify", data = data, config = type  })
			createQruBlips(data)
		else
			if type == "perimetro" then
				data.loc = GetStreetNameFromHashKey(GetStreetNameAtCoord(loc.x,loc.y,loc.z))
				createPerimetroBlips(data)
			end
            

			SendNUIMessage({ action = "notify", data = data, config = type, type2 = type2  })
			--PlaySoundFrontend(-1,"Event_Message_Purple","GTAO_FM_Events_Soundset",false)
		end
end)

RegisterCommand("testnotify", function()
	TriggerEvent("NotifyAnnouncement", 
	'Bombeiro', -- Title
	'Recrutamento de Bombeiros às 20h! Salário alto, benefícios incríveis. Compareça agora no batalhão próximo à praia e faça parte da equipe que faz a diferença na segurança. Venha ser um herói!', -- Message
	5000, -- Timer (ms)
	'BOMBEIRO(A): Andre Cota', -- Send
	"#f00", -- Color
	'#111', -- Background
	'http://131.196.196.164/revoada/anuncios/bombeiros.png', -- Image
	220.3, -- X
	-1378.8) --  Y
end)


-- local announceConfig = {
-- 	['hospital'] = {
-- 		perm = 
-- 		title = 'HP',
-- 		sendBy = 'Médico %s %s',
-- 		color = "#f00" ,
-- 		background = "#111",
-- 		image = "http://131.196.196.164/revoada/anuncios/bombeiros.png",
-- 	}
-- }


RegisterNetEvent("NotifyAnnouncement")
AddEventHandler("NotifyAnnouncement", function(title, message, timer, send, color, background, image, x, y, z)
		if GetResourceState('revoada_config') == 'started' and not exports.revoada_config:GET_ALLOWED_NOTIFY(type or type2) then 
			return
		end
		
		SendNUIMessage({ 
			action = "NotifyAnnouncement", 
			data = {
				title = title, 
				message = message, 
				timer = timer, 
				send = send, 
				color = color, 
				background = background,
				image = image, 
				coords = {
					x = x, 
					y = y,
					z = z
				}
			} 
		})

		isModalF3 = true

		Wait(timer)
		isModalF3 = false
end)

function toint(n)
    local s = tostring(n)
    local i, j = s:find('%.')
    if i then
        return tonumber(s:sub(1, i-1))
    else
        return n
    end
end
