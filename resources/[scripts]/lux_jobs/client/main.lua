local Tunnel        <const> = module("vrp","lib/Tunnel")
local RESOURCE_NAME <const> = GetCurrentResourceName()
local Proxy         <const> = module("vrp","lib/Proxy")
local Tools         <const> = module("vrp","lib/Tools")
_G.API                      = {}
vRP                         = Proxy.getInterface("vRP")
Tunnel.bindInterface(RESOURCE_NAME,API)
Remote                     = Tunnel.getInterface(RESOURCE_NAME)


local ObjectOffsets <const> = {
    ["all"] = {
    {
        offset_z = -0.05,
        offset_y = -2.30000000000001,
        offset_x = -0.25
    },
    {
        offset_z = -0.05,
        offset_y = -1.60000000000002,
        offset_x = -0.46
    },
    {
        offset_z = -0.05,
        offset_y = -2.32000000000001,
        offset_x = 0.24
    },
    {
        offset_z = -0.05,
        offset_y = -0.23000000000001,
        offset_x = 0.09
    },
    {
        offset_z = -0.11999999999999,
        offset_y = -0.04000000000001,
        offset_x = -0.43
    },
    {
        offset_z = -0.05,
        offset_y = -1.60000000000002,
        offset_x = 0.01
    },
    {
        offset_z = -0.05,
        offset_y = -3.0,
        offset_x = 0.26
    },
    {
        offset_z = -0.05,
        offset_y = -3.0,
        offset_x = -0.25
    }
},
["Ifood"] = {
    {
        offset_x = -0.45,
        offset_y = -1.63,
        offset_z = -0.04,
    },
                    
    {
        offset_x = -0.14,
        offset_y = -0.85000000000002,
        offset_z = 0.59,
    },
                    
    {
        offset_x = -0.18,
        offset_y = -1.52,
        offset_z = -0.05,
    },
                    
    {
        offset_x = 0.17,
        offset_y = -1.75,
        offset_z = -0.17,
    },
                    
    {
        offset_x = 0.01,
        offset_y = -1.12,
        offset_z = 0.62,
    },
                    
    {
        offset_x = -0.23,
        offset_y = -1.74,
        offset_z = -0.05,
    },
                    
    {
        offset_x = -0.21,
        offset_y = -1.14,
        offset_z = 0.62,
    },
                    
}
}

local JobInfo = {
    current_job = nil,
    state = nil,
    props = {},
    current_object = nil,
    cfg = nil,
    actual_route = nil,
    previous_route = nil,
}


local function _(label, ...)
    if JobInfo.current_job then
        local str = Config.Jobs[JobInfo.current_job].labels[label] 
        local args = {...}
        if #args > 0 then
            return string.format(str, ...)
        end
        return str
    end
    return label
end

local function _n(label, ...)
    if JobInfo.current_job then
        local str = Config.Jobs[JobInfo.current_job].notify[label] 
        local args = {...}
        if #args > 0 then
            return string.format(str, ...)
        end
        return str
    end
    return label
end

local function notify(label, ...)
    TriggerEvent('Notify', 'sucesso', _n(label, ...))
end

local function isVehicleModel(vehicle, model)
    return GetEntityModel(vehicle) == model
end

function JobInfo:CreateBox(veh)
    if self.cfg.prop.model == 'none' then return 0 end
    if not HasModelLoaded(self.cfg.prop.model) then
        RequestModel(self.cfg.prop.model)
        while not HasModelLoaded(self.cfg.prop.model) do
            Wait(1)
        end
    end
    local index = ((ObjectOffsets[self.current_job]) and self.current_job or "all")
    local obj_cfg = ObjectOffsets[index][#self.props + 1]
    local coords = GetOffsetFromEntityInWorldCoords(veh,0.0,0.0,-5.0)
    local obj = CreateObject(self.cfg.prop.model,coords.x,coords.y,coords.z,true,true,true)
    SetEntityAsMissionEntity(obj,true,true)
    FreezeEntityPosition(obj,true)
    AttachEntityToEntity(obj,veh,0.0,obj_cfg.offset_x --[[x]],obj_cfg.offset_y --[[y]],obj_cfg.offset_z  --[[z]],0.0,0.0,0.0,false,false,true,false,2,true)
    return obj
end

local function searchValidVeh(job)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, true)
    if isVehicleModel(veh, Config.Jobs[job or JobInfo.current_job].vehicle) then
        return veh
    end
    return nil
end

