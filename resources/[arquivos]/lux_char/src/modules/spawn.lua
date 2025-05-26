local HAS_CAM_CREATED = false 
local SELECTED        = false

RegisterNUICallback('SearchId', function(data, cb)
    local response = Remote.getSearchId(tonumber(data.id))
    if response then
        return cb({name = response, id = data.id})
    end
    cb('Não encontrado')
end)

RegisterNUICallback('IndicatePlayer', function(data, cb)
  local response = Remote.IndicatePlayer(tonumber(data.id))
  cb(true)
end)

RegisterNUICallback("hoverSpawn",function(data)
    
    if SELECTED then return end
    local id = tonumber(data.id)
    if not spawnCam then 
        spawnCam = CreateSpawnCam()
    end

    if not Config.SpawnPoints[id] then
        Config.SpawnPoints[id] = {
            coords = SelectorManager.OldCoords
        }
    end

    RequestCollisionAtCoord(Config.SpawnPoints[id].coords)
    SetEntityCoords(PlayerPedId(), Config.SpawnPoints[id].coords)

    SetEntityVisible(PlayerPedId(), false)
    ChangeSpawnCam(spawnCam,Config.SpawnPoints[id].coords + vec3(0.0,0.0,42.0))
end)

RegisterNUICallback("selectSpawn",function(data)
    SELECTED = true
    local id = tonumber(data.id)
    local timeout = 0

    if not Config.SpawnPoints[id] then
        Config.SpawnPoints[id] = {
            coords = SelectorManager.OldCoords
        }
    end

    RequestCollisionAtCoord(Config.SpawnPoints[id].coords.x+0.0001, Config.SpawnPoints[id].coords.y+0.0001, Config.SpawnPoints[id].coords.z+0.0001)
    StartPlayerTeleport(PlayerId(),Config.SpawnPoints[id].coords.x+0.0001, Config.SpawnPoints[id].coords.y+0.0001, Config.SpawnPoints[id].coords.z+0.0001, true, true, true)

    while not HasPlayerTeleportFinished(PlayerId()) or not HasCollisionLoadedAroundEntity(PlayerPedId()) do
        timeout = timeout + 5
        if timeout > 75 then 
            SetEntityCoords(PlayerPedId(), Config.SpawnPoints[id].coords.x+0.0001, Config.SpawnPoints[id].coords.y+0.0001, Config.SpawnPoints[id].coords.z+0.0001, 1,0,0,1)
            break
        end
        Wait(200)
    end

    StopPlayerTeleport(PlayerId())
    SetEntityCoords(PlayerPedId(), Config.SpawnPoints[id].coords.x+0.0001, Config.SpawnPoints[id].coords.y+0.0001, Config.SpawnPoints[id].coords.z+0.0001, 1,0,0,1)
    SetEntityInvincible(PlayerPedId(),false)
    SetEntityVisible(PlayerPedId(),true)
    FreezeEntityPosition(PlayerPedId(),false)
    SetNuiFocus(false, false)

    SendNUIMessage({
        route = "CLOSE_UI"
    })

    LocalPlayer.state:set("spawned",true,true)

    RenderScriptCams(0, 1, 2000, true, true)
    SetFocusEntity(PlayerPedId())
    SetTimeout(5000, function()
        SetEntityVisible(PlayerPedId(),true)
        Remote._spawnCharacter()
    end)
end)

local Spawns = {
    { coords = vec3(-1194.94,-1787.27,4.84) },---novo span 
    -- { coords = vec3(-1247.3, -1473.37, 4.26) },
    -- { coords = vec3(1143.82, -644.71, 56.77) },
    -- { coords = vec3(-317.77, -897.42, 31.07) },
    -- { coords = vec3(1161.25, -1521.09, 34.85) },
    -- { coords = vec3(-731.36, -1492.19, 5.0) },
    -- { coords = vec3(53.0, -1732.15, 29.3) },
    -- { coords = vec3(-769.75, 5590.88, 33.48) },
    -- { coords = vec3(2748.68, 3451.02, 56.06) }
}

