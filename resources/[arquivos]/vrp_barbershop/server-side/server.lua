
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
src = {}
Tunnel.bindInterface("vrp_barbershop", src)
vCLIENT = Tunnel.getInterface("vrp_barbershop")


src.updateSkin = function(custom)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.execute("vRP/set_controller",{ user_id = user_id, controller = 1, rosto = json.encode(custom) })
	end
end

