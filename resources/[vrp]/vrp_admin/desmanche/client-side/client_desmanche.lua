

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local isOpenned = false
local blips = {}
local in_rota = false
local itemRoute = ""
local itemName = ""
local bancadaName = ""
local itemAmountRoute = 0
local itemMinAmountRoute = 0
local itemMaxAmountRoute = 0
local itemNumRoute = 0
local segundos = 0


RegisterNUICallback('dev_tools', function(data, cb)
    vTunnel._DevTools()
end)



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE DESMANCHE
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local segundos2 = 0
local desmanchando = false


Citizen.CreateThread(function()
    while true do
    local time = 500
    local ped = PlayerPedId()
	local pedCoords = GetEntityCoords(ped)
		for k,v in pairs(cfg.locationsDesmanche) do
			local distance = #(pedCoords - v.coords)
			if distance <= v.range then
				if not desmanchando and not IsPedInAnyVehicle(ped) then
					time = 5

					local veh = getVehicleRadius(5)
					local coordsVehicle = GetOffsetFromEntityInWorldCoords(veh, 0.0, 0.0, 1.0)
					local distanceVeh = GetDistanceBetweenCoords(pedCoords, coordsVehicle.x,coordsVehicle.y,coordsVehicle.z,true)
					if distanceVeh <= 2.0 then
						time = 5
						DrawText3Ds2(coordsVehicle.x,coordsVehicle.y,coordsVehicle.z,"Pressione [~b~E~w~] para desmanchar esse veiculo.")
						if IsControlJustReleased(1, 51) and segundos2 <= 0 and vTunnel.checkPermission(v.permission) then
							segundos2 = 0
							local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,mModel = vRP.ModelName(5) 
							desmancharVeiculo(veh,mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,mModel)
                            exports.lux_garages:setInDesmanche(true)

						end
					end

				end
			end
		end
        Citizen.Wait(time)
    end
end)

function desmancharVeiculo(veh,mPlaca,mName,mVeh,mPortaMalas,mPrice,mLock,mModel)
    local ped = PlayerPedId()
    local time = 0
    if vTunnel.checkVehicleStatus(mPlaca,mName) then
       --  if vTunnel.checkItensD() then
            desmanchando = true
            vRP._playAnim(false,{{"mini@repair","fixing_a_player"}},true)
            async(function()
                while desmanchando do
                    Citizen.Wait(500)
                    time = time+1

                    if time == 1 then
                        TriggerEvent("progress",40,"desmanchando")
                    elseif time == 5 then
                        SetVehicleUndriveable(veh, true)
                        SetVehicleDoorsLocked(veh,2)
                        SetVehicleAlarmTimeLeft(veh,30*1000)
                    elseif time == 10 then
                        SetVehicleColours(veh, 101 , 101)
                    elseif time == 15 then
                        SetVehicleTyreBurst(veh, 0, true, 1000)
                    elseif time == 20 then
                        SetVehicleTyreBurst(veh, 1, true, 1000)
                    elseif time == 25 then
                        SetVehicleTyreBurst(veh, 4, true, 1000)
                    elseif time == 28 then
                        SetVehicleTyreBurst(veh, 5, true, 1000)
                        vRP._playAnim(false,{task="WORLD_HUMAN_WELDING"},false)
                    elseif time == 33 then

                        SetVehicleDoorBroken(veh, 0, true)
                        SetVehicleDoorBroken(veh, 2, true)
                    elseif time == 35 then
                        SetVehicleDoorBroken(veh, 1, true)
                        SetVehicleDoorBroken(veh, 3, true)

                    elseif time == 38 then
                        SetVehicleDoorBroken(veh, 4, true)
                    elseif time == 39 then
                        SetVehicleDoorBroken(veh, 5, true)
                    elseif time == 40 then
                        
                        desmanchando = false
                        time = 0
                        vTunnel.pagarDesmanche(mPlaca,mName,mPrice,VehToNet(veh))
                        exports.lux_garages:setInDesmanche(false)
                        vRP._stopAnim(false)

                    end
            
                end
            end)
       -- end
	end
end


function getVehicleRadius(radius)
	local veh
	local vehs = getVehiclesRadius(radius)
	local min = radius+0.0001
	for _veh,dist in pairs(vehs) do
		if dist < min then
			min = dist
			veh = _veh
		end
	end
	return veh
end

function getVehiclesRadius(radius)
	local r = {}
	local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)

	for _,veh in pairs(vehs) do
		local x,y,z = table.unpack(GetEntityCoords(veh,true))
		local distance = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
		if distance <= radius then
			r[veh] = distance
		end
	end
	return r
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x, y, z, text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
end


function DrawText3Ds2(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end

function drawTxt(text,x,y)
	local res_x, res_y = GetActiveScreenResolution()

	SetTextFont(4)
	SetTextScale(0.3,0.3)
	SetTextColour(255,255,255,255)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)

	if res_x >= 2000 then
		DrawText(x+0.076,y)
	else
		DrawText(x,y)
	end
end



Citizen.CreateThread(function()
	while true do
		local time = 1000
		if segundos >= 0 then
			segundos = segundos - 1

			if segundos <= 0 then
				segundos = 0
			end
		end
		Citizen.Wait(time)
	end
end)