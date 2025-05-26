local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
banK = {}
Tunnel.bindInterface("lux_bank",banK)
Proxy.addInterface("lux_bank",banK)
banKClient = Tunnel.getInterface("lux_bank")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ WEBHOOKS ]---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
local webhookDepositar = "https://discord.com/api/webhooks/1264535950139064330/R52L6gvvUCo19v6GpEVVKWwf-oXEbcb6zSMDijRfkpmeUF61smqVAXcF8P5G9YIcQryj"-------bancoo ookk
local webhookPTrans = "https://discord.com/api/webhooks/1264535950139064330/R52L6gvvUCo19v6GpEVVKWwf-oXEbcb6zSMDijRfkpmeUF61smqVAXcF8P5G9YIcQryj"------
local webhookMultasDup = "https://discord.com/api/webhooks/1264535950139064330/R52L6gvvUCo19v6GpEVVKWwf-oXEbcb6zSMDijRfkpmeUF61smqVAXcF8P5G9YIcQryj"---
local webhookSacou = "https://discord.com/api/webhooks/1264535950139064330/R52L6gvvUCo19v6GpEVVKWwf-oXEbcb6zSMDijRfkpmeUF61smqVAXcF8P5G9YIcQryj"----

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

vRP.prepare("getInfos/seila","SELECT * FROM extrato_bancario WHERE user_id = @user_id ORDER BY id ASC")
--ORDER BY id DESC LIMIT 1 // order by id desc limit N;
function banK.getInfos()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)

	if user_id then
		local carteira = vRP.getMoney(user_id)
		local banco = vRP.getBankMoney(user_id)
		local nome = ""..identity.nome.." "..identity.sobrenome..""
		
		local extrato = getHistoricoBanco(user_id)
		local valor = vRP.getMultas(parseInt(user_id),"vRP:multas")
		local multas = vRP.getMultas(user_id) or 0
		local bankValues = 5,286,9657,2
		local photo = "https://cdn-icons-png.flaticon.com/512/195/195488.png"
		return carteira,banco,nome,extrato,multas,bankValues,photo
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--[ PAGAR MULTAS ]-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function banK.multas(amount, id)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    local identity = vRP.getUserIdentity(user_id)
    local multas = vRP.getMultas(user_id) or 0
    local banco = vRP.getBankMoney(user_id)
    
    if banco >= parseInt(amount) then
        if parseInt(amount) >= 1 then
            if parseInt(amount) <= parseInt(multas) then
                vRP.setBankMoney(user_id, parseInt(banco - amount))
                local new_multas = parseInt(multas - amount)
                vRP.updateMultas(user_id, new_multas) -- Atualiza o valor de multas do usuário
                TriggerClientEvent("Notify", source, "sucesso", "Você pagou <b>$"..amount.." reais</b> em multas.", 8000)
                vRP.execute("setInfos/extrato", { user_id = user_id, valor = amount, tipo = "MULTA", data = os.date("%d/%m/%Y %H:%M") })
                SendWebhookMessage(webhookMultasDup, "```prolog\n[ID]: "..user_id.."\n[PAGOU MULTA NO VALOR]: R$"..amount.."\n"..os.date("[Data]: %d/%m/%Y [Hora]: %H:%M:%S").."\r```")
                -- banKClient.updateBank(source)
            else
                TriggerClientEvent("Notify", source, "negado", "Você não pode pagar mais multas do que deve.", 8000)
            end
        else
            -- O que fazer se o valor for menor que 1?
        end
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem dinheiro em sua conta suficiente para isso.", 8000)
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--[ DEPOSITAR ]--------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function banK.depositar(amount)
	local _source = source
	local user_id = vRP.getUserId(_source)

	if amount == nil or amount <= 0 or amount > vRP.getMoney(user_id) then
		TriggerClientEvent("Notify",_source,"negado","Valor inválido",9000)
	else
		vRP.tryDeposit(user_id, tonumber(amount))
		vRP.execute("setInfos/extrato",{ user_id = user_id, valor = amount, tipo = "DEPOSITO", data = os.date("%d/%m/%Y %H:%M") })
		SendWebhookMessage(webhookDepositar, "```prolog\n[ID]: "..user_id.." \n[DEPOSITOU]: R$"..amount.."\n "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent("Notify",_source,"sucesso","Você depositou <b>R$"..amount.." reais</b>.",9000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ SACAR ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function banK.sacar(amount)
	local _source = source
	local user_id = vRP.getUserId(_source)

	amount = tonumber(amount)
	local getbankmoney = vRP.getBankMoney(user_id)

	if amount == nil or amount <= 0 or amount > getbankmoney then
		TriggerClientEvent("Notify",_source,"negado","Valor inválido",9000)
	else
		vRP.tryWithdraw(user_id,amount)
		vRP.execute("setInfos/extrato",{ user_id = user_id, valor = amount, tipo = "SAQUE", data = os.date("%d/%m/%Y %H:%M") })
		SendWebhookMessage(webhookSacou, "```prolog\n[ID]: "..user_id.." \n[SACOU]: R$"..amount.."\n "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		TriggerClientEvent("Notify",_source,"sucesso","Você sacou <b>R$"..amount.." reais</b>.",9000)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRANSFERENCIAS ]---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("getInfos/moneyBank","SELECT banco FROM vrp_user_identities WHERE user_id = @user_id")
vRP.prepare("getInfos/setBank","UPDATE vrp_user_identities SET banco = banco + @banco WHERE user_id = @user_id")
vRP.prepare("setInfos/extrato","INSERT INTO extrato_bancario(user_id,valor,tipo,data) VALUES(@user_id,@valor,@tipo,@data);")

-- function banK.transferir(amountt,to)
-- 	local _source = source
-- 	local user_id = vRP.getUserId(_source)
-- 	local identity = vRP.getUserIdentity(user_id)

-- 	local _nplayer = vRP.getUserSource(parseInt(to))
-- 	local nuser_id = vRP.getUserId(_nplayer)
-- 	local identitynu = vRP.getUserIdentity(nuser_id)
-- 	local banco = 0

-- 	if nuser_id == nil then
-- 		local getMoney = vRP.query("getInfos/moneyBank", {user_id = to })
-- 		local banco = vRP.getBankMoney(user_id)
-- 		if json.encode(getMoney) ~= nil and json.encode(getMoney) ~= "[]" then
-- 			local banconu = parseInt(getMoney[1].bank)
-- 			if banco <= 0 or banco < tonumber(amountt) or tonumber(amountt) <= 0 then
-- 				TriggerClientEvent("Notify",_source,"negado","Dinheiro Insuficiente")
-- 			else
-- 				local identitynu = vRP.getUserIdentity(to)
-- 				vRP.setBankMoney(user_id,banco-tonumber(amountt))
-- 				vRP.execute("getInfos/setBank",{ bank = amountt, user_id = to })
-- 				vRP.execute("setInfos/extrato",{ user_id = user_id, valor = amountt, tipo = "TRANSFERÊNCIA", data = os.date("%d/%m/%Y %H:%M") })
-- 				SendWebhookMessage(webhookPTrans,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[ENVIOU BANCO]: R$"..vRP.format(parseInt(amountt)).."\n[PARA]: "..to.." "..identitynu.nome.." "..identitynu.sobrenome.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-- 				TriggerClientEvent("Notify",_source,"sucesso","Você transferiu <b>R$"..amountt.." reais</b> para conta de <b>"..identitynu.nome.." "..identitynu.sobrenome.."</b>.")
-- 			end
-- 		else
-- 			TriggerClientEvent("Notify",_source,"negado","Usuário sem conta no Banco")
-- 		end
-- 	else
-- 		if nuser_id == user_id then
-- 			TriggerClientEvent("Notify",_source,"negado","Você não pode transferir dinheiro para si mesmo.")	
-- 		else
-- 			local banco = vRP.getBankMoney(user_id)
-- 			local banconu = vRP.getBankMoney(nuser_id)
			
-- 			if banco <= 0 or banco < tonumber(amountt) or tonumber(amountt) <= 0 then
-- 				TriggerClientEvent("Notify",_source,"negado","Dinheiro Insuficiente")
-- 			else
-- 				vRP.setBankMoney(user_id,banco-tonumber(amountt))
-- 				vRP.setBankMoney(nuser_id,banconu+tonumber(amountt))
-- 				vRP.execute("setInfos/extrato",{ user_id = user_id, valor = amountt, tipo = "TRANSFERÊNCIA", data = os.date("%d/%m/%Y %H:%M") })
-- 				SendWebhookMessage(webhookPTrans,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[ENVIOU BANCO]: R$"..vRP.format(parseInt(amountt)).."\n[PARA]: "..nuser_id.." "..identitynu.nome.." "..identitynu.sobrenome.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
-- 				TriggerClientEvent("Notify",_nplayer,"sucesso","<b>"..identity.nome.." "..identity.sobrenome.."</b> depositou <b>R$"..amountt.." reais</b> na sua conta.")
-- 				TriggerClientEvent("Notify",_source,"sucesso","Você transferiu <b>R$"..amountt.." reais</b> para conta de <b>"..identitynu.nome.." "..identitynu.sobrenome.."</b>.")
-- 			end
-- 		end
-- 	end
-- end


-- Função para verificar se um jogador está online
function IsPlayerOnline(playerId)
    return vRP.getUserSource(playerId) ~= nil
end

-- Função para realizar a transferência de dinheiro
function banK.transferir(amountt, to)
    local _source = source
    local user_id = vRP.getUserId(_source)
    local identity = vRP.getUserIdentity(user_id)

    local _nplayer = vRP.getUserSource(tonumber(to))
    local nuser_id = vRP.getUserId(_nplayer)
    local identitynu = vRP.getUserIdentity(nuser_id)
    local banco = 0

    if not IsPlayerOnline(nuser_id) then
        TriggerClientEvent("Notify", _source, "negado", "O destinatário não está online ou não existe.",9000)
        return
    end

    if nuser_id == nil then
        local getMoney = vRP.query("getInfos/moneyBank", { user_id = to })
        local banco = vRP.getBankMoney(user_id)
        if json.encode(getMoney) ~= nil and json.encode(getMoney) ~= "[]" then
            local banconu = parseInt(getMoney[1].bank)
            if banco <= 0 or banco < tonumber(amountt) or tonumber(amountt) <= 0 then
                TriggerClientEvent("Notify",_source,"negado","Dinheiro Insuficiente",9000)
            else
                local identitynu = vRP.getUserIdentity(to)
                vRP.setBankMoney(user_id,banco-tonumber(amountt))
                vRP.execute("getInfos/setBank",{ bank = amountt, user_id = to })
                vRP.execute("setInfos/extrato",{ user_id = user_id, valor = amountt, tipo = "TRANSFERÊNCIA", data = os.date("%d/%m/%Y %H:%M") })
                SendWebhookMessage(webhookPTrans,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[ENVIOU BANCO]: R$"..vRP.format(parseInt(amountt)).."\n[PARA]: "..to.." "..identitynu.nome.." "..identitynu.sobrenome.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                TriggerClientEvent("Notify",_source,"sucesso","Você transferiu <b>R$"..amountt.." reais</b> para conta de <b>"..identitynu.nome.." "..identitynu.sobrenome.."</b>.")
            end
        else
            TriggerClientEvent("Notify",_source,"negado","Usuário sem conta no Banco" ,9000)
        end
    else
        if nuser_id == user_id then
            TriggerClientEvent("Notify",_source,"negado","Você não pode transferir dinheiro para si mesmo.",9000)	
        else
            local banco = vRP.getBankMoney(user_id)
            local banconu = vRP.getBankMoney(nuser_id)
            
            if banco <= 0 or banco < tonumber(amountt) or tonumber(amountt) <= 0 then
                TriggerClientEvent("Notify",_source,"negado","Dinheiro Insuficiente",9000)
            else
                vRP.setBankMoney(user_id,banco-tonumber(amountt))
                vRP.setBankMoney(nuser_id,banconu+tonumber(amountt))
                vRP.execute("setInfos/extrato",{ user_id = user_id, valor = amountt, tipo = "TRANSFERÊNCIA", data = os.date("%d/%m/%Y %H:%M") })
                SendWebhookMessage(webhookPTrans,"```prolog\n[ID]: "..user_id.." "..identity.nome.." "..identity.sobrenome.." \n[ENVIOU BANCO]: R$"..vRP.format(parseInt(amountt)).."\n[PARA]: "..nuser_id.." "..identitynu.nome.." "..identitynu.sobrenome.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                TriggerClientEvent("Notify",_nplayer,"sucesso","<b>"..identity.nome.." "..identity.sobrenome.."</b> depositou <b>R$"..amountt.." reais</b> na sua conta.",9000)
                TriggerClientEvent("Notify",_source,"sucesso","Você transferiu <b>R$"..amountt.." reais</b> para conta de <b>"..identitynu.nome.." "..identitynu.sobrenome.."</b>.",9000)
            end
        end
    end
end



function getHistoricoBanco(user_id)
	local seila = {}
	local teste = vRP.query("getInfos/seila", {user_id = user_id })
	local historico = 0
	local nColunas = parseInt(#teste-6)
	for k,v in pairs(teste) do
		historico = historico + 1
		if historico > nColunas then
			table.insert(seila,{id = v.id, user_id = v.user_id, valor = v.valor, tipo = v.tipo, data = v.data})
		end
	end
	return seila
end



-- Função para obter o histórico bancário de um usuário
function getHistoricoBanco(user_id)
	local seila = {}
	local teste = vRP.query("getInfos/seila", { user_id = user_id })
	local historico = 0
	local nColunas = tonumber(#teste) - 6
	for k, v in pairs(teste) do
	  historico = historico + 1
	  if historico > nColunas then
		table.insert(seila, {
		  id = v.id,
		  user_id = v.user_id,
		  valor = v.valor,
		  tipo = v.tipo,
		  data = v.data
		})
	  end
	end
	return seila
  end
  
  -- Função para retornar as informações bancárias de um usuário
  function getInfos()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
  
	if user_id then
	  local carteira = vRP.getMoney(user_id)
	  local banco = vRP.getBankMoney(user_id)
	  local nome = identity.nome .. " " .. identity.sobrenome
  
	  local extrato = getHistoricoBanco(user_id)
	  local valor = vRP.getUData(tonumber(user_id), "vRP:multas")
	  local multas = json.decode(valor) or 0
	  local bankValues = 5,286,9657,2 -- Valores fictícios para exemplo
	  local photo = "https://cdn-icons-png.flaticon.com/512/195/195488.png"
  
	  return carteira, banco, nome, extrato, multas, bankValues, photo
	end
  end
  
  -- Registre o evento "getInfos" para ser chamado pelo cliente
  RegisterServerEvent("getInfos")
  AddEventHandler("getInfos", function()
	local infos = getInfos()
	TriggerClientEvent("receiveInfos", source, infos)
  end)
  


  