CreateThread(function() 
    FreezeEntityPosition(PlayerPedId(), false)
    while true do
        local sleep = 1001
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        while JobInfo.current_job ~= nil do Wait(10000) end
        for k,v in pairs(Config.Jobs) do
            local distance = #(coords - v.start_pos)
            if distance < 10.0 then
                sleep = 3
                DrawMarker(27, v.start_pos.x, v.start_pos.y, v.start_pos.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 255, 0, 0, 0, 0)
                DrawText3D(v.start_pos.x, v.start_pos.y, v.start_pos.z + 0.6, _(v.labels['before_start']))
                if distance < 1.0 then
                    if IsControlJustPressed(0, 38) then
                        local last_veh = searchValidVeh(k)
                        if not last_veh then
                            TriggerEvent('Notify', 'negado', 'Você não está próxima de um veículo válido para esse emprego.')
                            goto skip
                        end

                        JobInfo.current_job = k
                        JobInfo.state = 'before_route'
                        JobInfo.cfg = v
                        TriggerEvent('Notify', 'sucesso', _n('before_route'))
                        JobInfo:Thread()
                    end
                end
            end
        end
        ::skip::
        Wait(sleep)
    end
end)

function JobInfo:Thread()
    CreateThread(function() 
        local ped = PlayerPedId()
        local ui = GetMinimapAnchor()
        local last_veh = searchValidVeh()
        if not last_veh then
            TriggerEvent('Notify', 'negado', 'Você não está próxima de um veículo válido para esse emprego.')
            JobInfo.current_job = nil
            JobInfo.state = nil
            return
        end

        if self.cfg.clothes then
            local settingsClothes = self.cfg.clothes[GetEntityModel(PlayerPedId())]

            if settingsClothes then 
                self.customization = vRP.getCustomization()
                vRP._setCustomization(settingsClothes)
            end
        end
        while JobInfo.current_job do
            local sleep = 3
            Draw2DText(ui.right_x-0.169,ui.bottom_y-0.24,1.0,1.0,0.45,"PRESSIONE ~r~F7 ~w~PARA ENCERRAR",255,255,255,150)
            if not DoesEntityExist(last_veh) then
                TriggerEvent('Notify', 'negado', 'O veículo que você estava foi <b>destrúido</b> e o emprego encerrado. Pegue novamente na garagem e recomeçe.')
                for k,v in pairs(self.props) do
                    if v > 0 then
                        DeleteEntity(v)
                    end
                end
                self:Finish()
                return
            end
            if IsControlJustPressed(0, 168) then
                for k,v in pairs(self.props) do
                    if v > 0 then
                        DeleteEntity(v)
                    end
                end
                self:Finish()
                return
            end
            ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            if JobInfo.state == 'before_route' then
                local avaliable_door = 2
                if not GetIsDoorValid(last_veh, avaliable_door) then
                    while not GetIsDoorValid(last_veh, avaliable_door) do
                        avaliable_door = avaliable_door + 1
                    end
                end
                local is_doors_open = GetVehicleDoorAngleRatio(last_veh, avaliable_door) > 0.0
                if not is_doors_open and not (IsThisModelABike(self.cfg.vehicle) or self.cfg.prop?.model == "none") then
                    Draw2DText(ui.right_x+0.20,ui.bottom_y-0.024,1.0,1.0,0.45,_("before_route",'abrir as portas'),255,255,255,215)
                    local veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'exhaust'))
                    if veh_pos.x == 0.0 then
                        veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'platelight'))
                    end
                    DrawText3D(veh_pos.x,veh_pos.y,veh_pos.z + 0.7, _('before_route', 'abrir as portas'))
                    local veh_distance = #(coords - veh_pos)
                    if veh_distance < 2.0 and IsControlJustPressed(0, 38) then
                        SetVehicleDoorOpen(last_veh, avaliable_door, false, false)
                    end
                else
                    if self.cfg.prop then
                        if not IsEntityPlayingAnim(ped, 'anim@heists@box_carry@', 'idle', 3) then
                            Draw2DText(ui.right_x-0.169,ui.bottom_y-0.26,1.0,1.0,0.45,'~y~Encomendas: ~g~'..#self.props..'~w~/~r~'..self.cfg.prop.amount..' ',255,255,255,215)
                            DrawMarker(27, self.cfg.prop.catch_pos.x, self.cfg.prop.catch_pos.y, self.cfg.prop.catch_pos - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 255, 0, 0, 0, 0)
                            DrawText3D(self.cfg.prop.catch_pos.x, self.cfg.prop.catch_pos.y, self.cfg.prop.catch_pos.z + 0.6, _('before_route', 'pegar a encomenda'))
                            if #(coords - self.cfg.prop.catch_pos) < 1.0 then
                                if IsControlJustPressed(0, 38) then
                                    FreezeEntityPosition(ped, true)
                                    vRP._playAnim(true, {"pickup_object", "pickup_low"}, false)
                                    Wait(600)
                                    vRP._CarregarObjeto(table.unpack(self.cfg.prop.carry_anim))
                                    FreezeEntityPosition(ped, false)
                                    notify('on_carry')
                                end
                            end
                        else 
                            Draw2DText(ui.right_x+0.20,ui.bottom_y-0.024,1.0,1.0,0.45,_("before_route",'colocar a encomenda'),255,255,255,215)
                            local veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'exhaust'))
                            if veh_pos.x == 0.0 then
                                veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'platelight'))
                            end
                            DrawText3D(veh_pos.x,veh_pos.y,veh_pos.z + 0.6, _('before_route', 'colocar a encomenda'))
                            if #(coords - veh_pos) < 3.0 then
                                if IsControlJustPressed(0, 38) then
                                    vRP._playAnim(true, {"pickup_object", "putdown_low"}, false)
                                    Wait(560)
                                    vRP._stopAnim(false)
                                    vRP._DeletarObjeto(false)
                                    self.props[#self.props + 1] = self:CreateBox(last_veh)
                                    if #self.props >= self.cfg.prop.amount then
                                        self.state = 'in_route'
                                        notify('completed_packages')
                                        if not avaliable_door then
                                            local avaliable_door = 2
                                            if not GetIsDoorValid(last_veh, avaliable_door) then
                                                while not GetIsDoorValid(last_veh, avaliable_door) do
                                                    avaliable_door = avaliable_door + 1
                                                end
                                            end
                                            SetVehicleDoorShut(last_veh, avaliable_door, false)
                                        else
                                            SetVehicleDoorShut(last_veh, avaliable_door, false)
                                        end
                                    else
                                        notify('remaining_packages', self.cfg.prop.amount - #self.props)
                                    end
                                end
                            end
                        end
                    end
                end
            elseif JobInfo.state == 'in_route' then
                if not self.actual_route then
                    self.actual_route = self:CreateRoute()
                end
                local route_coords = self.cfg.routes[self.actual_route.index]
                local distance = #(coords - route_coords)
                if distance < 10.0 then
                    DrawMarker(27, route_coords.x, route_coords.y, route_coords.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 255, 0, 0, 0, 0)
                    DrawText3D(route_coords.x, route_coords.y, route_coords.z + 0.83, '~g~ENTREGA')
                    if IsPedInAnyVehicle(ped, false) then
                        goto skip
                    end
                    local avaliable_door = 2
                    if not GetIsDoorValid(last_veh, avaliable_door) then
                        while not GetIsDoorValid(last_veh, avaliable_door) do
                            avaliable_door = avaliable_door + 1
                        end
                    end
                    local is_doors_open = GetVehicleDoorAngleRatio(last_veh, avaliable_door) > 0.0
                    if not is_doors_open and not (IsThisModelABike(self.cfg.vehicle) or self.cfg.prop?.model == "none") then
                        Draw2DText(ui.right_x+0.20,ui.bottom_y-0.024,1.0,1.0,0.45,_("before_route",'abrir as portas'),255,255,255,215)
                        local veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'exhaust'))
                        if veh_pos.x == 0.0 then
                            veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'platelight'))
                        end
                        DrawText3D(veh_pos.x,veh_pos.y,veh_pos.z + 0.7, _('before_route', 'abrir as portas'))
                        local veh_distance = #(coords - veh_pos)
                        if veh_distance < 2.0 and IsControlJustPressed(0, 38) then
                            SetVehicleDoorOpen(last_veh, avaliable_door, false, false)
                        end
                    else
                        Draw2DText(ui.right_x-0.169,ui.bottom_y-0.26,1.0,1.0,0.45,'~y~Encomendas: ~g~'..#self.props..'~w~/~r~'..self.cfg.prop.amount..' ',255,255,255,215)
                        if not IsEntityPlayingAnim(ped, 'anim@heists@box_carry@', 'idle', 3) then
                            Draw2DText(ui.right_x+0.10,ui.bottom_y-0.196,1.0,1.0,0.45,_("before_route",'pegar a encomenda'),255,255,255,215)
                            local veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'exhaust'))
                            if veh_pos.x == 0.0 then
                                veh_pos = GetWorldPositionOfEntityBone(last_veh, GetEntityBoneIndexByName(last_veh, 'platelight'))
                            end
                            DrawText3D(veh_pos.x,veh_pos.y,veh_pos.z + 0.6, _('before_route', 'pegar a encomenda'))
                            local veh_distance = #(coords - veh_pos)
                            if veh_distance < 2.0 and IsControlJustPressed(0, 38) then
                                vRP._playAnim(true, {"pickup_object", "pickup_low"}, false)
                                Wait(600)
                                vRP._CarregarObjeto(table.unpack(self.cfg.prop.carry_anim))
                                notify('deliver_package')
                            end
                        else
                            DrawText3D(route_coords.x, route_coords.y, route_coords.z + 0.6, _('after_route'))
                            if distance < 2.0 then
                                if IsControlJustPressed(0,38) then
                                    vRP._playAnim(true, {"pickup_object", "putdown_low"}, false)
                                    Wait(900)
                                    vRP._stopAnim(false)
                                    vRP._DeletarObjeto(false)
                                    RemoveBlip(self.actual_route.blip)
                                    self.actual_route = nil
                                    Remote._PayUser(self.current_job)
                                    if self.cfg.prop.model ~= "none" then
                                        DeleteEntity(self.props[1])
                                    end
                                    table.remove(self.props, 1)
                                    if not avaliable_door then
                                        local avaliable_door = 2
                                        if not GetIsDoorValid(last_veh, avaliable_door) then
                                            while not GetIsDoorValid(last_veh, avaliable_door) do
                                                avaliable_door = avaliable_door + 1
                                            end
                                        end
                                        SetVehicleDoorShut(last_veh, avaliable_door, false)
                                    else
                                        SetVehicleDoorShut(last_veh, avaliable_door, false)
                                    end
                                    if #self.props == 0 then
                                        TriggerEvent('Notify', 'sucesso', 'Você entregou todas as encomendas.')
                                        self:Finish()
                                        break
                                    else
                                        notify('remaining_packages', #self.props - self.cfg.prop.amount)
                                    end

                                end
                            end
                        end
                    end
                end
            end
            ::skip::
            Wait(sleep)
        end
    end)
