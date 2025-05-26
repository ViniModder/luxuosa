-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

cOgdealership = {}
Tunnel.bindInterface("bm_dealership",cOgdealership)
vSERVERdealership = Tunnel.getInterface("bm_dealership")

local spawn
local dealerOpen 
local currentVehicle
local vehicleList = {}
local allVehicles = {}
local rotation = 117.53

local function spawnVeh(model, pos, visible, isTest) 
	if spawn or DoesEntityExist(currentVehicle) then return end 
	local mhash = GetHashKey(model)
	if not HasModelLoaded(mhash) then 
		while not HasModelLoaded(mhash) do
			RequestModel(mhash)
			Citizen.Wait(10)
		end		
	end 
	spawn = true 
	local ped = PlayerPedId() 
	SetEntityCoords(ped, pos['x'],pos['y'],pos['z'])
	Wait(500)
	local nveh = CreateVehicle(mhash,pos['x'],pos['y'],pos['z'],pos['h'],true,false)
	NetworkRegisterEntityAsNetworked(nveh) 
	
	while not DoesEntityExist(nveh) do 
		Wait(1)
	end 
	
	SetPedIntoVehicle(ped,nveh,-1)
	SetEntityVisible(ped, visible)
	SetVehicleColours(nveh, 0, 2)
	SetVehicleOnGroundProperly(nveh)
	SetVehicleAsNoLongerNeeded(nveh)
	SetVehicleIsStolen(nveh,false)
	SetVehicleNeedsToBeHotwired(nveh,false)
	SetEntityInvincible(nveh,false)
	SetVehicleNumberPlateText(nveh,"TESTDRIVE")
	Citizen.InvokeNative(0xAD738C3085FE7E11,nveh,true,true)
	SetVehicleHasBeenOwnedByPlayer(nveh,true)
	SetVehRadioStation(nveh,"OFF")
	rotation = 117.53
	SetModelAsNoLongerNeeded(mhash) 
	currentVehicle = nveh
	if isTest then 
		testDriveStart()
		SetEntityVisible(ped, true)
	end
end

local function changeRotation(value)
	SetEntityRotation(currentVehicle, 0.0, 0.0, rotation,false, true)
end

local function removeVehicle()
	if DoesEntityExist(currentVehicle) then  
		while DoesEntityExist(currentVehicle) do
			DeleteVehicle(currentVehicle)
			Wait(0)
		end
		if not DoesEntityExist(currentVehicle) then
			currentVehicle = nil
			spawn = false
		end
	end
end

local function closeConce()
	local ped = tonumber(PlayerPedId())
	removeVehicle()
	dealerOpen = false
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "setVisible", data = false})
	spawn = false

	SetEntityCoords(ped, cfgconce.coords[1])
	vSERVERdealership._setRoutingBucket(false)
end

local function getVehicleMods()
	local veh = currentVehicle
	local myveh = {}
	local colors = {
		["cromado"] = {120},
		["metálico"] = {
			0, 147, 1, 11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 27, 28, 29, 150, 30, 31, 32, 33, 34, 
			143, 35, 135, 137, 136, 36, 38, 138, 99, 90, 88, 89, 91, 49, 50, 51, 52, 53, 54, 
			92, 141, 61, 62, 63, 64, 65, 66, 67, 68, 69, 73, 70, 74, 96, 101, 95, 94, 97,
			103, 104, 98, 100, 102, 99, 105, 106, 71, 72, 142, 145, 107, 111, 112
		},
		["fosco"] = {12,13,14,131,83,82,84,149,148,39,40,41,42,55,128,151,155,152,153,154},
		["metal"] = { 117,118,119,158,159 }
	}
	myveh.vehicle = veh
	myveh.model = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
	myveh.color =  table.pack(GetVehicleColours(veh))
	myveh.customPcolor = table.pack(GetVehicleCustomPrimaryColour(veh))
	myveh.customScolor = table.pack(GetVehicleCustomSecondaryColour(veh))
	myveh.extracolor = table.pack(GetVehicleExtraColours(veh))
	myveh.neon = true
	for i = 0, 3 do 
		if not IsVehicleNeonLightEnabled(veh,i) then 
			myveh.neon = false
			break 
		end 
	end 
	myveh.neoncolor = table.pack(GetVehicleNeonLightsColour(veh))
	myveh.xenoncolor = GetVehicleHeadlightsColour(veh)
	myveh.smokecolor = table.pack(GetVehicleTyreSmokeColor(veh))
	myveh.plateindex = GetVehicleNumberPlateTextIndex(veh)
	myveh.pcolortype = false
	myveh.scolortype = false
	for k,v in pairs(colors) do
		for i,j in pairs(v) do
			if myveh.pcolortype and myveh.scolortype then
				break
			end
			if j == myveh.color[1] then
				myveh.pcolortype = k
			end
			if j == myveh.color[2] then
				myveh.scolortype = k
			end
		end
	end
	myveh.mods = {}
	for i = 0, 48 do
		myveh.mods[i] = {mod = nil}
	end
	for i,t in pairs(myveh.mods) do 
		if i == 22 or i == 18 then
			if IsToggleModOn(veh,i) then
				t.mod = 1
			else
				t.mod = 0
			end
		elseif i == 23 or i == 24 then
			t.mod = GetVehicleMod(veh,i)
			t.variation = GetVehicleModVariation(veh, i)
		else
			t.mod = GetVehicleMod(veh,i)
		end
	end
	if GetVehicleWindowTint(veh) == -1 or GetVehicleWindowTint(veh) == 0 then
		myveh.windowtint = false
	else
		myveh.windowtint = GetVehicleWindowTint(veh)
	end
	if myveh.xenoncolor > 12 or myveh.xenoncolor < -1 then
		myveh.xenoncolor = -1
	end
	myveh.wheeltype = GetVehicleWheelType(veh)
	myveh.bulletProofTyres = GetVehicleTyresCanBurst(veh)
	myveh.damage = (1000 - GetVehicleBodyHealth(vehicle))/100
	return myveh
