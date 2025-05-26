Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Tools = module("vrp","lib/Tools")
Resource = GetCurrentResourceName()
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
RegisterTunnel = {}
Tunnel.bindInterface(Resource, RegisterTunnel)

local idgens = Tools.newIDGenerator()

vTunnel = Tunnel.getInterface(Resource)

Functions.prepare('mdt/GetDataTable', " SELECT user_id,dvalue FROM vrp_user_data WHERE dkey = 'vRP:datatable' ")
Functions.prepare('getLast', " SELECT * FROM vrp_users WHERE id = @id ")
Functions.prepare("insertPrison","INSERT INTO mdt_historico(user_id, motivo, time) VALUES(@user_id, @motivo, @time)")
Functions.prepare('getHistorico', " SELECT * FROM mdt_historico WHERE user_id = @user_id ")
Functions.prepare("getMyVehicle","SELECT * FROM vrp_user_veiculos WHERE user_id = @user_id")

local Chamados = {}
local playTime = {}
local ActiveChamado = {}
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local MDT = {
  List = {},
  Member = {},
  MembersList = {},
}

RegisterCommand(cfg['CommandChamados'],function(source,args,rawCommand)
	local source = source
	local user_id = Functions.getUserId(source)
	local vida = Functions.getHealth(source)
	if user_id then
    local name = Functions.getAllName(user_id)
		local descricao = Functions.prompt(source,"Descrição:","")
		if descricao == "" then
			return
		end
		local x,y,z = Functions.getPosition(source)
    if not x and y and z then return end
    if not ActiveChamado[user_id] then
      if vida >= 101 then
        local photo = Functions.getPlayerPhoto(user_id)
        Chamados[#Chamados+1] = { id = #Chamados+1, cds = { x = x, y = y, z = z}, created_at = os.date("*t", os.time()), title = "Chamado de "..name.."#"..user_id, user_id = user_id, description = descricao, photo = photo }
        ActiveChamado[user_id] = true
        Functions.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
        Functions.notify("Notify",source,"sucesso","Chamado enviado com sucesso.", 5000)
      else
        Functions.notify("Notify",source,"negado","Você não pode realizar um chamado morto.", 5000)
      end
    else
      Functions.notify("Notify",source,"negado","Você já tem um chamado ativo e deve aguardar.", 5000)
    end
	end
end)

local blips = {}
local AntiDuplo = {}
RegisterTunnel.handleRequest = function(data, value)
  local source = source
  local user_id = Functions.getUserId(source)
  if user_id then
    local name = Functions.getAllName(user_id)  
    if value == "accept" then
      if not AntiDuplo[data.id] then
        AntiDuplo[data.id] = true
        local nsource = Functions.getUserSource(parseInt(Chamados[data.id].user_id))
        if not source then
          Functions.notify("Notify",source,"importante","O cidadão que realizou o chamado não se encontra na cidade.", 5000)
          Chamados[data.id] = nil
          return
        end

        Functions.notify("Notify",nsource,"importante","Chamado atendido por <b>"..name.."#"..user_id.."</b>, aguarde no local.", 5000)
        Functions.playSound(nsource,"Event_Message_Purple","GTAO_FM_Events_Soundset")
        Functions.setGPS(source,Chamados[data.id].cds.x,Chamados[data.id].cds.y)
        local id = idgens:gen()
				blips[id] = Functions.addBlip(source,Chamados[data.id].cds.x,Chamados[data.id].cds.y,Chamados[data.id].cds.z,cfg.BlipChamado[1], cfg.BlipChamado[2],"Chamado #"..data.id,cfg.BlipChamado[3],false)
        vTunnel.visibility(source)
        Functions.notify("Notify",source,"importante","A localização do chamado foi marcada no mapa!.", 5000)
				SetTimeout(300000,function() Functions.removeBlip(source,blips[id]) idgens:free(id) end)
        AntiDuplo[data.id] = false
        ActiveChamado[Chamados[data.id].user_id] = nil
        Chamados[data.id] = nil
      else
        Functions.notify("Notify",source,"importante","Chamado ja foi atendido por outra pessoa.", 5000)
        Functions.playSound(source,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
      end
    else
      AntiDuplo[data.id] = true
      local nsource = Functions.getUserSource(parseInt(Chamados[data.id].user_id))
      if not source then
        Chamados[data.id] = nil
      end
      Functions.playSound(nsource,"CHECKPOINT_MISSED","HUD_MINI_GAME_SOUNDSET")
      Functions.notify("Notify",nsource,"importante","Seu chamado acaba de ser rejeitado por "..name.."#"..user_id.." .", 5000)
      AntiDuplo[data.id] = false
      ActiveChamado[Chamados[data.id].user_id] = nil
      Chamados[data.id] = nil
      vTunnel.visibility(source)
    end
  end
end


AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	local player = Functions.getUserSource(parseInt(user_id))
	if player then
    playTime[user_id] = os.time()
		SetTimeout(30000,function()
			local value = Functions.getUData(parseInt(user_id),"vRP:prisao")
			local tempo = json.decode(value) or -1
			if tempo > 0 then
				--TriggerClientEvent('prisioneiro',player,true)
        vTunnel.prisioneiro(player,true)
        vTunnel.setarRoupasPrisional(player)
				prison_lock(parseInt(user_id))
			end
		end)
	end
end)

function prison_lock(target_id)
	local player = Functions.getUserSource(parseInt(target_id))
	if player then
		SetTimeout(60000,function()
			local value = Functions.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				Functions.notify("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.", 5000)
				Functions.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
        vTunnel.prisioneiro(player,false)
				--TriggerClientEvent('prisioneiro',player,false)
				Functions.teleport(player,1850.5,2604.0,45.5)
				Functions.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				Functions.notify("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.", 5000)
			end
			--Functions.PrisionGod(player)
		end)
	end
end

RegisterTunnel.checkTempoPrisao = function()
  local source = source
  local user_id = Functions.getUserId(source)
  if user_id then
    local value = Functions.getUData(parseInt(user_id),"vRP:prisao")
		local tempo = json.decode(value) or 0
    return tempo
  end
end

RegisterTunnel.reduzirPrisao = function(time)
  local source = source
  local user_id = Functions.getUserId(source)
  if user_id then
    local value = Functions.getUData(parseInt(user_id),"vRP:prisao")
		local tempo = json.decode(value) or 0
    Functions.setUData(user_id,"vRP:prisao",json.encode(parseInt(tempo)-time))
    Functions.notify("Notify",source,"importante","Você prestou um serviço e sua pena reduziu em <b>"..parseInt(time).." meses</b>.", 5000)
  end
end


local policia = {}
RegisterTunnel.pressCode = function(data)
  local source = source
  local user_id = Functions.getUserId(source)
  if not user_id then return end
	local name = Functions.getAllName(user_id)
  local user = MDT.Member[user_id]
  if not user then if cfg.debug then print("TENTATIVA DE INJECT DO USER_ID: "..user_id.."!") end return end
  if not MDT.MembersList[user.groupType] then if cfg.debug then print("MEMBER LIST NÃO LOCALIZADA [SISTEMA DE PRESS CODE].") end return end
	local x,y,z = Functions.getPosition(source)
	if Functions.getHealth(source) > 100 then
    local soldado = MDT.MembersList[user.groupType]
    for ply_id in pairs(soldado) do
      local player = Functions.getUserSource(parseInt(ply_id))
      if player then
        async(function()
          TriggerClientEvent("NotifyPush", player, { x = x, y = y, z = z, blipID = cfg.CodesBlip[data.code][1], blipColor = cfg.CodesBlip[data.code][2], blipScale = cfg.CodesBlip[data.code][3], time = 20, code = data.code, title = "Localização de "..name.." #"..user_id, name = "Localização recebida, verifique o ocorrido." })
          -- local id = idgens:gen()
          -- policia[id] = Functions.addBlip(player,x,y,z,cfg.CodesBlip[data.code][1],cfg.CodesBlip[data.code][2],data.code.." de "..name.." #"..user_id,cfg.CodesBlip[data.code][3],false)
          -- Functions.notify("Notify",player,"importante","Localização ["..data.code.."] de <b>"..name.."</b> recebida.")
          -- Functions.playSound(player,"Out_Of_Bounds_Timer","DLC_HEISTS_GENERAL_FRONTEND_SOUNDS")
          -- SetTimeout(60000,function() Functions.removeBlip(player,policia[id]) idgens:free(id) end)
        end)
      end
    end
    Functions.notify("Notify",source,"sucesso","Localização enviada com sucesso.", 5000)
    Functions.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
	end
end


RegisterCommand('mdt', function(source,args)
  local user_id = Functions.getUserId(source)
  if not user_id then return end
  local user = MDT.Member[user_id]
  if not user then if cfg.debug then Functions.notify("Notify",source,"importante","Você não tem permissão para acessar esse painel.", 5000) end return end
  vTunnel.visibility(source)
end)

RegisterTunnel.colocarPrisao = function(time)
  local source = source
  local user_id = Functions.getUserId(source)
  if user_id then
    Functions.setHandcuffed(source,false)
    vTunnel.prisioneiro(source,true)
    vTunnel.setarRoupasPrisional(source)
    --TriggerClientEvent('prisioneiro',source,true)
    prison_lock(user_id)
    TriggerClientEvent('removealgemas',source)
    TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)
  end
