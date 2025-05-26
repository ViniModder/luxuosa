-----------------------------------------------------------------------------------------------------------------------------------------
--[ COPIAR PRESET ]----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand("ppreset",function(source,args)
    local chapeu, jaqueta, blusa, mascara, calca, maos, acessorios, sapatos, oculos, mochila, colete = ""
    local ped = PlayerPedId()
    if GetEntityHealth(ped) > 100 then
        chapeu = "chapeu "..(GetPedPropIndex(ped, 0) > 0 and GetPedPropIndex(ped, 0) or "").." "..(GetPedPropTextureIndex(ped, 0) > 0 and GetPedPropTextureIndex(ped, 0) or "")
        oculos = "oculos "..(GetPedPropIndex(ped, 0) > 0 and GetPedPropIndex(ped, 0) or "").." "..(GetPedPropTextureIndex(ped, 0) > 0 and GetPedPropTextureIndex(ped, 0) or "")
        mascara = "mascara "..GetPedDrawableVariation(ped, 1).." "..GetPedTextureVariation(ped, 1)
        maos = "maos "..GetPedDrawableVariation(ped, 3).." "..GetPedTextureVariation(ped, 3)
        calca = "calca "..GetPedDrawableVariation(ped, 4).." "..GetPedTextureVariation(ped, 4)
        mochila = "mochila "..GetPedDrawableVariation(ped, 5).." "..GetPedTextureVariation(ped, 5)
        sapatos = "sapatos "..GetPedDrawableVariation(ped, 6).." "..GetPedTextureVariation(ped, 6)
        acessorios = "acessorios "..GetPedDrawableVariation(ped, 7).." "..GetPedTextureVariation(ped, 7)
        blusa = "blusa "..GetPedDrawableVariation(ped, 8).." "..GetPedTextureVariation(ped, 8)
        colete = "colete "..GetPedDrawableVariation(ped, 9).." "..GetPedTextureVariation(ped, 9)
        jaqueta = "jaqueta "..GetPedDrawableVariation(ped, 11).." "..GetPedTextureVariation(ped, 11)
        vRP.prompt("Preset:",chapeu.."; "..mascara.."; "..jaqueta.."; "..blusa.."; "..maos.."; "..calca.."; "..sapatos.."; "..acessorios.."; "..oculos.."; "..mochila.."; "..colete)
    end
end)

local facs = {---------marac loc favelas 
    ['MOTOCLUB'] = {-1184.45,-1510.52,4.65},
    ['HELIPA'] = {-1091.32,-1534.39,4.58},
    ['GROTA'] = {1171.31,-244.56,69.08},
}

