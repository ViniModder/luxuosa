local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface(GetCurrentResourceName())
local cfg = module(GetCurrentResourceName(),"config/peds")

RegisterNetEvent('target:peds')
AddEventHandler('target:peds', function(s,a,r)
    if not vSERVER.canOpen() then return TriggerEvent("Notify","negado","Você não tem permissao para abrir") end
    SendNUIMessage({ action = "open", data = cfg.peds })
    SetNuiFocus(true,true)
end)

RegisterCommand("peds",function(s,a,r)
if not vSERVER.canOpen() then return TriggerEvent("Notify","negado","Você não tem permissao para abrir") end
SendNUIMessage({ action = "open", data = cfg.peds })
SetNuiFocus(true,true)
end)

RegisterNUICallback("close",function(data,cb)
    SetNuiFocus(false,false)
    cb("ok")
end)

RegisterNUICallback("SelectPed",function(data,cb)
    local ped = data.ped
    if not ped then return end
    if not vSERVER.CanApplyPed(ped) then
        SetNuiFocus(false,false)
        cb("ok")
        return TriggerEvent("Notify","negado","Você não tem permissao para colocar este ped")
    end
    local pedHash = GetHashKey(ped)
    RequestModel(pedHash)
    while not HasModelLoaded(pedHash) do
        --print("Carregando")
        RequestModel(pedHash)
        Citizen.Wait(10)
    end
    if HasModelLoaded(ped) then
        SetPlayerModel(PlayerId(),pedHash)
        SetModelAsNoLongerNeeded(pedHash)
        SetPedDefaultComponentVariation(PlayerPedId())
        vSERVER.ApplyPed()
    end

    SetNuiFocus(false,false)
    cb("ok")
   
end)