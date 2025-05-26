


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREPARES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Functions.prepare('bm_module/orgs/GetDataTable', " SELECT user_id,dvalue FROM vrp_user_data WHERE dkey = 'vRP:datatable' ")
Functions.prepare('bm_module/orgs/CreateOrgIfNotExist', " INSERT IGNORE INTO painel_facs(org) VALUES (@org) ")
Functions.prepare('bm_module/orgs/GetOrgsInfo', " SELECT bank,description,parceiras,historico,metas,image FROM painel_facs WHERE org = @org ")

Functions.prepare('bm_module/getLast', " SELECT * FROM vrp_users WHERE id = @id ")

Functions.prepare('bm_module/updateDesc', "UPDATE painel_facs SET description = @description WHERE org = @org")

Functions.prepare('bm_module/updateParc', "UPDATE painel_facs SET parceiras = @parceiras WHERE org = @org")

Functions.prepare('bm_module/updateMetas', "UPDATE painel_facs SET metas = @metas WHERE org = @org")

Functions.prepare('bm_module/updateImage', "UPDATE painel_facs SET image = @image WHERE org = @org")

Functions.prepare('bm_module/updateBankAndHistoric', "UPDATE painel_facs SET bank = @bank, historico = @historico WHERE org = @org")

Functions.prepare('sjr/getItens', 'SELECT * from facs_farmsystem WHERE user_id = @user_id')

Functions.prepare('sjr/getBau', 'SELECT * from sjr_logs WHERE bau = @bau')

Functions.prepare('sjr/deleteAll', 'DELETE FROM facs_farmsystem WHERE NOT day = @day')


Functions.prepare('sjr/setItens', 'REPLACE INTO facs_farmsystem(user_id, itens, day) VALUES(@user_id, @itens, @day)')


local AntiFlood = {}
local Time = {}
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ORGS = {
    List = {
        --["Lider [MAFIA02]"] = "Mafia 02" @params group(string), @params groupType(string)
    },

    Member = {
        --[1] = { @params user_id(integer)
        --  group = "Lider [MAFIA02]" @params group(string)
        --  groupType = "MAFIA02" @params groupType(string)
        --}
    },

    MembersList = {
        --["Mafia 02"] = { @params group(string)
        -- [1] = true @params user_id(int)
        --}
    },
}




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:AddUserGroup(user_id, v)
    self.Member[user_id] = v
    
    if not self.MembersList[v.groupType] then
        self.MembersList[v.groupType] = {}
    end
    
    self.MembersList[v.groupType][user_id] = true
end

function ORGS:RemUserGroup(user_id)
    local groupType = self.Member[user_id] and (self.Member[user_id].groupType or false)
    if not groupType then if orgsConfig.debug then print("Houve um problema no RemUserGroup do USER_ID: "..user_id) end return end
    
    if self.MembersList[groupType] then
        self.MembersList[groupType][user_id] = nil
    end
    
    self.Member[user_id] = nil
end


