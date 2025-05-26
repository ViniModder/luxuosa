-------------------------------------------
---- ┳┓┏┓┏┳┓  ┏┓┏┓┳┳┓┏┓┏┓  ┏┓┏┳┓┏┓┳┓┏┓ ----
---- ┃┃┣  ┃ ━━┃┓┣┫┃┃┃┣ ┗┓━━┗┓ ┃ ┃┃┣┫┣  ----
---- ┛┗┗┛ ┻   ┗┛┛┗┛ ┗┗┛┗┛  ┗┛ ┻ ┗┛┛┗┗┛ ----
------------------------------------------- 

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","ngs_rastreador")

src = {}
Tunnel.bindInterface("ngs_rastreador",src)
vSERVER = Tunnel.getInterface("ngs_rastreador") 

local vehicleBlips = {}
local blipsActive = true

function ToggleVehicleBlips()
    blipsActive = not blipsActive
    for _, blipData in ipairs(vehicleBlips) do
        if DoesBlipExist(blipData.blip) then
            SetBlipDisplay(blipData.blip, blipsActive and 2 or 0)
        end
    end
    local status = blipsActive and "ativados" or "desativados"
    TriggerEvent("Notify", "sucesso", "O rastreador do seu veículo está " .. status .. ".")
end

RegisterCommand(Ngs.Comando, function()
    ToggleVehicleBlips()
end)

function AddVehicleBlip(veh, blipName)
    local vehicleBlip = AddBlipForEntity(veh)
    SetBlipSprite(vehicleBlip, Ngs.BlipSprite)
    SetBlipDisplay(vehicleBlip, 2)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipName)
    EndTextCommandSetBlipName(vehicleBlip)
    table.insert(vehicleBlips, {veh = veh, blip = vehicleBlip})
end

function RemoveVehicleBlip(veh)
    for i, blipData in ipairs(vehicleBlips) do
        if blipData.veh == veh then
            RemoveBlip(blipData.blip)
            table.remove(vehicleBlips, i)
            break
        end
    end
end

RegisterNetEvent('rastrear')
AddEventHandler('rastrear', function()
    local player = GetPlayerPed(-1)
    if not IsPedSittingInAnyVehicle(player) then
        local veh = vRP.getNearestVehicle(3)
        if veh then
            local vehicleModel = GetEntityModel(veh)
            local vehicleNameHash = GetLabelText(GetDisplayNameFromVehicleModel(vehicleModel))
            local vehicleName = GetLabelText(vehicleNameHash)
            local plate = GetVehicleNumberPlateText(veh)
            local blipName = vehicleName .. " - " .. plate
            if not HasVehicleBlip(veh) then
                TaskStartScenarioInPlace(player, "PROP_HUMAN_BUM_BIN", 0, true)
                Wait(3000)
                ClearPedTasks(player)
                print(string.lower(blipName))
                TriggerServerEvent('NetGames_Store', vehicleName)
                TriggerEvent('adicionarRastreador')
                AddVehicleBlip(veh, blipName)
                TriggerEvent("Notify", "sucesso", "Instalando rastreador.")
            else
                TriggerEvent("Notify", "negado", "Este veículo já possui um rastreador instalado.")
            end
        else
            TriggerEvent("Notify", "negado", "Você não está perto de um veículo.")
        end
    else
        TriggerEvent("Notify", "aviso", "Você já está instalando o rastreador.")
    end
end)


RegisterNetEvent('adicionarRastreador')
AddEventHandler('adicionarRastreador', function()
    TriggerServerEvent('vrp:Rastreador', Ngs.ItemRastreador, 1)
end)

RegisterNetEvent('adicionarRastreadorAoInventario')
AddEventHandler('adicionarRastreadorAoInventario', function()
    TriggerServerEvent('vrp:AdicionarItem', Ngs.ItemRastreador2, 1)
end)

RegisterNetEvent('removerRastreador')
AddEventHandler('removerRastreador', function()
    local player = GetPlayerPed(-1)
    local source = source
    if not IsPedSittingInAnyVehicle(player) then
        local veh = vRP.getNearestVehicle(3)
        if veh then
            local vehicleModel = GetEntityModel(veh)
            local vehicleNameHash = GetLabelText(GetDisplayNameFromVehicleModel(vehicleModel))
            local vehicleName = GetLabelText(vehicleNameHash)
            local plate = GetVehicleNumberPlateText(veh)
            local blipName = vehicleName .. " - " .. plate
            if HasVehicleBlip(veh) then
                TaskStartScenarioInPlace(player, "PROP_HUMAN_BUM_BIN", 0, true)
                Wait(3000)
                ClearPedTasks(player)
                TriggerServerEvent('NetGames_Store2', vehicleName)
                RemoveVehicleBlip(veh)
                TriggerServerEvent('devolverRastreador', source)
                TriggerEvent('adicionarRastreadorAoInventario')
                TriggerEvent("Notify", "aviso", "Rastreador removido com sucesso")
            else
                TriggerEvent("Notify", "negado", "Este veículo não possui um rastreador instalado.")
            end
        else
            TriggerEvent("Notify", "negado", "Você não está perto de um veículo.")
        end
    else
        TriggerEvent("Notify", "aviso", "Você está dentro de um veículo.")
    end
end)

function HasVehicleBlip(vehicle)
    for _, blipData in ipairs(vehicleBlips) do
        if blipData.veh == vehicle then
            return true
        end
    end
    return false
end

-------------------------------------------
---- ┳┓┏┓┏┳┓  ┏┓┏┓┳┳┓┏┓┏┓  ┏┓┏┳┓┏┓┳┓┏┓ ----
---- ┃┃┣  ┃ ━━┃┓┣┫┃┃┃┣ ┗┓━━┗┓ ┃ ┃┃┣┫┣  ----
---- ┛┗┗┛ ┻   ┗┛┛┗┛ ┗┗┛┗┛  ┗┛ ┻ ┗┛┛┗┗┛ ----
------------------------------------------- 