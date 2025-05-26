------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local zones = {
    list = Config.Zones,
    coords = {},
    running = {},
    domined = {},
    mapBlips = {}
}

local nearestZone = {}
local ply = {
    inZone = false,
    inZoneType = {},
    inDomination = {},
    inDominationIndex
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN THREADS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local SLEEP_TIME = 1000

        local plyCoords = GetEntityCoords(PlayerPedId())

        for index in pairs(nearestZone) do
            SLEEP_TIME = 0
            DominationBlipConfig(nearestZone[index].coords, nearestZone[index].name, getOwnerZone(nearestZone[index].name))
            
            local dist = #(plyCoords - nearestZone[index].coords)
            if IsControlJustReleased(1, 51) and dist <= 3 then
                ply.inZone = false
                
                vTunnel._checkZone(index)
            end
        end

        Wait( SLEEP_TIME )
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function getOwnerZone(zone)
    return zones.domined[zone] or "Ninguem"
end

function getPlyZone()
    local plyCoords = GetEntityCoords(PlayerPedId())
    local inZone = false
    local tZone = {}
    local min = 1000.0

    if GetEntityHealth(PlayerPedId()) <= Config.minHealth then
        return inZone
    end

    for k in pairs(zones.list) do
        if zones.list[k] then
            local dist = #(zones.list[k].coords - GetEntityCoords(PlayerPedId()))
    
            if dist < min then
                min = dist

                local Zone = zones.list[k].coordsZone
                local j = #Zone
                for i = 1, #Zone do
                    if (Zone[i][2] < plyCoords.y and Zone[j][2] >= plyCoords.y or Zone[j][2] < plyCoords.y and Zone[i][2] >= plyCoords.y) then
                        if (Zone[i][1] + ( plyCoords[2] - Zone[i][2] ) / (Zone[j][2] - Zone[i][2]) * (Zone[j][1] - Zone[i][1]) < plyCoords.x) then
                            inZone = not inZone;
                            tZone = { Index = k, Name = zones.list[k].name }
                        end
                    end
                    j = i;
                end
            end

        end
    end 

    if not inZone then
        tZone = {}
    end

    return inZone,tZone.Index,tZone.Name
end

function EnterZone(index, name)
    ply.inZone = true
    ply.inZoneType = { index = index, name = name }

    vTunnel._plyEnterZone(index, name)
    Config.Lang.enterZone()
end

function LeaveZone()
    HideScoreboard()
    HideKillFeed()

    if ply.inZoneType.index and zones.running[ply.inZoneType.index] then
        vTunnel._plyLeaveZone(ply.inZoneType.index, ply.inZoneType.name)
        ply.inDomination[ply.inZoneType.index] = nil
        ply.inZone = false
        ply.inZoneType = {}
        Config.Lang.leaveZone()
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS NUI
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function SetScoreboard(data)
    SendNUIMessage({ action = "scoreboard", body = data })
end

function SetKillFeed(data)
    SendNUIMessage({ action = "killfeed", body = data })
end

function HideScoreboard()
    SendNUIMessage({ action = "hideScoreboard" })
end

function HideKillFeed()
    SendNUIMessage({ action = "hideKillFeed" })
end

function SetConfigZera()
    SendNUIMessage({ action = "config", body = Config.Nui })
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CreateBlips()
    for k in pairs(zones.list) do
        if zones.list[k] and zones.list[k].blip.display then
            zones.mapBlips[k] = AddBlipForCoord(zones.list[k].coords.x,zones.list[k].coords.y,zones.list[k].coords.z)
            SetBlipScale(zones.mapBlips[k], zones.list[k].blip.blipScale)
            SetBlipSprite(zones.mapBlips[k], zones.list[k].blip.blipId)
            SetBlipColour(zones.mapBlips[k], zones.list[k].blip.blipColor)
            SetBlipAsShortRange(zones.mapBlips[k],true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(zones.list[k].blip.blipName:format(zones.list[k].name, getOwnerZone(zones.list[k].name)))
            EndTextCommandSetBlipName(zones.mapBlips[k])
        end
    end
end

function UpdateBlips(index)
    if DoesBlipExist(zones.mapBlips[index]) then
        RemoveBlip(zones.mapBlips[index])
    end

    if zones.list[index] and zones.list[index].blip.display then
        zones.mapBlips[index] = AddBlipForCoord(zones.list[index].coords.x,zones.list[index].coords.y,zones.list[index].coords.z)
        SetBlipScale(zones.mapBlips[index], zones.list[index].blip.blipScale)
        SetBlipSprite(zones.mapBlips[index], zones.list[index].blip.blipId)
        SetBlipColour(zones.mapBlips[index], zones.list[index].blip.blipColor)
        SetBlipAsShortRange(zones.mapBlips[index],true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(zones.list[index].blip.blipName:format(zones.list[index].name, getOwnerZone(zones.list[index].name)))
        EndTextCommandSetBlipName(zones.mapBlips[index])
    end
end

function drawPoly(index)
    local playerPed = GetPlayerPed(-1)

    if zones.list[index] then
        local Zone = zones.list[index].coordsZone
        for i = 1, #Zone do
            local zone = Zone[i]
            if i < #Zone then
                local p2 = Zone[i+1]
                showDrawPoly(zone, p2)
            end
        end
        if #Zone > 2 then
            local firstPoint = Zone[1]
            local lastPoint = Zone[#Zone]
            showDrawPoly(firstPoint, lastPoint)
        end
    end
end

function showDrawPoly(p1, p2)
    local bottomLeft = vector3(p1[1], p1[2], p1[3] - 30)
    local topLeft = vector3(p1[1], p1[2],  p1[3] + 30)
    local bottomRight = vector3(p2[1], p2[2], p2[3] - 30)
    local topRight = vector3(p2[1], p2[2], p2[3] + 30)

    DrawPoly(bottomLeft,topLeft,bottomRight, 0, 0, 0, 1000)
    DrawPoly(topLeft,topRight,bottomRight, 0, 0, 0, 1000)
    DrawPoly(bottomRight,topRight,topLeft, 0, 0, 0, 1000)
    DrawPoly(bottomRight,topLeft,bottomLeft, 0, 0, 0, 1000)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.syncZone(active, index)
    if active then
        if not zones.running[index] then
            zones.running[index] = AddBlipForRadius(zones.list[index].coords.x,zones.list[index].coords.y,zones.list[index].coords.z, 100.0)
            SetBlipColour(zones.running[index], 1)
            SetBlipAlpha(zones.running[index], 80)
            return
        end
    end    

    if zones.running[index] then
        RemoveBlip(zones.running[index])
        zones.running[index] = nil
    end

    if ply.inDomination[index] then
        ply.inDomination[index] = nil
        ply.inDominationIndex = nil
        ply.inZone = false
        ply.inZoneType = {}

        HideScoreboard()
        HideKillFeed()
    end
end

function RegisterTunnel.updateScoreboard(index, data)
    ply.inDomination[index] = true
    ply.inDominationIndex = index

    if ply.inDomination[index] then
        SetScoreboard({ scoreboard = data, maxPoints = zones.list[index].dominationConfig.totalPoints, zone = zones.list[index].name })
    end
end

function RegisterTunnel.hideScoreboard(index)
    if ply.inDomination[index] then
        ply.inDomination[index] = nil
        ply.inDominationIndex = nil
    end

    HideScoreboard()
end

function RegisterTunnel.syncOwnerZone(index, owner)
    if zones.list[index] and zones.list[index].name then
        zones.domined[zones.list[index].name] = owner
    end

    UpdateBlips(index)
    if nearestZone[index] then
        nearestZone[index] = nil
    end
end

function RegisterTunnel.syncAllOwnerZone(list)
    for index,org in pairs(list) do
        if zones.list[index] and zones.list[index].name then
            zones.domined[zones.list[index].name] = org
        end

        UpdateBlips(index)
        if nearestZone[index] then
            nearestZone[index] = nil
        end
    end
end

function RegisterTunnel.syncAllZonesOwner(dominedZones)
    for index in pairs(dominedZones) do
        if zones.list[index] and zones.list[index].name then
            zones.domined[zones.list[index].name] = dominedZones[index]
        end
        UpdateBlips(index)

        if nearestZone[index] then
            nearestZone[index] = nil
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    local weapon_classes = { [1950175060] = "Pistola", [1788949567] = "Metralhadora", [1820140472] = "Smg", [218444191] = "Fuzil", [1285032059] = "Sniper", [-1878508229] = "Shotgun", }
    local DelayNotify = GetGameTimer()

    while true do
        local SLEEP_TIME = 1000
        local result,index,name = getPlyZone()
        if result then
            local plyPed = PlayerPedId()
            if zones.running[index] then
                if not ply.inZone then
                    EnterZone(index, name)
                end

                local avaliableWeapons = zones.list[index].avaliableWeapons
                local weaponSelected = GetSelectedPedWeapon(plyPed)

                if weapon_classes[GetPedAmmoTypeFromWeapon(plyPed, weaponSelected)] then
                    if not avaliableWeapons[weapon_classes[GetPedAmmoTypeFromWeapon(plyPed, weaponSelected)] ] then
                        SetCurrentPedWeapon(plyPed, GetHashKey("WEAPON_UNARMED"), true)

                        local weapon_list = ""
                        for k in pairs(avaliableWeapons) do
                            if avaliableWeapons[k] then
                                weapon_list = weapon_list..k..","
                            end
                        end

                        
                        if (DelayNotify - GetGameTimer() < 0) then
                            DelayNotify = (GetGameTimer() + 2000)
                            
                            if not IsPedSittingInAnyVehicle(plyPed) then
                                Config.Lang.NoPermitWeapon(weapon_list)
                            end
                        end
                    end
                end

                if not zones.list[index].dominationConfig.vehicles then
                    if IsPedSittingInAnyVehicle(plyPed) then
                        local plyVehicle = GetVehiclePedIsIn(plyPed)
                        if plyVehicle > 0 then
                            SetEntityVelocity(plyVehicle, 0.0,0.0,0.0)
                            TaskLeaveVehicle(plyPed,plyVehicle,4160)

                            if (DelayNotify - GetGameTimer()) < 0 then
                                DelayNotify = (GetGameTimer() + 2000)
                                Config.Lang.NoPermitVehicles()
                            end
                        end
                    end
                end
                
            end
        end

        if (not result and ply.inZone) then
            LeaveZone()
        end

        Wait( SLEEP_TIME )
    end
end)

CreateThread(function()
    while true do
        local SLEEP_TIME = 1000
        for k in pairs(zones.running) do
            if zones.running[k] then
                local distance = #(zones.list[k].coords - GetEntityCoords(PlayerPedId()))
                if distance <= 800.0 then
                    SLEEP_TIME = 0
                    drawPoly(k)
                end
            end
        end

        Wait( SLEEP_TIME )
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS THREADS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local SLEEP_TIME = 1000
        local plyCoords = GetEntityCoords(PlayerPedId())

        for i = 1, #zones.coords do
            if #(plyCoords - zones.coords[i].coords) <= 10.0 then
                nearestZone[i] = zones.list[zones.coords[i].index]
            elseif nearestZone[i] then
                nearestZone[i] = nil
            end
        end

        Wait( SLEEP_TIME )
    end
end)

CreateThread(function()
    CreateBlips()

    for k in pairs(zones.list) do
        zones.coords[#zones.coords + 1] = { index = k, zone = zones.list[k].name, coords = zones.list[k].coords }
    end

    SetTimeout(500, function()
        SetConfigZera()
    end)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG THREADS THREADS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while Config.debugPoly do
        local playerPed = PlayerPedId()

        for k in pairs(zones.list) do
            if zones.list[k] then
                local Zone = zones.list[k].coordsZone
                for i = 1, #Zone do
                    local zone = Zone[i]
                    if i < #Zone then
                        local p2 = Zone[i+1]
                        showDrawPoly(zone, p2)
                    end
                end
                if #Zone > 2 then
                    local firstPoint = Zone[1]
                    local lastPoint = Zone[#Zone]
                    showDrawPoly(firstPoint, lastPoint)
                end
            end
        end

        Wait(0)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- KILL FEED
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("gameEventTriggered", function(eventName, args)
    if eventName == "CEventNetworkEntityDamage" then
        local victim = args[1]
        if IsPedAPlayer(args[1]) and victim == PlayerPedId() and ply.inZone then
            local plyHealth = GetEntityHealth(args[1])
            
            if plyHealth <= Config.minHealth then
                vTunnel._SendKillFeed({
                    zone = ply.inZoneType,
                    attacker = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[2])),
                    weapon = args[7],
                })
            end
        end
    end
end)

function RegisterTunnel.SyncKillFeed(data)
    SetKillFeed(data)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE MODE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local CreateZone = {
    inCreate = false,
    Zones = {}
}

function RegisterTunnel.openCreateMode()
    CreateZone:Init()
end

function CreateZone:Init()
    self.inCreate = true

    CreateThread(function()
        while self.inCreate do
            local plyId = PlayerPedId()
            local plyCoords = GetEntityCoords(plyId)

            drawTxt("~g~E~w~ PARA POSICIONAR "..#self.Zones.."º PONTO", 4, 0.10, 0.8, 0.50, 255, 255, 255, 180)
            drawTxt("~g~F~w~ PARA REMOVER ULTIMO PONTO", 4, 0.10, 0.83, 0.50, 255, 255, 255, 180)
            drawTxt("~r~BACKSPACE~w~ PARA CANCELAR.", 4, 0.10, 0.86, 0.50, 255, 255, 255, 180)
            drawTxt("~g~ENTER~w~ PARA CRIAR.", 4, 0.10, 0.89, 0.50, 255, 255, 255, 180)

            if IsControlJustPressed(0, 38) then
                self.Zones[#self.Zones + 1] = plyCoords
            end

            if IsControlJustPressed(0, 75) then
                self.Zones[#self.Zones] = nil
            end

            if IsControlJustPressed(0, 177) then
                self.inCreate = false
                self.Zones = {}

                TriggerEvent("Notify","vermelho","Você cancelou a criação da zona.")
            end

            if IsControlJustPressed(0, 201) then
                self.inCreate = false
                vTunnel._SendZone(self.Zones)

                self.Zones = {}
            end

            DebugPoly()
            Wait( 0 )
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function DebugPoly()
    if CreateZone.inCreate then
        local playerPed = GetPlayerPed(-1)
        
        local Zone = CreateZone.Zones
        local j = #Zone
        for i = 1, #Zone do
            local zone = Zone[i]
            if i < #Zone then
                local p2 = Zone[i+1]
                showDebugWall(zone, p2)
            end
        end
    end
end

function showDebugWall(p1, p2)
    local bottomLeft = vector3(p1[1], p1[2], p1[3] - 100)
    local topLeft = vector3(p1[1], p1[2], p1[3] + 100)
    local bottomRight = vector3(p2[1], p2[2], p2[3] - 100)
    local topRight = vector3(p2[1], p2[2], p2[3] + 100)

    DrawPoly(bottomLeft,topLeft,bottomRight, 0, 0, 0,1000)
    DrawPoly(topLeft,topRight,bottomRight, 0, 0, 0,1000)
    DrawPoly(bottomRight,topRight,topLeft, 0, 0, 0,1000)
    DrawPoly(bottomRight,topLeft,bottomLeft, 0, 0, 0,1000)
end