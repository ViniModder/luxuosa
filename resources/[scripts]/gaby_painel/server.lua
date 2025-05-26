local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())

local cfg_ = module("vrp", "cfg/groups")
local groups = cfg_.groups

-- local ip = nil
local auth = true

function src.checkPermOpen(perm)

    local source = source
    local user_id = vRP.getUserId(source)

    if auth == true then
        if vRP.hasPermission(user_id, perm) then
            
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui permissão.")
            return false
        end
    else 
        TriggerClientEvent("Notify",source,"negado","SCRIPT NÃO AUTENTICADO!!.")
    end
end

function src.getayerson()

    local users = vRP.getUsers()
    local temptable = {}
    local total = GetNumayerIndices()
    local totalstaffson = vRP.getUsersByPermission('perm.ptr.staff"')
    
    for k,v in pairs(users) do

        local identity = vRP.getUserIdentity(k)
        local id = k
        if identity then
            table.insert(temptable,''..identity.nome..' '..identity.sobrenome..' ID: '..k..' ')
        end

	end
    return temptable,total,#totalstaffson
end


RegisterServerEvent('mg:getstaffs')
AddEventHandler('mg:getstaffs',function()

    local source = source
    local user_id = vRP.getUserId(source)
	local ayer = vRP.getUserSource(user_id)
	local oficiais = vRP.getUsersByPermission("staff.permissao")
	local inService = 0
	local staffs_nomes = ""
	
	if (oficiais ~= nil) then
		for k,v in ipairs(oficiais) do
			local identity = vRP.getUserIdentity(parseInt(v))
			inService = inService + 1
			staffs_nomes = staffs_nomes .. "<b>[" .. v .. "]</b>: " .. identity.nome .. " " .. identity.sobrenome .. "<br>"
		end
	end

	TriggerClientEvent("Notify",source,"aviso", "Atualmente <b>"..inService.." Staffs </b> em serviço.",10000)

	if vRP.hasPermission(user_id,"staff.permissao") and parseInt(inService) > 0 then
		TriggerClientEvent("Notify",source,"aviso", staffs_nomes,10000)
	end

end)


