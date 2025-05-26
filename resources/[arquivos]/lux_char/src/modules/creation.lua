
local ply
local user_id = false
local cam

---
-- Character Creator 
--- 
function f(n)
	n = n + 0.00000
	return n
end
function setCamHeight(height)
	local pos = GetEntityCoords(PlayerPedId())
	SetCamCoord(cam, vector3(pos.x, pos.y, (height) + 0.0))
end

isInCharacterMode    = false

RegisterNUICallback("saveName", function(data, cb)
	Remote._saveName(data)
	cb(1)
end)

function Client.createCharacter(id)
	CreateThread(function()
		Remote._setRoutingBucket(true)
		
		user_id           = id or Remote.getUserId()
		isInCharacterMode = true
		LocalPlayer.state:set("charCreate",true,false)
		changeGender("mp_m_freemode_01")

		SetEntityVisible(PlayerPedId(), true)
		refreshDefaultCharacter()
	
		local attempts = 0

		while not IsInteriorReady(233217) and attempts <= 100 do 
			attempts = attempts + 1
			Citizen.Wait(10)
		end

		StartPlayerTeleport(PlayerId(), -1194.15,-1785.94,4.84,11.13,	true,true,true)

		while IsPlayerTeleportActive() do
			Wait(5)
		end

		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", false)
		SetCamCoord(cam, vector3(x + 0.5,y ,z + 0.68))

		SetCamRot(cam, 0.0, 0.0, 90.0, 1)
		SetCamActive(cam, true)
		RenderScriptCams(true, true, 2000, 0, 0, 0)
		SetNuiFocus(isInCharacterMode, isInCharacterMode)
		SendNUIMessage({ CharacterMode = isInCharacterMode, CharacterMode2 = not isInCharacterMode, CharacterMode3 = not isInCharacterMode, recreate = user_id })
		FreezeEntityPosition(ply,false)
		SetEntityVisible(ply, true)
		TaskUpdateSkinOptions(PlayerPedId())
		vRP.playAnim(false, {'move_f@multiplayer','idle'}, true)
		TaskUpdateFaceOptions(PlayerPedId())
		TaskUpdateHeadOptions(PlayerPedId())

		DoScreenFadeIn(1000)

		SendNUIMessage({
			action = "OPEN_CREATE",
			data = { user_id = user_id }
		})
		SetNuiFocus(true, true)
	end)
end

function loadAnimCreator(dict)
	RequestAnimSet(dict)
	while not HasAnimSetLoaded(dict) do
		Citizen.Wait(10)
	end
	SetPedMovementClipset(ply,dict,0.25)

	
	SetEntityHeading(PlayerPedId(), 87.0)
end

function destroyCamera()
	SetCamActive(cam, false)
	StopCamPointing(cam)
	RenderScriptCams(0, 0, 0, 0, 0, 0)
	SetFocusEntity(PlayerPedId())
end

