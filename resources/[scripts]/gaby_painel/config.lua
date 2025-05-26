cfg = {}

cfg.tecla = "F7"  --- tecla que irá abrir o painel ( https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/ )

cfg.permissao = 'developer.permissao' --- Permissão para abrir o painel

cfg.item_dinheiro = 'money' ---- Spawn do seu item dinheiro

cfg.tpto_em_nc = true ---- Coloque true caso queira que ao usar o "IR ATE ou TPTO" vá em NC, false pra ir sem NC

cfg.som_ao_clicar = false --- Coloque false para tirar o som ao clicar nos botões.
cfg.som = { arg = "CONFIRM_BEEP", arg2 = "HUD_MINI_GAME_SOUNDSET" } --- som que irá reproduzir ( so altere caso saiba! caso contrario ira dar erro )

local link_aqui = 'https://discord.com/api/webhooks/1280672858720436316/ZuWpKGHKjmcPiW8qfABv-t4vYzwSViLx1W5YX7_ef45VUAF2m08QMfyYNrFUyjkgYNAD'

cfg.permissao_opcoes = {

----- Permissões da aba geral:

    ['liberar_wl'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui }, --- webhook é para gerar a log!
    ['remover_wl'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['reviver'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['reviver_todos'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['matar'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao' }, webhook = link_aqui },
    ['banir'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['desbanir'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['kickar_expulsar'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['dar_veiculo'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['remover_veiculo'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['setar_skin'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['congelar_player'] = { perm = { 'developer.permissao','administrador.permissao' }, webhook = link_aqui },
    ['descongelar_player'] = { perm = { 'developer.permissao','administrador.permissao' }, webhook = link_aqui },
    ['mensagem_privada'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['aviso_adm'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao' }, webhook = link_aqui },
    ['puxar_rg'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['dar_dinheiro'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['retirar_dinheiro'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['dar_item'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['retirar_item'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['limpar_inventario'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['limpar_armas'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['spawnar_veiculo'] = { perm = { 'developer.permissao','admin.permissao', 'klebin.permissao' }, webhook = link_aqui},
    ['concertar_veiculo'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['tunar_veiculo'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['tptome'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['tpto'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['tpway'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['tpcds'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['hash_veiculo'] = { perm = { 'developer.permissao' }, webhook = link_aqui },
    ['dv'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao', 'suporte.permissao' }, webhook = link_aqui },
    ['dvall'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['limpar_veiculos'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao' }, webhook = link_aqui },
    ['limpar_props'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['preset_roupas'] = { perm = { 'developer.permissao','admin.permissao', 'moderador.permissao' }, webhook = link_aqui },

    ----- Permissões da aba setagem:

    ['setar_cargo'] = { perm = { 'developer.permissao','administrador.permissao' }, webhook = link_aqui },
    ['remover_cargo'] = { perm = { 'developer.permissao','administrador.permissao' }, webhook = link_aqui },

    ----- Permissões da aba locais:

    ['normal'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },  --- voce pode criar tipos diferentes pra permissoes diferentes
    ['ilegal'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['secret'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },

    ----- Permissão da aba itens:

    ['aba_itens'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },

    ----- Permissões da aba players on:

    ['botao_reviver'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['botao_puxar'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },
    ['botao_irate'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },


    ['aba_carros'] = { perm = { 'developer.permissao','admin.permissao' }, webhook = link_aqui },


}

cfg.hierarquiastaff = {

    { ['permissao'] = 'admin.permissao', ['nao_pode_setar'] = { 'developer','chefeadmin' } },
    { ['permissao'] = 'admin.permissao', ['nao_pode_setar'] = { 'developer','chefeadmin','admin' } },
    { ['permissao'] = 'moderador.permissao', ['nao_pode_setar'] = { 'developer','chefeadmin','admin','moderador' } },
    { ['permissao'] = 'suporte.permissao', ['nao_pode_setar'] = { 'developer','chefeadmin','admin','moderador' } },

}


cfg.locais = {

    { cds = vec3(-1604.74,166.74,59.48), nome = "POLICIA-PMERJ", tipo = "normal" },  ---- Se o tipo for nil, qualquer um pode dar tp nele
    { cds = vec3(-1298.29,270.62,64.01), nome = "POLICIA-FEDERAL", tipo ="normal" }, 
    { cds = vec3(-1063.8,-870.3,5.0), nome = "POLICIA-CIVIL", tipo = "normal" }, --- voce pode criar tipos diferentes pra permissoes diferentes
    { cds = vec3(-2374.37,3309.49,32.82), nome = "POLICIA EXÉRCITO", tipo = "normal" },-------------------------------------------------------
    { cds = vec3(-255.38,1523.82,338.61), nome = "PLICIA-BOPE", tipo = "normal" },-------------------------------------------------------------
    { cds = vec3(-1125.82,-1725.69,4.47), nome = "BOMBEIROS", tipo = "normal" },------------------------------------------------------------------
    { cds = vec3(911.81,43.35,80.9), nome = "CASSINO", tipo = "normal" },----------------------------------------------------------------------------
    { cds = vec3(459.25, -981.14, 30.69), nome = "Arsenal DP", tipo = "normal" },
    { cds = vec3(452.04, -991.51, 30.69), nome = "Blip de Fardas DP", tipo = "normal" },

    { cds = vec3(-826.29, -1220.31, 6.94), nome = "Hospital", tipo = "normal" },
    { cds = vec3(-831.2, -1193.26, 6.49), nome = "Garagem Pública HP", tipo = "normal" },
    { cds = vec3(-813.79, -1205.94, 6.94), nome = "Garagem Ambulância HP", tipo = "normal" },
    { cds = vec3(-805.61, -1212.9, 7.34), nome = "Blip remédios HP", tipo = "normal" },
    { cds = vec3(-823.57, -1236.29, 7.34), nome = "Blip de Fardas HP", tipo = "normal" },
    { cds = vec3(-795.57, -1220.47, 7.34), nome = "Baú HP", tipo = "normal" },

    { cds = vec3(2702.52,3492.52,55.72), nome = "STPOCAR", tipo = "normal" },
    { cds = vec3(-350.43, -123.53, 39.02), nome = "Baú Mecânica", tipo = "normal" },
    { cds = vec3(-376.54, -150.77, 38.53), nome = "Garagem Pública MEC", tipo = "normal" },
    { cds = vec3(-355.3, -153.37, 39.02), nome = "Garagem do guincho MEC", tipo = "normal" },
    { cds = vec3(-322.53, -145.38, 39.02), nome = "Blip fazer Kit e Pneu MEC", tipo = "normal" },

    { cds = vec3(4508.92, -4512.93, 4.06), nome = "Ilha de cayo perico", tipo = "secret" }, --- voce pode criar tipos diferentes pra permissoes diferentes

    { cds = vec3(-1893.27, 2035.46, 140.75), nome = "QG MAFIA", tipo = "ilegal" },
    { cds = vec3(-1870.48, 2061.44, 135.44), nome = "PRODUÇÃO MAFIA", tipo = "ilegal" },
    { cds = vec3(-1890.3, 2064.43, 145.58), nome = "ROTA DE FARM MAFIA", tipo = "ilegal" },
    { cds = vec3(-1881.9, 2063.94, 135.92), nome = "BAU MAFIA", tipo = "ilegal" },
    { cds = vec3(-1870.29, 2059.13, 135.44), nome = "BAU LIDER MAFIA", tipo = "ilegal" },
    { cds = vec3(-1866.66, 2056.97, 135.45), nome = "ARMAZEN MAFIA", tipo = "ilegal" },

    { cds = vec3(1363.15, -735.63, 67.24), nome = "QG VERDES", tipo = "ilegal" },
    { cds = vec3(1443.98, -765.2, 87.69), nome = "PRODUÇÃO VERDES", tipo = "ilegal" },
    { cds = vec3(1439.39, -761.22, 87.74), nome = "ROTA DE FARM VERDES", tipo = "ilegal" },
    { cds = vec3(1459.49, -759.47, 90.62), nome = "BAU VERDES", tipo = "ilegal" },
    { cds = vec3(1459.02, -757.33, 90.62), nome = "BAU LIDER VERDES", tipo = "ilegal" },
    { cds = vec3(1442.24, -763.1, 87.74), nome = "ARMAZEN VERDES", tipo = "ilegal" },

    { cds = vec3(1385.92, 1140.86, 114.34), nome = "QG CARTEL", tipo = "ilegal" },
    { cds = vec3(1401.62, 1139.15, 109.75), nome = "PRODUÇÃO CARTEL", tipo = "ilegal" },
    { cds = vec3(1393.38, 1159.9, 114.34), nome = "ROTA DE FARM CARTEL", tipo = "ilegal" },
    { cds = vec3(1402.95, 1153.42, 114.34), nome = "BAU CARTEL", tipo = "ilegal" },
    { cds = vec3(1404.76, 1139.7, 109.75), nome = "BAU LIDER CARTEL", tipo = "ilegal" },
    { cds = vec3(1401.37, 1139.04, 109.75), nome = "ARMAZEN CARTEL", tipo = "ilegal" },

    { cds = vec3(2452.96, 4950.72, 45.15), nome = "QG MEDELIN", tipo = "ilegal" },
    { cds = vec3(2431.63, 4967.82, 42.35), nome = "PRODUÇÃO MEDELIN", tipo = "ilegal" },
    { cds = vec3(2454.92, 4972.3, 46.82), nome = "ROTA DE FARM MEDELIN", tipo = "ilegal" },
    { cds = vec3(2446.41, 4968.99, 46.82), nome = "BAU MEDELIN", tipo = "ilegal" },
    { cds = vec3(2442.78, 4971.69, 46.82), nome = "BAU LIDER MEDELIN", tipo = "ilegal" },
    { cds = vec3(2433.23, 4971.63, 42.35), nome = "ARMAZEN MEDELIN", tipo = "ilegal" },

    { cds = vec3(-205.55, -1308.01, 31.3), nome = "QG BENNYS", tipo = "ilegal" },
    { cds = vec3(-197.31, -1320.45, 31.09), nome = "PRODUÇÃO BENNYS", tipo = "ilegal" },
    { cds = vec3(-227.82, -1327.38, 30.9), nome = "ROTA DE FARM BENNYS", tipo = "ilegal" },
    { cds = vec3(-216.22, -1319.03, 30.9), nome = "BAU BENNYS", tipo = "ilegal" },
    { cds = vec3(-196.45, -1314.67, 31.27), nome = "BAU LIDER BENNYS", tipo = "ilegal" },
    { cds = vec3(-224.25, -1319.93, 30.9), nome = "ARMAZEN BENNYS", tipo = "ilegal" },
    { cds = vec3(489.47, -1312.81, 29.26), nome = "LOCAL DESMANCHE BENNYS", tipo = "ilegal" },
    { cds = vec3(480.29, -1317.06, 29.21), nome = "ONDE COLOCAR O CARRO BENNYS", tipo = "ilegal" },

    { cds = vec3(-2422.0, 1773.32, 187.43), nome = "QG FRANCA", tipo = "ilegal" },
    { cds = vec3(-2361.26, 1751.14, 212.14), nome = "PRODUÇÃO FRANCA", tipo = "ilegal" },
    { cds = vec3(-2425.87, 1796.3, 185.49), nome = "ROTA DE FARM FRANCA", tipo = "ilegal" },
    { cds = vec3(-2363.71, 1744.09, 215.48), nome = "BAU FRANCA", tipo = "ilegal" },
    { cds = vec3(-2364.38, 1747.68, 215.48), nome = "BAU LIDER FRANCA", tipo = "ilegal" },
    { cds = vec3(-2364.6, 1749.45, 212.14), nome = "ARMAZEN FRANCA", tipo = "ilegal" },
    { cds = vec3(-2422.18, 1758.4, 187.97), nome = "LOCAL DESMANCHE FRANCA", tipo = "ilegal" },
    { cds = vec3(-2417.86, 1754.24, 188.04), nome = "ONDE COLOCAR O CARRO FRANCA", tipo = "ilegal" },

    { cds = vec3(133.97, -1307.74, 29.02), nome = "QG VANILLA", tipo = "ilegal" },
    { cds = vec3(25.89, -1400.85, 29.49), nome = "LOCAL LAVAGEM VANILLA", tipo = "ilegal" },
    { cds = vec3(94.87, -1292.63, 29.276), nome = "PRODUÇÃO VANILLA", tipo = "ilegal" },
    { cds = vec3(96.63, -1292.08, 29.27), nome = "ROTA DE FARM VANILLA", tipo = "ilegal" },
    { cds = vec3(108.74, -1304.32, 28.77), nome = "BAU VANILLA", tipo = "ilegal" },
    { cds = vec3(106.6, -1299.54, 28.77), nome = "BAU LIDER VANILLA", tipo = "ilegal" },
    { cds = vec3(110.86, -1296.88, 29.27), nome = "ARMAZEN VANILLA", tipo = "ilegal" },

    { cds = vec3(-1388.71, -585.54, 30.22), nome = "QG BAHAMAS", tipo = "ilegal" },
    { cds = vec3(-1366.75, -621.34, 30.33), nome = "LOCAL LAVAGEM BAHAMAS", tipo = "ilegal" },
    { cds = vec3(-1385.29, -593.22, 30.32), nome = "PRODUÇÃO BAHAMAS", tipo = "ilegal" },
    { cds = vec3(-1362.73, -621.34, 30.32), nome = "ROTA DE FARM BAHAMAS", tipo = "ilegal" },
    { cds = vec3(-1367.47, -612.81, 30.32), nome = "BAU BAHAMAS", tipo = "ilegal" },
    { cds = vec3(-1367.12, -612.68, 30.32), nome = "BAU LIDER BAHAMAS", tipo = "ilegal" },
    { cds = vec3(-1365.56, -616.79, 30.32), nome = "ARMAZEN BAHAMAS", tipo = "ilegal" },

    { cds = vec3(827.78, -324.82, 56.64), nome = "QG ROXOS", tipo = "ilegal" },
    { cds = vec3(-1095.87, 4949.1, 218.36), nome = "PRODUÇÃO ROXOS", tipo = "ilegal" },
    { cds = vec3(864.79, -256.38, 68.19), nome = "ROTA DE FARM ROXOS", tipo = "ilegal" },
    { cds = vec3(862.84, -251.38, 68.34), nome = "BAU ROXOS", tipo = "ilegal" },
    { cds = vec3(861.32, -246.84, 69.78), nome = "BAU LIDER ROXOS", tipo = "ilegal" },

    { cds = vec3(2031.49, 3304.64, 45.86), nome = "QG LARANJAS", tipo = "ilegal" },
    { cds = vec3(1482.49, 6392.19, 22.98), nome = "PRODUÇÃO LARANJAS", tipo = "ilegal" },
    { cds = vec3(2047.04, 3375.46, 47.77), nome = "ROTA DE FARM LARANJAS", tipo = "ilegal" },
    { cds = vec3(2039.66, 3389.06, 45.68), nome = "BAU LARANJAS", tipo = "ilegal" },
    { cds = vec3(2045.5, 3377.27, 47.77), nome = "BAU LIDER LARANJAS", tipo = "ilegal" },

    { cds = vec3(1297.74, -252.53, 95.97), nome = "QG VERMELHOS", tipo = "ilegal" },
    { cds = vec3(97.23, 6327.58, 31.38), nome = "PRODUÇÃO VERMELHOS", tipo = "ilegal" },
    { cds = vec3(92.45,6351.23,31.38), nome = "INICIO PRODUÇÃO VERMELHOS", tipo = "ilegal" },
    { cds = vec3(103.0,6351.44,31.38), nome = "ETAPA 2,3,4 PRODUÇÃO VERMELHOS", tipo = "ilegal" },
    { cds = vec3(1313.61, -257.36, 105.96), nome = "ROTA DE FARM VERMELHOS", tipo = "ilegal" },
    { cds = vec3(1315.69, -256.99, 105.96), nome = "BAU VERMELHOS", tipo = "ilegal" },
    { cds = vec3(1273.75, -187.4, 106.61), nome = "BAU LIDER VERMELHOS", tipo = "ilegal" },



}

-------aba de carros
cfg.carlist = {
    { car = 'volatus', name = 'heli VOLATUS' },
    { car = 'r34bluedragon', name = 'r34bluedragon' },
    { car = 's15nihilred', name = 's15nihilred' },
    { car = 'WRduster22', name = 'vtrpolicia1' },
    { car = 'ksd', name = 'ksd' },
    { car = 'r1200gs', name = 'r1200gs' },
    { car = 'l200', name = 'l200' },
    { car = 'kadett', name = 'kadett' },
    { car = 'lp700r', name = 'lp700r' },
    { car = 'urus', name = 'urus' },
    { car = 'DodgeRAM2500', name = 'DodgeRAM2500' },
    { car = 'hornet2010', name = 'hornet2010' },
    { car = 'golf7gti', name = 'golf' },
    { car = '18velar', name = 'landrover velar' },
    { car = '21avant', name = 'audi rs6' },
    { car = 'pop110', name = 'pop110' },
    { car = 'saveiro', name = 'saveiro' },
    { car = 'survolt', name = 'survolt' },
    { car = 'velarag', name = 'VELARAG' },
    { car = 'p1', name = 'P1' },
    { car = 'rmodjeep', name = 'rmodjeep' },--------------------------------
    { car = '22jeeplar', name = '22jeeplar' },-----------------------
    { car = 'l200', name = 'l200' },

    { car = 'rmodjeep', name = 'rmodjeep' },
    { car = 'rmodjeep', name = 'rmodjeep' },
    { car = 'rmodjeep', name = 'rmodjeep' },
    { car = 'rmodjeep', name = 'rmodjeep' },








}
---aba skin 
cfg.skinlist = {
    { skin = "mp_m_freemode_01", name = 'Personagem Masculino' },
    { skin = "mp_f_freemode_01", name = 'Personagem Feminino' },
   

}