RegisterCommand("marcar",function(source,args)
    if args[1] and facs[args[1]] then
        SetWaypointOff()
        SetNewWaypoint(facs[args[1]][1], facs[args[1]][2])
        TriggerEvent('Notify', 'sucesso', 'Você marcou a localização no mapa com sucesso.', 5000)
    else
        TriggerEvent('Notify', 'negado', 'Você não especificou a organização ou ela não existe.', 5000)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETA TODOS OS CARROS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("wld:delallveh")
AddEventHandler("wld:delallveh", function ()
    local totalvehc = 0
    local notdelvehc = 0

    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then SetVehicleHasBeenOwnedByPlayer(vehicle, false) SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle)
            end
            if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
        end
        totalvehc = totalvehc + 1
    end
    local vehfrac = totalvehc
		TriggerEvent('chatMessage', 'ADMIN', {255, 0, 0}, "Foram deletados ^1"..vehfrac.."^0 veiculos do servidor.")
end)

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCDELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncdeleteped")
AddEventHandler("syncdeleteped",function(index)
	Citizen.CreateThread(function()
		if NetworkDoesNetworkIdExist(index) then
			SetPedAsNoLongerNeeded(index)
			SetEntityAsMissionEntity(index,true,true)
			local v = NetToPed(index)
			if DoesEntityExist(v) then
				PlaceObjectOnGroundProperly(v)
				SetEntityAsNoLongerNeeded(v)
				SetEntityAsMissionEntity(v,true,true)
				DeletePed(v)
			end
		end
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncarea")
AddEventHandler("syncarea",function(x,y,z)
	Citizen.CreateThread(function()
		ClearAreaOfVehicles(x,y,z,100.0,false,false,false,false,false)
		ClearAreaOfEverything(x,y,z,100.0,false,false,false,false)
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vehash")
AddEventHandler("vehash",function(vehicle)
	TriggerEvent('chatMessage',"ALERTA",{255,70,50},GetEntityModel(vehicle))
end)

function RegisterTunnel.returnHashVeh(veh)
    return GetEntityModel(veh)
end

function RegisterTunnel.getStatusVehicle()
	local veh = vRP.getNearestVehicle(3)

	return GetEntityModel(veh)
end

RegisterNetEvent("setCustom")
AddEventHandler("setCustom",function(custom)
	for k,v in pairs(custom) do
		if k ~= "pedModel" then
			local isprop, index = parse_part(k)
			if isprop then
				if v[1] < 0 then
					ClearPedProp(PlayerPedId(),index)
				else
					SetPedPropIndex(PlayerPedId(),index,v[1],v[2],v[3] or 2)
				end
			else
				SetPedComponentVariation(PlayerPedId(),index,v[1],v[2],v[3] or 2)
			end
		end
	end
end)

function parse_part(key)
	if type(key) == "string" and string.sub(key,1,1) == "p" then
		return true,tonumber(string.sub(key,2))
	else
		return false,tonumber(key)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- Blips
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local showblips = false 
RegisterNetEvent("blips:updateBlips")
 AddEventHandler("blips:updateBlips",function(update)
    blips = update
end)
RegisterNetEvent("blips:adminStart")
AddEventHandler("blips:adminStart",function()
    showblips = true
end)

Citizen.CreateThread(function()
    while true do
        if showblips then
            for k,v in pairs(blips) do
                local id = GetPlayerFromServerId(v[1])
                local ped = GetPlayerPed(id)
                if GetBlipFromEntity(ped) == 0 then
                    local blip = AddBlipForEntity(ped)
                    SetBlipSprite(blip,1)
                    SetBlipColour(blip,24)
                    SetBlipAsShortRange(blip,true)
                    SetBlipScale(blip,0.3)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString("Conectados")
                    EndTextCommandSetBlipName(blip)
                end
            end
        end
        Citizen.Wait(100)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCSDESEMPREGADOS
-----------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.SetUnemployed(plys)
	for i = 1, #plys do
		local blip = AddBlipForCoord(plys[i].x,plys[i].y,plys[i].z)
		SetBlipSprite(blip, 126)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip, 0)
		SetBlipScale(blip, 0.4)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Jogador Desempregado")
		EndTextCommandSetBlipName(blip)
		SetTimeout(60*1000,function() if DoesBlipExist(blip) then RemoveBlip(blip) end end)
		
		Wait( 5 )
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNAR VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('spawnarveiculopp')
AddEventHandler('spawnarveiculopp',function(name)
	local mhash = GetHashKey(name)
	while not HasModelLoaded(mhash) do
		RequestModel(mhash)
		Citizen.Wait(10)
	end

	if HasModelLoaded(mhash) then
		local ped = PlayerPedId()
		local nveh = CreateVehicle(mhash,GetEntityCoords(ped),GetEntityHeading(ped),true,true)
		SetVehicleNumberPlateText(nveh,188511)

		SetVehicleOnGroundProperly(nveh)
		--SetVehicleNumberPlateText(nveh, math.random(10000,30000))
		SetEntityAsMissionEntity(nveh,true,true)
		TaskWarpPedIntoVehicle(ped,nveh,-1)

		SetModelAsNoLongerNeeded(mhash)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTAR PARA O LOCAL MARCADO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('tptoway')
AddEventHandler('tptoway',function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	if IsPedInAnyVehicle(ped) then
		ped = veh
    end

	local waypointBlip = GetFirstBlipInfoId(8)
	local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))

	local ground
	local groundFound = false
	local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(ped,x,y,height,0,0,1)

		RequestCollisionAtCoord(x,y,z)
		while not HasCollisionLoadedAroundEntity(ped) do
			RequestCollisionAtCoord(x,y,z)
			Citizen.Wait(1)
		end
		Citizen.Wait(20)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if ground then
			z = z + 1.0
			groundFound = true
			break;
		end
	end

	if not groundFound then
		z = 1200
		GiveDelayedWeaponToPed(PlayerPedId(),0xFBAB5776,1,0)
	end

	RequestCollisionAtCoord(x,y,z)
	while not HasCollisionLoadedAroundEntity(ped) do
		RequestCollisionAtCoord(x,y,z)
		Citizen.Wait(1)
	end

	SetEntityCoordsNoOffset(ped,x,y,z,0,0,1)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Mensagem ao chegar perto
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread( function()
    while not firsthp do
        local coords = GetEntityCoords(PlayerPedId())
        local distance = #(coords - vector3(-2306.59,420.77,174.46))
        local distance2 = #(coords - vector3(-2304.29,482.7,174.78))
        if distance <= 20 or distance2 <= 20 and not firsthp then
            firsthp = true
            TriggerEvent('Notify','aviso','Bem vindo ao Hospital, Aguarde na recepção o atendimento do medico!',9000)         --HP CIMA
        end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread( function()
    while not firsthp do
        local coords = GetEntityCoords(PlayerPedId())
        local distance = #(coords - vector3(1149.8,-1486.4,34.69))
        local distance2 = #(coords - vector3(1148.42,-1455.08,34.68))
        if distance <= 20 or distance2 <= 20 and not firsthp then
            firsthp = true
            TriggerEvent('Notify','aviso','Bem vindo ao Hospital, Aguarde na recepção o atendimento do medico!',9000)       --HP SUL
         end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread( function()
    while not firsthp do
        local coords = GetEntityCoords(PlayerPedId())
        local distance = #(coords - vector3(202.25,-1033.31,29.37))
        local distance2 = #(coords - vector3(120.43,-1001.02,29.4))                                                 --- PRACA
		local distance3 = #(coords - vector3(198.41,-910.11,30.11))
        if distance <= 20 or distance2 <= 20 and not firsthp then
            firsthp = true
            TriggerEvent('Notify','aviso','Voce entrou em uma SafeZone!',9000)
        end
        Citizen.Wait(5000)
    end
end)

-- Citizen.CreateThread( function()
--     while not firsthp do
--         local coords = GetEntityCoords(PlayerPedId())
--         local distance = #(coords - vector3(746.96,1288.84,360.33))
--         local distance2 = #(coords - vector3(698.99,1283.77,360.32))
--         if distance <= 20 or distance2 <= 20 and not firsthp then
--             firsthp = true
--             TriggerEvent('Notify','aviso','Bem vindo a Havana RJ, Verifique seu carro na garagem, você também tem acesso ao /som ilimitado!',90000)       --SPAW PLAYER
--          end
--         Citizen.Wait(5000)
--     end
-- end)

Citizen.CreateThread( function()
    while not firsthp do
        local coords = GetEntityCoords(PlayerPedId())
        local distance = #(coords - vector3(670.3,1281.84,360.52))
        local distance2 = #(coords - vector3(685.57,1282.61,360.52))
        if distance <= 20 or distance2 <= 20 and not firsthp then
            firsthp = true
            TriggerEvent('Notify','aviso','Bem vindo a Luxuosa RJ seja um sataff,da cidade/ganhe vips',100000)       --SPAW PLAYER
         end
        Citizen.Wait(5000)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR cor
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vcolorv")
AddEventHandler("vcolorv",function(veh,r,g,b)
    if IsEntityAVehicle(veh) then
        SetVehicleCustomPrimaryColour(veh,r,g,b)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------

-- DELETAR NPCS MORTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('delnpcs')
AddEventHandler('delnpcs',function()
	local handle,ped = FindFirstPed()
	local finished = false
	repeat
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(ped),true)
		if IsPedDeadOrDying(ped) and not IsPedAPlayer(ped) and distance < 3 then
			TriggerServerEvent("trydeleteped",PedToNet(ped))
			finished = true
		end
		finished,ped = FindNextPed(handle)
	until not finished
	EndFindPed(handle)
end)

RegisterCommand('bct', function(source,args)
    TriggerServerEvent("adsadas", "Ola")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEADING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("h",function(source,args)
	TriggerEvent('chatMessage',GetEntityHeading(PlayerPedId()))
	print(GetEntityHeading(PlayerPedId()))
end)

function RegisterTunnel.myHeading()
	return GetEntityHeading(PlayerPedId())
end
 
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vehtuning")
AddEventHandler("vehtuning",function(vehicle)
	local ped = PlayerPedId()
	if IsEntityAVehicle(vehicle) then
		SetVehicleModKit(vehicle,0)
		SetVehicleWheelType(vehicle,7)
		SetVehicleMod(vehicle,0,GetNumVehicleMods(vehicle,0)-1,false)
		SetVehicleMod(vehicle,1,GetNumVehicleMods(vehicle,1)-1,false)
		SetVehicleMod(vehicle,2,GetNumVehicleMods(vehicle,2)-1,false)
		SetVehicleMod(vehicle,3,GetNumVehicleMods(vehicle,3)-1,false)
		SetVehicleMod(vehicle,4,GetNumVehicleMods(vehicle,4)-1,false)
		SetVehicleMod(vehicle,5,GetNumVehicleMods(vehicle,5)-1,false)
		SetVehicleMod(vehicle,6,GetNumVehicleMods(vehicle,6)-1,false)
		SetVehicleMod(vehicle,7,GetNumVehicleMods(vehicle,7)-1,false)
		SetVehicleMod(vehicle,8,GetNumVehicleMods(vehicle,8)-1,false)
		SetVehicleMod(vehicle,9,GetNumVehicleMods(vehicle,9)-1,false)
		SetVehicleMod(vehicle,10,GetNumVehicleMods(vehicle,10)-1,false)
		SetVehicleMod(vehicle,11,GetNumVehicleMods(vehicle,11)-1,false)
		SetVehicleMod(vehicle,12,GetNumVehicleMods(vehicle,12)-1,false)
		SetVehicleMod(vehicle,13,GetNumVehicleMods(vehicle,13)-1,false)
		SetVehicleMod(vehicle,14,16,false)
		SetVehicleMod(vehicle,15,GetNumVehicleMods(vehicle,15)-2,false)
		SetVehicleMod(vehicle,16,GetNumVehicleMods(vehicle,16)-1,false)
		ToggleVehicleMod(vehicle,17,true)
		ToggleVehicleMod(vehicle,18,true)
		ToggleVehicleMod(vehicle,19,true)
		ToggleVehicleMod(vehicle,20,true)
		ToggleVehicleMod(vehicle,21,true)
		ToggleVehicleMod(vehicle,22,true)
		SetVehicleMod(vehicle,23,1,false)
		SetVehicleMod(vehicle,24,1,false)
		SetVehicleMod(vehicle,25,GetNumVehicleMods(vehicle,25)-1,false)
		SetVehicleMod(vehicle,27,GetNumVehicleMods(vehicle,27)-1,false)
		SetVehicleMod(vehicle,28,GetNumVehicleMods(vehicle,28)-1,false)
		SetVehicleMod(vehicle,30,GetNumVehicleMods(vehicle,30)-1,false)
		SetVehicleMod(vehicle,33,GetNumVehicleMods(vehicle,33)-1,false)
		SetVehicleMod(vehicle,34,GetNumVehicleMods(vehicle,34)-1,false)
		SetVehicleMod(vehicle,35,GetNumVehicleMods(vehicle,35)-1,false)
		SetVehicleMod(vehicle,38,GetNumVehicleMods(vehicle,38)-1,true)
		SetVehicleTyreSmokeColor(vehicle,0,0,127)
		SetVehicleWindowTint(vehicle,1)
		SetVehicleTyresCanBurst(vehicle,false)
		SetVehicleNumberPlateText(vehicle,"LUXUOSA")
		SetVehicleNumberPlateTextIndex(vehicle,5)
		SetVehicleModColor_1(vehicle,4,12,0)
		SetVehicleModColor_2(vehicle,4,12)
		SetVehicleColours(vehicle,12,12)
		SetVehicleExtraColours(vehicle,70,141)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("nzk:tpall")
AddEventHandler("nzk:tpall", function(x,y,z)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), x, y, z, 0, 0, 0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("nzk:giveParachute")
AddEventHandler("nzk:giveParachute", function()
	GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- parachute
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
local dickheaddebug = false

RegisterNetEvent("NZK:ToggleDebug")
AddEventHandler("NZK:ToggleDebug",function()
	dickheaddebug = not dickheaddebug
    if dickheaddebug then
        print("Debug: Enabled")
    else
        print("Debug: Disabled")
    end
end)

local inFreeze = false
local lowGrav = false

function drawTxtS(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function GetVehicle()
    local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstVehicle()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped
           -- FreezeEntityPosition(ped, inFreeze)
	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Veh: " .. ped .. " Model: " .. GetEntityModel(ped) .. " IN CONTACT" )
	    	else
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Veh: " .. ped .. " Model: " .. GetEntityModel(ped) .. "" )
	    	end
            if lowGrav then
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+5.0)
            end
        end
        success, ped = FindNextVehicle(handle)
    until not success
    EndFindVehicle(handle)
    return rped
end

function GetObject()
    local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstObject()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if distance < 10.0 then
            distanceFrom = distance
            rped = ped
            --FreezeEntityPosition(ped, inFreeze)
	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Obj: " .. ped .. " Model: " .. GetEntityModel(ped) .. " IN CONTACT" )
	    	else
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Obj: " .. ped .. " Model: " .. GetEntityModel(ped) .. "" )
	    	end

            if lowGrav then
            	--ActivatePhysics(ped)
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+0.1)
            	FreezeEntityPosition(ped, false)
            end
        end

        success, ped = FindNextObject(handle)
    until not success
    EndFindObject(handle)
    return rped
end

function getNPC()
    local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped

	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"], "Ped: " .. ped .. " Model: " .. GetEntityModel(ped) .. " Relationship HASH: " .. GetPedRelationshipGroupHash(ped) .. " IN CONTACT" )
	    	else
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"], "Ped: " .. ped .. " Model: " .. GetEntityModel(ped) .. " Relationship HASH: " .. GetPedRelationshipGroupHash(ped) )
	    	end

            FreezeEntityPosition(ped, inFreeze)
            if lowGrav then
            	SetPedToRagdoll(ped, 511, 511, 0, 0, 0, 0)
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+0.1)
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return rped
end

function canPedBeUsed(ped)
    if ped == nil then
        return false
    end
    if ped == GetPlayerPed(-1) then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    return true
end



Citizen.CreateThread( function()

    while true do

		local time = 1000
        if dickheaddebug then
			time = 5
            local pos = GetEntityCoords(GetPlayerPed(-1))

            local forPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 1.0, 0.0)
            local backPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -1.0, 0.0)
            local LPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 1.0, 0.0, 0.0)
            local RPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -1.0, 0.0, 0.0)

            local forPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 2.0, 0.0)
            local backPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -2.0, 0.0)
            local LPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 2.0, 0.0, 0.0)
            local RPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -2.0, 0.0, 0.0)

            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
            currentStreetName = GetStreetNameFromHashKey(currentStreetHash)

            drawTxtS(0.8, 0.50, 0.4,0.4,0.30, "Heading: " .. GetEntityHeading(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.52, 0.4,0.4,0.30, "Coords: " .. pos, 55, 155, 55, 255)
            drawTxtS(0.8, 0.54, 0.4,0.4,0.30, "Attached Ent: " .. GetEntityAttachedTo(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.56, 0.4,0.4,0.30, "Health: " .. GetEntityHealth(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.58, 0.4,0.4,0.30, "H a G: " .. GetEntityHeightAboveGround(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.60, 0.4,0.4,0.30, "Model: " .. GetEntityModel(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.62, 0.4,0.4,0.30, "Speed: " .. GetEntitySpeed(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.64, 0.4,0.4,0.30, "Frame Time: " .. GetFrameTime(), 55, 155, 55, 255)
            drawTxtS(0.8, 0.66, 0.4,0.4,0.30, "Street: " .. currentStreetName, 55, 155, 55, 255)


            DrawLine(pos,forPos, 255,0,0,115)
            DrawLine(pos,backPos, 255,0,0,115)

            DrawLine(pos,LPos, 255,255,0,115)
            DrawLine(pos,RPos, 255,255,0,115)

            DrawLine(forPos,forPos2, 255,0,255,115)
            DrawLine(backPos,backPos2, 255,0,255,115)

            DrawLine(LPos,LPos2, 255,255,255,115)
            DrawLine(RPos,RPos2, 255,255,255,115)

            local nearped = getNPC()

            local veh = GetVehicle()

            local nearobj = GetObject()

            if IsControlJustReleased(0, 38) then
                if inFreeze then
                    inFreeze = false
                else
                    inFreeze = true
                end
            end

            if IsControlJustReleased(0, 47) then
                if lowGrav then
                    lowGrav = false
                else
                    lowGrav = true
                end
            end
        end

		Citizen.Wait(time)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 3D TEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.25)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

--MQCU GOD MOD 2
RegisterNetEvent("load")
AddEventHandler("load", function(index)    
    TriggerServerEvent("teste",GetEntityHealth(PlayerPedId()),LocalPlayer.state.curhealth)
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- KICKAR QUEM ENTRA SEM ID
----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("MQCU:bugado")
AddEventHandler("MQCU:bugado",function()
    TriggerServerEvent('MQCU:bugado')
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- JOGAR O JOGADOR NO CHAO
----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('derrubarwebjogador')
AddEventHandler('derrubarwebjogador',function(ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
    SetPedToRagdollWithFall(PlayerPedId(),1500,2000,0,ForwardVector,1.0,0.0,0.0,0.0,0.0,0.0,0.0)
    
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- CAR SEAT
----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('SetarDentroDocarro')
AddEventHandler('SetarDentroDocarro', function()
    local ped = PlayerPedId()
    local ncarro = vRP.getNearestVehicle(15)
    if IsVehicleSeatFree(ncarro, -1) then
        SetPedIntoVehicle(ped, ncarro, -1)
    else
        SetPedIntoVehicle(ped, ncarro, -2)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
local cone = nil
RegisterNetEvent('cone')
AddEventHandler('cone',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
	local prop = "prop_mp_cone_02"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		cone = CreateObject(GetHashKey(prop),coord.x,coord.y-0.5,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(cone)
		SetModelAsNoLongerNeeded(cone)
		SetEntityAsMissionEntity(cone,true,true)
		SetEntityHeading(cone,h)
		FreezeEntityPosition(cone,true)
		SetEntityAsNoLongerNeeded(cone)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			cone = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(cone))
		end
	end
end)

RegisterNetEvent('cone:a')
AddEventHandler('cone:a',function(nome)
    local playerPed = PlayerPedId() -- Obtém o jogador
    local coord = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.0, -0.94) -- Obtém as coordenadas na frente do jogador
    local prop = "prop_mp_cone_02" -- Modelo do cone
    local h = GetEntityHeading(playerPed) -- Direção do jogador

    local cone = CreateObject(GetHashKey(prop), coord.x, coord.y, coord.z, true, true, true) -- Cria o objeto cone
    PlaceObjectOnGroundProperly(cone) -- Coloca o cone no chão corretamente
    SetModelAsNoLongerNeeded(cone) -- Marca o modelo do cone como não mais necessário
    SetEntityAsMissionEntity(cone, true, true) -- Marca o cone como uma entidade de missão
    SetEntityHeading(cone, h) -- Define a direção do cone para a mesma do jogador
    FreezeEntityPosition(cone, true) -- Congela a posição do cone
end, false)

RegisterNetEvent('barreira:b')
AddEventHandler('barreira:b',function(nome)
    local playerPed = PlayerPedId() -- Obtém o jogador
    local coord = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.0, -0.94) -- Obtém as coordenadas na frente do jogador
    local prop = "prop_mp_barrier_02b" -- Modelo do cone
    local h = GetEntityHeading(playerPed) -- Direção do jogador

    local cone = CreateObject(GetHashKey(prop), coord.x, coord.y, coord.z, true, true, true) -- Cria o objeto cone
    PlaceObjectOnGroundProperly(cone) -- Coloca o cone no chão corretamente
    SetModelAsNoLongerNeeded(cone) -- Marca o modelo do cone como não mais necessário
    SetEntityAsMissionEntity(cone, true, true) -- Marca o cone como uma entidade de missão
    SetEntityHeading(cone, h) -- Define a direção do cone para a mesma do jogador
    FreezeEntityPosition(cone, true) -- Congela a posição do cone
end, false)

RegisterNetEvent('barreira2:b')
AddEventHandler('barreira2:b',function(nome)
    local playerPed = PlayerPedId() -- Obtém o jogador
    local coord = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.0, -0.94) -- Obtém as coordenadas na frente do jogador
    local prop = "prop_mp_barrier_01b" -- Modelo do cone
    local h = GetEntityHeading(playerPed) -- Direção do jogador

    local cone = CreateObject(GetHashKey(prop), coord.x, coord.y, coord.z, true, true, true) -- Cria o objeto cone
    PlaceObjectOnGroundProperly(cone) -- Coloca o cone no chão corretamente
    SetModelAsNoLongerNeeded(cone) -- Marca o modelo do cone como não mais necessário
    SetEntityAsMissionEntity(cone, true, true) -- Marca o cone como uma entidade de missão
    SetEntityHeading(cone, h) -- Define a direção do cone para a mesma do jogador
    FreezeEntityPosition(cone, true) -- Congela a posição do cone
end, false)

RegisterNetEvent('spike:b')
AddEventHandler('spike:b',function(nome)
    local playerPed = PlayerPedId() -- Obtém o jogador
    local coord = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 1.0, -0.94) -- Obtém as coordenadas na frente do jogador
    local prop = "p_ld_stinger_s" -- Modelo do cone
    local h = GetEntityHeading(playerPed) -- Direção do jogador

    local cone = CreateObject(GetHashKey(prop), coord.x, coord.y, coord.z, true, true, true) -- Cria o objeto cone
    PlaceObjectOnGroundProperly(cone) -- Coloca o cone no chão corretamente
    SetModelAsNoLongerNeeded(cone) -- Marca o modelo do cone como não mais necessário
    SetEntityAsMissionEntity(cone, true, true) -- Marca o cone como uma entidade de missão
    SetEntityHeading(cone, h) -- Define a direção do cone para a mesma do jogador
    FreezeEntityPosition(cone, true) -- Congela a posição do cone
end, false)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
local barreira = nil
RegisterNetEvent('barreira')
AddEventHandler('barreira',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.5,-0.94)
	local prop = "prop_mp_barrier_02b"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		barreira = CreateObject(GetHashKey(prop),coord.x,coord.y-0.95,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(barreira)
		SetModelAsNoLongerNeeded(barreira)
		SetEntityAsMissionEntity(barreira,true,true)
		SetEntityHeading(barreira,h-180)
		FreezeEntityPosition(barreira,true)
		SetEntityAsNoLongerNeeded(barreira)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			barreira = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(barreira))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
local spike = nil
RegisterNetEvent('spike')
AddEventHandler('spike',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,2.5,0.0)
	local prop = "p_ld_stinger_s"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		spike = CreateObject(GetHashKey(prop),coord.x,coord.y,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(spike)
		SetModelAsNoLongerNeeded(spike)
		SetEntityAsMissionEntity(spike,true,true)
		SetEntityHeading(spike,h-180)
		FreezeEntityPosition(spike,true)
		SetEntityAsNoLongerNeeded(spike)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(spike))
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		local vcoord = GetEntityCoords(veh)
		local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
		if IsPedInAnyVehicle(PlayerPedId()) then
			time = 5
			if DoesObjectOfTypeExistAtCoords(vcoord.x,vcoord.y,vcoord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
				SetVehicleTyreBurst(veh,0,true,1000.0)
				SetVehicleTyreBurst(veh,1,true,1000.0)
				SetVehicleTyreBurst(veh,2,true,1000.0)
				SetVehicleTyreBurst(veh,3,true,1000.0)
				SetVehicleTyreBurst(veh,4,true,1000.0)
				SetVehicleTyreBurst(veh,5,true,1000.0)
				SetVehicleTyreBurst(veh,6,true,1000.0)
				SetVehicleTyreBurst(veh,7,true,1000.0)
				if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
					spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),false,false,false)
					TriggerServerEvent("trydeleteobj",ObjToNet(spike))
				end
			end
		end
		Wait(time)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- SAFE MODE
-----------------------------------------------------------------------------------------------------------------------------------------
local SafeMode = false
RegisterNetEvent('SetSafeMode', function(status)
	SafeMode = status

	if SafeMode then
		CreateThread(function()
			while SafeMode do
				local ped = PlayerPedId()
				DisableControlAction(2, 37, true) -- desabilitar roda de arma (Tab)
				DisablePlayerFiring(ped,true) -- Desativa o disparo todos juntos se, de alguma forma, ignorarem inzone Mouse Disable
				DisableControlAction(0, 106, true) -- Desative os controles do mouse no jogo
				if IsDisabledControlJustPressed(2, 37) then --se Tab for pressionado, enviar mensagem de erro
					SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true) -- se a guia for pressionada, eles serão desarmados (isso é para cobrir a falha do veículo até que eu resolva tudo)
					exports["lux_inventory"]:setinsafe(true)
					exports["carry"]:setcarregar2(true)
				end

				if IsDisabledControlJustPressed(0, 106) then --se o botão esquerdo for pressionado, enviar mensagem de erro
					SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true) -- Se eles clicarem, serão desarmados
					exports["lux_inventory"]:setinsafe(true)
					exports["carry"]:setcarregar2(true)
				end
				Wait(0)
			end
		end)
	end
end)

AddEventHandler("gameEventTriggered", function(eventName, args)
    if eventName == "CEventNetworkEntityDamage" then
		if not IsPedAPlayer(args[2]) then return end
        local victim = args[1]
        if IsPedAPlayer(args[1]) and victim == PlayerPedId() then
            local plyHealth = GetEntityHealth(victim)
            if plyHealth <= 0 then
				local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                vTunnel._SendLogKillFeed({
                    cds = vec3(x,y,z),
                    attacker = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[2])),
                    weapon = args[7],
					victim = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[1])),
                })
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CAR cor
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vcolorv")
AddEventHandler("vcolorv",function(veh,r,g,b)
    if IsEntityAVehicle(veh) then
        SetVehicleCustomPrimaryColour(veh,r,g,b)
    end
end)




function DrawTextW(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    if onScreen then
        SetTextFont(4)
        SetTextProportional(1)
        SetTextScale(0.4, 0.4)
        SetTextColour(r, g, b, 255)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


function RegisterTunnel.updateClothes(tipo,item,textura)
	local ped = PlayerPedId()

	if textura == nil then
		textura = 0
	end
	
	if tipo == "oculos" then
		SetPedPropIndex(ped, 1, item,textura,2)
	elseif tipo == "chapeu" then
		SetPedPropIndex(ped, 0, item,textura,2)
	elseif tipo == "colete" then
		SetPedComponentVariation(ped, 9,item,textura,2)
	elseif tipo == "acessorio" then
		SetPedComponentVariation(ped, 7,item,textura,2)
	elseif tipo == "sapato" then
		SetPedComponentVariation(ped, 6,item,textura,2)
	elseif tipo == "mochila" then
		SetPedComponentVariation(ped, 5,item,textura,2)
	elseif tipo == "mascara" then
		SetPedComponentVariation(ped, 1,item,textura,2)
	elseif tipo == "jaqueta" then
		SetPedComponentVariation(ped, 11,item,textura,2)
	elseif tipo == "mao" then
		SetPedComponentVariation(ped, 3,item,textura,2)
	elseif tipo == "calca" then
		SetPedComponentVariation(ped, 4,item,textura,2)
	elseif tipo == "blusa" then
		SetPedComponentVariation(ped, 8,item,textura,2)
	elseif tipo == "mochila" then
		SetPedComponentVariation(ped, 5,item,textura,2)
	end
	
end

---------------------dvall-------------------
---------------------------------------------
RegisterNetEvent('deleteVeh')
AddEventHandler('deleteVeh', function(k)
    DeleteVehicle(k)
end)