local armour = 0
function SpawnPlayer(data, first, creator)
    local response = Remote.UseChar()
    if response then 
        SetNuiFocus(false, false)
        local currentTable = data

        local timeout = 0
        local x,y,z = currentTable.x,currentTable.y,currentTable.z

        if x == -1017.24 then 
            response.first_spawn = false
        elseif x == nil then
            x,y,z = 338.84,-1395.54,32.5
        end

        if x > 20000 or x < -20000 or y > 20000 or y < -20000 or z > 20000 or z < -20000 then 
            x,y, z = 338.84,-1395.54,32.5
        end

        if first then
            local coords = Spawns[math.random(#Spawns)].coords
            x,y,z = coords.x,coords.y,coords.z
            SetEntityCoords(PlayerPedId(), x+0.0001, y+0.0001, z+0.03, 1,0,0,1)
        end
        print(x,y,z)
        RequestCollisionAtCoord(PlayerPedId(),x+0.0001, y+0.0001, z+0.03)
        SetEntityCoords(PlayerPedId(), x+0.0001, y+0.0001, z+0.03, 1,0,0,1)

        while not HasPlayerTeleportFinished(PlayerId()) or not HasCollisionLoadedAroundEntity(PlayerPedId()) do
            timeout = timeout + 5
            if timeout > 75 then 
                SetEntityCoords(PlayerPedId(), x+0.0001, y+0.0001, z+0.03, 1,0,0,1)
                break
            end
            Wait(200)
        end

        RequestCollisionAtCoord(PlayerPedId(),x+0.0001, y+0.0001, z+0.03)
        SetEntityCoords(PlayerPedId(), x+0.0001, y+0.0001, z+0.03, 1,0,0,1)

        while not HasPlayerTeleportFinished(PlayerId()) or not HasCollisionLoadedAroundEntity(PlayerPedId()) do
            timeout = timeout + 5
            if timeout > 75 then 
                SetEntityCoords(PlayerPedId(), x+0.0001, y+0.0001, z+0.03, 1,0,0,1)
                break
            end
            Wait(200)
        end

        SetPedMaxHealth(PlayerPedId(), 300)
        SetEntityMaxHealth(PlayerPedId(), 300)
        SetEntityHealth(PlayerPedId(), currentTable.health or 300)
        TriggerEvent("wdwkdoaxq",currentTable.armour)
        vRP.setJogando(true)
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true)

        local timeoutModel = 0
        while (GetEntityModel(PlayerPedId()) == 225514697) do
            timeoutModel = (timeoutModel + 1)

            if timeoutModel > 20 then
                break;
            end

            Wait(1000)
        end

        if currentTable.weapons then 
            vRP.giveWeapons((type(currentTable.weapons) == "table") and currentTable.weapons or json.decode(currentTable.weapons),true)
        end
        Wait(2000)
        if not creator then
            print(json.encode(currentTable.appearance.character))
            print(json.encode(currentTable.appearance.roupas))
            vRP.setCustomization(currentTable.appearance.roupas)
            TriggerEvent('barbershop:setCustom', currentTable.appearance.character)
            TriggerEvent("vrp_tattoos:setTattoos", currentTable.appearance.tattoos)
        end
        SelectorManager:Select(response.first_spawn,vec3(x,y,z))
        Remote._setRoutingBucket(false)
    else 
        PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    end
end


local COOLDOWN_WL = 0
RegisterNUICallback("requestAllowed", function(data, cb)
    if (GetGameTimer() - COOLDOWN_WL > 2500) then
        COOLDOWN_WL = GetGameTimer();
        if Remote.requestAllowed() then
            cb(2)
        else
            cb(false)
        end
    else
        cb(false)
    end

end)

RegisterNUICallback("reedemBonus", function(data, cb)
    if Remote.reedemBonus(data.bonus) then
        cb(3)
    else
        cb(false)
    end
end)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECKS SPAWNS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
_G["CreateSelect"] = function()
    DoScreenFadeOut(100)

	local callback,data = Remote.getCharacters() 
	if callback then -- SPAWNAR
        SpawnPlayer(data, false)
	else -- CRIAR PERSONAGEM
        Wait(1000)
		Client.createCharacter()
	end
    if not callback then
        SetTimeout(100,function()
            SendNUIMessage({
                action = "SET_NIVEL",
                data = data
            })
        end)
    end
    return data
end

RegisterCommand("spawna", function()
    local callback,data = Remote.getCharacters() 
	if callback then -- SPAWNAR
        SpawnPlayer(data, false)
	else -- CRIAR PERSONAGEM
        Wait(1000)
		Client.createCharacter()
	end
end)

local UI_LOADED = false
local TRAP = 0
RegisterNUICallback("loadUi", function(_,cb)
    SendNUIMessage({
        action = "SET_CFG",
        data = {config = {
            cars = Config.Bonus,
            servers = Config.Servers
        }}
    })
    TRAP = TRAP + 1

    if TRAP >= 2 then
        return
    end

	if UI_LOADED then 
		isInCharacterMode = false 
		return
	end
	UI_LOADED = true

	cb('ok')
end)

AddEventHandler('onClientResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
		return
	end
	
	DisplayRadar(false)
	while not Remote or not UI_LOADED do Wait(50) end 

    Remote._setRoutingBucket(true)

	CreateSelect()

    ShutdownLoadingScreen()
end)


RegisterNetEvent("resetchar")
AddEventHandler("resetchar",function()
    Client.createCharacter()
end)