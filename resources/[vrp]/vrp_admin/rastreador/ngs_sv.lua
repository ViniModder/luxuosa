-------------------------------------------
---- ┳┓┏┓┏┳┓  ┏┓┏┓┳┳┓┏┓┏┓  ┏┓┏┳┓┏┓┳┓┏┓ ----
---- ┃┃┣  ┃ ━━┃┓┣┫┃┃┃┣ ┗┓━━┗┓ ┃ ┃┃┣┫┣  ----
---- ┛┗┗┛ ┻   ┗┛┛┗┛ ┗┗┛┗┛  ┗┛ ┻ ┗┛┛┗┗┛ ----
------------------------------------------- 

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("ngs_rastreador",src)
Proxy.addInterface("ngs_rastreador",src)

vCLIENT = Tunnel.getInterface("ngs_rastreador")





RegisterNetEvent("ngs:rastrear")
AddEventHandler("ngs:rastrear", function()
    local source = source
    local user_id = vRP.getUserId(source)
    local quantidade_rastreador = vRP.getInventoryItemAmount(user_id, "rastreador") or 0
    if quantidade_rastreador <= 0 then
        TriggerClientEvent("Notify", source, "negado", "Você não possui um rastreador para instalar.")
        return
    end

    local vehicle = vRPclient.getNearestVehicle(source, 3)

    if vehicle then
        local playerIsInVehicle = vRPclient.isInVehicle(source)
        if playerIsInVehicle then
            TriggerClientEvent("Notify", source, "negado", "Você deve estar fora do veículo para instalar o rastreador.")
        else
            if vRP.hasPermission(user_id, "perm.user") then
                RegisterServerEvent('NetGames_Store')
                AddEventHandler('NetGames_Store', function(vehicleName)
                end)
                TriggerClientEvent('rastrear', source)
            else
                TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para executar esta ação.")
            end
        end
    end
end)

RegisterNetEvent("remover:Rastreador")
AddEventHandler("remover:Rastreador", function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id, Ngs.ItemChave) then
            local vehicle = vRPclient.getNearestVehicle(source, 3)

            if vehicle then
                if vRP.hasPermission(user_id, "perm.user") then
                    RegisterServerEvent('NetGames_Store2')
                    AddEventHandler('NetGames_Store2', function(vehicleName)
                    end)
                    TriggerClientEvent('removerRastreador', source)
                else
                    TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para executar esta ação.")
                end
            else
                TriggerClientEvent("Notify", source, "negado", "Você não está perto de um veículo.")
            end
        else
            TriggerClientEvent("Notify", source, "negado", "Você precisa da chave para remover o rastreador.")
        end
    end
end)

RegisterServerEvent('vrp:Rastreador')
AddEventHandler('vrp:Rastreador', function(item, quantidade)
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.tryGetInventoryItem(user_id, item, quantidade, true)
    end
end)

RegisterServerEvent('vrp:AdicionarItem')
AddEventHandler('vrp:AdicionarItem', function(item, quantidade)
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.giveInventoryItem(user_id, item, quantidade, true)
    end
end)