formatTotalFarm = function(user_id)
    local query = vRP.query('sjr/getItens', { user_id = user_id })
    if #query > 0 then
        local total = 0
        local value = json.decode(query[1].itens)
        for k,v in pairs(value) do
            total = total + v
        end
        return total
    end
    return 0
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.RequestOrg()
    local user_id = Functions.getUserId(source)
    if not user_id then return end
    local name = Functions.getAllName(user_id)

    local user = ORGS.Member[user_id]
    if not user then if orgsConfig.debug then print("Você não faz parte de nenhuma organização!") end return end
    -- print(("Abrindo o Painel da Organização: %s"):format(user.groupType))

    if not ORGS.MembersList[user.groupType] then if orgsConfig.debug then print("Ops, houve um problema contate um administrador.") end return end

    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = user.groupType  })
    if #query == 0 then if orgsConfig.debug then print("Ops, houve um problema ao consultar no banco de dados.") end return end

    local FormatMembers = {}
    for ply_id in pairs(ORGS.MembersList[user.groupType]) do
        local last = Functions.query('bm_module/getLast', { id = ply_id })
        local nname = Functions.getAllName(ply_id)
        if not nname then if orgsConfig.debug then print("Problemas ao carregar identidade.") end goto skip end

        local hasActive = (Functions.getUserSource(ply_id) ~= nil)

        local nuser = ORGS.Member[ply_id]
        if not nuser then if orgsConfig.debug then print("Problemas ao carregar organizacao.") end goto skip end

        local login = "N/A"
        if #last > 0 then
            login = last[1].ultimo_login
        end
        
        local tempo = 0
        if hasActive then
            if Time[ply_id] and Time[ply_id].timer then
                tempo = (os.time()-Time[ply_id].timer)
            else
                local temp = os.date("*t", os.time())
                Time[ply_id] = {
                    day = temp.day,
                    timer = os.time()
                }
            end
        else
            local data = vRP.getUData(ply_id,'sjr:timingSystem')
            local value = json.decode(data) or {}
            local temp = os.date("*t", os.time())
            if value and value.day == temp.day then
                tempo = (os.time()-(value.timer or os.time()))
            end
        end

        FormatMembers[#FormatMembers + 1] = {
            nome = nname,
            passaporte = ply_id,
            cargo = orgsConfig.List[nuser.groupType] and orgsConfig.List[nuser.groupType].groups[nuser.group].prefix or "Indefinido",
            join = (vRP.getUData(ply_id,'sjr:joinOrg') or "N/A"),
            login = login,
            status = hasActive,
            tempo = tempo, -- -fazer
            farmDiario = formatTotalFarm(ply_id),
        }

        :: skip ::
    end

    local baus = {}
    local orgBaus = orgsConfig.List[user.groupType].baus
    
    if orgBaus then
        for _, bau in pairs(orgBaus) do
            local value = vRP.query('sjr/getBau', { bau = bau})
            if value then
                for i = 1, #value do
                    baus[#baus+1] = { nome = value[i].nome, passaporte = value[i].passaporte, cargo = value[i].cargo, bau = value[i].bau, item = value[i].item, qtd = value[i].qtd, acao = value[i].acao}
                end
            end
        end
    else
        print("A tabela de baús para o tipo de grupo do usuário está vazia ou não foi definida corretamente.")
    end

    local formatar = json.decode(query[1].metas)
    local metas = {}
    local farm = vRP.query('sjr/getItens', { user_id = user_id })
    local values = {}
    if #farm > 0 then
        values = json.decode(farm[1].itens)
    end
    for _,table in pairs(formatar) do
        metas[#metas+1] = {
            nome = table.nome,
            qtd = table.qtd,
            premio = parseInt(table.premio),
            status = true,
            done = (values[table.nome] or 0)
        }
    end

    local itens = {}
    for item,_ in pairs(orgsConfig.List[user.groupType].armazem.itens) do
        itens[#itens+1] = item
    end

    local cargos = {}
    for grupo,value in pairs(orgsConfig.List[user.groupType].groups) do
        cargos[#cargos+1] = value.prefix
    end

    local facs = {}
    local atuais = json.decode(query[1].parceiras)
    for fac, infos in pairs(orgsConfig.List) do
        local amount = vRP.getSData('sjr:facs:'..fac)
        if not atuais[fac] then
            facs[#facs+1] = {
                nome = fac,
                membros = amount,
                isPartner = false,
            }
        else
            facs[#facs+1] = {
                nome = fac,
                membros = amount,
                isPartner = true,
                data = atuais[fac].data,
                descricao = atuais[fac].descricao
            }
        end
    end

    return { 
        membros = FormatMembers,
        metas = metas,
        banco = json.decode(query[1].historico),
        facs = facs,
        access = orgsConfig.List[user.groupType].groups[user.group].access,
        cargos = cargos,
        nomeFac = user.groupType,
        saldo = query[1].bank and (query[1].bank or 0),
        maxMembros = orgsConfig.List[user.groupType]['config']['maxMembers'],
        recado = query[1].description,
        itens = itens,
        imagem = query[1].image,
        chest = baus,
        show = true
    }
end

function RegisterTunnel.newImagem(data)
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel depositeBank]]):format(user_id))
        end
        return
    end
    if data and data.imagem ~= '' then
        vRP.execute('bm_module/updateImage', {image = data.imagem, org = org.groupType})
    end
