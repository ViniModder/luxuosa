Citizen.CreateThread(function()
    while vars.settings == nil do Citizen.Wait(50) end
    while true do
        local sleep = 2000
        local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))
		local rx,ry,rz,rh = table.unpack(vars.settings.explosive_races_start_point)
		local rd = Vdist(rx,ry,rz,px,py,pz) 
		if rd <= 25 then 
			sleep = 3 
			if not vars.in_race then
				local _,rcdz = GetGroundZFor_3dCoord(rx,ry,rz)
				
				DrawMarker(4,rx,ry,rcdz+1,0,0,0,0,0,0,2.0,1.0,2.0,87,0,247,100,0,0,0,true)
				DrawMarker(27,rx,ry,rcdz+0.1,0,0,0,0,0,0,6.0,6.0,6.0,87,0,247,100,0,0,0,false)
			end
		end
		if rd <= 20 then
			if IsControlJustPressed(0,38) and not vars.in_race then
				TriggerEvent("snt_races/open_explosive_menu")
			end
		end
        Citizen.Wait(sleep)
    end
end)

local race_point = -1
local race_points = {}
local race_time = -1
local last_checkpoint = -1
local map_blip = nil

RegisterNetEvent("snt_races/start_racing")
AddEventHandler("snt_races/start_racing",function(points,time)
	race_points = points
	race_time = time
	race_point = 1
	last_checkpoint = -1
	vars.in_race = true
	start_race_time_thread()
	start_race_thread()
	start_race_police_warning_thread()
end)

function start_race_thread()
	Citizen.Wait(400)
	create_checkpoint(1)
	TriggerEvent("snt_races/nui/update_checkpoint",1,#race_points)
	local _,cdz = GetGroundZFor_3dCoord(race_points[1][1],race_points[1][2],race_points[1][3])
	TriggerEvent("snt_races/checkpoint/create_flare",race_points[1][1],race_points[1][2],cdz)
	Citizen.CreateThread(function()
		while vars.in_race do
			local ped = PlayerPedId()
			local vehicle = GetVehiclePedIsUsing(ped)
			if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
				local x,y,z = table.unpack(GetEntityCoords(ped))
				local _,cdz = GetGroundZFor_3dCoord(race_points[race_point][1],race_points[race_point][2],race_points[race_point][3])
				local d = GetDistanceBetweenCoords(race_points[race_point][1],race_points[race_point][2],cdz,x,y,z,true)
				if d <= 120 then
					TriggerEvent("snt_races/checkpoint/create_flare",race_point,race_points[race_point][1],race_points[race_point][2],cdz)
				end
				if d <= 15.1 then
					update_checkpoint()
				end
			else
				if DoesBlipExist(map_blip) then 
					RemoveBlip(map_blip)
				end
				TriggerEvent("snt_races/finished_racing",false)
				vars.in_race = false
			end
			Citizen.Wait(0)
		end
	end)
end

function start_race_police_warning_thread()
	Citizen.CreateThread(function()
		while vars.in_race do
			Citizen.Wait(4500)
			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			TriggerServerEvent("snt_races/rpolice/create_racer_blip",x,y,z)
		end
	end)
end

function start_race_time_thread()
	Citizen.CreateThread(function()
		while vars.in_race do
			Citizen.Wait(1000)
			race_time = race_time - 1
			if race_time <= 0 then
				if DoesBlipExist(map_blip) then 
					RemoveBlip(map_blip)
				end
				StartScreenEffect("DeathFailMPIn",10000,true)
				Citizen.SetTimeout(10000,function()
					StopScreenEffect("DeathFailMPIn")
				end)
				TriggerEvent("snt_races/finished_racing",false)
				vars.in_race = false
			end
			TriggerEvent("snt_races/nui/update_time",race_time)
		end
	end)
end

function update_checkpoint()
	if race_point >= #race_points then
		if DoesBlipExist(map_blip) then 
			RemoveBlip(map_blip)
		end
		TriggerEvent("snt_races/finished_racing",true,race_time)
		vars.in_race = false
		PlaySoundFrontend(-1,"ROUND_ENDING_STINGER_CUSTOM","CELEBRATION_SOUNDSET",false)
		StartScreenEffect("MP_Celeb_Lose_Out",5000,true)
		Citizen.SetTimeout(5000,function()
			StopScreenEffect("MP_Celeb_Lose_Out")
		end)
	else
		TriggerEvent("snt_races/checkpoint/remove_flare")
		PlaySoundFrontend(-1,"RACE_PLACED","HUD_AWARDS",false)
		race_point = race_point + 1
		create_checkpoint(race_point)
		TriggerEvent("snt_races/nui/update_checkpoint",race_point,#race_points)	
		StartScreenEffect("FocusOut",2000,true)
		Citizen.SetTimeout(2000,function()
			StopScreenEffect("FocusOut")
		end)
	end
end

function create_checkpoint(cp)
	if last_checkpoint ~= cp then
		if DoesBlipExist(map_blip) then 
			RemoveBlip(map_blip)
		end
		last_checkpoint = cp
		map_blip = AddBlipForCoord(race_points[cp][1],race_points[cp][2],race_points[cp][3])
		SetBlipSprite(map_blip,38)
		SetBlipColour(map_blip,1)
		SetBlipScale(map_blip,0.6)
		SetBlipAsShortRange(map_blip,false)
		SetBlipRoute(map_blip,true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("# Corrida Ilegal | Checkpoint")
		EndTextCommandSetBlipName(map_blip)
	end
end

RegisterNetEvent("snt_races/police/create_racer_blip")
AddEventHandler("snt_races/police/create_racer_blip",function(x,y,z)
	local racer_blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(racer_blip,161)
	SetBlipColour(racer_blip,1)
	SetBlipScale(racer_blip,0.45)
	SetBlipAsShortRange(racer_blip,false)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("# QRU | Corredor Ilegal")
	EndTextCommandSetBlipName(racer_blip)
	Citizen.SetTimeout(5000,function()
		RemoveBlip(racer_blip)
	end)
end)


RegisterNetEvent("snt_races/police/notify_race_start")
AddEventHandler("snt_races/police/notify_race_start",function()
	TriggerEvent("Maralto/playSound","gevent",0.5)
	TriggerEvent("Notify","importante","Corrida ilegal iniciada. Fique de olho no GPS, o satélite da policia irá identificar a localização dos corredores em breve!",15000)
end)