Functions = {}

Functions.query = function(name, params)
	return vRP.query(name, params)
end

Functions.prepare = function(name, params)
	return vRP.prepare(name, params)
end

Functions.execute = function(name, params)
	return vRP.execute(name, params)
end

Functions.getUsers = function()
	return vRP.getUsers()
end

Functions.getUserId = function(source)
    return vRP.getUserId(source)
end

Functions.getUserSource = function(user_id)
    return vRP.getUserSource(user_id)
end

Functions.hasGroup = function(user_id, perm)
    return vRP.hasGroup(user_id, perm)
end

Functions.hasPermission = function(user_id, perm)
    return vRP.hasPermission(user_id, perm)
end

Functions.addUserGroup = function(user_id, group)
	vRP.addUserGroup(user_id,group)
end

Functions.setUData = function(user_id, key, value)
	vRP.setUData(user_id,key,value)
end

Functions.getUData = function(user_id,key)
	return vRP.getUData(user_id,key)
end

Functions.removeUserGroup = function(user_id, group)
	vRP.removeUserGroup(user_id,group)
end

Functions.getUserGroups = function(user_id)
	return vRP.getUserGroups(user_id)
end

Functions.getPlayerPhoto = function(user_id)
	return {}
	---- chamar e retornar foto do jester
end

Functions.getAllName = function(user_id)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
        return identity.nome.." "..identity.sobrenome
    end
    return "Nome Indefinido"
end

Functions.getBank = function(user_id)
    return vRP.getBankMoney(user_id)
end

Functions.giveBankMoney = function(user_id, amount)
    vRP.giveBankMoney(user_id,amount)
end

Functions.setBank = function(user_id, value)
    vRP.setBankMoney(user_id,value)
end

Functions.request = function(source, mensagem, time)
    return vRP.request(source, mensagem, time)
end

Functions.notify = function(event, source, type, mensagem, time)
	TriggerClientEvent(event, source, type, mensagem, time)
end

Functions.sendLog = function(webhook, text)
	SendWebhookMessage(webhook,text)
end

SendWebhookMessage = function(webhook,message)
    if webhook ~= "none" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end