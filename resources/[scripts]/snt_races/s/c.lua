vars = {
	in_race = false,
	rp = -1,
	particle_1 = nil,
	particle_2 = nil,
	particle_3 = nil,
	settings = nil
}

Citizen.CreateThread(function()
	TriggerServerEvent("snt_races/srequest/get_config")
end)

RegisterNetEvent("snt_races/sresponse/get_config")
AddEventHandler("snt_races/sresponse/get_config",function(c)
	vars.settings = c
end)

RegisterNetEvent("snt_races/open_explosive_menu")
AddEventHandler("snt_races/open_explosive_menu",function()
	if vars.in_race then return end
	if not IsPedInAnyVehicle(PlayerPedId()) then return end
	TriggerServerEvent("snt_races/srequest/get_races_info")
end)

RegisterNetEvent("snt_races/sresponse/get_races_info")
AddEventHandler("snt_races/sresponse/get_races_info",function(t)
	if type(t) ~= "table" then return end
	SendNUIMessage({ action = "show_explosive_menu", races_info = t })
	Citizen.Wait(320)
	SetNuiFocus(true,true)
end)

RegisterNetEvent("snt_races/sresponse/start_race")
AddEventHandler("snt_races/sresponse/start_race",function(p,t)
	if rt == -1 then return end
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "close_menu" })
	Citizen.Wait(600)
	TriggerEvent("snt_races/start_racing",p,t)
	TriggerEvent("snt_races/nui/race_info",true)
end)

RegisterNUICallback("UIRequest", function(d,cb)
    local a = d.action
	if d.action == "close_menu" then
		SetNuiFocus(false,false)
	end
	if d.action == "start_race" then
		if not IsPedInAnyVehicle(PlayerPedId()) then return end
		TriggerServerEvent("snt_races/srequest/start_race",d.race_name)
	end
end)

RegisterNetEvent("snt_races/finished_racing")
AddEventHandler("snt_races/finished_racing",function(f,rt)
	TriggerEvent("snt_races/nui/race_info",false)
	TriggerEvent("snt_races/checkpoint/remove_flare")
	
	TriggerServerEvent("snt_races/stats/finished_racing",f,rt)
	
	if not f then
		if vars.settings.races_explosion then
			SendNUIMessage({ action = "play_sound", a = "ohno", b = "0.6" })
			Citizen.Wait(vars.settings.race_explosion_after_time*1000)
			local veh = GetPlayersLastVehicle()
			Citizen.InvokeNative(0xE3AD2BDBAEE269AC,GetEntityCoords(veh),8,1.0,true,false,false)
			ExplodeVehicle(veh,true,false,false)
			NetworkRequestControlOfEntity(veh)
			SetEntityHealth(veh,0)
			SetVehicleBodyHealth(veh,0)
			SetVehicleEngineHealth(veh,0)
		end
	end
end)

RegisterNetEvent("snt_races/nui/update_checkpoint")
AddEventHandler("snt_races/nui/update_checkpoint",function(a,b)
	SendNUIMessage({ action = "update_race_checkpoint", c = a.." / "..b })
end)

RegisterNetEvent("snt_races/nui/update_time")
AddEventHandler("snt_races/nui/update_time",function(rt)
	SendNUIMessage({ action = "update_race_time", t = rt })
end)

RegisterNetEvent("snt_races/checkpoint/remove_flare")
AddEventHandler("snt_races/checkpoint/remove_flare",function()
	StopParticleFxLooped(vars.particle_1,false)
	StopParticleFxLooped(vars.particle_2,false)
	StopParticleFxLooped(vars.particle_3,false)
end)

RegisterNetEvent("snt_races/checkpoint/create_flare")
AddEventHandler("snt_races/checkpoint/create_flare",function(rp,x,y,z)  
	if vars.rp == rp then return end
	vars.rp = rp
	if vars.particle_1 then StopParticleFxLooped(vars.particle_1,false) end
	if vars.particle_2 then StopParticleFxLooped(vars.particle_2,false) end
	if vars.particle_3 then StopParticleFxLooped(vars.particle_3,false) end
	RequestNamedPtfxAsset("core")
	while not HasNamedPtfxAssetLoaded("core") do
		Citizen.Wait(0)
	end
	UseParticleFxAssetNextCall("core")
	vars.particle_1 = StartParticleFxLoopedAtCoord("proj_flare_trail",x,y,z, 0.0, 0.0, 0.0, 2.0, false, false, false)
	SetParticleFxLoopedColour(vars.particle_1,0,255,0,0)
	UseParticleFxAssetNextCall("core")
	vars.particle_2 = StartParticleFxLoopedAtCoord("proj_flare_fuse_fp",x,y,z, 0.0, 0.0, 0.0, 2.0, false, false, false)
	SetParticleFxLoopedColour(vars.particle_2,0,255,0,0)
	UseParticleFxAssetNextCall("core")
	vars.particle_3 = StartParticleFxLoopedAtCoord("exp_grd_flare",x,y,z, 0.0, 0.0, 0.0, 2.0, false, false, false)
	SetParticleFxLoopedColour(vars.particle_3,0,255,0,0)
end)

RegisterNetEvent("snt_races/nui/race_info")
AddEventHandler("snt_races/nui/race_info",function(b)
	SendNUIMessage({ action = "show_race_info", b = b })
end)