end

RegisterTunnel.prender = function(data)
  local source = source
  local user_id = Functions.getUserId(source)
  if user_id then
    local name = Functions.getAllName(user_id)
    local player = Functions.getUserSource(parseInt(data.identifier))
    if player then
      if parseInt(data.time) > 0 then
        if data.reason then
          if parseInt(data.fine) > 0 then
            local multas =  vRP.getMultas(parseInt(data.identifier))
            local newvalue = parseInt(multas) + parseInt(data.fine)
            vRP.updateMultas(parseInt(data.identifier), newvalue)
           -- Functions.setUData(parseInt(data.identifier),"vRP:multas",newvalue)
          end
          Functions.setUData(parseInt(data.identifier),"vRP:prisao",json.encode(parseInt(data.time)))
          --Functions.setHandcuffed(player,false)
          --TriggerClientEvent('prisioneiro',player,true)
          --Functions.teleport(player,1680.1,2513.0,45.5)
          --prison_lock(parseInt(data.identifier))
          --TriggerClientEvent('removealgemas',player)
          --TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
          TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)
          vTunnel.levarPrisioneiro(player, data.time)
          Functions.execute("insertPrison", { user_id = parseInt(data.identifier), motivo = data.reason, time = os.time()})
          Functions.notify("Notify",source,"sucesso","Prisão efetuada com sucesso.", 5000)
          Functions.notify("Notify",player,"sucesso","Você foi preso por "..data.time.." meses pelo oficial "..name..".", 5000)
          Functions.sendLog(cfg.webhook.prender, "O ID "..user_id..", PRENDEU O ID: "..data.identifier..", POR "..data.time.." MESES, MOTIVO: "..data.reason..", MULTA: "..(data.fine or 0)..".")
          vTunnel.visibility(source)
        else
          Functions.notify("Notify",source,"negado","O motivo para prender o cidadão não foi informado.", 5000)
        end
      else
        Functions.notify("Notify",source,"negado","O tempo de prisão não foi informado ou é menor/igual a zero.", 5000)
      end
    else
      Functions.notify("Notify",source,"negado","O cidadão que você tentou prender não está na cidade.", 5000)
		end
  end