function refreshDefaultCharacter()
	SetPedDefaultComponentVariation(ply)
	ClearAllPedProps(ply)
	if GetEntityModel(ply) == 1885233650 then -- macho
		SetPedComponentVariation(ply, 1, 0, 0, 2) 	-- 1: Mask            
		SetPedComponentVariation(ply, 2, 0, 0, 0) 	-- 2: Hair          
		SetPedComponentVariation(ply, 3, 1, 0, 2) 	-- 3: Torso
		SetPedComponentVariation(ply, 4, 223, 0, 2) 	-- 4: Leg
		SetPedComponentVariation(ply, 5, 0, 0, 0) 	-- 5: Parachute / bag
		SetPedComponentVariation(ply, 6, 63, 0, 2)	-- 6: Shoes
		SetPedComponentVariation(ply, 7, 207, 0, 2) 	-- 7: Accessory
		SetPedComponentVariation(ply, 8, 15, 0, 2) 	-- 8: Undershirt
		SetPedComponentVariation(ply, 9, 0, 0, 2) 	-- 9: Kevlar
		SetPedComponentVariation(ply, 10, 0, 0, 0) 	-- 10: Badge
		SetPedComponentVariation(ply, 11, 581,0,2) 	-- 11: Torso 2

		SetPedComponentVariation(ply, 12, 0, 0, 0)
		SetPedComponentVariation(ply, 13, 0, 2, 0)
		SetPedComponentVariation(ply, 14, 0, 0, 255)
		SetPedComponentVariation(ply, 15, 0, 1, 100)
		SetPedComponentVariation(ply, 16, 0, 1, 255)
		SetPedComponentVariation(ply, 17, 0, 1, 255)
		SetPedComponentVariation(ply, 18, 16777728, 1, 255)
		SetPedComponentVariation(ply, 19, 33620481, 2, 255)
		SetPedComponentVariation(ply, 20, 169008802, 2, 255)
		SetPedPropIndex(ply, 0, -1, 0, 0) 	-- 0: Hat
		SetPedPropIndex(ply, 1, -1, 0, 0) 	-- 1: Glass
		SetPedPropIndex(ply, 2, -1, 0, 0)	-- 2: Ear
		SetPedPropIndex(ply, 3, -1, 0, 0) 
		SetPedPropIndex(ply, 4, -1, 0, 0)
		SetPedPropIndex(ply, 5, -1, 0, 0)
		SetPedPropIndex(ply, 6, -1, 0, 0) 	-- 6: Watch
		SetPedPropIndex(ply, 7, -1, 0, 0) 	-- 7: Bracelet
		SetPedPropIndex(ply, 8, -1, 0, 0)
		SetPedPropIndex(ply, 9, -1, 0, 0)
		SetPedPropIndex(ply, 10, -1, 0, 0)
	else -- femea
		SetPedComponentVariation(ply, 1, 0, 0, 2 ) -- 1   : Mask
		SetPedComponentVariation(ply, 2, 6, 0, 0 ) -- 2   : Hair   
		SetPedComponentVariation(ply, 3, 15, 0, 2 ) -- 3  : Torso
		SetPedComponentVariation(ply, 4, 209, 0, 2 )	-- 4  : Leg
		SetPedComponentVariation(ply, 5, 0, 0, 1 ) -- 5   : Parachute / bag
		SetPedComponentVariation(ply, 6, 56, 1, 2 ) -- 6 : Shoes
		SetPedComponentVariation(ply, 7, 197, 0, 2 ) 	-- 7  : Accessory
		SetPedComponentVariation(ply, 8, 360, 0, 2 ) -- 8   : Undershirt
		SetPedComponentVariation(ply, 9, 0, 0, 2 ) -- 9  : Kevlar
		SetPedComponentVariation(ply, 10, -1, 0, 0 ) -- 10: Badge
		SetPedComponentVariation(ply, 11, 685, 0, 2 ) -- 11: Torso 2

		SetPedComponentVariation(ply, 12, 0, 0, 0)
		SetPedComponentVariation(ply, 13, 256, 1, 0)
		SetPedComponentVariation(ply, 14, 0, 0, 255)
		SetPedComponentVariation(ply, 15, 0, 1, 230)
		SetPedComponentVariation(ply, 16, 0, 1, 1)
		SetPedComponentVariation(ply, 17, 0, 1, 0)
		SetPedComponentVariation(ply, 18, 16777472, 1, 0)
		SetPedComponentVariation(ply, 19, 33620225, 2, 0)
		SetPedComponentVariation(ply, 20, 16908801, 1, 5)

		SetPedPropIndex(ply, 0, -1, 0, 0) 	-- 0: Hat
		SetPedPropIndex(ply, 1, -1, 0, 0) 	-- 1: Glass
		SetPedPropIndex(ply, 2, -1, 0, 0)	-- 2: Ear
		SetPedPropIndex(ply, 3, -1, 0, 0) 
		SetPedPropIndex(ply, 4, -1, 0, 0)
		SetPedPropIndex(ply, 5, -1, 0, 0)
		SetPedPropIndex(ply, 6, -1, 0, 0) 	-- 6: Watch
		SetPedPropIndex(ply, 7, -1, 0, 0) 	-- 7: Bracelet
		SetPedPropIndex(ply, 8, -1, 0, 0)
		SetPedPropIndex(ply, 9, -1, 0, 0)
		SetPedPropIndex(ply, 10, -1, 0, 0)
	end

	loadAnimCreator("move_m@generic_idles@std")
