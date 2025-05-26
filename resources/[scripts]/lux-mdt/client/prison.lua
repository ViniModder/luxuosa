----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE PRISAO
----------------------------------------------------------------------------------------------------------------------------------------
local nveh = nil
local pveh01 = nil
local pveh02 = nil
local Transporte = false
local chegou = false
local prisioneiro = false
local segundos = 0

function mdt.checkPrisonArea()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local _, i = GetGroundZFor_3dCoord(-1091.29, -821.44, 5.48)
    local distance = Vdist(x, y, z, -1091.29, -821.44, 5.48, i)
    if distance <= 20.0 then
        return true
    end
end

function mdt.addBlip(x,y,z,idtype,idcolor,text,scale,route)
	local blip = AddBlipForCoord(x,y,z)
	SetBlipSprite(blip,idtype)
	SetBlipAsShortRange(blip,true)
	SetBlipColour(blip,idcolor)
	SetBlipScale(blip,scale)

	if route then
		SetBlipRoute(blip,true)
	end

	if text then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(text)
		EndTextCommandSetBlipName(blip)
	end
	return blip
end

function mdt.removeBlip(id)
	RemoveBlip(id)
end

function mdt.levarPrisioneiro(prisionTime)
    if GetInvokingResource() ~= nil then
        return
    end

    local ped = PlayerPedId()

    local vhash = GetHashKey('riot')
    while not HasModelLoaded(vhash) do
        RequestModel(vhash)
        Citizen.Wait(10)
    end

    local phash = GetHashKey('mp_m_securoguard_01')
    while not HasModelLoaded(phash) do
        RequestModel(phash)
        Citizen.Wait(10)
    end

    if HasModelLoaded(vhash) then
        nveh = CreateVehicle(vhash, -1058.18, -882.74, 4.52, 250.12, true, false)
        SetVehicleNumberPlateText(nveh, vRP.getRegistrationNumber())
        pveh01 = CreatePedInsideVehicle(nveh, 27, GetHashKey('mp_m_securoguard_01'), -1, true, false)
        pveh02 = CreatePedInsideVehicle(nveh, 27, GetHashKey('mp_m_securoguard_01'), 1, true, false)

        TaskWarpPedIntoVehicle(PlayerPedId(), nveh, 2)
        SetVehicleSiren(nveh, true)

        SetEntityAsMissionEntity(nveh, true, false)
        SetEntityAsMissionEntity(pveh01, true, false)
        SetEntityAsMissionEntity(pveh02, true, false)

        SetVehicleOnGroundProperly(nveh)
        TaskVehicleDriveToCoordLongrange(pveh01, nveh, 1685.38, 2607.15, 45.1, 18.0, 2883621, 1.0)
        SetModelAsNoLongerNeeded(vhash)
        Transporte = true
        local contador = 0

        async(function()
            while Transporte do
                Citizen.Wait(1000)

                local x, y, z = table.unpack(GetEntityCoords(ped))
                local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(x, y, z))
                if street == 'Route 68' then
                    SetEntityMaxSpeed(nveh, 0.32 * 80 - 0.45)
                end

                local distancia = GetDistanceBetweenCoords(GetEntityCoords(nveh), 1685.38, 2607.15, 45.1, true)
                local vehspeed = GetEntitySpeed(nveh) * 3.6

                if not IsPedSittingInAnyVehicle(pveh01) or not IsPedSittingInAnyVehicle(ped) and not chegou then
                    SetEntityAsNoLongerNeeded(pveh01)
                    SetEntityAsNoLongerNeeded(pveh02)
                    vSERVER.colocarPrisao(prisionTime)
                    Transporte = false
                    chegou = false
                    clearPeds()
                end

                if math.ceil(vehspeed) <= 5 then
                    contador = contador + 1

                    if contador >= 10 then
                        SetEntityAsNoLongerNeeded(pveh01)
                        SetEntityAsNoLongerNeeded(pveh02)

                        vSERVER.colocarPrisao(prisionTime)
                        Transporte = false
                        chegou = false
                        clearPeds()
                        contador = 0
                    end
                end

                if distancia < 30.0 and math.ceil(vehspeed) <= 2 then
                    if IsPedSittingInAnyVehicle(ped) then
                        local veh = GetVehiclePedIsIn(ped, false)
                        TaskLeaveVehicle(ped, veh, 4160)

                        SetTimeout(
                            3000,
                            function()
                                TaskGoToCoordAnyMeans(ped, 1678.29, 2593.77, 45.57, 0.4, 0, 0, 786603, 0xbf800000)

                                TaskLeaveVehicle(pveh02, veh, 4160)
                                TaskGoToCoordAnyMeans(
                                    pveh02,
                                    1678.29,
                                    2593.77,
                                    45.57,
                                    0.4,
                                    0,
                                    0,
                                    786603,
                                    0xbf800000
                                )

                                SetEntityAsNoLongerNeeded(pveh01)
                                SetEntityAsNoLongerNeeded(pveh02)
                            end
                        )

                        chegou = true
                    end
                end

                local distanciaPrison = GetDistanceBetweenCoords(GetEntityCoords(ped), 1678.29, 2593.77, 45.57, true)
                if distanciaPrison < 3.0 then
                    vSERVER.colocarPrisao(prisionTime)
                    Transporte = false
                    chegou = false
                end
            end
        end)
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO ADM
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterNetEvent('prisaoADM',function(status)
--     prisioneiro = status
--     local ped = PlayerPedId()
--     if (not prisioneiro) then
--         return
--     end
--     SetEntityInvincible(ped, false) --mqcu
--     FreezeEntityPosition(ped, true)
--     SetEntityVisible(ped, false, false)
--     SetTimeout(10000,function()
--         SetEntityInvincible(ped, false)
--         FreezeEntityPosition(ped, false)
--         SetEntityVisible(ped, true, false)
--     end)
-- end)


