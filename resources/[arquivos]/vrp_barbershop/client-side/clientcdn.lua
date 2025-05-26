-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_barbershop",cRP)
vSERVER = Tunnel.getInterface("vrp_barbershop")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = -1
local myClothes = {}
local myOldClothes = {}
local canStartTread = false
local canUpdate = false
local currentCharacterMode = { fathersID = 0, mothersID = 0, skinColor = 0, shapeMix = 0.0, eyesColor = 0, eyebrowsHeight = 0, eyebrowsWidth = 0, noseWidth = 0, noseHeight = 0, noseLength = 0, noseBridge = 0, noseTip = 0, noseShift = 0, cheekboneHeight = 0, cheekboneWidth = 0, cheeksWidth = 0, lips = 0, jawWidth = 0, jawHeight = 0, chinLength = 0, chinPosition = 0, chinWidth = 0, chinShape = 0, neckWidth = 0, hairModel = 4, firstHairColor = 0, secondHairColor = 0, eyebrowsModel = 0, eyebrowsColor = 0, beardModel = -1, beardColor = 0, chestModel = -1, chestColor = 0, blushModel = -1, blushColor = 0, lipstickModel = -1, lipstickColor = 0, blemishesModel = -1, ageingModel = -1, complexionModel = -1, sundamageModel = -1, frecklesModel = -1, makeupModel = -1 }
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
-----------------------------------------------------------------------------------------------------------------------------------------
function f(n)
	n = n + 0.00000
	return n
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCHAR
-----------------------------------------------------------------------------------------------------------------------------------------
custom = currentCharacterMode
cRP.setCharacter = function(data)
	if data then 
		custom = data
		canStartTread = true
		canUpdate = true
	end
end

RegisterNetEvent("barbershop:setCustom",function(data)
	custom = data
	canStartTread = true
	canUpdate = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkin",function(data)
	myClothes = {}
	myClothes = { tonumber(data.hairModel), tonumber(data.firstHairColor), tonumber(data.secondHairColor), tonumber(data.makeupModel), tonumber(data.makeupintensity), tonumber(data.makeupcolor), tonumber(data.lipstickModel), tonumber(data.lipstickintensity), tonumber(data.lipstickColor), tonumber(data.eyebrowsModel), tonumber(data.eyebrowintensity), tonumber(data.eyebrowsColor), tonumber(data.beardModel), tonumber(data.beardintentisy), tonumber(data.beardColor), tonumber(data.blushModel), tonumber(data.blushintentisy), tonumber(data.blushColor), tonumber(data.eyesColor), tonumber(data.chestModel), tonumber(data.chestColor) }
	
	custom.lipstickModel = tonumber(data.lipstickModel)
	custom.lipstickColor = tonumber(data.lipstickColor)
	custom.hairModel = tonumber(data.hairModel)
	custom.firstHairColor = tonumber(data.firstHairColor)
	custom.secondHairColor = tonumber(data.secondHairColor)
	custom.chestModel = tonumber(data.chestModel)
	custom.chestColor = tonumber(data.chestColor)
	custom.blushModel = tonumber(data.blushModel)
	custom.blushColor = tonumber(data.blushColor)
	custom.makeupModel = tonumber(data.makeupModel)
	custom.makeupcolor = tonumber(data.makeupcolor)
	custom.eyebrowsModel = tonumber(data.eyebrowsModel)
	custom.eyebrowsColor = tonumber(data.eyebrowsColor)
	custom.beardModel = tonumber(data.beardModel)
	custom.beardColor = tonumber(data.beardColor)
	custom.eyesColor = tonumber(data.eyesColor)

	if data.value then
		SetNuiFocus(false)
		displayBarbershop(false)
		vSERVER.updateSkin(custom)
		SendNUIMessage({ openBarbershop = false })
		myOldClothes = {}
	end

	cRP.defaultCustom(myClothes)
end)

RegisterNetEvent('vrp_barbershop:setcustom')
AddEventHandler('vrp_barbershop:setcustom',function(data)
	for k,v in pairs(data)  do 
		custom[k] = v
	end
	TaskUpdateSkinOptions()
	TaskUpdateFaceOptions()
	TaskUpdateHeadOptions(true)
end)

