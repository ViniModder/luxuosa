------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local SLEEP_TIME = 1000
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for org in pairs(Config) do
            local coords = Config[org].coords
            local dist = #(pedCoords - coords)

            if dist <= 15.0 then
                SLEEP_TIME = 0

                DrawText3D(coords[1],coords[2],coords[3] + 0.5,'[~p~E~w~] - Interfone')
                DrawMarker(32,coords[1] + 0.1,coords[2],coords[3],0,0,0,0,0.0,0.0,0.5,0.5,0.5,132, 109, 255, 100,0,0,0,1)
                if IsControlJustPressed(0, 38) and dist <= 1.0 then
                    SetNuiFocus(true, true)
                    SendNUIMessage({ action = 'open', info = {
                        name = org,
                        buttons = Config[org].buttons
                    } })
                end
            end
        end


        Wait( SLEEP_TIME )
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACK
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('useButton', function(data,cb)
    if Config[data.name] then
        vSERVER._useButton(data.name, data.button)
    end
end)

RegisterNUICallback('close', function(data,cb)
    SetNuiFocus(false, false)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text)) / 450
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end