RegisterServerEvent("mgps:tpto")
AddEventHandler("mgps:tpto",function(nuser_id)

    local source = source
	local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)

    local tayer = vRP.getUserSource(parseInt(nuser_id))
    local perm = false

    for k,v in pairs (cfg.permissao_opcoes['botao_irate'].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end
    if perm then
        if tayer then
            vRPclient.teleport(source,vRPclient.getPosition(tayer))
            mg_log(cfg.permissao_opcoes['botao_irate'].webhook,'```prolog\n[REGISTRO BOTAO AYERS ON IR ATE]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n\n[USOU ABA AYERS E FOI ATE O ID]: '..parseInt(nuser_id)..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
            if cfg.tpto_em_nc then
                vRPclient.toggleNoclip(source)
            end
            return
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui permissão para usar esta opção.")
    end
end)

RegisterServerEvent("mgps:tptome")
AddEventHandler("mgps:tptome",function(nuser_id)

    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)

    local tayer = vRP.getUserSource(parseInt(nuser_id))
    local x,y,z = vRPclient.getPosition(source)
    local perm = false

    for k,v in pairs (cfg.permissao_opcoes['botao_puxar'].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end
    if perm then
        if tayer then
            vRPclient.teleport(tayer,x,y,z)
            mg_log(cfg.permissao_opcoes['botao_puxar'].webhook,'```prolog\n[REGISTRO BOTAO AYERS ON PUXAR]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n\n[USOU ABA AYERS E PUXOU O ID]: '..parseInt(nuser_id)..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
            return
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui permissão para usar esta opção.")
    end
end)

function src.getitemlist()
    local source = source
    local user_id = vRP.getUserId(source)
    
    local item_list = vRP.getAllItens()
    local temptable = {}

    for k,v in pairs(item_list) do
        table.insert(temptable,k)
    end

    return temptable
end

RegisterServerEvent("mgpc:s_giveitem")
AddEventHandler("mgpc:s_giveitem",function(item,qtd)

    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local perm = false

    for k,v in pairs (cfg.permissao_opcoes['aba_itens'].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end
    if user_id then
        if perm then
            vRP.giveInventoryItem(user_id, item, qtd,true)
            mg_log(cfg.permissao_opcoes['aba_itens'].webhook,'```prolog\n[REGISTRO ABA ITENS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n\n[USOU ABA ITENS E PEGOU O ITEM]: '..item..'\n[NA QUANTIDADE]: x '..qtd..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
            return
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui permissão para usar esta aba.")
        end
    end
end)

RegisterServerEvent("mgps:s_revive")
AddEventHandler("mgps:s_revive",function(id)

    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local nayer = vRP.getUserSource(parseInt(id))
    local perm = false

    for k,v in pairs (cfg.permissao_opcoes['botao_reviver'].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end

    if perm then
        TriggerClientEvent("resetBleeding",nayer)
        TriggerClientEvent("resetDiagnostic",nayer)
        vRPclient.killGod(nayer)
        vRPclient.setHealth(nayer,400)
        vRP.setHunger(nayer, -100)
        vRP.setThirst(nayer, -100)
        TriggerClientEvent("Notify",source,"sucesso","Você reviveu o ID: "..parseInt(id)..".")
        mg_log(cfg.permissao_opcoes['botao_reviver'].webhook,'```prolog\n[REGISTRO BOTAO AYERS ON REVIVER]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n\n[USOU ABA AYERS E REVIVEU O ID]: '..parseInt(id)..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
        return
    else
        TriggerClientEvent("Notify",source,"negado","Você não possui permissão para usar esta opção.")
    end 
end)

RegisterServerEvent("mgpc:s_confirmgeral")
AddEventHandler("mgpc:s_confirmgeral",function(id,act)

    local source = source
    local isource = vRP.getUserId(source)
    local user_id = id
    local myid = vRP.getUserId(source)
    local nsource = vRP.getUserSource(parseInt(user_id))
    local identity = vRP.getUserIdentity(myid)

    if act == "wladd" then
        local perm = false

        for k,v in pairs (cfg.permissao_opcoes['liberar_wl'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end
            if perm then
                vRP.setWhitelisted(parseInt(user_id),true)
                TriggerClientEvent("Notify",source,"sucesso","Você aprovou o passaporte <b>"..user_id.."</b> na whitelist.")
                mg_log(cfg.permissao_opcoes['liberar_wl'].webhook,'```prolog\n[REGISTRO DE WL LIBERADA]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[LIBEROU O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")               
            end
    elseif act == "wlrem" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['remover_wl'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                vRP.setWhitelisted(parseInt(user_id),false)
                TriggerClientEvent("Notify",source,"sucesso","Você retirou o passaporte <b>"..user_id.."</b> da whitelist.")
                mg_log(cfg.permissao_opcoes['remover_wl'].webhook,'```prolog\n[REGISTRO DE WL RETIRADA]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[TIROU WL DO ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
    
    elseif act == "god" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['reviver'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    vRPclient.killGod(nsource)
                    vRPclient.setHealth(nsource,400)
                    vRP.setHunger(nsource, -100)
                    vRP.setThirst(nsource, -100)
                    TriggerClientEvent("Notify",source,"sucesso","Você reviveu o ID: "..user_id.."")
                    mg_log(cfg.permissao_opcoes['reviver'].webhook,'```prolog\n[REGISTRO DE GOD / REVIVER]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[REVIVEU O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end

    elseif act == "godall" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['reviver_todos'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end
        
            if perm then
                local users = vRP.getUsers()
                for k,v in pairs(users) do
                    local idall = vRP.getUserSource(parseInt(k))
                    if idall then
                        TriggerClientEvent("resetBleeding",idall)
                        TriggerClientEvent("resetDiagnostic",idall)
                        vRPclient.killGod(idall)
                        vRPclient.setHealth(idall,400)
                        return
                    end
                end
                TriggerClientEvent("Notify",source,"sucesso","Você reviveu todos ayers")
                mg_log(cfg.permissao_opcoes['reviver_todos'].webhook,'```prolog\n[REGISTRO DE GODALL / REVIVER TODOS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[REVIVEU TODOS AYERS]\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end 
     
    elseif act == "kill" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['matar'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    vRPclient.killGod(nsource)
                    vRPclient.setHealth(nsource,0)
                    vRP.varyThirst(nsource,-100)
                    vRP.varyHunger(nsource,-100)
                    TriggerClientEvent("Notify",source,"sucesso","Você matou o ID: "..user_id.."")
                    mg_log(cfg.permissao_opcoes['matar'].webhook,'```prolog\n[REGISTRO DE KILL / MATAR]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[MATOU O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
    
    elseif act == "fix" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['concertar_veiculo'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local vehicle = vRPclient.getNearestVehicle(source,10)
                if vehicle then
                    TriggerClientEvent('reparar',source,vehicle)
                    TriggerClientEvent("Notify",source,"sucesso","Você reparou o veículo mais próximo")
                    mg_log(cfg.permissao_opcoes['concertar_veiculo'].webhook,'```prolog\n[REGISTRO DE FIX]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                else
                    TriggerClientEvent("Notify",source,"importante","Nenhum veículo próximo!")
                    return
                end
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "tuning" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['tunar_veiculo'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local vehicle = vRPclient.isInVehicle(source)
                local vehiclex = vRPclient.getNearestVehicle(source,3)
                if vehicle then
                    TriggerClientEvent('vehtuning',source,vehiclex)
                    TriggerClientEvent("Notify",source,"sucesso","Você tunou este veículo")
                else
                    TriggerClientEvent("Notify",source,"importante","Esteja dentro de algum veículo!")
                end
                mg_log(cfg.permissao_opcoes['tunar_veiculo'].webhook,'```prolog\n[REGISTRO DE TUNING]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end

    elseif act == "tptome" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['tptome'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local x,y,z = vRPclient.getPosition(source)
                if nsource then
                    vRPclient.teleport(nsource,x,y,z)
                    mg_log(cfg.permissao_opcoes['tptome'].webhook,'```prolog\n[REGISTRO DE TPTOME / PUXAR]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[PUXOU O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
      
    elseif act == "tpto" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['tpto'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    vRPclient.teleport(source,vRPclient.getPosition(nsource))
                    mg_log(cfg.permissao_opcoes['tpto'].webhook,'```prolog\n[REGISTRO DE TPTO / IR ATE]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[FOI ATE O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    if cfg.tpto_em_nc then
                        vRPclient.toggleNoclip(source)
                    end
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
      
    elseif act == "tpway" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['tpway'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                TriggerClientEvent('tptoway',source)
                SetTimeout(2000,function()
                    local x,y,z = vRPclient.getPosition(source)
                    mg_log(cfg.permissao_opcoes['tpway'].webhook,'```prolog\n[REGISTRO DE TPTO / IR ATE]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[FOI ATE]: '..tD(x)..', '..tD(y)..', '..tD(z)..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                end)
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
 
    elseif act == "tpcds" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['tpcds'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local fcoords = vRP.prompt(source,"Cordenadas:","")
                if fcoords == "" then
                    return
                end
                local coords = {}
                for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
                    table.insert(coords,parseInt(coord))
                end
                vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
                SetTimeout(2000,function()
                    local x,y,z = vRPclient.getPosition(source)
                    mg_log(cfg.permissao_opcoes['tpcds'].webhook,'```prolog\n[REGISTRO DE TPCDS / TP EM CORDENADA]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[FOI ATE]: '..tD(x)..', '..tD(y)..', '..tD(z)..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                end)
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
       
    elseif act == "hash" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['hash_veiculo'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local vehicle = vRPclient.isInVehicle(source)
                if vehicle then
                    local vehiclex = vRPclient.getNearestVehicle(source,7)
                        if vehiclex then
                            vRP.prompt(source, "Hash Veiculo: ", vCLIENT.returnHashVeh(source,vehiclex))
                        end
                    mg_log(cfg.permissao_opcoes['hash_veiculo'].webhook,'```prolog\n[REGISTRO DE HASH]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"importante","Esteja dentro de algum veículo!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "presetclothes" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['preset_roupas'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local ayer_customs = {}
                local custom = vRPclient.getCustomization(source)

                if ayer_customs[source] then
                    ayer_customs[source] = nil
                    vRPclient._removeDiv(source,"customization")
                else 
                    local content = ""
                    for k, v in pairs(custom) do
                        if (IsNumber(k) and k <= 11) or k == "p0" or k == "p1" or k == "p2" or k == "p6" or k == "p7" then
                            if IsNumber(k) then
                                content = content .. '[' .. k .. '].perm = {' 
                            else
                                content = content .. '["' ..k..'"] = {'
                            end
                            local contador = 1
                            for y, x in pairs(v) do
                                if contador < #v then
                                    content  = content .. x .. ',' 
                                else
                                    content = content .. x 
                                end
                                contador = contador + 1
                            end
                            content = content .. "},\n"
                        end
                    end
                    ayer_customs[source] = true
                    vRPclient.prompt(source, 'vRoupas: ', content)
                    mg_log(cfg.permissao_opcoes['preset_roupas'].webhook,'```prolog\n[REGISTRO DE PRESET CLOTHES]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')

                    TriggerClientEvent("Notify",source,"sucesso","Pressione CRTL + A e CTRL + C para copiar o preset de sua roupa")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
       
    elseif act == "givemoney" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['dar_dinheiro'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    local quantidade = vRP.prompt(source, 'Quantia: ', '')
                    if parseInt(quantidade) >= 1 then
                        TriggerClientEvent("Notify",source,"sucesso","Você spawnou R$ "..quantidade.." Para o ID: "..id.."")
                        vRP.giveInventoryItem(id, cfg.item_dinheiro, parseInt(quantidade),true)
                        mg_log(cfg.permissao_opcoes['dar_dinheiro'].webhook,'```prolog\n[REGISTRO DE MONEY / DAR DINHEIRO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[GIVOU DINHEIRO PARA O ID]: '..user_id..'\n[QUANTIDADE]: R$ '..quantidade..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                        return
                    else
                        TriggerClientEvent("Notify",source,"negado","Coloque um valor válido!")
                        return
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
   
    elseif act == "send_dm" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['mensagem_privada'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    local mensagem = vRP.prompt(source, 'Digite a mensagem: ', '')
                    if mensagem == "" then
                        return
                    end
                    vRPclient.setDiv(nsource,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 25%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                    mg_log(cfg.permissao_opcoes['mensagem_privada'].webhook,'```prolog\n[REGISTRO DE MENSAGEM PRIVADA]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[MANDOU MENSAGEM PARA O ID]: '..user_id..'\n[MENSAGEM]: '..mensagem..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    SetTimeout(20000,function()
                        vRPclient.removeDiv(nsource,"anuncio")
                    end)
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
       
    elseif act == "send_adm" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['aviso_adm'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local mensagem = vRP.prompt(source, 'Digite a mensagem para todos no servidor: ', '')
                if mensagem == "" then
                    return
                end
                vRPclient.setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 25%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; } bold { font-size: 16px; }","<bold>"..mensagem.."</bold><br><br>Mensagem enviada por: Administrador")
                mg_log(cfg.permissao_opcoes['aviso_adm'].webhook,'```prolog\n[REGISTRO DE MENSAGEM ADM]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[MANDOU MENSAGEM PARA TODOS]: '..user_id..'\n[MENSAGEM]: '..mensagem..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                SetTimeout(20000,function()
                    vRPclient.removeDiv(-1,"anuncio")
                end)
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
   
    elseif act == "catch_rg" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['puxar_rg'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local identity = vRP.getUserIdentity(id)
                local bankMoney = vRP.getBankMoney(id)
                local walletMoney = vRP.getMoney(id)
                local sets = json.decode(vRP.getUData(id,"vRP:datatable"))
                local multas = vRP.getUData(user_id,"vRP:multas")
                
                TriggerClientEvent("Notify",source,"aviso","ID: <b>"..parseInt(id).."</b><br>Nome: <b>"..identity.nome.." "..identity.sobrenome.."</b><br>Idade: <b>"..identity.idade.."</b><br>Telefone: <b>"..identity.telefone.."</b><br>Carteira: <b>"..vRP.format(parseInt(walletMoney)).."</b><br>Banco: <b>"..vRP.format(parseInt(bankMoney)).."</b><br>Multas: <b>"..vRP.format(parseInt(multas)).."</b><br>Sets: <b>"..json.encode(sets.groups).."</b>",25000)
                mg_log(cfg.permissao_opcoes['puxar_rg'].webhook,'```prolog\n[REGISTRO DE PUXAR RG]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[PUXOU RG DO ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "freeze" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['congelar_ayer'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    FreezeEntityPosition(nsource, true)
                    TriggerClientEvent("Notify",source,"sucesso","Você congelou o ID: "..id.."")
                    mg_log(cfg.permissao_opcoes['congelar_ayer'].webhook,'```prolog\n[REGISTRO CONGELAR AYER]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[CONGELOU O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
   
    elseif act == "unfreeze" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['descongelar_ayer'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    FreezeEntityPosition(nsource, false)
                    TriggerClientEvent("Notify",source,"sucesso","Você descongelou o ID: "..id.."")
                    mg_log(cfg.permissao_opcoes['descongelar_ayer'].webhook,'```prolog\n[REGISTRO DESCONGELAR AYER]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[DESCONGELOU O ID]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
   
    elseif act == "ban" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['banir'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local motivo = vRP.prompt(source, 'Motivo do ban: ', '')
                if motivo == "" then

                    TriggerClientEvent("Notify",source,"negado","Coloque o motivo do ban!")
                    return
                end
                if motivo then
                    vRP.setBanned(parseInt(id),true)
                    TriggerClientEvent("Notify",source,"sucesso","Você baniu o ID: "..id.."")
                    mg_log(cfg.permissao_opcoes['banir'].webhook,'```prolog\n[REGISTRO DE BAN]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[BANIU O ID]: '..user_id..'\n[MOTIVO]: '..motivo..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    if nsource then
                        vRP.kick(nsource,"Você foi banido! Motivo: "..motivo.."")
                        return
                    end
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
      
    elseif act == "unban" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['desbanir'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local motivo = vRP.prompt(source, 'Motivo do desbanimento: ', '')
                if motivo == "" then

                    TriggerClientEvent("Notify",source,"negado","Coloque o motivo do ban!")
                    return
                end
                if motivo then
                    vRP.setBanned(parseInt(id),false)
                    TriggerClientEvent("Notify",source,"sucesso","Você desbaniu o ID: "..id.."")
                    mg_log(cfg.permissao_opcoes['desbanir'].webhook,'```prolog\n[REGISTRO DE UNBAN]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[DESBANIU O ID]: '..user_id..'\n[MOTIVO]: '..motivo..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
 
    elseif act == "kick" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['kickar_expulsar'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local motivo = vRP.prompt(source, 'Motivo da expulsão / kick: ', '')
                if motivo == "" then
        
                    TriggerClientEvent("Notify",source,"negado","Coloque o motivo do ban!")
                    return
                end
                if motivo then
                    vRP.kick(nsource,"Você foi expulso da cidade. Motivo: "..motivo.."")
                    TriggerClientEvent("Notify",source,"sucesso","Você kickou o ID: "..id.."")
                    mg_log(cfg.permissao_opcoes['kickar_expulsar'].webhook,'```prolog\n[REGISTRO DE KICK / EXPULSAR]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[KICKOU O ID]: '..user_id..'\n[MOTIVO]: '..motivo..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
    
    elseif act == "give_veh" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['dar_veiculo'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
               
                local vehicle = vRP.prompt(source, 'Qual spawn do veículo quer entregar:', '')
                if vehicle == "" then

                    TriggerClientEvent("Notify",source,"negado","Coloque o spawn do veículo!")
                    return
                end
                if vehicle then
                    -- vRP.execute("mg_give_veh", {
                    --     user_id = id, vehicle = vehicle, detido = 0, time = 0, engine = 1000, body = 1000, fuel = 100, ipva = os.time()
                    -- })
                    vRP.execute("bm_module/dealership/addUserVehicle", { vehicle = vehicle, user_id = id, ipva = os.time() })
                    TriggerClientEvent("Notify",source,"sucesso","Você adicionou o veículo "..vehicle.." na garagem do ID: "..id.."",10000)
                    mg_log(cfg.permissao_opcoes['dar_veiculo'].webhook,'```prolog\n[REGISTRO DE ADDCAR / DAR VEICULO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[ADICIONOU UM VEICULO PRO ID:]: '..user_id..'\n[VEICULO]: '..vehicle..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
    
    elseif act == "rem_veh" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['remover_veiculo'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                -- vRP._prepare("mg_rem_veh","DELETE FROM vrp_user_vehicles WHERE user_id = :user_id AND vehicle = :vehicle")
                local vehicle = vRP.prompt(source, 'Qual spawn do veículo quer remover:', '')
                if vehicle == "" then

                    TriggerClientEvent("Notify",source,"negado","Coloque o spawn do veículo!")
                    return
                end
                if vehicle then
                    vRP.execute("bm_module/dealership/removeUserVehicle", { vehicle = vehicle, user_id = id })
                    TriggerClientEvent("Notify",source,"sucesso","Você removeu o veículo "..vehicle.." da garagem do ID: "..id.."",10000)
                    mg_log(cfg.permissao_opcoes['remover_veiculo'].webhook,'```prolog\n[REGISTRO DE REMCAR / REMOVER VEICULO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[REMOVEU UM VEICULO DO ID:]: '..user_id..'\n[VEICULO]: '..vehicle..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
      
    elseif act == "spawn_veh" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['spawnar_veiculo'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local vehicle = vRP.prompt(source, 'Coloque o spawn do veículo: ', '')
                if vehicle == "" then
        
                    TriggerClientEvent("Notify",source,"negado","Coloque o spawn do veículo!")
                    return
                end
                if vehicle then
                    TriggerClientEvent('spawnarveiculopp',source,vehicle)
                    mg_log(cfg.permissao_opcoes['spawnar_veiculo'].webhook,'```prolog\n[REGISTRO DE REMCAR / REMOVER VEICULO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[REMOVEU UM VEICULO DO ID:]: '..user_id..'\n[VEICULO]: '..vehicle..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "set_skin" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['setar_skin'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    local skin = vRP.prompt(source, 'Coloque a skin: ', '')
                    if skin == "" then

                        TriggerClientEvent("Notify",source,"negado","Coloque o nome da skin!")
                        return
                    end
                    if skin then
                        TriggerClientEvent("skinmenu",nsource,skin)
                        TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..skin.."</b> no passaporte <b>"..parseInt(id).."</b>.")
                        mg_log(cfg.permissao_opcoes['setar_skin'].webhook,'```prolog\n[REGISTRO DE SKIN]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[SETOU UMA SKIN NO ID:]: '..user_id..'\n[SKIN]: '..skin..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                        return
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "give_item" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['dar_item'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    local item = vRP.prompt(source, 'Spawn do item: ', '')

                    if item == "" then
                        return
                    end

                    local quantidade = vRP.prompt(source, 'Quantia: ', '')
                    if parseInt(quantidade) >= 1 then
                        TriggerClientEvent("Notify",source,"sucesso","Você spawnou x"..quantidade.." "..item.." Para o ID: "..id.."")
                        vRP.giveInventoryItem(id, item, parseInt(quantidade),true)
                        mg_log(cfg.permissao_opcoes['dar_item'].webhook,'```prolog\n[REGISTRO DE GIVE ITEM / DAR ITEM]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[GIVOU ITEM PARA O ID:]: '..user_id..'\n[ITEM]: '..item..'\n[QUANTIDADE]: x '..quantidade..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                        return
                    else
                        TriggerClientEvent("Notify",source,"negado","Coloque um valor válido!")
                        return
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
      
    elseif act == "remove_item" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['retirar_item'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    local item = vRP.prompt(source, 'Spawn do item: ', '')

                    if item == "" then
                        return
                    end

                    local quantidade = vRP.prompt(source, 'Quantia: ', '')
                    if vRP.getInventoryItemAmount(id, item) >= parseInt(quantidade) then
                        if parseInt(quantidade) >= 1 then
                            TriggerClientEvent("Notify",source,"sucesso","Você removeu x"..quantidade.." "..item.." Do ID: "..id.."")
                            vRP.tryGetInventoryItem(id, item, parseInt(quantidade),true)
                            mg_log(cfg.permissao_opcoes['retirar_item'].webhook,'```prolog\n[REGISTRO DE REM ITEM / TIRAR ITEM]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[TIROU ITEM DO ID:]: '..user_id..'\n[ITEM]: '..item..'\n[QUANTIDADE]: x '..quantidade..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                            return
                        else
                            TriggerClientEvent("Notify",source,"negado","Coloque um valor válido!")
                            return
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Este ID não possui este item ou esta quantia!")
                        return
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
        
    elseif act == "remove_money" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['retirar_dinheiro'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    local type_ = vRP.prompt(source, 'Irá retirar do "carteira" ou "banco": ', '')

                    if type_ == "" then
                        return
                    end

                    if type_ == "carteira" then
                        local quantidade = vRP.prompt(source, 'Quantia: ', '')
                        if vRP.getInventoryItemAmount(id, cfg.item_dinheiro) >= parseInt(quantidade) then
                            if parseInt(quantidade) >= 1 then
                                TriggerClientEvent("Notify",source,"sucesso","Você removeu x"..quantidade.." "..cfg.item_dinheiro.." Do ID: "..id.."")
                                vRP.tryGetInventoryItem(id, cfg.item_dinheiro, parseInt(quantidade),true)
                                mg_log(cfg.permissao_opcoes['retirar_dinheiro'].webhook,'```prolog\n[REGISTRO DE REMOVER DINHEIRO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[TIROU DINHEIRO DA CARTEIRA ID:]: '..user_id..'\n[LOCAL]: '..type_..'\n[QUANTIDADE]: R$ '..quantidade..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                                return
                            else
                                TriggerClientEvent("Notify",source,"negado","Coloque um valor válido!")
                                return
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Este ID não possui este item ou esta quantia!")
                            return
                        end
                    elseif type_ == "banco" then
                        local money = vRP.getBankMoney(id)
                        local quantidade = vRP.prompt(source, 'Quantia: ', '')
                        if vRP.getBankMoney(id) >= parseInt(quantidade) then
                            if parseInt(quantidade) >= 1 then
                                TriggerClientEvent("Notify",source,"sucesso","Você removeu x"..quantidade.." do banco do ID: "..id.."")
                                vRP.setBankMoney(id,money-quantidade)
                                mg_log(cfg.permissao_opcoes['retirar_dinheiro'].webhook,'```prolog\n[REGISTRO DE REMOVER DINHEIRO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[TIROU DINHEIRO DO BANCO ID:]: '..user_id..'\n[LOCAL]: '..type_..'\n[QUANTIDADE]: R$ '..quantidade..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                                return
                            else
                                TriggerClientEvent("Notify",source,"negado","Coloque um valor válido!")
                                return
                            end
                        else
                            TriggerClientEvent("Notify",source,"negado","Este ID não possui esta quantia no banco!")
                            return
                        end
                    else
                        TriggerClientEvent("Notify",source,"negado","Coloque carteira ou banco!")
                        return
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
    
    elseif act == "clear_inv" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['limpar_inventario'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    vRP.clearInventory(id)
                    TriggerClientEvent("Notify",source,"sucesso","Você limpou o inventário do ID: "..id.."")
                    mg_log(cfg.permissao_opcoes['limpar_inventario'].webhook,'```prolog\n[REGISTRO DE LIMPAR INVENTARIO]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[LIMPOU O INVENTARIO DO ID:]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
       
    elseif act == "clear_weapons" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['limpar_armas'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                if nsource then
                    TriggerClientEvent('limparArmas',nsource)
                    mg_log(cfg.permissao_opcoes['limpar_armas'].webhook,'```prolog\n[REGISTRO DE LIMPAR ARMAS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n\n[LIMPOU AS ARMAS DO ID:]: '..user_id..'\n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
      
    elseif act == "dv" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['dv'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local vehicle = vRPclient.getNearestVehicle(source,10)
                if vehicle then

                    TriggerEvent('test:deleteveh',source)

                    TriggerClientEvent("Notify",source,"sucesso","Você deletou o veículo mais próximo")
                    mg_log(cfg.permissao_opcoes['dv'].webhook,'```prolog\n[REGISTRO DE DV]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"importante","Nenhum veículo próximo!")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
    
    elseif act == "dvall" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['dvall'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then

                local distancia = vRP.prompt(source, 'Distancia: ', '')

                if tonumber(distancia) then
             
                   
                        -- TriggerClientEvent('deleteVeh', source, k, vehicles)
                        
                        TriggerEvent('test:deleteveh_all',source,distancia)


              
                    TriggerClientEvent("Notify",source,"sucesso","Você deletou os veículos mais próximos")
                    mg_log(cfg.permissao_opcoes['dvall'].webhook,'```prolog\n[REGISTRO DE DVALL]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                    return
                else
                    TriggerClientEvent("Notify",source,"importante","Coloque uma distancia válida")
                    return
                end
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "clear_allveh" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['limpar_veiculos'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0Contagem Iniciada ^260s^0 para limpeza de veiculos. (Entre em seu veiculo para não ser removido)")
                Wait(5000)
                local deleteCount = 0
                local entityList = {}
                for k,v in ipairs(GetAllVehicles()) do 
                    local ped = GetPedInVehicleSeat(v, -1)
                    if not ped or ped <= 0 then 
                        DeleteEntity(v)

                        if GetEntityScript(v) ~= nil then
                            if not entityList[GetEntityScript(v)] then entityList[GetEntityScript(v)] = 0 end
                            entityList[GetEntityScript(v)] = entityList[GetEntityScript(v)] + 1
                        end

                        deleteCount = deleteCount + 1
                    end
                end
                TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0"..deleteCount.." veiculo deletados!")
                mg_log(cfg.permissao_opcoes['limpar_veiculos'].webhook,'```prolog\n[REGISTRO DE LIMPAR VEICULOS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end
     
    elseif act == "clear_props" then
        local perm = false
        
        for k,v in pairs (cfg.permissao_opcoes['limpar_props'].perm) do
            if vRP.hasPermission(myid, v) then
                perm = true
            end
        end

            if perm then
                local x,y,z = vRPclient.getPosition(source)
                TriggerClientEvent("syncarea",-1,x,y,z)
                mg_log(cfg.permissao_opcoes['limpar_props'].webhook,'```prolog\n[REGISTRO DE LIMPAR PROPS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..myid..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
            end

    else
        print('ERROR!!! NO DATA ACT')
    end

end)

function src.catchgroups()

local s_groups = {}
  
    for k,v in pairs(groups) do
        if not string.find(k,"Paisana") and not string.find(k,"off") then
            table.insert(s_groups,k)
        end
    end

    table.sort(s_groups)

    return s_groups
end


RegisterServerEvent('catch_ayergroups')
AddEventHandler('catch_ayergroups',function(id)

    local source = source
    local p_groups = {}

    local nsource = vRP.getUserSource(id)

    if not nsource then
        TriggerClientEvent("Notify",source,"negado","Este ID não está online!")
        return
    end

    pgroups = vRP.getUserGroups(id)

    for k,v in pairs(pgroups) do
        table.insert(p_groups,k)
    end

    table.sort(p_groups)

    TriggerClientEvent('confirm_ayer_groups',source,p_groups)
end)

RegisterServerEvent('s_addusergroup')
AddEventHandler('s_addusergroup',function(id,group)

    local source = source
    local user_id = vRP.getUserId(source)
    local id = parseInt(id)
    local perm = false
        
    for y,z in pairs (cfg.permissao_opcoes['setar_cargo'].perm) do
        if vRP.hasPermission(user_id, z) then
            perm = true
        end
    end


        if perm then
            
            for k,v in pairs (cfg.hierarquiastaff) do
                for x,d in pairs(v['nao_pode_setar']) do
                    if vRP.hasPermission(user_id, v['permissao']) then
                        if group == d then

                            TriggerClientEvent("Notify",source,"negado","Você não pode setar um cargo superior!.")
                            return false
                        end
                    end
                end
            end
            
            vRP.addUserGroup(id, group)

            local identity = vRP.getUserIdentity(user_id)
            mg_log(cfg.permissao_opcoes['setar_cargo'].webhook,'```prolog\n[REGISTRO DE SETAGEM]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n\n[SETOU O ID:]: '..id..'\n\n[CARGO SETADO]: '..group..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
            TriggerClientEvent("Notify",source,"aviso","Você setou o ID: "..id.." no cargo: "..group.."")
            return
        else
            TriggerClientEvent("Notify",source,"negado","Você não tem permissão para setar.")
        end
   
end)


RegisterServerEvent('s_remusergroup')
AddEventHandler('s_remusergroup',function(id,group)
    
    local source = source
    local user_id = vRP.getUserId(source)

    local id = parseInt(id)
    local perm = false
        
    for y,z in pairs (cfg.permissao_opcoes['remover_cargo'].perm) do
        if vRP.hasPermission(user_id, z) then
            perm = true
        end
    end


        if perm then
            
            for k,v in pairs (cfg.hierarquiastaff) do
                for x,d in pairs(v['nao_pode_setar']) do
                    if vRP.hasPermission(user_id, v['permissao']) then
                        if group == d then

                            TriggerClientEvent("Notify",source,"negado","Você não pode setar um cargo superior!.")
                            return false
                        end
                    end
                end
            end

            vRP.removeUserGroup(id, group)

            local identity = vRP.getUserIdentity(user_id)
            mg_log(cfg.permissao_opcoes['remover_cargo'].webhook,'```prolog\n[REGISTRO DE REMOVER SET]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n\n[TIROU O SET DO ID:]: '..id..'\n\n[CARGO RETIRADO]: '..group..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
            TriggerClientEvent("Notify",source,"aviso","Você tirou o ID: "..id.." do cargo: "..group.."")
            return
        else
            TriggerClientEvent("Notify",source,"negado","Você não tem permissão para remover set.")
        end
   
end)

RegisterServerEvent('s_tptoloc')
AddEventHandler('s_tptoloc',function(cds,tipo,nome)

    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local perm = false
        
    for k,v in pairs (cfg.permissao_opcoes[tipo].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end

    if tipo then

            if perm then
                vRPclient.teleport(source,cds.x or 0,cds.y or 0,cds.z or 0)
                mg_log(cfg.permissao_opcoes[tipo].webhook,'```prolog\n[REGISTRO BOTAO LOCAIS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n[USOU O BOTAO LOCAIS E FOI PARA]: '..nome..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
                return
            else
                TriggerClientEvent("Notify",source,"aviso","Você não tem permissão para dar tp neste local")
            end
       
    elseif tipo == nil then
        vRPclient.teleport(source,cds.x or 0,cds.y or 0,cds.z or 0)
        mg_log(cfg.permissao_opcoes['normal'].webhook,'```prolog\n[REGISTRO BOTAO LOCAIS]\n\n[NOME]: '..identity.nome..' '..identity.sobrenome..'\n[PASSAPORTE]: '..user_id..'\n[USOU O BOTAO LOCAIS E FOI PARA]: '..nome..' \n'..os.date('\n[Data]: %d/%m/%y \n[Hora]: %H:%M:%S')..' \r```')
        return
    end
    
end)


function IsNumber( numero )
    return tonumber(numero) ~= nil
end

local pressetHooks = {}

function mg_log(weebhook, mensagge)
    if weebhook and mensagge then
        if pressetHooks[weebhook] ~= nil then
            SendWebhookMessage(pressetHooks[weebhook][1],mensagge)
        else
            SendWebhookMessage(weebhook,mensagge)
        end
    end
end

function SendWebhookMessage(webhook,message)
    if webhook ~= "none" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'apication/json' })
    end
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end







RegisterServerEvent('mg:spawncar')
AddEventHandler('mg:spawncar',function(vehicle)

    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local perm = false
        
    for k,v in pairs (cfg.permissao_opcoes['aba_carros'].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end

    if vehicle then
        TriggerClientEvent('spawnarveiculopp',source,vehicle)
    end
    
end)

RegisterServerEvent('mg:setskin')
AddEventHandler('mg:setskin',function(skin)

    local perm = false
    
    local source = source
    local user_id = vRP.getUserId(source)

    for k,v in pairs(cfg.permissao_opcoes['setar_skin'].perm) do
        if vRP.hasPermission(user_id, v) then
            perm = true
        end
    end

    if perm then

        local id = vRP.prompt(source,"ID:","")

        local nsource = vRP.getUserSource(parseInt(id))
        if tonumber(id) then
            TriggerClientEvent("skinmenu",nsource,skin)
            TriggerClientEvent("Notify",source,"sucesso","Voce setou a skin <b>"..skin.."</b> no passaporte <b>"..parseInt(id).."</b>.")
        return
        end
    else
        TriggerClientEvent("Notify",source,"negado","Você não pode usar esta opção.")
    end

end)