end

function RegisterTunnel.depositeBank(data)
    if not (parseInt(data.value) > 0) then Functions.notify("Notify",source,"negado","Você deve informar um valor valido.", 5000) return end
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel depositeBank]]):format(user_id))
        end
        return
    end
    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    if #query == 0 then if orgsConfig.debug then print("Ops, houve um problema ao consultar no banco de dados.") end return end
    if vRP.tryFullPayment(user_id,parseInt(data.value)) then
        local historic = json.decode(query[1].historico)
        historic[#historic+1] = {
            nome = Functions.getAllName(user_id),
            passaporte = user_id,
            cargo = org.group,
            data = os.date("%d/%m/%Y"),
            acao = "depositou",
            valor = data.value
        }
        vRP.execute('bm_module/updateBankAndHistoric', { org = org.groupType, historico = json.encode(historic), bank = (query[1].bank+parseInt(data.value))})
        Functions.notify("Notify",source,"sucesso","Você depositou o valor com sucesso.", 5000)
        return { transacao = { nome = Functions.getAllName(user_id), passaporte = user_id, cargo = org.group, data = os.date("%d/%m/%Y"), acao = "depositou", valor = data.value}, saldo = (query[1].bank+parseInt(data.value)) }
    else
        Functions.notify("Notify",source,"negado","Você não possui dinheiro suficiente para depositar.", 5000)
        return
    end
end

function RegisterTunnel.createMeta(data)
    local infos = data.meta
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel createMeta]]):format(user_id))
        end
        return
    end
    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    local value = json.decode(query[1].metas)
    if not value[infos.nome] then
        value[infos.nome] = {
            status = true,
            nome = infos.nome,
            qtd = infos.qtd,
            premio = infos.premio
        }
        vRP.execute('bm_module/updateMetas', { org = org.groupType, metas = json.encode(value)})
        return true
    else
        Functions.notify("Notify",source,"negado","Você não pode criar uma meta já existente, exclua a atual do item e tente novamente.", 5000)
        return false
    end
end

function RegisterTunnel.changeDesc(data)
    local infos = data.fac
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel changeDesc]]):format(user_id))
        end
        return
    end

    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    local value = json.decode(query[1].parceiras)
    if value[infos.nome] then
        value[infos.nome].descricao = infos.descricao
        vRP.execute('bm_module/updateParc', { parceiras = json.encode(value), org = org.groupType })
    end
end


function RegisterTunnel.stopParceria(data)
    local infos = data.fac
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel stopParceria]]):format(user_id))
        end
        return
    end

    local bestTier = 0
    local bestGroup = ""
    for group,v in pairs(orgsConfig.List[infos.nome].groups) do
        local tier = v.tier
        if tier > bestTier then
            bestTier = tier
            bestGroup = group
        end
    end
    local leader = 0
    for id,infos in pairs(ORGS.Member) do
        if (infos.group == bestGroup) and vRP.getUserSource(parseInt(id)) then
            leader = parseInt(id)
        end
    end

    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = infos.nome  })
    local query2 = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    local fac1 = json.decode(query[1].parceiras)
    local fac2 = json.decode(query2[1].parceiras)
    fac2[infos.nome] = nil
    fac1[org.groupType] = nil
    vRP.execute('bm_module/updateParc', { parceiras = json.encode(fac1), org = infos.nome })
    vRP.execute('bm_module/updateParc', { parceiras = json.encode(fac2), org = org.groupType })
    Functions.notify("Notify",source,"importante","A sua parceria foi interrompida com sucesso.", 5000)
    Functions.notify("Notify",vRP.getUserSource(leader),"importante","A organização "..org.groupType.." encerrou a parceria com sua facção!", 5000)