end


RegisterTunnel.requestOpen = function()
  local source = source
  local user_id = Functions.getUserId(source)
  if not user_id then return end
  local user = MDT.Member[user_id]
  if not user then if cfg.debug then print("Você não faz parte de nenhuma organização!") end return end
  if cfg.debug then print(("Abrindo o Painel da Organização: %s"):format(user.groupType)) end
  if not MDT.MembersList[user.groupType] then if cfg.debug then print("Ops, houve um problema contate um administrador.") end return end
  local name = Functions.getAllName(user_id)
  if name then
    local uptime = 0
    if playTime[user_id] then
      uptime = os.date("*t", playTime[user_id])
    else
      playTime[user_id] = os.time()
      uptime = os.date("*t", playTime[user_id])
    end
    local tableuser = {
      name = name,
      role = user.group,
      isAdmin = cfg.Groups[user.groupType][user.group].Config.isAdmin,
      org = user.group,
      uptime = uptime,
      atualtime = os.date("*t", os.time())
    }
    local ranks = cfg.Groups[user.groupType][user.group].Recrute
local players = MDT.MembersList[user.groupType]
if not players then
    return -- Se não houver jogadores, interrompe o script
end

local FormatMembers = {}
for ply_id in pairs(players) do
    local last = Functions.query('getLast', { id = ply_id })
    local nname = Functions.getAllName(ply_id)
    if not nname then
        if cfg.debug then
            print("Problemas ao carregar identidade.")
        end
        goto skip -- Se houver problemas ao carregar o nome, pula para o próximo loop
    end

    local hasActive = (Functions.getUserSource(ply_id) ~= nil) and 1 or 0
    local nuser = MDT.Member[ply_id]
    local last_login = last[1].ultimo_login -- Obtém a última data de login do usuário

    FormatMembers[#FormatMembers + 1] = {
        name = nname,
        id = ply_id,
        status = hasActive,
        role = nuser.group or "Indefinido",
        last_login = last_login -- Formata a data de login
    }

    ::skip:: -- Rótulo para pular para o próximo loop
