
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local DelayTimer = GetGameTimer()
local type = nil
local id = nil

local segundos = 0

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local in_rota = false
local itemRoute = ""
local direction = ''
local itemNumRoute = 0
local delay = 0
local textName = ''


formatCollect = function(table)
    local newtable = {}
    if not table.list then return {} end
    for k,v in pairs(table.list) do
        local itens = {}
        for i = 1, #v.itensList do
            itens[#itens+1] = { name = v.itensList[i].item, img = Config.images..""..v.itensList[i].item..".png", qtdMin = v.itensList[i].minAmount, qtdMax = v.itensList[i].maxAmount  }
        end
        newtable[#newtable+1] = { callPolice = v.dangerRoute.status, percentualPolice = v.dangerRoute.percentualPolice, bonus = v.dominationBonus.bonus, status = v.dominationBonus.status, qtdPoints = #Config.Locations['SUL'], parts = itens }  
    end
    return newtable
end

formatDelivery = function(table)
    local newtable = {}
    if not table.list then return {} end
    for k,v in pairs(table.list) do
        local itens = {}
        for i = 1, #v.itensList do
            itens[#itens+1] = { name = v.itensList[i].item, img = Config.images..""..v.itensList[i].item..".png", qtdMin = v.itensList[i].minAmount, qtdMax = v.itensList[i].maxAmount, payment = v.itensList[i].payment, type = v.itensList[i].type  }
        end
        newtable[#newtable+1] = { callPolice = v.dangerRoute.status, percentualPolice = v.dangerRoute.percentualPolice, qtdPoints = #Config.DeliveryLocations, parts = itens }  
    end
    return newtable
end

formatItens = function(table)
  local newtable = {}
  for k,v in pairs(table) do
    local itens = {}
    for i = 1,#v.requires do
        itens[i] = { name = v.requires[i].item, img = Config.images..""..v.requires[i].item..".png", qtdNecessary = v.requires[i].amount }
    end
    newtable[#newtable+1] = {
        name = v.item,
        id = k,
        qtd = v.amount,
        img = Config.images..""..v.item..".png",
        timer = v.itemTime,
        components = itens,
    }
  end
  return newtable
end


CreateThread(function()
    while true do
        local pedCoords = GetEntityCoords(PlayerPedId())
        local SLEEP_TIME = 1000
        for k,v in pairs(Config.Tables) do
            if not v or not v.locations then goto next_table end
            for l,w in pairs(v.locations) do
                local Coords = w.coords
                local distance = #(Coords - pedCoords)
                if not w or not w.tablePermission then goto next_table end
                if (distance <= 8.0) then 
                    SLEEP_TIME = 5
                    Config.Tables[k]['locations'][l].drawMarker(Coords, distance)
                    if (distance <= 1.5) then

                        -- VER STORAGE
                        if IsControlJustPressed(0, 38) and (DelayTimer - GetGameTimer()) <= 0 then
                            DelayTimer = (GetGameTimer() + 5000)

                            if vSERVER.checkPerm(w.tablePermission) then
                                type = k
                                id = l
                                SetNuiFocus(true,true)
                                SendNUIMessage({
                                    show = true,
                                    storeLink = Config.storeLink,
                                    itens = formatItens(v.craft),
                                    storage = vSERVER.getStorage(w.requireStorage),
                                    delivery = formatDelivery(v.delivery),
                                    collect = formatCollect(v.farm)
                                })
                            end
                        end


                    end
                end
            end

            :: next_table ::
        end

        Wait( SLEEP_TIME )
    end
end)

RegisterNUICallback('storageItem', function(data,cb)
    local request = vSERVER.storageItem(data.storedItem, type, id)
    cb(request)
end)

RegisterNUICallback('startCrafting', function(data,cb)
    local request = vSERVER.startCrafting(data.item,data.qtdSelected, type, id)
    if request then
        if segundos > 0 then
            local value = data.item.timer-segundos
            segundos = data.item.timer+value
        else
            segundos = segundos + data.item.timer
        end
        ExecuteCommand('e mexer')
        FreezeEntityPosition(PlayerPedId(), true)
    end
    cb(request)
end)

RegisterNUICallback('producedItem', function(data,cb)
    local request = vSERVER.producedItem(data.item)
    cb(request)
end)

RegisterNUICallback('storageAllItens', function(data,cb)
    local request = vSERVER.storageItemAll(type, id)
    cb(request)
end)

RegisterNUICallback('close', function(data,cb)
    SetNuiFocus(false, false)
    cb("Ok")
end)


CreateThread(function()
    while true do
        if segundos > 0 then
            if segundos == 1 then
                vRP.stopAnim(true)
                FreezeEntityPosition(PlayerPedId(), false)
            end
            segundos = segundos - 1
        end

        if delay >= 0 then
			delay = delay - 1

			if delay <= 0 then
				delay = 0
			end
		end

        Wait( 1000 )
    end
end)



RegisterNUICallback('startCollect', function(data,cb)
    if not in_rota then
		in_rota = true
		itemNumRoute = 1
		itemRoute = data.route
        direction = data.type
        textName = 'coleta'
		--exports["lotus_hud"]:setMinimapActive(true)

		CriandoBlip(itemNumRoute,direction)
        cb(true)
		async(function()
			while in_rota do
				local time = 1000
				local ped = PlayerPedId()
				local pedCoords = GetEntityCoords(ped)

					if data.type == "norte" then
						routeIndexed = Config.Locations['NORTE']
						indexedCoords = Config.Locations['NORTE'][parseInt(itemNumRoute)]
						distance = #(pedCoords - vec3(indexedCoords.x, indexedCoords.y, indexedCoords.z ))
					elseif data.type == "sul" then
						routeIndexed = Config.Locations['SUL']
						indexedCoords = Config.Locations['SUL'][parseInt(itemNumRoute)]
						distance = #(pedCoords - vec3(indexedCoords.x, indexedCoords.y, indexedCoords.z ))
					end
					if distance <= 15.0 then
						time = 5
                        DrawMarker(
                            27,
                            indexedCoords.x,
                            indexedCoords.y,
                            indexedCoords.z - 0.95,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1.5,
                            1.5,
                            1.5,
                            0,
                            38,
                            255,
                            255,
                            0,
                            0,
                            0,
                            1
                        )

						if distance <= 2.0 then
							if IsControlJustReleased(1, 51) and delay <= 0 and not IsPedInAnyVehicle(PlayerPedId()) then 
								delay = 5

								if vSERVER.giveItem(itemRoute) then
									vRP._playAnim(false,{{"pickup_object","pickup_low"}},false)
									itemNumRoute = itemNumRoute + 1
									if itemNumRoute > #routeIndexed then
										itemNumRoute = 1
									end
									RemoveBlip(blips)
									CriandoBlip(itemNumRoute, direction)
								end
							end
						end
					end
				-- end

				Citizen.Wait(time)
			end
		end)
	end
end)

RegisterNUICallback('startDelivery', function(data,cb)
    if not in_rota then
		in_rota = true
		itemNumRoute = 1
		itemRoute = data.route
        direction = 'delivery'
		--exports["lotus_hud"]:setMinimapActive(true)
        textName = 'entrega'
		CriandoBlip(itemNumRoute,direction)
        cb(true)
		async(function()
			while in_rota do
				local time = 1000
				local ped = PlayerPedId()
				local pedCoords = GetEntityCoords(ped)

                routeIndexed = Config.DeliveryLocations
                indexedCoords = Config.DeliveryLocations[parseInt(itemNumRoute)]
                distance = #(pedCoords - vec3(indexedCoords.x, indexedCoords.y, indexedCoords.z ))

					

					if distance <= 15.0 then
						time = 5
						DrawMarker(25,indexedCoords.x, indexedCoords.y, indexedCoords.z-0.9,0,0,0,0,180.0,130.0,1.0,1.0,0.5, 255,255,204,180 ,1,0,0,1)

						if distance <= 2.0 then
							if IsControlJustReleased(1, 51) and delay <= 0 and not IsPedInAnyVehicle(PlayerPedId()) then 
								delay = 5

								if vSERVER.sellItem(itemRoute) then
									vRP._playAnim(false,{{"pickup_object","pickup_low"}},false)
									itemNumRoute = itemNumRoute + 1
									if itemNumRoute > #routeIndexed then
										itemNumRoute = 1
									end
									RemoveBlip(blips)
									CriandoBlip(itemNumRoute, direction)
								end
							end
						end
					end
				-- end

				Citizen.Wait(time)
			end
		end)
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if in_rota then
			time = 5
			drawTxt("~w~Aperte ~r~F7~w~ se deseja finalizar a "..textName..".", 0.215,0.94)

			if IsControlJustPressed(0, 168) and not IsPedInAnyVehicle(PlayerPedId()) then
				in_rota = false
				itemRoute = ""
				itemNumRoute = 0
				RemoveBlip(blips)
			--	exports["lotus_hud"]:setMinimapActive(false)
			end
		end
		
		Citizen.Wait(time)
	end
end)


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

function CriandoBlip(selecionado,direction)
    if direction == 'delivery' then
        blips = AddBlipForCoord(Config.DeliveryLocations[parseInt(selecionado)].x,Config.DeliveryLocations[parseInt(selecionado)].y,Config.DeliveryLocations[parseInt(selecionado)].z)
        SetBlipSprite(blips,1)
        SetBlipColour(blips,50)
        SetBlipScale(blips,0.4)
        SetBlipAsShortRange(blips,false)
        SetBlipRoute(blips,true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Entrega")
        EndTextCommandSetBlipName(blips)
    else
        blips = AddBlipForCoord(Config.Locations[string.upper(direction)][parseInt(selecionado)].x,Config.Locations[string.upper(direction)][parseInt(selecionado)].y,Config.Locations[string.upper(direction)][parseInt(selecionado)].z)
        SetBlipSprite(blips,1)
        SetBlipColour(blips,50)
        SetBlipScale(blips,0.4)
        SetBlipAsShortRange(blips,false)
        SetBlipRoute(blips,true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Coleta")
        EndTextCommandSetBlipName(blips)
    end

end