end

function _CreateCamera(plyCds)
	local ped = PlayerPedId()
	SetEntityCoords(ped, cfgconce.spawn-1, false, false, false, true)
	Wait(100)
	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
	SetCamActive(cam, true)
	RenderScriptCams(1, 1, 1000, 1, 1)
	SetCamCoord(cam,plyCds.x,plyCds.y,plyCds.z)
	SetCamFov(cam, 90.0)
	SetCamRot(cam, 10.0, 0.0, 45.0, true)
end

function testDriveStart()
	local time = cfgconce.tempoTest 
	local health = GetEntityHealth(PlayerPedId())
	
	SetNuiFocus(false,false)
	SendNUIMessage({ action = "setVisible", data = false})


	CreateThread(function()
		while true do
			local ped = PlayerPedId()
			local veh = GetVehiclePedIsIn(ped,false)
			if time <= 0 then 
				TriggerEvent("Notify", "carro", "Seu tempo de test drive acabou")
				SetEntityHealth(ped, health) 
				break
			end

			if (veh == 0 or not (veh == currentVehicle)) then
				TriggerEvent("Notify","carro","Seu Test Drive foi cancelado, pois você saiu do veículo.")
				SetEntityHealth(ped, health) 
				break
			end

			if time > 0 then 
				time = time - 1 
			end

			if time <= 10 then
				TriggerEvent("Notify", "carro", "Restam "..time.." segundos para acabar o test drive")

			end
			Wait(1000)
		end

		closeConce()
	end)
end
local drawInteraction = function()
    while true do

        local msec = 1000
        local ped = PlayerPedId()

        for _, data in pairs(cfgconce.coords) do
            local distance = #(GetEntityCoords(ped) - data)
            if distance <= 10 and not dealerOpen then
                msec = 4
                DrawMarker(36,data.x,data.y,data.z ,0,0,0,0.0,0,0,0.5,0.5,0.4,cfgconce.blip.r,cfgconce.blip.g,cfgconce.blip.b,cfgconce.blip.a,0,0,0,1)
                if distance <= 1.5 then
                    local isNotInRoyale = (GetResourceState('suricato_eventos') ~= 'started' or not exports.suricato_eventos:playingRoyale())
                    if IsControlJustPressed(0, 38) and isNotInRoyale then
                        dealerOpen = true
                        SetNuiFocus(true, true)
                        SendNUIMessage({action = 'setVisible', data = true})
                    end
                end
            end
        end
        Wait(msec)
    end
end
CreateThread(drawInteraction)


RegisterNUICallback("requestConce",function(data,cb)
	loadVehicles()
	cb({ tempo = cfgconce.tempoTest, priceTest = cfgconce.valueTest, veiculos = allVehicles })
end) 

