local enterCoords = nil
pedProperties = { 
	isPlaying = false,
	isCurrentPedAlive = nil, 
	isRolling = false,
	isMoving = false,
	statistics = {
		hits = 0,
		time = "0:00"
	},
	coords = {
		vec3(-3382.53,-2180.37,906.66),
		vec3(-3379.56,-2180.58,906.66),
		vec3(-3376.35,-2181.35,906.66),
		vec3(-3373.86,-2181.27,906.66),
		vec3(-3370.14,-2181.73,906.66),
		vec3(-3366.45,-2182.05,906.66),
		vec3(-3363.51,-2182.36,906.66),
		vec3(-3360.77,-2182.63,906.66),
		vec3(-3357.07,-2182.97,906.66),
		vec3(-3353.12,-2183.32,906.66),
		vec3(-3349.29,-2183.64,906.66),
		vec3(-3345.75,-2183.93,906.66),
		vec3(-3343.72,-2184.42,906.66),
		vec3(-3346.83,-2187.44,906.66),
		vec3(-3350.37,-2186.89,906.66),
		vec3(-3353.81,-2186.43,906.66),
		vec3(-3356.88,-2186.11,906.66),
		vec3(-3359.79,-2185.87,906.66),
		vec3(-3363.45,-2185.55,906.66),
		vec3(-3366.57,-2185.29,906.66),
		vec3(-3369.43,-2185.03,906.66),
		vec3(-3372.81,-2184.72,906.66),
		vec3(-3376.56,-2184.38,906.66),
		vec3(-3379.53,-2184.12,906.66),
		vec3(-3382.48,-2183.86,906.66),
		vec3(-3386.02,-2183.54,906.66),
		vec3(-3389.13,-2183.26,906.66),
		vec3(-3378.46,-2174.91,910.93),
	},
	animations = {
		"combatroll_bwd_p1_135", 
		"combatroll_bwd_p1_180", 
		"combatroll_bwd_p2_135", 
		"combatroll_fwd_p1_00", 
		"combatroll_fwd_p1_135", 
		"combatroll_fwd_p1_45", 
		"combatroll_fwd_p1_90"
	},
	resetAllStuff = function()
		pedProperties.statistics.time = "0:00"
		pedProperties.statistics.hits = 0
	end,
	playAnimation = function(ped,type)
		if type == "roll" then
			local animSelected = pedProperties.animations[math.random(#pedProperties.animations)]
	
			RequestAnimDict(animSelected)
			TaskPlayAnim(ped, "move_strafe@roll_fps", animSelected, 8.0, -8.0, -1, 0, 0, nil, nil, nil)
			Citizen.Wait(1200)
			pedProperties.isCurrentPedAlive = nil
			DeleteEntity(ped)
		elseif type == "move_and_roll" then
			local direction = math.random(2)
			if direction == 1 then SetEntityHeading(ped, 160.0) else SetEntityHeading(ped, 346.0) end
	
			RequestAnimDict("anim@heists@narcotics@trash")
			TaskPlayAnim(ped, "anim@heists@narcotics@trash", "run", 8.0, -8.0, -1, 0, 0, nil, nil, nil)
			Citizen.Wait(1200)

			local animSelected = pedProperties.animations[math.random(#pedProperties.animations)]
			RequestAnimDict(animSelected)
			TaskPlayAnim(ped, "move_strafe@roll_fps", animSelected, 8.0, -8.0, -1, 0, 0, nil, nil, nil)
			Citizen.Wait(1200)

			pedProperties.isCurrentPedAlive = nil
			DeleteEntity(ped)
		elseif type == "move" then
			local direction = math.random(2)
			if direction == 1 then SetEntityHeading(ped, 160.0) else SetEntityHeading(ped, 346.0) end
	
			RequestAnimDict("anim@heists@narcotics@trash")
			TaskPlayAnim(ped, "anim@heists@narcotics@trash", "run", 8.0, -8.0, -1, 0, 0, nil, nil, nil)
			Citizen.Wait(1200)
			pedProperties.isCurrentPedAlive = nil
			DeleteEntity(ped)
		end
	end,
	startPlayingThread = function()
		Citizen.CreateThread(function()
			while (pedProperties.isPlaying) do

				if pedProperties.isRolling then
					DrawTextInScreen("~r~[E] ~w~Para ligar/desativar o rolamento",0,0.3,0.93,0.3,255,255,255,255)
				else
					DrawTextInScreen("~g~[E] ~w~Para ligar/desativar o rolamento",0,0.3,0.93,0.3,255,255,255,255)
				end

				if pedProperties.isMoving then
					DrawTextInScreen("~r~[U] ~w~Para ligar/desativar a movimentação",0,0.5,0.93,0.3,255,255,255,255)
				else
					DrawTextInScreen("~g~[U] ~w~Para ligar/desativar a movimentação",0,0.5,0.93,0.3,255,255,255,255)
				end
				
				DrawTextInScreen("~b~[F] ~w~Sair",0,0.7,0.93,0.3,255,255,255,255)
				DrawRCT(0.005,0.957,0.16,0.035)
				DrawTXT("Tempo",0.01,0.959,false,0.45)
				DrawTXT(pedProperties.statistics.time,0.01,0.959,true,0.45)
				DrawRCT(0.005,0.92,0.16,0.035)
				DrawTXT("Pontuação",0.01,0.922,false,0.45)
				DrawTXT(pedProperties.statistics.hits.." kills",0.01,0.922,true,0.45)

				if IsControlJustPressed(0, 38) then
					pedProperties.isRolling = not pedProperties.isRolling
				elseif IsControlJustPressed(0,303) then
					pedProperties.isMoving = not pedProperties.isMoving
				elseif IsControlJustPressed(0,23) then
					pedProperties.isPlaying = false
					pedProperties.resetAllStuff()
					SetEntityCoordsNoOffset(PlayerPedId(), -401.1,1212.49,325.93, 0, 0, 1)
					TriggerServerEvent("Big-pvp:server:exitAimLab","npc")
				end
		
				Citizen.Wait(0)
			end
		end)
	end,
	startMonitoringThread = function()
		Citizen.CreateThread(function()
			while (pedProperties.isPlaying) do
				if pedProperties.isCurrentPedAlive then
					local ped = pedProperties.isCurrentPedAlive
					local pedHealth = GetEntityHealth(ped)
					if pedHealth == 0 and ped then
						DeleteEntity(ped)
						pedProperties.isCurrentPedAlive = nil
						pedProperties.spawnPed()
						pedProperties.statistics.hits = pedProperties.statistics.hits + 1
					end
				end

				local weapon = GetSelectedPedWeapon(PlayerPedId())
				local _, ammo = GetAmmoInClip(PlayerPedId(), weapon)
				local maxAmmo = GetMaxAmmoInClip(PlayerPedId(), weapon)
				if ammo < maxAmmo then
					SetAmmoInClip(PlayerPedId(), weapon, maxAmmo)
				end

				Citizen.Wait(500)
			end
		end)

		Citizen.CreateThread(function()
			local timer = 0
			while (pedProperties.isPlaying) do
				timer = timer + 1
				pedProperties.statistics.time = math.floor(timer/60)..":"..string.format("%02.f",math.floor(timer-math.floor(timer/60)*60))
				Citizen.Wait(1000)
			end
		end)
	end,
	spawnPed = function()
		Citizen.CreateThread(function()
			local coordSelected = pedProperties.coords[math.random(#pedProperties.coords)]
		
			while (not pedProperties.isCurrentPedAlive) do
				RequestModel(GetHashKey("cs_beverly"))
				while not HasModelLoaded(GetHashKey("cs_beverly")) do
					Citizen.Wait(100)
				end
		
				local ped = CreatePed(4, GetHashKey("cs_beverly"), coordSelected.x, coordSelected.y, coordSelected.z - 1, 170.43, false, true)
				pedProperties.isCurrentPedAlive = ped
				SetBlockingOfNonTemporaryEvents(ped, true)
	
				if pedProperties.isMoving and pedProperties.isRolling then
					Citizen.Wait(math.random(200,400))
					pedProperties.playAnimation(ped, "move_and_roll")
				elseif pedProperties.isRolling then
					Citizen.Wait(math.random(200,400))
					pedProperties.playAnimation(ped, "roll")
				elseif pedProperties.isMoving then
					Citizen.Wait(math.random(200,400))
					pedProperties.playAnimation(ped, "move")
				end
	
				Citizen.Wait(1000)
			end
		end)
	end
}

baloonProperties = {
	isPlaying = false,
	targets = {},
	statistics = {
		total = 0,
		hits = 0,
		time = "0:00"
	},
	currentArea = 2,
	currentTargets = 1,
	coords = {
		[2] = {
			vector3(-3327.073,-1944.426,906.84),
			vector3(-3327.073,-1944.426,908.62),
			vector3(-3328.92,-1943.56,906.84),
			vector3(-3328.92,-1943.56,908.62),
		},
		[3] = {
			vector3(-3328.0,-1944.04,908.62),
			vector3(-3328.0,-1944.04,906.84),
			vector3(-3328.0,-1944.04,910.33),
			vector3(-3326.532,-1944.716,906.84),
			vector3(-3326.532,-1944.716,908.62),
			vector3(-3326.532,-1944.716,910.33),
			vector3(-3329.603,-1943.293,906.84),
			vector3(-3329.603,-1943.293,908.62),
			vector3(-3329.603,-1943.293,910.33),
		},
		[4] = {
			vector3(-3327.073,-1944.426,906.84),
			vector3(-3327.073,-1944.426,908.62),
			vector3(-3328.92,-1943.56,906.84),
			vector3(-3328.92,-1943.56,908.62),
			vector3(-3330.734,-1942.731,906.84),
			vector3(-3330.734,-1942.731,908.62),
			vector3(-3325.202,-1945.302,906.84),
			vector3(-3325.202,-1945.302,908.62),
			vector3(-3325.202,-1945.302,910.4379),
			vector3(-3325.202,-1945.302,912.2179),
			vector3(-3327.073,-1944.426,910.4379),
			vector3(-3327.073,-1944.426,912.2179),
			vector3(-3328.92,-1943.56,912.2179),
			vector3(-3328.92,-1943.56,910.4379),
			vector3(-3330.734,-1942.731,910.4379),
			vector3(-3330.734,-1942.731,912.2179),
		},
		[5] = {
			vector3(-3328.0,-1944.04,908.62),
			vector3(-3328.0,-1944.04,906.84),
			vector3(-3328.0,-1944.04,910.33),
			vector3(-3328.0,-1944.04,913.76),
			vector3(-3328.0,-1944.04,912.05),
			vector3(-3326.532,-1944.716,906.84),
			vector3(-3326.532,-1944.716,908.62),
			vector3(-3326.532,-1944.716,910.33),
			vector3(-3329.603,-1943.293,906.84),
			vector3(-3329.603,-1943.293,908.62),
			vector3(-3329.603,-1943.293,910.33),
			vector3(-3324.896,-1945.485,906.8425),
			vector3(-3324.896,-1945.485,908.6179),
			vector3(-3324.896,-1945.485,910.3285),
			vector3(-3331.265,-1942.538,906.8425),
			vector3(-3331.265,-1942.538,908.6179),
			vector3(-3331.265,-1942.538,910.3286),
			vector3(-3324.896,-1945.485,913.7625),
			vector3(-3326.532,-1944.716,913.7625),
			vector3(-3329.603,-1943.293,913.7626),
			vector3(-3331.265,-1942.538,913.7626),
			vector3(-3331.265,-1942.538,912.0519),
			vector3(-3329.603,-1943.293,912.0519),
			vector3(-3326.532,-1944.716,912.0519),
			vector3(-3324.896,-1945.485,912.0519),
		},
	},
	resetAllStuff = function()
		baloonProperties.statistics.time = "0:00"
		baloonProperties.statistics.total = 0
		baloonProperties.statistics.hits = 0
		baloonProperties.targets = {}
		baloonProperties.currentArea = 2
		baloonProperties.currentTargets = 1
		baloonProperties.deleteAllObjects()
	end,
	createObject = function() 
		local currentTarget = nil
		while not currentTarget or baloonProperties.targets[currentTarget]  do
			local countCoordsByArea = #baloonProperties.coords[baloonProperties.currentArea]
			currentTarget = math.random(1,countCoordsByArea)
		end

		baloonProperties.targets[currentTarget] = CreateObjectNoOffset(-131025346,baloonProperties.coords[baloonProperties.currentArea][currentTarget],false,true,false)
		FreezeEntityPosition(baloonProperties.targets[currentTarget], true)
	end,
	deleteAllObjects = function()
		for _, target in pairs(baloonProperties.targets) do
			DeleteEntity(target)
		end
		baloonProperties.targets = {}
	end,
	reloadObjects = function()
		baloonProperties.deleteAllObjects()
		for i = 1, baloonProperties.currentTargets do
			baloonProperties.createObject()
		end
	end,
	startPlayingThread = function()
		Citizen.CreateThread(function()
			local temp = {}
			while (baloonProperties.isPlaying) do
				temp = baloonProperties.targets or {}
				for num, target in pairs(temp) do
					if DoesEntityExist(target) and GetEntityHealth(target) ~= 1000 then
						DeleteEntity(target)
						baloonProperties.createObject()
						baloonProperties.targets[num] = nil
						baloonProperties.statistics.hits = baloonProperties.statistics.hits + 1
					end
				end

				DrawTextInScreen("~b~[E] ~w~Alterar área ("..baloonProperties.currentArea.."x"..baloonProperties.currentArea.."/5x5)",0,0.3,0.93,0.3,255,255,255,255)
				DrawTextInScreen("~b~[U] ~w~Alternar quantidade ("..baloonProperties.currentTargets.."/3)",0,0.5,0.93,0.3,255,255,255,255)
				DrawTextInScreen("~b~[F] ~w~Sair",0,0.7,0.93,0.3,255,255,255,255)

				DrawRCT(0.005,0.957,0.16,0.035)
				DrawTXT("Tempo",0.01,0.959,false,0.45)
				DrawTXT(baloonProperties.statistics.time,0.01,0.959,true,0.45)
				DrawRCT(0.005,0.92,0.16,0.035)
				DrawTXT("Pontuação",0.01,0.922,false,0.45)
				DrawTXT(baloonProperties.statistics.hits.." de "..baloonProperties.statistics.total.." tiros ".. (baloonProperties.statistics.total > 0 and " ("..math.floor((baloonProperties.statistics.hits*100)/baloonProperties.statistics.total).."%)" or ""),0.01,0.922,true,0.45)

				if IsControlJustPressed(0, 38) then
					if baloonProperties.currentArea < 5 then 
						baloonProperties.currentArea = baloonProperties.currentArea + 1 
					else 
						baloonProperties.currentArea = 2 
						if baloonProperties.currentTargets == 4 then 
							baloonProperties.currentTargets = 3 
						end
					end
					baloonProperties.reloadObjects()
				elseif IsControlJustPressed(0,303) then
					if baloonProperties.currentTargets < 4 then 
						baloonProperties.currentTargets = baloonProperties.currentTargets + 1
						if baloonProperties.currentTargets == 4 and baloonProperties.currentArea == 2 then 
							baloonProperties.currentTargets = 1 
						end
					else 
						baloonProperties.currentTargets = 1 
					end
					baloonProperties.reloadObjects()
				elseif IsControlJustPressed(0,23) then
					baloonProperties.isPlaying = false
					baloonProperties.resetAllStuff()
					SetEntityCoordsNoOffset(PlayerPedId(), -401.1,1212.49,325.93, 0, 0, 1)
					TriggerServerEvent("Big-pvp:server:exitAimLab","baloon")
				end			

				Citizen.Wait(0)
			end
		end)
	end,
	startControllerThread = function()
		Citizen.CreateThread(function()
			while (baloonProperties.isPlaying) do
				local ped = PlayerPedId()
				local weapon = GetSelectedPedWeapon(ped)
				local _, ammo = GetAmmoInClip(ped, weapon)
				local maxAmmo = GetMaxAmmoInClip(ped, weapon)
				if ammo < maxAmmo then
					SetAmmoInClip(ped, weapon, maxAmmo)
				end

				Citizen.Wait(10)
			end
		end)

		Citizen.CreateThread(function()
			local timer = 0
			while (baloonProperties.isPlaying) do
				timer = timer + 1
				baloonProperties.statistics.time = math.floor(timer/60)..":"..string.format("%02.f",math.floor(timer-math.floor(timer/60)*60))
				Citizen.Wait(1000)
			end
		end)
	end
}

local function getWeapons(weapons)
	local player = PlayerPedId() 
	for k,v in pairs(weapons) do
		if k and v then
			return true
		end
	end

	return nil
end

AddEventHandler("CEventGunShot", function(entities, eventEntity, args)
	if baloonProperties.isPlaying then
		baloonProperties.statistics.total = baloonProperties.statistics.total + 1
	end
end)



RegisterNetEvent("Big-pvp:client:enterAimLab",function(type)
	local ped = PlayerPedId()
	if type == "npc" then
		DoScreenFadeOut(1000)
		while not IsScreenFadedOut() do
			Citizen.Wait(100)
		end

		SetEntityCoordsNoOffset(PlayerPedId(),-3366.72,-2198.81,906.66, 0, 0, 1)
		pedProperties.isPlaying = true
		pedProperties.spawnPed()
		Citizen.Wait(500)
		pedProperties.startPlayingThread()
		pedProperties.startMonitoringThread()
		TriggerServerEvent("Big-pvp:server:Enteraimlab","npc")
		Citizen.Wait(4000)

		DoScreenFadeIn(1000)
		FreezeEntityPosition(PlayerPedId(), false)

	elseif type == "baloon" or type == "balao" then
		DoScreenFadeOut(1000)
		while not IsScreenFadedOut() do
			Citizen.Wait(100)
		end

		SetEntityCoordsNoOffset(PlayerPedId(), -3335.12, -1958.99, 906.66, 0, 0, 1)
		SetEntityHeading(PlayerPedId(), 355.11)
		FreezeEntityPosition(PlayerPedId(), true)
		TriggerServerEvent("Big-pvp:server:Enteraimlab","baloon")
		while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
			Citizen.Wait(10) 
		end

		baloonProperties.isPlaying = true

		for i = 1, baloonProperties.currentTargets do
			baloonProperties.createObject()
		end

		baloonProperties.startPlayingThread()
		baloonProperties.startControllerThread()

		Citizen.Wait(4000)

		DoScreenFadeIn(1000)
		FreezeEntityPosition(PlayerPedId(), false)
	end
end)




function IsInAimLab()
	if pedProperties.isPlaying or baloonProperties.isPlaying then
		return true
	end
	return false
end

exports("IsInAimLab", IsInAimLab)

-- Some stuff
local Txt = { w3d = World3dToScreen2d, Font = SetTextFont, Proportional = SetTextProportional, Scale = SetTextScale, Colour = SetTextColour, Dropshadow = SetTextDropshadow, Edge = SetTextEdge, DropShadow = SetTextDropShadow, Outline = SetTextOutline, Justification = SetTextJustification, Entry = SetTextEntry, Centre = SetTextCentre, Wrap = SetTextWrap, ComponentString = AddTextComponentString, Draw = DrawText }

function DrawTXT(text,x,y,justification,scale,center)
	Txt.Font(4)
	Txt.Scale(scale,scale)
	Txt.Colour(255,255,255,230)
	Txt.Outline()
	if justification then 
	Txt.Justification(2)
	Txt.Wrap(0.03,0.16) end
	if center then
	Txt.Centre(1) end
	Txt.Entry("STRING")
	Txt.ComponentString(text)
	Txt.Draw(x,y)
end

function DrawRCT(x,y,width,height)
	DrawRect(x+width/2,y+height/2,width,height,0,161,255,100)
end

function table_includes(t, o)
	for k,v in pairs(t) do
		if v == o then
			return k
		end
	end
	return false
end




DrawText3Ds = function(x,y,z,text)
	SetDrawOrigin(x, y, z, 0);
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.25,0.25)
	SetTextColour(255,255,255,150)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end

DrawTextInScreen = function(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end