end


function RegisterTunnel.deleteMeta(data)
    local infos = data.meta
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel requestParc]]):format(user_id))
        end
        return
    end

    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    local value = json.decode(query[1].metas)
    if value[infos.nome] then
        value[infos.nome] = nil
        vRP.execute('bm_module/updateMetas', { org = org.groupType, metas = json.encode(value)})
        Functions.notify("Notify",source,"sucesso","A meta foi excluida com sucesso.", 5000)
        return true
    end
end


function RegisterTunnel.rewardMeta(data)
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel requestParc]]):format(user_id))
        end
        return
    end

    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    local value = json.decode(query[1].metas)
    
    local farm = vRP.query('sjr/getItens', { user_id = user_id })
    if #farm > 0 then
        local dvalue = json.decode(farm[1].itens)
        local payment = 0
        for k,v in pairs(value) do
            if dvalue[v.nome] and (dvalue[v.nome] >= parseInt(v.qtd)) then
                payment = payment + parseInt(v.premio)
                dvalue[v.nome] = dvalue[v.nome] - parseInt(v.qtd)
            end
        end
        if payment > 0 then
            if query[1].bank > payment then
                local temp = os.date("*t", os.time())
                vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(dvalue), day = temp.day})
                local historic = json.decode(query[1].historico)
                historic[#historic+1] = {
                    nome = Functions.getAllName(user_id),
                    passaporte = user_id,
                    cargo = org.group,
                    data = os.date("%d/%m/%Y"),
                    acao = "meta",
                    valor = payment
                }
                vRP.execute('bm_module/updateBankAndHistoric', { org = org.groupType, historico = json.encode(historic), bank = (query[1].bank-payment)})
                vRP.giveBankMoney(user_id,payment)
                Functions.notify("Notify",source,"sucesso","Você resgatou com sucesso a sua meta.", 5000)
                return true
            else
                Functions.notify("Notify",source,"negado","Você não pode resgatar no momento pois o banco da organização está sem esse valor.", 5000)
                return false
            end
        else
            Functions.notify("Notify",source,"negado","Você não possui nenhuma meta concluida para resgatar.", 5000)
            return false
        end
    else
        Functions.notify("Notify",source,"negado","Você não possui nenhuma meta concluida ou em andamento.", 5000)
        return false
    end
end

function RegisterTunnel.requestParc(data)
    local infos = data.fac
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel requestParc]]):format(user_id))
        end
        return
    end

    if org.groupType == infos.nome then
        Functions.notify("Notify",source,"negado","Você não pode firmar uma parceria com sua propria facção.", 5000)
        return
    end

    local bestTier = 0
    local bestGroup = ""
    for group,v in pairs(orgsConfig.List[infos.nome].groups) do
        local tier = v.tier
        if tier > bestTier then
            bestTier = tier
            bestGroup = group
        end
    end
    local leader = 0
    for id,infos in pairs(ORGS.Member) do
        if (infos.group == bestGroup) and vRP.getUserSource(parseInt(id)) then
            leader = parseInt(id)
        end
    end
    if leader ~= 0 then
        local request = vRP.request(vRP.getUserSource(leader), 'Você deseja firmar uma parceria com a organização '..org.groupType.."?", 5000)
        if request then
            local data = os.date("%d/%m/%Y")
            local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = infos.nome  })
            local query2 = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
            local fac1 = json.decode(query[1].parceiras)
            local fac2 = json.decode(query2[1].parceiras)
            fac2[infos.nome] = {
                isPartner = true,
                data = data,
                descricao = ''
            }
            fac1[org.groupType] = {
                isPartner = true,
                data = data,
                descricao = ''
            }
            vRP.execute('bm_module/updateParc', { parceiras = json.encode(fac1), org = infos.nome })
            vRP.execute('bm_module/updateParc', { parceiras = json.encode(fac2), org = org.groupType })
            Functions.notify("Notify",source,"sucesso","Sua solicitação de parceria foi aceita pela facção.", 5000)
            Functions.notify("Notify",vRP.getUserSource(leader),"sucesso","A parceria foi formada com sucesso.", 5000)
        else
            Functions.notify("Notify",source,"negado","Sua solicitação de parceria foi negada pela facção.", 5000)
        end
    else
        Functions.notify("Notify",source,"negado","Nenhum dos lideres da outra facção está online, tente novamente mais tarde.", 5000)
    end