RegisterNUICallback("requestMeus", function(data, cb) 
	local veh = vSERVERdealership.dealershipRequest('requestMyVehicles')
	local list = {}
	for k,v in pairs(veh) do 
		v.maxspeed =  GetVehicleModelEstimatedMaxSpeed(GetHashKey(k)) or 0
		v.acceleration = GetVehicleModelAcceleration(GetHashKey(k)) or 0
		v.agility = GetVehicleModelEstimatedAgility(GetHashKey(k)) or 0
		v.braking =  GetVehicleModelMaxBraking(GetHashKey(k)) or 0
		v.classType = GetVehicleClassType(GetHashKey(k)) 

		list[#list + 1] = v
	end
	cb({ veiculos = list })
end) 

RegisterNUICallback("selectVehicle",function(data,cb) 
	removeVehicle()
	cb("ok")
end)

RegisterNUICallback("rotLeft",function(data,cb) 
	rotation = rotation-7.5
	changeRotation(rotation)
	cb("ok")
end)

RegisterNUICallback("rotRight",function(data,cb) 
	rotation = rotation+7.5
	changeRotation(rotation)
	cb("ok")
end)

RegisterNUICallback("testeDrive", function(data, cb)
    vSERVERdealership._setRoutingBucket(true)
    removeVehicle()
    local cds = cfgconce.test
    SetEntityCoords(PlayerPedId(), cds.x, cds.y, cds.z)
    Wait(20)
    TriggerEvent("Notify", "sucesso", "Aguarde enquanto carregamos o veículo. Teste Driver iniciado com sucesso!", 8000)
    closeConce() 
    spawnVeh(data.name, cfgconce.test, true, true)
    vRP._DeletarObjeto()
    vRP._stopAnim(false)
    SendNUIMessage({ action = "test" })
    cb("ok")
end)

AddEventHandler("playerSpawned", function()
    TriggerEvent("closeConce")
end)




RegisterNUICallback("comprarVeh",function(data, cb)
	if delay then return cb(false) end 
	if not data.name then return cb(false) end
	delay = true

	local vehCustom = getVehicleMods()
	vehCustom.customPcolor = data.color
	
	SetTimeout(1000, function() 		
		local resp = vSERVERdealership.dealershipBuyVehicle(data.name, vehCustom) or {}
		if resp.status then 
			closeConce()
		end
		Wait(3 * 1000) 
		delay = false
	end) 
	
	cb(true)
end)

RegisterNUICallback("venderVeh",function(data, cb)
	if delay then return cb(false) end 
	if not data.name then return cb(false) end
	delay = true
	SetTimeout(1000, function() 
		local resp = vSERVERdealership.dealershipSellVehicle(data.name)
		if resp.status then 
			closeConce()
		end
		Wait(3 * 1000) 
		delay = false
	end)		 

	cb(true)
end)

RegisterNUICallback("close",function(data,cb)	
	closeConce()
	cb("ok")
end)

function GetVehicleClassType(vehicle)
	local list = { 
		[0] = "Compacts",
		[1] = "Sedans",
		[2] = "SUVs",
		[3] = "Coupes",
		[4] = "Muscle",
		[5] = "Sports Classics",
		[6] = "Sports",
		[7] = "Super",
		[8] = "Motorcycles",
		[9] = "Off-road",
		[10] = "Industrial",
		[11] = "Utility",
		[12] = "Vans",
		[13] = "Cycles",
		[14] = "Boats",
		[15] = "Helicopters",
		[16] = "Planes",
		[17] = "Service",
		[18] = "Emergency",
		[19] = "Military",
		[20] = "Commercial",
		[21] = "Trains"
	}  
	
	return list[GetVehicleClassFromName(vehicle)]
end

function cOgdealership.resetCache()
	allVehicles = {}
end

function loadVehicles()
	if next(allVehicles) then
		return true
	end

	for k,v in pairs(vSERVERdealership.dealershipRequest('requestList')) do 
		v.maxspeed =  GetVehicleModelEstimatedMaxSpeed(GetHashKey(k)) or 0
		v.acceleration = GetVehicleModelAcceleration(GetHashKey(k)) or 0
		v.agility = GetVehicleModelEstimatedAgility(GetHashKey(k)) or 0
		v.braking =  GetVehicleModelMaxBraking(GetHashKey(k)) or 0
		v.classType = GetVehicleClassType(GetHashKey(k)) 

		allVehicles[#allVehicles + 1] = v
	end
end

--- EXPOSIÇÃO DE CARROS

 local vehs = {  
	-- [1] = { ["model"] = "rmodskyline34", ["name"] = "rmodskyline34", ['x'] = -783.27, ['y'] = -223.59, ['z'] = 37.32, ["h"] = 127.66},
}              

Citizen.CreateThread(function()
    for i = 0,#vehs do
        if vehs[i] then
            local carmodel = GetHashKey(vehs[i].model)
            RequestModel(carmodel)

            while not HasModelLoaded(carmodel) do
                Wait(0)
            end

            vehicle = CreateVehicle(carmodel, vehs[i].x, vehs[i].y, vehs[i].z -1, vehs[i].h, false, false)
            SetVehicleNumberPlateText(vehicle,vRP.getRegistrationNumber())
            FreezeEntityPosition(vehicle, true)
            SetEntityInvincible(vehicle, true)
            SetVehicleDoorsLocked(vehicle, 2)
        end
    end
end)
