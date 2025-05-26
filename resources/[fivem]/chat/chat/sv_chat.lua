-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookchat = "https://discord.com/api/webhooks/1233263475258818621/cPdsfgqmIgFtOdkk7ji5oxoa6RSfOpesAx6Yjfoexilmx_gI90uXIZBCQ7d3lbKVl6Nb"
local webhookchatilegal = "https://discord.com/api/webhooks/1233263655001526442/kWVwvlqsn6IrwIG4BXxd_SFjhywbQp8k1-MGxtZJr9eqQzpUXe-j1BRfMxvmqGeyYZJw"

function SendWebhookMessage(webhook,message)
   if webhook ~= "none" then
       PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
   end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vCLIENT = Tunnel.getInterface("chat")
-----------------------------------------------------------------------------------------------------------------------------------------
-- MESSAGEENTERED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("chat:messageEntered")
AddEventHandler("chat:messageEntered",function(message)
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		local identity = vRP.getUserIdentity(user_id)
		if identity then
			TriggerClientEvent("chatMessage",source,identity["nome"].." "..identity["sobrenome"],{100,100,100},"^3"..message)
			local players = vRPC.getNearestPlayers(source,10)
			for k,v in pairs(players) do
				async(function()
					TriggerClientEvent("chatMessage",k,identity["nome"].." "..identity["sobrenome"],{100,100,100},"^3"..message)
				end)
			end
		end
        SendWebhookMessage(webhookchat,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[MENSAGEM]: "..message.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- COMMANDFALLBACK
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterServerEvent("__cfx_internal:commandFallback")
-- AddEventHandler("__cfx_internal:commandFallback",function(command)
-- 	local nome = GetPlayer(source)
-- 	if not command or not nome then
-- 		return
-- 	end

-- 	CancelEvent()
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSOLE
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("prefeitura",function(source,args,rawCommand)
-- 	if source == 0 then
-- 		TriggerClientEvent('chatMessage',-1,"^3PREFEITURA",{100,100,100},rawCommand:sub(11))
-- 	end
-- end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand("kickall",function(source,args,rawCommand)
-- 	if source == 0 then
-- 		local playerList = vRP.getUsers()
-- 		for k,v in pairs(playerList) do
-- 			vRP.kick(v,"Você foi desconectado, a cidade reiniciou.")
-- 		end
-- 		--TriggerEvent("vrp_admin:KickAll")
-- 	end
-- end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    local source = source
    Wait(10000)
    TriggerClientEvent('chatMessage',source,"",{95, 0, 203},"@Prefeitura ^0Seja bem-vindo(a) a cidade, Entre em Nosso Discord ! discord.gg/bgttqfdAgH")
end)


RegisterCommand("ilegal",function(source,args,rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    fal = identity.nome.. " " .. identity.sobrenome

    if user_id then
        if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"perm.ilegal") then
        if vRP.tryFullPayment(user_id,10000) then
            local message = rawCommand:sub(8)
            TriggerClientEvent('chatMessage',-1,"ILEGAL",{255, 0, 0}," ^0"..message ,'')
            TriggerClientEvent("Notify",source,"sucesso","Você pagou $10.000 para mandar mensagem no <b>/ILEGAL</b>.", 5000)
            SendWebhookMessage(webhookchatilegal,"```prolog\n[ID]: "..user_id.." "..fal.." \n[ILEGAL]: "..message.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você não tem Permissão", 5000)
    end
    end
end)   

RegisterCommand('pft', function(source, args, rawCommand)
	local message = rawCommand:sub(4)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	fal = identity.nome.. " " .. identity.sobrenome
	if vRP.hasPermission(user_id,"ticket.permissao") then
		local ilegal = vRP.getUsersByPermission("ticket.permissao")
        TriggerClientEvent('chatMessage',-1,"",{150, 150, 150}," ^0"..message ,'')
	end
end, false)

RegisterCommand('911', function(source, args, rawCommand)
    local message = rawCommand:sub(4)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    fal = identity.nome.. " " .. identity.sobrenome
    if user_id and vRP.hasPermission(user_id,'perm.policia') then
        TriggerClientEvent('chatMessage',-1,"",{51, 51, 255},""..identity.nome.." "..identity.sobrenome.. "  ^0"..message ,'')
        SendWebhookMessage(webhookchat,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[COMANDO]: /911\n[MENSAGEM]:"..message.." \n"..os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S  \r```"))
    end
end, false)

RegisterCommand('mec', function(source, args, rawCommand)
    local message = rawCommand:sub(4)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    fal = identity.nome.. " " .. identity.sobrenome
    if user_id and vRP.hasPermission(user_id,'perm.mecanica') then
        TriggerClientEvent('chatMessage',-1,"",{51, 51, 255},""..identity.nome.." "..identity.sobrenome.. "  ^0"..message ,'')
        SendWebhookMessage(webhookchat,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[COMANDO]: /911\n[MENSAGEM]:"..message.." \n"..os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S  \r```"))
    end
end, false)


RegisterCommand('192', function(source, args, rawCommand)
    local message = rawCommand:sub(4)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    fal = identity.nome.. " " .. identity.sobrenome
    if user_id and vRP.hasPermission(user_id,'perm.unizk')  then
        TriggerClientEvent('chatMessage',-1,"[EMS] ",{255, 51, 102},""..identity.nome.." "..identity.sobrenome.. "  ^0"..message)
        SendWebhookMessage(webhookchat,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[COMANDO]: /112\n[MENSAGEM]:"..message.." \n"..os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S  \r```"))
    end
end, false)


RegisterCommand('limparchat', function(source)
    local user_id = vRP.getUserId(source);
    if user_id ~= nil then
        if vRP.hasPermission(user_id, "admin.permissao") then
            TriggerClientEvent("chat:clear", -1);
        else
            TriggerClientEvent("chat:clear", source);
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUSCHAT
-----------------------------------------------------------------------------------------------------------------------------------------
function statusChat(source)
	return vCLIENT.statusChat(source)
end