end

function RegisterTunnel.sacarBank(data)
    if not (parseInt(data.value) > 0) then Functions.notify("Notify",source,"negado","Você deve informar um valor valido.", 5000) return end
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel sacarBank]]):format(user_id))
        end
        return
    end
    local query = Functions.query("bm_module/orgs/GetOrgsInfo", { org = org.groupType  })
    if #query == 0 then if orgsConfig.debug then print("Ops, houve um problema ao consultar no banco de dados.") end return end
    if query[1].bank > parseInt(data.value) then
        local historic = json.decode(query[1].historico)
        historic[#historic+1] = {
            nome = Functions.getAllName(user_id),
            passaporte = user_id,
            cargo = org.group,
            data = os.date("%d/%m/%Y"),
            acao = "sacou",
            valor = data.value
        }
        vRP.execute('bm_module/updateBankAndHistoric', { org = org.groupType, historico = json.encode(historic), bank = (query[1].bank-parseInt(data.value))})
        vRP.giveBankMoney(user_id, parseInt(data.value))
        Functions.notify("Notify",source,"sucesso","Você sacou o valor com sucesso.", 5000)
        return { transacao = { nome = Functions.getAllName(user_id), passaporte = user_id, cargo = org.group, data = os.date("%d/%m/%Y"), acao = "sacou", valor = data.value}, saldo = (query[1].bank-parseInt(data.value)) }
    else
        Functions.notify("Notify",source,"negado","A organização não possui esse valor para sacar.", 5000)
        return false
    end
end

function RegisterTunnel.updateDesc(data)
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel updateDesc]]):format(user_id))
        end
        return
    end
    vRP.execute('bm_module/updateDesc', { description = data.recado, org = org.groupType})
end

function RegisterTunnel.promovePlayer(data)
    local infos = data.membro
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel promovePlayer]]):format(user_id))
        end
        return
    end

    if not ORGS.Member[parseInt(infos.passaporte)] then
        Functions.notify("Notify",source,"negado","Este jogador não se encontra em nenhuma organização.", 5000)
        return
    end

    local realcargo = ''
    for k,v in pairs(orgsConfig.List[org.groupType].groups) do
        if v.prefix == infos.cargo then
            realcargo = k
        end
    end

    local ply_src = Functions.getUserSource(parseInt(infos.passaporte))
    if ply_src then
        Functions.notify("Notify",ply_src,"importante","Você foi promovido/rebaixado.", 5000)
        Functions.addUserGroup(parseInt(infos.passaporte), realcargo)
    else
        local datatable = json.decode(Functions.getUData(parseInt(infos.passaporte), "vRP:datatable")) or {}
        datatable.groups[realcargo] = true
        Functions.setUData(parseInt(infos.passaporte), "vRP:datatable", json.encode(datatable))

        ORGS:AddUserGroup(parseInt(infos.passaporte), {
            group = realcargo,
            groupType = ORGS.List[realcargo]
        })
    end

    Functions.notify("Notify",source,"sucesso","Você promoveu/rebaixou esse jogador com sucesso.", 5000)
    return true
end

