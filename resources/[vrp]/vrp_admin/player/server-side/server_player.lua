

function RegisterTunnel.CheckPlayers()
	return GetNumPlayerIndices()
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cr',function(source,args)
    local user_id = vRP.getUserId(source)
    if exports["vrp"]:checkCommand(user_id) and GetEntityHealth(GetPlayerPed(source)) > 105 then
		local status,time = exports['vrp']:getCooldown(user_id, "cr")
		if status then 
			if not vRP.checkFarda(user_id) then
				exports['vrp']:setCooldown(user_id, "cr", 10)
				vRPclient.setCustomization(source, vRP.getUserApparence(user_id).clothes)
				--vRPclient.setCustomization(source, vRP.getUserApparence(user_id).tattoos)
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não pode utilizar esse comando fardado.", 8000)
			end
		else
			TriggerClientEvent("Notify",source,"negado","Negado","Você so pode utilizar esse comando em <b>".. time .." segundo(s)</b>", 8000)
		end
    end
end)

------------------------------------------------------------------------------
---- 30s    --   smaby#9295 --
------------------------------------------------------------------------------
RegisterCommand('30s',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local nplayer = vRPclient.getNearestPlayer(source,2)
    local nuser_id = vRP.getUserId(nplayer)
    if vRP.hasPermission(user_id,"policia.permissao") then
        TriggerClientEvent("Notify",source,"negado","Importante","Contagem dos 30 segundos de ação")
        TriggerClientEvent("Notify",nplayer,"importante","Contagem dos 30 segundos de ação iniciada")
        TriggerClientEvent("Notify",source,"importante","Contagem dos 30 segundos de ação iniciada")
        TriggerClientEvent("progress",source,30000,"trinta")
        TriggerClientEvent("progress",nplayer,30000,"trinta")
    else
        TriggerClientEvent("Notify",source,"negado","Negado","Você não tem permissão para acessar esse comando.")
    end
end)
---- rgbcar ----

RegisterCommand('rgbcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        TriggerClientEvent('rgbcar',source)
        TriggerClientEvent("Notify",source,"sucesso","Você tunou o <b>veículo</b> RGB com sucesso.")
    end
end)


RegisterCommand('spec', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
			if tonumber(args[1]) == 0 or tonumber(args[1]) == user_id then
				vRPclient._stopSpec(source)
			else
				local nplayer = vRP.getUserSource(tonumber(args[1]))
				if nplayer then
					vRPclient._toggleSpec(source, nplayer)
				end
			end
		end
	end
end)


local player_customs = {}
RegisterCommand('display',function(source,args,rawCommand)
	local custom = vRPclient.getCustomization(source,{})
	if custom then
		if player_customs[source] then
			player_customs[source] = nil
			vRPclient._removeDiv(source,"customization")
		else
			local content = ""
			for k,v in pairs(custom) do
				content = content..k.." => "..json.encode(v).."<br />"
			end

			player_customs[source] = true
			vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content)
		end
	end
end)


RegisterCommand("ar", function(source,args,rawCommand)
	if source == 0 then
		vRPclient._setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 40%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; word-wrap: break-word; } bold { font-size: 16px; }","<bold>".. rawCommand:sub(3) .."</bold><br><br>Mensagem enviada por: Administrador")
		SetTimeout(60*1000,function()
			vRPclient._removeDiv(-1,"anuncio")
		end)
	end
	print(rawCommand:sub(3))
end)


RegisterCommand('festa',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        local identity = vRP.getUserIdentity(user_id)
        local mensagem = vRP.prompt(source,"Mensagem:","")
        if mensagem == "" then
            return
        end
		TriggerClientEvent('Notify', -1, 'festinha', mensagem, 60000, identity.nome.." "..identity.sobrenome, 10, GetEntityCoords(GetPlayerPed(source)))
       -- vRPclient.setDiv(-1,"festinha"," @keyframes blinking {    0%{ background-color: #ff3d50; border: 2px solid #871924; opacity: 0.8; } 25%{ background-color: #d22d99; border: 2px solid #901f69; opacity: 0.8; } 50%{ background-color: #55d66b; border: 2px solid #126620; opacity: 0.8; } 75%{ background-color: #22e5e0; border: 2px solid #15928f; opacity: 0.8; } 100%{ background-color: #222291; border: 2px solid #6565f2; opacity: 0.8; }  } .div_festinha { font-size: 11px; font-family: arial; color: rgba(255, 255, 255,1); padding: 20px; bottom: 30%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; animation: blinking 1s infinite; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Festeiro(a): "..identity.name.." "..identity.firstname)
        -- SetTimeout(30000,function()
        --     vRPclient.removeDiv(-1,"festinha")
        -- end)
    end
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- STATUS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('status',function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then 
		local status, time = exports['vrp']:getCooldown(user_id, "status")
        if status then
            exports['vrp']:setCooldown(user_id, "status", 5)
			local onlinePlayers = GetNumPlayerIndices()
			
			local policia = vRP.getUsersByPermission("perm.policia")
			local policiaPtr = 0
			for k,v in pairs(policia) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					policiaPtr = policiaPtr + 1
				end
			end

			local policiacivil = vRP.getUsersByPermission("perm.policiacivil")
			local policiaCivilPtr = 0
			for k,v in pairs(policiacivil) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					policiaCivilPtr = policiaCivilPtr + 1
				end
			end

			-- local policiatatica = vRP.getUsersByPermission("perm.tatica")
			-- local policiataticaPtr = 0
			-- for k,v in pairs(policiatatica) do
			-- 	local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
			-- 	if patrulhamento then
			-- 		policiataticaPtr = policiataticaPtr + 1
			-- 	end
			-- end

			local paramedico = vRP.getUsersByPermission("perm.unizk")	
			local paramedicoPtr = 0
			for k,v in pairs(paramedico) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					paramedicoPtr = paramedicoPtr + 1
				end
			end

			local mecanica = vRP.getUsersByPermission("perm.mecanica")	
			local mecanicaPtr = 0
			for k,v in pairs(mecanica) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					mecanicaPtr = mecanicaPtr + 1
				end
			end

			local staff = vRP.getUsersByPermission("perm.ptr.staff")
			
			TriggerClientEvent("Notify",source,"importante","Jogadores Online: <b>".. onlinePlayers .."</b><br>Policiais Militares: <b>"..policiaPtr.."</b><br>Policiais Civis: <b>"..policiaCivilPtr.."</b><br>Paramedicos: <b>"..paramedicoPtr.."</b><br>Mecânicos: <b>"..mecanicaPtr.."</b><br>Administração: <b>"..#staff.."</b> .")
		end
	end
    
end)





local garage = Proxy.getInterface("garages")
RegisterCommand('veh',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] == "vender" then
			local veh = vRP.query("vRP/get_Veiculos", {user_id = user_id})
			local mensagem = ""
			for k,v in pairs(veh) do
				mensagem = mensagem..v.veiculo..","
			end

			local veiculos = vRP.prompt(source, "Digite o nome do veiculo: ", "Seus Veiculos: ".. mensagem)
			if veiculos and veiculos ~= nil and veiculos ~= "" then
				local myveh = vRP.query("vRP/get_veiculos_status", {user_id = user_id, veiculo = veiculos })
				if myveh[1] ~= nil then

					veiculos = string.lower(veiculos) 

					if garage.getVehicleType(veiculos) == "vip" or garage.getVehicleType(veiculos) == "exclusive" or veiculos == "f250deboxe" or veiculos == "africatag" or veiculos == "rmodx6" then
						TriggerClientEvent("Notify",source,"negado","Negado","Você não pode vender esse veiculo.", 5000)
						return 
					end 

					local nuser_id = vRP.prompt(source, "Digite o ID do jogador: ", "")
					if nuser_id and tonumber(nuser_id) and tonumber(nuser_id) > 0 and nuser_id ~= nil and nuser_id ~= "" then
						if parseInt(nuser_id) ~= parseInt(user_id) then
							local nplayer = vRP.getUserSource(parseInt(nuser_id))
							if nplayer then
								local valor = vRP.prompt(source, "Digite o valor que você deseja no veiculo: ", "")
								if tonumber(valor) > 0 and tonumber(valor) < 99999999 and valor ~= nil and valor ~= "" then
									if vRP.request(nplayer, "Você deseja comprar o veiculo <b>"..veiculos.."</b> por <b>$ "..vRP.format(valor).."</b> do id <b>"..user_id.."</b>", 30) then
										local status, time = exports['vrp']:getCooldown(user_id, "veh")
										if status then
											exports['vrp']:setCooldown(user_id, "veh", 10)
											local myveh2 = vRP.query("vRP/get_veiculos_status", {user_id = user_id, veiculo = veiculos })

											if myveh2[1] ~= nil then
												if vRP.tryFullPayment(parseInt(nuser_id), parseInt(valor)) then
													vRP.giveMoney(user_id, parseInt(valor))
													vRP.execute("vRP/update_owner_vehicle", { nuser_id = tonumber(nuser_id), user_id = tonumber(user_id), veiculo = veiculos })
													vRP.updatePlate(myveh2[1].placa, nuser_id)

													TriggerClientEvent("Notify",source,"sucesso","Sucesso","Parabens, Você acaba de vender seu veiculo.", 5000)
													TriggerClientEvent("Notify",nplayer,"sucesso","Sucesso","Parabens, Você acaba de comprar este veiculo.", 5000)
													vRP.sendLog("", "luxuosa - [ID]: "..user_id.." vendeu o carro para o [ID]: "..nuser_id.." [MODELO]: "..veiculos.." [VALOR]: "..vRP.format(valor).." ")
												else
													TriggerClientEvent("Notify",source,"negado","Negado","O Jogador não possui dinheiro.", 5000)
													TriggerClientEvent("Notify",nplayer,"negado","Negado","Você não possui dinheiro.", 5000)
												end
											else
												TriggerClientEvent("Notify",source,"negado","Negado","O Jogador recusou a proposta.", 5000)
												TriggerClientEvent("Notify",nplayer,"negado","Negado","Você recusou a proposta.", 5000)
											end
										end
									end
								end
							else
								TriggerClientEvent("Notify",source,"negado","Negado","Este jogador não se encontra na cidade no momento.", 5000)
							end
						else
							TriggerClientEvent("Notify",source,"negado","Negado","Você não pode vender para si mesmo.", 5000)
						end
					end
				else
					TriggerClientEvent("Notify",source,"negado","Negado","Você não possui ou não digitou corretamente o nome do veiculo.", 5000)
				end
			end
		end
	end
end)


RegisterCommand('911',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"perm.disparo" ) then
			if user_id then
				TriggerClientEvent('chatMessage',-1,identity.nome.." "..identity.sobrenome,{64,64,255},rawCommand:sub(4))
			end
		end
	end
end)

