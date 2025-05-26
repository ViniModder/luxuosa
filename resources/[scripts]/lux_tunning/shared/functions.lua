Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

log = {}
function log:error(message)
	print("^4[Tunning] ^1" .. message.. "^7")
end

function log:warning(message)
	print("^4[Tunning] ^3" .. message.. "^7")
end

function log:success(message)
	print("^4[Tunning] ^2" .. message.. "^7")
end

if IsDuplicityVersion() then
	vRP = Proxy.getInterface("vRP")
	vRPc = Tunnel.getInterface("vRP")
	Remote = Tunnel.getInterface(GetCurrentResourceName())
	SjR = {}
	Tunnel.bindInterface(GetCurrentResourceName(), SjR)
else
	vRP = Proxy.getInterface("vRP")
	vRPs = Tunnel.getInterface("vRP")
	Remote = Tunnel.getInterface(GetCurrentResourceName())
	API = {}
	Tunnel.bindInterface(GetCurrentResourceName(), API)
end


----======================================================================================----
----FUNCTIONS DO SCRIPT
----======================================================================================----


getUserByRegistration = function(plate)
	return vRP.getUserByRegistration(plate)
end

getUserSource = function(user_id)
	return vRP.getUserSource(user_id)
end

getUserId = function(source)
	return vRP.getUserId(source)
end

getBankMoney = function(user_id)
	return vRP.getBankMoney(user_id)
end

hasPermission = function(user_id, perm)
	return vRP.hasPermission(user_id, perm)
end

getUserIdentity = function(user_id)
	return vRP.getUserIdentity(user_id)
end

tryFullPayment = function(user_id, amount)
	return vRP.tryFullPayment(user_id,amount)
end

getInventoryItemAmount = function(user_id, idname)
	return vRP.getInventoryItemAmount(user_id,idname)
end

tryGetInventoryItem = function(user_id, item, amount)
	return vRP.tryGetInventoryItem(user_id, item, amount)
end

giveInventoryItem = function(user_id, item, amount)
	vRP.giveInventoryItem(user_id, item, amount)
end

giveBankMoney = function(user_id, amount)
	vRP.giveBankMoney(user_id,amount)
end

setSData = function(key, value)
	vRP.setSData(key,value)
end

getSData = function(key)
	return vRP.getSData(key)
end