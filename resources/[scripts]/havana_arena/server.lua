local arena = {}
local scoreboard = {}
local inArena = {}
killStreak = {}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARENA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


function src.showNuiArena()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local arenas = {}
        for k,v in pairs(config.arenas) do
            arenas[k] = { id = k, nome = v.nome, descricacao = v.descricacao, imagem = v.imagem }
        end

        return arenas
    end
end

function checkArena(id)
    if arena[parseInt(id)] ~= nil then
        if arena[parseInt(id)].jogadores >= config.arenas[parseInt(id)].maxPlayers then
            return true
        end
    end

    return false
end

function src.apostarArena(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if arena[parseInt(id)] ~= nil then
            if arena[parseInt(id)].jogadores >= config.arenas[parseInt(id)].maxPlayers then
                config.lang['arenaLotada'](source)
                return
            end
        end

        config.apostarArena(source, user_id, id)
    end
end

RegisterServerEvent('Big-pvp:server:Enteraimlab')
AddEventHandler('Big-pvp:server:Enteraimlab', function(type)
    local source = source
    local user_id = vRP.getUserId(source)
    local id = math.random(4, 500)
    if user_id then
        if tpye == "npc" then 
            TriggerClientEvent('mirtin_survival:updateArena', source, true)
        
            SetPlayerRoutingBucket(source, tonumber(id))
            config.joinjogos(user_id)
            vRP.setArena(source, true)
    
        else 
            TriggerClientEvent('mirtin_survival:updateArena', source, true)
            SetPlayerRoutingBucket(source, tonumber(id))
            config.joinjogos(user_id)
            vRP.setArena(source, true)    
        end

        if config.voip == "pma-voice" then
            exports["pma-voice"]:updateRoutingBucket(source, tonumber(id))
        end
    end
end)







RegisterServerEvent('Big-pvp:server:exitAimLab')
AddEventHandler('Big-pvp:server:exitAimLab', function(type)
        local source = source
        local user_id = vRP.getUserId(source)
        if user_id then
            if tpye == "npc" then 

                config.leavejogos(user_id)
                vRP.setArena(source, false)
                SetPlayerRoutingBucket(source, 0)
            else
                
                config.leavejogos(user_id)
                vRP.setArena(source, false)
                SetPlayerRoutingBucket(source, 0)
                
            end    

        
            if config.voip == "pma-voice" then
                exports["pma-voice"]:updateRoutingBucket(source, 0)
            end 

            
            SetTimeout(5000,function()
                if source then
                    TriggerClientEvent('mirtin_survival:updateArena', source, false)
                end
            end)
        end     
end)









function entrarArena(source, user_id, id, aposta)
    if not inArena[user_id] then
        if arena[parseInt(id)] == nil then
            arena[parseInt(id)] = { cofreArena = aposta, jogadores = 1, tempo = config.arenas[parseInt(id)].timeArena*60 }
        else
            arena[parseInt(id)] = { cofreArena = arena[parseInt(id)].cofreArena + aposta, jogadores = arena[parseInt(id)].jogadores + 1, tempo = arena[parseInt(id)].tempo }
        end

        vCLIENT.setArena(source, id, config.arenas[parseInt(id)].coords[math.random(#config.arenas[parseInt(id)].coords)], arena[parseInt(id)].tempo)
        inArena[user_id] = parseInt(id)

        local identity = config.identity(user_id)
        table.insert(scoreboard, { arena = parseInt(id), user_id = user_id, kills = 0, identity = identity } )

        TriggerClientEvent('mirtin_survival:updateArena', source, true)
        SetPlayerRoutingBucket(source, parseInt(id))
        config.joinArena(user_id, id)
        vRP.setArena(source, true)

        corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. "Apostou ( ".. config.arenas[parseInt(id)].nome .." )" .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**ID:** ```css\n- "..user_id.." ```\n**APOSTOU** ```css\n- ".. vRP.format(aposta) .."```\n**HORARIO** ```css\n- ".. os.date("%d/%m/%Y") .." ```", ["footer"] = { ["text"] = "Big Store", }, } }
        sendToDiscord(config.weebhook['link'], corpoHook)

        if config.voip == "pma-voice" then
            exports["pma-voice"]:updateRoutingBucket(source, parseInt(id))
        end
    end
end

function sairArena(user_id, status)
    local source = vRP.getUserSource(user_id)
    local id = inArena[user_id]

    if source then
        vCLIENT.removePlayerArena(source)
        config.leaveArena(user_id)
        vRP.setArena(source, false)
    
        if arena[parseInt(id)] ~= nil then
            arena[parseInt(id)] = { cofreArena = arena[parseInt(id)].cofreArena, jogadores = arena[parseInt(id)].jogadores - 1, tempo = arena[parseInt(id)].tempo }
        end

        SetPlayerRoutingBucket(source, 0)
        if config.voip == "pma-voice" then
            exports["pma-voice"]:updateRoutingBucket(source, 0)
        end 

        if status == nil then
            removeScoreboard(id, user_id)
        end
        
        SetTimeout(5000,function()
            if source then
                TriggerClientEvent('mirtin_survival:updateArena', source, false)
                inArena[user_id] = nil
            end
        end)
    end
end











function encerrarArena(id)
    config.lang['arenaFinalizada'](config.arenas[id].nome)
    paymentGanhador(id)

    for k,v in pairs(inArena) do
        if v == id then
            async(function()
                sairArena(parseInt(k), true)
            end)
        end
    end

    removeScoreboard(id)
    arena[id] = nil
end

function paymentGanhador(id)
    if id then
        local value = arena[id].cofreArena

        local ultimoValor
        for k,v in pairs(scoreboard) do
            if v.arena == id then
                if ultimoValor == nil then
                    ultimoValor = { user_id = v.user_id, kills = v.kills }
                else
                    if v.kills > ultimoValor.kills then
                        ultimoValor = { user_id = v.user_id, kills = v.kills }
                    end
                end
            end
        end

        config.pagamentoApostas(ultimoValor.user_id, ultimoValor.kills, config.arenas[id].nome, value)
    end
end

function removeScoreboard(id, user_id)
    for k,v in pairs(scoreboard) do
        if v.arena == id and v.user_id == user_id then
            scoreboard[k] = nil
        end

        if v.arena == id and user_id == nil then
            scoreboard[k] = nil
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RANDOM SPAWN
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.randomSpawn()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local arenaID = inArena[user_id]

        if arenaID ~= nil then
            vRPclient.giveWeapons(source,{[config.arenas[parseInt(arenaID)].arma] = { ammo = 250 }}, true)
            return config.arenas[parseInt(arenaID)].coords[math.random(#config.arenas[parseInt(arenaID)].coords)],config.maxHealth
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE MORTE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.receberMorte(source, arma, ksource)
    if source == 0 or source == nil or ksource == 0 or ksource == nil then
        return
    end
    
    local user_id = vRP.getUserId(source)
    local kuser_id = vRP.getUserId(ksource)
    
    if user_id and kuser_id then
        local arenaID = inArena[kuser_id]
    
        if config.aKillstreak then
            if user_id then
                killStreak[user_id] = nil
            end
    
            if kuser_id then
                if killStreak[kuser_id] ~= nil then
                    killStreak[kuser_id] = killStreak[kuser_id] + 1
                else
                    killStreak[kuser_id] = 1
                end
            end
    
            if ksource and kuser_id then
                config.killStreak(ksource, kuser_id, killStreak[kuser_id], config.arenas[arenaID].nome)
            end
        end
        
        if config.rhealth then
            if ksource then
                vRPclient.setHealth(ksource, config.maxHealth)
            end
        end
    
        for k,v in pairs(scoreboard) do
            if v.arena == arenaID and v.user_id == kuser_id then
                scoreboard[parseInt(k)] = { arena = scoreboard[k].arena, user_id = kuser_id, kills = scoreboard[k].kills + 1, identity = scoreboard[k].identity  }
            end
        end
    
        if config.chatkill then
            local kidentity = config.identity(kuser_id)
            local nidentity = config.identity(user_id)
            if kidentity ~= nil and nidentity ~= nil then
                
                if config.debug then
                    print("[CHAT KILL] Carregando Identidade; ")
                    print("[CHAT KILL] KILLER "..kidentity.nome.. " "..kidentity.sobrenome)
                    print("[CHAT KILL] VITIMA "..nidentity.nome.. " "..nidentity.sobrenome)
                    print("[CHAT KILL] ARMA "..arma)
                end
    
                for k,v in pairs(inArena) do
                    if v == arenaID then
                        async(function()
                            local player = vRP.getUserSource(parseInt(k))
                            if player then
                                vCLIENT.sendChatKill(player, kidentity.nome.. " " .. kidentity.sobrenome, nidentity.nome.. " " .. nidentity.sobrenome, arma, config.chatKillDelay)
                            end
                        end)
                    end
                end
            end
        end
    
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCOREBOARD
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.scoreBoard = function(arenaID)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if user_id then
        if arena[arenaID] ~= nil then
            local arenaName = config.arenas[arenaID].nome
            local cofre = arena[arenaID].cofreArena
    
            local count = 0
            local user_list = {}
            for k,v in pairs(scoreboard) do
                if v.arena == arenaID then
                    user_list[count] = { user_id = v.user_id, kills = v.kills, identidade = v.identity.nome.." "..v.identity.sobrenome }
    
                    count = count + 1
                end
            end
    
            return { arenaName,vRP.format(cofre) },user_list
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        for k,v in pairs(arena) do
            if arena[k] ~= nil then
                arena[k] = { cofreArena = arena[k].cofreArena, jogadores = arena[k].jogadores, tempo = arena[k].tempo - 1}

                if arena[k] ~= nil and arena[k].jogadores <= 0 then
                    config.lang['arenaCancelada'](config.arenas[k].nome)
                    arena[k] = nil
                end

                if arena[k] ~= nil and arena[k].tempo <= 0 then
                    encerrarArena(k)
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

function src.getTimeArena(id)
    if arena[id] ~= nil then
        return arena[id].tempo
    end
end

function sendToDiscord(weebhook, message)
    PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({embeds = message}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler("vRP:playerLeave",function(user_id,source)
    if user_id then
        if inArena[user_id] ~= nil then
            if arena[parseInt(inArena[user_id])] ~= nil then
                arena[parseInt(inArena[user_id])] = { cofreArena = arena[parseInt(inArena[user_id])].cofreArena, jogadores = arena[parseInt(inArena[user_id])].jogadores - 1, tempo = arena[parseInt(inArena[user_id])].tempo }
            end
            removeScoreboard(inArena[user_id], user_id)
            inArena[user_id] = nil

            SetPlayerRoutingBucket(source, 0)
            if config.voip == "pma-voice" then
                exports["pma-voice"]:updateRoutingBucket(source, 0)
            end 
            
            if config.forceClearWeapons then
                vRP.limparArmas(user_id)
            end
        end
    end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand(config.cmdarena, function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if inArena[user_id] ~= nil then
            sairArena(user_id)
        end
    end
end) 

RegisterCommand(config.cmdkickarena, function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, config.permKick) then
            for k,v in pairs(inArena) do
                async(function()
                    local player = vRP.getUserSource(parseInt(k))
                    if player then
                        sairArena(parseInt(k))
                    end
                end)
            end

            config.lang['kickAllArena'](source)
        end
    end
end) 


function src.returnClient()
    local source = source
    local user_id = vRP.getUserId(source)
    print("Peguei vc troxaaaaaaaaaaaaaaaç "..user_id)
end