cRP.updateFacial = function(data)
	if data then 
		custom = data 
		canUpdate = true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATELEFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotate",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "left" then
		SetEntityHeading(ped,heading+10)
	elseif data == "right" then
		SetEntityHeading(ped,heading-10)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SET CAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("setCam",function(data,cb)
	local ped = PlayerPedId()
	if data.cam == 'head' then 
		local x,y,z = table.unpack(GetEntityCoords(ped))
		SetCamCoord(cam,x+0.2,y+0.5,z+0.7)
	elseif data.cam == 'chest' then
		local x,y,z = table.unpack(GetEntityCoords(ped))
		SetCamCoord(cam,x+0.2,y+0.7,z+0.35)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISABLECAM
-----------------------------------------------------------------------------------------------------------------------------------------
function disableCam()
	RenderScriptCams(false,true,250,1,0)
	if DoesCamExist(cam) then 
		DestroyCam(cam,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSENUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeNui",function()
	SetNuiFocus(false, false)
	displayBarbershop(false)
	SendNUIMessage({ openBarbershop = false })
	cRP.resetCustom(myOldClothes)
	canUpdate = true
	myOldClothes = {}
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPLAYBARBERSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function displayBarbershop(enable)
	local ped = PlayerPedId()
	if enable then
		SetNuiFocus(true,true)
		SendNUIMessage({ openBarbershop = true,  eyesColor = tonumber(custom.eyesColor), hairModel =  tonumber(custom.hairModel), firstHairColor =  tonumber(custom.firstHairColor), secondHairColor =  tonumber(custom.secondHairColor), makeupModel =  tonumber(custom.makeupModel), makeupintensity = 10, makeupcolor = tonumber(custom.makeupcolor), lipstickModel =  tonumber(custom.lipstickModel), lipstickintensity = 10, lipstickColor =  tonumber(custom.lipstickColor), eyebrowsModel =  tonumber(custom.eyebrowsModel), eyebrowintensity = 10, eyebrowsColor =  tonumber(custom.eyebrowsColor), beardModel =  tonumber(custom.beardModel), beardintentisy = 10, beardColor =  tonumber(custom.beardColor), blushModel =  tonumber(custom.blushModel), blushintentisy = 10, blushColor = tonumber(custom.blushColor), chestModel = tonumber(custom.chestModel), chestColor = tonumber(custom.chestColor)
	})
	myOldClothes = {
		eyesColor = tonumber(custom.eyesColor), hairModel =  tonumber(custom.hairModel), firstHairColor =  tonumber(custom.firstHairColor),secondHairColor =  tonumber(custom.secondHairColor),makeupModel =  tonumber(custom.makeupModel),makeupintensity = 10,makeupcolor = tonumber(custom.makeupcolor),lipstickModel =  tonumber(custom.lipstickModel),lipstickintensity = 10,lipstickColor =  tonumber(custom.lipstickColor),eyebrowsModel =  tonumber(custom.eyebrowsModel),eyebrowintensity = 10,eyebrowsColor =  tonumber(custom.eyebrowsColor),beardModel =  tonumber(custom.beardModel),beardintentisy = 10,beardColor =  tonumber(custom.beardColor),blushModel =  tonumber(custom.blushModel),blushintentisy = 10,blushColor = tonumber(custom.blushColor), chestModel = tonumber(custom.chestModel), chestColor = tonumber(custom.chestColor)
	}
	canUpdate = false

	FreezeEntityPosition(ped,true)
	if IsDisabledControlJustReleased(0,24) or IsDisabledControlJustReleased(0,142) then
		SendNUIMessage({ type = "click" })
	end

	SetPlayerInvincible(ped,false)  --mqcu

	if not DoesCamExist(cam) then
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamCoord(cam,GetEntityCoords(ped))
		SetCamRot(cam,0.0,0.0,0.0)
		SetCamActive(cam,true)
		RenderScriptCams(true,false,0,true,true)
		SetCamCoord(cam,GetEntityCoords(ped))
	end

	local x,y,z = table.unpack(GetEntityCoords(ped))
	SetCamCoord(cam,x+0.2,y+0.5,z+0.7)
	SetCamRot(cam,0.0,0.0,150.0)
	else
		FreezeEntityPosition(ped,false)
		SetPlayerInvincible(ped,false)
		RenderScriptCams(false,false,0,1,0)
		DestroyCam(cam,false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP.defaultCustom = function(status)
	myClothes = {}
	myClothes = { status[1], status[2], status[3], status[4], status[5], status[6], status[7], status[8], status[9], status[10], status[11], status[12], status[13], status[14], status[15], status[16], status[17], status[18] }

	local ped = PlayerPedId()
	SetPedComponentVariation(ped,2,status[1],0,2)
	SetPedHairColor(ped,status[2],status[3])

	SetPedHeadOverlay(ped,4,status[4],0.99)
	SetPedHeadOverlayColor(ped,4,1,status[6],status[6])

	SetPedHeadOverlay(ped,8,status[7],0.99)
	SetPedHeadOverlayColor(ped,8,1,status[9],status[9])

	SetPedHeadOverlay(ped,2,status[10],0.99)
	SetPedHeadOverlayColor(ped,2,1,status[12],status[12])

	SetPedHeadOverlay(ped,1,status[13],0.99)
	SetPedHeadOverlayColor(ped,1,1,status[15],status[15])

	SetPedHeadOverlay(ped,5,status[16],0.99)
	SetPedHeadOverlayColor(ped,5,1,status[18],status[18])

	SetPedHeadOverlay(ped, 10, status[20], 0.99)
	SetPedHeadOverlayColor(ped, 10, 1, status[21], status[21]) 

	SetPedEyeColor(ped, parseInt(status[19]))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESET CUSTOM
-----------------------------------------------------------------------------------------------------------------------------------------
cRP.resetCustom = function(status)
	if status then 
		custom.lipstickModel = tonumber(status.lipstickModel)
		custom.lipstickColor = tonumber(status.lipstickColor)
		custom.hairModel = tonumber(status.hairModel)
		custom.firstHairColor = tonumber(status.firstHairColor)
		custom.secondHairColor = tonumber(status.secondHairColor)
		custom.blushModel = tonumber(status.blushModel)
		custom.blushColor = tonumber(status.blushColor)
		custom.makeupModel = tonumber(status.makeupModel)
		custom.eyebrowsModel = tonumber(status.eyebrowsModel)
		custom.eyebrowsColor = tonumber(status.eyebrowsColor)
		custom.beardModel = tonumber(status.beardModel)
		custom.beardColor = tonumber(status.beardColor)
		custom.chestModel = tonumber(status.chestModel)
		custom.chestColor = tonumber(status.chestColor)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATIONS
-----------------------------------------------------------------------------------------------------------------------------------------
local locations = {
   {-1661.6,169.86,61.81},---pmerj
    {-813.15, -182.26, 37.56},--BARBEARIA 1
    {-816.61, -184.23, 37.56},--BARBEARIA 1 
    {139.24, -1706.7, 29.28},--BARBEARIA 2
    {137.03, -1709.1, 29.28},--BARBEARIA 2
    {-1280.22, -1117.96, 6.99},--BARBEARIA 3
    {-1283.47, -1117.99, 6.99},--BARBEARIA 3
    {1932.7, 3730.05, 32.84},--BARBEARIA 4
    {1931.13, 3732.74, 32.84},--BARBEARIA 4
    {1211.49, -473.32, 66.2},--BARBEARIA 5
    {1214.46, -474.09, 66.2},--BARBEARIA 5
    {-34.47, -154.45, 57.07},--BARBEARIA 6
    {-33.33, -151.51, 57.07},--BARBEARIA 6
    {-277.09, 6226.01, 31.69},--BARBEARIA 7
    {-279.24, 6228.19, 31.69},--BARBEARIA 7
	{-842.13,-2153.74,106.71},--mansao tk 
	{-1187.56,-1816.77,4.63},--SPAWN
	{-1187.35,-1819.37,4.63},--SPAWN
	{-1187.15,-1822.03,4.63},--SPAWN
	{-1186.98,-1824.19,4.63},--SPAWN
	{-1197.67,-1824.71,4.63},--SPAWN
	{-1197.91,-1822.36,4.63},--SPAWN
	{-1198.15,-1820.03,4.63},--SPAWN
	{-1198.33,-1817.64,4.63},--SPAWN

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)
	SendNUIMessage({ openBarbershop = false })

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(locations) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 2.5 then
					timeDistance = 4
					DrawText3D(v[1],v[2],v[3],"~b~E~w~ -  BARBEARIA")
					if IsControlJustPressed(1,38) then
						displayBarbershop(true)
						SetEntityHeading(ped,332.21)
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 400
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD SYNC PED
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if canStartTread then
	
			while not IsPedModel(PlayerPedId(),"mp_m_freemode_01") and not IsPedModel(PlayerPedId(),"mp_f_freemode_01") or LocalPlayer.state.charCreate do
				Citizen.Wait(10)
			end
			if custom then
				TaskUpdateSkinOptions()
				TaskUpdateFaceOptions()
				TaskUpdateHeadOptions(canUpdate)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNC BODY
-----------------------------------------------------------------------------------------------------------------------------------------
function TaskUpdateSkinOptions(ped)
	local data = custom
	SetPedHeadBlendData(ped or PlayerPedId(), parseInt(data.fathersID), parseInt(data.mothersID), 0, parseInt(data.skinColor), 0, 0, f(data.shapeMix), 0, 0, false)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNC FACE
-----------------------------------------------------------------------------------------------------------------------------------------
function TaskUpdateFaceOptions(_ped)
	local ped  = _ped or PlayerPedId()
	local data = custom

	-- Olhos
	SetPedEyeColor(ped, parseInt(data.eyesColor))
	-- Sobrancelha
	SetPedFaceFeature(ped, 6, f(data.eyebrowsHeight))
	SetPedFaceFeature(ped, 7, f(data.eyebrowsWidth))
	-- Nariz
	SetPedFaceFeature(ped, 0, f(data.noseWidth))
	SetPedFaceFeature(ped, 1, f(data.noseHeight))
	SetPedFaceFeature(ped, 2, f(data.noseLength))
	SetPedFaceFeature(ped, 3, f(data.noseBridge))
	SetPedFaceFeature(ped, 4, f(data.noseTip))
	SetPedFaceFeature(ped, 5, f(data.noseShift))
	-- Bochechas
	SetPedFaceFeature(ped, 8, f(data.cheekboneHeight))
	SetPedFaceFeature(ped, 9, f(data.cheekboneWidth))
	SetPedFaceFeature(ped, 10, f(data.cheeksWidth))
	-- Boca/Mandibula
	SetPedFaceFeature(ped, 12, f(data.lips))
	SetPedFaceFeature(ped, 13, f(data.jawWidth))
	SetPedFaceFeature(ped, 14, f(data.jawHeight))
	-- Queixo
	SetPedFaceFeature(ped, 15, f(data.chinLength))
	SetPedFaceFeature(ped, 16, f(data.chinPosition))
	SetPedFaceFeature(ped, 17, f(data.chinWidth))
	SetPedFaceFeature(ped, 18, f(data.chinShape))
	-- Pescoço
	SetPedFaceFeature(ped, 19, f(data.neckWidth))

end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNC HEAD
-----------------------------------------------------------------------------------------------------------------------------------------

function TaskUpdateHeadOptions(canUpdate)
	local ped  = PlayerPedId()
	local data = custom 

	if canUpdate then 
		-- Cabelo
		-- Sobracelha 
		SetPedHeadOverlay(ped, 2, parseInt(data.eyebrowsModel), 0.99)
		SetPedHeadOverlayColor(ped, 2, 1, parseInt(data.eyebrowsColor), parseInt(data.eyebrowsColor) )

		SetPedComponentVariation(ped, 2, tonumber(data.hairModel), 0, 0)
		SetPedHairColor(ped, tonumber(data.firstHairColor), tonumber(data.secondHairColor))

		-- Barba
		SetPedHeadOverlay(ped, 1, parseInt(data.beardModel), 0.99)
		SetPedHeadOverlayColor(ped, 1, 1, parseInt(data.beardColor), parseInt(data.beardColor) )
		-- Pelo Corporal
		SetPedHeadOverlay(ped, 10, parseInt(data.chestModel), 0.99)
		SetPedHeadOverlayColor(ped, 10, 1, parseInt(data.chestColor), parseInt(data.chestColor) )
		
		-- Blush
		SetPedHeadOverlay(ped,5,data.blushModel,0.99)
		SetPedHeadOverlayColor(ped,5,1,data.blushColor,data.blushColor)
		
		-- Battom
		SetPedHeadOverlay(ped, 8, parseInt(data.lipstickModel), 0.99)
		SetPedHeadOverlayColor(ped, 8, 2, parseInt(data.lipstickColor), parseInt(data.lipstickColor) )
		-- Manchas
		SetPedHeadOverlay(ped, 0, parseInt(data.blemishesModel), 0.99)
		SetPedHeadOverlayColor(ped, 0, 0, 0, 0)
		-- Envelhecimento
		SetPedHeadOverlay(ped, 3, parseInt(data.ageingModel), 0.99)
		SetPedHeadOverlayColor(ped, 3, 0, 0, 0)
		-- Aspecto
		SetPedHeadOverlay(ped, 6, parseInt(data.complexionModel), 0.99)
		SetPedHeadOverlayColor(ped, 6, 0, 0, 0)
		-- Pele
		SetPedHeadOverlay(ped, 7, parseInt(data.sundamageModel), 0.99)
		SetPedHeadOverlayColor(ped, 7, 0, 0, 0)
		-- Sardas
		SetPedHeadOverlay(ped, 9, parseInt(data.frecklesModel), 0.99)
		SetPedHeadOverlayColor(ped, 9, 0, 0, 0)
		-- Maquiagem
		SetPedHeadOverlay(ped, 4, parseInt(data.makeupModel), 0.99)
		SetPedHeadOverlayColor(ped,4,1,data.makeupcolor,data.makeupcolor)

	--
	end
end