-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface(GetCurrentResourceName(), cRP)
Proxy.addInterface(GetCurrentResourceName(), cRP)

vCLIENT = Tunnel.getInterface(GetCurrentResourceName())

-----------------------------------------------------------------------------------------------------------------------------------------
-- DIMENSÃO
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.setInstance(status)
    local source = source
    local user_id = vRP.getUserId(source)

    if status then
        SetPlayerRoutingBucket(source, parseInt(user_id))
    else
        SetPlayerRoutingBucket(source, 0)
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PAGAMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.payment(valor)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if valor == 0 then
			valor = 0
		end
		
		if vRP.tryFullPayment(user_id, tonumber(valor)) then
			TriggerClientEvent("Notify", source, "sucesso","Você pagou <b>$"..vRP.format(parseInt(valor)).." </b> em roupas e acessórios.", 5000)
			return true
		else
			TriggerClientEvent("Notify", source, "negado","Você não possui dinheiro.", 5000)
		end
	end
end


