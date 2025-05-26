local Tunnel        <const> = module("vrp","lib/Tunnel")
local RESOURCE_NAME <const> = GetCurrentResourceName()
local Proxy         <const> = module("vrp","lib/Proxy")
local Tools         <const> = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface(RESOURCE_NAME, src)

vCLIENT = Tunnel.getInterface(RESOURCE_NAME)


src.PayUser = function(job)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local table = Config.Jobs[job]
        if table then
            local payment = table.payment.reward
            if payment then
                for k,v in pairs(payment) do
                    local value = math.random(v[1],v[2])
                    print(value, k)
                    vRP.giveInventoryItem(user_id, k, value, true)
                end
            end
        end
    end
end



