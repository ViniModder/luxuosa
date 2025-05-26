-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Nikito = {}
Tunnel.bindInterface("radio", Nikito)
NikitoRad = Tunnel.getInterface("radio")

function Nikito.hasPermission(permission)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return vRP.hasPermission(user_id, permission)
    end
end

function Nikito.hasRadio()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return vRP.getInventoryItemAmount(user_id,"radio") >= 1
    end
end

-- vRP.getHealth() <= 101 or vRP.isHandcuffed() or IsPauseMenuActive()