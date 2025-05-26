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
Tunnel.bindInterface(GetCurrentResourceName(),cRP)
vSERVER = Tunnel.getInterface(GetCurrentResourceName())

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = -1
local skinData = {}
local heading = 332.219879
local previousSkinData = {}
local customCamLocation = nil
local creatingCharacter = false
local oldData = {}
local custom = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINDATA
-----------------------------------------------------------------------------------------------------------------------------------------
local skinData = {
	["pants"] = { item = 0, texture = 0 },
	["arms"] = { item = 0, texture = 0 },
	["mochila"] = { item = 0, texture = 0 },
	["tshirt"] = { item = 1, texture = 0 },
	["torso"] = { item = 0, texture = 0 },
	["vest"] = { item = 0, texture = 0 },
	["shoes"] = { item = 0, texture = 0 },
	["mask"] = { item = 0, texture = 0 },
	["hat"] = { item = -1, texture = 0 },
	["glass"] = { item = 0, texture = 0 },
	["ear"] = { item = -1, texture = 0 },
	["watch"] = { item = -1, texture = 0 },
	["bracelet"] = { item = -1, texture = 0 },
	["accessory"] = { item = 0, texture = 0 },
	["decals"] = { item = 0, texture = 0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINDATA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_skinshop:skinData")
AddEventHandler("vrp_skinshop:skinData",function(status)
	if status ~= "clean" then
		skinData = status
		resetClothing(skinData)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCATESHOPS
-----------------------------------------------------------------------------------------------------------------------------------------
local locateShops = {
    {71.24, -1399.06, 29.37},--loja 10
    {74.11, -1399.12, 29.37},--loja 10
    {-714.72,-147.11,37.41},--loja 5
    {-710.57,-153.24,37.41},--loja 5
    {-162.72,-311.05,39.73},--loja 6
    {-162.9, -303.23, 39.73},--loja 6
    {429.76, -800.03, 29.49},--loja 8
    {427.07, -800.01, 29.49},--loja 8
    {-829.83, -1073.1, 11.32},--loja 9
    {-828.5, -1075.43, 11.32},--loja 9
    {-1188.17, -768.92, 17.32},--loja 3
    {-1458.4, -240.05, 49.79},--loja 4
    {-1456.03, -242.24, 49.81},--loja 4
    {10.37, 6515.75, 31.88},--loja 1
    {1697.32, 4829.52, 42.06},--loja 0
    {1694.51, 4829.17, 42.06},--loja 0
    {121.03, -225.82, 54.56},--loja 7
    {617.66, 2766.48, 42.09},--loja 12
    {1190.47, 2712.88, 38.22},--loja 11
    {-3175.41, 1041.99, 20.86},--loja 2
	{ -1581.62, 187.94, 59.31 },--PMERJ
	{ 4489.44,-4453.04,4.36 },----LOJA CAYO PERICO
	{4838.68,-4937.19,3.39},----LOJA cayo dentro palco
	{-1653.46,166.84,61.81},----LOJA POLICIA PMERJ TESTE 
	{-1098.56,-831.48,14.27},----LOJA civil 
	{-2405.09,3266.29,37.69},----LOJA EB
	{-2713.76,-62.96,21.74},----LOJA ---jhooooow  MANSÃO
	{-854.22,-2137.89,106.71},----LOJA ---TK VENDIDA   MANSÃO
	{-1219.75,-1811.49,4.65},----LOJA --- SPAWN
	{-1222.61,-1806.05,4.65},----LOJA --- SPAWN
	{-1226.3,-1801.19,4.65},----LOJA --- SPAWN








}

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) and not creatingCharacter then
			local coords = GetEntityCoords(ped)

			for k,v in pairs(locateShops) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 3 then
					timeDistance = 4
					DrawText3D(v[1],v[2],v[3],"~b~E~w~   ABRIR")
					DrawMarker(1, vec3(v[1],v[2],v[3]) - vec3(0.0,0.0,1.95), 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 1.5001, 75, 109, 213, 140, 0, 0, 0, 0) 
					if IsControlJustPressed(0,38) then
						TriggerEvent('open:skinshop')
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)

RegisterNetEvent('open:skinshop')
AddEventHandler('open:skinshop',function()
	customCamLocation = nil
	oldData = vRP.getCustomization()

	openMenu({ 
		{ menu = "character", label = "Roupas", selected = true },
		{ menu = "accessoires", label = "Utilidades", selected = false }
	})

	vRP.loadAnimSet("move_m@generic_idles@std")
	vSERVER._setInstance(true)
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
-- SAVESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function SaveSkin()
	oldData = {}
	TriggerEvent("Notify","sucesso","Roupa salva com sucesso.")
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETOUTFIT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("resetOutfit",function()
	--TriggerEvent("updateRoupas",oldData)
	vRP.setCustomization(oldData)
	oldData = {}
	skinData = json.decode(previousSkinData)
	previousSkinData = {}
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATERIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotateRight",function()
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	SetEntityHeading(ped,heading+30)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATELEFT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotateLeft",function()
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	SetEntityHeading(ped,heading-30)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOTHINGCATEGORYS
-----------------------------------------------------------------------------------------------------------------------------------------
local clothingCategorys = {
	["arms"] = { type = "variation", id = 3 },
	["tshirt"] = { type = "variation", id = 8 },
	["torso"] = { type = "variation", id = 11 },
	["pants"] = { type = "variation", id = 4 },
	["vest"] = { type = "variation", id = 9 },
	["mochila"] = { type = "variation", id = 5 },
	["shoes"] = { type = "variation", id = 6 },
	["mask"] = { type = "mask", id = 1 },
	["hat"] = { type = "prop", id = 0 },
	["glass"] = { type = "prop", id = 1 },
	["ear"] = { type = "prop", id = 2 },
	["watch"] = { type = "prop", id = 6 },
	["bracelet"] = { type = "prop", id = 7 },
	["accessory"] = { type = "variation", id = 7 },
	["decals"] = { type = "variation", id = 10 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETMAXVALUES
-----------------------------------------------------------------------------------------------------------------------------------------
function GetMaxValues()
	maxModelValues = {
		["arms"] = { name = 'Maos',type = "character", item = 0, texture = 0, clothingCategory = 'arms'},
		["tshirt"] = { name = 'Camisas', type = "character", item = 0, texture = 0, clothingCategory = 'tshirt'},
		["torso"] = { name = 'Jaqueta', type = "character", item = 0, texture = 0, clothingCategory = 'torso'},
		["pants"] = { name = 'Calcas', type = "character", item = 0, texture = 0, clothingCategory = 'pants'},
		["shoes"] = { name = 'Sapatos', type = "character", item = 0, texture = 0, clothingCategory = 'shoes'},
		["vest"] = { name = 'Coletes', type = "character", item = 0, texture = 0, clothingCategory = 'vest'},
		["accessory"] = { name = 'Acessorios', type = "character", item = 0, texture = 0, clothingCategory = 'accessory'},
		["decals"] = { name = 'Adesivos', type = "character", item = 0, texture = 0, clothingCategory = 'decals'},
		["mask"] = { name = 'Mascara', type = "accessoires", item = 0, texture = 0, clothingCategory = 'mask'},
		["hat"] = { name = 'Chapeu', type = "accessoires", item = 0, texture = 0, clothingCategory = 'hat'},
		["glass"] = { name = 'Oculos', type = "accessoires", item = 0, texture = 0, clothingCategory = 'glass'},
		["mochila"] = { name = 'Mochila', type = "accessoires", item = 0, texture = 0, clothingCategory = 'mochila'},
		["ear"] = { name = 'Orelhas', type = "accessoires", item = 0, texture = 0, clothingCategory = 'ear'},
		["watch"] = { 	name = 'Relogios', type = "accessoires", item = 0, texture = 0, clothingCategory = 'watch'},
		["bracelet"] = { name = 'Braceletes', type = "accessoires", item = 0, texture = 0, clothingCategory = 'bracelet' }
	}

	local ped = PlayerPedId()
	for k,v in pairs(clothingCategorys) do
		if v.type == "variation" then
			maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped,v.id)
			maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped,v.id,GetPedDrawableVariation(ped,v.id)) -1
			maxModelValues[k].actual = GetPedDrawableVariation(ped, v.id)
			maxModelValues[k].actualTexture = GetPedTextureVariation(ped, v.id)
		end

		if v.type == "mask" then
			maxModelValues[k].item = GetNumberOfPedDrawableVariations(ped,v.id)
			maxModelValues[k].texture = GetNumberOfPedTextureVariations(ped,v.id,GetPedDrawableVariation(ped,v.id))
			maxModelValues[k].actual = GetPedDrawableVariation(ped, v.id)
			maxModelValues[k].actualTexture = GetPedTextureVariation(ped, v.id)
		end

		if v.type == "overlay" then
			maxModelValues[k].item = GetNumHeadOverlayValues(v.id)
			maxModelValues[k].texture = 45
		end

		if v.type == "prop" then
			maxModelValues[k].item = GetNumberOfPedPropDrawableVariations(ped,v.id)
			maxModelValues[k].texture = GetNumberOfPedPropTextureVariations(ped,v.id,GetPedPropIndex(ped,v.id))
			maxModelValues[k].actual = GetPedPropIndex(ped, v.id)
			maxModelValues[k].actualTexture = GetPedPropTextureIndex(ped, v.id)
		end
	end

	SendNUIMessage({ action = "updateMax", data = maxModelValues })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENMENU
-----------------------------------------------------------------------------------------------------------------------------------------
function openMenu(allowedMenus)
	creatingCharacter = true
	previousSkinData = json.encode(skinData)

	GetMaxValues()

	SendNUIMessage({ action = "setVisible", data = true })

	SetNuiFocus(true,true)
	SetCursorLocation(0.9,0.25)

	enableCam()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENABLECAM
-----------------------------------------------------------------------------------------------------------------------------------------
function enableCam()
	local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,2.0,0)
	RenderScriptCams(false,false,0,1,0)
	if DoesCamExist(cam) then
		DestroyCam(cam,false)
	end

	if not DoesCamExist(cam) then
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,false,0,true,true)
		SetCamCoord(cam,coords.x,coords.y,coords.z+0.5)
		SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId())+180)
		SetEntityHeading(PlayerPedId(),GetEntityHeading(PlayerPedId()) - 180)
	end

	if customCamLocation ~= nil then
		SetCamCoord(cam,customCamLocation.x,customCamLocation.y,customCamLocation.z)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATECAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotateCam",function(data)
	local rotType = data.type
	local ped = PlayerPedId()
	local coords = GetOffsetFromEntityInWorldCoords(ped,0,2.0,0)

	if rotType == "left" then
		SetEntityHeading(ped,GetEntityHeading(ped)-10)
		SetCamCoord(cam,coords.x,coords.y, coords.z+0.5)
		SetCamRot(cam,0.0,0.0,GetEntityHeading(ped)+180)
	else
		SetEntityHeading(ped,GetEntityHeading(ped)+10)
		SetCamCoord(cam,coords.x,coords.y,coords.z+0.5)
		SetCamRot(cam,0.0,0.0,GetEntityHeading(ped)+180)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUPCAM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("setupCam",function(data)
	local value = data.value

	if value == 1 then
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,-0.75,0)
		SetCamCoord(cam,coords.x,coords.y,coords.z+0.65)
	elseif value == 2 then
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,-1.0,0)
		SetCamCoord(cam,coords.x,coords.y,coords.z+0.2)
	elseif value == 3 then
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,-1.0,0)
		SetCamCoord(cam,coords.x,coords.y,coords.z+-0.5)
	else
		local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0,2.0,0)
		SetCamCoord(cam,coords.x,coords.y,coords.z+0.5)
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
-- CLOSEMENU
-----------------------------------------------------------------------------------------------------------------------------------------
function closeMenu()
	ResetPedMovementClipset(PlayerPedId(),1.0)
	SendNUIMessage({ action = "setVisible", data = false })
	oldData = {}
	vSERVER._setInstance(false)
	disableCam()
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETCLOTHING
-----------------------------------------------------------------------------------------------------------------------------------------
function resetClothing(data)
	local ped = PlayerPedId()

	SetPedComponentVariation(ped,4,data["pants"].item,data["pants"].texture,2)
	SetPedComponentVariation(ped,3,data["arms"].item,data["arms"].texture,2)
	SetPedComponentVariation(ped,8,data["tshirt"].item,data["tshirt"].texture,2)
	SetPedComponentVariation(ped,9,data["vest"].item,data["vest"].texture,2)
	SetPedComponentVariation(ped,11,data["torso"].item,data["torso"].texture,2)
	SetPedComponentVariation(ped,6,data["shoes"].item,data["shoes"].texture,2)
	SetPedComponentVariation(ped,1,data["mask"].item,data["mask"].texture,2)
	SetPedComponentVariation(ped,10,data["decals"].item,data["decals"].texture,2)
	SetPedComponentVariation(ped,7,data["accessory"].item,data["accessory"].texture,2)
	SetPedComponentVariation(ped,5,data["mochila"].item,data["mochila"].texture,2)

	if data["hat"].item ~= -1 and data["hat"].item ~= 0 then
		SetPedPropIndex(ped,0,data["hat"].item,data["hat"].texture,2)
	else
		ClearPedProp(ped,0)
	end

	if data["glass"].item ~= -1 and data["glass"].item ~= 0 then
		SetPedPropIndex(ped,1,data["glass"].item,data["glass"].texture,2)
	else
		ClearPedProp(ped,1)
	end

	if data["ear"].item ~= -1 and data["ear"].item ~= 0 then
		SetPedPropIndex(ped,2,data["ear"].item,data["ear"].texture,2)
	else
		ClearPedProp(ped,2)
	end

	if data["watch"].item ~= -1 and data["watch"].item ~= 0 then
		SetPedPropIndex(ped,6,data["watch"].item,data["watch"].texture,2)
	else
		ClearPedProp(ped,6)
	end

	if data["bracelet"].item ~= -1 and data["bracelet"].item ~= 0 then
		SetPedPropIndex(ped,7,data["bracelet"].item,data["bracelet"].texture,2)
	else
		ClearPedProp(ped,7)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function()
	ResetPedMovementClipset(PlayerPedId(),1.0)
	disableCam()
	SetNuiFocus(false,false)
	SendNUIMessage({action = "setVisible", data = false})
	vSERVER._setInstance(false)
	creatingCharacter = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkin",function(data)
	ChangeVariation(data)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKINONINPUT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSkinOnInput",function(data)
	ChangeVariation(data)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHANGEVARIATION
-----------------------------------------------------------------------------------------------------------------------------------------
function ChangeVariation(data)
	local ped = PlayerPedId()
	local clothingCategory = data.clothingType
	local type = data.type
	local item = tonumber(data.articleNumber)
	
	if clothingCategory == "pants" then
		if type == "item" then
			SetPedComponentVariation(ped,4,item,0, 2)
			skinData["pants"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,4)
			SetPedComponentVariation(ped,4,curItem,item,2)
			skinData["pants"].texture = item
		end
	elseif clothingCategory == "arms" then
		if type == "item" then
			SetPedComponentVariation(ped,3,item,0,2)
			skinData["arms"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,3)
			SetPedComponentVariation(ped,3,curItem,item,2)
			skinData["arms"].texture = item
		end
	elseif clothingCategory == "tshirt" then
		if type == "item" then
			SetPedComponentVariation(ped,8,item,0,2)
			skinData["tshirt"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,8)
			SetPedComponentVariation(ped,8,curItem,item,2)
			skinData["tshirt"].texture = item
		end
	elseif clothingCategory == "vest" then
		if type == "item" then
			SetPedComponentVariation(ped,9,item,0,2)
			skinData["vest"].item = item
		elseif type == "texture" then
			SetPedComponentVariation(ped,9,skinData["vest"].item,item,2)
			skinData["vest"].texture = item
		end
	elseif clothingCategory == "decals" then
		if type == "item" then
			SetPedComponentVariation(ped,10,item,0,2)
			skinData["decals"].item = item
		elseif type == "texture" then
			SetPedComponentVariation(ped,10,skinData["decals"].item,item,2)
			skinData["decals"].texture = item
		end
	elseif clothingCategory == "accessory" then
		if type == "item" then
			SetPedComponentVariation(ped,7,item,0,2)
			skinData["accessory"].item = item
		elseif type == "texture" then
			SetPedComponentVariation(ped,7,skinData["accessory"].item,item,2)
			skinData["accessory"].texture = item
		end
	elseif clothingCategory == "torso" then
		if type == "item" then
			SetPedComponentVariation(ped,11,item,0,2)
			skinData["torso"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,11)
			SetPedComponentVariation(ped,11,curItem,item,2)
			skinData["torso"].texture = item
		end
	elseif clothingCategory == "shoes" then
		if type == "item" then
			SetPedComponentVariation(ped,6,item,0,2)
			skinData["shoes"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,6)
			SetPedComponentVariation(ped,6,curItem,item,2)
			skinData["shoes"].texture = item
		end
	elseif clothingCategory == "mask" then
		if type == "item" then
			SetPedComponentVariation(ped,1,item,0,2)
			skinData["mask"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,1)
			SetPedComponentVariation(ped,1,curItem,item,2)
			skinData["mask"].texture = item
		end
	elseif clothingCategory == "mochila" then
		if type == "item" then
			SetPedComponentVariation(ped,5,item,0,2)
			skinData["mochila"].item = item
		elseif type == "texture" then
			local curItem = GetPedDrawableVariation(ped,5)
			SetPedComponentVariation(ped,5,curItem,item,2)
			skinData["mochila"].texture = item
		end
	elseif clothingCategory == "hat" then
		if type == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,0,item,skinData["hat"].texture,2)
			else
				ClearPedProp(ped,0)
			end
			skinData["hat"].item = item
		elseif type == "texture" then
			SetPedPropIndex(ped,0,skinData["hat"].item,item,2)
			skinData["hat"].texture = item
		end
	elseif clothingCategory == "glass" then
		if type == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,1,item,skinData["glass"].texture,2)
				skinData["glass"].item = item
			else
				ClearPedProp(ped,1)
			end
		elseif type == "texture" then
			SetPedPropIndex(ped,1,skinData["glass"].item,item,2)
			skinData["glass"].texture = item
		end
	elseif clothingCategory == "ear" then
		if type == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,2,item,skinData["ear"].texture,2)
			else
				ClearPedProp(ped,2)
			end
			skinData["ear"].item = item
		elseif type == "texture" then
			SetPedPropIndex(ped,2,skinData["ear"].item,item,2)
			skinData["ear"].texture = item
		end
	elseif clothingCategory == "watch" then
		if type == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,6,item,skinData["watch"].texture,2)
			else
				ClearPedProp(ped,6)
			end
			skinData["watch"].item = item
		elseif type == "texture" then
			SetPedPropIndex(ped,6,skinData["watch"].item,item,2)
			skinData["watch"].texture = item
		end
	elseif clothingCategory == "bracelet" then
		if type == "item" then
			if item ~= -1 then
				SetPedPropIndex(ped,7,item,skinData["bracelet"].texture,2)
			else
				ClearPedProp(ped,7)
			end
			skinData["bracelet"].item = item
		elseif type == "texture" then
			SetPedPropIndex(ped,7,skinData["bracelet"].item,item,2)
			skinData["bracelet"].texture = item
		end
	end
	
	GetMaxValues()
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- SETMASK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_skinshop:setMask")
AddEventHandler("vrp_skinshop:setMask", function(mask)
	local ped = PlayerPedId()

	if mask == nil then
		vRP._playAnim(true,{"missfbi4","takeoff_mask"},true)
		Citizen.Wait(900)
		SetPedComponentVariation(ped,1,0,0,2)
	else
		vRP._playAnim(true,{"mp_masks@on_foot","put_on_mask"},true)
		Citizen.Wait(700)
		skinData["mask"].item = mask[1]
		skinData["mask"].texture = mask[2]
		SetPedComponentVariation(ped,1,parseInt(mask[1]),parseInt(mask[2]),2)
	end

	vRP.DeletarObjeto("one")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETHAT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_skinshop:setHat")
AddEventHandler("vrp_skinshop:setHat",function(hat)
	local ped = PlayerPedId()

	vRP._playAnim(true,{"mp_masks@standard_car@ds@","put_on_mask"},true)
	Citizen.Wait(900)

	if hat == nil then
		ClearPedProp(ped,0)
	else
		skinData["hat"].item = hat[1]
		skinData["hat"].texture = hat[2]
		SetPedPropIndex(ped,0,parseInt(hat[1]),parseInt(hat[2]),2)
	end

	vRP.DeletarObjeto("one")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETGLASSES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_skinshop:setGlasses")
AddEventHandler("vrp_skinshop:setGlasses", function(glasses)
	local ped = PlayerPedId()

	vRP._playAnim(true,{"clothingspecs","take_off"},true)
	Citizen.Wait(1000)

	if glasses == nil then
		ClearPedProp(ped,1)
	else
		skinData["glass"].item = glasses[1]
		skinData["glass"].texture = glasses[2]
		SetPedPropIndex(ped,1,parseInt(glasses[1]),parseInt(glasses[2]),2)
	end

	vRP.DeletarObjeto("one")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETARMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_skinshop:setArms")
AddEventHandler("vrp_skinshop:setArms", function(arms)
	local ped = PlayerPedId()

	if arms == nil then
		SetPedComponentVariation(ped,3,15,0,2)
	else
		skinData["arms"].item = arms[1]
		skinData["arms"].texture = arms[2]
		SetPedComponentVariation(ped,3,parseInt(arms[1]),parseInt(arms[2]),2)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETELEMENTS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getElements(status)
	return skinData[status].item,skinData[status].texture
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETCUSTOMIZATION
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getCustomization()
	return skinData
end

AddEventHandler("onResourceStop",function(resource)
	if GetCurrentResourceName() == resource then
        closeMenu()
	end
end)

exports('inSkinShop', function()
    return creatingCharacter
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("updateRoupas")
AddEventHandler("updateRoupas",function(custom)
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 then
		if custom[1] == -1 then
			SetPedComponentVariation(ped,1,0,0,2)
		else
			SetPedComponentVariation(ped,1,custom[1],custom[2],2)
		end

		if custom[3] == -1 then
			SetPedComponentVariation(ped,5,0,0,2)
		else
			SetPedComponentVariation(ped,5,custom[3],custom[4],2)
		end

		if custom[5] == -1 then
			SetPedComponentVariation(ped,7,0,0,2)
		else
			SetPedComponentVariation(ped,7,custom[5],custom[6],2)
		end

		if custom[7] == -1 then
			SetPedComponentVariation(ped,3,15,0,2)
		else
			SetPedComponentVariation(ped,3,custom[7],custom[8],2)
		end

		if custom[9] == -1 then
			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				SetPedComponentVariation(ped,4,18,0,2)
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				SetPedComponentVariation(ped,4,15,0,2)
			end
		else
			SetPedComponentVariation(ped,4,custom[9],custom[10],2)
		end

		if custom[11] == -1 then
			SetPedComponentVariation(ped,8,15,0,2)
		else
			SetPedComponentVariation(ped,8,custom[11],custom[12],2)
		end

		if custom[13] == -1 then
			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				SetPedComponentVariation(ped,6,34,0,2)
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				SetPedComponentVariation(ped,6,35,0,2)
			end
		else
			SetPedComponentVariation(ped,6,custom[13],custom[14],2)
		end

		if custom[15] == -1 then
			SetPedComponentVariation(ped,11,15,0,2)
		else
			SetPedComponentVariation(ped,11,custom[15],custom[16],2)
		end

		if custom[17] == -1 then
			SetPedComponentVariation(ped,9,0,0,2)
		else
			SetPedComponentVariation(ped,9,custom[17],custom[18],2)
		end

		if custom[19] == -1 then
			SetPedComponentVariation(ped,10,0,0,2)
		else
			SetPedComponentVariation(ped,10,custom[19],custom[20],2)
		end

		if custom[21] == -1 then
			ClearPedProp(ped,0)
		else
			SetPedPropIndex(ped,0,custom[21],custom[22],2)
		end

		if custom[23] == -1 then
			ClearPedProp(ped,1)
		else
			SetPedPropIndex(ped,1,custom[23],custom[24],2)
		end

		if custom[25] == -1 then
			ClearPedProp(ped,2)
		else
			SetPedPropIndex(ped,2,custom[25],custom[26],2)
		end

		if custom[27] == -1 then
			ClearPedProp(ped,6)
		else
			SetPedPropIndex(ped,6,custom[27],custom[28],2)
		end

		if custom[29] == -1 then
			ClearPedProp(ped,7)
		else
			SetPedPropIndex(ped,7,custom[29],custom[30],2)
		end
	end
end)