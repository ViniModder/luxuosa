-----------------------------------------------------------------------------------------------------------------------------------------
-- Desativar Dispatch
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
    {-1610.8, 181.76, 59.8, 526, 3, 'PMERJ', 0.8},--PMERJ 
	--{-233.59,1523.03,337.6, 137, 1, 'BOPE', 0.8},--BOPE 
	{1779.13,2556.76,45.66, 648, 5, 'restaurante prissão', 0.8},--restaurante dentro prisao 

    ---{-1298.09,271.46,64.08, 526, 31, 'Policia Federal', 0.8},
	{-2290.43,3184.98,32.81, 526, 31, 'Exercito Brasileiro', 0.8},
    {-1063.8,-870.3,4.52, 526, 0, 'Policia Civil', 0.8},
	--{2909.2, 4162.59, 51.41, 526, 5, 'Policia Rodoviária Federal', 0.8},

    {2765.11,3468.22,55.62, 643, 47, 'Stop Car', 0.8},
    {526.53,-171.67,55.05, 643, 47, 'Ride Out Customs', 0.8},
    --{-1678.54, -782.07, 10.88, 351, 16, 'OAB', 1.1},
    -- {-2274.32, 330.67, 174.61, 489, 1, 'Centro Médico Havana', 1.0},
	{-480.05,226.5,83.1, 489, 1, 'Medical Center', 1.0},
   -- {-1125.24,-1727.26,4.33, 436, 1, 'Corpo de Bombeiros', 0.9},
    --{-584.72, -925.84, 23.64, 564, 16, 'Jornal Luxuosa News', 0.8},
    {264.77, -1262.3, 29.28, 361, 6, 'Posto de Gas', 0.4},
    {-723.81, -937.45, 19.02, 361, 6, 'Posto de Gas', 0.4},
    {-2097.4, -320.01, 13.16, 361, 6, 'Posto de Gas', 0.4},
    {-2555.16, 2334.23, 33.08, 361, 6, 'Posto de Gas', 0.4},
    {-94.39, 6419.93, 31.49, 361, 6, 'Posto de Gas', 0.4},
    {1701.51, 6416.04, 32.76, 361, 6, 'Posto de Gas', 0.4},
    {2680.25, 3265.06, 55.4, 361, 6, 'Posto de Gas', 0.4},
    {819.63, -1028.67, 26.4, 361, 6, 'Posto de Gas', 0.4},
    {620.51, 268.86, 103.09, 361, 6, 'Posto de Gas', 0.4},
    {1208.31, -1402.94, 35.22, 361, 6, 'Posto de Gas', 0.4},
    {2004.97, 3774.18, 32.4, 361, 6, 'Posto de Gas', 0.4},
    {175.24, -1562.45, 29.27, 361, 6, 'Posto de Gas', 0.4},
    {-70.62, -1760.36, 29.54, 361, 6, 'Posto de Gas', 0.4},
    {-1800.02, 803.69, 138.64, 361, 6, 'Posto de Gas', 0.4},
    {-1437.27, -276.0, 46.2, 361, 6, 'Posto de Gas', 0.4},
    {2581.07, 361.65, 108.46, 361, 6, 'Posto de Gas', 0.4},
    {-75.19, -819.12, 326.18, 360, 46, 'Garagem | Helicóptero VIP', 0.6},
    {-1112.45, -2883.82, 13.93, 360, 46, 'Garagem | Helicóptero VIP', 0.6},
    {1770.22, 3239.48, 42.12, 360, 46, 'Garagem | Helicóptero VIP', 0.6},
    {4890.6, -5736.59, 26.35, 360, 46, 'Garagem | Helicóptero VIP', 0.6},
    {-1522.47, 1493.89, 111.58, 356, 53, 'Garagem | Embarcações', 0.6},
    {1331.27, 4270.12, 31.49, 356, 53, 'Garagem | Embarcações', 0.6},
    {3854.66, 4458.72, 1.85, 356, 53, 'Garagem | Embarcações', 0.6},
    {-1630.44, -1158.92, 1.55, 356, 53, 'Garagem | Embarcações', 0.6},
    {-1184.33, -1509.53, 4.65, 357, 0, 'Garagem | Veículos', 0.6},
    {1690.3, 3581.13, 35.62, 357, 0, 'Garagem | Veículos', 0.6},
    {-994.04, -2706.06, 14.02, 357, 0, 'Garagem | Veículos', 0.6},
    {-1659.3, 51.18, 62.97, 357, 0, 'Garagem | Veículos', 0.6},
    {-340.76, 265.97, 85.68, 357, 0, 'Garagem | Veículos', 0.6},
    {362.23, 298.2, 103.88, 357, 0, 'Garagem | Veículos', 0.6},
    {596.56, 91.34, 93.13, 357, 0, 'Garagem | Veículos', 0.6},
    {1036.36, -763.06, 58.0, 357, 0, 'Garagem | Veículos', 0.6},
    {275.5, -344.88, 45.17, 357, 0, 'Garagem | Veículos', 0.6},
    {56.04, -876.54, 30.65, 357, 0, 'Garagem | Veículos', 0.6},
    {-315.81, -878.95, 31.21, 357, 0, 'Garagem | Veículos', 0.6},
    {317.08, 2622.8, 44.45, 357, 0, 'Garagem | Veículos', 0.6},
    {2890.42, 4391.69, 50.33, 357, 0, 'Garagem | Veículos', 0.6},
	{-382.19, 2812.05, 45.43, 357, 0, 'Garagem | Veículos', 0.6},
    {1696.08, 4785.16, 42.02, 357, 0, 'Garagem | Veículos', 0.6},
    {-773.34, 5598.15, 33.6, 357, 0, 'Garagem | Veículos', 0.6},
    {-196.74, 6566.63, 11.14, 357, 0, 'Garagem | Veículos', 0.6},
    {-1398.34, -1388.26, 3.56, 226, 0, 'Garagem | Bicicletario', 0.7},
    {-895.96, -778.97, 15.91, 226, 0, 'Garagem | Bicicletario', 0.7},
    {-3244.21, 1005.43, 12.82, 52, 2, 'Mercadinho', 0.5},
    {-3042.69, 588.76, 7.9, 52, 2, 'Mercadinho', 0.5},
    {-2967.89, 390.8, 15.05, 52, 2, 'Mercadinho', 0.5},
    {-1487.23, -379.1, 40.15, 52, 2, 'Mercadinho', 0.5},
    {-1222.77, -907.12, 12.32, 52, 2, 'Mercadinho', 0.5},
    {-707.32, -913.78, 19.21, 52, 2, 'Mercadinho', 0.5},
    {25.73, -1346.54, 29.49, 52, 2, 'Mercadinho', 0.5},
    {-47.73, -1757.26, 29.42, 52, 2, 'Mercadinho', 0.5},
    {1135.57, -982.23, 46.4, 52, 2, 'Mercadinho', 0.5},
    {1163.45, -323.07, 69.2, 52, 2, 'Mercadinho', 0.5},
    {373.89, 326.81, 103.56, 52, 2, 'Mercadinho', 0.5},
    {-1820.82, 793.19, 138.1, 52, 2, 'Mercadinho', 0.5},
    {547.98, 2670.35, 42.16, 52, 2, 'Mercadinho', 0.5},
    {1165.94, 2709.37, 38.15, 52, 2, 'Mercadinho', 0.5},
    {2677.88, 3280.84, 55.23, 52, 2, 'Mercadinho', 0.5},
    {1729.31, 6415.48, 35.03, 52, 2, 'Mercadinho', 0.5},
    {2556.48, 382.11, 108.61, 52, 2, 'Mercadinho', 0.5},
    {1393.24, 3605.27, 34.98, 52, 2, 'Mercadinho', 0.5},
    {1960.7, 3741.33, 32.33, 52, 2, 'Mercadinho', 0.5},
    {1698.47, 4924.19, 42.06, 52, 2, 'Mercadinho', 0.5},
    {4.62, 6512.29, 31.88, 73, 0, 'Loja de Roupas', 0.5},
    {-3170.59, 1043.62, 20.86, 73, 0, 'Loja de Roupas', 0.5},
    {-1193.11, -767.98, 17.32, 73, 0, 'Loja de Roupas', 0.5},
    {-1450.85, -238.15, 49.81, 73, 0, 'Loja de Roupas', 0.5},
    {-709.6, -153.41, 37.41, 73, 0, 'Loja de Roupas', 0.5},
    {-163.19, -302.07, 39.73, 73, 0, 'Loja de Roupas', 0.5},
    {125.52, -223.76, 54.56, 73, 0, 'Loja de Roupas', 0.5},
    {425.61, -806.4, 29.49, 73, 0, 'Loja de Roupas', 0.5},
    {-822.21, -1073.4, 11.32, 73, 0, 'Loja de Roupas', 0.5},
    {75.43, -1392.77, 29.37, 73, 0, 'Loja de Roupas', 0.5},
    {1196.8, 2710.21, 38.22, 73, 0, 'Loja de Roupas', 0.5},
    {614.19, 2762.81, 42.09, 73, 0, 'Loja de Roupas', 0.5},
    {-1101.38, 2710.58, 19.11, 73, 0, 'Loja de Roupas', 0.5},
    {126.05, -223.10, 54.55, 73, 0, 'Loja de Roupas', 0.5},
    {252.86, -49.21, 69.94, 110, 0, 'Ammu-Nation', 0.7},
    {843.34, -1034.04, 28.19, 110, 0, 'Ammu-Nation', 0.7},
    {811.23, -2157.75, 29.62, 110, 0, 'Ammu-Nation', 0.7},
    {21.29, -1106.45, 29.79, 110, 0, 'Ammu-Nation', 0.7},
    {-663.23, -934.83, 21.82, 110, 0, 'Ammu-Nation', 0.7},
    {-1305.13, -393.46, 36.7, 110, 0, 'Ammu-Nation', 0.7},
    {-331.37, 6083.4, 31.46, 110, 0, 'Ammu-Nation', 0.7},
    {1692.62, 3759.46, 34.69, 110, 0, 'Ammu-Nation', 0.7},
    {-815.59, -182.16, 37.56, 71, 0, 'Salão de Beleza', 0.5},
    {139.21, -1708.96, 29.30, 71, 0, 'Salão de Beleza', 0.5},
    {-1282.00, -1118.86, 7.00, 71, 0, 'Salão de Beleza', 0.5},
    {1934.11, 3730.73, 32.85, 71, 0, 'Salão de Beleza', 0.5},
    {1211.07, -475.00, 66.21, 71, 0, 'Salão de Beleza', 0.5},
    {-34.97, -150.90, 57.08, 71, 0, 'Salão de Beleza', 0.5},
    {-280.37, 6227.01, 31.70, 71, 0, 'Salão de Beleza', 0.5},
    {2950.36, 2796.44, 40.84, 407, 32, 'Emprego | Minerador', 0.4},
	{1133.99,-665.55,57.09, 407, 32, 'Venda de peixes', 0.4},
    {-140.13, 6271.05, 31.34, 407, 32, 'Emprego | Sedex', 0.4},
    {-58.19, 6522.8, 31.49, 407, 32, 'Emprego | Ifood', 0.4},
    {-37.84, 6420.77, 31.49, 407, 32, 'Emprego | Entregador de gás', 0.4},
    {72.0, 6410.11, 31.22, 407, 32, 'Emprego | CocaCola', 0.4},
    {-3278.87,531.01,12.27, 439, 46, 'Mansão vermelha', 0.6},
    --{-152.71, 904.98, 235.64, 439, 46, 'Mansão Talit', 0.6},
	{2794.53,-714.42,7.62, 439, 46, 'Mansão ilha', 0.6},
	{188.09,-3167.06,5.78, 614, 48, 'Club 77', 0.6},---clube 77
	{-551.98,304.16,83.2, 121, 46, 'Tequila', 0.6},
	{760.19,3303.21,47.9, 439, 46, 'MANSAO SAMUKA ', 0.7},
	{-2695.95,-57.62,16.24, 439, 46, 'MANSAO CAVEIRA ', 0.7},---------------vendida jhow
	--{-1250.94,812.77,193.37, 439, 46, 'Mansão', 0.6},
	--{-411.75,3036.48,30.21, 439, 46, 'Mansão riacho', 0.6}, 
	--{2563.89,6160.74,162.89, 439, 46, 'Mansão cabana', 0.6}, 
	--{-1466.37,-29.64,54.71, 439, 46, 'Mansão brofx07', 0.6}, 
	--{-5859.24,1209.96,5.83, 439, 46, 'Ilha Secreta', 0.6}, 
	--{-844.74,-25.09,40.39, 439, 46, 'Mansão', 0.6}, 

   {-2644.37,1306.41,145.94, 439, 46, 'Mansão Ghost', 0.6},
    {-825.74,-2168.37,101.97, 439, 46, 'Manssão Lobinho', 0.6},------mansao vendida pro tk 
    {-3125.59,801.72,17.76, 439, 46, 'Zultra Mansion', 0.6},---PROXIMO PALETO 
    {-135.12,973.34,235.88, 439, 46, 'Mansão Zinho', 0.6},---PROXIMO CRISTO 
    {1027.75,1726.44,163.19, 439, 46, 'Mansão Maya', 0.6},--PROXIMO CADEIA 
    {-1892.92,2036.08,140.75, 439, 46, 'Mansão CHAPAHOUSE', 0.6},--PROXIMO VINHEDO 
    {-1557.27,845.35,183.66, 439, 46, 'Mansão Blacksmith', 0.6},--PROXIMO CEMITERIO 
    {-1254.39,842.08,193.37, 439, 46, 'Mansão Influenciadores', 0.6},
	---{-461.09, 4387.84, 34.81, 614, 48, 'Luxuosa Club Bar', 0.6}, 
    {-1804.6,444.15,128.51, 439, 46, 'Mansão Veroni', 0.6},
	{-2597.1,1667.17,140.54, 439, 46, 'Floripa House', 0.6}, 
	--{-1809.33, 429.67, 128.5, 439, 46, "Winchester's Mansion", 0.6},
    {-174.51, 6384.08, 31.49, 51, 0, 'Farmácia', 0.5},--norte 
    {321.71, -1076.29, 29.47, 51, 0, 'Farmácia', 0.5},--praça 
    {-622.93, -230.07, 38.05, 617, 43, 'Joalheria', 0.8},
    {234.12, 216.18, 106.29, 374, 5, 'Banco Central', 0.8},
    {-112.56, 6469.65, 31.63, 374, 5, 'Banco Paleto', 0.8},
    {314.11, -279.08, 54.17, 431, 2, 'Banco', 0.5},
    {149.32, -1040.59, 29.37, 431, 2, 'Banco', 0.5},
    {-2962.6, 482.27, 15.7, 431, 2, 'Banco', 0.5},
    {-351.61, -49.67, 49.03, 431, 2, 'Banco', 0.5},
    {955.27, 33.43, 81.15, 681, 50, 'Vegas', 0.6},
    --{1044.98, 191.48, 80.98, 496, 43, 'Tráfico de Drogas', 0.6},
    {-401.1,1212.49,325.93, 313, 1, 'Arena PvP', 0.8},
    -- {184.19,-961.55,29.96, 161, 1, 'Arena PvP', 0.4},
    {1320.2,-2592.85,47.55, 237, 0, 'Ponte Cayo Perico', 1.2},
   -- {-3022.44, 82.71, 11.61, 614, 48, 'Paradise Club', 0.6},
	{-1771.81,-750.97,9.59, 614, 48, 'Paradise Feste', 0.6},----
    {501.74, 5603.97, 797.91, 792, 0, 'Monte Chiliad', 1.0},
    {-466.4,1001.02,414.89, 409, 0, 'Cristo Redentor', 1.1},
    {-1648.45, 2078.34, 86.12, 685, 0, 'Turistico Cascata da Coruja', 0.6},
    {-536.38, 4421.0, 34.19, 685, 0, 'Turistico Cachoeira', 0.6},
    {-1448.09, 2101.44, 51.54, 685, 0, 'Turistico Cachoeira', 0.6},
    {3079.44, 2082.27, 4.5, 685, 0, 'Turistico Gruta da Pedra', 0.6},
    {766.04, 7395.54, -112.12, 685, 0, 'Turistico Nave Submersa ', 0.6},
    {3835.76, 3670.29, -23.27, 685, 0, 'Passagem Secreta Subaquatica', 0.6},
    {1762.34, 2604.88, 45.54, 189, 0, 'Penitenciária de Bangu', 1.0},
    {-1337.61, -3041.4, 13.93, 307, 0, 'Aeroporto Internacional do Galeão', 1.0},
    {1348.94, 3117.0, 41.42, 307, 0, 'Aeroporto Abandonado', 1.0},
    {3121.26, 5548.86, 189.56, 484, 0, 'Fantasma da meia noite', 0.8},
    {-597.12, 2091.57, 131.41, 685, 0, 'Mina Abandonada', 0.7},
    {4891.85, -4925.34, 3.12, 136, 48, 'Cayo Festival', 1.0},
    {-2043.71, -1031.93, 11.98, 455, 32, 'Iate', 0.8},
    {-1389.28, 6742.24, 11.98, 455, 32, 'Iate', 0.8},
    {3346.38, 5524.44, 19.24, 126, 43, 'Trilha do Mochileiro', 0.6},
    {3054.22, -4692.0, 15.25, 640, 0, 'Navio Porta Aviões', 0.9},
    {-203.55, -861.81, 30.26, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-303.34, -829.83, 32.42, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-254.42, -692.47, 33.6, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {1077.76, -776.13, 58.23, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-2072.38, -317.22, 13.31, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {285.64, 143.5, 104.17, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-660.65, -853.95, 24.48, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {1701.37, 6426.52, 32.76, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-133.06, 6366.53, 31.48, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-386.79, 6046.07, 31.49, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-2956.9, 487.67, 15.47, 486, 40, 'Caixa Eletrônico Roubável', 0.4},
    {-3044.0, 594.56, 7.73, 486, 40, 'Caixa Eletrônico Roubável', 0.4},

    {2351.43, 3133.44, 48.21, 38, 61, 'Corrida Ilegal', 0.8 },

    {1451.78,1084.28,114.61, 310, 0, 'Área de risco', 0.6},--fazendinha--qg
	{2395.63,4964.1,43.73, 310, 0, 'Área de risco', 0.6},---fazenda --qg
	{1287.84,-815.02,81.33, 310, 0, 'Área de risco', 0.6},--helipa 
	{1337.15,-104.12,119.85, 310, 0, 'Área de risco', 0.6},--baragem 
	{2514.26,1975.22,21.37, 310, 0, 'Área de risco', 0.6},--favela cata ventoo
	{811.09,-919.31,26.39, 310, 0, 'Área de risco', 0.6},--babel
	{-236.12,3850.78,44.13, 310, 0, 'Área de risco', 0.6},--favela deserto --norte 
	{957.6,-142.48,74.49, 310, 0, 'Área de risco', 0.6},--motoclube 
	---{884.83,-1564.76,30.7, 310, 0, 'Área de risco', 0.6},
	---{-65.3,-1833.25,26.88, 310, 0, 'Área de risco', 0.6},
	---{-1383.28,-617.56,29.93, 310, 0, 'Área de risco', 0.6},
	---{236.59,1172.33,225.45, 310, 0, 'Área de risco', 0.6},
	---{2373.64,4924.96,42.28, 310, 0, 'Área de risco', 0.6},
	---{-747.0,-2590.68,13.82, 310, 0, 'Área de risco', 0.6},
	----{1024.12,917.69,215.14, 310, 0, 'Área de risco', 0.6},
	----{884.31,1706.41,170.01, 310, 0, 'Área de risco', 0.6},
	-----{-2051.47,-138.89,28.95, 310, 0, 'Área de risco', 0.6},
	----{-2670.27,2345.16,17.29, 310, 0, 'Área de risco', 0.6},
	----{-1506.8,2164.0,55.39, 310, 0, 'Área de risco', 0.6},
	---{-1552.89,4967.45,62.09, 310, 0, 'Área de risco', 0.6},
	------{3254.43,5143.61,19.6, 310, 0, 'Área de risco', 0.6},
	----{2341.02,3906.99,36.9, 310, 0, 'Área de risco', 0.6},
	--{1854.77,3305.48,43.46, 310, 0, 'Área de risco', 0.6},
	---{1300.0,3521.42,35.23, 310, 0, 'Área de risco', 0.6},
	---{-206.91,3793.81,40.12, 310, 0, 'Área de risco', 0.6},
	--{108.62,-1324.99,29.42, 310, 0, 'Área de risco', 0.6},
	---{-3206.53,823.51,8.93, 310, 0, 'Área de risco', 0.6},
	--{362.97,16.21,91.29, 310, 0, 'Área de risco', 0.6},
	--{-1907.44,2041.23,140.73, 310, 0, 'Área de risco', 0.6},

    ---{1214.26, -1037.03, 49.93, 310, 0, 'Área de risco', 0.6},
    ---{-1736.91, -253.27, 84.65, 310, 0, 'Área de risco', 0.6},
   --- {-3125.9, 1388.87, 26.82, 310, 0, 'Área de risco', 0.6},
    ---{779.19, -238.98, 104.23, 310, 0, 'Área de risco', 0.6},
    ----{1348.32, -721.26, 102.67, 310, 0, 'Área de risco', 0.6},
    ---{3059.99, 5091.14, 24.42, 310, 0, 'Área de risco', 0.6},
    ---{1440.37,-2340.11,66.93, 310, 0, 'Área de risco', 0.6},
   ---- {-151.99, -1590.19, 35.03, 310, 0, 'Área de risco', 0.6},
    ---{102.81, -1939.22, 20.79, 310, 0, 'Área de risco', 0.6},
    ---{331.01, -2047.64, 49.64, 310, 0, 'Área de risco', 0.6},
	---{-2661.96,1303.46,147.12, 310, 0, 'Área de risco', 0.6},
	--{-550.58,326.29,83.91, 310, 0, 'Área de risco', 0.6},
	--{921.54,-1786.45,30.78, 310, 0, 'Área de risco', 0.6},
	--{875.93,-893.32,25.98, 310, 0, 'Área de risco', 0.6},
	--{97.52,3615.93,41.59, 310, 0, 'Área de risco', 0.6},
    --{ -1273.99, 315.7, 65.51,475,0,"Hotel Hickmam",0.6 },
    --{ -1661.61, -533.74, 35.99,475,0,"Hotel Banner",0.6 },
    --{ -1237.49, -189.45, 41.62,475,0,"Hotel Von Crastenburg",0.6 },
    --{ -886.06, -1231.39, 5.64,475,0,"Hotel Puerto del Sol",0.6 },
    --{ -773.74, 305.33, 85.7,475,0,"Hotel Eclipse",0.6 },
    --{ -1858.85, -348.51, 49.84,475,0,"Hotel Copacabana",0.6 },
    {-46.94,-1112.29,26.44, 523, 48, 'Concessionaria', 0.8},
	{-1799.78, -1225.14, 1.58, 356, 46, 'Garagem | Iate VIP', 0.6},
    {-359.64, 6657.84, 6.47, 356, 46, 'Garagem | Iate VIP', 0.6},
    {4934.59, -5147.86, 2.46, 356, 46, 'Garagem | Iate VIP', 0.6},
	{-1688.87,47.02,67.3,311,61,'Restaurante', 0.9},
}

CreateThread(function()
	Wait(500)
	for _,v in pairs(blips) do
		Wait(10)
		local blip = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
		-- exports.du_maps:addBlip(blip,v[6])
	end
end) 
-----------------------------------------------------------------------------------------------------------------------------------------
-- TASERTIME
-----------------------------------------------------------------------------------------------------------------------------------------
local tasertime = false
CreateThread(function()
	while true do
		local timeDistance = 1000
		local ped = PlayerPedId()
		if IsPedBeingStunned(ped) then
			timeDistance = 4
			SetPedToRagdoll(ped,10000,10000,0,0,0,0)
		end

		if IsPedBeingStunned(ped) and not tasertime then
			tasertime = true
			TriggerEvent("ragdoll:ChangeStatus", tasertime)
			timeDistance = 4
			TriggerEvent("cancelando",true)
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
		elseif not IsPedBeingStunned(ped) and tasertime then
			tasertime = false
			TriggerEvent("ragdoll:ChangeStatus", tasertime)
			SetTimeout(10000,function()
				StopGameplayCamShaking()
				TriggerEvent("cancelando",false)
			end)
		end

		Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST WEAPONS
-----------------------------------------------------------------------------------------------------------------------------------------
blackWeapons = {
--	"WEAPON_PISTOL50",
--  "WEAPON_SNSPISTOL_MK2",
	"WEAPON_HEAVYPISTOL",
	-- "WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	--"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	--"WEAPON_RAYPISTOL",
	-- "WEAPON_SMG_MK2",
	--"WEAPON_MACHINEPISTOL",
	-- "WEAPON_MINISMG",
	-- "WEAPON_RAYCARBINE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	-- "WEAPON_ASSAULTRIFLE_MK2",
	--"WEAPON_CARBINERIFLE_MK2",
	-- "WEAPON_ADVANCEDRIFLE",
	-- "WEAPON_SPECIALCARBINE",
	-- "WEAPON_SPECIALCARBINE_MK2",
	-- "WEAPON_BULLPUPRIFLE",
	-- "WEAPON_BULLPUPRIFLE_MK2",
	--"WEAPON_COMPACTRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	-- "WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	--"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_MINIGUN",
	-- "WEAPON_FIREWORK",
	"WEAPON_RAILGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	-- "WEAPON_GRENADE",
	--"WEAPON_BZGAS",
	-- "WEAPON_MOLOTOV",
	--"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE",
	"WEAPON_PIPEBOMB",
	--"WEAPON_BALL",
	-- "WEAPON_SNOWBALL",
	"WEAPON_SMOKEGRENADE"
}

CreateThread(function()
	for i = 1 ,#blackWeapons do
		blackWeapons[i] = GetHashKey(blackWeapons[i])
	end
	while true do
		Wait(6000)
		local wpSelected = GetSelectedPedWeapon(PlayerPedId())
		for i = 1 ,#blackWeapons do
			if wpSelected == blackWeapons[i] then
				RemoveWeaponFromPed(PlayerPedId(),blackWeapons[i])
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DAMAGE WALK MODE
-----------------------------------------------------------------------------------------------------------------------------------------
local hurt = false

function setHurt()
    hurt = true
    RequestAnimSet("move_m@injured")
    SetPedMovementClipset(PlayerPedId(),"move_m@injured",true)
    SetPlayerHealthRewMultiplier(PlayerId(),0.0)
    DisableControlAction(0,21) 
    DisableControlAction(0,22)
end

function setNotHurt()
    hurt = false
    SetPlayerHealthRechargeMultiplier(PlayerId(),0.0)
    ResetPedMovementClipset(PlayerPedId(),0.0)
    ResetPedWeaponMovementClipset(PlayerPedId())
    ResetPedStrafeClipset(PlayerPedId())
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISABLE AFK CAM
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetCinematicModeActive(false)
end)
--[[
-----------------------------------------------------------------------------------------------------------------------------------------
-- COOLDOWN MELEE COMBAT
-----------------------------------------------------------------------------------------------------------------------------------------
]]

local FatalConfig = {
	Weapons = {
		[-1075685676] = true,
		[1593441988] = true,
		[-1076751822] = true,
		[3523564046] = true,
		[-619010992] = true,
		[736523883] = true,
		[2024373456] = true,
		[3675956304] = true,
		[171789620] = true,
		[3220176749] = true,
		[961495388] = true,
		[-2084633992] = true,
		[-86904375] = true,
		[-1063057011] = true,
		[-1768145561] = true,
		[487013001] = true,
		[2017895192] = true,
	},
	Bones = {
		[31086] = true
	}
}

AddEventHandler('gameEventTriggered', function(eventName, args)
    if eventName == 'CEventNetworkEntityDamage' then
		if args[1] == PlayerPedId() then 
			local ret, bone = GetPedLastDamageBone(args[1])
			if ret and FatalConfig.Bones[bone] and (args[7] and FatalConfig.Weapons[args[7]]) then 
				SetEntityHealth(PlayerPedId(),1)
			else 
				if not IsEntityInWater(args[1]) then
					if GetEntityHealth(args[1]) <= 129 and not hurt then
						setHurt()
						CreateThread(function() 
							while hurt do
								Wait(1000)
								if GetEntityHealth(PlayerPedId()) >= 130 then 
									setNotHurt()
									break
								end
								setHurt()
							end
						end)
					end
				end 
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATE PED
-----------------------------------------------------------------------------------------------------------------------------------------
local pedlist = {
	{ x = -2267.43, y = 388.11, z = 174.6, h = 206.93, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"},
	{ x = -2268.88, y = 389.52, z = 174.6, h = 303.31, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"},
	{ x = -2262.83, y = 369.39, z = 174.6, h = 294.81, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"},
	{ x = 1556.96, y = 824.19, z = 78.32, h = 62.37, ['hash'] = GetHashKey('rd_bomb'), ['hash2'] = "rd_bomb"},
	{ x = -197.6, y = 6566.68, z = 11.12, h = 141.74, ['hash'] = GetHashKey('s_m_m_security_01'), ['hash2'] = "s_m_m_security_01"},
	{ x = -215.34, y = 6548.88, z = 11.09, h = 317.49, ['hash'] = GetHashKey('s_m_m_security_01'), ['hash2'] = "s_m_m_security_01"},
	{ x = -140.47, y = 6270.59, z = 31.34, h = 314.65, ['hash'] = GetHashKey('u_m_m_jewelsec_01'), ['hash2'] = "u_m_m_jewelsec_01"},
	{ x = -58.27, y = 6522.55, z = 31.49, h = 308.98, ['hash'] = GetHashKey('u_m_m_jewelsec_01'), ['hash2'] = "u_m_m_jewelsec_01"},
	{ x = 71.95, y = 6410.17, z = 31.22, h = 138.9, ['hash'] = GetHashKey('u_m_m_jewelsec_01'), ['hash2'] = "u_m_m_jewelsec_01"},
	{ x = -38.2, y = 6421.1, z = 31.49, h = 235.28, ['hash'] = GetHashKey('u_m_m_jewelsec_01'), ['hash2'] = "u_m_m_jewelsec_01"},
	{ x = -2260.68, y = 389.61, z = 174.6, h = 116.23, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"},
	{ x = -2258.88, y = 383.57, z = 174.6, h = 59.53, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"},
	{ x = 889.36, y = -2104.14, z = 34.88, h = 172.92, ['hash'] = GetHashKey('rd_mec'), ['hash2'] = "rd_mec"},
	{ x = -1687.66, y = -775.78, z = 10.88, h = 226.78, ['hash'] = GetHashKey('s_m_y_clubbar_01'), ['hash2'] = "s_m_y_clubbar_01"},
	{ x = -1675.66, y = -792.18, z = 10.88, h = 320.32, ['hash'] = GetHashKey('s_m_m_movprem_01'), ['hash2'] = "s_m_m_movprem_01"},
	{ x = -699.94, y = -1392.35, z = 5.49, h = 232.45, ['hash'] = GetHashKey('rd_mec'), ['hash2'] = "rd_mec"},
	{ x = -194.75, y = 6265.3, z = 31.49, h = 42.52, ['hash'] = GetHashKey('ig_casey'), ['hash2'] = "ig_casey"},
	{ x = 1547.94, y = 799.14, z = 78.32, h = 53.86, ['hash'] = GetHashKey('ig_casey'), ['hash2'] = "ig_casey"},
	{ x = 1549.46, y = 828.28, z = 78.32, h = 147.41, ['hash'] = GetHashKey('rd_bomb'), ['hash2'] = "rd_bomb"},
	{ x = 874.99, y = -2100.34, z = 30.48, h = 172.92, ['hash'] = GetHashKey('s_m_m_gaffer_01'), ['hash2'] = "s_m_m_gaffer_01"},
	{ x = -701.27, y = -1481.56, z = 5.14, h = 53.86, ['hash'] = GetHashKey('ig_casey'), ['hash2'] = "ig_casey"}, 
	{ x = -728.58, y = -1501.43, z = 5.0, h = 17.01, ['hash'] = GetHashKey('rd_mec'), ['hash2'] = "rd_mec"}, 
	{ x = -2278.43, y = 402.95, z = 174.6, h = 116.23, ['hash'] = GetHashKey('ig_casey'), ['hash2'] = "ig_casey"}, 
	{ x = -2317.95, y = 310.09, z = 169.59, h = 22.68, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"}, 
	{ x = -2283.54, y = 347.73, z = 174.6, h = 8.51, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"}, 
	{ x = 853.8, y = -2095.48, z = 30.53, h = 170.08, ['hash'] = GetHashKey('ig_casey'), ['hash2'] = "ig_casey"}, 
	{ x = 854.43, y = -2114.55, z = 30.53, h = 175.75, ['hash'] = GetHashKey('rd_mec'), ['hash2'] = "rd_mec"},
	{ x = 689.48, y = 599.6, z = 129.04, h = 348.67, ['hash'] = GetHashKey('rd_malokam'), ['hash2'] = "rd_malokam"},
	{ x = -1649.32, y = 180.51, z = 61.75, h = 291.97, ['hash'] = GetHashKey('rd_policiaf'), ['hash2'] = "rd_policiaf"},
	{ x = -1635.57, y = 183.21, z = 61.75, h = 300.48, ['hash'] = GetHashKey('rd_policiam'), ['hash2'] = "rd_policiam"}, 
	{ x = 183.88, y = -962.66, z = 29.94, h = 345.06, ['hash'] = GetHashKey('rd_policiam'), ['hash2'] = "rd_policiam"}, ---183.88,-962.66,29.94
	{ x = 1540.92, y = 816.4, z = 78.32, h = 334.49, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = "rd_hp"},
	{ x = -2312.38, y = 312.49, z = 169.59, h = 25.52, ['hash'] = GetHashKey('rd_bomb'), ['hash2'] = "rd_bomb"},
	{ x = -381.37, y = 2811.57, z = 45.46, h = 62.37, ['hash'] = GetHashKey('rd_malokaf'), ['hash2'] = "rd_malokaf"},
	{ x = 1508.77, y = 766.09, z = 77.42, h = 25.52, ['hash'] = GetHashKey('ig_casey'), ['hash2'] = "ig_casey"},
	{ x = -2313.62, y = 355.6,  z = 174.6, h = 116.23, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = 'rd_hp'},
	{ x = -2306.75, y = 342.82, z = 174.6, h = 116.23, ['hash'] = GetHashKey('rd_hp'), ['hash2'] = 'rd_hp'},
	{ x = -2298.0,  y = 343.44, z = 174.6, h = 34.02,  ['hash'] = GetHashKey('rd_hp'), ['hash2'] = 'rd_hp'},
}

CreateThread(function()
	for k,v in pairs(pedlist) do
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do Wait(1000) end
		ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		peds = ped
		FreezeEntityPosition(ped,true)
		SetEntityInvincible(ped,true)
		SetBlockingOfNonTemporaryEvents(ped,true)
		SetModelAsNoLongerNeeded(v.hash2)

		if v.holdingGun then 
			GiveWeaponToPed(ped, v.holdingGun, 1, true, true)
		end
	end
end)

local fixedVehiclesList = {
    { ['x'] = -1253.15, ['y'] = -1460.43, ['z'] = 4.14, ['h'] =  34.02, ['vehicle'] = "WRhb20uber", ['plate'] = "Uber"}, 
    { ['x'] = -776.2, ['y'] = -1472.82, ['z'] = 4.84, ['h'] =  291.97, ['vehicle'] = "WRhb20uber", ['plate'] = "Uber"}, 
    { ['x'] = 1211.95, ['y'] = -1525.21, ['z'] = 34.54, ['h'] = 0.0, ['vehicle'] = "WRhb20uber", ['plate'] = "Uber"}, 
    { ['x'] = 24.4, ['y'] = -1770.07, ['z'] = 29.32, ['h'] = 51.03, ['vehicle'] = "WRhb20uber", ['plate'] = "Uber"}, 
}

CreateThread(function()
	for k,v in pairs(fixedVehiclesList) do
		local mhash = GetHashKey(v.vehicle)
		while not HasModelLoaded(mhash) do
			RequestModel(mhash)
			Citizen.Wait(10)
		end
		if HasModelLoaded(mhash) then
			local nveh = CreateVehicle(mhash,v.x,v.y,v.z-1,v.h,false,false)      
			SetVehicleNumberPlateText(nveh, v.plate)
			SetEntityAsMissionEntity(nveh,true,true)		
			SetModelAsNoLongerNeeded(mhash)
			SetVehicleFuelLevel(nveh, 0)
			SetVehicleDoorsLocked(nveh, 2)
			SetVehicleOnGroundProperly(nveh)
			Wait(1500)
			FreezeEntityPosition(nveh, true)
		end
	
	end
end)

-- CreateThread(function() 
--     while true do
--         local sound_id = GetSoundId()
--         Wait(100)
--     end
-- end)

--[[ ]]

local redAreas = {
	-- {65.65, 3700.5, 39.75}
}
CreateThread(function()
	Wait(1000)
	for _,v in pairs(redAreas) do
		local blip = AddBlipForRadius(v[1],v[2],v[3], 200.0)
		SetBlipColour(blip, 1)
		SetBlipAlpha(blip,80)
		Wait(10)
	end
end)  


--------------------- bloquear as radio dos players--------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        
        -- Verifica se o jogador está em um veículo
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if DoesEntityExist(vehicle) then
                SetVehicleRadioEnabled(vehicle, false) -- Desliga o rádio do veículo
            end
        end
    end
end)
