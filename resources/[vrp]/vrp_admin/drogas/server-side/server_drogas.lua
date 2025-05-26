local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

emP = {}
local idgens = Tools.newIDGenerator()
Tunnel.bindInterface("ph_drogavende",emP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdrugs = "https://discord.com/api/webhooks/1233272614365958304/KGd26JPfbyBiRXeyo8YPQ8GVF1Qxk6NDKWx14HMioHNR6vIs1z_OUhxgQT6Z-ueH3dvg"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- QUANTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local quantidade = {}
function emP.Quantidade()
	local source = source
	if quantidade[source] == nil then
		quantidade[source] = math.random(3,5)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITENS
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkItens()
	emP.Quantidade()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then 
        return vRP.getInventoryItemAmount(user_id,"maconha") >= quantidade[source] or  vRP.getInventoryItemAmount(user_id,"cocaina") >= quantidade[source]  or  vRP.getInventoryItemAmount(user_id,"lsd") >= quantidade[source]  or  vRP.getInventoryItemAmount(user_id,"metanfetamina") >= quantidade[source]  or  vRP.getInventoryItemAmount(user_id,"ecstasy") >= quantidade[source]  or  vRP.getInventoryItemAmount(user_id,"baseado") >= quantidade[source]  or  vRP.getInventoryItemAmount(user_id,"lancaperfume") >= quantidade[source]
	end
end


function emP.checkPermissao()
	local source = source
	local user_id = vRP.getUserId(source)
	if not vRP.terPemissao(user_id,"perm.policia") then 
		return true
	else 
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	local policia = {}
	policia = vRP.getUsersByPermission("perm.policia")
	local bonus = 0

	if #policia >= 0 and #policia <= 3 then
        bonus = 0
    elseif #policia >= 4 and #policia <= 6 then
        bonus = 50
    elseif #policia >= 7 and #policia <= 10 then
		bonus = 100
	elseif #policia >= 11 and #policia <= 14 then
        bonus = 200
    elseif #policia > 15 then
        bonus = 300
    end

	if user_id then
		if vRP.tryGetInventoryItem(user_id,"maconha",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		if vRP.tryGetInventoryItem(user_id,"cocaina",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		if vRP.tryGetInventoryItem(user_id,"lsd",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		if vRP.tryGetInventoryItem(user_id,"ecstasy",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		if vRP.tryGetInventoryItem(user_id,"metanfetamina",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		if vRP.tryGetInventoryItem(user_id,"baseado",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		if vRP.tryGetInventoryItem(user_id,"lancaperfume",quantidade[source]) then
			vRP.giveInventoryItem(user_id,"dinheirosujo", (parseInt(1000) + bonus) * quantidade[source])
		end
		quantidade[source] = nil
		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
function emP.MarcarOcorrencia()
	local source = source
	local user_id = vRP.getUserId(source)
	local x,y,z = vRPclient.getPosition(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local soldado = vRP.getUsersByPermission("perm.policia")
		for l,w in pairs(soldado) do
			local player = vRP.getUserSource(parseInt(w))
			if player then
				async(function()
					local id = idgens:gen()
					blips[id] = vRPclient.addBlip(player,x,y,z,10,84,"Ocorrência",0.5,false)
					vRPclient._playSound(player,"CONFIRM_BEEP","HUD_MINI_GAME_SOUNDSET")
					TriggerClientEvent('chatMessage',player,"911",{64,64,255},"Recebemos uma denuncia de tráfico, verifique o ocorrido.")
					SetTimeout(20000,function() vRPclient.removeBlip(player,blips[id]) idgens:free(id) end)
				end)
			end
		end
		SendWebhookMessage(webhookdrugs,"```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." \n[FOI DENUNCIADO] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
	end
end