end

    -- ranks = {
    --   ['Advogado(a)'] = {
    --     {
    --       "Teste",
    --     },
    --     {
    --       "2",
    --     },
    --     {
    --       "5",
    --     }
    --   },
    -- }
    return { action = "open", user = tableuser, members = FormatMembers, requests = Chamados, ranks = ranks}
  end
end


function RegisterTunnel.leaveOrg()
  local source = source
  local user_id = Functions.getUserId(source)
  if not user_id then return end

  local org = MDT.Member[user_id]
  if not org then
      if cfg.debug then
          print(([[%s Tentou Injetar o Tunnel leaveOrg]]):format(user_id))
      end
      return
  end

  if cfg.debug then
      print("Leave org => ", org.groupType)
  end

  if org.groupType == "Mecanica" or org.groupType == "Hospital" or org.groupType == "Policia" or org.groupType == "Cot" or org.groupType == "PoliciaCivil" then
      Functions.giveWeapons(source, {} ,true) 
  end
  Functions.sendLog(cfg.webhook.leaveorg, "O ID "..user_id.." SAIU DA ORGANIZAÇÃO: "..org.groupType..".")
  Functions.removeUserGroup(user_id, org.group) -- Caso der problema ( filtrar pelo getUserGroupByType )
  Functions.setUData(user_id,"sjr:blacklist",os.time()+24*cfg.blacklist*60*60)
  Functions.notify("Notify",source,"sucesso","Você saiu da sua organização.", 5000)
end

RegisterTunnel.invite = function(data)
  local source = source
  local user_id = Functions.getUserId(source)
  if not user_id then return end

  local org = MDT.Member[user_id]
  if not org then
      if cfg.debug then
          print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
      end
      return
  end

  if MDT.List[data.group] ~= org.groupType then
      if cfg.debug then
          print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
      end
      return
  end

  local ply_id = parseInt(data.id)
  if not ply_id then
    Functions.notify("Notify",source,"negado","O usuario informado não existe.", 5000)
    return
  end

  local ply_src = Functions.getUserSource(ply_id)

  if not ply_src then
      Functions.notify("Notify",source,"negado","O Jogador não se encontra na cidade no momento.", 5000)
      return
  end

  local blacklist = Functions.getUData(ply_id,"sjr:blacklist") or 0
  if parseInt(blacklist) > os.time() then
      local temp = os.date("*t", blacklist)
      local text = 
      cfg.langs.isBlackList(source, temp.day, temp.month, temp.hour, temp.min)
      cfg.langs.haveBlackList(ply_src, temp.day, temp.month, temp.hour, temp.min)
      return
  end

  if MDT.Member[ply_id] then
    if MDT.Member[ply_id].groupType == org.groupType then
      vTunnel.visibility(source)
      Functions.notify("Notify",source,"sucesso","O Jogador foi promovido/rebaixado com sucesso.", 5000)
      Functions.addUserGroup(ply_id, data.group)
      Functions.sendLog(cfg.webhook.invite, "O ID "..user_id..", PROMOVEU/REBAIXOU O ID"..ply_id..", PARA A ORGANIZAÇÃO: "..data.group)
    else
      Functions.notify("Notify",source,"negado","Este jogador já está em uma organização.", 5)
      return
    end
  else
    local request = Functions.request(ply_src, "Estão te convidando para a organização "..org.groupType.." deseja aceitar?", 30)
    if not request then
        Functions.notify("Notify",source,"negado","O Jogador recusou seu convite.", 5000)
        return
    end

    vTunnel.visibility(source)
    Functions.notify("Notify",source,"sucesso","O Jogador aceitou seu convite.", 5000)
    Functions.addUserGroup(ply_id, data.group)
    Functions.sendLog(cfg.webhook.invite, "O ID "..user_id..", INVITOU O ID"..ply_id..", PARA A ORGANIZAÇÃO: "..data.group)
    return true
  end
