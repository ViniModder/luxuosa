local _ANIM = {}
local ANIMS = {}
local REQUEST = {}
ANIMS.active  = false
ANIMS.freeze  = false
ANIMS.action  = nil
ANIMS.current = nil
ANIMS.source  = nil
ANIMS.target  = nil
ANIMS.speed   = 1.0
REQUEST.active = false
local function PlayAnim(playerPed, dict, anim, duration, flag)
    TaskPlayAnim(playerPed, dict, anim, 3.0, -3.0, duration or -1, flag or 1, 0.0, false, false, false)
end
local function GetDuration(dict, anim)
    return (GetAnimDuration(dict, anim)*1000)
end
local function DetachPlayer(playerPed)
    if IsEntityAttachedToAnyPed(playerPed) then
        DetachEntity(playerPed)
    end
end
local function SetPedToFacePed(playerPed, otherPed)
    local p1 = GetEntityCoords(playerPed, true)
    local p2 = GetEntityCoords(otherPed, true)
    local heading = GetHeadingFromVector_2d(p2.x-p1.x, p2.y-p1.y)
    SetEntityHeading(playerPed, heading)
end
local function IsAlive(playerPed)
    return (GetEntityHealth(playerPed) > 100)
end
local function PedCheck(playerPed)
    return (DoesEntityExist(playerPed) and IsAlive(playerPed))
end
local function GetClosestPlayer()
    local playerId  = PlayerId()
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local closestPlayer, closestDistance = -1, -1
    for k,target in ipairs(GetActivePlayers()) do
        if target ~= playerId then
            local targetPed = GetPlayerPed(target)
            if PedCheck(targetPed) then
                local targetPos = GetEntityCoords(targetPed)
                local distance  = #(targetPos - playerPos)
                if closestDistance == -1 or (distance < closestDistance) then
                    closestPlayer   = target
                    closestDistance = distance
                end
            end
        end
    end
    return closestPlayer, closestDistance
end
local function DrawScreenText(x, y, text)
    SetTextFont(4)
    SetTextScale(0.4, 0.4)
    SetTextColour(190, 190, 190, 210)
    SetTextDropshadow(0, 0, 0, 0, 210)
    SetTextDropShadow()
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end
local function LoadAnimDict(dict)
    if type(dict) == 'table' then
        for k,v in pairs(dict) do LoadAnimDict(v) end
    else
        if not HasAnimDictLoaded(dict) then
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(0)
            end
        end
    end
end
local function UnloadAnimDict(dict)
    if type(dict) == 'table' then
        for k,v in pairs(dict) do RemoveAnimDict(v) end
    else
        RemoveAnimDict(dict)
    end
end
local function ShowNotification(text)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandThefeedPostTicker(false, true)
end
local function GetOrElse(value, default)
    return (value ~= nil and value or default)
end
local function CheckAnimFlag(index, flag)
    return _ANIM[index].flags[flag]
end
local function Anim(playerPed, animDict, animName, duration, flag)
    LoadAnimDict(animDict)
    PlayAnim(playerPed, animDict, animName, duration, flag)
    UnloadAnimDict(animDict)
end
local function AnimExit(playerPed, animDict, animName)
    LoadAnimDict(animDict)
    local duration = GetDuration(animDict, animName)
    PlayAnim(playerPed, animDict, animName, -1, 0)
    UnloadAnimDict(animDict)
    Wait(duration)
end
local function Scene(playerPed, animDict, anim1, anim2, anim3, anim4)
    Citizen.CreateThread(function()
        local action = ANIMS.action
        LoadAnimDict(animDict)
        local duration = GetDuration(animDict, anim1)
        PlayAnim(playerPed, animDict, anim1)
        Wait(duration-350)
        if not ANIMS:IsPlayingAnim(action) then return end
        duration = GetDuration(animDict, anim2)
        PlayAnim(playerPed, animDict, anim2)
        Wait(duration-350)
        duration = GetDuration(animDict, anim3)
        PlayAnim(playerPed, animDict, anim3)
        Wait(duration-350)
        if not ANIMS:IsPlayingAnim(action) then return end
        PlayAnim(playerPed, animDict, anim4)
    end)
