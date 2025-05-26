local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
yRP = Tunnel.getInterface("anticl")

function setPed(ped, player)
    if not player then return end
    local headOverlays = {
        [0] = "blemishes",
        [1] = "facialHair",
        [2] = "eyebrows",
        [3] = "ageing",
        [4] = "makeup",
        [5] = "blush",
        [6] = "complexion",
        [7] = "sunDamage",
        [8] = "lipstick",
        [9] = "freckles",
        [10] = "chestHair",
        [11] = "bodyBlemishes",
        [12] = "addBodyBlemishes",
    }
    local faceFeatures = {
        [0] = "noseWidth",
        [1] = "nosePeakHeight",
        [2] = "nosePeakLength",
        [3] = "noseBoneHigh",
        [4] = "nosePeakLowering",
        [5] = "noseBoneTwist",
        [6] = "eyeBrownHigh",
        [7] = "eyeBrownForward",
        [8] = "cheeksBoneHigh",
        [9] = "cheeksBoneWidth",
        [10] = "cheeksWidth",
        [11] = "eyesOpenning",
        [12] = "lipsThickness",
        [13] = "jawBoneWidth",
        [14] = "jawBoneBackLength",
        [15] = "chinBoneLowering",
        [16] = "chinBoneLength",
        [17] = "chinBoneWidth",
        [18] = "chinHole",
        [19] = "neckThickness"
    }

    SetPedComponentVariation(ped, 2, player["hair"], 0, 0)
    SetPedHairColor(ped, player["hair-color"], player["hair-highlightcolor"])
    ClearPedDecorationsLeaveScars(ped)
    SetPedHeadBlendData(ped, player.shapeFirst, player.shapeSecond, player.shapeThird or 0, player.skinFirst, player.skinSecond, player.skinThird or 0, player.shapeMix, player.skinMix, player.thirdMix or f(0), false)
    SetPedEyeColor(ped, player.eyes)
    for overlayId, key in pairs(headOverlays) do
        local colourType = 0
        if key:find("eyebrows") or key:find("facialHair") or key:find("chestHair") then
            colourType = 1
        elseif key:find("blush") or key:find("lipstick") or key:find("makeup") then
            colourType = 2
        end
        SetPedHeadOverlay(ped, overlayId, player[key], player[key.."-opacity"])
        SetPedHeadOverlayColor(ped, overlayId, colourType, player[key.."-color"], player[key.."-color"])
    end
    for index, key in pairs(faceFeatures) do
        SetPedFaceFeature(ped, index, player[key])
    end
end

AddEventHandler("playerDropped", function(reason)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local playerName = GetPlayerName(PlayerId())
    TriggerServerEvent("playerDroppedEvent", coords, reason, playerName)
end)