function mdt.prisioneiro(status)
    if GetInvokingResource() ~= nil then
        return
    end
    prisioneiro = status
    -- DoScreenFadeOut(1000)

    Wait(1000)
    local ped = PlayerPedId()
    if prisioneiro then
        SetEntityInvincible(ped, false) --mqcu
        FreezeEntityPosition(ped, true)
        SetEntityVisible(ped, false, false)
        SetTimeout(3000,function()
            SetEntityInvincible(ped, false)
            FreezeEntityPosition(ped, false)
            SetEntityVisible(ped, true, false)
        end)
        clearPeds()
        vRP.teleport(1679.1, 2514.55, 45.55)
    end

    Wait(3500)
    DoScreenFadeIn(1000)
end

function mdt.setarRoupasPrisional()
	if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
		vRP.setCustomization(cfg.Clothes.Male)
	else
		vRP.setCustomization(cfg.Clothes.Female)
	end
end

function clearPeds()
    TriggerServerEvent('bm_module:deleteVehicles', VehToNet(nveh))
    TriggerServerEvent('trydeleteped', PedToNet(pveh01))
    TriggerServerEvent('trydeleteped', PedToNet(pveh02))
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        if prisioneiro then
            local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1717.26,2526.04,47.9, true)
            if distance >= 150 then
                SetEntityCoords(PlayerPedId(), 1717.26,2526.04,47.9)
                TriggerEvent('Notify', 'negado', 'O agente penitenciário encontrou você tentando escapar.', 5000)
            end
        end
    end
end)

local agindo = false
local reducaopenal = false
local delayServico = {}