end
local function SceneExit(playerPed, animDict, anim1, anim2)
    local duration = GetDuration(animDict, anim1)
    PlayAnim(playerPed, animDict, anim1)
    Wait(duration-350)
    duration = GetDuration(animDict, anim2)
    PlayAnim(playerPed, animDict, anim2, -1, 0)
    UnloadAnimDict(animDict)
    Wait(duration)
end
local function Anim_01(playerPed)
    local animDict = {'misscarsteal2pimpsex', 'anim@heists@box_carry@'}
    LoadAnimDict(animDict)
    PlayAnim(playerPed, animDict[1], 'shagloop_pimp')
    PlayAnim(playerPed, animDict[2], 'idle', -1, 51)
    UnloadAnimDict(animDict)
end
local function Anim_V01_A(playerPed)
    Scene(playerPed, 'random@drunk_driver_2', 'cardrunkflirt_intro_m', 'cardrunkflirt_loop_m', 'cardrunksex_intro_m', 'cardrunksex_loop_m')
end
local function Anim_V01_B(playerPed)
    Scene(playerPed, 'random@drunk_driver_2', 'cardrunkflirt_intro_f', 'cardrunkflirt_loop_f', 'cardrunksex_intro_f', 'cardrunksex_loop_f')
end
local function Anim_V02_A(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_prop_loop_player', 'low_car_prop_to_sex_p1_player', 'low_car_prop_to_sex_p2_player', 'low_car_sex_loop_player')
end
local function Anim_V02_B(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_prop_loop_female', 'low_car_prop_to_sex_p1_female', 'low_car_prop_to_sex_p2_female', 'low_car_sex_loop_female')
end
local function Anim_V02_A_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_sex_to_prop_p1_player', 'low_car_sex_to_prop_p2_player')
end
local function Anim_V02_B_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_sex_to_prop_p1_female', 'low_car_sex_to_prop_p2_female')
end
local function Anim_V03_A(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_prop_loop_player', 'low_car_prop_to_bj_p1_player', 'low_car_prop_to_bj_p2_player', 'low_car_bj_loop_player')
end
local function Anim_V03_B(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_prop_loop_female', 'low_car_prop_to_bj_p1_female', 'low_car_prop_to_bj_p2_female', 'low_car_bj_loop_female')
end
local function Anim_V03_A_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_bj_to_prop_p1_player', 'low_car_bj_to_prop_p2_player')
end
local function Anim_V03_B_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexlow_veh', 'low_car_bj_to_prop_p1_female', 'low_car_bj_to_prop_p2_female')
end
local function Anim_V04_A(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexnorm_veh', 'proposition_loop_male', 'proposition_to_sex_p1_male', 'proposition_to_sex_p2_male', 'sex_loop_male')
end
local function Anim_V04_B(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexnorm_veh', 'proposition_loop_prostitute', 'proposition_to_sex_p1_prostitute', 'proposition_to_sex_p2_prostitute', 'sex_loop_prostitute')
end
local function Anim_V04_A_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexnorm_veh', 'sex_to_proposition_p1_male', 'sex_to_proposition_p2_male')
end
local function Anim_V04_B_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexnorm_veh', 'sex_to_proposition_p1_prostitute', 'sex_to_proposition_p2_prostitute')
end
local function Anim_V05_A(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexnorm_veh', 'proposition_loop_male', 'proposition_to_bj_p1_male', 'proposition_to_bj_p2_male', 'bj_loop_male')
end
local function Anim_V05_B(playerPed)
    Scene(playerPed, 'mini@prostitutes@sexnorm_veh', 'proposition_loop_prostitute', 'proposition_to_bj_p1_prostitute', 'proposition_to_bj_p2_prostitute', 'bj_loop_prostitute')
end
local function Anim_V05_A_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexnorm_veh', 'bj_to_proposition_p1_male', 'bj_to_proposition_p2_p2_male')
end
local function Anim_V05_B_2(playerPed)
    SceneExit(playerPed, 'mini@prostitutes@sexnorm_veh', 'bj_to_proposition_p1_prostitute', 'bj_to_proposition_p2_prostitute')
end
local function Anim_V06(playerPed, p1)
    Citizen.CreateThread(function()
        local animDict = 'oddjobs@assassinate@vice@sex'
        local suffix   = (p1 == true and 'm' or 'f')
        LoadAnimDict(animDict)
        local animName = 'frontseat_carsex_intro_'..suffix
        local duration = GetDuration(animDict, animName)
        PlayAnim(playerPed, animDict, animName)
        Wait(duration-350)
        PlayAnim(playerPed, animDict, 'frontseat_carsex_loop_'..suffix)
    end)
end
local function Anim_V06_2(playerPed, p1)
    local animDict = 'oddjobs@assassinate@vice@sex'
    local suffix   = (p1 == true and 'm' or 'f')
    local animName = 'frontseat_carsex_normal_outro_'..suffix
    local duration = GetDuration(animDict, animName)
    PlayAnim(playerPed, animDict, 'frontseat_carsex_normal_outro_'..suffix, -1, 0)
    UnloadAnimDict(animDict)
    Wait(duration)
end
_ANIM[1] = {
    label  = _s('anim_01', '[1]'),
    flags  = {adjustHeading = true, removeCollision = true},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_pimp'}, anim = Anim_01},
    target = {data = {dict = 'mini@prostitutes@sexlow_veh', anim = 'low_car_sex_loop_female'}, anim = function(p) Anim(p, 'mini@prostitutes@sexlow_veh', 'low_car_sex_loop_female', -1, 47) end, attach = {bone = 9816, offset = vector3(0.73, 0.26, -0.27), rotation = vector3(60.0, 90.0, 60.0)}}
}
_ANIM[2] = {
    label  = _s('anim_01', '[2]'),
    flags  = {adjustHeading = true, removeCollision = true},
    source = {data = {dict = 'mini@prostitutes@sexlow_veh', anim = 'low_car_sex_loop_female'}, anim = function(p) Anim(p, 'mini@prostitutes@sexlow_veh', 'low_car_sex_loop_female', -1, 47) end, attach = {bone = 9816, offset = vector3(0.73, 0.26, -0.27), rotation = vector3(60.0, 90.0, 60.0)}},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_pimp'}, anim = Anim_01}
}
_ANIM[3] = {
    label  = _s('anim_02', '[1]'),
    flags  = {removeCollision = true},
    source = {data = {dict = 'rcmpaparazzo_2', anim = 'shag_loop_a'}, anim = function(p) Anim(p, 'rcmpaparazzo_2', 'shag_loop_a') end},
    target = {data = {dict = 'rcmpaparazzo_2', anim = 'shag_loop_poppy'}, anim = function(p) Anim(p, 'rcmpaparazzo_2', 'shag_loop_poppy') end, attach = {bone = 9816, offset = vector3(0.015, 0.35, 0.0), rotation = vector3(0.9, 0.3, 0.0)}}
}
_ANIM[4] = {
    label  = _s('anim_02', '[2]'),
    flags  = {removeCollision = true},
    source = {data = {dict = 'rcmpaparazzo_2', anim = 'shag_loop_poppy'}, anim = function(p) Anim(p, 'rcmpaparazzo_2', 'shag_loop_poppy') end, attach = {bone = 9816, offset = vector3(0.015, 0.35, 0.0), rotation = vector3(0.9, 0.3, 0.0)}},
    target = {data = {dict = 'rcmpaparazzo_2', anim = 'shag_loop_a'}, anim = function(p) Anim(p, 'rcmpaparazzo_2', 'shag_loop_a') end}
}
_ANIM[5] = {
    label  = _s('anim_03', '[1]'),
    flags  = {adjustHeading = true, freezePos = true, removeCollision = true, forceLoop = 30},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'pimpsex_punter'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'pimpsex_punter', 32000) end},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'pimpsex_hooker'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'pimpsex_hooker', 32000) end, fixpos = {offset = vector3(0.0, 0.6, 0.0)}}
}
_ANIM[6] = {
    label  = _s('anim_03', '[2]'),
    flags  = {adjustHeading = true, freezePos = true, removeCollision = true, forceLoop = 30},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'pimpsex_hooker'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'pimpsex_hooker', 32000) end, fixpos = {offset = vector3(0.0, 0.6, 0.0)}},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'pimpsex_punter'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'pimpsex_punter', 32000) end}
}
_ANIM[7] = {
    label  = _s('anim_04', '[1]'),
    flags  = {adjustHeading = true, freezePos = true, removeCollision = true, forceLoop = 30},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_pimp'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'shagloop_pimp', 32000) end},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'pimpsex_hooker'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'pimpsex_hooker', 32000) end, fixpos = {offset = vector3(0.0, 0.6, 0.0)}}
}
_ANIM[8] = {
    label  = _s('anim_04', '[2]'),
    flags  = {adjustHeading = true, freezePos = true, removeCollision = true, forceLoop = 30},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'pimpsex_hooker'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'pimpsex_hooker', 32000) end, fixpos = {offset = vector3(0.0, 0.6, 0.0)}},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_pimp'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'shagloop_pimp', 32000) end}
}
_ANIM[9] = {
    label  = _s('anim_05', '[2]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_m'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_m') end, fixpos = {offset = vector3(0.0, 0.0, -0.85)}},
    target = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_f'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_f') end, attach = {bone = 0x2E28, offset = vector3(0.77, -0.04, 0.0), rotation = vector3(0.0, 0.0, 0.0)}}
}
_ANIM[10] = {
    label  = _s('anim_05', '[2]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_f'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_f') end, attach = {bone = 0x2E28, offset = vector3(0.77, -0.04, 0.0), rotation = vector3(0.0, 0.0, 0.0)}},
    target = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_m'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_m') end, fixpos = {offset = vector3(0.0, 0.0, -0.85)}}
}
_ANIM[11] = {
    label  = _s('anim_06', '[1]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_m'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_m') end, fixpos = {offset = vector3(0.0, 0.0, -0.85)}},
    target = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_f'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_f') end, attach = {bone = 0xE0FD, offset = vector3(-0.6, 0.25, 0.03), rotation = vector3(0.0, 0.0, 180.0), vertex = 1}}
}
_ANIM[12] = {
    label  = _s('anim_06', '[2]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_f'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_f') end, attach = {bone = 0xE0FD, offset = vector3(-0.6, 0.25, 0.03), rotation = vector3(0.0, 0.0, 180.0), vertex = 1}},
    target = {data = {dict = 'oddjobs@assassinate@vice@sex', anim = 'frontseat_carsex_loop_m'}, anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_m') end, fixpos = {offset = vector3(0.0, 0.0, -0.85)}}
}
_ANIM[13] = {
    label  = _s('anim_07', '[1]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'random@drunk_driver_2', anim = 'cardrunksex_loop_m'}, anim = function(p) Anim(p, 'random@drunk_driver_2', 'cardrunksex_loop_m') end, fixpos = {offset = vector3(0.0, 0.0, -0.95)}},
    target = {data = {dict = 'random@train_tracks', anim = 'frontseat_carsex_loop_top_guy'}, anim = function(p) Anim(p, 'random@train_tracks', 'frontseat_carsex_loop_top_guy') end, attach = {bone = 0xE0FD, offset = vector3(-0.55, 1.3, 0.15), rotation = vector3(30.0, 0.0, 90.0), vertex = 1}}
}
_ANIM[14] = {
    label  = _s('anim_07', '[2]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'random@train_tracks', anim = 'frontseat_carsex_loop_top_guy'}, anim = function(p) Anim(p, 'random@train_tracks', 'frontseat_carsex_loop_top_guy') end, attach = {bone = 0xE0FD, offset = vector3(-0.55, 1.3, 0.15), rotation = vector3(30.0, 0.0, 90.0), vertex = 1}},
    target = {data = {dict = 'random@drunk_driver_2', anim = 'cardrunksex_loop_m'}, anim = function(p) Anim(p, 'random@drunk_driver_2', 'cardrunksex_loop_m') end, fixpos = {offset = vector3(0.0, 0.0, -0.95)}}
}
_ANIM[15] = {
    label  = _s('anim_08', '[1]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_pimp'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'shagloop_pimp') end},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_hooker'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'shagloop_hooker') end, attach = {bone = 0x2E28, offset = vector3(0.0, 0.32, -0.12), rotation = vector3(0.0, 0.0, 180.0)}}
}
_ANIM[16] = {
    label  = _s('anim_08', '[2]'),
    flags  = {freezePos = true, removeCollision = true},
    source = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_hooker'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'shagloop_hooker') end, attach = {bone = 0x2E28, offset = vector3(0.0, 0.32, -0.12), rotation = vector3(0.0, 0.0, 190.0)}},
    target = {data = {dict = 'misscarsteal2pimpsex', anim = 'shagloop_pimp'}, anim = function(p) Anim(p, 'misscarsteal2pimpsex', 'shagloop_pimp') end}
}
_ANIM[17] = {
    label  = _s('anim_09'),
    flags  = {isVehicleAnim = true, sourceSeat = {0, 2}},
    source = {anim = Anim_V01_A, onStop = function(p) AnimExit(p, 'random@drunk_driver_2', 'cardrunksex_outro_m') end},
    target = {anim = Anim_V01_B, onStop = function(p) AnimExit(p, 'random@drunk_driver_2', 'cardrunksex_outro_f') end}
}
_ANIM[18] = {
    label  = _s('anim_10'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = function(p) Anim(p, 'oddjobs@towing', 'm_blow_job_loop') end},
    target = {anim = function(p) Anim(p, 'oddjobs@towing', 'f_blow_job_loop') end}
}
_ANIM[19] = {
    label  = _s('anim_11'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = function(p) Anim(p, 'mini@prostitutes@sexnorm_veh', 'bj_loop_male') end},
    target = {anim = function(p) Anim(p, 'mini@prostitutes@sexnorm_veh', 'bj_loop_prostitute') end}
}
_ANIM[20] = {
    label  = _s('anim_12'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = function(p) Anim(p, 'mini@prostitutes@sexlow_veh', 'low_car_sex_loop_player') end},
    target = {anim = function(p) Anim(p, 'mini@prostitutes@sexlow_veh', 'low_car_sex_loop_female') end}
}
_ANIM[21] = {
    label  = _s('anim_13'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = function(p) Anim(p, 'mini@prostitutes@sexnorm_veh', 'sex_loop_male') end},
    target = {anim = function(p) Anim(p, 'mini@prostitutes@sexnorm_veh', 'sex_loop_prostitute') end}
}
_ANIM[22] = {
    label  = _s('anim_14'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_m') end},
    target = {anim = function(p) Anim(p, 'oddjobs@assassinate@vice@sex', 'frontseat_carsex_loop_f') end}
}
_ANIM[23] = { --
    label  = _s('anim_15'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = Anim_V02_A, onStop = Anim_V02_A_2},
    target = {anim = Anim_V02_B, onStop = Anim_V02_B_2}
}
_ANIM[24] = {
    label  = _s('anim_16'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = Anim_V03_A, onStop = Anim_V03_A_2},
    target = {anim = Anim_V03_B, onStop = Anim_V03_B_2}
}
_ANIM[25] = {
    label  = _s('anim_17'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = Anim_V04_A, onStop = Anim_V04_A_2},
    target = {anim = Anim_V04_B, onStop = Anim_V04_B_2}
}
_ANIM[26] = {
    label  = _s('anim_18'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = Anim_V05_A, onStop = Anim_V05_A_2},
    target = {anim = Anim_V05_B, onStop = Anim_V05_B_2}
}
_ANIM[27] = {
    label  = _s('anim_19'),
    flags  = {isVehicleAnim = true, sourceSeat = {-1, 1}},
    source = {anim = function(p) Anim_V06(p, true) end, onStop = function(p) Anim_V06_2(p, true) end},
    target = {anim = function(p) Anim_V06(p, false) end, onStop = function(p) Anim_V06_2(p, false) end}
}
function ANIMS:IsPlayingAnim(action)
    if action then
        return (self.active and self.action == action)
    else
        return self.active
    end
end
function ANIMS:GetCurrentAnim()
    return self.current
end
function ANIMS:HasFlag(flag)
    return CheckAnimFlag(self.action, flag)
end
function ANIMS:GetAnimTask(playerPed, isSource)
    if CheckAnimFlag(self.action, 'isVehicleAnim') then
        local vehicle = GetVehiclePedIsUsing(playerPed)
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            local seats = CheckAnimFlag(self.action, 'sourceSeat')
            local found = false
            for k,v in pairs(seats) do
                if (GetPedInVehicleSeat(vehicle, v) == playerPed) then
                    found = true
                    break
                end
            end
            isSource = found
        end
    end
    if isSource then
        return _ANIM[self.action].source
    else
        return _ANIM[self.action].target
    end
end
function ANIMS:Stop(syncOther, skipStop)
    if self.active then
        if syncOther then
            local otherPlayer = GetOrElse(self.source, self.target)
            if otherPlayer then
                TriggerServerEvent('randallfetish:syncStopAnim', GetPlayerServerId(otherPlayer), self.action)
            end
        end
        local playerPed = PlayerPedId()
        if not skipStop then
            local anim = self:GetCurrentAnim()
            if anim and anim.onStop then anim.onStop(playerPed) end
        end
        ClearPedTasks(playerPed)
        DetachPlayer(playerPed)
        if self.freeze then
            FreezeEntityPosition(playerPed, false)
        end
    end
    self.active  = false
    self.freeze  = false
    self.action  = nil
    self.current = nil
    self.source  = nil
    self.target  = nil
    self.speed   = 1.0
end
function ANIMS:Start(otherPlayer, isSource, action)
    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(otherPlayer)
    if not IsAlive(playerPed) or not PedCheck(targetPed) then
        ShowNotification(_s('anim_error'))
        return
    end
    if IsPedInAnyVehicle(playerPed, true) ~= IsPedInAnyVehicle(targetPed, true) then
        ShowNotification(_s('both_none_vehicle'))
        return
    end
    if isSource then
        self.target = otherPlayer
    else
        self.source = otherPlayer
    end
    self.action  = action
    self.current = self:GetAnimTask(playerPed, isSource)
    self.active  = true
    if self:HasFlag('removeCollision') then
        -- Citizen.CreateThread(function()
        --     while self.active do
        --         SetEntityNoCollisionEntity(playerPed, targetPed, true)
        --         Wait(0)
        --     end
        -- end)
    end
    if self:HasFlag('freezePos') then
        FreezeEntityPosition(playerPed, true)
        self.freeze = true
    end
    if self:HasFlag('adjustHeading') then
        SetPedToFacePed(playerPed, targetPed)
        Wait(150)
    end
    local fixpos = self.current.fixpos
    local attach = self.current.attach
    if fixpos then
        local offset = GetOffsetFromEntityInWorldCoords(targetPed, fixpos.offset)
        SetEntityCoordsNoOffset(playerPed, offset.x, offset.y, offset.z, GetOrElse(fixpos.invertX, false), GetOrElse(fixpos.invertY, false), GetOrElse(fixpos.invertZ, false))
    end
    if attach then
        local vertex = attach.vertex or 2
        AttachEntityToEntity(playerPed, targetPed, attach.bone, attach.offset, attach.rotation, false, false, false, (vertex ~= 2), vertex, (attach.fixed or true))
    end
    self.current.anim(playerPed)
    local forceLoop = self:HasFlag('forceLoop')
    if forceLoop then
        Citizen.CreateThread(function()
            local timer    = GetGameTimer()
            local timeout  = forceLoop
            local playAnim = self.current.anim
            while self.active do
                if GetGameTimer() > timer + timeout then
                    playAnim(playerPed)
                    timer = GetGameTimer()
                end
                Wait(1000)
            end
        end)
    end
    Citizen.CreateThread(function()
        while self.active do
            if not IsAlive(playerPed) or not PedCheck(targetPed) then
                self:Stop(false, true)
                break
            end
            Wait(500)
        end
    end)
end
function ANIMS:ChangeSpeed(increase)
    if not self.active or not self.current.data then return end
    local newSpeed = self.speed
    if increase then
        newSpeed = newSpeed + 0.1
    else
        newSpeed = newSpeed - 0.1
    end
    if newSpeed > 1.7 then
        ShowNotification(_s('max_speed_alert'))
    elseif newSpeed < 0.6 then
        ShowNotification(_s('min_speed_alert'))
    else
        self.speed = newSpeed+0.0
        local anim = self:GetCurrentAnim()
        local playerPed = PlayerPedId()
        SetEntityAnimSpeed(playerPed, anim.data.dict, anim.data.anim, self.speed)
    end
end
function REQUEST:new(action)
	if self.active then
		ShowNotification(_s('pending_request'))
		return
	end
	local closestPlayer, closestDistance = GetClosestPlayer()
	if closestPlayer == -1 or closestDistance > 1.5 then
		ShowNotification(_s('player_not_found'))
		return
	end
	self.active = true
	SetTimeout(15000, function() self.active = false end)
	self.action = action
	self.source = nil
	self.target = GetPlayerServerId(closestPlayer)
    TriggerServerEvent('randallfetish:sendRequest', self.target, action)
end
function REQUEST:receive(playerId, action)
	if self.active then
		ShowNotification(_s('pending_request_2'))
		return
	end
	local animData    = _ANIM[action]
	local otherPlayer = GetPlayerFromServerId(playerId)
	if animData == nil or otherPlayer == -1 then return end
	self.action   = action
	self.source   = playerId
	self.target   = nil
	self.active   = true
	local timeout = 15
	Citizen.CreateThread(function()
		local requestHint = _s('request_prompt', Config.Controls.Accept[1], Config.Controls.Refuse[1], animData.label)
		local acceptKey   = Config.Controls.Accept[2]
		local refuseKey   = Config.Controls.Refuse[2]
		while self.active do
			Wait(0)
			DrawScreenText(0.175, 0.8, ('%s  [~b~%s~s~]'):format(requestHint, timeout))
			if IsControlJustReleased(0, acceptKey) then
				self.active = false
				TriggerServerEvent('randallfetish:acceptRequest', self.source)
				break
			end
			if IsControlJustReleased(0, refuseKey) then
				self.active = false
				TriggerServerEvent('randallfetish:cancelRequest', self.source)
				break
			end
		end
	end)
	Citizen.CreateThread(function()
		while self.active do
			Wait(1000)
			local playerPed = PlayerPedId()
			local sourcePed = GetPlayerPed(otherPlayer)
			local cancel = false
			timeout = timeout - 1
			if timeout <= 0 or not PedCheck(playerPed) or not PedCheck(sourcePed) then
				cancel = true
			else
				local playerPos = GetEntityCoords(playerPed)
				local sourcePos = GetEntityCoords(sourcePed)
				if #(playerPos - sourcePos) > 5.0 then
					cancel = true
				end
			end
			if cancel then
				if self.active then
					self.active = false
					TriggerServerEvent('randallfetish:cancelRequest', self.source)
				end
				break
			end
		end
	end)
end
function REQUEST:refused()
	self.active = false
	self.target = nil
	ShowNotification(_s('request_refused'))
end
function REQUEST:accepted(playerId)
	local otherPlayerId = GetOrElse(self.source, self.target)
	if otherPlayerId ~= playerId then
		print('^1Player ID missmatch, cancelling animation request^7')
		return
	end
	local isSource 	  = (self.target ~= nil)
	local otherPlayer = GetPlayerFromServerId(otherPlayerId)
	if otherPlayer == -1 then
		ShowNotification(_s('anim_error'))
		return
	end
	if ANIMS:IsPlayingAnim() then
		ANIMS:Stop(true)
		Wait(1000)
	end
	ANIMS:Start(otherPlayer, isSource, self.action)
	self.active = false
end
RegisterNetEvent('randallfetish:stopAnim')
AddEventHandler('randallfetish:stopAnim', function(action)
    if not ANIMS.action or ANIMS.action ~= action then return end
    ANIMS:Stop()
end)
RegisterNetEvent('randallfetish:receiveRequest')
AddEventHandler('randallfetish:receiveRequest', function(playerId, action)
	local playerPed = PlayerPedId()
	if IsAlive(playerPed) then
		REQUEST:receive(playerId, action)
	end
end)
RegisterNetEvent('randallfetish:requestDeclined')
AddEventHandler('randallfetish:requestDeclined', function()
	REQUEST:refused()
end)
RegisterNetEvent('randallfetish:requestAccepted')
AddEventHandler('randallfetish:requestAccepted', function(playerId)
	REQUEST:accepted(playerId)
end)
RegisterCommand(Config.Command, function(source, args)
    local index = tonumber(args[1])
    if not index then
        ShowNotification(_s('invalid_command', Config.Command))
        return
    elseif not _ANIM[index] then
        ShowNotification(_s('invalid_command_2', index))
        return
    else
        local playerPed = PlayerPedId()
        if not IsAlive(playerPed) then
            ShowNotification(_s('cant_perform_dead'))
            return
        end
        if IsPedInAnyVehicle(playerPed, true) and not CheckAnimFlag(index, 'isVehicleAnim') then
            ShowNotification(_s('off_vehicle_only'))
            return
        end
    end
    REQUEST:new(index)
end)
RegisterKeyMapping('+randallsmx', _s('keymapping_hint'), 'keyboard', 'F6')
RegisterKeyMapping('+randallsmxsup', _s('keymapping_hint_3'), 'keyboard', 'PAGEUP')
RegisterKeyMapping('+randallsmxsdown', _s('keymapping_hint_4'), 'keyboard', 'PAGEDOWN')
RegisterCommand('+randallsmx', function()
    if ANIMS:IsPlayingAnim() then ANIMS:Stop(true) end
end)
RegisterCommand('+randallsmxsup', function() ANIMS:ChangeSpeed(true) end)
RegisterCommand('+randallsmxsdown', function() ANIMS:ChangeSpeed(false) end)
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if ANIMS.active then
            local playerPed = PlayerPedId()
            local newCoords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, 1.0)
            DetachPlayer(playerPed)
            FreezeEntityPosition(playerPed, false)
            SetEntityCoordsNoOffset(playerPed, newCoords.x, newCoords.y, newCoords.z, false, false, false)
            ClearPedTasksImmediately(playerPed)
        end
    end
end)