end

function JobInfo:Finish()
    if self.actual_route and self.actual_route.blip and DoesBlipExist(self.actual_route.blip) then
        RemoveBlip(self.actual_route.blip)
    end
    self.current_job = nil
    self.state = nil
    self.props = {}
    self.current_object = nil
    self.cfg = nil
    self.actual_route = nil
    self.previous_route = nil
    if self.customization then
        vRP._setCustomization(self.customization)
    end
    vRP._stopAnim(false)
    vRP._DeletarObjeto(false)
end

function JobInfo:CreateRoute()
    local route = math.random(1, #self.cfg.routes)
    if self.previous_route then
        while route == self.previous_route.index do
            route = math.random(1, #self.cfg.routes)
        end
    end
    local blip = AddBlipForCoord(self.cfg.routes[route].x, self.cfg.routes[route].y, self.cfg.routes[route].z)
	SetBlipSprite(blip,162)
    SetBlipCoords(blip,self.cfg.routes[route].x, self.cfg.routes[route].y, self.cfg.routes[route].z)
	SetBlipColour(blip,5)
	SetBlipScale(blip,0.45)
	SetBlipAsShortRange(blip,false)
	SetBlipRoute(blip,true)
    SetBlipRouteColour(blip, 5)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entrega de Encomendas")
	EndTextCommandSetBlipName(blip)
    return {
        index = route,
        blip = blip
    }
end


---
-- Utils
---
function Draw2DText(x,y,width,height,scale,text,r,g,b,a)
    SetTextFont(4)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextDropShadow(0, 0, 0, 0, 200)
    SetTextDropShadow()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

function GetMinimapAnchor()
    local safezone = GetSafeZoneSize()
    local safezone_x = 1.0 / 20.0
    local safezone_y = 1.0 / 20.0
    local aspect_ratio = GetAspectRatio(0)
    local res_x, res_y = GetActiveScreenResolution()
    local xscale = 1.0 / res_x
    local yscale = 1.0 / res_y
    local Minimap = {}
    Minimap.width = xscale * (res_x / (4 * aspect_ratio))
    Minimap.height = yscale * (res_y / 5.674)
    Minimap.left_x = xscale * (res_x * (safezone_x * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.bottom_y = 1.0 - yscale * (res_y * (safezone_y * ((math.abs(safezone - 1.0)) * 10)))
    Minimap.right_x = Minimap.left_x + Minimap.width
    Minimap.top_y = Minimap.bottom_y - Minimap.height
    Minimap.x = Minimap.left_x
    Minimap.y = Minimap.top_y
    Minimap.xunit = xscale
    Minimap.yunit = yscale
    return Minimap
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
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