function RegisterTunnel.invitePlayer(data)
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
        end
        return
    end

    if #ORGS.MembersList[org.groupType] >= orgsConfig.List[org.groupType].config.maxMembers then
        Functions.notify("Notify",source,"negado","A organização chegou a quantidade maxima de membros e não pode mais recrutar.", 5000)
        return
    end

    local ply_src = Functions.getUserSource(parseInt(data.passaporte))
    if not ply_src then
        Functions.notify("Notify",source,"negado","O Jogador não se encontra na cidade no momento.", 5000)
        return
    end

    local blacklist = Functions.getUData(parseInt(data.passaporte),"sjr:blacklist") or 0
    if parseInt(blacklist) > os.time() then
        local temp = os.date("*t", blacklist)
        local text = 
        orgsConfig.langs.isBlackList(source, temp.day, temp.month, temp.hour, temp.min)
        orgsConfig.langs.haveBlackList(ply_src, temp.day, temp.month, temp.hour, temp.min)
        return
    end

    if ORGS.Member[parseInt(data.passaporte)] then
        Functions.notify("Notify",source,"negado","Este jogador já está em uma organização.", 5000)
        return
    end

    local request = Functions.request(ply_src, "Estão te convidando para a organização "..org.groupType.." deseja aceitar?", 6000)
    if not request then
        Functions.notify("Notify",source,"negado","O Jogador recusou seu convite.", 5000)
        return
    end

    Functions.notify("Notify",source,"sucesso","O Jogador aceitou seu convite.", 5000)
    local grupo = ''
    for group,v in pairs(orgsConfig.List[org.groupType].groups) do
        if v.tier == 1 then
            grupo = group
        end
    end
    local value = vRP.getSData('sjr:facs:'..org.groupType)
    vRP.setSData('sjr:facs:'..org.groupType,(parseInt(value)+1))
    vRP.setUData(parseInt(data.passaporte),'sjr:joinOrg',os.date("%d/%m/%Y"))
    Functions.addUserGroup(parseInt(data.passaporte), grupo)
    Functions.sendLog(orgsConfig.webhook.invite, "O ID "..user_id.." INVITOU O "..parseInt(data.passaporte).." PARA A ORGANIZAÇÃO: "..grupo)

    local isinmode = exports.vrp_admin:NovatState(ply_src)
    if isinmode then
        local value = exports.vrp_admin:getTime(parseInt(data.passaporte))
        exports.vrp_admin:updateTime(parseInt(data.passaporte), parseInt(value/2))
    end

    return { nome = Functions.getAllName(parseInt(data.passaporte)),passaporte = parseInt(data.passaporte), cargo = grupo, join = os.date("%d/%m/%Y"), login = "N/A", status = true, tempo = 0, farmMensal = 0,farmDiario = 0 }
end

function RegisterTunnel.leaveOrg()
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel LeaveOrg]]):format(user_id))
        end
        return
    end

    if orgsConfig.debug then
        print("Leave org => ", org.groupType)
    end
    if vRP.request(source, 'Você deseja realmente se demitir?', 5000) then
        Functions.removeUserGroup(user_id, org.group) -- Caso der problema ( filtrar pelo getUserGroupByType )
        Functions.setUData(user_id,"sjr:blacklist",os.time()+24*orgsConfig.blackList*60*60)
        Functions.notify("Notify",source,"sucesso","Você saiu da sua organização.", 5000)
    end
end

