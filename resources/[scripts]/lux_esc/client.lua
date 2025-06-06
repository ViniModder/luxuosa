----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local SLEEP_TIME = 1000

        if not (IsPauseMenuActive()) then
            SLEEP_TIME = 0

            DisableControlAction(0, 200, true)
        end

        Wait( SLEEP_TIME )
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- local DelayTimer = GetGameTimer()
RegisterCommand('open_menu', function(source,args)
    -- if (not IsPauseMenuActive()) and (DelayTimer - GetGameTimer() < 0) then
    --     DelayTimer = (GetGameTimer() + 3000)

        OpenMenu()
    -- end
end)
RegisterKeyMapping("open_menu","Open Menu","keyboard","ESCAPE")

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACKS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('open', function(data, cb)
    if data.action == 'map' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_SP_PAUSE'), true)
    end

    if data.action == 'config' then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), true)
    end

    if data.action == 'update' then 
        OpenMenu()
        return
    end

    if data.action == 'daily' then
        ExecuteCommand('skins');
    end

    if data.action == 'close' then 
        RestartGame()
    end

    CloseMenu()
end)

RegisterNUICallback('close', function(data, cb)
    CloseMenu()
end)

RegisterNuiCallback('openBox',function()
    CloseMenu()
    exports.lux_box:handleShow(true)
end)

RegisterNuiCallback('openStore',function(_,cb)
    cb(Config.websiteUrl)
end)

RegisterNuiCallback('getRanking',function(_,cb)
    local rankingBox = exports.lux_box:requestRanking().rank
    local formating = {}

    for k,v in pairs(rankingBox.hours) do 
        table.insert(formating, { name = v.name, hours = v.seconds})
    end

    cb(formating)
end)    

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function OpenMenu()
    local Response = Execute.RequestMenu()

    Response.social = {}
    for index in pairs(Config.Social) do
        Response.social[index] = { url = Config.Social[index].url, image = Config.Social[index].image, status = Config.Social[index].active  }
    end

    TransitionToBlurred(500)
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "open", data = Response })
end

function CloseMenu()
    hasOpenned = false
    TransitionFromBlurred(500)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "setVisible", data = false })
end
