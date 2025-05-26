-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
SjR = {}
Tunnel.bindInterface("complexo_elevator", SjR)
SjRElev = Tunnel.getInterface("complexo_elevator")

function SjR.hasPermission(permission)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if permission == nil then
            return true
        else
            return vRP.hasPermission(user_id, permission)
        end
    end
end