end

function changeGender(model)
	local mhash = GetHashKey(model)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end
	if HasModelLoaded(mhash) then
		SetPlayerModel(PlayerId(), mhash)
		SetEntityHealth(PlayerPedId(), 400)
		SetPedCanRagdoll(PlayerPedId(), false)
		SetModelAsNoLongerNeeded(mhash)
	end
	ply = PlayerPedId()
	vRP.playAnim(false, {'move_f@multiplayer','idle'}, true)
end

RegisterNUICallback('cDone', function()
	SetNuiFocus(isInCharacterMode, isInCharacterMode)
	SendNUIMessage({ CharacterMode = not isInCharacterMode, CharacterMode2 = isInCharacterMode, CharacterMode3 = not isInCharacterMode })
end)

RegisterNUICallback('BackPart1', function()
	SetNuiFocus(isInCharacterMode, isInCharacterMode)
	SendNUIMessage({ CharacterMode = isInCharacterMode, CharacterMode2 = not isInCharacterMode, CharacterMode3 = not isInCharacterMode })
end)

RegisterNUICallback('cDonePart2', function()
	SetNuiFocus(isInCharacterMode, isInCharacterMode)
	SendNUIMessage({ CharacterMode = not isInCharacterMode, CharacterMode2 = not isInCharacterMode, CharacterMode3 = isInCharacterMode })
end)

RegisterNUICallback('BackPart2', function()
	SetNuiFocus(isInCharacterMode, isInCharacterMode)
	SendNUIMessage({ CharacterMode = not isInCharacterMode, CharacterMode2 = isInCharacterMode, CharacterMode3 = not isInCharacterMode })
end)

local SAVED = false 
RegisterNUICallback('cDoneSave', function(data)
	if SAVED then 
		return 
	end
	SAVED = true 
	local ply  = PlayerPedId()
	LocalPlayer.state:set("charCreate",false,true)

	ResetPedMovementClipset(PlayerPedId(),0.25)
	ResetPedStrafeClipset(PlayerPedId())
	ClearPedTasks(ply)

	Remote._saveCharacter({ appearance = currentCharacterMode, sex = GetEntityModel(ply) },	user_id)
	isInCharacterMode = false
	destroyCamera()

	SetNuiFocus(isInCharacterMode, isInCharacterMode)
	SendNUIMessage({ CharacterMode = isInCharacterMode, CharacterMode2 = isInCharacterMode, CharacterMode3 = isInCharacterMode })
	SendNUIMessage({ action = "setVisible", data = false })
	DoScreenFadeOut()
	if currentCharacterMode.gender == 1 then
		vRP.setCustomization(Config.Clothes.Female)
	else
		vRP.setCustomization(Config.Clothes.Male)
	end
	Wait(3000)
	local callback,data = Remote.getCharacters()
	SpawnPlayer(data, true, true)

	TriggerEvent('open:tattoos_complexo_char',true,true)
end)

RegisterNUICallback('cChangeHeading', function(data, cb)
	local ply  = PlayerPedId()

	SetEntityHeading(ply, (data.camRotation) + 0.0)
	cb('ok')
end)

RegisterNUICallback('ChangeGender', function(data, cb)
	currentCharacterMode.gender = tonumber(data.gender)
	if tonumber(data.gender) == 1 then
		changeGender("mp_f_freemode_01")
		vRP.setCustomization(Config.Clothes.Female)
	else
		changeGender("mp_m_freemode_01")
		vRP.setCustomization(Config.Clothes.Male)
	end

	TaskUpdateSkinOptions()
	TaskUpdateFaceOptions()
	TaskUpdateHeadOptions()
	vRP.playAnim(false, {'move_f@multiplayer','idle'}, true)
	cb('ok')
end)

RegisterNUICallback('UpdateSkinOptions', function(data, cb)
	currentCharacterMode.fathersID = data.fathersID
	currentCharacterMode.mothersID = data.mothersID
	currentCharacterMode.skinColor = data.skinColor
	currentCharacterMode.shapeMix  = data.shapeMix
	characterNome                  = data.characterNome
	characterSobrenome             = data.characterSobrenome
	characterAge                   = data.characterAge

	TaskUpdateSkinOptions()
	cb('ok')
end)

