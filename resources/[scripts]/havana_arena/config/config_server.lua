local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("havana_arena",src)
Proxy.addInterface("havana_arena",src)

vCLIENT = Tunnel.getInterface("havana_arena")
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local old_weapons = {}
local old_health = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {}

config.weebhook = {
    link = "https://discord.com/api/webhooks/1233264276089606155/2hktULfS5_yT7c0UMYEFgg0Cc6bZKzyDs7QA9hlBhQnfYvWA1-XapckbLxthb9u032CU",
    logo = "",
    color = 4169E1
}

config.license = "new" -- não mexa aqui ( isso server para updates exclusivos )
config.voip = "pma-voice2" -- ou tokovoip [ Para o VO-IP Funcionar no sistema de dimensoes ]
config.maxHealth = 300 -- Maximo de vida em seu servidor
config.rhealth = true -- Recuperar Vida quando matar alguem
config.aKillstreak = true -- Ativar sistema de killstreak
config.forceClearWeapons = true -- Ativar essa função caso acontece qualquer tentativa de bugar armas ( deslogar / crashar ) limpar todas as armas do jogador ( Não que vai acontecer, mas isso é uma forma pra previnir tambem. )
config.cmdarena = "pvp" -- Comando de sair da arena
config.cmdkickarena = "arenakick" -- Comando para kickar todos os jogadores de todas as arenas
config.permKick = "admin.permissao" -- Permissao para kickar os jogadores da arena
config.chatkill = true -- Ligar/Desligar chatkill da arena
config.chatKillDelay = 3000 -- Delay para sumir as mensagem do chatkill

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARENAS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.arenas = {
    [1] = { 
        nome = "valorante -pistola X5", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 5 Minutos<br> <b>Vagas:</b> 2 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://localhost/img/valorante.png", -- Imagem da Arena
        maxPlayers = 5, -- Maximo de Jogadores na Arena
        timeArena = 30, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(2452.84,3250.26,55.4),---------------
            [2] = vec3(2450.19,3266.1,55.4),-------------------------
            [3] = vec3(2437.8,3282.41,57.83),--------------------------
            [4] = vec3(2459.81,3300.31,56.95),---------------------------
            [5] = vec3(2493.97,3305.75,56.97),---------------------------
        }
    },

    [2] = { 
        nome = "pistola X1", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 5 Minutos<br> <b>Vagas:</b> 2 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://189.127.165.210/img/predio2.png", -- Imagem da Arena
        maxPlayers = 2, -- Maximo de Jogadores na Arena
        timeArena = 5, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(-775.42,-240.93,57.54),
            [2] = vec3(-799.33,-199.06,57.54),
            [3] = vec3(-784.85,-245.85,57.54),
            [4] = vec3(-789.74,-214.37,57.53)
        }
    },

    [3] = { 
        nome = "construção-pistola X10", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 30 Minutos<br> <b>Vagas:</b> 10 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://189.127.165.210/img/predio.png", -- Imagem da Arena
        maxPlayers = 10, -- Maximo de Jogadores na Arena
        timeArena = 30, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(-156.08,-1016.48,254.8),
            [2] = vec3(-172.02,-1010.17,254.14),
            [3] = vec3(-171.43,-993.7,253.88),
            [4] = vec3(-146.8,-989.77,254.13),
            [5] = vec3(-156.06,-963.16,254.14),
            [6] = vec3(-135.25,-960.07,254.14),
            [7] = vec3(-142.75,-947.4,254.14),
            [8] = vec3(-163.07,-954.51,254.14)
        }
    },

    [4] = { 
        nome = "Arena-pistola X1", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 5 Minutos<br> <b>Vagas:</b> 2 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://localhost/img/unknown2.png", -- Imagem da Arena
        maxPlayers = 2, -- Maximo de Jogadores na Arena
        timeArena = 5, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(618.04, -3571.71, 139.67),
            [2] = vec3(584.76, -3573.77, 139.67),
            [3] = vec3(598.9, -3601.37, 139.67),
            [4] = vec3(634.26, -3598.72, 139.67)
        }
    },

    [5] = { 
        nome = "Arena-pistola X2", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 5 Minutos<br> <b>Vagas:</b> 4 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://localhost/img/unknown2.png", -- Imagem da Arena
        maxPlayers = 4, -- Maximo de Jogadores na Arena
        timeArena = 5, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(628.47, -3732.32, 140.46),
            [2] = vec3(639.18, -3712.88, 140.41),
            [3] = vec3(617.49, -3711.14, 140.46),
            [4] = vec3(602.38, -3730.83, 140.467),
            [5] = vec3(590.19, -3713.23, 140.46),
            [6] = vec3(602.72, -3693.34, 140.46),
            [7] = vec3(631.44, -3690.86, 140.41),
        }
    },
    [6] = { 
        nome = "construção-fuzil X10", -- Nome da Arena 
        descricacao = "<b>Arma:</b> G3 <br> <b>Tempo:</b> 30 Minutos<br> <b>Vagas:</b> 10 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_SPECIALCARBINE_MK2", -- Arma da Arena
        imagem = "http://localhost/img/predio.png", -- Imagem da Arena
        maxPlayers = 10, -- Maximo de Jogadores na Arena
        timeArena = 30, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(-156.08,-1016.48,254.8),
            [2] = vec3(-172.02,-1010.17,254.14),
            [3] = vec3(-171.43,-993.7,253.88),
            [4] = vec3(-146.8,-989.77,254.13),
            [5] = vec3(-156.06,-963.16,254.14),
            [6] = vec3(-135.25,-960.07,254.14),
            [7] = vec3(-142.75,-947.4,254.14),
            [8] = vec3(-163.07,-954.51,254.14)
        }
    },
    [7] = { 
        nome = "arena-pistola X10", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 30 Minutos<br> <b>Vagas:</b> 10 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://localhost/img/unknown2.png", -- Imagem da Arena
        maxPlayers = 10, -- Maximo de Jogadores na Arena
        timeArena = 30, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vector3(700.7,-3545.3,139.83),
            [2] = vector3(714.87,-3545.66,139.81),
            [3] = vector3(742.91,-3545.92,139.84),
            [4] = vector3(751.07,-3528.96,140.54),
            [5] = vector3(752.33,-3505.11,139.83),
            [6] = vector3(753.2,-3471.1,139.97),
            [7] = vector3(727.45,-3462.68,139.74),
            [8] = vector3(690.48,-3464.53,139.73),
            [9] = vector3(694.1,-3495.37,139.76),
            [10] = vector3(707.88,-3518.62,139.82),
            [11] = vector3(734.66,-3506.51,139.8)
        }
    },
    [8] = { 
        nome = "fazenda-pistola X10<", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b>30 Minutos<br> <b>Vagas:</b> 10 Vagas<br> <b>Aposta Minima:</b> R$ 5000 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "http://localhost/img/unknown.png", -- Imagem da Arena
        maxPlayers = 10, -- Maximo de Jogadores na Arena
        timeArena = 30, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vector3(1996.88,2742.63,49.76),
            [2] = vector3(2012.37,2748.33,50.36),
            [3] = vector3(2043.36,2754.39,50.53),
            [4] = vector3(2044.24,2788.71,52.42),
            [5] = vector3(2007.86,2796.08,50.19),
            [6] = vector3(1974.43,2803.02,50.03),
            [7] = vector3(1987.35,2833.56,50.15),
            [8] = vector3(2014.52,2846.74,50.32),
            [9] = vector3(2037.47,2837.61,50.26)
        }
    },
}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRADUCOES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.lang = {
    arenaFinalizada = function(id) return TriggerClientEvent('chatMessage', -1, "^1[ARENA] ^0 Arena ^2"..id.."^0 acaba de ser finalizada.") end, -- Quando a Arena for finalizada
    arenaCancelada = function(id) return TriggerClientEvent('chatMessage', -1, "^1[ARENA] ^0 Arena ^2"..id.."^0 acaba de ser cancelada por falta de jogadores.") end, -- Quando a Arena for finalizada
    arenaLotada = function(source) return TriggerClientEvent("Notify",source,"negado","Está arena está lotada.", 3) end, -- Quando a Arena estiver Lotada
    kickAllArena = function(source) return TriggerClientEvent("Notify",source,"sucesso","Você kickou todos os jogadores da arena", 3) end, -- Kickar todos jogadores da arena
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE APOSTAS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.apostarArena = function(source, user_id, id)
    local minAposta = parseInt(config.arenas[parseInt(id)].minAposta)
    local aposta = vRP.prompt(source, "Digite a sua Aposta: ", minAposta)
    if aposta ~= nil and aposta ~= "" and tonumber(aposta) then
        if tonumber(aposta) < minAposta then
            TriggerClientEvent("Notify",source,"sucesso","O Valor minimo de aposta é <b>"..vRP.format(minAposta).."</b>", 3)
            return
        end

        if vRP.tryFullPayment(user_id, tonumber(aposta)) then
            entrarArena(source, user_id, id, tonumber(aposta))
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui essa quantia para apostar.", 3)
        end
    end
end

config.pagamentoApostas = function(user_id, kills, arena, cofre)
    local pagamento = cofre * 0.8 -- 80% Do valor do cofre da arena de apostas
    local identity = vRP.getUserIdentity(user_id)

    TriggerClientEvent('chatMessage', -1, "^1[ARENA] ^0O Cidadão ^2"..identity.nome.." "..identity.sobrenome.."^0 venceu a arena ^2 "..arena.."^0 com ^2"..kills.." kill(s)^0.")
    vRP.giveMoney(user_id, pagamento)

    corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. "Vencedor ( ".. arena .." )" .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**ID:** ```css\n- "..user_id.." ```\n**KILLS** ```css\n- ".. kills .."```\n**RECEBEU** ```css\n- ".. vRP.format(pagamento) .."```\n**HORARIO** ```css\n- ".. os.date("%d/%m/%Y") .." ```", ["footer"] = { ["text"] = "Big Store", }, } }
    sendToDiscord(config.weebhook['link'], corpoHook)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE KILL STREAK
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.killStreak = function(source, user_id, kills, arena)
    if kills > 3 then
        local pagamento = 50 + (5 * kills)
        TriggerClientEvent('chatMessage', source, "^1[ARENA] ^0 ** KILL STREAK ** Você matou ^2"..kills.."^0 sem morrer e recebeu ^2"..pagamento.."^0 por isso.")
        vRP.giveInventoryItem(user_id, "money", pagamento, true)

        corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. "Kill Streak ( ".. arena .." )" .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**ID:** ```css\n- "..user_id.." ```\n**KILLS** ```css\n- ".. kills .."```\n**RECEBEU** ```css\n- ".. vRP.format(pagamento) .."```\n**HORARIO** ```css\n- ".. os.date("%d/%m/%Y") .." ```", ["footer"] = { ["text"] = "Big Store", }, } }
        sendToDiscord(config.weebhook['link'], corpoHook)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTRAR ARENA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.joinArena = function(user_id, id)
    local source = vRP.getUserSource(user_id)

    if source then
        old_weapons[user_id] = vRPclient.getWeapons(source)
        old_health[user_id] = vRPclient.getHealth(source)

        local weapon = config.arenas[parseInt(id)].arma
        vRPclient._giveWeapons(source,{[weapon] = { ammo = 250 }}, true)
        vRPclient._setHealth(source, config.maxHealth)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTRAR JOGOS
-----------------------------------------------------------------------------

config.joinjogos = function(user_id)
    local source = vRP.getUserSource(user_id)

    if source then
        old_weapons[user_id] = vRPclient.getWeapons(source)
        old_health[user_id] = vRPclient.getHealth(source)

        local weapon = "WEAPON_PISTOL_MK2"
        vRPclient._giveWeapons(source,{[weapon] = { ammo = 250 }}, true)
        vRPclient._setHealth(source, config.maxHealth)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SAIR JOGOS
-----------------------------------------------------------------------------

config.leavejogos = function(user_id)
    local source = vRP.getUserSource(user_id)

    if source then
        if old_weapons[user_id] ~= nil then
            vRPclient._giveWeapons(source, old_weapons[user_id], true)
            old_weapons[user_id] = nil
        end

        if old_health[user_id] ~= nil then
            vRPclient._setHealth(source, old_health[user_id])
            old_health[user_id] = nil
        end
    end
end





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SAIR DA ARENA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.leaveArena = function(user_id)
    local source = vRP.getUserSource(user_id)

    if source then
        if old_weapons[user_id] ~= nil then
            vRPclient._giveWeapons(source, old_weapons[user_id], true)
            old_weapons[user_id] = nil
        end

        if old_health[user_id] ~= nil then
            vRPclient._setHealth(source, old_health[user_id])
            old_health[user_id] = nil
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.identity = function(user_id)
    local identity = vRP.getUserIdentity(user_id)

    if identity then
        identity.nome = identity.nome
        identity.sobrenome = identity.sobrenome

        return identity
    end
end

--[[ COLOQUE ISSO NAS FUNCOES SERVER
    local arena = Tunnel.getInterface("hawk_arena")

    if arena.inArena(source) then
		return
    end


    function vRP.limparArmas(user_id) -- COLOCAR ISSO DENTRO DE QUALQUER VRP>MODULES [ CASO SUA FUNÇÃO forceClearWeapons for ativada ]
        local data = vRP.getUserDataTable(user_id)
        if user_id then
            if data then
                data.weapons = {}
            end
        end
    end
]]