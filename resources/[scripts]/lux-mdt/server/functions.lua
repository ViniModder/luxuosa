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

Functions.getUserId = function(source)
    return vRP.getUserId(source)
end

Functions.getUsers = function()
  return vRP.getUsers()
end

Functions.getUserSource = function(user_id)
    return vRP.getUserSource(user_id)
end

Functions.getUserByRegistration = function(plate)
  return vRP.getUserByRegistration(plate)
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
	return 'https://img.freepik.com/fotos-gratis/homem-boemio-pensando_1368-3693.jpg'
	---- chamar e retornar foto do jester
end

Functions.getAllName = function(user_id)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
      return identity.nome.." "..identity.sobrenome
    end
    return 'Individuo Indigente'
end

Functions.request = function(source, mensagem, time)
    return vRP.request(source, mensagem, time)
end

Functions.getPosition = function(source)
  return vRPclient.getPosition(source)
end

Functions.getHealth = function(source)
  return vRPclient.getHealth(source)
end

Functions.setGPS = function(source, x, y)
  vRPclient.setGPS(source, x, y)
end

Functions.addBlip = function(source,x,y,z,blip,color,name,size,value)
  return vTunnel.addBlip(source,x,y,z,blip,color,name,size,value)
end

Functions.removeBlip = function(source, blip)
  vTunnel.removeBlip(source,blip)
end

Functions.playSound = function(source, audio, audio2)
  return vRPclient.playSound(source, audio, audio2)
end

Functions.PrisionGod = function(source)
  vRPclient.PrisionGod(player)
end

Functions.giveWeapons = function(source, weapons, value)
  vRPclient.giveWeapons(source, weapons ,value) 
end

Functions.setHandcuffed = function(source,value)
  vRPclient.setHandcuffed(source,value)
end

Functions.teleport = function(source, x,y,z)
  vRPclient.teleport(source,x,y,z)
end

Functions.prompt = function(source,text,cb)
  return vRP.prompt(source, text, cb)
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