Citizen.CreateThread(function()
    while true do
        local time = 1000
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
        if prisioneiro then
            if not agindo then
                for k,v in pairs(cfg.locations) do
                    local distance = #(pedCoords - v.coords)
                    if distance <= 15.0 then
                        time = 5
                        DrawMarker(21,v.coords[1],v.coords[2],v.coords[3]-v.minBlip,0,0,0,0,0,130.0,0.5,1.0,0.5, 0,210,0,180 ,1,0,0,1)
                        if distance <= 3.0 then
                            if IsControlJustReleased(1, 51) and segundos <= GetGameTimer() then
                                segundos = GetGameTimer()+5000
                                if delayServico[k] == nil or delayServico[k] <= GetGameTimer() then
                                    if vSERVER.checkTempoPrisao() > cfg.geral.tempoMin then
                                        iniciarServico(k, v.type, v.coords, v.heading)
                                    else
                                        TriggerEvent("Notify","sucesso","Não precisamos mais de seus serviços.", 5000)
                                    end
                                else
                                    local delay = delayServico[k]-GetGameTimer()
                                    TriggerEvent("Notify","sucesso","Você já passou por esse local aguarde <b>"..parseInt(delay/1000).." segundo(s)</b>.", 5000)
                                end
                            end
                        end
                    end
                end
            end  
        end
        
        Citizen.Wait(time)
    end
end)


function iniciarServico(id, servico, coords, heading)
    local ped = PlayerPedId()
    if ped then
        if servico == "Consertar" then
            agindo = true
            SetEntityCoords(ped, coords[1],coords[2],coords[3]-0.8)
            SetEntityHeading(ped , heading)
            vRP._playAnim(false,{task=cfg.types[servico].anim},false)

            local finished = vRP.taskBar(15000, math.random(10,15))
            if finished then
                local finished = vRP.taskBar(15000, math.random(10,15))
                if finished then
                    local finished = vRP.taskBar(15000, math.random(10,15))
                    if finished then
                        delayServico[id] = GetGameTimer()+90000
                        vRP.DeletarObjeto()
                        ClearPedTasks(GetPlayerPed(-1))
                        reduzirTempo(cfg.types[servico].reduzir)
                    end
                end
            end
            agindo = false
        end
    end
end

function reduzirTempo(tempo)
    vSERVER.reduzirPrisao(tempo)
end

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if prisioneiro then
            time = 5
			local distance01 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1691.59,2566.05,45.56,true)
			local distance02 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),1669.51,2487.71,45.82,true)

			if GetEntityHealth(PlayerPedId()) <= 101 then
				reducaopenal = false
				vRP._DeletarObjeto()
			end

			if distance01 <= 100 and not reducaopenal then
				DrawMarker(21,1691.59,2566.05,45.56,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,255,255,100,1,0,0,1)
				if distance01 <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA COLETAR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						reducaopenal = true
						ResetPedMovementClipset(PlayerPedId(),0)
						SetRunSprintMultiplierForPlayer(PlayerId(),1.0)
						vRP._CarregarObjeto("anim@heists@box_carry@","idle","hei_prop_heist_box",50,28422)
					end
				end
			end

			if distance02 <= 100 and reducaopenal then
				DrawMarker(21,1669.51,2487.71,45.82,0,0,0,0,180.0,130.0,1.0,1.0,0.5,255,255,255,100,1,0,0,1)
				if distance02 <= 1.2 then
					drawTxt("PRESSIONE  ~b~E~w~  PARA CONCLUIR",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						reducaopenal = false
						reduzirTempo(1)
						vRP._DeletarObjeto()
					end
				end
			end
		end

        Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if reducaopenal then
            time = 5
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,21,true)
			DisableControlAction(0,24,true)
			DisableControlAction(0,25,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0,75,true)
			DisableControlAction(0,22,true)
			DisableControlAction(0,32,true)
			DisableControlAction(0,268,true)
			DisableControlAction(0,33,true)
			DisableControlAction(0,269,true)
			DisableControlAction(0,34,true)
			DisableControlAction(0,270,true)
			DisableControlAction(0,35,true)
			DisableControlAction(0,271,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,177,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)
			DisableControlAction(0,29,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,246,true)
			DisableControlAction(0,303,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,188,true)
		end

        Citizen.Wait(time)
	end
end)

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
end

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
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,140)
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end