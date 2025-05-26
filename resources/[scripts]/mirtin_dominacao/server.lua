------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local zones = {
    list = Config.Zones,
    owner = {}
}

local domination = {
    running = {  -- ZONAS QUE ESTAO SENDO DOMINADAS
        --[[ 
            [1] = { @@params index
                org = "Yakuza",
                amountPlys = 1,
                score = 0
            }
         ]]
    },
    runningPlys = { -- JOGADORES QUE ESTAO DOMINANDO A ZONA
        --[[ 
            [1] = { @@params index
                [1] = true, @@params user_id
            }
         ]]
    }, 

    plysZones = { -- JOGADORES QUE ESTAO DENTRO DA ZONA
        --[[ 
            [1] = { @@params index
                [1] = "Armas", @@params user_id, @@params zona
            }
         ]]
    },

    plyIdIndex = {
        -- [1] = 1  @@params user_id and index
    },

    cooldown = { -- COOLDOWN DAS DOMINACAO
         --[[ 
            [1] = os.time() @@params index
         ]]
    },
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

function formatTime(time)
    local minutes = math.floor(math.fmod(time,3600)/60)
    local seconds = math.floor(math.fmod(time,60))
    if minutes > 0 then        
        return string.format("<b>%d minuto(s) </b> e <b> %d segundos</b>",minutes,seconds)
    else
        return string.format("<b> %d segundos</b>",seconds)
    end
end

function domination:startDomination(source, user_id, index, org)
    local data = vRP.getSData('server_start')
    -- if tonumber(data) < os.time() - 1800 then 
        local zone = zones.list[index]

        if not self.running[index] then
            self.running[index] = { org = org, amountPlys = 0, score = 0 }
            domination:addPlayerDomination(user_id, index, org)

            initThreadDomination(index, org)
            vTunnel._syncZone(-1, true, index)

            Config.Lang.InitZone(org, zones.list[index].name)

            -- exports['vrp']:log('startDomination',"\n[ID]: "..user_id.."  \n[PUXOU A DOMINACAO]: "..org.."  \n[NOME]: "..zones.list[index].name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." ")
            
            debugPrint("Iniciando a Dominação")
            return
        end

        if self.running[index] then
            if self.running[index].org ~= org then
                domination:cancelDomination(index)
                
                self.running[index] = { org = org, amountPlys = 0, score = 0 }
                domination:addPlayerDomination(user_id, index, org)

                initThreadDomination(index, org)
                vTunnel._syncZone(-1, true, index)

                -- exports['vrp']:log('reDominacao',"\n[ID]: "..user_id.."  \n[REDOMINANDO A DOMINACAO]: "..org.."  \n[NOME]: "..zones.list[index].name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." ")

                Config.Lang.ResumeZone(org, zones.list[index].name)
                debugPrint("Redominando essa area: "..index)
                return
            end
        end
    -- else
    --     TriggerClientEvent("Notify",source, "amarelo", "Faltam "..formatTime(tonumber(data)-(os.time()-1800)).." para a liberação do blip de dominação.", 5000)
    -- end
end

function domination:cancelDomination(index)
    if not self.runningPlys[index] then return end
    if not self.running[index] then return end

    self.running[index] = nil
    self.runningPlys[index] = nil
    self.plysZones[index] = nil

    vTunnel._syncZone(-1, false, index)

    debugPrint("Dominacao: "..index.." Finalizada. ")
end

function domination:addPlayerDomination(user_id, index, org)
    user_id = parseInt(user_id)
    source = getUserSource(user_id) 

    if not self.runningPlys[index] then self.runningPlys[index] = {} end
    debugPrint("Adicionado ID:" ..user_id.. " Index: "..index)
    
    if self.running[index].org == org then
        debugPrint("Adicionado: "..user_id)
        if GetEntityHealth(GetPlayerPed(source)) <= Config.minHealth then debugPrint("Jogador Morto, Não adicionando na dominação") return end

        self.running[index].amountPlys = self.running[index].amountPlys + 1
        self.runningPlys[index][user_id] = source
        self.plyIdIndex[user_id] = index

        debugPrint("Adicionando Jogador na Dominação")
    end
end

function domination:addUserDomination(user_id, index)
    local result,org = self:checkPermission(user_id, index)
    if not result then
        return
    end

    if self.runningPlys[index] and not self.runningPlys[index][user_id] then
        domination:addPlayerDomination(user_id, index, org)
    end
end

function domination:remPlayerDomination(user_id, index)
    if self.plysZones[index] and self.plysZones[index][user_id] then
        debugPrint("ID: "..user_id.. " saiu da zona: "..self.plysZones[index][user_id])
        self.plysZones[index][user_id] = nil
    end
    
    local result,org = self:checkPermission(user_id, index)
    if not result then return end

    if self.running[index] and self.running[index].org == org then
        if self.runningPlys[index] and self.runningPlys[index][user_id] then
            self.running[index].amountPlys = self.running[index].amountPlys - 1

            debugPrint("Removendo Jogador Da Dominacao Rodando..")
            self.runningPlys[index][user_id] = nil
            self.plyIdIndex[user_id] = nil

            if self.running[index].amountPlys <= 0 then
                domination:cancelDomination(index)
                debugPrint("Cancelar Dominacao")
            end
        end
    end
end

function domination:plyLeaveDomination(user_id, index)
    if self.runningPlys[index] and self.runningPlys[index][user_id] then
        self.running[index].amountPlys = self.running[index].amountPlys - 1

        debugPrint("Removendo ID "..user_id.." Da Dominacao Rodando..")
        self.runningPlys[index][user_id] = nil
        self.plyIdIndex[user_id] = nil

        if self.running[index].amountPlys <= 0 then
            domination:cancelDomination(index)
            debugPrint("Cancelar Dominacao: "..index)
        end
    end
end

function domination:setWinnerZone(index, org)
    domination:cancelDomination(index)

    for k in pairs(domination.plyIdIndex) do
        if domination.plyIdIndex[k] then
            if domination.plyIdIndex[k] == index then
                domination.plyIdIndex[k] = nil
                debugPrint("Desligando Index do vencedor..")
            end
        end
    end

    self.cooldown[index] = os.time() + (zones.list[index].dominationConfig.cooldown * 60)
    zones.owner[index] = org
    vTunnel._syncOwnerZone(-1, index, org)

    if not zones.list[index] then return end
    for _,v in pairs(zones.list[index].permissions) do
        if v.org == org then
            Config.Lang.WinnerZone(org, zones.list[index].name)
            zones.list[index].paymentWinner(org, v.permission)
            break;
        end
    end
    
    if Config.saveZones then
        local data = vRP.getSData("4fun_dominacao", {})
        local result = json.decode(data) or {}
        if data then
            result[tostring(index)] = { zone = zones.list[index].name, org = org }
            vRP._setSData("4fun_dominacao", json.encode(result))
        end
    end

    -- exports['vrp']:log('winnerDominacao',"\n[GANHADOR DA DOMINACAO]: "..org.."  \n[NOME]: "..zones.list[index].name.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." ")
    debugPrint("Ganhador da Zona: "..zones.list[index].name.." Organizacao: "..org)
end

function domination:checkZone(source, user_id, index)
    local result,org = self:checkPermission(user_id, index)
    if not result then
        Config.Lang.NotPermiss(source)
        return
    end

    local result,time = self:checkCooldown(index)
    if not result then
        local converter = math.floor((time / 3600)).."h:".. math.floor((time / 60) % 60) .."m:"..(time % 60).."s"

        Config.Lang.ZoneCooldown(source, converter)
        return
    end

    if zones.owner[index] == org then
        Config.Lang.YourZone(source)
        return
    end

    domination:startDomination(source, user_id, index, org)
    return true
end

function domination:checkPermission(user_id, index)
    if not zones.list[index] then return false end

    local permissions = zones.list[index].permissions
    for i = 1, #permissions do
        if hasPermission(user_id, permissions[i].permission) then
            return true, permissions[i].org
        end
    end

    return false
end

function domination:checkCooldown(index)
    if self.cooldown[index] then
        if (self.cooldown[index] - os.time() > 0) then
            return false, (self.cooldown[index] - os.time())
        end

        self.cooldown[index] = nil
        return true
    end
    
    return true
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local checkZoneco = {}

function RegisterTunnel.checkZone(index)
    local source = source
    local user_id = vRP.getUserId(source)
    if checkZoneco[index] == nil or not checkZoneco[index] or GetGameTimer() >= checkZoneco[index] then

        checkZoneco[index] = GetGameTimer() + 5000

        return domination:checkZone(source, user_id, index)
    else
        TriggerClientEvent("Notify",source, "amarelo", "Você precisa esperar <b>"..math.ceil((checkZoneco[index] - GetGameTimer())/1000).." segundos</b>.", 5000)
	end	
end

function RegisterTunnel.getZonePoints(index)
    if domination.running[index] and domination.running[index].score then
        return domination.running[index].score
    end

    return 0
end

function RegisterTunnel.plyEnterZone(index, name)
    local source = source
    local user_id = vRP.getUserId(source)
    if not domination.plysZones[index] then domination.plysZones[index] = {} end

    domination.plysZones[index][user_id] = name
    
    debugPrint("ID: "..user_id.. " entrou na zona: "..name)

    domination:addUserDomination(user_id, index)
end

function RegisterTunnel.plyLeaveZone(index, name)
    local source = source
    local user_id = vRP.getUserId(source)

    domination:remPlayerDomination(user_id, index)
end

function RegisterTunnel.plyLeaveDomination(index, name)
    local source = source
    local user_id = vRP.getUserId(source)

    domination:plyLeaveDomination(user_id, index)
end

function RegisterTunnel.requestDominationPoints(index)
    if domination.running[index] then
        return domination.running[index]
    end

    return 0
end

function RegisterTunnel.SendKillFeed(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local index = (data.zone) and data.zone.index
    if not index then return end
    if not domination.plysZones[index] then return end
    
    local t = {}
    local identity = getUserIdentity(user_id)
    
    t.victim = identity.sobrenome.. " "..identity.nome
    t.weapon = data.weapon
    t.killer = 0

    if (data.attacker > 0) then
        local kuser_id = vRP.getUserId(data.attacker)
        local kidentity = getUserIdentity(kuser_id)

        t.killer = kidentity.sobrenome.. " "..kidentity.nome
    end

    if not domination.plysZones[index] then return end
    for plyId in pairs(domination.plysZones[index]) do
        async(function()
            local plySrc = getUserSource(plyId)
            if plySrc and plyId then
                vTunnel._SyncKillFeed(plySrc, t)
            end
        end)
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function initThreadDomination(index,org)
    CreateThread(function()
        local index,org = index,org

        while domination.running[index] do
            if not domination.running[index] or domination.running[index].org ~= org then
                break;
            end

            domination.running[index].score = domination.running[index].score + (zones.list[index].dominationConfig.playerPoints * domination.running[index].amountPlys)

            if domination.running[index].score >= zones.list[index].dominationConfig.totalPoints then
                domination:setWinnerZone(index, org)
                break;
            end

            if domination.runningPlys[index] then
                for plyId in pairs(domination.runningPlys[index]) do
                    if not domination.runningPlys[index] then return end

                    local source = domination.runningPlys[index][plyId]
                    if source then
                        async(function()
                            if GetEntityHealth(GetPlayerPed(source)) > Config.minHealth then
                                debugPrint("Enviando para source: "..source)
                                vTunnel._updateScoreboard(source, index, domination.running[index])
                            else
                                debugPrint("Jogador morto desconectando da dominacao id: "..plyId)
                                vTunnel._hideScoreboard(source, index)

                                domination:plyLeaveDomination(plyId, index)
                            end
                        end)
                    end
                end
            end

            Wait( Config.delayThread or 5000 )
        end
    end)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HANDLERS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if user_id then
        vTunnel._syncAllZonesOwner(source, zones.owner)
    end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
    local index = domination.plyIdIndex[user_id]
    if index then
        domination:remPlayerDomination(user_id, index)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG COMMAND
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug_table', function(source,args)
    if source > 0 then return end

    debugPrint("running", json.encode(domination.running, { indent = true }))
    debugPrint("runningPlys", json.encode(domination.runningPlys, { indent = true }))
    debugPrint("plysZones", json.encode(domination.plysZones, { indent = true }))
    debugPrint("plyIdIndex", json.encode(domination.plyIdIndex, { indent = true }))
    debugPrint("cooldown", json.encode(domination.cooldown, { indent = true }))
    debugPrint("owner", json.encode(zones.owner, { indent = true }))
end)

function debugPrint(content)
    if Config.DebugMode then
        print(content)
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE MODE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.SendZone(zone)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local FormatZones = ""

        for i = 1, #zone do
            if i == #zone then
                FormatZones = FormatZones.. "    vec3("..tD(zone[i].x)..","..tD(zone[i].y)..","..tD(zone[i].z)..")"
            else
                FormatZones = FormatZones.. "    vec3("..tD(zone[i].x)..","..tD(zone[i].y)..","..tD(zone[i].z).."),\n"
            end
        end

        vRPclient.prompt(source, "Copie sua zona: ", "coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )\n"..FormatZones.."\n},")
    end
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

RegisterCommand('create_zone', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, Config.CreateModePerm) then
            vTunnel._openCreateMode(source)
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FORMAT ALL LIST PERMISSIONS | GET USER ZONES DOMINED
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Permissions = {}

CreateThread(function()
    for i = 1, #Config.Zones do
        for index in pairs(Config.Zones[i].permissions) do
            local finder = Config.Zones[i].permissions[index]
            if finder then
                Permissions[finder.org] = finder.permission
            end
        end
    end
end)

function GetUserDominationZone(user_id)
    local Zone = {}
    local HasDomined = false
    for org,permission in pairs(Permissions) do
        if vRP.hasPermission(user_id, permission) then
            for index,orgDomined in pairs(zones.owner) do
                if org == orgDomined then
                    HasDomined = true
                    Zone = {
                        org = org,
                        zone = (Config.Zones[index] and Config.Zones[index].name or "Não encontrado")
                    }
                end
            end
        end
    end

    return HasDomined, Zone
end

exports('GetUserDominationZone', GetUserDominationZone)

function GetUserDominationZoneilegal(org)
    local Zone = {}
    local HasDomined = false
    for index,orgDomined in pairs(zones.owner) do
        if org == orgDomined then
            HasDomined = true
            Zone[#Zone+1] = {
                org = org,
                zonename = Config.Zones[index].name or "Não encontrado",
                zone = (Config.Zones[index] and Config.Zones[index].name or "Não encontrado")
            }
        end
   end

    return HasDomined, Zone
end

exports('GetUserDominationZoneilegal', GetUserDominationZoneilegal)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Handler Start Resource
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    vRP._setSData("server_start",os.time())
    if Config.saveZones then
        local data = vRP.getSData("4fun_dominacao", {})
        local result = json.decode(data) or {}
        if data then
            for index,v in pairs(result) do
                index = parseInt(index)

                zones.owner[index] = v.org
            end
        end

        SetTimeout(2000,function()
            vTunnel._syncAllOwnerZone(-1, zones.owner)
        end)
    end
end)



--five community and bkvini.ofc1




AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    print("^5[FIVE COMMUNITY]^0 Script premium ^3exclusivo^0 da ^1Five Community^0 iniciado com sucesso!")
    print("^5[FIVE COMMUNITY]^0 Acesse nosso Discord: ^4discord.gg/fivecommunity^0")

    for _, playerId in ipairs(GetPlayers()) do
        TriggerClientEvent('chat:addMessage', playerId, {
            color = { 255, 0, 255 },
            multiline = true,
            args = {
                "[FIVE COMMUNITY]",
                "Script premium exclusivo da Five Community. Acesse nosso Discord: discord.gg/fivecommunity"
            }
        })
    end
end)


















