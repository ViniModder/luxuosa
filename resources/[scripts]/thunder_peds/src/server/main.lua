local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
mapreedev = {}
local cfg = module(GetCurrentResourceName(),"config/peds")
Tunnel.bindInterface(GetCurrentResourceName(),mapreedev)

function mapreedev.canOpen()
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    return vRP.hasPermission(user_id, cfg.openPermission)
end

function mapreedev.CanApplyPed(ped)
    local source = source
    local user_id = vRP.getUserId(source)
    if not cfg.peds[ped] then return end
    return vRP.hasPermission(user_id, cfg.peds[ped].perm)
end

function mapreedev.ApplyPed()
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    local datable = json.decode(vRP.getUData(user_id,"vRP:datatable"))
    if not datable or not datable.customization then return print("Sua base não é vrpex (normal) entre em contato com o vendedor do script para alterar a configuração") end
    datable.customization = vRPclient.getCustomization(source)
    vRP.setUData(user_id,"vRP:datatable",json.encode(datable))
    print(type(datable),json.encode(datable.customization))
end