local Orders = {}
local StatusClass = {
    [0] = "off_bennys",
    [1] = "middle_bennys",
    [2] = "on_bennys"
}
local Mechanic = nil
_G["DashboardState"] = false
RegisterCommand("mec",function(source) 
    for k,v in pairs(Config.Shops) do 
        if Remote.HasPermission(v.perm) then 
            Mechanic = k
        end
    end

    if not Mechanic then 
        return Notify:negado("Você não tem permissão para usar este comando.")
    end

    -- if #(GetEntityCoords(PlayerPedId()) - Config.Shops[Mechanic].customerLocations[1]) > 85.0 then 
    --     return Notify:negado("Você está muito longe da sua mecanica.")
    -- end
    Orders = {}
    local plyCoords = GetEntityCoords(PlayerPedId())
    local interiorId = GetInteriorFromEntity(PlayerPedId())
    for k,v in pairs(Remote.GetOrders()) do 
        local bypass = false
        if v.mechanic ~= Mechanic then 
            goto skip
        end
        if v.src ~= nil then
            
            local distance  = GetInteriorFromEntity(GetPlayerPed(GetPlayerFromServerId(v.src))) == interiorId
            
            if v.status and v.status == 2 then
                v.status = StatusClass[2]
            end

            v.status = StatusClass[1]
                
            if distance then 
                v.status = StatusClass[1]
            else
                v.status = StatusClass[0]
            end
            
            
            local vehicle = GetVehicleByData(v.model,v.plate)
            if not vehicle then
                v.status = StatusClass[0] ---- colocar 0
            end

            if #(GetEntityCoords(vehicle) - GetEntityCoords(PlayerPedId())) > 50.0 then
                v.status = StatusClass[0]
            end

            --if distance then 
            Orders[v.user_id] = v      
        end
        ::skip::
    end
    DashboardState = true
    SendNUIMessage({
        action = "openPainel",
        orders = Orders
    })
    SetNuiFocus(true,true)
end)

RegisterNetEvent("tunning:UpdateOrders",function(orders)
    Orders = {}
    if orders then
        for k,v in pairs(orders) do 
            if v.mechanic ~= Mechanic then 
                goto skip
            end
            if v.src ~= nil then
                if v.status and v.status == 2 then
                    v.status = StatusClass[2]
                end
                v.status = StatusClass[1]
                local vehicle = GetVehicleByData(v.model,v.plate)
                if not vehicle then
                    v.status = StatusClass[0]
                end
                if #(GetEntityCoords(vehicle) - GetEntityCoords(PlayerPedId())) > 50.0 then
                    v.status = StatusClass[0]
                end
                Orders[v.user_id] = v
            end
            ::skip::
        end
    end
    SendNUIMessage({
        action = "updateOrders",
        orders = Orders
    })
end)

RegisterNUICallback("getDetails",function(data,cb)
    local user_id = tostring(data.user_id)
    if Orders[user_id] then 
        cb(Remote.ParseCart(Orders[user_id].cart, 1))
    end
end)

RegisterNUICallback("getDetails2",function(data,cb)
    local user_id = tostring(data.user_id)
    if Orders[user_id] then 
        Orders[user_id].time = getTimeCustom(Orders[user_id].cart)/1000
        cb(Orders[user_id])
    end
end)

RegisterNUICallback("cancelOrder",function(data,cb)
    Remote._CancelOrder(data.user_id)
    cb('ok')
end)

RegisterNUICallback("answerOrder",function(data,cb)
    SetNuiFocus(false,false)
    local request     = Orders[tostring(data.user_id)]
    Remote._ChangeOrderState(request, 2)
    local vehicle     = GetVehicleByData(request.model,request.plate)
    if not vehicle or #(GetEntityCoords(vehicle) - GetEntityCoords(PlayerPedId())) > 50.0 then 
        Remote._ChangeOrderState(request, 0, false)
        return Notify:Negado("O veículo não está por perto.") ---------- remover esses comentarios
    end
    local response  = Remote.AnswerOrder(request, "CHECK")
    if response.error then 
        Remote._ChangeOrderState(request, 1, false)
        Notify:Negado(response.error)
        ExecuteCommand("mec")
        return false
    end
    CreateThread(function() 
        local nearCar = false 
        local cancelReason = nil
        local initialTime = GetGameTimer()
        while (not nearCar) do 
            if not DoesEntityExist(vehicle) then
                cancelReason = "O veículo foi guardado."
                break --- descomentar dps
            end
            local plyCoords = GetEntityCoords(PlayerPedId())
            local entityCoords = GetEntityCoords(vehicle)
            local distance = #(entityCoords - plyCoords)
            if distance < 3.0 then 
                nearCar = true
            end
            local restantTime = Config.Orders.timeToFoundVehicle - (GetGameTimer() - initialTime)
            Draw2dText(0.39,0.90,1.0,1.0,0.45,"CHEGUE PERTO DO CARRO PARA ATENDER",194, 192, 192,230,true)
            Draw2dText(0.39,0.93,1.0,1.0,0.35,(("~w~Tempo Restante: %s segundos"):format(floor(restantTime/100))),255, 255, 255,195)
            Draw2dText(0.39,0.95,1.0,1.0,0.35,"~w~Distância: "..("%.2f m"):format(distance),255, 255, 255,195)
			DrawMarker(20,entityCoords+vec3(0.0,0.0,3.0),0,0,0,0,180.0,0.0,1.0,1.0,1.0,255,0,0,255,1,0,0,1)
            Wait(1)
            if restantTime == 0 then 
                cancelReason = "Tempo esgotado para chegar ao veículo."
                break
            end
        end
        if cancelReason then 
            Remote._ChangeOrderState(request, 1, true)
            Notify:negado(cancelReason)
            return
        end
        initialTime = GetGameTimer()
        ExecuteCommand("e mecanico3")
        TriggerEvent('cancelando',true)
        local time = getTimeCustom(request.cart)
        TriggerEvent("progress",time,"customizando")
        TriggerServerEvent("tunning:syncAudio",GetEntityCoords(PlayerPedId()))
        while (GetGameTimer() - initialTime) < time do 
            Wait(100)
        end
        ExecuteCommand("clear")
        TriggerEvent('cancelando',false)
        if vehicle then 
            response  = Remote.AnswerOrder(request, "EXECUTE", VehToNet(vehicle))
            TriggerServerEvent("tunning:syncApplyMods", vehicle, request.custom)
            Notify:Sucesso("Veiculo tunado com sucesso!")
            if response.error then 
                Notify:negado(response.error)
                return false
            end
        end
        cb('ok')
    end)
end)

function getTimeCustom(cart)
    time = 0
	for k,v in pairs(cart) do
		if Config.Customs[k] ~= nil and Config.Customs[k].time then
			time = Config.Customs[k].time + time
        elseif Config.Customs[k] and Config.Customs[k].time == nil then
            time = 500 + time
        elseif not Config.Customs[k] then
            time = 300 + time
		end
	end
	return time
end

function GetVehicleByData(model, plate)
    
    for _,veh in ipairs(GetGamePool("CVehicle")) do 
        if veh == model  then
            
            return veh
        end
    end
    return nil
end