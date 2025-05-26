-- vRP settings ( for vRP bases - resources comes pre-configured for VRP,     but you can use in any framework u want)
Tunnel = module("vrp",    "lib/Tunnel")
Proxy = module("vrp",    "lib/Proxy")
Tools = module("vrp",    "lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

-- ################
-- # base_methods #
-- ################
-- # configuração de métodos essenciais da sua base | setup the essential methods from your base (framework)
-- 
-- # pegar a source do player pelo user_id | get the player source by user_id
get_user_source_by_user_id = function(user_id)
    return vRP.getUserSource(user_id)
end    
--
-- # pegar o user_id pela source do player | get the user_id (player account / character) by the player source
get_user_id_by_source = function(source)
    return vRP.getUserId(source)
end

-- # has_permission = seu método de checar se um player tem determinada permissão | check if the player account / character has the permission to lock/unlock the door
has_permission = function(user_id,    permission)
    if not permission then return true end
    if type(permission) == "table" then
        for k,    v in pairs(permission) do
            if vRP.hasPermission(user_id,    v) then 
                return true
            end
        end
    elseif type(permission) == "string" then
        return vRP.hasPermission(user_id,    permission)
    end
    return false
end

-- # pegar o nome do personagem/player pelo user_id | get the character/player name by user_id
get_char_name_by_user_id = function(user_id)
    local identity = vRP.getUserIdentity(user_id)
    if identity.name2 then
        return identity.name.." "..identity.name2
    else
        return identity.name.." "..identity.firstname
    end
end

-- # preparar um comando SQL | prepare a SQL command 
prepare = function(key,    data)
    vRP._prepare(key,    data)
end

-- # fazer uma query ao banco de dados | query something from database
query = function(key,    data)
    return vRP.query(key,    data)
end

-- # executar um comando ao banco de dados | execute something to the database
execute = function(key,    data)
    return vRP.execute(key,    data)
end

-- verificar se um jogador pode correr pelo user_id | check if the player can race by their user_id
can_race = function(user_id) 
    if has_permission(user_id,    races_block_by_permission) then 
        return false
    end
    if races_permission then
        if not base_methods.has_permission(user_id,    races_permission) then
            return false
        end
    end
    return true
end

-- retirar o ticket/item necessário para correr (caso tenha configurado para precisar de um) | withdraw the ticket/item needed to run (if you have configured it to need one)
remove_race_ticket = function(user_id)
    if vRP.tryGetInventoryItem(user_id,    "ticket",    1,     true) then
        return true
    end
    TriggerClientEvent("Notify",    vRP.getUserSource(user_id),    "negado",    "Você precisa de um Ticket de Corrida!",    10000)
    return false
end

-- função para notificação | function to notify player
notify_function = function(source,    type,    message) -- função de notificação
    if type == "error" then
        TriggerClientEvent("Notify",    source,    "negado",    message,    10000)
    else
        TriggerClientEvent("Notify",    source,    "sucesso",    message,    10000)
    end
end

-- função para pagar o player caso ele termine a corrida | function to pay player if win the race
pay_race_prize = function(user_id,    prize)
    local cops = vRP.getUsersByPermission('perm.policia')
    for k,    v in pairs(cops) do
        prize = prize + 1250
    end
    vRP.giveInventoryItem(user_id,"dinheirosujo",prize)
    TriggerClientEvent("Notify",    source,    "sucesso",    "Parabéns,     você finalizou a corrida e recebeu R$ "..format_currency(prize)..",    00",    25000)
end

-- função para avisar à policia quando uma corrida for iniciada | function to notify the police when a race has started
notify_police_start = function()

    local copAmount = vRP.getUsersByPermission('perm.poliia')


    for l,    w in pairs(copAmount) do
        local player = vRP.getUserSource(parseInt(w))
        if player then
            async(function()
          TriggerClientEvent("NotifyPush",    player,    { code = 40,     title = "RACHADORES",     x = x,     y = y,     z = z,     badge = "CORRIDA ILEGAL" },     'corrida')
          TriggerClientEvent("snt_races/police/notify_race_start",    player)
            
            end)
        end
    end
end

-- função para ficar marcando o corredor no gps para a policia | function to update the racer position on the gps for the polices
create_racer_blip_to_police = function(x,    y,    z)
    local cops = vRP.getUsersByPermission('perm.policia')
    for l,    w in pairs(cops) do
        local player = vRP.getUserSource(w)
        if player ~= source then
            TriggerClientEvent("snt_races/police/create_racer_blip",    player,    x,    y,    z)
            TriggerClientEvent("NotifyPush",    player,    { code = 40,     title = "RACHADORES",     x = x,     y = y,     z = z,     badge = "CORRIDA ILEGAL" },     'corrida')
        end
    end
end

-- cooldown entre cada corrida (tempo que precisa esperar antes de iniciar novamente) | cooldown between each race (time you need to wait before starting again)
races_cooldown = 0

-- as corridas devem explodir caso perder? | should races explode if you lose?
races_explosion = true

-- após quantos segundos irá explodir ao perder ou sair do veículo? | after how many seconds will it explode when losing or exiting the vehicle?
race_explosion_after_time = 1.0

-- permissao para abrir o menu? caso queira que qualquer um possa,     deixe "nil" | permission to open the menu? if you want anyone to be able to,     leave "nil"
races_permission = nil

-- bloquear determinadas permissões de iniciar uma corrida | block certain permissions from racing
races_block_by_permission = {"policia"}

-- localização do blip para abrir o menu / iniciar corridas | blip location to open menu/start races
explosive_races_start_point = {2351.43, 3133.44, 48.21,    80.00}

-- # Corridas EXPLOSIVAS
-- ## name = nome da corrida | race name
-- ## needed = NIL PARA NAO USAR ITEM E TRUE PARA USAR O ITEM
-- ## desc = descrição da corrida | race description 
-- ## time = tempo para finalizar a corrida (em segundos) | time to finish race before lose/explosion
-- ## prize = valor do prêmio | race prize value 
-- ## points = pontos da corrida | race points (positions)
explosive_races = {
    {
        name = "Quanto Mais Facil Melhor!!",    
        needed = true,    
        desc = "Mamão com açucar So para aprender",    
        time = 250,    
        prize = 10000,    
        points = {
            {2308.94,     3139.92,     47.21},    
            {2285.01,     3112.84,     47.0},    
            {2298.97,     2995.65,     46.07},    
            {2379.3,     2947.14,     48.61},    
            {2596.8,     2556.82,     31.98},    
            {2542.21,     1653.25,     28.19},    
            {2451.92,     1272.25,     51.59},    
            {2389.28,     1207.99,     59.04},    
            {2380.54,     1005.48,     82.28},    
            {2465.38,     880.2,     90.42},    
            {2400.69,     -239.33,     84.79},    
            {1068.15,     -1175.75,     55.0},    
            {-273.4,     -1184.91,     36.63},    
            {-390.56,     -973.39,     36.5},    
            {-379.76,     -678.88,     36.66},    
            {-159.67,     -538.08,     27.79},    
            {89.59,     -524.78,     33.42},    
            {849.18,     -721.7,     41.89},    
            {1027.19,     -827.67,     47.74},    
            {1158.72,     -864.54,     53.49},    
            {1156.57,     -992.71,     45.0},    
            {1232.86,     -1355.1,     34.5},    
            {1224.18,     -1411.71,     34.36},    
            {1081.66,     -1431.35,     36.1},    
            {488.24,     -1424.65,     28.68},    
            {336.14,     -1317.88,     31.36},    
            {231.11,     -1278.61,     28.56},    
            {237.66,     -1010.02,     28.64},    
            {1064.77,     343.74,     82.8},    
            {1813.12,     1989.22,     76.26},    
            {2192.34,     2713.0,     46.46},    
            {2353.39,     2818.1,     42.22},    
            {2433.33,     2878.17,     48.53},    
            {2181.73,     3023.37,     44.71},    
            {1849.6,     3230.37,     44.12},    
            {1735.69,     3297.86,     40.56},    
            {1731.72,     3311.06,     40.56}
        }
    },    
    {
        name = "Descendo a Madeireira",    
        needed = true,    
        desc = "Aproveite a adrenalina de uma corrida cheia de emoções.",    
        time = 160,    
        prize = 80000,    
        points = {
            {2265.99,     3160.49,     48.22},    
            {2212.87,     3245.38,     47.42},    
            {1958.23,     3305.0,     44.87},    
            {1681.45,     3498.2,     35.8},    
            {925.08,     3537.12,     33.39},    
            {259.89,     3400.32,     37.32},     
            {90.38,     3461.19,     39.13},    
            {-204.98,     3786.14,     39.76},    
            {-241.8,     4056.2,     35.22},    
            {-123.2,     4280.06,     44.54},    
            {155.5,     4431.14,     76.2},    
            {109.42,     4476.81,     84.38},    
            {-131.67,     4613.23,     124.33},    
            {-591.47,     4997.58,     143.45},    
            {-730.81,     5177.72,     109.17},    
            {-927.81,     5247.01,     82.87},    
            {-692.8,     5312.84,     69.17},    
            {-820.46,     5441.22,     32.94}
        }
    },    
    {
        name = "Apenas um Show",    
        needed = true,    
        desc = "Corra para seu show o mais rapido possivel.",    
        time = 140,    
        prize = 87000,    
        points = {
            {2286.21,     3112.38,     46.98},    
            {2270.41,     3006.63,     45.06},    
            {1367.89,     2688.27,     37.04},    
            {292.59,     2615.79,     44.01},    
            {718.78,     2252.57,     51.44},    
            {170.3,     2107.11,     125.7},    
            {-152.77,     1875.37,     197.58},    
            {23.48,     1725.41,     222.36},    
            {341.52,     1004.24,     209.88},    
            {668.25,     784.5,     204.92},    
            {853.86,     982.05,     240.55},    
            {931.82,     688.1,     177.38},    
            {1143.41,     739.71,     143.86},    
            {1016.87,     498.0,     96.82},    
            {686.22,     615.69,     128.25},    
        }
    },    
    {
        name = "Piloto de Reta",    
        needed = true,    
        desc = "acelere o maximo que puder,     ou não.",    
        time = 235,    
        prize = 85000,    
        points = {
            {2262.51,     3170.52,     48.33},    
            {2225.0,     3245.1,     47.49},    
            {1952.3,     3306.94,     44.86},    
            {1813.46,     3304.23,     42.05},    
            {1714.12,     3519.15,     35.8},    
            {2494.45,     4140.46,     37.57},    
            {2463.08,     4334.3,     35.88},    
            {2397.96,     4649.82,     36.06},    
            {2184.9,     4763.57,     40.63},    
            {2201.65,     4863.12,     44.01},    
            {2072.42,     5006.11,     40.35},    
            {1983.72,     5143.99,     43.36},    
            {2274.45,     5179.99,     59.4},    
            {2377.73,     5217.85,     56.23},    
            {2625.19,     5112.28,     44.2},    
            {2746.2,     5012.26,     36.61},    
            {2917.35,     4453.7,     47.32},    
            {2788.4,     4374.64,     48.79},    
            {2867.68,     3623.95,     51.98},    
            {2022.38,     2611.81,     53.19},    
            {1571.08,     1005.88,     78.32},    
            {1201.72,     525.81,     80.86},    
            {1101.27,     420.7,     90.83},    
            {1156.62,     317.46,     90.93},    
            {926.72,     67.93,     79.11},    
            {902.65,     6.17,     78.13},    
            {921.83,     -19.18,     78.1},    
            {1009.22,     -215.18,     69.52},    
            {980.37,     -298.35,     66.41},    
            {1062.62,     -404.49,     66.5},    
            {894.67,     -582.85,     56.73},    
            {1041.81,     -767.83,     57.33},    
            {1046.09,     -795.06,     57.61}
        }
    },    
    {
        name = "Criando Asas",    
        needed = true,    
        desc = "As vezes precisamos apenas pular.",    
        time = 230,    
        prize = 100000,    
        points = {
            {2282.15,     3126.1,     47.32},    
            {2248.26,     3009.7,     44.6},    
            {1061.91,     2689.19,     38.45},    
            {222.81,     2627.11,     46.25},    
            {-305.17,     2895.01,     44.77},    
            {-576.82,     2683.25,     43.0},    
            {-703.25,     2426.33,     61.25},    
            {-788.58,     2124.15,     108.85},    
            {-713.79,     1881.54,     153.42},    
            {-770.2,     1639.51,     204.51},    
            {-722.35,     996.86,     237.35},    
            {-847.32,     810.43,     194.62},    
            {-1373.47,     627.36,     133.0},    
            {-1430.37,     473.37,     110.26},    
            {-1445.24,     405.52,     110.05},    
            {-1410.77,     215.69,     58.26},    
            {-1396.34,     -122.07,     49.62},    
            {-1254.21,     -329.48,     36.46},    
            {-986.09,     -396.94,     37.21},    
            {-774.65,     -650.17,     29.14},    
            {-772.39,     -969.93,     14.91},    
            {-771.64,     -1113.3,     10.06},    
            {-717.46,     -1394.1,     4.34}
        }
    },    
    {
        name = "Menino de Cidade",    
        needed = true,    
        desc = "Mostre que você conhece as Ruas.",    
        time = 220,    
        prize = 100000,    
        points = {
            {2285.32,     3111.72,     46.98},    
            {2304.65,     2993.73,     46.29},    
            {2598.6,     2372.15,     20.98},    
            {2414.54,     1211.11,     57.59},    
            {2559.32,     796.72,     88.62},    
            {2595.51,     640.03,     94.53},    
            {2552.83,     300.23,     107.8},    
            {1218.14,     -1158.87,     50.93},    
            {172.16,     -1163.29,     37.15},    
            {67.75,     -1125.33,     28.68},    
            {102.83,     -1068.27,     28.57},    
            {194.23,     -1087.81,     28.63},    
            {332.61,     -1026.5,     28.63},    
            {338.97,     -997.74,     28.53},    
            {389.09,     -999.15,     28.76},    
            {411.82,     -1068.02,     28.69},    
            {497.91,     -1074.6,     28.12},    
            {527.45,     -1421.92,     28.6},    
            {490.46,     -1454.94,     28.59},    
            {487.15,     -1515.0,     28.63},    
            {401.59,     -1566.41,     28.55},    
            {280.79,     -1471.39,     28.68},    
            {38.52,     -1304.66,     28.56},    
            {-41.49,     -1294.44,     28.52},    
            {-41.4,     -1222.21,     29.34},    
            {-61.08,     -1227.92,     28.15},    
            {-86.22,     -1241.49,     28.41},    
            {-119.11,     -1254.31,     28.59},    
            {-310.14,     -1259.34,     29.87},    
            {-334.77,     -1264.23,     30.64},    
            {-342.84,     -1286.56,     30.67},    
            {-331.72,     -1325.93,     30.7},    
            {-242.8,     -1307.56,     30.64},    
            {-109.66,     -1292.41,     28.67},    
            {-79.21,     -1145.83,     25.13},    
            {67.8,     -1093.67,     28.73},    
            {50.88,     -1054.99,     29.1},    
            {-3.44,     -1036.93,     38.0}
        }
    },    
    {
        name = "Avião sem Asas",    
        needed = true,    
        desc = "Mostre que Não e so Avião que Voa",    
        time = 230,    
        prize = 130000,    
        points = {
            {2288.74,     3106.47,     46.92},    
            {2318.79,     2988.8,     46.87},    
            {2353.85,     2931.03,     48.12},    
            {1734.72,     1746.43,     78.23},    
            {702.62,     -121.72,     51.79},    
            {549.47,     -341.76,     34.49},    
            {498.81,     -415.3,     37.14},    
            {564.71,     -590.2,     43.92},    
            {619.03,     -779.42,     10.62},    
            {648.31,     -928.96,     20.89},    
            {671.23,     -984.68,     21.56},    
            {768.82,     -989.0,     25.35},    
            {742.29,     -1004.35,     26.56},    
            {411.72,     -1067.97,     28.69},    
            {503.49,     -1078.57,     28.18},    
            {430.78,     -1133.94,     28.75},    
            {371.14,     -1158.51,     30.56},    
            {212.31,     -1225.86,     37.65},    
            {-120.17,     -1236.12,     36.63},    
            {-238.95,     -1246.14,     37.35},    
            {-381.8,     -1330.06,     36.5},    
            {-396.67,     -1313.51,     37.28},    
            {-396.66,     -982.41,     36.55},    
            {-419.37,     -980.66,     36.37},    
            {-431.05,     -1079.62,     39.93},    
            {-441.26,     -1187.04,     53.69},    
            {-454.95,     -1347.06,     33.57},    
            {-443.02,     -1429.87,     28.66},    
            {-297.11,     -1433.11,     30.69},    
            {-274.8,     -1336.18,     30.69},    
            {-216.7,     -886.09,     28.99},    
            {-354.86,     -820.66,     30.85},    
            {-325.22,     -667.37,     31.86},    
            {-173.25,     -695.85,     35.31},    
            {49.63,     -780.9,          43.51},    
            {153.46,     -816.56,     30.52},    
            {108.15,     -982.27,     28.75},    
            {52.05,     -1055.18,     28.95},    
            {3.01,     -1047.1,         37.49},    
            {31.04,     -1092.5,        38.06},    
            {72.53,     -1131.15,     28.66},    
            {180.79,     -1132.35,     28.62},    
            {400.96,     -1131.43,     28.79},    
            {464.45,     -1119.79,     28.63},    
            {464.29,     -1085.8,     28.55},    
            {464.28,     -1073.78,     28.55}
        }
    },    
    {
        name = "Volta ao Mundo",    
        needed = true,    
        desc = "Posso ser Longa mais so passam os Melhores",    
        time = 420,    
        prize = 150000,    
        points = {
            {2284.25,     3115.22,     47.05},    
            {2302.7,     2994.31,     46.21},    
            {2355.92,     2935.4,     48.24},    
            {1764.96,     2019.0,     68.09},    
            {625.34,     -225.79,     43.4},    
            {498.01,     -377.62,     41.27},    
            {-294.83,     -497.89,     24.66},    
            {-1822.96,     -579.35,     10.71},    
            {-2613.1,     -117.63,     19.54},    
            {-3039.74,     1418.11,     22.78},    
            {-2692.94,     2277.12,     19.21},    
            {-1639.79,     2425.3,     25.99},    
            {-426.72,     2875.6,     37.09},    
            {-210.26,     2955.74,     29.27},    
            {226.58,     3296.85,     40.08},    
            {227.3,     3351.91,     38.95},    
            {99.25,     3499.33,     39.12},    
            {-225.97,     3926.58,     36.78},    
            {-188.09,     4225.71,     44.27},    
            {198.09,     4439.66,     71.8},    
            {903.87,     4456.28,     50.33},    
            {1390.93,     4495.55,     52.57},    
            {1731.36,     4598.64,     40.59},    
            {1710.64,     4701.06,     42.04},    
            {1760.73,     4734.44,     40.44},    
            {1809.71,     4792.01,     40.22},    
            {1783.47,     4930.42,     41.8},    
            {1974.34,     5119.39,     42.47},    
            {1987.43,     5148.81,     44.04},    
            {2386.52,     5200.43,     53.05},    
            {2439.83,     5127.13,     46.3},    
            {2635.01,     5145.79,     44.14},    
            {1465.47,     6459.78,     20.79},    
            {469.01,     6566.47,     26.32},    
            {134.74,     6550.43,     30.96},    
            {53.09,     6589.54,     30.78},    
            {-121.48,     6434.27,     30.82},    
            {-187.91,     6460.89,     30.12},    
            {-358.19,     6288.76,     29.51},    
            {-320.28,     6214.16,     30.74},    
            {-452.78,     6072.15,     30.74},    
            {-576.79,     6136.76,     6.59},    
            {-165.83,     6575.42,     12.02},    
            {-92.71,     6652.3,     10.5},    
            {104.79,     6794.32,     19.4},    
            {405.34,     6681.01,     16.08},    
            {469.32,     6571.56,     26.35},    
            {148.72,     6585.51,     31.19}
        }
    },    
    {
        name = "Menino da Fazenda!",    
        needed = true,    
        desc = "Apenas aqueles que gostam de um off-road!",    
        time = 385,    
        prize = 170000,    
        points = {
            {2269.42,     3153.8,     48.08},    
            {2240.68,     3263.76,     47.32},    
            {2136.08,     3527.26,     43.86},    
            {2135.67,     3652.85,     36.51},    
            {2384.18,     3811.35,     37.27},    
            {2445.7,     3905.23,     35.7},    
            {2659.79,     3978.99,     43.52},    
            {2742.75,     3876.97,     42.81},    
            {2844.15,     3684.95,     49.37},    
            {2860.35,     3647.0,     51.94},    
            {2865.64,     3594.12,     52.29},    
            {2884.78,     3606.85,     52.11},    
            {2853.51,     4273.51,     49.49},    
            {2666.21,     5019.73,     44.15},    
            {2662.62,     5115.75,     44.07},    
            {2735.17,     5054.14,     40.42},    
            {2784.06,     4943.07,     33.01},    
            {2629.59,     4802.41,     32.92},    
            {2536.45,     4883.74,     36.9},    
            {2472.44,     4962.84,     44.49},    
            {2452.3,     5031.8,     45.21},    
            {2378.1,     5112.68,     46.77},    
            {2390.08,     5183.96,     50.77},    
            {2279.2,     5181.43,     59.36},    
            {2239.23,     5180.78,     59.52},    
            {2134.48,     5074.6,     43.77},    
            {2066.43,     5007.45,     40.31},    
            {1998.3,     4939.13,     41.58},    
            {1973.69,     4891.1,     43.29},    
            {1989.67,     4860.15,     43.26},    
            {1931.37,     4802.99,     43.15},    
            {1867.56,     4759.62,     38.92},    
            {1830.08,     4789.09,     41.57},    
            {1807.95,     4782.72,     39.31},    
            {1753.33,     4725.17,     40.71},    
            {1697.32,     4683.64,     42.39},    
            {1727.91,     4574.38,     39.44},    
            {1513.91,     4553.64,     52.36},    
            {1425.1,     4524.96,     51.48},    
            {1220.41,     4458.47,     54.08},    
            {1036.19,     4455.74,     51.81},    
            {855.96,     4491.59,     52.72},    
            {858.28,     4237.49,     49.46},    
            {815.79,     4232.45,     52.08},    
            {624.15,     4225.51,     53.09},    
            {395.17,     4403.54,     61.97},    
            {145.61,     4421.16,     74.66},    
            {-110.78,     4296.97,     44.98},    
            {-250.5,     4414.8,     45.94},    
            {-414.25,     4525.94,     96.66},    
            {-575.92,     4535.6,     78.09},    
            {-666.29,     4516.14,     84.43},    
            {-758.11,     4522.25,     89.96},    
            {-881.34,     4529.67,     111.52},    
            {-967.22,     4549.35,     126.12},    
            {-1109.81,     4588.66,     132.7},    
            {-1293.15,     4613.65,     119.52},    
            {-1373.92,     4729.92,     47.27},    
            {-1535.88,     4704.16,     43.55},    
            {-1584.45,     4751.26,     50.21},    
            {-1498.11,     4966.59,     62.92},    
            {-1521.52,     4977.39,     61.79},    
            {-1795.48,     4728.2,     56.35},    
            {-2108.26,     4460.47,     61.02},    
            {-2210.95,     4343.64,     49.87},    
            {-2208.76,     4273.6,     47.32},    
            {-2204.33,     4253.73,     46.9},    
            {-2220.56,     4237.55,     46.44}
        }
    },    
    {
        name = "Menino de Copacabana!",    
        needed = true,    
        desc = "Mostre que Vc Domina Copacabana!",    
        time = 255,    
        prize = 110000,    
        points = {
            {2288.33,     3104.95,     46.92},    
            {2307.01,     2992.72,     46.38},    
            {2361.53,     2941.69,     48.42},    
            {1850.16,     2403.6,     54.02},    
            {1706.38,     1494.99,     84.19},    
            {1619.06,     1107.79,     81.43},    
            {1325.38,     627.36,     79.81},    
            {1202.85,     526.29,     80.82},    
            {1080.39,     439.01,     90.98},    
            {1008.86,     504.49,     97.96},    
            {913.8,     503.81,     120.09},    
            {664.94,     352.49,     110.11},    
            {274.24,     626.9,     154.93},    
            {283.33,     746.03,     183.02},    
            {-146.52,     517.13,     139.91},    
            {-339.04,     474.58,     110.3},    
            {-312.31,     442.99,     107.69},    
            {-488.43,     401.21,     99.05},    
            {-547.07,     458.2,     101.23},    
            {-572.05,     512.06,     105.19},    
            {-851.47,     443.87,     86.38},    
            {-1111.03,     571.1,     102.1},    
            {-1258.09,     464.44,     93.46},    
            {-1423.35,     549.44,     121.94},    
            {-1354.28,     568.63,     129.96},    
            {-1344.7,     625.68,     134.47},    
            {-1046.3,     781.71,     166.7},    
            {-856.57,     708.41,     148.23},    
            {-696.58,     715.13,     157.44},    
            {-742.73,     834.83,     214.32},    
            {-706.58,     1109.33,     257.38},    
            {-719.38,     1168.82,     263.21},    
            {-461.1,     1347.19,     303.67},    
            {-435.01,     1191.81,     325.08},    
            {-422.58,     1188.02,     324.92},    
            {-413.77,     1185.56,     324.88},    
            {-404.93,     1182.9,     324.88},    
            {-375.71,     1170.73,     325.07},    
            {-349.5,     1155.66,     324.88}
        }
    },    
}

-- mensagens | language settings
lang = {
    wait_cooldown = "Aguarde para iniciar outra corrida..",    
    race_started = "Corrida #{RACE_ID} iniciada! Boa sorte!"
}