function TaskUpdateSkinOptions(ped)
	local data = currentCharacterMode
	SetPedHeadBlendData(ped or PlayerPedId(), parseInt(data.fathersID), parseInt(data.mothersID), 0, parseInt(data.skinColor), 0, 0, f(data.shapeMix), 0, 0, false)
end
RegisterNUICallback('UpdateFaceOptions', function(data, cb)
	currentCharacterMode.eyesColor       = data.eyesColor
	currentCharacterMode.eyebrowsHeight  = data.eyebrowsHeight
	currentCharacterMode.eyebrowsWidth   = data.eyebrowsWidth
	currentCharacterMode.noseWidth       = data.noseWidth
	currentCharacterMode.noseHeight      = data.noseHeight
	currentCharacterMode.noseLength      = data.noseLength
	currentCharacterMode.noseBridge      = data.noseBridge
	currentCharacterMode.noseTip         = data.noseTip
	currentCharacterMode.noseShift       = data.noseShift
	currentCharacterMode.cheekboneHeight = data.cheekboneHeight
	currentCharacterMode.cheekboneWidth  = data.cheekboneWidth
	currentCharacterMode.cheeksWidth     = data.cheeksWidth
	currentCharacterMode.lips            = data.lips
	currentCharacterMode.jawWidth        = data.jawWidth
	currentCharacterMode.jawHeight       = data.jawHeight
	currentCharacterMode.chinLength      = data.chinLength
	currentCharacterMode.chinPosition    = data.chinPosition
	currentCharacterMode.chinWidth       = data.chinWidth
	currentCharacterMode.chinShape       = data.chinShape
	currentCharacterMode.neckWidth       = data.neckWidth
	TaskUpdateFaceOptions()
	cb('ok')
end)

function TaskUpdateFaceOptions(_ped)
	local ped  = _ped or PlayerPedId()
	local data = currentCharacterMode

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

RegisterNUICallback('UpdateHeadOptions', function(data, cb)
	currentCharacterMode.hairModel       = data.hairModel
	currentCharacterMode.firstHairColor  = data.firstHairColor
	currentCharacterMode.secondHairColor = data.secondHairColor
	currentCharacterMode.eyebrowsModel   = data.eyebrowsModel
	currentCharacterMode.eyebrowsColor   = data.eyebrowsColor
	currentCharacterMode.beardModel      = data.beardModel
	currentCharacterMode.beardColor      = data.beardColor
	currentCharacterMode.chestModel      = data.chestModel
	currentCharacterMode.chestColor      = data.chestColor
	currentCharacterMode.blushModel      = data.blushModel
	currentCharacterMode.blushColor      = data.blushColor
	currentCharacterMode.lipstickModel   = data.lipstickModel
	currentCharacterMode.lipstickColor   = data.lipstickColor
	currentCharacterMode.blemishesModel  = data.blemishesModel
	currentCharacterMode.ageingModel     = data.ageingModel
	currentCharacterMode.complexionModel = data.complexionModel
	currentCharacterMode.sundamageModel  = data.sundamageModel
	currentCharacterMode.frecklesModel   = data.frecklesModel
	currentCharacterMode.makeupModel     = data.makeupModel
	TaskUpdateHeadOptions()
	cb('ok')
end)

function TaskUpdateHeadOptions(_ped)
	local ped  = _ped or PlayerPedId()
	local data = currentCharacterMode
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
	SetPedHeadOverlay(ped, 5, parseInt(data.blushModel), 0.99)
	SetPedHeadOverlayColor(ped, 5, 2, parseInt(data.blushColor), parseInt(data.blushColor) )
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
	SetPedHeadOverlayColor(ped, 4, 0, 0, 0)
end

RegisterNUICallback("rotateLeft",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)

	SetEntityHeading(ped,heading+10)
end)

RegisterNUICallback("rotateRight",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	
	SetEntityHeading(ped,heading-10)
end)