RegisterCommand('pd',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "perm.disparo" 
		if GetEntityHealth(GetPlayerPed(source)) > 105 then
			if vRP.hasPermission(user_id,permission) then
				local soldado = vRP.getUsersByPermission(permission)
				for l,w in pairs(soldado) do
					local player = vRP.getUserSource(parseInt(w))
					if player then
						TriggerClientEvent('chatMessage',player,identity.nome.." "..identity.sobrenome,{64,179,255},rawCommand:sub(3))
					end
				end
			end
		end
	end
end)

RegisterCommand('hp',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "perm.unizk"
		if vRP.hasPermission(user_id,permission) then
			local colaboradordmla = vRP.getUsersByPermission(permission)
			for l,w in pairs(colaboradordmla) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					TriggerClientEvent('chatMessage',player,"[ Hospital Copacabana ] "..identity.nome.." "..identity.sobrenome,{255,0,0},rawCommand:sub(3))
				end
			end
		end
	end
end)

RegisterCommand('ev',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "perm.evento"
		if vRP.hasPermission(user_id,permission) then
			local colaboradordmla = vRP.getUsersByPermission(permission)
			for l,w in pairs(colaboradordmla) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					TriggerClientEvent('chatMessage',player,"[ Evento ] "..identity.nome.." "..identity.sobrenome,{0,0,0},rawCommand:sub(3))
				end
			end
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- status4
---------------------------------ARMAS-------------------------------------------------------------------------------------------------
local status4 = {
	{ permissao = "perm.demonike", title = "Armas:<br>🔫 Demonike: ", ultima = false },
	{ permissao = "perm.pcc", title = "🔫 PCC:", ultima = false },
	{ permissao = "perm.mafia", title = "🔫 Mafia:", ultima = false },
	{ permissao = "perm.cartel", title = "🔫 Cartel:", ultima = false },
	{ permissao = "perm.croacia", title = "🔫 Croacia:", ultima = false },
	{ permissao = "perm.franca", title = "🔫 Franca:", ultima = true },
	{ permissao = "perm.wolves", title = "🔫 Wolves:", ultima = true },
	{ permissao = "perm.yakuza", title = "🔫 Yakuza:", ultima = true },
	{ permissao = "perm.triade", title = "🔫 Triade:", ultima = true },
	{ permissao = "perm.merlim", title = "🔫 Merlim:", ultima = true },
	{ permissao = "perm.grota", title = "🔫 Grota:", ultima = true },
	{ permissao = "perm.turquia", title = "🔫 Turquia:", ultima = true },
	{ permissao = "perm.blackout", title = "🔫 BlackOut:", ultima = true },
-------------------------------MUNIÇÃO E DESMANCHE---------------------------------------------
	{ permissao = "perm.milicia", title = "Munição e Desmanche :<br>📦 Milicia: ", ultima = false },
	{ permissao = "perm.alemao", title = "📦 Alemao: ", ultima = false },
	{ permissao = "perm.helipa", title = "📦 Helipa: ", ultima = false },
	{ permissao = "perm.rocinha", title = "📦 Rocinha: ", ultima = false },
	{ permissao = "perm.crips", title = "📦 Crips: ", ultima = true },
	{ permissao = "perm.furious", title = "📦 Furious: ", ultima = true },
	{ permissao = "perm.motoclub", title = "📦 Motoclub: ", ultima = true },
	{ permissao = "perm.b13", title = "📦 B13: ", ultima = true },
	{ permissao = "perm.lacoste", title = "📦 Lacoste: ", ultima = true },
	{ permissao = "perm.hellsamgels", title = "📦 HellsAngels: ", ultima = true },
	{ permissao = "perm.bennys", title = "📦 Bennys: ", ultima = true },
-- -------------------------------LAVAGEM------------------------------------------------
-- 	{ permissao = "perm.vanilla", title = "Lavagem:<br>💵 Vanilla: ", ultima = false },
-- 	{ permissao = "perm.bahamas", title = "💵 Bahamas: ", ultima = false },
-- 	{ permissao = "perm.bratva", title = "💵 Bratva: ", ultima = false },
-- 	{ permissao = "perm.tequila", title = "💵 Tequila: ", ultima = false },
-- 	{ permissao = "perm.iluminatis", title = "💵 Iluminatis: ", ultima = true },
-- 	{ permissao = "perm.luxury", title = "💵 Luxury: ", ultima = true },
-- 	{ permissao = "perm.galaxy", title = "💵 Galaxy: ", ultima = true },
-- 	{ permissao = "perm.cassino", title = "💵 Cassino: ", ultima = true },
-- ---------------------------DROGAS---------------------------------------------------
-- 	{ permissao = "perm.nigeria", title = "Drogas:<br>💊 Nigeria: ", ultima = false },
-- 	{ permissao = "perm.palestina", title = "💊 Palestina: ", ultima = false },
-- 	{ permissao = "perm.canada", title = "💊 Canada: ", ultima = false },
-- 	{ permissao = "perm.brasil", title = "💊 Brasil: ", ultima = false },
-- 	{ permissao = "perm.argentina", title = "💊 Argentina: ", ultima = false },
-- 	{ permissao = "perm.portugal", title = "💊 Portugal: ", ultima = false },
-- 	{ permissao = "perm.cv", title = "💊 Cv: ", ultima = false },
-- 	{ permissao = "perm.camorra", title = "💊 Camorra: ", ultima = false },
-- 	{ permissao = "perm.mexico", title = "💊 Mexico: ", ultima = false },
-- 	{ permissao = "perm.jamaica", title = "💊 Jamaica: ", ultima = false },
-- 	{ permissao = "perm.australia", title = "💊 Australia: ", ultima = false },
}

RegisterCommand('status4',function(source,args)
    local user_id = vRP.getUserId(source)
	if user_id then
		local status, time = exports['vrp']:getCooldown(user_id, "status4")
        if status then
            exports['vrp']:setCooldown(user_id, "status4", 10)
			if vRP.hasPermission(user_id , "admin.permissao") or vRP.hasPermission(user_id,"perm.ilegal") then
				local onlinePlayers = GetNumPlayerIndices()
				local onlinefacs = vRP.getUsersByPermission("perm.ilegal")
				local formatText = ""

				for k,v in pairs(status4) do
					if not v.ultima then
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br>"
					else
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br><br>"
					end
				end

				TriggerClientEvent("Notify", source,"importante","<b>luxuosa City:</b><br><br> "..formatText.." <br> <b>🌇 Ilegal: </b>"..#onlinefacs.."<br><b>🏘️ Total de jogadores Online: </b>".. onlinePlayers .. ".", 10000)
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- status5
---------------------------------ARMAS-------------------------------------------------------------------------------------------------
local status5 = {
-------------------------------LAVAGEM------------------------------------------------
	{ permissao = "perm.vanilla", title = "Lavagem:<br>💵 Vanilla: ", ultima = false },
	{ permissao = "perm.bahamas", title = "💵 Bahamas: ", ultima = false },
	{ permissao = "perm.bratva", title = "💵 Bratva: ", ultima = false },
	{ permissao = "perm.tequila", title = "💵 Tequila: ", ultima = false },
	{ permissao = "perm.iluminatis", title = "💵 Iluminatis: ", ultima = true },
	{ permissao = "perm.luxury", title = "💵 Luxury: ", ultima = true },
	{ permissao = "perm.galaxy", title = "💵 Galaxy: ", ultima = true },
	{ permissao = "perm.cassino", title = "💵 Cassino: ", ultima = true },
---------------------------DRO---------------------------------------------------
	{ permissao = "perm.nigeria", title = "Drow:<br>💊 Nigeria: ", ultima = false },
	{ permissao = "perm.palestina", title = "💊 Palestina: ", ultima = false },
	{ permissao = "perm.canada", title = "💊 Canada: ", ultima = false },
	{ permissao = "perm.brasil", title = "💊 Brasil: ", ultima = false },
	{ permissao = "perm.argentina", title = "💊 Argentina: ", ultima = false },
	{ permissao = "perm.portugal", title = "💊 Portugal: ", ultima = false },
	{ permissao = "perm.cv", title = "💊 Cv: ", ultima = false },
	{ permissao = "perm.camorra", title = "💊 Camorra: ", ultima = false },
	{ permissao = "perm.mexico", title = "💊 Mexico: ", ultima = false },
	{ permissao = "perm.jamaica", title = "💊 Jamaica: ", ultima = false },
	{ permissao = "perm.australia", title = "💊 Australia: ", ultima = false },
}

RegisterCommand('status5',function(source,args)
    local user_id = vRP.getUserId(source)
	if user_id then
		local status, time = exports['vrp']:getCooldown(user_id, "status5")
        if status then
            exports['vrp']:setCooldown(user_id, "status5", 10)
			if vRP.hasPermission(user_id , "admin.permissao") or vRP.hasPermission(user_id,"perm.ilegal") then
				local onlinePlayers = GetNumPlayerIndices()
				local onlinefacs = vRP.getUsersByPermission("perm.ilegal")
				local formatText = ""

				for k,v in pairs(status5) do
					if not v.ultima then
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br>"
					else
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br><br>"
					end
				end

				TriggerClientEvent("Notify", source,"importante","<b>luxuosa City:</b><br><br> "..formatText.." <br> <b>🌇 Ilegal: </b>"..#onlinefacs.."<br><b>🏘️ Total de jogadores Online: </b>".. onlinePlayers .. ".", 10000)
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- status policia
----------------------------------------------------------------------------------------------------------------------------------------
local status3 = {
	{ permissao = "perm.radiopmerj", title = "Pmerj: ", ultima = false },
	{ permissao = "perm.radioexercito", title = "Exercito: ", ultima = false },
	{ permissao = "perm.radiobope", title = "Bope: ", ultima = false },
	{ permissao = "perm.radiofederal", title = "Policia Federal: ", ultima = false },
	{ permissao = "perm.radioprf", title = "PRF: ", ultima = false },
	{ permissao = "perm.radiocivil", title = "Policia Civil: ", ultima = false },
	{ permissao = "perm.disparo", title = "Total de Policiais: ", ultima = false },
}

RegisterCommand('status3',function(source,args)
    local user_id = vRP.getUserId(source)
	if user_id then
		local status, time = exports['vrp']:getCooldown(user_id, "status3")
        if status then
            exports['vrp']:setCooldown(user_id, "status3", 10)
			if vRP.hasPermission(user_id , "admin.permissao") or vRP.hasPermission(user_id,"perm.ilegal") then
				local onlinePlayers = GetNumPlayerIndices()
				local onlinefacs = vRP.getUsersByPermission("perm.ilegal")
				local formatText = ""

				for k,v in pairs(status3) do
					if not v.ultima then
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br>"
					else
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br><br>"
					end
				end

				TriggerClientEvent("Notify", source,"importante","<b>luxuosa City:</b><br><br> "..formatText.." <br><b>🏘️ Total de jogadores Online: </b>".. onlinePlayers .. ".", 10000)
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SEQUESTRAR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local totalSequestro = {}
RegisterCommand('sequestrar', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,_,_,mVeh = vRPclient.ModelName(source, 5)
			if mName and mVeh then
				if vRPclient.isMalas(nplayer) then
					vRPclient._setMalas(nplayer, false)
					TriggerClientEvent("Notify",source,"sucesso","Você retirou o jogador do porta malas.", 5000)

					totalSequestro[mPlaca] = totalSequestro[mPlaca] - 1
					if totalSequestro[mPlaca] <= 0 then
						totalSequestro[mPlaca] = 0
					end
				else
					if totalSequestro[mPlaca] == nil then
						totalSequestro[mPlaca] = 0
					end

					if vRPclient.isHandcuffed(nplayer) then
						if totalSequestro[mPlaca] >= 1 then
							TriggerClientEvent("Notify",source,"sucesso","Veiculo Cheio...", 5000)
							return
						end

						vRPclient._setMalas(nplayer, true)
						TriggerClientEvent("Notify",source,"sucesso","Você colocou o jogador no porta malas.", 5000)

						totalSequestro[mPlaca] = totalSequestro[mPlaca] + 1
					else
						TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.", 5000)
					end
				end
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKIN
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------
--trunkin Portas malas
-----------------------------------------------

local totalVehicle = {} -- Certifique-se de que esta variável esteja definida em algum lugar do seu script
RegisterServerEvent('ngs:OnTrunk')
AddEventHandler('ngs:OnTrunk', function()
	local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,_,_,mVeh = vRPclient.ModelName(source, 5)
	if not mLock and mVeh then
		if vRPclient.isHandcuffed(source) then
			return
		end
		if totalVehicle[mPlaca] == nil then
			totalVehicle[mPlaca] = 0
		end
		if not vRPclient.isInVehicle(source) then
			if vRPclient.isMalas(source) then
				vRPclient._setMalas(source, false)
				vCLIENT._updateTrunkIn(source, nil, false)
				TriggerClientEvent("Notify",source,"sucesso","Você saiu do porta malas.", 5)
				totalVehicle[mPlaca] = totalVehicle[mPlaca] - 1
				if totalVehicle[mPlaca] <= 0 then
					totalVehicle[mPlaca] = 0
				end
			else
				if totalVehicle[mPlaca] >= 2 then
					TriggerClientEvent("Notify",source,"sucesso","Veiculo Cheio...", 5)
					return
				end
				vRPclient._setMalas(source, true)
				vCLIENT._updateTrunkIn(source, mVeh, true)
				TriggerClientEvent("Notify",source,"sucesso","Você entrou no porta malas.", 5)
				totalVehicle[mPlaca] = totalVehicle[mPlaca] + 1
			end
		end
	end
end)



RegisterCommand("trunkin",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRPclient.getHealth(source) > 101 and not vCLIENT.getHandcuff(source) then
            TriggerClientEvent("ngs:OnTrunk",source)
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLACA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('placa', function(source,args)
		local user_id = vRP.getUserId(source)
		if user_id then
			if vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id, "admin.permissao")  then
				local mPlaca,mName = vRPclient.ModelName(source, 5)
				local nuser_id = vRP.getUserByRegistration(mPlaca)
				if nuser_id then
					local identity = vRP.getUserIdentity(nuser_id)
				if identity then
					TriggerClientEvent("Notify",source,"importante","• Veiculo: <b>"..mName.."</b><br>• Placa: <b>"..mPlaca.."</b><br>• Proprietario: <b>"..identity.nome.. " "..identity.sobrenome.. "</b> (<b>"..identity.idade.."</b>)<br>• Telefone: <b>"..identity.telefone.."</b> <br>• Passaporte: <b>"..identity.user_id.."</b> .")
				end
			else
				local nuser_id = vRP.getUserByRegistration(string.gsub(mPlaca, " ", ""))
				local identity = vRP.getUserIdentity(nuser_id)
				if nuser_id then
					if identity then
						TriggerClientEvent("Notify",source,"importante","• Veiculo: <b>"..mName.."</b><br>• Placa: <b>"..mPlaca.."</b><br>• Proprietario: <b>"..identity.nome.. " "..identity.sobrenome.. "</b> (<b>"..identity.idade.."</b>)<br>• Telefone: <b>"..identity.telefone.."</b> <br>• Passaporte: <b>"..identity.user_id.."</b> .")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Não foi possivel consultar esse veiculo. ", 8000)
				end
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GMOCHILA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gmochila', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		local ok = vRP.request(source, "Você deseja guardar sua(s) <b>"..vRP.getMochilaAmount(user_id).."</b> mochila(s)?", 20000)
		local status, time = exports['vrp']:getCooldown(user_id, "mochila")
		if ok and GetEntityHealth(GetPlayerPed(source)) > 105 and status then
            exports['vrp']:setCooldown(user_id, "mochila", 10)
			
			vRP.giveInventoryItem(user_id, "mochila", vRP.getMochilaAmount(user_id), true)
			vRP.remMochila(user_id)
			TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você guardou suas mochilas.", 5000)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VER O ID PROXIMO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id', function(source,args)
    local source = source
    local user_id = vRP.getUserId(source)

	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		local nuser_id = vRP.getUserId(nplayer)
		if nplayer then
			TriggerClientEvent("Notify",source,"importante","ID Próximo: "..nuser_id,8000)
			-- TriggerClientEvent("Notify",nplayer,"importante","O [ID:"..user_id.."] acabou de ver seu id.", 5)
		else
			TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.")
		end
	end
end)


RegisterCommand("finalizar", function(source, args, rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source, 5)
	local lifeplayer = vRPclient.getHealth(nplayer)
    local time = 3
	if user_id then
		if lifeplayer <= 101 then
			local request = vRP.request(source, 'Você deseja finalizar o individuo?', 10000)
			if request then
				TriggerClientEvent("finalizar",nplayer, 0)
                TriggerClientEvent('Notify',nplayer,'negado','Você foi finalizado por alguém!',5000)
			end
		else
			TriggerClientEvent('Notify',source,'negado','O jogador precisa estar desmaiado!',5000)
		end
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------
--CHAMAR ADMIN
---------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('callmedico', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
    if user_id ~= nil then
		local aceito = false
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
		local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
		local status, time = exports['vrp']:getCooldown(user_id, "callmedico")
		if status and vRPclient.getHealth(source) <= 101 then
			TriggerClientEvent("Notify",source,"sucesso","Chamado enviado com sucesso.", 5000)
			exports['vrp']:setCooldown(user_id, "callmedico", 240)
			local identity = vRP.getUserIdentity(user_id)
			local admin = vRP.getUsersByPermission("hospital.permissao")
			for l,w in pairs(admin) do
				async(function()
					local player = vRP.getUserSource(parseInt(w))
					if player then
						vRPclient._playSound(player,"Event_Message_Purple","GTAO_FM_Events_Soundset")
						--TriggerClientEvent('chatMessage', player,"^8[CALL-MEDICO]: ^0: [ID: "..user_id.."] "..desc.."")
						if vRP.request(player, "Você deseja aceitar o chamado medico do cidadão "..user_id.."?", 30) then
							if not aceito then
								local nuser_id = vRP.getUserId(player)
								if player then
									local nidentity = vRP.getUserIdentity(nuser_id)
									
									aceito = true
									--vRPclient._teleport(player, x,y,z)
									TriggerClientEvent("NotifyPush", player, {
										code = 20,
										title = "Ajuda medica",
										text = "Estou morto e preciso de ajuda",
										x = x,
										y = y,
										z = z,
										name = identity.nome.." "..identity.sobrenome,
										time = "Recebido às " .. os.date("%H:%M"),
										blipColor = 25
									})
									TriggerClientEvent("Notify",source,"sucesso","Sucesso","O medico <b> "..nidentity.nome.." "..nidentity.sobrenome.." </b> aceitou o seu chamado..", 5000)
									---exports.bm_module:addCall(nuser_id)
								end

							else
								TriggerClientEvent("Notify",player,"negado","Este chamado ja foi aceito por outro staff.", 5000)
							end
						end
					end
				end)
			end

			TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você chamou um medico, aguarde.", 5000)
		end
    end
end)

-- RegisterCommand('call', function(source, args, rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id ~= nil then
-- 		if args[1] == "god" then
-- 			local aceito = false
-- 			local plyCoords = GetEntityCoords(GetPlayerPed(source))
--             local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
			
-- 			local desc = vRP.prompt(source,"Descreva seu problema:","")
-- 			local status, time = exports['vrp']:getCooldown(user_id, "callgod")
-- 			if desc and status then
-- 				exports['vrp']:setCooldown(user_id, "callgod", 240)

-- 				local admin = vRP.getUsersByPermission("ticket.permissao")
-- 				for l,w in pairs(admin) do
-- 					async(function()
-- 						local player = vRP.getUserSource(parseInt(w))
-- 						if player then
-- 							vRPclient._playSound(player,"Event_Message_Purple","GTAO_FM_Events_Soundset")
-- 							TriggerClientEvent('chatMessage', player,"^8[CALL-ADMIN]: ^0: [ID: "..user_id.."] "..desc.."")
-- 							if vRP.request(player, "Você deseja aceitar o chamado admin do id "..user_id.."?", 30) then
-- 								if not aceito then
-- 									local nuser_id = vRP.getUserId(player)
-- 									if player then
-- 										local nidentity = vRP.getUserIdentity(nuser_id)
										
-- 										aceito = true
-- 										vRPclient._teleport(player, x,y,z)
-- 										TriggerClientEvent("Notify",source,"sucesso","Sucesso","O Membro da staff <b> "..nidentity.nome.." "..nidentity.sobrenome.." </b> aceitou o seu chamado..", 5000)
-- 										exports.bm_module:addCall(nuser_id)
-- 									end
-- 								else
-- 									TriggerClientEvent("Notify",player,"negado","Este chamado ja foi aceito por outro staff.", 5000)
-- 								end
-- 							end
-- 						end
-- 					end)
-- 				end
	
-- 				TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você chamou um administrador, aguarde.", 5000)
-- 			else
-- 				TriggerClientEvent("Notify",source,"sucesso","Sucesso","Você só pode fazer chamado novamente em ".. time .."segundos.", 5000)
-- 			end
-- 		end
-- 	end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("me",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] then
			if GetEntityHealth(GetPlayerPed(source)) > 105 then
				local nplayers = vRPclient.getNearestPlayers(source, 20)
				for k in pairs(nplayers) do
			    	TriggerClientEvent("vrp_player:pressMe", parseInt(k), source,rawCommand:sub(4),{ 10,250,0,255,100 })
				end

				TriggerClientEvent("vrp_player:pressMe", source, source,rawCommand:sub(4),{ 10,250,0,255,100 })
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /SKIN ADM
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookURL = "https://discord.com/api/webhooks/1264528889825202278/MBJAF-u1DO4A8erdhTyuextBLf7kBkld7gT2W4nYGwgGXWp7Sea5BX00ZDIHlzBaF6MS"----ok
RegisterCommand('skinadm', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
	TriggerClientEvent("Notify", source, "sucesso", "SKIN ALTERADA COM SUCESSO !!!", 30000)
	TriggerClientEvent("Notify", source, "sucesso", "SKIN NÃO CARREGOU UTILIZE O COMANDO /BVIDA !!!", 30000)
    if vRP.hasPermission(user_id, "developer.permissao") then
        if tonumber(args[1]) then
            local nplayer = vRP.getUserSource(tonumber(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu", nplayer, args[2])
                TriggerClientEvent("Notify", source, "sucesso", "Sucesso", "Você setou a skin <b>" .. args[2] .. "</b> no passaporte <b>" .. tonumber(args[1]) .. "</b>.", 5000)
                local payload = {
                    content = "O jogador com passaporte " .. tonumber(args[1]) .. " alterou sua skin para " .. args[2]
                }
                local payloadJson = json.encode(payload)
                PerformHttpRequest(webhookURL, function(statusCode, response, headers) end, 'POST', payloadJson, { ['Content-Type'] = 'application/json' })
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
				vRPclient._killGod(nplayer)
				vRPclient._setHealth(nplayer,301)
                TriggerClientEvent("skinmenu",nplayer,args[2])
                TriggerClientEvent("Notify",source,"sucesso","Você setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.", 5000)
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
-- Defina o tempo de espera em segundos (12 horas)
local cooldownTime = 12 * 60 * 60

-- Crie uma tabela para armazenar o tempo de uso do comando para cada usuário
local cooldowns = {}

RegisterCommand('skin22', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
	TriggerClientEvent("Notify", source, "sucesso", "Aguarde 12:00 horas para usar o comando novamente, tenha um bom rp, Não esqueça nunca saia do personagem para não perder a Skin!!!", 30000)
	TriggerClientEvent("Notify", source, "sucesso", "SKIN NÃO CARREGOU UTILIZE O COMANDO /BVIDA !!!", 30000)
    
    -- Verifica se o usuário tem uma das permissões necessárias
    if vRP.hasPermission(user_id, "developer.permissao") or
        vRP.hasPermission(user_id, "GirlBooster.permissao") or
        vRP.hasPermission(user_id, "jessica.permissao") or
        vRP.hasPermission(user_id, "majuzinha.permissao") or
        vRP.hasPermission(user_id, "KidKolt.permissao") or
        vRP.hasPermission(user_id, "jubyleu.permissao") or
        vRP.hasPermission(user_id, "Ananda.permissao") or
        vRP.hasPermission(user_id, "Zack2.permissao") or
        vRP.hasPermission(user_id, "LS_Maimai.permissao") or
        vRP.hasPermission(user_id, "dudinha.permissao") or
        vRP.hasPermission(user_id, "queijinho.permissao") or
        vRP.hasPermission(user_id, "ig_datena.permissao") or
        vRP.hasPermission(user_id, "TeenDuda.permissao") or
        vRP.hasPermission(user_id, "ig_indio.permissao") or
        vRP.hasPermission(user_id, "gaab.permissao") or
        vRP.hasPermission(user_id, "paola.permissao") or
        vRP.hasPermission(user_id, "ig_henry.permissao") or
        vRP.hasPermission(user_id, "ig_gigante.permissao") or
        vRP.hasPermission(user_id, "caioba.permissao") or
        vRP.hasPermission(user_id, "ig_mineiro.permissao") or
        vRP.hasPermission(user_id, "ig_thimagro2.permissao") or
        vRP.hasPermission(user_id, "ig_thimagro.permissao") or
        vRP.hasPermission(user_id, "caioanao.permissao") or
        vRP.hasPermission(user_id, "LUCI_LuisAnao.permissao") or
        vRP.hasPermission(user_id, "Scooby.permissao") or
        vRP.hasPermission(user_id, "LEOGULLO.permissao") or
        vRP.hasPermission(user_id, "ig_tmaia.permissao") or
        vRP.hasPermission(user_id, "ig_geraldo.permissao") or
        vRP.hasPermission(user_id, "ig_gagao.permissao") or
        vRP.hasPermission(user_id, "ig_guuh.permissao") or
        vRP.hasPermission(user_id, "ig_freddie.permissao") or
        vRP.hasPermission(user_id, "ig_fejao.permissao") or
        vRP.hasPermission(user_id, "JujuHysiz.permissao") or
        vRP.hasPermission(user_id, "ig_tiaveia.permissao") or
        vRP.hasPermission(user_id, "Smeagol.permissao") or
        vRP.hasPermission(user_id, "pedtia.permissao") or
        vRP.hasPermission(user_id, "nam.permissao") then

        -- Verifique se o usuário tem um registro de cooldown
        if not cooldowns[user_id] or (os.time() - cooldowns[user_id]) >= cooldownTime then
            if tonumber(args[1]) then
                local nplayer = vRP.getUserSource(tonumber(args[1]))
                if nplayer then
                    -- Chama um evento no cliente para abrir o menu de skin
                    TriggerClientEvent("skinmenu1", nplayer, args[2])
                    
                    -- Notifica o usuário que executou o comando
                    TriggerClientEvent("Notify", source, "sucesso", "Sucesso", "Você setou a skin <b>" .. args[2] .. "</b> no passaporte <b>" .. tonumber(args[1]) .. "</b>.", 5000)
                    
                    -- Envia uma mensagem para o webhook do Discord
                    local payload = {
                        content = "O jogador com passaporte " .. tonumber(args[1]) .. " alterou sua skin para " .. args[2]
                    }
                    local payloadJson = json.encode(payload)
                    PerformHttpRequest(webhookURL, function(statusCode, response, headers) end, 'POST', payloadJson, { ['Content-Type'] = 'application/json' })
                    
                    -- Registra o tempo de uso do comando para o usuário
                    cooldowns[user_id] = os.time()
                end
            end
        else
            -- Calcula o tempo restante de cooldown
            local timeLeft = cooldownTime - (os.time() - cooldowns[user_id])
            
            -- Notifica o usuário sobre o tempo restante de cooldown
            TriggerClientEvent("Notify", source, "aviso", "Cooldown", "Aguarde " .. math.floor(timeLeft / 3600) .. " horas e " .. math.floor((timeLeft % 3600) / 60) .. " minutos antes de usar o comando novamente.", 5000)
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE IDENTIDADE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function RegisterTunnel.getIdentity()
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
-- 	local carteira = vRP.getMoney(user_id)
-- 	local banco = vRP.getBankMoney(user_id)
-- 	local job = vRP.getUserGroupByType(user_id,"job") if (job == nil or job == "") then job = "Nenhum" end
-- 	local org = vRP.getUserGroupByType(user_id,"org") if (org == nil or org == "") then org = "Nenhuma" end
-- 	local vip = vRP.getUserGroupByType(user_id,"vip") if (vip == nil or vip == "") then vip = "Nenhum" end
-- 	if user_id then
-- 		return user_id,identity.nome,identity.sobrenome,identity.idade,identity.registro,identity.telefone,job,org,vip,vRP.format(carteira),vRP.format(banco)
-- 	end
-- end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE CHECAR COMANDO BLOQUEADO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.blockCommands(segundos)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		exports["vrp"]:setBlockCommand(user_id, segundos)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETAR VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.deleteVeh(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
		exports['lux_garages']:deleteVehicle(source, vehicle)
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE PULAR E DERRUBAR PLAYER
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.TackleServerPlayer(Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
	local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "perm.policia") then
		if Tackled then
			vTunnel.TackleClientPlayer(Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TROCAR DE BANCO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("seat",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if GetEntityHealth(GetPlayerPed(source)) > 105 then
			if tonumber(args[1]) then
				vTunnel._seatPlayer(source, tonumber(args[1]))
			end
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR VIP OU BOOSTER
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.checkAttachs()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "perm.vips") or vRP.hasPermission(user_id, "perm.booster") then
			return true
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR MANOBRAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.checkPermVip()
    local source = source
    local user_id = vRP.getUserId(source)
    --if vRP.hasPermission(user_id,"perm.manobras") or vRP.hasPermission(user_id,"admin.permissao") then
        return true
  --  end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE SALARIOS 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local cfg = module("cfg/groups")
local grupos = cfg.groups
local salarios = {}
local sound = {}
local userSalario = {}

function RegisterTunnel.rCountSalario()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then

		if salarios[user_id] == nil then 
			salarios[user_id] = 0 
		else
			salarios[user_id] = salarios[user_id] + 5
		end

		if salarios[user_id] >= 0 then
			pagarSalario(user_id)
			salarios[user_id] = 0
		end
	end
end

function pagarSalario(user_id)
	local source = vRP.getUserSource(user_id)
	if user_id then
		local groups = vRP.getUserGroups(user_id)

		if userSalario[user_id] ~= nil then
			if os.time() - userSalario[user_id] <= 40 then
				vRP.log("", "[luxuosaRJ] Possivel tentativa de DUP de salario: "..user_id)
			end
		end
		
		for k,v in pairs(groups) do
			if grupos[k] and grupos[k]._config ~= nil and grupos[k]._config.salario ~= nil then
				if grupos[k]._config.salario > 0 then
					if grupos[k]._config.ptr then
						if vRP.checkPatrulhamento(user_id) then
							userSalario[user_id] = os.time()
							vRP.giveBankMoney(user_id, grupos[k]._config.salario)
							TriggerClientEvent('chatMessage',source, "",{52, 58, 235}, "^0Você acaba de receber o salario de ^1"..k.."^0 no valor de ^1 $ "..vRP.format(grupos[k]._config.salario).." ", "salário")
                          --  TriggerClientEvent('chatMessage',source,"SALARIO:",{255,160,0}, "Você acaba de receber o salario de ^2"..k.."^0 no valor de ^2 $ "..vRP.format(grupos[k]._config.salario))
						end
					else
						userSalario[user_id] = os.time()
						vRP.giveBankMoney(user_id, grupos[k]._config.salario)
						TriggerClientEvent('chatMessage',source, "",{52, 58, 235}, "^0Você acaba de receber o salario de ^1"..k.."^0 no valor de ^1 $ "..vRP.format(grupos[k]._config.salario).." ", "salário")
						--TriggerClientEvent('chatMessage',source,"SALARIO:",{255,160,0}, "Você acaba de receber o salario de ^2"..k.."^0 no valor de ^2 $ "..vRP.format(grupos[k]._config.salario))
					end
				end
			end
		end
	end
end

RegisterCommand('salario', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if salarios[user_id] ~= nil then
			TriggerClientEvent('chatMessage',source, "Ainda faltam ^2 ".. 40 - salarios[user_id].." minuto(s)^0 para você receber o seu salario.", 'Informações', false, 'global', 'salario')
			--TriggerClientEvent('chatMessage',source,"SALARIO: ",{255,160,0}, " Ainda faltam ^2 ".. 40 - salarios[user_id].." minuto(s)^0 para você receber o seu salario.")
		end
	end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE CHAMADOS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servicesAn = {
	["perm.policia"] = { prefix = "^5[POLICIA]" },
	["perm.unizk"] = { prefix = "^1[HOSPITAL]" },
	["perm.mecanica"] = { prefix = "^2[MECANICA]" },
}

RegisterCommand('an',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
	
		if user_id then
			for k,v in pairs(servicesAn) do
				if vRP.hasPermission(user_id, k) then
					TriggerClientEvent('chatMessage',-1,v.prefix.. "^0 " ..identity.nome.." "..identity.sobrenome.. ": ",{64,64,255},rawCommand:sub(3))
					break;
				end
			end
		end
	end
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh)
	TriggerClientEvent("synctrunk",-1,nveh)
end)

RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh)
	TriggerClientEvent("syncwins",-1,nveh)
end)

RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh)
	TriggerClientEvent("synchood",-1,nveh)
end)

RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door)
	TriggerClientEvent("syncdoors",-1,nveh,door)
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE RELACIONAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
local delayShip = {}

vRP._prepare("setRelacionamento", "UPDATE vrp_user_identities SET relacionamento = @relacionamento WHERE user_id = @user_id")
vRP._prepare("getRelacionamento", "SELECT relacionamento FROM vrp_user_identities WHERE user_id = @user_id")

RegisterCommand('namorar', function(source,args)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	
	if user_id then
		if not delayShip[user_id] then delayShip[user_id] = 0 end

		if vRP.getInventoryItemAmount(user_id, "alianca") <= 0 then
			TriggerClientEvent("Notify",source,"negado","Você não possui uma aliança.",8000)
			return
		end

		if (os.time() - delayShip[user_id]) < 60 then
			TriggerClientEvent("Notify",source,"negado","Aguarde para fazer um pedido novamente.",8000)
			return
		end

		local shipUserId = getRelacionamento(user_id)
		if shipUserId.tipo ~= nil then
			TriggerClientEvent("Notify",source,"negado","Você ja está em uma relação no momento.",8000)
			return
		end

		local nplayer = vRPclient.getNearestPlayer(source, 8000)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			local nidentity = vRP.getUserIdentity(nuser_id)
			if nuser_id then
				local shipNUserId = getRelacionamento(nuser_id)
				if shipNUserId.tipo ~= nil then
					TriggerClientEvent("Notify",source,"negado","Este Jogador já está em uma relação no momento.",8000)
					return
				end
				TriggerClientEvent("Notify",source,"negado","Você está fazendo o pedido de namoro...",8000)

				TriggerClientEvent("emotes", nplayer, "cruzar")
				TriggerClientEvent("emotes", source, "ajoelhar")
				TriggerClientEvent("emotes", source, "rosa")

				local requestCasamento = vRP.request(nplayer, "O(a) "..identity.nome.. " "..identity.sobrenome.." Está pedindo sua mão em namoro, deseja aceitar?")
				if requestCasamento then
					delayShip[user_id] = os.time()
					delayShip[nuser_id] = os.time()

					TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(98, 0, 255,0.8) 3%, rgba(98, 0, 255,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://cdn.discordapp.com/attachments/928341690828345445/979172601610002453/hearts.png">'..identity.nome.. ' '..identity.sobrenome..' está namorando '..nidentity.nome..' '..nidentity.sobrenome..'</b></div>'})
					TriggerClientEvent("emotes", nplayer, "beijar")
					TriggerClientEvent("emotes", source, "beijar")

					vRP._execute("setRelacionamento", { user_id = nuser_id, relacionamento = json.encode({ tipo = "Namorando", user_id = user_id, data = os.date("%d/%m/%Y", os.time()), name = identity.nome.. " ".. identity.sobrenome }) })
					vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({ tipo = "Namorando", user_id = nuser_id, data = os.date("%d/%m/%Y", os.time()), name = nidentity.nome.. " ".. nidentity.sobrenome }) })
					vRP._updateIdentity(user_id)
					vRP._updateIdentity(nuser_id)
					vRP.tryGetInventoryItem(user_id, "alianca", 1)
				else
					TriggerClientEvent("Notify",source,"negado","Seu Pedido foi recusado.",8000)
				end
			end
		end
	end
end)

RegisterCommand('casar', function(source,args)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	
	if user_id then
		if not delayShip[user_id] then delayShip[user_id] = 0 end

		if vRP.getInventoryItemAmount(user_id, "alianca") <= 0 then
			TriggerClientEvent("Notify",source,"negado","Você não possui uma aliança.",8000)
			return
		end

		-- if (os.time() - delayShip[user_id]) < 60 then
		-- 	TriggerClientEvent("Notify",source,"negado","Aguarde para fazer um pedido novamente.",8000)
		-- 	return
		-- end

		local shipUserId = getRelacionamento(user_id)
		if shipUserId.tipo ~= nil then
			if shipUserId.tipo == "Casado(a)" then
				TriggerClientEvent("Notify",source,"negado","Sossega! Você já está Casado(a).",8000)
				return
			end

			local nplayer = vRPclient.getNearestPlayer(source, 5)
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local nidentity = vRP.getUserIdentity(nuser_id)
				if nuser_id then
					if shipUserId.user_id == nuser_id then
						TriggerClientEvent("Notify",source,"negado","Você está fazendo o pedido de casamento...",8000)

						local requestCasamento = vRP.request(nplayer, "O(a) "..identity.nome.. " "..identity.sobrenome.." Está pedindo você em casamento, deseja aceitar?")
						if requestCasamento then
							delayShip[user_id] = os.time()
							delayShip[nuser_id] = os.time()
							TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(98, 0, 255,0.8) 3%, rgba(98, 0, 255,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://cdn.discordapp.com/attachments/928341690828345445/979172601610002453/hearts.png">'..identity.nome.. ' '..identity.sobrenome..' e '..nidentity.nome..' '..nidentity.sobrenome..' acabaram de se casar.</b></div>'})
					
							vRP._execute("setRelacionamento", { user_id = nuser_id, relacionamento = json.encode({ tipo = "Casado(a)", user_id = user_id, data = os.date("%d/%m/%Y", os.time()), name = identity.nome.. " ".. identity.sobrenome }) })
							vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({ tipo = "Casado(a)", user_id = nuser_id, data = os.date("%d/%m/%Y", os.time()), name = nidentity.nome.. " ".. nidentity.sobrenome }) })
							vRP._updateIdentity(user_id)
							vRP._updateIdentity(nuser_id)
							vRP.tryGetInventoryItem(user_id, "alianca", 1)
						else
							TriggerClientEvent("Notify",source,"negado","Seu Pedido foi recusado.",8000)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Essa pessoa não namora você.",8000)
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você não está em uma relação no momento.",8000)
			return
		end
	end
end)

RegisterCommand('terminar', function(source,args)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if not delayShip[user_id] then delayShip[user_id] = 0 end

		if (os.time() - delayShip[user_id]) < 60 then
			TriggerClientEvent("Notify",source,"negado","Aguarde para fazer isso.",8000)
			return
		end

		local shipUserId = getRelacionamento(user_id)
		if shipUserId.tipo == nil then
			TriggerClientEvent("Notify",source,"negado","Você não pode terminar uma relação que não existe.",8000)
			return
		end

		if shipUserId.tipo == "Namorando" then
			TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(135, 135, 135,0.8) 3%, rgba(105, 105, 105,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://cdn.discordapp.com/attachments/928341690828345445/979177362212155413/broken-heart.png">'..identity.nome.. ' '..identity.sobrenome..' e '..shipUserId.name..' terminaram o namoro.</b></div>'})
			
			vRP._execute("setRelacionamento", { user_id = shipUserId.user_id, relacionamento = json.encode({}) })
			vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({}) })
			vRP._updateIdentity(user_id)
			vRP._updateIdentity(shipUserId.user_id)
			return
		end

		if shipUserId.tipo == "Casado(a)" then
			TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(135, 135, 135,0.8) 3%, rgba(105, 105, 105,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://cdn.discordapp.com/attachments/928341690828345445/979177362212155413/broken-heart.png">'..identity.nome.. ' '..identity.sobrenome..' e '..shipUserId.name..' terminaram o casamento.</b></div>'})
			
			vRP._execute("setRelacionamento", { user_id = shipUserId.user_id, relacionamento = json.encode({}) })
			vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({}) })
			vRP._updateIdentity(user_id)
			vRP._updateIdentity(shipUserId.user_id)
		end
	end
end)

function getRelacionamento(user_id)
	local query = vRP.query("getRelacionamento", { user_id = user_id })
	if #query > 0 then
		return json.decode(query[1].relacionamento)
	end

	return false
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- /BVIDA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("bvida")
AddEventHandler("bvida",function()
    local source = source
    vRPclient.setCustomization(source,vRPclient.getCustomization(source))
    vRP.removeCloak(source)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /mascara
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mascara',function(source,args,rawCommand)
	local source = source 
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setmascara",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end	
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /blusa
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('blusa',function(source,args,rawCommand)
	local source = source 
	Wait(500)
	local user_id = vRP.getUserId(source)
	if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
		return
	end
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
			TriggerClientEvent("setblusa",source,args[1],args[2])
		else
			TriggerClientEvent("Notify",source,"negado","Nega do","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
		end		
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /colete
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('colete',function(source,args,rawCommand)
	local source = source 
	local user_id = vRP.getUserId(source)
	local ped = GetPlayerPed(source)
	local armour = GetPedArmour(ped)
	if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
		return
	end
	
	if user_id then
		if not args[1] and not args[2] then
			vRPclient._playAnim(source,true,{"clothingshirt","try_shirt_positive_d"},false)
			Citizen.Wait(2500)
			TriggerClientEvent("removeColeteUser",source)
		else
			vRPclient._playAnim(source,true,{"clothingshirt","try_shirt_positive_d"},false)
			TriggerClientEvent("setColeteUser",source,args[1],args[2])
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /jaqueta
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('jaqueta',function(source,args,rawCommand)
	local source = source 
	Wait(500)
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setjaqueta",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maos',function(source,args,rawCommand)
	local source = source 
	--if exports["chat"]:statusChat(source) then
	Wait(500)
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setmaos",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end

	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maose
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maose',function(source,args,rawCommand)
	local source = source 
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setmaose",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /maosd
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('maosd',function(source,args,rawCommand)
	local source = source 
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setmaosd",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /calca
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('calca',function(source,args,rawCommand)
	local source = source
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setcalca",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /acessorios
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('acessorios',function(source,args,rawCommand)
	local source = source 
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setacessorios",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /sapatos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('sapatos',function(source,args,rawCommand)
	local source = source
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isInVehicle(source) or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setsapatos",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /chapeu
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('chapeu',function(source,args,rawCommand)
	local source = source
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setchapeu",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /oculos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos',function(source,args,rawCommand)
	local source = source
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setoculos",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /adesivos
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('adesivos',function(source,args,rawCommand)
	local source = source
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setsticker",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila.",8000)
			end
	--	end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /mochila
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('mochila',function(source,args,rawCommand)
	local source = source
	Wait(500)
	--if exports["chat"]:statusChat(source) then
		local user_id = vRP.getUserId(source)
		if vRPclient.getHealth(source) <= 101 or vRPclient.isHandcuffed(source) or vRP.searchReturn(source,user_id) then
			return
		end
		if user_id then
			if vRP.getInventoryItemAmount(user_id,"roupas") >= 1 or vRP.hasPermission(user_id, "perm.vipgod") or vRP.hasPermission(user_id, "perm.viprubi") or vRP.hasPermission(user_id, "perm.vipesmeralda") or vRP.hasPermission(user_id, "perm.vipplatina")  or vRP.hasPermission(user_id, "perm.vipdiamante") or vRP.hasPermission(user_id, "perm.vipsupremohavana") or vRP.hasPermission(user_id, "perm.vipmonster") or vRP.hasPermission(user_id, "perm.viphavana")  then
				TriggerClientEvent("setMochila",source,args[1],args[2])
			else
				TriggerClientEvent("Notify",source,"negado","Negado","Você não possui <b>Roupas Secundárias</b> na mochila..",8000)
			end
	--	end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /p1
-----------------------------------------------------------------------------------------------------------------------------------------

lugares = {-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30}
for k,v in pairs(lugares) do
    RegisterCommand("p"..k, function(source, args)
        if vRP.isHandcuffed() then
            return
        end
        local ped = PlayerPedId()
        SetPedConfigFlag(ped, 184, true)
        SetPedIntoVehicle(ped, GetVehiclePedIsIn(ped), v)
    end)
end

local servicesAn = {
	["perm.policia"] = { prefix = "^5[POLICIA]" },
	["perm.unizk"] = { prefix = "^1[HOSPITAL]" },
	["lscustom.permissao"] = { prefix = "^2[BENNYS]" },
	["perm.mecanica"] = { prefix = "^2[MECANICA]" },
}

RegisterCommand('anuncio',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
	
		if user_id then
			for k,v in pairs(servicesAn) do
				if vRP.hasPermission(user_id, k) then
					TriggerClientEvent('chatMessage',-1,v.prefix.. "^0 " ..identity.nome.." "..identity.sobrenome.. ": ",{64,64,255},rawCommand:sub(3))
					break;
				end
			end
		end
	end
end)


local playerDimensions = {} -- Tabela para armazenar as dimensões dos jogadores
local playerPositions = {} -- Tabela para armazenar as posições dos jogadores antes de entrar na dimensão

AddEventHandler("playerDropped", function()
    local source = source
    playerDimensions[source] = nil -- Remover o jogador da tabela ao desconectar
    playerPositions[source] = nil -- Remover a posição do jogador da tabela ao desconectar
end)

RegisterCommand('dimensao', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)

    if user_id and vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "ilegal.permissao") then
        if args[1] then
            if args[1] == "sair2" then
                playerDimensions[source] = nil -- Remover a dimensão do jogador para voltar à dimensão principal
                SetPlayerRoutingBucket(source, 0)
                TriggerClientEvent("Notify", source, "sucesso", "Você voltou para a dimensão principal.", 2000)

                -- Verificar se o jogador estava em alguma posição antes de entrar na dimensão
                local position = playerPositions[source]
                if position then
                    -- Teleportar o jogador de volta para a posição anterior
                    vRPclient.teleport(source, position.x, position.y, position.z)
                end
            else
                local dimension = tonumber(args[1])

                if dimension then
                    playerDimensions[source] = dimension -- Salvar a dimensão escolhida pelo jogador

                    -- Salvar a posição atual do jogador antes de entrar na dimensão
                    local x, y, z = vRPclient.getPosition(source)
                    playerPositions[source] = { x = x, y = y, z = z }

                    SetPlayerRoutingBucket(source, dimension)
                    TriggerClientEvent("Notify", source, "sucesso", "Você está na dimensão <b>" .. dimension .. "</b>!", 2000)
                else
                    TriggerClientEvent("Notify", source, "negado", "A dimensão deve ser um número válido.", 2000)
                end
            end
        else
            playerDimensions[source] = 0 -- Definir a dimensão principal como 0 caso o jogador não tenha fornecido uma dimensão

            -- Salvar a posição atual do jogador antes de entrar na dimensão
            local x, y, z = vRPclient.getPosition(source)
            playerPositions[source] = { x = x, y = y, z = z }

            SetPlayerRoutingBucket(source, 0)
            TriggerClientEvent("Notify", source, "negado", "Você não forneceu uma dimensão. Retornou para a dimensão principal.", 2000)
        end
    else
        TriggerClientEvent("Notify", source, "negado", "Você não tem permissão para usar este comando.", 2000)
    end
end)

-------------------------------------------------------------------------------
---- rgbcar ----    COLOCAR NO SERVER
-------------------------------------------------------------------------------
RegisterCommand('rgbcar',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"rgbcar.permissao") then
        TriggerClientEvent('rgbcar',source)
        TriggerClientEvent("Notify",source,"sucesso","Você tunou o <b>veículo</b> RGB com sucesso.")
    end
end)






