function RegisterTunnel.demotePlayer(data)
    local infos = data.membro
    local source = source
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        if orgsConfig.debug then
            print(([[%s Tentou Injetar o Tunnel demotePlayer]]):format(user_id))
        end
        return
    end

    if not ORGS.Member[parseInt(infos.passaporte)] then
        Functions.notify("Notify",source,"negado","Este não se encontra em nenhuma organização.", 5000)
        return
    end

    local ply_src = Functions.getUserSource(parseInt(infos.passaporte))
    if ply_src then
        Functions.notify("Notify",ply_src,"negado","Você foi demitido de sua Organização.", 5000)
        Functions.removeUserGroup(parseInt(infos.passaporte), ORGS.Member[parseInt(infos.passaporte)].group) -- Caso der problema ( filtrar pelo getUserGroupByType )

        if org.groupType == "Mecanica" or org.groupType == "Hospital" or org.groupType == "Policia" or org.groupType == "Cot" or org.groupType == "PoliciaCivil" then
            vRPclient._giveWeapons(ply_src, {} ,true) 
        end
        Functions.sendLog(orgsConfig.webhook.demote, "O ID "..user_id.." DEMITIU O "..parseInt(infos.passaporte).." DA ORGANIZAÇÃO: "..org.groupType)
        if orgsConfig.debug then
            print("** ONLINE ** O ID "..user_id.." DEMITIU O "..parseInt(infos.passaporte).." DA ORGANIZAÇÃO: "..org.groupType)
        end
    else
        local datatable = json.decode(Functions.getUData(parseInt(infos.passaporte), "vRP:datatable")) or {}
        datatable.groups[ORGS.Member[parseInt(infos.passaporte)].group] = nil
        Functions.setUData(parseInt(infos.passaporte), "vRP:datatable", json.encode(datatable))

        ORGS:RemUserGroup(parseInt(infos.passaporte))
        Functions.sendLog(orgsConfig.webhook.demote, "O ID "..user_id.." DEMITIU O "..parseInt(infos.passaporte).." DA ORGANIZAÇÃO: "..org.groupType)
        if orgsConfig.debug then
            print("** OFFLINE ** O ID "..user_id.." DEMITIU O "..parseInt(infos.passaporte).." DA ORGANIZAÇÃO: "..org.groupType)
        end
    end
    Functions.setUData(parseInt(infos.passaporte),"sjr:blacklist",os.time()+24*orgsConfig.blackList*60*60)
    Functions.notify("Notify",source,"sucesso","Você demitiu esse jogador de sua organização.", 5000)
    return true
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('org', function(source,args)
    local user_id = Functions.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then  Functions.notify("Notify",source,"negado","Você não faz parte de nenhuma organização!", 5000) return end

    vTunnel._OpenOrg(source, user.groupType)
end)

RegisterCommand('resetSemanal', function(source,args)
    local user_id = Functions.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then
        if vRP.request(source, 'Deseja realmente zerar o ranking de facções semanal?', 5000) then
            for k,v in pairs(orgsConfig.List) do
                vRP.execute("vRP/del_srvdata", { dkey = "sjr:facs:"..k })
            end
            Functions.notify("Notify",source,"sucesso","Você concluiu o reset com sucesso.", 5000)
        end
    end
end)