end

RegisterTunnel.exonerar = function(data)
  local source = source
  local user_id = Functions.getUserId(source)
  if not user_id then return end

  local org = MDT.Member[user_id]
  if not org then
      if cfg.debug then
          print(([[%s Tentou Injetar o Tunnel demotePlayer]]):format(user_id))
      end
      return
  end

  if MDT.List[data.role] ~= org.groupType  then
    if cfg.debug then
        print(([[%s Tentou Injetar o Tunnel demotePlayer]]):format(user_id))
    end
    return
  end

  local ply_id = parseInt(data.id)

  if not ply_id then
    Functions.notify("Notify",source,"negado","O usuario informado não existe.", 5000)
    return
  end

  if not MDT.Member[ply_id] then
      Functions.notify("Notify",source,"negado","Este não se encontra em nenhuma organização.", 5000)
      return
  end

  local ply_src = Functions.getUserSource(ply_id)
  if ply_src then
    Functions.notify("Notify",ply_src,"negado","Você foi demitido de sua Organização.", 5000)
    Functions.removeUserGroup(ply_id, MDT.Member[ply_id].group) -- Caso der problema ( filtrar pelo getUserGroupByType )
  
    if org.groupType == "Mecanica" or org.groupType == "Hospital" or org.groupType == "Policia" or org.groupType == "Cot" or org.groupType == "PoliciaCivil" then
        Functions.giveWeapons(ply_src, {} ,true) 
    end
    Functions.sendLog(cfg.webhook.demote, "O ID "..user_id..", DEMITIU O ID "..ply_id..", DA ORGANIZAÇÃO: "..org.groupType)
    if cfg.debug then
        print("** ONLINE ** O ID "..user_id.." DEMITIU O "..ply_id.." DA ORGANIZAÇÃO: "..org.groupType)
    end
  else
    local datatable = json.decode(Functions.getUData(ply_id, "vRP:datatable")) or {}
    datatable.groups[MDT.Member[ply_id].group] = nil
    Functions.setUData(ply_id, "vRP:datatable", json.encode(datatable))

    MDT:RemUserGroup(ply_id)
    Functions.sendLog(cfg.webhook.demote, "O ID "..user_id..", DEMITIU O ID "..ply_id..", DA ORGANIZAÇÃO: "..org.groupType)
    if cfg.debug then
        print("** OFFLINE ** O ID "..user_id.." DEMITIU O "..ply_id.." DA ORGANIZAÇÃO: "..org.groupType)
    end
  end
  Functions.setUData(ply_id,"sjr:blacklist",os.time()+24*cfg.blacklist*60*60)
  vTunnel.visibility(source)
  Functions.notify("Notify",source,"sucesso","Você demitiu esse jogador de sua organização.", 5000)
  return true
end

