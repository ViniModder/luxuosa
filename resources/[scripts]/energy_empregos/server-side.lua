local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("energy_empregos",src)
vCLIENT = Tunnel.getInterface("energy_empregos")

vPOLICE = Tunnel.getInterface("vrp_policia")

local webhookdrogas = "webhook"
local webhookempregos = "https://discord.com/api/webhooks/1307074202892894260/bDlxvdakwiKweaCNOw0UEoUBwF6VzW1aqB84S5L5iYfc8_WQe9djzJdy5W_oL6uL3fsP"
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR PLACA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.checkPlate()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
        return identity.registration
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTOS EMPREGOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local peixes = {
    [1] = { "sardinha" },
    [2] = { "corvina" },
    [3] = { "sardinha" },
    [4] = { "salmao" },
    [5] = { "corvina" },
    [6] = { "corvina" },
    [7] = { "sardinha" },
    [8] = { "robalo" }

}

local Trigger = {}

function src.payment(tipo, quantidade, text)
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then

        if tipo == "Lixeiro" then
            local nuser_id = {}
            local valor = cfg.config[tipo].price
            local count = 1
            local nplayers = vRPclient.getNearestPlayers(source, 8)

            for k,v in pairs(nplayers) do
                if vCLIENT.checkInServico(parseInt(k)) == tipo  then
                    nuser_id[vRP.getUserId(parseInt(k))] = true
                    count = count + 1
                else
                    TriggerClientEvent("Notify",parseInt(k),"negado","Você não recebeu pois não esta em serviço.",5000)
                end
            end

            if count > 1 then
                valor = valor/count

                for k,v in pairs(nuser_id) do
                    vRP.giveBankMoney(parseInt(k), parseInt(valor))
                end

                vRP.giveBankMoney(user_id, parseInt(valor))
               
            else
                vRP.giveBankMoney(user_id, parseInt(valor))
            end
            TriggerClientEvent("Notify", source,"sucesso","Você coletou o lixo e ganhou: R$:"..valor,5000)
            
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
            SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu no Emprego Lixeiro: "..valor.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

        elseif tipo == "Motorista" then
            local nuser_id = {}
            local valor = cfg.config[tipo].price
            local count = 1
            local nplayers = vRPclient.getNearestPlayers(source, 8)
            for k,v in pairs(nplayers) do
                if vCLIENT.checkInServico(parseInt(k)) == tipo then
                    nuser_id[vRP.getUserId(parseInt(k))] = true
                    count = count + 1
                else
                    TriggerClientEvent("Notify",parseInt(k),"negado","Você não recebeu pois não esta em serviço.",1)
                end
            end

            if count > 1 then
                valor = valor/count

                for k,v in pairs(nuser_id) do
                    vRP.giveBankMoney(parseInt(k), parseInt(valor))
                end

                vRP.giveBankMoney(user_id, parseInt(valor))
            else
                vRP.giveBankMoney(user_id, parseInt(valor))
            end

            TriggerClientEvent("Notify", source,"sucesso","Você ganhou: R$:"..valor,5000)
            
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
            SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu no Emprego Motorista: "..valor.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

        elseif tipo == "Taxista" then
            local nuser_id = {}
            local valor = cfg.config[tipo].price
            local count = 1
            local nplayers = vRPclient.getNearestPlayers(source, 8)
            for k,v in pairs(nplayers) do
                if vCLIENT.checkInServico(parseInt(k)) == tipo then
                    nuser_id[vRP.getUserId(parseInt(k))] = true
                    count = count + 1
                else
                    TriggerClientEvent("Notify",parseInt(k),"negado","Você não recebeu pois não esta em serviço.",5000)
                end
            end

            if count > 1 then
                valor = valor/count

                for k,v in pairs(nuser_id) do
                    vRP.giveBankMoney(parseInt(k), parseInt(valor))
                end

                vRP.giveBankMoney(user_id, parseInt(valor))
            else
                vRP.giveBankMoney(user_id, parseInt(valor))
            end
            TriggerClientEvent("Notify", source,"sucesso","Você ganhou: R$:"..valor,5000)
            
            TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
            SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu no Emprego Taxista: "..valor.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")



        elseif tipo == "Minerador" then
            local user_id = vRP.getUserId(source)
            local quantidade = math.random(1, 3)
            local minerios = {
                [1] = { "ouro2", math.random(2,5) },
                [2] = { "chumbo", math.random(2,5) },
                [3] = { "aco", math.random(2,4) },
            }

            if vRP.computeInvWeight(user_id)+vRP.getItemWeight(minerios[quantidade][1]) <= vRP.getInventoryMaxWeight(user_id) then
                vRP.giveInventoryItem(user_id, minerios[quantidade][1], minerios[quantidade][2], true)
                TriggerClientEvent("Notify", source, "sucesso", "Você pegou o minério", 5000)
                
            else
                TriggerClientEvent("Notify", source, "negado", "Mochila cheia.", 5000)
            end

        elseif tipo == "Entregador" then
            if vRP.tryGetInventoryItem(user_id, "caixa", 1, true) then
                local reward = cfg.config[tipo].price
                vRP.giveBankMoney(user_id, reward)
                TriggerClientEvent("Notify",source,"sucesso","Você entregou a caixa e recebeu: R$"..reward, 5000)
                
                TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
                SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu no Emprego Minerador: "..reward.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

                return true
            end

        elseif tipo == "Lenhador" then
            if vRP.computeInvWeight(user_id)+vRP.getItemWeight('madeira') * 3 <= vRP.getInventoryMaxWeight(user_id) then 
                vRP.giveInventoryItem(user_id, "madeira", 3, true)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou a madeira", 5000)
                
                TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
                SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu Madeira no Emprego Lenhador "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

                return true
            else
                TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5000)
            end

        elseif tipo == "Pescador" then
            if vRP.computeInvWeight(user_id)+vRP.getItemWeight(peixes[quantidade][1]) <= vRP.getInventoryMaxWeight(user_id) then 
                vRP.giveInventoryItem(user_id, peixes[quantidade][1], 1, true)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou o peixe", 5000)
                
                TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
                SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu Peixe no Emprego Pescador "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

            else
                TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5000)
            end

        elseif tipo == "Tartaruga" then
            if vRP.computeInvWeight(user_id)+vRP.getItemWeight('tartaruga') <= vRP.getInventoryMaxWeight(user_id) then 
                vRP.giveInventoryItem(user_id, "tartaruga", 1, true)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou a tartaruga", 5000)
                
                TriggerClientEvent("Notify",source,"sucesso","Você ganhou 1 Points pelo trabalho", 5000)
                SendWebhookMessage(webhookempregos, "```prolog\n O ID: "..user_id.." Recebeu tartaruga no Emprego Tartaruga "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

            else
                TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5000)
            end
            
        end

    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGADOR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.giveCaixas(quantidade)
   
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        if vRP.computeInvWeight(user_id)+vRP.getItemWeight('caixa') <= vRP.getInventoryMaxWeight(user_id) then
            vRP.giveInventoryItem(user_id, "caixa", 1, true)
        else
            TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5000)
        end
    end
end

-- PESCADOR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.tryIsca()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id, "isca", 1, true) then
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Acabou suas iscas, volte e busque mais.", 5000)
        end
    end
end

function src.giveIsca(quantidade)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.computeInvWeight(user_id)+vRP.getItemWeight('isca') <= vRP.getInventoryMaxWeight(user_id) then 
            vRP.giveInventoryItem(user_id, "isca", 0, true)
        else
            TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5000)
        end
    end
end