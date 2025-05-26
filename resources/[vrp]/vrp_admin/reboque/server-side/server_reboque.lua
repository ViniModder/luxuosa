local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-------REBOQUE
RegisterCommand('rebocar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"perm.mecanica") or vRP.hasPermission(user_id,"admin.permissao") then
        	TriggerClientEvent("vrp_player:startTow",source)
        end
    end
end)

RegisterServerEvent("vrp_player:tryTow")
AddEventHandler("vrp_player:tryTow",function(nveh,rveh,mod)
	TriggerClientEvent("vrp_player:syncTow",-1,nveh,rveh,mod)
end)