RegisterTunnel.consult = function(data)
  if data.data.type == "prisons" then
    local query = Functions.query('getHistorico', { user_id = parseInt(data.data.value)})
    if #query > 0 then
      local consult = {}
      for k,v in pairs(query) do
        local temp = os.date("*t", v.time)
        consult[#consult+1] = { motivo = v.motivo, dia = temp.day, mes = temp.month, ano = temp.year }
      end
      return consult
    end
  elseif data.data.type == "identity" then
    local name = Functions.getAllName(parseInt(data.data.value))
    local multas = vRP.getMultas(parseInt(data.data.value))
    if name ~= nil then
      return { user_id = data.data.value, name = name, multas = multas }
    end
  elseif data.data.type == "vehicles" then
    local user = data.data.value
    if user then
      local name = Functions.getAllName(user)
      local myvehicles = Functions.query("getMyVehicle", { user_id = user })
      local infos = {}
      for k,v in pairs(myvehicles) do
        local value = "Detido"
        if v.status == 0 then
          value = "Liberado"
        end
        infos[#infos+1] = { vehicle = v.veiculo, arrest = value, name = name }
      end
      return infos
    end
  end
  return {}
end



RegisterTunnel.getUserData = function(user_id)
  local name = Functions.getAllName(parseInt(user_id))
  if name then
    return name
  end
  return false
end

RegisterTunnel.multar = function(data)
  local source = source
	local user_id = Functions.getUserId(source)
  if user_id then
    local multa = vRP.getMultas(parseInt(data.id)) or 0
    local newmulta = parseInt(multa) + parseInt(data.amount)
    vRP.updateMultas(parseInt(data.id),newmulta)
    Functions.notify("Notify",source,"importante","Você multou o usuario "..data.id.." no valor de "..data.amount..".",3000)
    local nsource = Functions.getUserSource(parseInt(data.id))
    if nsource then
      Functions.notify("Notify",nsource,"importante","Você foi multado pelo usuario "..user_id.." no valor de "..data.amount..".",3000)
    end
    Functions.sendLog(cfg.webhook.multar, "O ID "..user_id..", MULTOU O ID: "..data.id..", NO VALOR DE: "..data.amount)
    vTunnel.visibility(source)
    return true
  end
  return false
end

function MDT:AddUserGroup(user_id, v)
  MDT.Member[user_id] = v
  
  if not MDT.MembersList[v.groupType] then
    MDT.MembersList[v.groupType] = {}
  end
  
  MDT.MembersList[v.groupType][user_id] = true
end

function MDT:RemUserGroup(user_id)
  local groupType = MDT.Member[user_id] and (MDT.Member[user_id].groupType or false)
  if not groupType then if cfg.debug then print("Houve um problema no RemUserGroup do USER_ID: "..user_id) end return end
  
  if MDT.MembersList[groupType] then
    MDT.MembersList[groupType][user_id] = nil
  end
  
  MDT.Member[user_id] = nil
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RECIVE HANDLERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('vRP:playerJoinGroup', function(user_id,group)
  if MDT.List[group] then
      MDT:AddUserGroup(user_id, {
          group = group,
          groupType = MDT.List[group]
      })
  end
end)

AddEventHandler('vRP:playerLeaveGroup', function(user_id,group)
  if MDT.List[group] then
      MDT:RemUserGroup(user_id)
  end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CACHE vRP
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MDT:FormatConfig()
  for orgName in pairs(cfg.Groups) do
    for Group in pairs(cfg.Groups[orgName]) do
      MDT.List[Group] = orgName
    end
  end 
  MDT:GenerateCache()
  MDT:VerifyPlayers()
end

function MDT:GenerateCache()
  local time = os.time()
  if cfg.debug then
      if cfg.debug then
          print('^1[cache] ^0Iniciando Cache dos jogadores.')
      end
  end

  local query = Functions.query('mdt/GetDataTable')
  local FormatUser = {}
  for i = 1, #query do
      local ply = query[i]
      local plyData = json.decode(ply.dvalue) or {}

      FormatUser[ply.user_id] = (plyData.groups or {})
  end

  for user_id, groups in pairs(FormatUser) do
      for groupName in pairs(groups) do
          if MDT.List[groupName] then
              MDT:AddUserGroup(user_id, {
                  group = groupName,
                  groupType = MDT.List[groupName]
              })
          end
      end
    end

    if cfg.debug then
        print(('^1[cache] ^0Cache dos jogadores gerados com sucesso tempo %s segundo(s).'):format(os.time() - time))
    end

  FormatUser = {} -- Limpando Variavel para Poupar Memoria
end

-- Verificar jogadores online caso houver algum ensure e não estiver salvo no banco de dados. ( CASO O MODULO SEJA ENSURADO )
function MDT:VerifyPlayers()
  local users = Functions.getUsers()
  for user_id,source in pairs(users) do
      local plyGroups = Functions.getUserGroups(user_id)
      for group in pairs(plyGroups) do

          if MDT.Member[user_id] then -- VERIFICAR SE O JOGADOR ESTIVER ONLINE COM O GRUPO NO BANCO DE DADOS E SEM O GRUPO NO JOGO ( REMOVER DO CACHE ) ( CASO ENSURE )
              if MDT.List[MDT.Member[user_id].group] then
                  if not Functions.hasGroup(user_id, MDT.Member[user_id].group) then
                      MDT:RemUserGroup(user_id)
                  end
              end
          end
          
          if MDT.List[group] then
              MDT:AddUserGroup(user_id, {
                  group = group,
                  groupType = MDT.List[group]
              })
          end
      end
  end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
  MDT:FormatConfig()
end)




