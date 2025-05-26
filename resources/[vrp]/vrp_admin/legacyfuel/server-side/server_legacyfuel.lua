-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_legacyfuel",src)
Proxy.addInterface("vrp_legacyfuel",src)

vCLIENT = Tunnel.getInterface("vrp_legacyfuel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local vehFuels = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
function src.paymentFuel(price)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryFullPayment(user_id,parseInt(price)) then
			TriggerClientEvent("Notify",source,"sucesso","Você pagou <b>$ "..vRP.format(parseInt(price)).."</b>", 5)
			return true
		else
			TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.", 5)
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GALLONBUYING
-----------------------------------------------------------------------------------------------------------------------------------------
function src.gallonBuying()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local request = vRP.request(source,"Deseja comprar um <b>Galão</b> por <b>$ 250.0</b>?",30)
		if request then
			if vRP.tryFullPayment(user_id,250) then
				vRPclient._giveWeapons(source, { ["WEAPON_PETROLCAN"] = {ammo=4500} }, false)
				TriggerClientEvent("Notify",source,"sucesso","Você comprou um galão de gasolina. [Verifique o TAB]", 5)

				return true
			else
				TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.", 5)
			end
		end
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYFUEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_engine:tryFuel")
AddEventHandler("vrp_engine:tryFuel",function(vehicle,fuel)
	vehFuels[vehicle] = fuel
	TriggerClientEvent("vrp_engine:syncFuel",-1,vehicle,fuel)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	TriggerClientEvent("vrp_engine:syncFuelPlayers",source,vehFuels)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDO ADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('fuel', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "admin.permissao") then
			local vehicle = vRPclient.getNearestVehicle(source, 5)
			if vehicle then
				if tonumber(args[1]) > 0 and tonumber(args[1]) <= 100 then
					vehFuels[vehicle] = tonumber(args[1])
					vCLIENT._syncAdminFuel(-1,vehicle,tonumber(args[1]))
					vRP.sendLog("FUEL", "O Admin "..user_id.." utilizou o comando /fuel "..tonumber(args[1]))
				end
			end
		end
	end
end)