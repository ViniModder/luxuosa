-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNNEL
-----------------------------------------------------------------------------------------------------------------------------------------
elevator = {}
Tunnel.bindInterface("complexo_elevator",elevator)
vSERVERelevator = Tunnel.getInterface("complexo_elevator")

local onMenu = false
local tipo = nil
local botoes = {}

RegisterNUICallback("elevatorClose",function(data,cb)
    SetNuiFocus(false,false)	
    SendNUIMessage({'CLOSE_NUI','elevator'})
    onMenu = false
    tipo = nil
    botoes = {}
end)

Citizen.CreateThread(function()
	while true do        
        local ped = PlayerPedId()        
        local coords = GetEntityCoords(ped)
		local idle = 1000 
        if not onMenu then
		    for i=1, #elevatorConfig.elevators.locs do
                local distance = #(coords - elevatorConfig.elevators.locs[i].coords)
				if distance <= 10 then
					idle = 4
					DrawMarker(30,elevatorConfig.elevators.locs[i].coords-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,132,109,180,90,0,0,0,1)
					if distance <= 5 then
						if IsControlJustPressed(0,38) and vSERVERelevator.hasPermission(elevatorConfig.elevators.locs[i].perm) then
                            tipo = elevatorConfig.elevators.locs[i].locais                            
                            for i=1, #elevatorConfig.elevators.andares[tipo] do
                                botoes[i] = { index = i, botao = elevatorConfig.elevators.andares[tipo][i].botao }
                            end
                            SendNUIMessage({"SHOW_NUI", "elevator"})
                            SetNuiFocus(true, true)
                        end
					end
				end
			end
		end
		Citizen.Wait(idle)
	end
end)

RegisterNUICallback("requestElevator",function(data,cb)
    cb(botoes)
end)

RegisterNUICallback("selectAndar",function(data,cb)
    local ped = PlayerPedId()
	if data ~= nil then 
		if data.index ~= nil then 
			SetNuiFocus(false,false)	
			SendNUIMessage({"CLOSE_NUI","elevator"})			
            DoScreenFadeOut(1000)
            SetTimeout(1400,function()
                SetEntityCoords(ped,elevatorConfig.elevators.andares[tipo][data.index].coords.x,elevatorConfig.elevators.andares[tipo][data.index].coords.y,elevatorConfig.elevators.andares[tipo][data.index].coords.z-0.99)
                SetEntityHeading(ped,elevatorConfig.elevators.andares[tipo][data.index].h)
                TriggerEvent("vrp_sound:source",'elevator-bell',0.5)
                DoScreenFadeIn(1000)				
				onMenu = false
				tipo = nil
				botoes = {}
            end)
		end
	end
end)