RegisterCommand('orgadm', function(source,args)
    local user_id = Functions.getUserId(source)
    if not user_id then return end
     
    if not Functions.hasPermission(user_id, orgsConfig.PermAdmin) then return end

    local orgName = args[1]
    if not orgName or orgName == "" then
        return
    end
    
    if not orgsConfig.List[orgName] then
        return
    end

    local bestTier = 0
    local bestGroup = ""
    for group,v in pairs(orgsConfig.List[orgName].groups) do
        local tier = v.tier
        if tier > bestTier then
            bestTier = tier
            bestGroup = group
        end
    end

    Functions.addUserGroup(user_id, bestGroup)
    vTunnel._OpenOrg(source, bestGroup)
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RECIVE HANDLERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('vRP:playerJoinGroup', function(user_id,group)
    if ORGS.List[group] then
        ORGS:AddUserGroup(user_id, {
            group = group,
            groupType = ORGS.List[group]
        })
    end
end)

AddEventHandler('vRP:playerLeaveGroup', function(user_id,group)
    if ORGS.List[group] then
        ORGS:RemUserGroup(user_id)
    end
end)

AddEventHandler('vRP:playerLeave', function(user_id, source)
    if user_id then
        if Time[user_id] then
            vRP.setUData(user_id,'sjr:timingSystem',json.encode(Time[user_id]))
            Time[user_id] = nil
        end
    end
end)

AddEventHandler('vRP:playerSpawn', function(user_id, source)
    if user_id then
        local temp = os.date("*t", os.time())
        local data = vRP.getUData(user_id,'sjr:timingSystem')
        local value = json.decode(data) or {}
        if value and value.day and value.day ~= temp.day then
            Time[user_id] = {
                day = temp.day,
                timer = os.time()
            }
        else
            Time[user_id] = {
                day = value.day,
                timer = value.time
            }
        end
    end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CACHE FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:FormatConfig()
    for orgName in pairs(orgsConfig.List) do
        for Group in pairs(orgsConfig.List[orgName].groups) do
            self.List[Group] = orgName

            if (orgsConfig.main.createAutomatic) then
                Functions.execute('bm_module/orgs/CreateOrgIfNotExist', { org = orgName})
               -- exports["oxmysql"]:executeSync([[INSERT IGNORE INTO sjr_orgs(org) VALUES(?)]], { orgName })
            end
        end
    end 
    
    ORGS:GenerateCache()
    ORGS:VerifyPlayers()
end

function ORGS:GenerateCache()
    local timer = os.time()
    if orgsConfig.debug then
        if orgsConfig.debug then
            print('^1[PAINEL_FAC] ^0Iniciando Cache dos jogadores.')
        end
    end

    local query = Functions.query('bm_module/orgs/GetDataTable')
    local FormatUser = {}
    for i = 1, #query do
        local ply = query[i]
        local plyData = json.decode(ply.dvalue) or {}

        FormatUser[ply.user_id] = (plyData.groups or {})
    end

    for user_id, groups in pairs(FormatUser) do
        for groupName in pairs(groups) do
            if self.List[groupName] then
                self:AddUserGroup(user_id, {
                    group = groupName,
                    groupType = self.List[groupName]
                })
            end
        end
    end
    if orgsConfig.debug then
        if orgsConfig.debug then
            print(('^1[PAINEL_FAC] ^0Cache dos jogadores gerados com sucesso tempo %s segundo(s).'):format(os.time() - timer))
        end
    end

    FormatUser = {} -- Limpando Variavel para Poupar Memoria
end

-- Verificar jogadores online caso houver algum ensure e não estiver salvo no banco de dados. ( CASO O MODULO SEJA ENSURADO )
function ORGS:VerifyPlayers()
    local users = Functions.getUsers()
    for user_id,source in pairs(users) do
        local plyGroups = Functions.getUserGroups(user_id)
        for group in pairs(plyGroups) do

            if ORGS.Member[user_id] then -- VERIFICAR SE O JOGADOR ESTIVER ONLINE COM O GRUPO NO BANCO DE DADOS E SEM O GRUPO NO JOGO ( REMOVER DO CACHE ) ( CASO ENSURE )
                if ORGS.List[ORGS.Member[user_id].group] then
                    if not Functions.hasGroup(user_id, ORGS.Member[user_id].group) then
                        ORGS:RemUserGroup(user_id)
                    end
                end
            end
            
            if ORGS.List[group] then
                ORGS:AddUserGroup(user_id, {
                    group = group,
                    groupType = ORGS.List[group]
                })
            end
        end
    end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    ORGS:FormatConfig()
    while true do
        local temp = os.date("*t", os.time())
        vRP.execute('sjr/deleteAll', { day = temp.day })
        Wait(2*1000*60)
    end
end)

RegisterCommand('blacklist', function(source, args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"perm.evento") or vRP.hasPermission(user_id,"ilegal.permissao") then
            if args[1] and tonumber(args[1]) then
                local target_id = tonumber(args[1])
                Functions.setUData(target_id, "sjr:blacklist", 0)
                Functions.notify("Notify", source, "sucesso", "Você removeu da blacklist", 8000)
                
                vRP.sendLog("GROUPADD", "O ID " .. user_id .. " tirou id " .. target_id .. " da black list")
            else
                Functions.notify("Notify", source, "negado", "Você não informou um usuário válido para remover da blacklist!", 8000)
            end
        else
            Functions.notify("Notify", source, "negado", "Você não tem permissão para usar este comando!", 8000)
        end
    else
        Functions.notify("Notify", source, "negado", "Usuário inválido!", 8000)
    end
end)



