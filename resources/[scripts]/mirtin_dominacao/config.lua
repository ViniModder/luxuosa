Config = {
    DebugMode = false, -- DEBUGS DE PRINTS

    delayThread = 3000, -- DELAY DA THREAD QUE CONTABILIZA OS PONTOS DA DOMINACAO ( MEXA SO SE TIVER NECESSIDADE )
    minHealth = 101, -- MINIMO DE VIDA DO SEU SERVIDOR
    saveZones = false, -- SALVAR OS DADOS NO BANCO DE DADOS ( MANTER AS AREAS DOMINADAS SE REINICIAR O SERVIDOR OU SCRIPT )

    CreateModePerm = "admin.permissao", -- Permissao para o comando /create_zone, feito para facilitar a desenhar a zona de dominação.
    debugPoly = false, -- DEBUG DAS coordsZone da dominação. ( ATIVAR APENAS QUANDO ESTIVER CRIANDO AS AREAS )

    Zones = {
        
        { -- INICIO DE UMA ZONA
            name = "Armas", -- NOME DA ZONA DE DOMINACAO

            coords = vec3(1043.73,2301.42,44.84), -- LOCALIZAÇÃO DA ZONA DE DOMINAÇÃO
            coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )
            vec3(1165.91,2511.79,59.82),
            vec3(1147.57,2055.08,56.7),
            vec3(817.43,2334.44,48.8),
            vec3(813.24,2350.46,50.09),
            vec3(826.0,2389.59,54.17),
            vec3(856.88,2468.56,61.84),
            vec3(907.96,2509.52,58.04),
            vec3(949.59,2519.42,56.7),
            vec3(1002.65,2542.82,55.02),
            vec3(1165.53,2511.57,59.78)
        },
            permissions = { -- PERMISSOES DE QUEM VAI PODER DOMINAR O LOCAL
                { org = "COSANOSTRA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
                { org = "BABEL", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!! 
                { org = "MILICIA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!! 13--fac de armas  
                { org = "BRATVA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!! 13--fac de armas  
                { org = "HELIPA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!! 13--fa
                { org = "DRAGONS", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!! 13--fa
        
                
            },

            dominationConfig = {
                dominationDebug = true, -- DEBUG PARA APARECER PARA TODOS JOGADORES PROXIMOS A ZONA DEMARCADA.
                vehicles = false, -- SE VAI PERMITIR TRANSIÇÃO DE VEICULOS DENTRO DA ZONA.
                playerPoints = 1, -- PONTUACAO QUE CADA JOGADOR VAI SOMAR NA DOMINACAO
                totalPoints = 1000, -- TOTAL DE PONTOS NECESSARIOS PARA DOMINAR A ZONA-- 20 minutos  minutoos 
                cooldown = 180, -- COOLDOWN EM MINUTOS, PARA A ZONA APOS SER DOMINADA.
            },

            avaliableWeapons = {
                ["Pistola"] = true,
                ["Metralhadora"] = true,
                ["Smg"] = true,
                ["Fuzil"] = true,
                ["Sniper"] = false,
                ["Shotgun"] = false,
            },

            blip = { -- CONFIGURACAO DO BLIP DO MAPA
                display = true, -- ATIVAR/DESATIVAR BLIP NO MAPA PARA MOSTRAR ZONA DOMINADA POR XXX
                blipId = 84, -- ID DO BLIP
                blipColor = 1, -- ID DA COR
                blipScale = 0.5, -- TAMANHO DO BLIP
                blipName = "[%s] Dominado Por: %s" -- NOME DO BLIP
            },

            paymentWinner = function(org, permission) -- Caso queira dar recompensas a parte para jogadores da organizacao
            -------- EXEMPLO --------
            --[[ local users = vRP.getUsersByPermission(permission)
                for source,user_id in pairs(users) do
                    async(function()
                        vRP.giveInventoryItem(user_id, "dinheiro-sujo", 30) -- GIVANDO DINHEIRO NO INVENTARIO
                    end)
                end  ]]
            ------- FIM EXEMPLO ------

            end,
            
        }, -- FIM DE UMA ZONA


        { -- INICIO DE UMA ZONA
        name = "Lavagem", -- NOME DA ZONA DE DOMINACAO

        coords = vec3(2486.72,-385.41,93.74), -- LOCALIZAÇÃO DA ZONA DE DOMINAÇÃO
        coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )
    vec3(2592.23,-335.67,92.64),
    vec3(2586.06,-436.54,89.01),
    vec3(2531.19,-485.69,92.57),
    vec3(2503.49,-494.07,92.75),
    vec3(2429.35,-418.23,92.02),
    vec3(2426.38,-410.85,92.25),
    vec3(2428.6,-387.91,92.6),
    vec3(2429.0,-366.85,92.62),
    vec3(2440.69,-342.43,92.31),
    vec3(2459.53,-312.89,93.05),
    vec3(2471.44,-310.83,93.02),
    vec3(2479.9,-288.46,93.01),
    vec3(2492.7,-270.25,92.81),
    vec3(2519.6,-253.29,89.53),
    vec3(2537.57,-255.13,92.26),
    vec3(2568.54,-254.82,92.27),
    vec3(2589.67,-268.56,91.69),
    vec3(2592.33,-335.6,92.89)
},
        permissions = { -- PERMISSOES DE QUEM VAI PODER DOMINAR O LOCAL
            { org = "TEQUILA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
            { org = "CRIPS", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
            { org = "CASSINO", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
            { org = "BAHAMAS", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
            { org = "ILUMINATIS", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!

        },

        dominationConfig = {
            dominationDebug = true, -- DEBUG PARA APARECER PARA TODOS JOGADORES PROXIMOS A ZONA DEMARCADA.
            vehicles = false, -- SE VAI PERMITIR TRANSIÇÃO DE VEICULOS DENTRO DA ZONA.
            playerPoints = 1, -- PONTUACAO QUE CADA JOGADOR VAI SOMAR NA DOMINACAO
            totalPoints = 1000, -- TOTAL DE PONTOS NECESSARIOS PARA DOMINAR A ZONA
            cooldown = 5, -- COOLDOWN EM MINUTOS, PARA A ZONA APOS SER DOMINADA.
        },

        avaliableWeapons = {
            ["Pistola"] = true,
            ["Metralhadora"] = true,
            ["Smg"] = true,
            ["Fuzil"] = true,
            ["Sniper"] = false,
            ["Shotgun"] = false,
        },

        blip = { -- CONFIGURACAO DO BLIP DO MAPA
            display = true, -- ATIVAR/DESATIVAR BLIP NO MAPA PARA MOSTRAR ZONA DOMINADA POR XXX
            blipId = 84, -- ID DO BLIP
            blipColor = 1, -- ID DA COR
            blipScale = 0.5, -- TAMANHO DO BLIP
            blipName = "[%s] Dominado Por: %s" -- NOME DO BLIP
        },

        paymentWinner = function(org, permission) -- Caso queira dar recompensas a parte para jogadores da organizacao
        -------- EXEMPLO --------
        --[[ local users = vRP.getUsersByPermission(permission)
            for source,user_id in pairs(users) do
                async(function()
                    vRP.giveInventoryItem(user_id, "dinheiro-sujo", 30) -- GIVANDO DINHEIRO NO INVENTARIO
                end)
            end  ]]
        ------- FIM EXEMPLO ------

        end,
        
    }, -- FIM DE UMA ZONA

        { -- INICIO DE UMA ZONA
        name = "Droga", -- NOME DA ZONA DE DOMINACAO

        coords = vec3(2753.35,1551.13,24.5), -- LOCALIZAÇÃO DA ZONA DE DOMINAÇÃO
        coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )
        vec3(2649.07,1728.55,30.05),
        vec3(2852.3,1730.05,27.11),
        vec3(2878.38,1678.3,25.31),
        vec3(2899.19,1620.02,23.74),
        vec3(2900.48,1544.19,24.0),
        vec3(2880.88,1425.69,23.97),
        vec3(2846.25,1384.31,27.03),
        vec3(2762.42,1306.88,25.3),
        vec3(2691.47,1310.92,26.28),
        vec3(2647.01,1313.67,28.38),
        vec3(2636.81,1333.22,28.59),
        vec3(2642.95,1688.01,25.98),
        vec3(2648.7,1728.34,24.53)
    },
        permissions = { -- PERMISSOES DE QUEM VAI PODER DOMINAR O LOCAL
            { org = "GROTA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
            { org = "B13", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!
            { org = "ROCINHA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        
        },

        dominationConfig = {
            dominationDebug = true, -- DEBUG PARA APARECER PARA TODOS JOGADORES PROXIMOS A ZONA DEMARCADA.
            vehicles = false, -- SE VAI PERMITIR TRANSIÇÃO DE VEICULOS DENTRO DA ZONA.
            playerPoints = 1, -- PONTUACAO QUE CADA JOGADOR VAI SOMAR NA DOMINACAO
            totalPoints = 1000, -- TOTAL DE PONTOS NECESSARIOS PARA DOMINAR A ZONA
            cooldown = 5, -- COOLDOWN EM MINUTOS, PARA A ZONA APOS SER DOMINADA.
        },

        avaliableWeapons = {
            ["Pistola"] = true,
            ["Metralhadora"] = true,
            ["Smg"] = true,
            ["Fuzil"] = true,
            ["Sniper"] = false,
            ["Shotgun"] = false,
        },

        blip = { -- CONFIGURACAO DO BLIP DO MAPA
            display = true, -- ATIVAR/DESATIVAR BLIP NO MAPA PARA MOSTRAR ZONA DOMINADA POR XXX
            blipId = 84, -- ID DO BLIP
            blipColor = 1, -- ID DA COR
            blipScale = 0.5, -- TAMANHO DO BLIP
            blipName = "[%s] Dominado Por: %s" -- NOME DO BLIP
        },

        paymentWinner = function(org, permission) -- Caso queira dar recompensas a parte para jogadores da organizacao
        -------- EXEMPLO --------
        --[[ local users = vRP.getUsersByPermission(permission)
            for source,user_id in pairs(users) do
                async(function()
                    vRP.giveInventoryItem(user_id, "dinheiro-sujo", 30) -- GIVANDO DINHEIRO NO INVENTARIO
                end)
            end  ]]
        ------- FIM EXEMPLO ------

        end,
        
    }, -- FIM DE UMA ZONA---------------


    { -- INICIO DE UMA ZONA-----editando 
    name = "Dominas Geral", -- NOME DA ZONA DE DOMINACAO

    coords = vec3(979.61,-3006.32,5.9), -- LOCALIZAÇÃO DA ZONA DE DOMINAÇÃO
    coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )
    vec3(1200.35,-2959.19,8.95),
    vec3(1196.02,-2956.05,5.9),
    vec3(825.84,-2963.86,5.91),
    vec3(822.97,-3067.43,5.91),
    vec3(1187.98,-3064.78,5.93),
    vec3(1198.41,-3055.49,5.91),
    vec3(1199.98,-2959.29,5.88)
},
    permissions = { -- PERMISSOES DE QUEM VAI PODER DOMINAR O LOCAL
        { org = "GROTA", permission = "perm.g" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        { org = "B13", permission = "perm.b" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!
        { org = "ROCINHA", permission = "perm.roc" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        { org = "HELPA", permission = "perm.he" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        { org = "BAHAMAS", permission = "perm.bah" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        { org = "BABEL", permission = "perm.bab" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        { org = "WOLVES", permission = "perm.wol" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
        { org = "MAFIA", permission = "perm.ma" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!

    
    
    },

    dominationConfig = {
        dominationDebug = true, -- DEBUG PARA APARECER PARA TODOS JOGADORES PROXIMOS A ZONA DEMARCADA.
        vehicles = false, -- SE VAI PERMITIR TRANSIÇÃO DE VEICULOS DENTRO DA ZONA.
        playerPoints = 1, -- PONTUACAO QUE CADA JOGADOR VAI SOMAR NA DOMINACAO
        totalPoints = 2500, -- TOTAL DE PONTOS NECESSARIOS PARA DOMINAR A ZONA
        cooldown = 5, -- COOLDOWN EM MINUTOS, PARA A ZONA APOS SER DOMINADA.
    },

    avaliableWeapons = {
        ["Pistola"] = true,
        ["Metralhadora"] = false,
        ["Smg"] = true,
        ["Fuzil"] = false,
        ["Sniper"] = false,
        ["Shotgun"] = false,
    },

    blip = { -- CONFIGURACAO DO BLIP DO MAPA
        display = true, -- ATIVAR/DESATIVAR BLIP NO MAPA PARA MOSTRAR ZONA DOMINADA POR XXX
        blipId = 84, -- ID DO BLIP
        blipColor = 1, -- ID DA COR
        blipScale = 0.6, -- TAMANHO DO BLIP
        blipName = "[%s] Dominado Por: %s" -- NOME DO BLIP
    },

    paymentWinner = function(org, permission) -- Caso queira dar recompensas a parte para jogadores da organizacao
    ------EXEMPLO --------
    --[[ local users = vRP.getUsersByPermission(permission)
        for source,user_id in pairs(users) do
            async(function()
                vRP.giveInventoryItem(user_id, "dinheiro-sujo", 30) -- GIVANDO DINHEIRO NO INVENTARIO
            end)
        end  ]]
    ------- FIM EXEMPLO ------

    end,
    
}, -- FIM DE UMA ZONA










        { -- INICIO DE UMA ZONA
            name = "Municão e Desmanche", -- NOME DA ZONA DE DOMINACAO

            coords = vec3(-506.88,5269.92,80.61), -- LOCALIZAÇÃO DA ZONA DE DOMINAÇÃO
            coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )
    vec3(-507.13,5198.57,88.62),
    vec3(-443.43,5410.31,81.58),
    vec3(-658.32,5407.35,54.98),
    vec3(-621.58,5217.39,80.12),
    vec3(-506.78,5198.69,88.87)
},

            permissions = { -- PERMISSOES DE QUEM VAI PODER DOMINAR O LOCAL
                { org = "MAFIA", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!
                { org = "Motoclub", permission = "perm.motoclub" }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!
                { org = "CARTEL", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!! 
                { org = "HELLSANGELS", permission = "perm." }, -- SE FOR ADICIONAR A MESMA PERMISSAO EM OUTRO LOCAL, MANTER A ORG COM MESMO NOME!!
            },

            dominationConfig = {
                dominationDebug = true, -- DEBUG PARA APARECER PARA TODOS JOGADORES PROXIMOS A ZONA DEMARCADA.
                vehicles = false, -- SE VAI PERMITIR TRANSIÇÃO DE VEICULOS DENTRO DA ZONA.
                playerPoints = 10, -- PONTUACAO QUE CADA JOGADOR VAI SOMAR NA DOMINACAO
                totalPoints = 1000, -- TOTAL DE PONTOS NECESSARIOS PARA DOMINAR A ZONA
                cooldown = 5, -- COOLDOWN EM MINUTOS, PARA A ZONA APOS SER DOMINADA.
            },

            avaliableWeapons = {
                ["Pistola"] = true,
                ["Metralhadora"] = true,
                ["Smg"] = true,
                ["Fuzil"] = true,
                ["Sniper"] = false,
                ["Shotgun"] = false,
            },

            blip = { -- CONFIGURACAO DO BLIP DO MAPA
                display = true, -- ATIVAR/DESATIVAR BLIP NO MAPA PARA MOSTRAR ZONA DOMINADA POR XXX
                blipId = 84, -- ID DO BLIP
                blipColor = 1, -- ID DA COR
                blipScale = 0.5, -- TAMANHO DO BLIP
                blipName = "[%s] Dominado Por: %s" -- NOME DO BLIP
            },

            paymentWinner = function(org, permission) -- Caso queira dar recompensas a parte para jogadores da organizacao
            -------- EXEMPLO --------
            --[[ local users = vRP.getUsersByPermission(permission)
                for source,user_id in pairs(users) do
                    async(function()
                        vRP.giveInventoryItem(user_id, "dinheiro-sujo", 30) -- GIVANDO DINHEIRO NO INVENTARIO
                    end)
                end  ]]
            ------- FIM EXEMPLO ------

            end,
            
        }, -- FIM DE UMA ZONA
        
    },

    Lang = {
        ['NotPermiss'] = function(source) TriggerClientEvent("Notify", source, "negado","Sua Organização não possui permissão para essa area.", 5000)  end,
        ['ZoneCooldown'] = function(source, time) TriggerClientEvent("Notify", source, "negado","Aguarde <b> "..time.." </b> para dominar essa area.", 15000)  end,
        ['YourZone'] = function(source) TriggerClientEvent("Notify", source, "negado","Está zona já e de sua organização", 5000)  end,
        ['InitZone'] = function(org, area) TriggerClientEvent('chatMessage', -1, "^1[DOMINACAO] ^0A Organização ^2"..org.."^0 acabou de iniciar uma zona de conflito em: ^2 "..area) end,
        ['ResumeZone'] = function(org, area) TriggerClientEvent('chatMessage', -1, "^1[DOMINACAO] ^0A Organização ^2"..org.."^0  está retomando a zona de conflito em: ^2 "..area) end,
        ['WinnerZone'] = function(org, area) TriggerClientEvent('chatMessage', -1, "^1[DOMINACAO] ^0A Organização ^2"..org.."^0 venceu a zona de conflito: ^2 "..area) end,
        
        ['NoPermitVehicles'] = function() TriggerEvent("Notify", "negado","Não é permitido o trafego de veiculos nessa zona.", 15000)  end,
        ['NoPermitWeapon'] = function(list) TriggerEvent("Notify", "negado","Este tipo de arma não é permitido nessa dominação.<br><br> Permitidas: "..list, 15000)  end,
        ['enterZone'] = function() TriggerEvent("Notify", "sucesso","Você entrou na zona de dominação...", 15000)  end,
        ['leaveZone'] = function() TriggerEvent("Notify", "negado","Você saiu da zona de dominação...", 15000)  end
    },

    Nui = {
        ScoreboardPosition = {
            top = 0,
            left = 2,
            right = nil,
            bottom = 0
        }, -- 0 a 100 || os lados que não forem ficar, coloque nil
        
        KillFeedPosition = {
            top = 23,
            left = nil,
            right = 2,
            bottom = nil
        } -- 0 a 100 || os lados que não forem ficar, coloque nil
    }
}


if SERVER then
    function hasPermission(user_id, permission)
        return vRP.hasPermission(user_id, permission)
    end

    function getUserIdentity(user_id)
        local identity = vRP.getUserIdentity(user_id)
        return identity
    end

    function getUserSource(user_id)
        return vRP.getUserSource(user_id)
    end
else
    DominationBlipConfig = function(coords, name, domined) -- BLIP DA DOMINACAO CONFIG
        DrawText3Ds(coords.x, coords.y, coords.z, "~r~[".. name .."] ~n~ ~w~Pressione ~b~[E]~w~ para iniciar a dominacao. ~n~ Controlado por: ~b~"..domined)
        DrawMarker(27, coords.x, coords.y, coords.z-0.95,0,0,0,0, 0,0,1.5,1.5,1.5, 0,179,255, 180,0,0,0,1)
    end

    function DrawText3Ds(x,y,z,text)
        local onScreen,_x,_y = World3dToScreen2d(x,y,z)
        SetTextFont(4)
        SetTextScale(0.35,0.35)
        SetTextColour(255,255,255,200)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end

    function drawTxt(text, font, x, y, scale, r, g, b, a)
        SetTextFont(font)
        SetTextScale(scale, scale)
        SetTextColour(r, g, b, a)
        SetTextOutline()
        SetTextCentre(1)
        SetTextEntry("STRING")
        AddTextComponentString(text)
        DrawText(x, y)
    end
end

--[[ 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUTORIAL
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    - Como verificar se o jogador tem alguma zona dominada?

    Este exemplo é apenas para SERVER-SIDE:
    local status,table = exports.mirtin_dominacao:GetUserDominationZone(user_id)

    Retorno da function acima:
    status = boolean [ true or false ]
    table = table [ zone, org ]

    Se o status == true, você/sua organização dominou uma zona
    Se o status == true, a table sera retornada da seguinte forma: table.org = Sua Organização, table.zone = Zona que sua organização dominou.

    Se o status == false, você/sua organização dominou não dominou nenhuma zona
    Se o status == false, a table sera retornada vazia {}

    Exemplo de um comando:

    RegisterCommand('dominei', function(source,args)
        local user_id = vRP.getUserId(source)
        if user_id then
            local status,table = exports.mirtin_dominacao:GetUserDominationZone(user_id)
            if status then
                print("Sua Organização: "..table.org.." Dominou a Area: "..table.zone)
            else
                print("Você não dominou nenhuma zona.")
            end
        end
    end)

    ]]