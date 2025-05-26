garagesConfig = {}

garagesConfig.main = {
	dir = "http://189.127.165.210/carros/",
	spawnClientVehicle = true, -- Spawnar veiculo via client-side

	clearVehicle = { -- LIMPAR VEICULOS QUE NÃO ESTEJAM USADOS
		enable = true,  -- CASO QUEIRA ATIVAR / DESATIVAR
		time = 5, -- TEMPO EM MINUTOS
	},

	ipvaVencimento = 15, -- DIAS PARA O VENCIMENTO DO IPVA
	ipvaValue = 0.03, -- 5% VALOR  DO VEICULO IPVA

	detidoValue = 0.5, -- 5% VALOR DO VEICULO DETIDO
	retidoValue = 0.10, -- 10% VALOR DO VEICULO RETIDO 

	defaultCarPrice = 100000, -- Valor padrão caso o carro não seja encontrado na lista abaixo.
	defaultCarChest = 50, -- Valor padrão caso o carro não seja encontrado na lista abaixo.

	commands = {
		prefix = "veh", -- PREFIX
		sellVeh = "vender", -- comando para vender carro /veh vender
		keyAdd = "add", -- comando para add chave carro /veh add
		keyRem = "rem", -- comando para rem chave carro /veh rem
	}
}

garagesConfig.listCars = {
	--[[TYPE = OUTROS]]-- 
	[GetHashKey('veto2')] = { model = 'veto2', price = 900000, banned = false, name = 'Veto 2', trunk = 60, type = 'outros'},
	[GetHashKey('caddy')] = { model = 'caddy', price = 900000, banned = false, name = 'Caddy', trunk = 60, type = 'outros'},
	[GetHashKey('dominator6')] = { model = 'dominator6', price = 900000, banned = false, name = 'Dominator 6', trunk = 60, type = 'outros'},
	[GetHashKey('openwheel2')] = { model = 'openwheel2', price = 900000, banned = false, name = 'Open Wheel', trunk = 60, type = 'outros'},
	[GetHashKey('tractor')] = { model = 'tractor', price = 50000, banned = false, name = 'Tractor', trunk = 60, type = 'outros'},
	[GetHashKey('imorgon')] = { model = 'imorgon', price = 900000, banned = false, name = 'Imorgon', trunk = 60, type = 'outros' },
	[GetHashKey('issi7')] = { model = 'issi7', price = 400000, banned = false, name = 'Issi 7', trunk = 60, type = 'outros'},
	[GetHashKey('locust')] = { model = 'locust', price = 2000000, banned = false, name = 'Ocelot', trunk = 60, type = 'outros' },
	[GetHashKey('neo')] = { model = 'neo', price = 2000000, banned = false, name = 'Neo', trunk = 60, type = 'outros' },
	[GetHashKey('penumbra2')] = { model = 'penumbra2', price = 600000, banned = false, name = 'Penumbra 2', trunk = 60, type = 'outros' },
	[GetHashKey('revolter')] = { model = 'revolter', price = 200000, banned = false, name = 'Revolter', trunk = 60, type = 'outros' },
	[GetHashKey('schafter2')] = { model = 'schafter2', price = 100000, banned = false, name = 'Schafter 2', trunk = 60, type = 'outros' },
	[GetHashKey('blista')] = { model = 'blista', price = 90000, banned = false, name = 'Blista', trunk = 60, type = 'outros'},
	[GetHashKey('paragon')] = { model = 'paragon', price = 800000, banned = false, name = 'Paragon', trunk = 60, type = 'outros' },
	[GetHashKey('jugular')] = { model = 'jugular', price = 700000, banned = false, name = 'Jugular', trunk = 60, type = 'outros' },
	[GetHashKey('komoda')] = { model = 'komoda', price = 850000, banned = false, name = 'Komoda', trunk = 60, type = 'outros' },
	[GetHashKey('drafter')] = { model = 'drafter', price = 800000, banned = false, name = 'Drafter', trunk = 60, type = 'outros' },
	[GetHashKey('club')] = { model = 'club', price = 800000, banned = false, name = 'Club', trunk = 60, type = 'outros' },
	[GetHashKey('kanjo')] = { model = 'kanjo', price = 90000, banned = false, name = 'Kanjo', trunk = 60, type = 'outros'},
	[GetHashKey('issi5')] = { model = 'issi5', price = 200000, banned = false, name = 'Issi 5', trunk = 60, type = 'outros' },
	[GetHashKey('issi4')] = { model = 'issi4', price = 200000, banned = false,  name = 'Issi 4', trunk = 60, type = 'outros' },
	[GetHashKey('panto')] = { model = 'panto', price = 5000, banned = false, name = 'Panto', trunk = 60, type = 'outros' },
	[GetHashKey('italirsx')] = { model = 'italirsx', price = 200000, banned = false, name = 'ItaliRSX', trunk = 60, type = 'outros' },
	[GetHashKey('vstr')] = { model = 'vstr', price = 200000, banned = false, name = 'Vstr', trunk = 60, type = 'outros' },
	[GetHashKey('sultan2')] = { model = 'sultan2', price = 500000, banned = false, name = 'Sultan 2', trunk = 60, type = 'outros' },
	[GetHashKey('dynasty')] = { model = 'dynasty', price = 200000, banned = false, name = 'Dynasty', trunk = 60, type = 'outros' },
	[GetHashKey('manana2')] = { model = 'manana2', price = 300000, banned = false, name = 'Manana 2', trunk = 60, type = 'outros' },
	[GetHashKey('peyote3')] = { model = 'peyote3', price = 300000, banned = false, name = 'Peyote 3', trunk = 60, type = 'outros' },
	[GetHashKey('retinue2')] = { model = 'retinue2', price = 300000, banned = false, name = 'Retinue 2', trunk = 60, type = 'outros' },
	[GetHashKey('savestra')] = { model = 'savestra', price = 400000, banned = false, name = 'Savestra', trunk = 60, type = 'outros' },
	[GetHashKey('brioso')] = { model = 'brioso', price = 45000, banned = false, name = 'Brioso', trunk = 60, type = 'outros' },
	[GetHashKey('brioso2')] = { model = "brioso2", price = 70000, banned = false, name = "Brioso 2", trunk = 60, type = 'outros' },
	[GetHashKey('dilettante')] = { model = 'dilettante', price = 100000, banned = false, name = 'Dilettante', trunk = 60, type = 'outros' },
	[GetHashKey('primo2')] = { model = 'primo2', price = 150000, banned = false, name = 'Primo2', trunk = 60, type = 'sedans' },
	[GetHashKey('chino')] = { model = 'chino', price = 150000, banned = false, name = 'Chino', trunk = 60, type = 'outros' },
	[GetHashKey('chino2')] = { model = 'chino2', price = 600000, banned = false, name = 'Chino2', trunk = 60, type = 'outros' },
	[GetHashKey('coquette3')] = { model = 'coquette3', price = 200000, banned = false, name = 'Coquette3', trunk = 60, type = 'outros' },
	[GetHashKey('dominator')] = { model = 'dominator', price = 200000, banned = false, name = 'Dominator', trunk = 60, type = 'outros' },
	[GetHashKey('dominator2')] = { model = 'dominator2', price = 300000, banned = false, name = 'Dominator2', trunk = 60, type = 'outros' },
	[GetHashKey('dukes')] = { model = 'dukes', price = 200000, banned = false, name = 'Dukes', trunk = 60, type = 'outros' },
	[GetHashKey('faction')] = { model = 'faction', price = 140000, banned = false, name = 'Faction', trunk = 60, type = 'outros' },
	[GetHashKey('faction2')] = { model = 'faction2', price = 500000, banned = false, name = 'Faction2', trunk = 60, type = 'outros' },
	[GetHashKey('faction3')] = { model = 'faction3', price = 500000, banned = false, name = 'Faction3', trunk = 60, type = 'outros' },
	[GetHashKey('gauntlet4')] = { model = 'gauntlet4', price = 200000, banned = false, name = 'Gauntlet 4', trunk = 60, type = 'outros' },
	[GetHashKey('gauntlet3')] = { model = 'gauntlet3', price = 150000, banned = false, name = 'Gauntlet 3', trunk = 60, type = 'outros' },
	[GetHashKey('gauntlet2')] = { model = 'gauntlet2', price = 400000, banned = false, name = 'Gauntlet2', trunk = 60, type = 'outros' },
	[GetHashKey('hermes')] = { model = 'hermes', price = 200000, banned = false, name = 'Hermes', trunk = 60, type = 'outros' },
	[GetHashKey('hotknife')] = { model = 'hotknife', price = 500000, banned = false, name = 'Hotknife', trunk = 60, type = 'outros' },
	[GetHashKey('moonbeam')] = { model = 'moonbeam', price = 200000, banned = false, name = 'Moonbeam', trunk = 60, type = 'outros' },
	[GetHashKey('moonbeam2')] = { model = 'moonbeam2', price = 5000000, banned = false, name = 'Moonbeam2', trunk = 60, type = 'outros' },
	[GetHashKey('nightshade')] = { model = 'nightshade', price = 450000, banned = false, name = 'Nightshade', trunk = 60, type = 'outros' },
	[GetHashKey('picador')] = { model = 'picador', price = 200000, banned = false, name = 'Picador', trunk = 60, type = 'outros' },
	[GetHashKey('ruiner')] = { model = 'ruiner', price = 100000, banned = false, name = 'Ruiner', trunk = 60, type = 'outros' },
	[GetHashKey('sabregt')] = { model = 'sabregt', price = 120000, banned = false, name = 'Sabregt', trunk = 60, type = 'outros' },
	[GetHashKey('sabregt2')] = { model = 'sabregt2', price = 150000, banned = false, name = 'Sabregt2', trunk = 60, type = 'outros' },
	[GetHashKey('stalion')] = { model = 'stalion', price = 400000, banned = false, name = 'Stalion', trunk = 60, type = 'outros' },
	[GetHashKey('stalion2')] = { model = 'stalion2', price = 260000, banned = false, name = 'Stalion2', trunk = 60, type = 'outros' },
	[GetHashKey('tampa')] = { model = 'tampa', price = 200000, banned = false, name = 'Tampa', trunk = 60, type = 'outros' },
	[GetHashKey('vigero')] = { model = 'vigero', price = 170000, banned = false, name = 'Vigero', trunk = 60, type = 'outros' },
	[GetHashKey('virgo')] = { model = 'virgo', price = 150000, banned = false, name = 'Virgo', trunk = 60, type = 'outros' },
	[GetHashKey('virgo2')] = { model = 'virgo2', price = 150000, banned = false, name = 'Virgo2', trunk = 60, type = 'outros' },
	[GetHashKey('virgo3')] = { model = 'virgo3', price = 150000, banned = false, name = 'Virgo3', trunk = 60, type = 'outros' },
	[GetHashKey('voodoo')] = { model = 'voodoo', price = 300000, banned = false, name = 'Voodoo', trunk = 60, type = 'outros' },
	[GetHashKey('voodoo2')] = { model = 'voodoo2', price = 100000, banned = false, name = 'Voodoo2', trunk = 60, type = 'outros' },
	[GetHashKey('yosemite')] = { model = 'yosemite', price = 800000, banned = false, name = 'Yosemite', trunk = 60, type = 'outros' },
	[GetHashKey('yosemite3')] = { model = 'yosemite3', price = 200000, banned = false, name = 'Yosemite 3', trunk = 60, type = 'outros' },
	[GetHashKey('dloader')] = { model = 'dloader', price = 150000, banned = false, name = 'Dloader', trunk = 60, type = 'outros' },
	[GetHashKey('brawler')] = { model = 'brawler', price = 4000000, banned = false, name = 'Brawler', trunk = 60, type = 'outros' },
	[GetHashKey('sandking2')] = { model = 'sandking2', price = 2500000, banned = false, name = 'Sandking2', trunk = 60, type = 'outros' },
	-- [GetHashKey('viseris')] = { model = 'viseris', price = 600000, banned = false, name = 'Viseris', trunk = 30, type = 'outros' },
	[GetHashKey('xls2')] = { model = 'xls2', price = 5000000, banned = false, name = 'Xls2', trunk = 60, type = 'outros' },
	[GetHashKey('squaddie')] = { model = 'squaddie', price = 350000, banned = false, name = 'squaddie', trunk = 60, type = 'outros' },
	[GetHashKey('cog552')] = { model = 'cog552', price = 200000, banned = false, name = 'Cog552', trunk = 60, type = 'outros' },
	[GetHashKey('cognoscenti')] = { model = 'cognoscenti', price = 190000, banned = false, name = 'Cognoscenti', trunk = 60, type = 'outros' },
	[GetHashKey('cognoscenti2')] = { model = 'cognoscenti2', price = 200000, banned = false, name = 'Cognoscenti2', trunk = 60, type = 'outros' },
	[GetHashKey('alpha')] = { model = 'alpha', price = 200000, banned = false, name = 'Alpha', trunk = 60, type = 'outros' },
	[GetHashKey('banshee')] = { model = 'banshee', price = 300000, banned = false, name = 'Banshee', trunk = 60, type = 'outros' },
	[GetHashKey('bestiagts')] = { model = 'bestiagts', price = 400000, banned = false, name = 'Bestiagts', trunk = 60, type = 'outros' },
	[GetHashKey('blista2')] = { model = 'blista2', price = 100000, banned = false, name = 'Blista2', trunk = 60, type = 'outros' },
	[GetHashKey('blista3')] = { model = 'blista3', price = 200000, banned = false, name = 'Blista3', trunk = 60, type = 'outros' },
	[GetHashKey('buffalo')] = { model = 'buffalo', price = 450000, banned = false, name = 'Buffalo', trunk = 60, type = 'outros' },
	[GetHashKey('buffalo2')] = { model = 'buffalo2', price = 450000, banned = false, name = 'Buffalo2', trunk = 60, type = 'outros' },
	[GetHashKey('buffalo3')] = { model = 'buffalo3', price = 400000, banned = false, name = 'Buffalo3', trunk = 60, type = 'outros' },
	[GetHashKey('carbonizzare')] = { model = 'carbonizzare', price = 200000, banned = false, name = 'Carbonizzare', trunk = 60, type = 'outros' },
	[GetHashKey('comet2')] = { model = 'comet2', price = 400000, banned = false, name = 'Comet2', trunk = 60, type = 'outros' },
	[GetHashKey('comet3')] = { model = 'comet3', price = 500000, banned = false, name = 'Comet3', trunk = 60, type = 'outros' },
	[GetHashKey('comet5')] = { model = 'comet5', price = 1250000, banned = false, name = 'Comet5', trunk = 60, type = 'outros' },
	[GetHashKey('coquette')] = { model = 'coquette', price = 500000, banned = false, name = 'Coquette', trunk = 60, type = 'outros' },
	[GetHashKey('coquette4')] = { model = 'coquette4', price = 8000000, banned = false, name = 'Coquette 4', trunk = 60, type = 'outros' },
	[GetHashKey('elegy')] = { model = 'elegy', price = 500000, banned = false, name = 'Elegy', trunk = 60, type = 'outros' },
	[GetHashKey('elegy2')] = { model = 'elegy2', price = 400000, banned = false, name = 'Elegy2', trunk = 60, type = 'outros' },
	[GetHashKey('feltzer2')] = { model = 'feltzer2', price = 200000, banned = false, name = 'Feltzer2', trunk = 60, type = 'outros' },
	[GetHashKey('furoregt')] = { model = 'furoregt', price = 200000, banned = false, name = 'Furoregt', trunk = 60, type = 'outros' },
	[GetHashKey('fusilade')] = { model = 'fusilade', price = 200000, banned = false, name = 'Fusilade', trunk = 60, type = 'outros' },
	[GetHashKey('futo')] = { model = 'futo', price = 150000, banned = false, name = 'Futo', trunk = 60, type = 'outros' },
	[GetHashKey('jester')] = { model = 'jester', price = 5000000, banned = false, name = 'Jester', trunk = 60, type = 'outros' },
	[GetHashKey('khamelion')] = { model = 'khamelion', price = 200000, banned = false, name = 'Khamelion', trunk = 60, type = 'outros' },
	[GetHashKey('kuruma')] = { model = 'kuruma', price = 7500000, banned = false, name = 'Kuruma', trunk = 60, type = 'outros' },
	[GetHashKey('massacro')] = { model = 'massacro', price = 750000, banned = false, name = 'Massacro', trunk = 60, type = 'outros' },
	[GetHashKey('massacro2')] = { model = 'massacro2', price = 200000, banned = false, name = 'Massacro2', trunk = 60, type = 'outros' },
	[GetHashKey('ninef')] = { model = 'ninef', price = 950000, banned = false, name = 'Ninef', trunk = 60, type = 'outros' },
	[GetHashKey('ninef2')] = { model = 'ninef2', price = 950000, banned = false, name = 'Ninef2', trunk = 60, type = 'outros' },
	[GetHashKey('omnis')] = { model = 'omnis', price = 200000, banned = false, name = 'Omnis', trunk = 60, type = 'outros' },
	[GetHashKey('pariah')] = { model = 'pariah', price = 950000, banned = false, name = 'Pariah', trunk = 60, type = 'outros' },
	[GetHashKey('penumbra')] = { model = 'penumbra', price = 800000, banned = false, name = 'Penumbra', trunk = 60, type = 'outros' },
	[GetHashKey('raiden')] = { model = 'raiden', price = 850000, banned = false, name = 'Raiden', trunk = 60, type = 'outros' },
	[GetHashKey('rapidgt')] = { model = 'rapidgt', price = 800000, banned = false, name = 'Rapidgt', trunk = 60, type = 'outros' },
	[GetHashKey('rapidgt2')] = { model = 'rapidgt2', price = 200000, banned = false, name = 'Rapidgt2', trunk = 60, type = 'outros' },
	[GetHashKey('ruston')] = { model = 'ruston', price = 3000000, banned = false, name = 'Ruston', trunk = 60, type = 'outros' },
	[GetHashKey('schafter3')] = { model = 'schafter3', price = 300000, banned = false, name = 'Schafter3', trunk = 60, type = 'outros' },
	[GetHashKey('schafter4')] = { model = 'schafter4', price = 250000, banned = false, name = 'Schafter4', trunk = 60, type = 'outros' },
	[GetHashKey('schafter5')] = { model = 'schafter5', price = 175000, banned = false, name = 'Schafter5', trunk = 60, type = 'outros' },
	[GetHashKey('schwarzer')] = { model = 'schwarzer', price = 250000, banned = false, name = 'Schwarzer', trunk = 60, type = 'outros' },
	[GetHashKey('sentinel3')] = { model = 'sentinel3', price = 200000, banned = false, name = 'Sentinel3', trunk = 60, type = 'outros' },
	[GetHashKey('seven70')] = { model = 'seven70', price = 200000, banned = false, name = 'Seven70', trunk = 60, type = 'outros' },
	[GetHashKey('specter')] = { model = 'specter', price = 2000000, banned = false, name = 'Specter', trunk = 60, type = 'outros' },
	[GetHashKey('specter2')] = { model = 'specter2', price = 900000, banned = false, name = 'Specter2', trunk = 60, type = 'outros' },
	[GetHashKey('streiter')] = { model = 'streiter', price = 600000, banned = false, name = 'Streiter', trunk = 60, type = 'outros' },
	[GetHashKey('sultan')] = { model = 'sultan', price = 800000, banned = false, name = 'Sultan', trunk = 60, type = 'outros' },
	[GetHashKey('surano')] = { model = 'surano', price = 200000, banned = false, name = 'Surano', trunk = 60, type = 'outros' },
	[GetHashKey('tampa2')] = { model = 'tampa2', price = 300000, banned = false, name = 'Tampa2', trunk = 60, type = 'outros' },
	[GetHashKey('tropos')] = { model = 'tropos', price = 450000, banned = false, name = 'Tropos', trunk = 60, type = 'outros' },
	[GetHashKey('verlierer2')] = { model = 'verlierer2', price = 350000, banned = false, name = 'Verlierer2', trunk = 60, type = 'outros' },
	[GetHashKey('btype')] = { model = 'btype', price = 200000, banned = false, name = 'Btype', trunk = 60, type = 'outros' },
	[GetHashKey('btype2')] = { model = 'btype2', price = 200000, banned = false, name = 'Btype2', trunk = 60, type = 'outros' },
	[GetHashKey('btype3')] = { model = 'btype3', price = 200000, banned = false, name = 'Btype3', trunk = 60, type = 'outros' },
	[GetHashKey('casco')] = { model = 'casco', price = 500000, banned = false, name = 'Casco', trunk = 60, type = 'outros' },
	[GetHashKey('cheetah')] = { model = 'cheetah', price = 200000, banned = false, name = 'Cheetah', trunk = 60, type = 'imports' },
	[GetHashKey('coquette2')] = { model = 'coquette2', price = 400000, banned = false, name = 'Coquette2', trunk = 60, type = 'outros' },
	[GetHashKey('feltzer3')] = { model = 'feltzer3', price = 390000, banned = false, name = 'Feltzer3', trunk = 60, type = 'outros' },
	[GetHashKey('gt500')] = { model = 'gt500', price = 600000, banned = false, name = 'GT500', trunk = 60, type = 'outros' },
	[GetHashKey('infernus2')] = { model = 'infernus2', price = 200000, banned = false, name = 'Infernus2', trunk = 60, type = 'outros' },
	[GetHashKey('jb700')] = { model = 'jb700', price = 250000, banned = false, name = 'Jb700', trunk = 60, type = 'outros' },
	[GetHashKey('mamba')] = { model = 'mamba', price = 400000, banned = false, name = 'Mamba', trunk = 60, type = 'outros' },
	[GetHashKey('manana')] = { model = 'manana', price = 75000, banned = false, name = 'Manana', trunk = 60, type = 'outros' },
	[GetHashKey('monroe')] = { model = 'monroe', price = 400000, banned = false, name = 'Monroe', trunk = 60, type = 'outros' },
	[GetHashKey('peyote')] = { model = 'peyote', price = 80000, banned = false, name = 'Peyote', trunk = 60, type = 'outros' },
	[GetHashKey('pigalle')] = { model = 'pigalle', price = 80000, banned = false, name = 'Pigalle', trunk = 60, type = 'outros' },
	[GetHashKey('rapidgt3')] = { model = 'rapidgt3', price = 650000, banned = false, name = 'Rapidgt3', trunk = 60, type = 'outros' },
	[GetHashKey('retinue')] = { model = 'retinue', price = 200000, banned = false, name = 'Retinue', trunk = 60, type = 'outros' },
	[GetHashKey('stinger')] = { model = 'stinger', price = 450000, banned = false, name = 'Stinger', trunk = 60, type = 'outros' },
	[GetHashKey('stingergt')] = { model = 'stingergt', price = 400000, banned = false, name = 'Stingergt', trunk = 60, type = 'outros' },
	[GetHashKey('torero')] = { model = 'torero', price = 300000, banned = false, name = 'Torero', trunk = 60, type = 'outros' },
	[GetHashKey('tornado')] = { model = 'tornado', price = 100000, banned = false, name = 'Tornado', trunk = 60, type = 'outros' },
	[GetHashKey('tornado2')] = { model = 'tornado2', price = 300000, banned = false, name = 'Tornado2', trunk = 60, type = 'outros' },
	[GetHashKey('tornado5')] = { model = 'tornado5', price = 500000, banned = false, name = 'Tornado5', trunk = 60, type = 'outros' },
	[GetHashKey('tornado6')] = { model = 'tornado6', price = 800000, banned = false, name = 'Tornado6', trunk = 60, type = 'outros' },
	[GetHashKey('turismo2')] = { model = 'turismo2', price = 200000, banned = false, name = 'Turismo2', trunk = 60, type = 'outros' },
	[GetHashKey('ztype')] = { model = 'ztype', price = 200000, banned = false, name = 'Ztype', trunk = 60, type = 'outros' },
	[GetHashKey('adder')] = { model = 'adder', price = 700000, banned = false, name = 'Adder', trunk = 60, type = 'outros' },
	[GetHashKey('cheetah2')] = { model = 'cheetah2', price = 200000, banned = false, name = 'Cheetah2', trunk = 2600, type = 'outros' },
	[GetHashKey('bison')] = { model = 'bison', price = 200000, banned = false, name = 'Bison', trunk = 60, type = 'outros' },
	[GetHashKey('bison2')] = { model = 'bison2', price = 200000, banned = false, name = 'Bison2', trunk = 60, type = 'outros' },
	[GetHashKey('bobcatxl')] = { model = 'bobcatxl', price = 650000, banned = false, name = 'Bobcatxl', trunk = 60, type = 'outros' },
	[GetHashKey('burrito')] = { model = 'burrito', price = 2000000, banned = false, name = 'Burrito', trunk = 60, type = 'outros' },
	[GetHashKey('burrito2')] = { model = 'burrito2', price = 3000000, banned = false, name = 'Burrito2', trunk = 60, type = 'outros' },
	[GetHashKey('burrito3')] = { model = 'burrito3', price = 4000000, banned = false, name = 'Burrito3', trunk = 60, type = 'outros' },
	[GetHashKey('burrito4')] = { model = 'burrito4', price = 5000000, banned = false, name = 'Burrito4', trunk = 60, type = 'outros' },
	[GetHashKey('minivan')] = { model = 'minivan', price = 800000, banned = false, name = 'Minivan', trunk = 60, type = 'outros' },
	[GetHashKey('minivan2')] = { model = 'minivan2', price = 5000000, banned = false, name = 'Minivan2', trunk = 60, type = 'outros' },
	[GetHashKey('paradise')] = { model = 'paradise', price = 200000, banned = false, name = 'Paradise', trunk = 60, type = 'outros' },
	[GetHashKey('pony')] = { model = 'pony', price = 160000, banned = false, name = 'Pony', trunk = 60, type = 'outros' },
	[GetHashKey('pony2')] = { model = 'pony2', price = 2000000, banned = false, name = 'Pony2', trunk = 60, type = 'outros' },
	[GetHashKey('surfer')] = { model = 'surfer', price = 500000, banned = false, name = 'Surfer', trunk = 60, type = 'outros' },
	[GetHashKey('cheburek')] = { model = 'cheburek', price = 230000, banned = false, name = 'Cheburek', trunk = 60, type = 'outros' },
	[GetHashKey('hotring')] = { model = 'hotring', price = 500000, banned = false, name = 'Hotring', trunk = 60, type = 'outros' },
	[GetHashKey('jester3')] = { model = 'jester3', price = 200000, banned = false, name = 'Jester3', trunk = 60, type = 'outros' },
	[GetHashKey('flashgt')] = { model = 'flashgt', price = 700000, banned = false, name = 'Flashgt', trunk = 60, type = 'outros' },
	[GetHashKey('ellie')] = { model = 'ellie', price = 400000, banned = false, name = 'Ellie', trunk = 60, type = 'outros' },
	[GetHashKey('michelli')] = { model = 'michelli', price = 200000, banned = false, name = 'Michelli', trunk = 60, type = 'outros' },
	[GetHashKey('fagaloa')] = { model = 'fagaloa', price = 100000, banned = false, name = 'Fagaloa', trunk = 60, type = 'outros' },
	[GetHashKey('dominator3')] = { model = 'dominator3', price = 400000, banned = false, name = 'Dominator3', trunk = 60, type = 'outros' },
	[GetHashKey('issi3')] = { model = 'issi3', price = 100000, banned = false, name = 'Issi3', trunk = 60, type = 'outros' },
	[GetHashKey('gb200')] = { model = 'gb200', price = 500000, banned = false, name = 'Gb200', trunk = 60, type = 'outros' },
	[GetHashKey('neon')] = { model = '', price = 2000000, banned = false, name = 'Neon', trunk = 60, type = 'outros' },
	[GetHashKey('tezeract')] = { model = 'tezeract', price = 7000000, banned = false, name = 'Tezeract', trunk = 60, type = 'outros' },
	[GetHashKey('swinger')] = { model = 'swinger', price = 550000, banned = false, name = 'Swinger', trunk = 60, type = 'outros' },
	[GetHashKey('clique')] = { model = 'clique', price = 200000, banned = false, name = 'Clique', trunk = 60, type = 'outros' },
	[GetHashKey('deveste')] = { model = 'deveste', price = 2000000, banned = false, name = 'Deveste', trunk = 60, type = 'outros' },
	[GetHashKey('deviant')] = { model = 'deviant', price = 200000, banned = false, name = 'Deviant', trunk = 60, type = 'outros' },
	[GetHashKey('impaler')] = { model = 'impaler', price = 1300000, banned = false, name = 'Impaler', trunk = 60, type = 'outros' },
	[GetHashKey('italigto')] = { model = 'italigto', price = 5000000, banned = false, name = 'Italigto', trunk = 60, type = 'outros' },
	[GetHashKey('schlagen')] = { model = 'schlagen', price = 500000, banned = false, name = 'Schlagen', trunk = 60, type = 'outros' },
	[GetHashKey('tulip')] = { model = 'tulip', price = 850000, banned = false, name = 'Tulip', trunk = 60, type = 'outros' },
	[GetHashKey('vamos')] = { model = 'vamos', price = 900000, banned = false, name = 'Vamos', trunk = 60, type = 'outros' },
	[GetHashKey('lurcher')] = { model = 'lurcher', price = 200000, banned = false, name = 'Lurcher', trunk = 60, type = 'outros' },
	[GetHashKey('lynx')] = { model = 'lynx', price = 800000, banned = false, name = 'Lynx', trunk = 60, type = 'outros' },
	[GetHashKey('raptor')] = { model = 'raptor', price = 200000, banned = false, name = 'Raptor', trunk = 60, type = 'outros' },
	[GetHashKey('z190')] = { model = 'z190', price = 400000, banned = false, name = 'Z190', trunk = 60, type = 'outros' },
	[GetHashKey('nightblade')] = { model = 'nightblade', price = 800000, banned = false, name = 'Nightblade', trunk = 60, type = 'outros' },
	[GetHashKey('rumpo')] = { model = 'rumpo', price = 200000, banned = false, name = 'Rumpo', trunk = 60, type = 'outros' },
	[GetHashKey('rumpo2')] = { model = 'rumpo2', price = 160000, banned = false, name = 'Rumpo2', trunk = 60, type = 'outros' },
	[GetHashKey('youga')] = { model = 'youga', price = 200000, banned = false, name = 'Youga', trunk = 60, type = 'outros' },
	----CARROS FACS PERSONALISADOS m135dragons
	[GetHashKey('m135dragons')] = { model = 'm135dragons', price = 200000, banned = false, name = 'm135dragons', trunk = 200, type = 'vip' },
	

	--[[TYPE = SEDANS]]-- 
	[GetHashKey('intruder')] = { model = 'intruder', price = 90000, banned = false, name = 'Intruder', trunk = 60, type = 'sedans' },
    [GetHashKey('exemplar')] = { model = 'exemplar', price = 250000, banned = false, name = 'Exemplar', trunk = 60, type = 'sedans' },
    [GetHashKey('f620')] = { model = 'f620', price = 160000, banned = false, name = 'F620', trunk = 60, type = 'sedans' },
    [GetHashKey('felon')] = { model = 'felon', price = 300000, banned = false, name = 'Felon', trunk = 60, type = 'sedans' },
    [GetHashKey('ingot')] = { model = 'ingot', price = 100000, banned = false, name = 'Ingot', trunk = 60, type = 'sedans' },
    [GetHashKey('jackal')] = { model = 'jackal', price = 200000, banned = false, name = 'Jackal', trunk = 60, type = 'sedans' },
    [GetHashKey('oracle')] = { model = 'oracle', price = 120000, banned = false, name = 'Oracle', trunk = 60, type = 'sedans' },
    [GetHashKey('oracle2')] = { model = 'oracle2', price = 150000, banned = false, name = 'Oracle2', trunk = 60, type = 'sedans' },
    [GetHashKey('sentinel')] = { model = 'sentinel', price = 140000, banned = false, name = 'Sentinel', trunk = 60, type = 'sedans' },
    [GetHashKey('sentinel2')] = { model = 'sentinel2', price = 130000, banned = false, name = 'Sentinel2', trunk = 60, type = 'sedans' },
    [GetHashKey('windsor')] = { model = 'windsor', price = 220000, banned = false, name = 'Windsor', trunk = 60, type = 'sedans' },
    [GetHashKey('windsor2')] = { model = 'windsor2', price = 170000, banned = false, name = 'Windsor2', trunk = 60, type = 'sedans' },
    [GetHashKey('zion')] = { model = 'zion', price = 150000, banned = false, name = 'Zion', trunk = 60, type = 'sedans' },
    [GetHashKey('zion2')] = { model = 'zion2', price = 300000, banned = false, name = 'Zion2', trunk = 60, type = 'sedans' },
    [GetHashKey('blade')] = { model = 'blade', price = 150000, banned = false, name = 'Blade', trunk = 60, type = 'sedans' },
    [GetHashKey('buccaneer')] = { model = 'buccaneer', price = 200000, banned = false, name = 'Buccaneer', trunk = 60, type = 'sedans' },
    [GetHashKey('buccaneer2')] = { model = 'buccaneer2', price = 500000, banned = false, name = 'Buccaneer2', trunk = 60, type = 'sedans' },
    [GetHashKey('primo')] = { model = 'primo', price = 130000, banned = false, name = 'Primo', trunk = 60, type = 'sedans' },
	[GetHashKey('issi2')] = { model = 'issi2', price = 200000, banned = false, name = 'Issi2', trunk = 60, type = 'sedans' },
    [GetHashKey('prairie')] = { model = 'prairie', price = 80000, banned = false, name = 'Prairie', trunk = 60, type = 'sedans' },
    [GetHashKey('rhapsody')] = { model = 'rhapsody', price = 10000, banned = false, name = 'Rhapsody', trunk = 60, type = 'sedans' },
    [GetHashKey('cogcabrio')] = { model = 'cogcabrio', price = 220000, banned = false, name = 'Cogcabrio', trunk = 60, type = 'sedans' },
    [GetHashKey('emperor')] = { model = 'emperor', price = 70000, banned = false, name = 'Emperor', trunk = 60, type = 'sedans' },
    [GetHashKey('emperor2')] = { model = 'emperor2', price = 100000, banned = false, name = 'Emperor 2', trunk = 60, type = 'sedans' },
	[GetHashKey('emperor3')] = { model = 'emperor3', price = 100000, banned = false, name = 'Emperor 3', trunk = 60, type = 'sedans' },
    [GetHashKey('phoenix')] = { model = 'phoenix', price = 160000, banned = false, name = 'Phoenix', trunk = 60, type = 'sedans' },
    [GetHashKey('premier')] = { model = 'premier', price = 150000, banned = false, name = 'Premier', trunk = 60, type = 'sedans' },
    [GetHashKey('glendale')] = { model = 'glendale', price = 80000, banned = false, name = 'Glendale', trunk = 60, type = 'sedans' }, 
	[GetHashKey('glendale2')] = { model = 'glendale2', price = 250000, banned = false, name = 'Glendale 2', trunk = 60, type = 'sedans' },
	[GetHashKey('regina')] = { model = 'regina', price = 200000, banned = false,  name = 'Regina', trunk = 60, type = 'sedans' },
	[GetHashKey('romero')] = { model = 'romero', price = 500000, banned = false, name = 'Funerário', trunk = 60, type = 'sedans' },
	[GetHashKey('superd')] = { model = 'superd', price = 500000, banned = false, name = 'superd', trunk = 60, type = 'sedans' },
	[GetHashKey('stretch')] = { model = 'stretch', price = 200000, banned = false, name = 'Limousine', trunk = 60, type = 'sedans' },
	[GetHashKey('asea')] = { model = 'asea', price = 100000, banned = false, name = 'Asea', trunk = 60, type = 'sedans' },
	[GetHashKey('asea2')] = { model = 'asea2', price = 100000, banned = false, name = 'Asea2', trunk = 60, type = 'sedans' },
	[GetHashKey('asterope')] = { model = 'asterope', price = 150000, banned = false, name = 'Asterope', trunk = 60, type = 'sedans' },
	[GetHashKey('cog55')] = { model = 'cog55', price = 200000, banned = false, name = 'Cog55', trunk = 60, type = 'sedans' },
	[GetHashKey('stanier')] = { model = 'stanier', price = 130000, banned = false, name = 'Stanier', trunk = 60, type = 'sedans' },
	[GetHashKey('stratum')] = { model = 'stratum', price = 100000, banned = false, name = 'Stratum', trunk = 60, type = 'sedans' },
	[GetHashKey('importsd')] = { model = 'importsd', price = 150000, banned = false, name = 'importsd', trunk = 60, type = 'sedans' },
	[GetHashKey('surge')] = { model = 'surge', price = 220000, banned = false, name = 'Surge', trunk = 60, type = 'sedans' },
	[GetHashKey('tailgater')] = { model = 'tailgater', price = 160000, banned = false, name = 'Tailgater', trunk = 60, type = 'sedans' },
	[GetHashKey('tailgater2')] = { model = 'tailgater2', price = 160000, banned = false, name = 'tailgater2', trunk = 60, type = 'sedans' },
	[GetHashKey('warrener')] = { model = 'warrener', price = 100000, banned = false, name = 'Warrener', trunk = 60, type = 'sedans' },
	[GetHashKey('washington')] = { model = 'washington', price = 150000, banned = false, name = 'Washington', trunk = 60, type = 'sedans' },
	[GetHashKey('fugitive')] = { model = 'fugitive', price = 190000, banned = false, name = 'Fugitive', trunk = 60, type = 'sedans' },
	[GetHashKey('stafford')] = { model = 'stafford', price = 200000, banned = false, name = 'Stafford', trunk = 60, type = 'sedans' },
	[GetHashKey('sugoi')] = { model = 'sugoi', price = 200000, banned = false, name = 'Sugoi', trunk = 60, type = 'sedans' },
	[GetHashKey('fiatstilo')] = { model = 'fiatstilo', price = 200000, banned = false, name = 'Fiat Stilo', trunk = 60, type = 'sedans' },
	[GetHashKey('limo2')] = { model = 'limo2', price = 200000, banned = false, name = 'limo2', trunk = 60, type = 'sedans' },

------------------------------------------------------------------------------------------------------------------------------------------------------
----iates 
[GetHashKey('sr650fly')] = { model = 'sr650fly', price = 200000, banned = false, name = 'sr650fly', trunk = 2000, type = 'vip' },


	--[[VEÍCULOS EMPREGOS SERVICE]]--
	--barcos service
	[GetHashKey('dinghy')] = { model = 'dinghy', price = 200000, banned = false, name = 'Dinghy', trunk = nil, type = 'service' },
	[GetHashKey('hydra')] = { model = 'hydra', price = 200000, banned = false, name = 'hydra', trunk = nil, type = 'service' },
	[GetHashKey('dinghy2')] = { model = 'dinghy2', price = 200000, banned = false, name = 'Dinghy 2', trunk = nil, type = 'service' },
	[GetHashKey('dinghy3')] = { model = 'dinghy3', price = 200000, banned = false, name = 'Dinghy 3', trunk = nil, type = 'service' },
	[GetHashKey('dinghy4')] = { model = 'dinghy4', price = 200000, banned = false, name = 'Dinghy 4', trunk = nil, type = 'service' },
	---outros service
	[GetHashKey('speedo')] = { model = 'speedo', price = 500000, banned = false, name = 'Speedo', trunk = 60, type = 'service' },
	[GetHashKey('tractor2')] = { model = 'tractor2', price = 160000, banned = false, name = 'Tractor2', trunk = 60, type = 'service' },
	[GetHashKey('bus')] = { model = 'bus', price = 200000, banned = false, name = 'Ônibus', trunk = 0, type = 'service' },

	[GetHashKey('trash2')] = { model = 'trash2', price = 200000, banned = false, name = 'Caminhão', trunk = 60, type = 'service' }, --lixeiro
	[GetHashKey('wrbrickdump')] = { model = 'wrbrickdump', price = 200000, banned = false, name = 'wrbrickdump', trunk = 150, type = 'service' }, --minerador
	
	----BICICLETAS SPAWN
	[GetHashKey('scorcher')] = { model = 'scorcher', price = 200000, banned = false, name = 'Scorcher', trunk = 0, type = 'service' },
	[GetHashKey('tribike')] = { model = 'tribike', price = 200000, banned = false, name = 'Tribike', trunk = 0, type = 'service' },
	[GetHashKey('tribike2')] = { model = 'tribike2', price = 200000, banned = false, name = 'Tribike2', trunk = 0, type = 'service' },
	[GetHashKey('tribike3')] = { model = 'tribike3', price = 200000, banned = false, name = 'Tribike3', trunk = 0, type = 'service' },
	[GetHashKey('fixter')] = { model = 'fixter', price = 200000, banned = false, name = 'Fixter', trunk = 0, type = 'service' },
	[GetHashKey('cruiser')] = { model = 'cruiser', price = 200000, banned = false, name = 'Cruiser', trunk = 0, type = 'service' },
	[GetHashKey('bmx')] = { model = 'bmx', price = 20000, banned = false, name = 'Bmx', trunk = 0, type = 'service' },

	
	------------------------------------------------------------------------------------------------------------------------------------------------------
	--IMPORTADOS 
	[GetHashKey('furia')] = { model = 'furia', price = 2000000, banned = false, name = 'Furia', trunk = 100, type = 'imports' },
	[GetHashKey('krieger')] = { model = 'krieger', price = 4000000, banned = false, name = 'Krieger', trunk = 100, type = 'imports', },
	[GetHashKey('emerus')] = { model = 'emerus', price = 2000000, banned = false, name = 'Emerus', trunk = 100, type = 'imports' },
	[GetHashKey('zorrusso')] = { model = 'zorrusso', price = 3500000, banned = false, name = 'Zorrusso', trunk = 100, type = 'imports'  },
	[GetHashKey('thrax')] = { model = 'thrax', price = 5000000, banned = false, name = 'Thrax', trunk = 100, type = 'imports' },
	[GetHashKey('s80')] = { model = 's80', price = 2000000, banned = false, name = 'S80', trunk = 100, type = 'imports' },
	[GetHashKey('tigon')] = { model = 'tigon', price = 2000000, banned = false, name = 'Tigon', trunk = 100, type = 'imports' },
	[GetHashKey('autarch')] = { model = 'autarch', price = 3000000, banned = false, name = 'Autarch', trunk = 100, type = 'imports' },
	[GetHashKey('banshee2')] = { model = 'banshee2', price = 700000, banned = false, name = 'Banshee2', trunk = 100, type = 'imports' },
	[GetHashKey('bullet')] = { model = 'bullet', price = 800000, banned = false, name = 'Bullet', trunk = 100, type = 'imports' },
	[GetHashKey('entityxf')] = { model = 'entityxf', price = 2000000, banned = false, name = 'Entityxf', trunk = 100, type = 'imports' },
	[GetHashKey('fmj')] = { model = 'fmj', price = 1200000, banned = false, name = 'Fmj', trunk = 100, type = 'imports' },
	[GetHashKey('gp1')] = { model = 'gp1', price = 2000000, banned = false, name = 'Gp1', trunk = 100, type = 'imports' },
	[GetHashKey('infernus')] = { model = 'infernus', price = 700000, banned = false, name = 'Infernus', trunk = 100, type = 'imports' },
	[GetHashKey('nero')] = { model = 'nero', price = 4500000, banned = false, name = 'Nero', trunk = 100, type = 'imports' },
	[GetHashKey('nero2')] = { model = 'nero2', price = 3000000, banned = false, name = 'Nero2', trunk = 100, type = 'imports' },
	[GetHashKey('osiris')] = { model = 'osiris', price = 4000000, banned = false, name = 'Osiris', trunk = 100, type = 'imports' },
	[GetHashKey('penetrator')] = { model = 'penetrator', price = 1200000, banned = false, name = 'Penetrator', trunk = 100, type = 'imports' },
	[GetHashKey('pfister811')] = { model = 'pfister811', price = 2000000, banned = false, name = 'Pfister811', trunk = 100, type = 'imports' },
	[GetHashKey('reaper')] = { model = 'reaper', price = 2500000, banned = false, name = 'Reaper', trunk = 100, type = 'imports' },
	[GetHashKey('sc1')] = { model = 'sc1', price = 2500000, banned = false, name = 'Sc1', trunk = 100, type = 'imports' },
	[GetHashKey('scramjet')] = { model = 'scramjet', price = 2500000, banned = false, name = 'scramjet', trunk = 100, type = 'imports' },
	[GetHashKey('sultanrs')] = { model = 'sultanrs', price = 2000000, banned = false, name = 'Sultan RS', trunk = 100, type = 'imports' },
	[GetHashKey('italigtb2')] = { model = 'italigtb2', price = 2000000, banned = false, name = 'italigtb2', trunk = 100, type = 'imports' },
	[GetHashKey('t20')] = { model = 't20', price = 2500000, banned = false, name = 'T20', trunk = 100, type = 'imports' },
	[GetHashKey('tempesta')] = { model = 'tempesta', price = 4000000, banned = false, name = 'Tempesta', trunk = 100, type = 'imports' },
	[GetHashKey('turismor')] = { model = 'turismor', price = 5000000, banned = false, name = 'Turismor', trunk = 100, type = 'imports' },
	[GetHashKey('tyrus')] = { model = 'tyrus', price = 1200000, banned = false, name = 'Tyrus', trunk = 100, type = 'imports' },
	[GetHashKey('vacca')] = { model = 'vacca', price = 2000000, banned = false, name = 'Vacca', trunk = 100, type = 'imports' },
	[GetHashKey('visione')] = { model = 'visione', price = 2000000, banned = false, name = 'Visione', trunk = 100, type = 'imports' },
	[GetHashKey('voltic')] = { model = 'voltic', price = 800000, banned = false, name = 'Voltic', trunk = 100, type = 'imports' },
	[GetHashKey('voltic2')] = { model = 'voltic2', price = 800000, banned = false, name = 'voltic2', trunk = 100, type = 'imports' },
	[GetHashKey('zentorno')] = { model = 'zentorno', price = 2000000, banned = false, name = 'Zentorno', trunk = 100, type = 'imports' },
	[GetHashKey('tyrant')] = { model = 'tyrant', price = 5000000, banned = false, name = 'Tyrant', trunk = 100, type = 'imports' },
	[GetHashKey('entity2')] = { model = 'entity2', price = 2000000, banned = false, name = 'Entity2', trunk = 100, type = 'imports' },
	[GetHashKey('entity3')] = { model = 'entity3', price = 2000000, banned = false, name = 'entity3', trunk = 100, type = 'imports' },
	[GetHashKey('jester2')] = { model = "jester2", price = 2000000, banned = false, name = 'Jester 2', trunk = 100, type = 'imports'},
	[GetHashKey('taipan')] = { model = 'taipan', price = 2000000, banned = false, name = 'Taipan', trunk = 100, type = 'imports' },
	[GetHashKey('cyclone')] = { model = 'cyclone', price = 2000000, banned = false, name = 'Cyclone', trunk = 100, type = 'imports' },
	[GetHashKey('italigtb')] = { model = 'italigtb', price = 2000000, banned = false, name = 'Italigtb', trunk = 100, type = 'imports' },
	[GetHashKey('italigtb2')] = { model = 'italigtb2', price = 2000000, banned = false, name = 'Italigtb2', trunk = 100, type = 'imports' },
	[GetHashKey('vagner')] = { model = 'vagner', price = 2000000, banned = false, name = 'Vagner', trunk = 100, type = 'imports' },
	[GetHashKey('vigilante')] = { model = 'vigilante', price = 2000000, banned = false, name = 'vigilante', trunk = 100, type = 'imports' },
	[GetHashKey('virtue')] = { model = 'virtue', price = 2000000, banned = false, name = 'virtue', trunk = 100, type = 'imports' },
	[GetHashKey('xa21')] = { model = 'xa21', price = 2000000, banned = false, name = 'Xa21', trunk = 100, type = 'imports' },
	[GetHashKey('prototipo')] = { model = 'prototipo', price = 2000000, banned = false, name = 'Prototipo', trunk = 100, type = 'imports' },
	[GetHashKey('le7b')] = { model = 'le7b', price = 3000000, banned = false, name = 'Le7b', trunk = 100, type = 'imports' },
	[GetHashKey('sheava')] = { model = 'sheava', price = 4000000, banned = false, name = 'Sheava', trunk = 100, type = 'imports' },
	[GetHashKey('dodgechargersrt')] = { model = 'dodgechargersrt', price = 2000000, banned = false, name = 'Dodge Charger SRT', trunk = 100, type = 'import' },
	[GetHashKey('bmwm3f80')] = { model = 'bmwm3f80', price = 1350000, banned = false, name = 'BMW M3 F80', trunk = 100, type = 'import' },
	[GetHashKey('hondafk8')] = { model = 'hondafk8', price = 1700000, banned = false, name = 'Honda FK8', trunk = 100, type = 'import' },
	[GetHashKey('mustangmach1')] = { model = 'mustangmach1', price = 1100000, banned = false, name = 'Mustang Mach 1', trunk = 100, type = 'import' },
	[GetHashKey('porsche930')] = { model = 'porsche930', price = 1300000, banned = false, name = 'Porsche 930', trunk = 100, type = 'import' },
	[GetHashKey('beetle74')] = { model = 'beetle74', price = 500000, banned = false, name = 'Fusca 74', trunk = 100, type = 'import' },
	[GetHashKey('fe86')] = { model = 'fe86', price = 500000, banned = false, name = 'Escorte', trunk = 100, type = 'import' },
	
	
    ----------MOTOS	
	[GetHashKey('verus')] = { model = 'verus', price = 200000, banned = false, name = 'Verus', trunk = 40, type = 'motos' },
	[GetHashKey('akuma')] = { model = 'akuma', price = 2000000, banned = false, name = 'Akuma', trunk = 40, type = 'motos' },
	[GetHashKey('avarus')] = { model = 'avarus', price = 200000, banned = false, name = 'Avarus', trunk = 40, type = 'motos' },
	[GetHashKey('bagger')] = { model = 'bagger', price = 200000, banned = false, name = 'Bagger', trunk = 40, type = 'motos' },
	[GetHashKey('bati')] = { model = 'bati', price = 200000, banned = false, name = 'Bati', trunk = 40, type = 'motos' },
	[GetHashKey('bati2')] = { model = 'bati2', price = 800000, banned = false, name = 'Bati2', trunk = 40, type = 'motos' },
	[GetHashKey('bf400')] = { model = 'bf400', price = 200000, banned = false, name = 'Bf400', trunk = 40, type = 'motos' },
	[GetHashKey('carbonrs')] = { model = 'carbonrs', price = 800000, banned = false, name = 'Carbonrs', trunk = 40, type = 'motos' },
	[GetHashKey('chimera')] = { model = 'chimera', price = 400000, banned = false, name = 'Chimera', trunk = 40, type = 'motos' },
	[GetHashKey('cliffhanger')] = { model = 'cliffhanger', price = 250000, banned = false, name = 'Cliffhanger', trunk = 40, type = 'motos' },
	[GetHashKey('daemon')] = { model = 'daemon', price = 200000, banned = false, name = 'Daemon', trunk = 40, type = 'motos' },
	[GetHashKey('daemon2')] = { model = 'daemon2', price = 200000, banned = false, name = 'Daemon2', trunk = 40, type = 'motos' },
	[GetHashKey('defiler')] = { model = 'defiler', price = 700000, banned = false, name = 'Defiler', trunk = 40, type = 'motos' },
	[GetHashKey('diablous')] = { model = 'diablous', price = 500000, banned = false, name = 'Diablous', trunk = 40, type = 'motos' },
	[GetHashKey('diablous2')] = { model = 'diablous2', price = 700000, banned = false, name = 'Diablous2', trunk = 40, type = 'motos' },
	[GetHashKey('double')] = { model = 'double', price = 50000, banned = false, name = 'Double', trunk = 40, type = 'motos' },
	[GetHashKey('enduro')] = { model = 'enduro', price = 400000, banned = false, name = 'Enduro', trunk = 40, type = 'motos' },
	[GetHashKey('esskey')] = { model = 'esskey', price = 400000, banned = false, name = 'Esskey', trunk = 40, type = 'motos' },
	[GetHashKey('faggio')] = { model = 'faggio', price = 4000, banned = false, name = 'Faggio', trunk = 10, type = 'motos' },
	[GetHashKey('faggio2')] = { model = 'faggio2', price = 5000, banned = false, name = 'Faggio2', trunk = 10, type = 'motos' },
	[GetHashKey('faggio3')] = { model = 'faggio3', price = 5000, banned = false, name = 'Faggio3', trunk = 10, type = 'motos' },
	[GetHashKey('fcr')] = { model = 'fcr', price = 300000, banned = false, name = 'Fcr', trunk = 40, type = 'motos' },
	[GetHashKey('fcr2')] = { model = 'fcr2', price = 400000, banned = false, name = 'Fcr2', trunk = 40, type = 'motos' },
	[GetHashKey('gargoyle')] = { model = 'gargoyle', price = 450000, banned = false, name = 'Gargoyle', trunk = 40, type = 'motos' },
	[GetHashKey('hakuchou')] = { model = 'hakuchou', price = 3000000, banned = false, name = 'Hakuchou', trunk = 40, type = 'motos' },
	[GetHashKey('hakuchou2')] = { model = 'hakuchou2', price = 200000, banned = false, name = 'Hakuchou2', trunk = 40, type = 'motos' },
	[GetHashKey('hexer')] = { model = 'hexer', price = 200000, banned = false, name = 'Hexer', trunk = 40, type = 'motos' },
	[GetHashKey('innovation')] = { model = 'innovation', price = 200000, banned = false, name = 'Innovation', trunk = 40, type = 'motos' },
	[GetHashKey('lectro')] = { model = 'lectro', price = 200000, banned = false, name = 'Lectro', trunk = 40, type = 'motos' },
	[GetHashKey('manchez')] = { model = 'manchez', price = 800000, banned = false, name = 'Manchez', trunk = 40, type = 'motos' },
	[GetHashKey('nemesis')] = { model = 'nemesis', price = 250000, banned = false, name = 'Nemesis', trunk = 40, type = 'motos' },
	[GetHashKey('pcj')] = { model = 'pcj', price = 300000, banned = false, name = 'Pcj', trunk = 40, type = 'motos' },
	[GetHashKey('ruffian')] = { model = 'ruffian', price = 450000, banned = false, name = 'Ruffian', trunk = 40, type = 'motos' },
	[GetHashKey('sanchez')] = { model = 'sanchez', price = 400000, banned = false, name = 'Sanchez', trunk = 40, type = 'motos' },
	[GetHashKey('sanchez2')] = { model = 'sanchez2', price = 500000, banned = false, name = 'Sanchez2', trunk = 40, type = 'motos' },
	[GetHashKey('sanctus')] = { model = 'sanctus', price = 400000, banned = false, name = 'Sanctus', trunk = 40, type = 'motos' },
	[GetHashKey('sovereign')] = { model = 'sovereign', price = 200000, banned = false, name = 'Sovereign', trunk = 40, type = 'motos' },
	[GetHashKey('thrust')] = { model = 'thrust', price = 650000, banned = false, name = 'Thrust', trunk = 40, type = 'motos' },
	[GetHashKey('vader')] = { model = 'vader', price = 400000, banned = false, name = 'Vader', trunk = 40, type = 'motos' },
	[GetHashKey('vindicator')] = { model = 'vindicator', price = 200000, banned = false, name = 'Vindicator', trunk = 40, type = 'motos' },
	[GetHashKey('vortex')] = { model = 'vortex', price = 800000, banned = false, name = 'Vortex', trunk = 40, type = 'motos' },
	[GetHashKey('wolfsbane')] = { model = 'wolfsbane', price = 400000, banned = false, name = 'Wolfsbane', trunk = 40, type = 'motos' },
	[GetHashKey('zombiea')] = { model = 'zombiea', price = 250000, banned = false, name = 'Zombiea', trunk = 40, type = 'motos' },
	[GetHashKey('zombieb')] = { model = 'zombieb', price = 250000, banned = false, name = 'Zombieb', trunk = 40, type = 'motos' },
	[GetHashKey('blazer')] = { model = 'blazer', price = 750000, banned = false, name = 'Blazer', trunk = 40, type = 'motos' },
	[GetHashKey('blazer4')] = { model = 'blazer4', price = 800000, banned = false, name = 'Blazer4', trunk = 40, type = 'motos' },
	[GetHashKey('shotaro')] = { model = 'shotaro', price = 2000000, banned = false, name = 'Shotaro', trunk = 40, type = 'motos' },
	[GetHashKey('ratbike')] = { model = 'ratbike', price = 200000, banned = false, name = 'Ratbike', trunk = 40, type = 'motos' },
	
	--CARROS BLINDADOS 
	[GetHashKey('audiq8')] = { model = 'audiq8', price = 110000, banned = false, name = 'audiq8', trunk = 70, type = 'vip' },
	[GetHashKey('er34h')] = { model = 'er34h', price = 110000, banned = false, name = 'er34h', trunk = 70, type = 'vip' },
	[GetHashKey('g800brabus')] = { model = 'g800brabus', price = 110000, banned = false, name = 'g800brabus', trunk = 450, type = 'vip' },
	[GetHashKey('gle53')] = { model = 'gle53', price = 110000, banned = false, name = 'gle53', trunk = 70, type = 'vip' },
	[GetHashKey('m5f90')] = { model = 'm5f90', price = 110000, banned = false, name = 'm5f90', trunk = 70, type = 'vip' },
	[GetHashKey('armored18velar')] = { model = 'armored18velar', price = 110000, banned = false, name = 'armored18velar', trunk = 70, type = 'vip' },
	[GetHashKey('armoredaudirs7')] = { model = 'armoredaudirs7', price = 110000, banned = false, name = 'armoredaudirs7', trunk = 70, type = 'vip' },
	[GetHashKey('armoredbmwg07')] = { model = 'armoredbmwg07', price = 110000, banned = false, name = 'armoredbmwg07', trunk = 70, type = 'vip' },
	[GetHashKey('armoredinsurgent2')] = { model = 'armoredinsurgent2', price = 110000, banned = false, name = 'armoredinsurgent2', trunk = 70, type = 'vip' },
	[GetHashKey('armoredmacanturbo')] = { model = 'armoredmacanturbo', price = 110000, banned = false, name = 'armoredmacanturbo', trunk = 70, type = 'vip' },
	[GetHashKey('armoredmenacer')] = { model = 'armoredmenacer', price = 110000, banned = false, name = 'armoredmenacer', trunk = 70, type = 'vip' },
	[GetHashKey('armorednightshark')] = { model = 'armorednightshark', price = 110000, banned = false, name = 'armorednightshark', trunk = 70, type = 'vip' },


	--[[CARROS CONCE pra por ]]--
	[GetHashKey('caracara2')] = { model = 'caracara2', price = 1000000, banned = false, name = 'Caracara2', trunk = 100, type = 'outros' },
	[GetHashKey('everon')] = { model = 'everon', price = 10000000, banned = false, name = 'everon', trunk = 400, type = 'outros' },
	[GetHashKey('elegy')] = { model = 'elegy', price = 7000000, banned = false, name = 'elegy', trunk = 50, type = 'outros' },
	[GetHashKey('caracara2')] = { model = 'caracara2', price = 1000000, banned = false, name = 'Caracara2', trunk = 100, type = 'outros' },
	[GetHashKey('penumbra2')] = { model = 'penumbra2', price = 500000, banned = false, name = 'penumbra2', trunk = 100, type = 'service'},
	[GetHashKey('riata')] = { model = 'riata', price = 2000000, banned = false, name = 'Riata', trunk = 60, type = 'outros' },






	[GetHashKey('sadler')] = { model = 'sadler', price = 110000, banned = false, name = 'Sadler', trunk = 70, type = 'vip' },
	[GetHashKey('hellion')] = { model = "hellion", price = 800000, banned = false, name = "Hellion", trunk = 70, type = 'vip' },
	[GetHashKey('novak')] = { model = "novak", price = 800000, banned = false, name = "Novak", trunk = 70, type = 'vip' },
	[GetHashKey('rebla')] = { model = 'rebla', price = 800000, banned = false, name = 'Rebla', trunk = 70, type = 'vip' },
	
	     --CAROS ANTIGOS 
	[GetHashKey('bfinjection')] = { model = 'bfinjection', price = 60000, banned = false, name = 'Bfinjection', trunk = 70, type = 'vip' },
	[GetHashKey('bifta')] = { model = 'bifta', price = 800000, banned = false, name = 'Bifta', trunk = 70, type = 'outros' },
	[GetHashKey('bodhi2')] = { model = 'bodhi2', price = 900000, banned = false, name = 'Bodhi2', trunk = 70, type = 'outos' },
	[GetHashKey('trophytruck')] = { model = 'trophytruck', price = 2000000, banned = false, name = 'Trophytruck', trunk = 70, type = 'vip' },
	[GetHashKey('trophytruck2')] = { model = 'trophytruck2', price = 2000000, banned = false, name = 'Trophytruck2', trunk = 70, type = 'vip' },
	[GetHashKey('dubsta3')] = { model = 'dubsta3', price = 5000000, banned = false, name = 'Dubsta3', trunk = 70, type = 'outros' },
	[GetHashKey('mesa3')] = { model = 'mesa3', price = 110000, banned = false, name = 'Mesa3', trunk = 70, type = 'outros' },
	[GetHashKey('rancherxl')] = { model = 'rancherxl', price = 200000, banned = false, name = 'Rancherxl', trunk = 70, type = 'outros' },
	[GetHashKey('rebel2')] = { model = 'rebel2', price = 2000000, banned = false, name = 'Rebel2', trunk = 70, type = 'outros' },
	[GetHashKey('Rebel')] = { model = 'Rebel', price = 2000000, banned = false, name = 'Rebel', trunk = 70, type = 'outros' },
	[GetHashKey('RatLoader')] = { model = 'RatLoader', price = 2500000, banned = false, name = 'RatLoader', trunk = 70, type = 'outros' },

	[GetHashKey('sandking')] = { model = 'sandking', price = 2500000, banned = false, name = 'Sandking', trunk = 70, type = 'outros' },
	[GetHashKey('baller')] = { model = 'baller', price = 110000, banned = false, name = 'Baller', trunk = 70, type = 'vip' },
	[GetHashKey('baller2')] = { model = 'baller2', price = 110000, banned = false, name = 'Baller2', trunk = 70, type = 'vip' },
	[GetHashKey('baller3')] = { model = 'baller3', price = 2000000, banned = false, name = 'Baller3', trunk = 70, type = 'vip' },
	[GetHashKey('baller4')] = { model = 'baller4', price = 2500000, banned = false, name = 'Baller4', trunk = 70, type = 'vip' },
	[GetHashKey('baller6')] = { model = 'baller6', price = 2000000, banned = false, name = 'Baller6', trunk = 70, type = 'vip' },
	[GetHashKey('bjxl')] = { model = 'bjxl', price = 110000, banned = false, name = 'Bjxl', trunk = 70, type = 'vip' },
	[GetHashKey('cavalcade')] = { model = 'cavalcade', price = 500000, banned = false, name = 'Cavalcade', trunk = 70, type = 'vip' },
	[GetHashKey('cavalcade2')] = { model = 'cavalcade2', price = 200000, banned = false, name = 'Cavalcade2', trunk = 70, type = 'vip' },
	[GetHashKey('contender')] = { model = 'contender', price = 7000000, banned = false, name = 'Contender', trunk = 70, type = 'vip' },
	[GetHashKey('dubsta')] = { model = 'dubsta', price = 110000, banned = false, name = 'Dubsta', trunk = 70, type = 'vip' },
	[GetHashKey('dubsta2')] = { model = 'dubsta2', price = 2000000, banned = false, name = 'Dubsta2', trunk = 70, type = 'vip' },
	[GetHashKey('fq2')] = { model = 'fq2', price = 400000, banned = false, name = 'Fq2', trunk = 70, type = 'vip' },
	[GetHashKey('granger')] = { model = 'granger', price = 600000, banned = false, name = 'Granger', trunk = 70, type = 'vip' },
	[GetHashKey('gresley')] = { model = 'gresley', price = 300000, banned = false, name = 'Gresley', trunk = 70, type = 'vip' },
	[GetHashKey('habanero')] = { model = 'habanero', price = 220000, banned = false, name = 'Habanero', trunk = 70, type = 'vip' },
	[GetHashKey('seminole')] = { model = 'seminole', price = 230000, banned = false, name = 'Seminole', trunk = 70, type = 'vip' },
	[GetHashKey('seminole2')] = { model = 'seminole2', price = 800000, banned = false, name = 'Seminole 2', trunk = 70, type = 'vip' },
	[GetHashKey('serrano')] = { model = 'serrano', price = 250000, banned = false, name = 'Serrano', trunk = 70, type = 'vip' },
	[GetHashKey('xls')] = { model = 'xls', price = 400000, banned = false, name = 'Xls', trunk = 70, type = 'vip' },
	[GetHashKey('issi8')] = { model = 'issi8', price = 400000, banned = false, name = 'issi8', trunk = 70, type = 'vip' },
	[GetHashKey('youga2')] = { model = 'youga2', price = 750000, banned = false, name = 'Youga2', trunk = 70, type = 'vip' },
	[GetHashKey('huntley')] = { model = 'huntley', price = 400000, banned = false, name = 'Huntley', trunk = 70, type = 'vip' },
	[GetHashKey('landstalker')] = { model = 'landstalker', price = 600000, banned = false, name = 'Landstalker', trunk = 70, type = 'vip' },
	[GetHashKey('landstalker2')] = { model = 'landstalker2', price = 800000, banned = false, name = 'Landstalker 2', trunk = 70, type = 'vip' },
	[GetHashKey('mesa')] = { model = 'mesa', price = 400000, banned = false, name = 'Mesa', trunk = 70, type = 'vip' },
	[GetHashKey('patriot')] = { model = 'patriot', price = 800000, banned = false, name = 'Patriot', trunk = 70, type = 'vip' },
	[GetHashKey('radi')] = { model = 'radi', price = 300000, banned = false, name = 'Radi', trunk = 70, type = 'vip' },
	[GetHashKey('rocoto')] = { model = 'rocoto', price = 110000, banned = false, name = 'Rocoto', trunk = 70, type = 'vip' },
	[GetHashKey('guardian')] = { model = 'guardian', price = 5000000, banned = false, name = 'Guardian', trunk = 70, type = 'vip' },
	[GetHashKey('kamacho')] = { model = 'kamacho', price = 110000, banned = false, name = 'Kamacho', trunk = 70, type = 'vip' },
	[GetHashKey('patriot2')] = { model = 'patriot2', price = 5000000, banned = false, name = 'Patriot2', trunk = 70, type = 'vip' },
	[GetHashKey('freecrawler')] = { model = 'freecrawler', price = 900000, banned = false, name = 'Freecrawler', trunk = 70, type = 'vip' },
	[GetHashKey('toros')] = { model = 'toros', price = 5000000, banned = false, name = 'Toros', trunk = 70, type = 'vip' },
	 

--LOJA VIP 
	----------------------------------------------------------------------------------------------------------------------------------------------------
	--[[HELIS VIPS]]--
[GetHashKey('supervolito')] = { model = 'supervolito', price = 500000, banned = false, name = 'Supervolito', trunk = 150, type = 'vip' },
[GetHashKey('supervolito2')] = { model = 'supervolito2', price = 500000, banned = false, name = 'Supervolito 2', trunk = 150, type = 'vip' },
[GetHashKey('volatus')] = { model = 'volatus', price = 500000, banned = false, name = 'Volatus', trunk = 150, type = 'vip' },
[GetHashKey('swift2')] = { model = 'swift2', price = 500000, banned = false, name = 'Swift2', trunk = 150, type = 'vip' },

	--[[CAMINHOES VIPS]]--
[GetHashKey('mule')] = { model = 'mule', price = 100000000, banned = false, name = 'Mule', trunk = 1000, type = 'outros' },
[GetHashKey('benson')] = { model = "benson", price = 5000000, banned = false, name = "Benson", trunk = 1000, type = 'vip' },
[GetHashKey('mule4')] = { model = 'mule4', price = 4000000, banned = false, name = 'Mule 4', trunk = 2000, type = 'vip' },
[GetHashKey('pounder')] = { model = 'pounder', price = 4000000, banned = false, name = 'Pounder', trunk = 1500, type = 'vip' },
[GetHashKey('pounder2')] = { model = 'pounder2', price = 4000000, banned = false, name = 'Pounder2', trunk = 3000, type = 'vip' },
[GetHashKey('RallyTruck')] = { model = 'RallyTruck', price = 800000, banned = false, name = 'RallyTruck', trunk = 2000, type = 'vip' }, 
[GetHashKey('Terbyte')] = { model = 'Terbyte ', price = 500000, banned = false, name = 'Terbyte', trunk = 2000, type = 'vip' },-- porta malas bugado 50 kilos 
[GetHashKey('brickade')] = { model = 'brickade ', price = 500000, banned = false, name = 'brickade', trunk = 5000, type = 'vip' },--portas mala bugado 50 kilos 



--[[ BLINDADOS  VIPS ]]--
[GetHashKey('rumpo3')] = { model = 'rumpo3', price = 2000000, banned = false, name = 'Rumpo3', trunk = 120, type = 'vip' },




-------------------------------------------------------------------------------------------------------------------------------------------------------
----[ CARROS DA LOJA VIP ]-------------------------------
---------------------------------------------------------------

--------------CATEGORIA CARROS  EXCLUSIVO
[GetHashKey('xxxxx')] = { model = 'xxxxx', price = 500000, banned = false, name = 'ClasseX', trunk = 500, type = 'vip' }, --
[GetHashKey('weevil')] = { model = 'weevil', price = 500000, banned = false, name = 'weevil', trunk = 300, type = 'vip' },
[GetHashKey('noire19wb')] = { model = 'noire19wb', price = 500000, banned = false, name = 'BUGATTE', trunk = 300, type = 'vip' },
[GetHashKey('dodgeram2500')] = { model = 'dodgeram2500', price = 500000, banned = false, name = 'dodgeram2500', trunk = 600, type = 'vip' },
[GetHashKey('kuruma2')] = { model = "kuruma2", price = 3000000, banned = false, name = 'Kuruma 2', trunk = 160, type = 'vip' },
[GetHashKey('rmodp1gtr')] = { model = 'rmodp1gtr', price = 500000, banned = false, name = 'P1 Gtr', trunk = 160, type = 'vip' },
[GetHashKey('bmwm5cs')] = { model = 'bmwm5cs', price = 500000, banned = false, name = 'bmwm5cs', trunk = 160, type = 'vip' },
[GetHashKey('bmwm5f90')] = { model = 'bmwm5f90', price = 500000, banned = false, name = 'bmwm5f90', trunk = 160, type = 'vip' },
[GetHashKey('teslaprior')] = { model = 'teslaprior', price = 500000, banned = false, name = 'teslaprior', trunk = 160, type = 'vip' },
[GetHashKey('l200')] = { model = 'l200', price = 500000, banned = false, name = 'l200', trunk = 300, type = 'vip' },
[GetHashKey('urus')] = { model = 'urus', price = 500000, banned = false, name = 'urus', trunk = 60, type = 'vip' },
[GetHashKey('rmodx6')] = { model = 'rmodx6', price = 1000000, banned = false, name = 'Bmw X6', trunk = 200, type = 'vip' },
[GetHashKey('X6MF96MC')] = { model = 'X6MF96MC', price = 500000, banned = false, name = 'Bmw X6 FAC', trunk = 200, type = 'vip' },
[GetHashKey('q8prior')] = { model = 'q8prior', price = 500000, banned = false, name = 'Audi Q8', trunk = 200, type = 'vip' },
[GetHashKey('amarokreb')] = { model = 'amarokreb', price = 500000, banned = false, name = 'Amarok Com Som', trunk = 60, type = 'vip' },
[GetHashKey('hilux2019')] = { model = 'hilux2019', price = 500000, banned = false, name = 'hilux2019', trunk = 160, type = 'vip' },
-- [GetHashKey('golf7gti')] = { model = 'golf7gti', price = 500000, banned = false, name = 'golf7gti', trunk = 90, type = 'vip' },
[GetHashKey('rs6wb')] = { model = 'rs6wb', price = 2000000, banned = false, name = 'Brabus Rs6', trunk = 200, type = 'vip' },
[GetHashKey('jeepcherokee')] = { model = 'jeepcherokee', price = 500000, banned = false, name = 'Jeep Cherok', trunk = 600, type = 'vip' },
[GetHashKey('foxct')] = { model = 'foxct', price = 500000, banned = false, name = 'Tesla Cybertruck', trunk = 300, type = 'vip' },
[GetHashKey('panamera17turbo')] = { model = 'panamera17turbo', price = 500000, banned = false, name = 'Panamera Turbo', trunk = 160, type = 'vip' },
[GetHashKey('lancer')] = { model = 'lancer', price = 500000, banned = false, name = 'Lancer Rebaixado', trunk = 160, type = 'vip'},
[GetHashKey('lancerevolutionx')] = { model = 'lancerevolutionx', price = 500000, banned = false, name = 'Lancer Evolutionx', trunk = 160, type = 'vip'},
[GetHashKey('nissan370z')] = { model = 'nissan370z', price = 500000, banned = false, name = 'Nissan 370z', trunk = 160, type = 'vip'},
[GetHashKey('f250deboxe')] = { model = 'f250deboxe', price = 500000, banned = false, name = 'f250deboxe', trunk = 160, type = 'vip'},
[GetHashKey('22caygt')] = { model = '22caygt', price = 500000, banned = false, name = 'Porsche Macan', trunk = 450, type = 'vip'},

[GetHashKey('s10hc')] = { model = 's10hc', price = 500000, banned = false, name = 'S10 s10ag', trunk = 100, type = 'vip' },
[GetHashKey('s10ag')] = { model = 's10ag', price = 500000, banned = false, name = 'S10 Country', trunk = 100, type = 'vip' },

[GetHashKey('bmwm1wb')] = { model = 'bmwm1wb', price = 500000, banned = false, name = 'Bmw M1 WB', trunk = 160, type = 'vip' },
[GetHashKey('kuruma2')] = { model = "kuruma2", price = 3000000, banned = false, name = 'Kuruma 2', trunk = 160, type = 'vip' },
[GetHashKey('mercxclass')] = { model = 'mercxclass', price = 500000, banned = false, name = 'Mercedes Classe', trunk = 200, type = 'vip' },
[GetHashKey('divo')] = { model = 'divo', price = 500000, banned = false, name = 'Bugatti Divo', trunk = 160, type = 'vip' },
[GetHashKey('18velar')] = { model = '18velar', price = 500000, banned = false, name = 'Land Rover Velar', trunk = 400, type = 'vip' },
[GetHashKey('evoque')] = { model = 'evoque', price = 500000, banned = false, name = 'Land Rover Evoque', trunk = 400, type = 'vip' },
[GetHashKey('bmwg07')] = { model = 'bmwg07', price = 500000, banned = false, name = 'Bmw X7 2021', trunk = 400, type = 'vip' },
[GetHashKey('ram226x6')] = { model = 'ram226x6', price = 500000, banned = false, name = 'Ram 6x6', trunk = 800, type = 'vip' },
[GetHashKey('NOIRE19WB')] = { model = 'NOIRE19WB', price = 500000, banned = false, name = 'Bugatti Noire', trunk = 160, type = 'vip' },
[GetHashKey('ETRONGT22PRIOR')] = { model = 'ETRONGT22PRIOR', price = 500000, banned = false, name = 'Audi E-TRON GT', trunk = 160, type = 'vip' },
[GetHashKey('teslax')] = { model = 'teslax', price = 500000, banned = false, name = 'Tesla Model X', trunk = 160, type = 'vip' },
[GetHashKey('X7M60I')] = { model = 'X7M60I', price = 500000, banned = false, name = 'X7 M60I', trunk = 500, type = 'vip' },
[GetHashKey('wrlwcla45')] = { model = 'wrlwcla45', price = 500000, banned = false, name = 'A45 Libert Walk', trunk = 160, type = 'vip' },
[GetHashKey('rmodmi8lb')] = { model = 'rmodmi8lb', price = 500000, banned = false, name = 'Bmw I8E', trunk = 160, type = 'vip' },
[GetHashKey('s15lbwk')] = { model = 'foxct', price = 500000, banned = false, name = 'S15 Libert Walk', trunk = 160, type = 'vip' },
[GetHashKey('760IG70')] = { model = '760IG70', price = 500000, banned = false, name = 'Bmw 760i', trunk = 160, type = 'vip' },
[GetHashKey('S500W223')] = { model = 'S500W223', price = 500000, banned = false, name = 'Mercedes S500', trunk = 160, type = 'vip'},
[GetHashKey('etrongt22')] = { model = 'etrongt22', price = 500000, banned = false, name = 'Audi GT Prior', trunk = 160, type = 'vip'},
[GetHashKey('S63EW223')] = { model = 'S63EW223', price = 500000, banned = false, name = 'Mercedes S63', trunk = 160, type = 'vip'},

	--[[VEÍCULOS VELOZES NOVOS BLACK CAR ]]--
[GetHashKey('rmodskyline34')] = { model = "rmodskyline34", price = 500000, banned = false, name = 'Skyline R34', trunk = 60, type = 'vip' },
[GetHashKey('r34bluedragon')] = { model = "r34bluedragon", price = 500000, banned = false, name = 'Skyline R34 Blue', trunk = 60, type = 'vip' },
[GetHashKey('r34bluedragonmini')] = { model = "r34bluedragonmini", price = 500000, banned = false, name = 'dragonmini', trunk = 60, type = 'vip' },
[GetHashKey('cg160')] = { model = "cg160", price = 500000, banned = false, name = 'cg160', trunk = 60, type = 'vip' },
[GetHashKey('pop110')] = { model = "pop110", price = 500000, banned = false, name = 'pop110', trunk = 60, type = 'vip' },
[GetHashKey('r34reddragon')] = { model = "r34reddragon", price = 500000, banned = false, name = 'r34reddragon', trunk = 60, type = 'vip' },
[GetHashKey('s15nihilpink')] = { model = "s15nihilpink", price = 500000, banned = false, name = 's15nihilpink', trunk = 60, type = 'vip' },
[GetHashKey('s15nihilpurple')] = { model = "s15nihilpurple", price = 500000, banned = false, name = 's15nihilpurple', trunk = 160, type = 'vip' },
[GetHashKey('s15nihilred')] = { model = "s15nihilred", price = 500000, banned = false, name = 's15nihilred', trunk = 60, type = 'vip' },
[GetHashKey('s15nihilwhite')] = { model = "s15nihilwhite", price = 500000, banned = false, name = 's15nihilwhite', trunk = 60, type = 'vip' },
[GetHashKey('r34whitedragon')] = { model = "r34whitedragon", price = 500000, banned = false, name = 'r34whitedragon', trunk = 60, type = 'vip' },
[GetHashKey('xre300')] = { model = "xre300", price = 500000, banned = false, name = 'xre300', trunk = 60, type = 'vip' },
--motos vips
[GetHashKey('xre3')] = { model = "xre3", price = 500000, banned = false, name = 'xre3', trunk = 60, type = 'vip' },


--velozes e furioses 
[GetHashKey('rmodf12tdf')] = { model = "rmodf12tdf", price = 500000, banned = false, name = 'Ferari Italia', trunk = 160, type = 'vip' },
[GetHashKey('fnflan')] = { model = 'fnflan', price = 500000, banned = false, name = 'Mitsubishi Lancer Evolution IX GSR', trunk = 160, type = 'vip'},
[GetHashKey('ff4wrx')] = { model = 'ff4wrx', price = 500000, banned = false, name = 'Subaru Impreza Fast and Furious', trunk = 160, type = 'vip'},
[GetHashKey('2f2fmk4')] = { model = '2f2fmk4', price = 500000, banned = false, name = 'Toyota Supra Fast and Furious', trunk = 160, type = 'vip'},
[GetHashKey('fnfmk4')] = { model = 'fnfmk4', price = 500000, banned = false, name = 'Toyota Supra Fast and Furious 2', trunk = 160, type = 'vip'},
--[GetHashKey('fnfmits')] = { model = 'fnfmits', price = 500000, banned = false, name = 'Mitsubishi Eclipse do Brian', trunk = 160, type = 'vip'},
[GetHashKey('fnfrx7')] = { model = 'fnfrx7', price = 500000, banned = false, name = 'Mazda RX7 do Han', trunk = 160, type = 'vip'},
[GetHashKey('2F2FGTS')] = { model = '2F2FGTS', price = 500000, banned = false, name = 'Eclipse Tokyo', trunk = 160, type = 'vip'},
[GetHashKey('2f2fgts')] = { model = '2f2fgts', price = 500000, banned = false, name = 'Mitsubishi Spyder do Roman', trunk = 160, type = 'vip'},
[GetHashKey('ACURA2F2F')] = { model = 'ACURA2F2F', price = 500000, banned = false, name = 'Acura 2f2f Tokyo', trunk = 160, type = 'vip'},
[GetHashKey('2F2FS2000')] = { model = '2F2FS2000', price = 500000, banned = false, name = 'S200 Tokyo', trunk = 160, type = 'vip'},
[GetHashKey('2F2FRX7')] = { model = '2F2FRX7', price = 500000, banned = false, name = 'Rx7 Tokyo', trunk = 160, type = 'vip'},
------------------------------------------------------------------------------------------------------------------------------------------
---CATEGORIA MOTOS VIPS-----------------------

[GetHashKey('africat')] = { model = "africat", price = 500000, banned = false, name = 'africat', trunk = 80, type = 'vip' },
[GetHashKey('tiger')] = { model = 'tiger', price = 500000, banned = false, name = 'tiger', trunk = 80, type = 'vip'},
[GetHashKey('dm1200')] = { model = 'dm1200', price = 500000, banned = false, name = 'dm1200', trunk = 80, type = 'vip'},
[GetHashKey('gsxr')] = { model = 'gsxr', price = 500000, banned = false, name = 'Gsxr Suzuki', trunk = 80, type = 'vip'},
[GetHashKey('cb650r')] = { model = 'cb650r', price = 500000, banned = false, name = 'Cb650r', trunk = 80, type = 'vip'},
[GetHashKey('fz07')] = { model = 'fz07', price = 500000, banned = false, name = 'MT 07', trunk = 80, type = 'vip'},
[GetHashKey('pcx')] = { model = 'pcx', price = 500000, banned = false, name = 'pcx', trunk = 80, type = 'vip'},
[GetHashKey('xtgang')] = { model = 'xtgang', price = 500000, banned = false, name = 'XT 66', trunk = 80, type = 'vip'},
[GetHashKey('150agstore')] = { model = '150agstore', price = 500000, banned = false, name = 'Titan 150', trunk = 80, type = 'vip'},
[GetHashKey('africaagstore')] = { model = 'africaagstore', price = 500000, banned = false, name = 'Africa Twin', trunk = 80, type = 'vip'},
[GetHashKey('xreagstore')] = { model = 'xreagstore', price = 500000, banned = false, name = 'Xre 300', trunk = 80, type = 'vip'},
[GetHashKey('r1')] = { model = 'r1', price = 500000, banned = false, name = 'Yamaha R1', trunk = 80, type = 'vip'},
[GetHashKey('ninjazx10')] = { model = "ninjazx10", price = 500000, banned = false, name = 'NinZja x10r', trunk = 80, type = 'vip' },
[GetHashKey('hayabusa')] = { model = 'hayabusa', price = 500000, banned = false, name = 'hayabusa', trunk = 80, type = 'vip'},
[GetHashKey('z1000')] = { model = 'z1000', price = 500000, banned = false, name = 'z1000', trunk = 80, type = 'vip'},
[GetHashKey('f4rr')] = { model = 'f4rr', price = 500000, banned = false, name = 'Mv Agusta F4', trunk = 80, type = 'vip'},
[GetHashKey('f850')] = { model = 'f850', price = 500000, banned = false, name = 'f850', trunk = 80, type = 'vip'},
[GetHashKey('sxr')] = { model = 'sxr', price = 500000, banned = false, name = 'Bmw XR', trunk = 80, type = 'vip'},
[GetHashKey('tenere1200')] = { model = 'tenere1200', price = 500000, banned = false, name = 'Tenere 1200', trunk = 80, type = 'vip'},
[GetHashKey('gs2013')] = { model = 'gs2013', price = 500000, banned = false, name = 'Bmw GS R1200', trunk = 80, type = 'vip'},
[GetHashKey('km1000rr')] = { model = 'km1000rr', price = 500000, banned = false, name = 'M1000 RR', trunk = 80, type = 'vip'},
[GetHashKey('yzfr7')] = { model = 'yzfr7', price = 500000, banned = false, name = 'yzfr7', trunk = 80, type = 'vip'},
[GetHashKey('hornet2010')] = { model = 'hornet2010', price = 500000, banned = false, name = 'hornet2010', trunk = 80, type = 'vip'},
[GetHashKey('hornet')] = { model = 'hornet', price = 500000, banned = false, name = 'hornet', trunk = 80, type = 'vip'},
[GetHashKey('r1200gs')] = { model = 'r1200gs', price = 500000, banned = false, name = 'r1200gs', trunk = 80, type = 'vip'},
[GetHashKey('r6')] = { model = 'r6', price = 500000, banned = false, name = 'r6', trunk = 80, type = 'vip'},
[GetHashKey('BMWS')] = { model = 'BMWS', price = 500000, banned = false, name = 'BMWS', trunk = 80, type = 'vip'},
[GetHashKey('s1000rr')] = { model = 's1000rr', price = 500000, banned = false, name = 's1000rr', trunk = 80, type = 'vip'},
[GetHashKey('sr1')] = { model = 'sr1', price = 500000, banned = false, name = 'BMWS100R', trunk = 80, type = 'vip'},
[GetHashKey('xre3')] = { model = 'xre3', price = 500000, banned = false, name = 'xre190', trunk = 80, type = 'vip'},


-------------------------------------novos sem cadastrar---------------------------------------------------------------------

[GetHashKey('22jeeplar')] = { model = '22jeeplar', price = 500000, banned = false, name = 'Jeep R22', trunk = 130, type = 'vip'},
[GetHashKey('24humevof')] = { model = '24humevof', price = 500000, banned = false, name = 'humevo', trunk = 130, type = 'vip'},
[GetHashKey('600lt')] = { model = '600lt', price = 500000, banned = false, name = 'Mec laren', trunk = 130, type = 'vip'},
[GetHashKey('765spyder')] = { model = '765spyder', price = 500000, banned = false, name = '765spyder', trunk = 130, type = 'vip'},
[GetHashKey('a90pit')] = { model = 'a90pit', price = 500000, banned = false, name = 'a90pit', trunk = 130, type = 'vip'},
[GetHashKey('a452')] = { model = 'a452', price = 500000, banned = false, name = 'a452', trunk = 130, type = 'vip'},
[GetHashKey('amarok')] = { model = 'amarok', price = 500000, banned = false, name = 'amarok', trunk = 130, type = 'vip'},
[GetHashKey('armoredgle')] = { model = 'armoredgle', price = 500000, banned = false, name = 'armoredgle', trunk = 130, type = 'vip'},
[GetHashKey('audir6')] = { model = 'audir6', price = 500000, banned = false, name = 'audir6', trunk = 130, type = 'vip'},
[GetHashKey('benzsl63')] = { model = 'benzsl63', price = 500000, banned = false, name = 'AMG benzs l63', trunk = 130, type = 'vip'},
[GetHashKey('bmistralw16')] = { model = 'bmistralw16', price = 500000, banned = false, name = 'bmistralw16', trunk = 130, type = 'vip'},
[GetHashKey('bmwm5cs')] = { model = 'bmwm5cs', price = 500000, banned = false, name = 'BMW M5', trunk = 130, type = 'vip'},
[GetHashKey('a452')] = { model = 'a452', price = 500000, banned = false, name = 'AMG A45', trunk = 130, type = 'vip'},
[GetHashKey('btyperhodes')] = { model = 'btyperhodes', price = 500000, banned = false, name = 'btyperhodes', trunk = 130, type = 'vip'},
[GetHashKey('brabus900bs')] = { model = 'brabus900bs', price = 500000, banned = false, name = 'Brabus', trunk = 130, type = 'vip'},
[GetHashKey('c6w205')] = { model = 'c6w205', price = 500000, banned = false, name = 'c6w205', trunk = 130, type = 'vip'},
[GetHashKey('casup')] = { model = 'casup', price = 500000, banned = false, name = 'Toyota Supra', trunk = 130, type = 'vip'},
[GetHashKey('cb500x')] = { model = 'cb500x', price = 500000, banned = false, name = 'CB 500X', trunk = 80, type = 'vip'},
[GetHashKey('cbr17')] = { model = 'cbr17', price = 500000, banned = false, name = 'cbr17', trunk = 80, type = 'vip'},
[GetHashKey('contss18')] = { model = 'contss18', price = 500000, banned = false, name = 'contss18', trunk = 130, type = 'vip'},
[GetHashKey('dodgeram2500')] = { model = 'dodgeram2500', price = 500000, banned = false, name = 'RAM2500', trunk = 600, type = 'vip'},
[GetHashKey('evoque')] = { model = 'evoque', price = 500000, banned = false, name = 'Range Rover Evoque', trunk = 200, type = 'vip'},
[GetHashKey('foxgt2')] = { model = 'foxgt2', price = 500000, banned = false, name = 'Fox Gt2', trunk = 200, type = 'vip'},
[GetHashKey('foxsenna')] = { model = 'foxsenna', price = 500000, banned = false, name = 'Fox Gt2', trunk = 200, type = 'vip'},
[GetHashKey('fxxkevo')] = { model = 'fxxkevo', price = 500000, banned = false, name = 'Ferrari evo', trunk = 200, type = 'vip'},
[GetHashKey('golfag')] = { model = 'golfag', price = 500000, banned = false, name = 'Gol fag', trunk = 200, type = 'vip'},
[GetHashKey('golfmk6')] = { model = 'golfmk6', price = 500000, banned = false, name = 'golfmk6', trunk = 200, type = 'vip'},
[GetHashKey('gtb22')] = { model = 'gtb22', price = 500000, banned = false, name = 'Ferrari 296 GTB', trunk = 200, type = 'vip'},
[GetHashKey('gxgiulia')] = { model = 'gxgiulia', price = 500000, banned = false, name = 'ALFA ROMEU', trunk = 200, type = 'vip'},
[GetHashKey('h2carb')] = { model = 'h2carb', price = 500000, banned = false, name = 'Ninja HZ', trunk = 80, type = 'vip'},
[GetHashKey('ie')] = { model = 'ie', price = 500000, banned = false, name = 'ie', trunk = 200, type = 'vip'},
[GetHashKey('ksd')] = { model = 'ksd', price = 500000, banned = false, name = 'KTM', trunk = 80, type = 'vip'},
[GetHashKey('l200')] = { model = 'l200', price = 500000, banned = false, name = 'L200 Triton', trunk = 200, type = 'vip'},
[GetHashKey('lamborghinihuracan')] = { model = 'lamborghinihuracan', price = 500000, banned = false, name = 'lamborghinihuracan', trunk = 200, type = 'vip'},
[GetHashKey('lp700r')] = { model = 'lp700r', price = 500000, banned = false, name = 'Lamborghini LP700R', trunk = 200, type = 'vip'},
[GetHashKey('maseratif620')] = { model = 'maseratif620', price = 500000, banned = false, name = 'Maserati F620', trunk = 200, type = 'vip'},
[GetHashKey('maybachemperor')] = { model = 'maybachemperor', price = 500000, banned = false, name = 'Emperor', trunk = 200, type = 'vip'},
[GetHashKey('22hilux')] = { model = '22hilux', price = 500000, banned = false, name = 'Toyota Hilux', trunk = 200, type = 'vip'},
[GetHashKey('p1')] = { model = 'p1', price = 500000, banned = false, name = 'P1', trunk = 60, type = 'vip'},
[GetHashKey('pboxstergts')] = { model = 'pboxstergts', price = 500000, banned = false, name = 'boxster gts', trunk = 200, type = 'vip'},
[GetHashKey('pgt322')] = { model = 'pgt322', price = 500000, banned = false, name = 'Porsche 911', trunk = 200, type = 'vip'},
[GetHashKey('pistaspider19')] = { model = 'pistaspider19', price = 500000, banned = false, name = 'Ferrari 488 Spider', trunk = 200, type = 'vip'},
[GetHashKey('pm19')] = { model = 'pm19', price = 500000, banned = false, name = 'Macan Turbo', trunk = 200, type = 'vip'},
[GetHashKey('q8prior')] = { model = 'q8prior', price = 500000, banned = false, name = 'Audi prior', trunk = 200, type = 'vip'},
[GetHashKey('regera')] = { model = 'regera', price = 500000, banned = false, name = 'Regera', trunk = 200, type = 'vip'},

[GetHashKey('rmodessenza')] = { model = 'rmodessenza', price = 500000, banned = false, name = 'Modessenza', trunk = 200, type = 'vip'},
[GetHashKey('rmodlego1')] = { model = 'rmodlego1', price = 500000, banned = false, name = 'rmodlego1', trunk = 200, type = 'vip'},
[GetHashKey('rmodlego2')] = { model = 'rmodlego2', price = 500000, banned = false, name = 'Lego2', trunk = 200, type = 'vip'},
[GetHashKey('rmodlegosenna')] = { model = 'rmodlegosenna', price = 500000, banned = false, name = 'Legosenna', trunk = 200, type = 'vip'},
[GetHashKey('rmodm3e36')] = { model = 'rmodm3e36', price = 500000, banned = false, name = 'BMW M3', trunk = 200, type = 'vip'},
[GetHashKey('rmodmartin')] = { model = 'rmodmartin', price = 500000, banned = false, name = 'Martin', trunk = 200, type = 'vip'},
[GetHashKey('rmodmk7')] = { model = 'rmodmk7', price = 500000, banned = false, name = 'Gol', trunk = 200, type = 'vip'},
[GetHashKey('rmodsianr')] = { model = 'rmodsianr', price = 500000, banned = false, name = 'lamb Sian', trunk = 200, type = 'vip'},
[GetHashKey('s10ag')] = { model = 's10ag', price = 500000, banned = false, name = 'S10 AG', trunk = 200, type = 'vip'},
[GetHashKey('s10hc')] = { model = 's10hc', price = 500000, banned = false, name = 'S10 HC', trunk = 200, type = 'vip'},
[GetHashKey('s15lbwk')] = { model = 's15lbwk', price = 500000, banned = false, name = 's15lbwk', trunk = 200, type = 'vip'},
[GetHashKey('sclgt63s')] = { model = 'sclgt63s', price = 500000, banned = false, name = 'AMG GT63s', trunk = 200, type = 'vip'},
[GetHashKey('veneno')] = { model = 'veneno', price = 500000, banned = false, name = 'veneno', trunk = 200, type = 'vip'},
[GetHashKey('vwsava')] = { model = 'vwsava', price = 500000, banned = false, name = 'Saveiro Cross', trunk = 200, type = 'vip'},
[GetHashKey('xplaid24c')] = { model = 'xplaid24c', price = 500000, banned = false, name = 'TESLA MODEL X', trunk = 200, type = 'vip'},
[GetHashKey('xj6')] = { model = 'xj6', price = 500000, banned = false, name = 'Xj6', trunk = 200, type = 'vip'},


-----------------------------veiculos vip que foi para consce----------------------------------------------------------------
[GetHashKey('fox')] = { model = 'fox', price = 1500000, banned = false, name = 'fox', trunk = 130, type = 'vip'},
[GetHashKey('golf7gti')] = { model = 'golf7gti', price = 1500000, banned = false, name = 'golf7gti', trunk = 90, type = 'vip' },
[GetHashKey('survolt')] = { model = 'survolt', price = 1500000, banned = false, name = 'survolt', trunk = 160, type = 'vip' },
[GetHashKey('s15')] = { model = 's15', price = 1500000, banned = false, name = 's15', trunk = 160, type = 'vip' },
[GetHashKey('golg2')] = { model = 'golg2', price = 1500000, banned = false, name = 'golg2', trunk = 160, type = 'vip' },
[GetHashKey('fordfocus')] = { model = 'fordfocus', price = 1500000, banned = false, name = 'fordfocus', trunk = 160, type = 'vip' },
[GetHashKey('evo9')] = { model = 'evo9', price = 1500000, banned = false, name = 'evo9', trunk = 160, type = 'vip' },
[GetHashKey('er34n')] = { model = 'er34n', price = 1500000, banned = false, name = 'er34n', trunk = 160, type = 'vip' },
[GetHashKey('bmwz4')] = { model = 'bmwz4', price = 1500000, banned = false, name = 'bmwz4', trunk = 160, type = 'vip' },




-------------------------------------------------------------------------------------------------------------------------
-- CATEGORIA CARROS VIPS BASICO
[GetHashKey('maybachemperor')] = { model = "maybachemperor", price = 500000, banned = false, name = 'Maybach Emperor', trunk = 130, type = 'vip' },
[GetHashKey('kadett')] = { model = 'kadett', price = 500000, banned = false, name = 'kadett', trunk = 130, type = 'vip'},
[GetHashKey('rmodjesko')] = { model = 'rmodjesko', price = 500000, banned = false, name = 'Koeninhsegg', trunk = 130, type = 'vip'},
[GetHashKey('nissangtr')] = { model = 'nissangtr', price = 500000, banned = false, name = 'nissangtr', trunk = 130, type = 'vip'},
[GetHashKey('bmwm4gts')] = { model = 'bmwm4gts', price = 500000, banned = false, name = 'bmwm4gts', trunk = 130, type = 'vip'},
[GetHashKey('corvettec7')] = { model = 'corvettec7', price = 500000, banned = false, name = 'corvettec7', trunk = 130, type = 'vip'},
[GetHashKey('dodgecharger')] = { model = 'dodgecharger', price = 500000, banned = false, name = 'dodgecharger', trunk = 130, type = 'vip'},
[GetHashKey('ferrariitalia')] = { model = 'ferrariitalia', price = 500000, banned = false, name = 'ferrariitalia', trunk = 130, type = 'vip'},
[GetHashKey('rmodbacalar')] = { model = 'rmodbacalar', price = 500000, banned = false, name = 'Bacalar', trunk = 130, type = 'vip'},
[GetHashKey('fordmustang')] = { model = 'fordmustang', price = 500000, banned = false, name = 'fordmustang', trunk = 130, type = 'vip'},
[GetHashKey('lamborghinihuracan')] = { model = 'lamborghinihuracan', price = 500000, banned = false, name = 'lamborghinihuracan', trunk = 130, type = 'vip'},
[GetHashKey('nissanskyliner34')] = { model = 'nissanskyliner34', price = 500000, banned = false, name = 'nissanskyliner34', trunk = 130, type = 'vip'},
[GetHashKey('rmodf40')] = { model = "rmodf40", price = 500000, banned = false, name = 'Ferrari F40', trunk = 130, type = 'vip' },
[GetHashKey('rmodcamaro')] = { model = 'rmodcamaro', price = 500000, banned = false, name = 'Camaro 3.0', trunk = 130, type = 'vip'},
[GetHashKey('ferrari812')] = { model = 'ferrari812', price = 500000, banned = false, name = 'Ferrari 2020', trunk = 130, type = 'vip'},
[GetHashKey('rmodgtr50')] = { model = 'rmodgtr50', price = 500000, banned = false, name = 'Gtr 2020', trunk = 130, type = 'vip'},
[GetHashKey('mercedesgt63s')] = { model = 'mercedesgt63s', price = 500000, banned = false, name = 'mercedesgt63s', trunk = 130, type = 'vip'},
[GetHashKey('toyotasupra')] = { model = 'toyotasupra', price = 500000, banned = false, name = 'toyotasupra', trunk = 130, type = 'vip'},
[GetHashKey('bmwi8')] = { model = 'bmwi8', price = 500000, banned = false, name = 'bmwi8', trunk = 130, type = 'vip'},
[GetHashKey('dodgechallenger')] = { model = 'dodgechallenger', price = 500000, banned = false, name = 'dodgechallenger', trunk = 130, type = 'vip'},
-- [GetHashKey('fordfocus')] = { model = 'fordfocus', price = 500000, banned = false, name = 'fordfocus', trunk = 130, type = 'vip'},
[GetHashKey('bmwm8')] = { model = 'bmwm8', price = 500000, banned = false, name = 'bmwm8', trunk = 130, type = 'vip'},
[GetHashKey('subarubrz13')] = { model = 'subarubrz13', price = 500000, banned = false, name = 'subarubrz13', trunk = 130, type = 'vip'},
[GetHashKey('718b')] = { model = '718b', price = 500000, banned = false, name = 'Porsche 718B', trunk = 130, type = 'vip'},
[GetHashKey('911r')] = { model = '911r', price = 500000, banned = false, name = 'Porsche 911R', trunk = 130, type = 'vip'},
[GetHashKey('amggtc')] = { model = 'amggtc', price = 500000, banned = false, name = 'AMG CONVERSIVEL', trunk = 130, type = 'vip'},
[GetHashKey('fox720m')] = { model = 'fox720m', price = 500000, banned = false, name = 'Fox 720m', trunk = 130, type = 'vip'},

[GetHashKey('foxevo')] = { model = "foxevo", price = 500000, banned = false, name = 'Lambo Evo', trunk = 130, type = 'vip' },
[GetHashKey('audirs7')] = { model = 'audirs7', price = 500000, banned = false, name = 'audirs7', trunk = 130, type = 'vip'},
[GetHashKey('pistaspider19')] = { model = 'pistaspider19', price = 500000, banned = false, name = 'Ferrari Spider', trunk = 130, type = 'vip'},
[GetHashKey('rmodbentleygt')] = { model = 'rmodbentleygt', price = 500000, banned = false, name = 'Bent Leygt', trunk = 130, type = 'vip'},
[GetHashKey('rmodcharger69')] = { model = 'rmodcharger69', price = 500000, banned = false, name = 'Charger69', trunk = 130, type = 'vip'},
[GetHashKey('fnfrx7')] = { model = 'fnfrx7', price = 500000, banned = false, name = 'Mzda RX-7', trunk = 130, type = 'vip'},
-- [GetHashKey('fox')] = { model = 'fox', price = 500000, banned = false, name = 'fox', trunk = 130, type = 'vip'},
[GetHashKey('foxshelby')] = { model = 'foxshelby', price = 500000, banned = false, name = 'Mustang Shelby', trunk = 130, type = 'vip'},
[GetHashKey('lwgtr')] = { model = 'lwgtr', price = 500000, banned = false, name = 'Gtr Libert-Walk', trunk = 130, type = 'vip'},
[GetHashKey('bmwm5cs')] = { model = 'bmwm5cs', price = 500000, banned = false, name = 'bmwm5cs', trunk = 130, type = 'vip'},
[GetHashKey('rmod240sx')] = { model = 'rmod240sx', price = 500000, banned = false, name = 'rmod240sx', trunk = 130, type = 'vip'},
[GetHashKey('m3f80')] = { model = 'm3f80', price = 500000, banned = false, name = 'Bmw M3', trunk = 130, type = 'vip'},
[GetHashKey('nissantitan17')] = { model = "nissantitan17", price = 500000, banned = false, name = 'nissantitan17', trunk = 130, type = 'vip' },
[GetHashKey('21avant')] = { model = '21avant', price = 500000, banned = false, name = 'Audi Avant', trunk = 130, type = 'vip'},
[GetHashKey('D35')] = { model = 'D35', price = 500000, banned = false, name = 'D35', trunk = 130, type = 'vip'},
[GetHashKey('bora')] = { model = 'bora', price = 500000, banned = false, name = 'bora', trunk = 130, type = 'vip'},
[GetHashKey('saveiro')] = { model = 'saveiro', price = 500000, banned = false, name = 'saveiro', trunk = 130, type = 'vip'},
[GetHashKey('ftoro')] = { model = 'ftoro', price = 500000, banned = false, name = 'Fiat Toro', trunk = 130, type = 'vip'},
-- [GetHashKey('golg2')] = { model = 'golg2', price = 500000, banned = false, name = 'golg2', trunk = 130, type = 'vip'},
-- [GetHashKey('bmwz4')] = { model = 'bmwz4', price = 500000, banned = false, name = 'bmwz4', trunk = 130, type = 'vip'},
[GetHashKey('bmwm4gts')] = { model = 'bmwm4gts', price = 500000, banned = false, name = 'bmwm4gts', trunk = 130, type = 'vip'},
[GetHashKey('celta')] = { model = 'celta', price = 500000, banned = false, name = 'celta', trunk = 130, type = 'vip'},
[GetHashKey('jettagli')] = { model = 'jettagli', price = 500000, banned = false, name = 'Jetta GLI', trunk = 130, type = 'vip'},
[GetHashKey('volkssle')] = { model = 'volkssle', price = 500000, banned = false, name = 'volkssle', trunk = 130, type = 'vip'},
[GetHashKey('23ramlh')] = { model = '23ramlh', price = 500000, banned = false, name = '23ramlh', trunk = 130, type = 'vip'},
[GetHashKey('22530d')] = { model = '22530d', price = 500000, banned = false, name = '22530d', trunk = 130, type = 'vip'},
[GetHashKey('celtach')] = { model = 'celtach', price = 500000, banned = false, name = 'celtach', trunk = 80, type = 'vip'},


---CARROS FACS
[GetHashKey('amarokfac')] = { model = 'amarokfac', price = 500000, banned = false, name = 'amarokfac', trunk = 70, type = 'service'},
[GetHashKey('hondacgfac')] = { model = 'hondacgfac', price = 500000, banned = false, name = 'hondacgfac', trunk = 70, type = 'service'},
[GetHashKey('rmodjeep')] = { model = 'rmodjeep', price = 500000, banned = false, name = 'rmodjeepfac', trunk = 100, type = 'service'},

----CARROS SERVICO

---CARROS POLICIA
[GetHashKey('wrpajero')] = { model = 'wrpajero', price = 500000, banned = false, name = 'wrpajero', trunk = 100, type = 'service'},
[GetHashKey('wrcorollanew')] = { model = 'wrcorollanew', price = 500000, banned = false, name = 'wrcorollanew', trunk = 100, type = 'service'},
[GetHashKey('wrtrailblazer22')] = { model = 'wrtrailblazer22', price = 500000, banned = false, name = 'wrtrailblazer22', trunk = 100, type = 'service'},
[GetHashKey('wrranger23')] = { model = 'wrranger23', price = 500000, banned = false, name = 'wrranger23', trunk = 100, type = 'service'},
[GetHashKey('wrl200bope')] = { model = 'wrl200bope', price = 500000, banned = false, name = 'wrl200bope', trunk = 100, type = 'service'},
[GetHashKey('wrtahoe71')] = { model = 'wrtahoe71', price = 500000, banned = false, name = 'wrtahoe71', trunk = 100, type = 'service'},
[GetHashKey('wrcharger')] = { model = 'wrcharger', price = 500000, banned = false, name = 'wrcharger', trunk = 100, type = 'service'},
[GetHashKey('rangerpf')] = { model = 'rangerpf', price = 500000, banned = false, name = 'rangerpf', trunk = 100, type = 'service'},
[GetHashKey('riot')] = { model = 'riot', price = 500000, banned = false, name = 'riot', trunk = 100, type = 'service'},
[GetHashKey('wrstorm')] = { model = 'wrstorm', price = 500000, banned = false, name = 'wrstorm', trunk = 100, type = 'service'},
[GetHashKey('WRc7')] = { model = 'WRc7', price = 500000, banned = false, name = 'WRc7', trunk = 100, type = 'service'},
[GetHashKey('wrr1200')] = { model = 'wrr1200', price = 500000, banned = false, name = 'wrr1200', trunk = 100, type = 'service'},
[GetHashKey('wrm5')] = { model = 'wrm5', price = 500000, banned = false, name = 'wrm5', trunk = 100, type = 'service'},
[GetHashKey('wrjeeptrack')] = { model = 'wrjeeptrack', price = 500000, banned = false, name = 'wrjeeptrack', trunk = 100, type = 'service'},
[GetHashKey('wrimpala')] = { model = 'wrimpala', price = 500000, banned = false, name = 'wrimpala', trunk = 100, type = 'service'},
[GetHashKey('wrfocusrs')] = { model = 'wrfocusrs', price = 500000, banned = false, name = 'wrfocusrs', trunk = 100, type = 'service'},
[GetHashKey('wrduster22')] = { model = 'wrduster22', price = 500000, banned = false, name = 'wrduster22', trunk = 100, type = 'service'},
[GetHashKey('wrl200bope')] = { model = 'wrl200bope', price = 500000, banned = false, name = 'wrl200bope', trunk = 100, type = 'service'},
[GetHashKey('trailblazerpf')] = { model = 'trailblazerpf', price = 500000, banned = false, name = 'trailblazerpf', trunk = 100, type = 'service'},
[GetHashKey('trailblazerpf')] = { model = 'trailblazerpf', price = 500000, banned = false, name = 'trailblazerpf', trunk = 100, type = 'service'},
[GetHashKey('WRhmmwv')] = { model = 'WRhmmwv', price = 500000, banned = false, name = 'WRhmmwv', trunk = 100, type = 'service'},
[GetHashKey('WRcrusader')] = { model = 'WRcrusader', price = 500000, banned = false, name = 'WRcrusader', trunk = 100, type = 'service'},
[GetHashKey('ivecco')] = { model = 'iveco', price = 500000, banned = false, name = 'iveco', trunk = 100, type = 'service'},
[GetHashKey('maverick')] = { model = 'maverick', price = 500000, banned = false, name = 'iveco', trunk = 100, type = 'service'},
---VVIP BAU 
[GetHashKey(' benznatal')] = { model = ' benznatal', price = 500000, banned = false, name = ' benz natal', trunk = 1000, type = 'vip'},



---CARROS HOSPITAL
[GetHashKey('WRpolmav')] = { model = 'WRpolmav', price = 500000, banned = false, name = 'WRpolmav', trunk = 100, type = 'service'},
[GetHashKey('wrx6mf96')] = { model = 'wrx6mf96', price = 500000, banned = false, name = 'wrx6mf96', trunk = 100, type = 'service'},
[GetHashKey('wrsprinter22')] = { model = 'wrsprinter22', price = 500000, banned = false, name = 'wrsprinter22', trunk = 100, type = 'service'},
[GetHashKey('energyr1200samu')] = { model = 'energyr1200samu', price = 500000, banned = false, name = 'r1200 samu', trunk = 100, type = 'service'},
[GetHashKey('wr21hiluxcbm')] = { model = 'wr21hiluxcbm', price = 500000, banned = false, name = 'wr21hiluxcbm', trunk = 100, type = 'service'},
[GetHashKey('wrf850cbm')] = { model = 'wrf850cbm', price = 500000, banned = false, name = 'wrf850cbm', trunk = 100, type = 'service'},
[GetHashKey('wrhumevofcbm')] = { model = 'wrhumevofcbm', price = 500000, banned = false, name = 'wrhumevofcbm', trunk = 100, type = 'service'},
[GetHashKey('wrsprinter22cbm')] = { model = 'wrsprinter22cbm', price = 500000, banned = false, name = 'wrsprinter22cbm', trunk = 100, type = 'service'},
[GetHashKey('wrsw4cbm')] = { model = 'wrsw4cbm', price = 500000, banned = false, name = 'wrsw4cbm', trunk = 100, type = 'service'},
[GetHashKey('wrglecbm')] = { model = 'wrglecbm', price = 500000, banned = false, name = 'wrglecbm', trunk = 100, type = 'service'},
[GetHashKey('wras350cbm')] = { model = 'wras350cbm', price = 500000, banned = false, name = 'wras350cbm', trunk = 100, type = 'service'},

---CARROS MECANICAS
[GetHashKey('Kguinchomec')] = { model = 'Kguinchomec', price = 500000, banned = false, name = 'Kguinchomec', trunk = 100, type = 'service'},
[GetHashKey('Khelimec')] = { model = 'Khelimec', price = 500000, banned = false, name = 'Khelimec', trunk = 100, type = 'service'},
[GetHashKey('Ksierramec')] = { model = 'Ksierramec', price = 500000, banned = false, name = 'Ksierramec', trunk = 100, type = 'service'},
[GetHashKey('Kteneremec')] = { model = 'Kteneremec', price = 500000, banned = false, name = 'Kteneremec', trunk = 100, type = 'service'},






---CARROS JURIDICO
[GetHashKey('x6oab')] = { model = 'x6oab', price = 500000, banned = false, name = 'x6oab', trunk = 100, type = 'service'},
[GetHashKey('jettaoab')] = { model = 'jettaoab', price = 500000, banned = false, name = 'jettaoab', trunk = 100, type = 'service'},
[GetHashKey('energy_volito')] = { model = 'energy_volito', price = 500000, banned = false, name = 'energy_volito', trunk = 100, type = 'service'},

--CARROS MEC RIDE OUT--CUSTOMS
[GetHashKey('energyguinchoride')] = { model = 'energyguinchoride', price = 500000, banned = false, name = 'energyguinchoride', trunk = 100, type = 'service'},
[GetHashKey('energyheliride')] = { model = 'energyheliride', price = 500000, banned = false, name = 'energyheliride', trunk = 100, type = 'service'},
[GetHashKey('energysierraride')] = { model = 'energysierraride', price = 500000, banned = false, name = 'energysierraride', trunk = 100, type = 'service'},
[GetHashKey('energytenereride')] = { model = 'energytenereride', price = 500000, banned = false, name = 'energytenereride', trunk = 100, type = 'service'},

[GetHashKey('blindadopmerj')] = { model = 'blindadopmerj', price = 500000, banned = false, name = 'blindadopmerj', trunk = 100, type = 'service'},
[GetHashKey('blindadoturq')] = { model = 'blindadoturq', price = 500000, banned = false, name = 'blindadoturq', trunk = 100, type = 'service'},



}


garagesConfig.garageList = {
	[1] = {
		type = 'public',
		blip = true,
		coords = vec3(-399.32, 1217.33, 325.96),---decida do cristo 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-394.85, 1215.8, 325.56), h = 161.58},
			[2] = {vec3(-404.14, 1218.23, 325.56), h = 161.58}
		}
	},
	[2] = {
		type = 'service',
		blip = true,
		coords = vec3(-1714.07,136.66,64.37),--novo aguia pmerj
		perm = 'perm.policia ',
		vehiclePositions = {
			[1] = {vec3(-1304.26,275.97,63.42), h = 37.489},
		},
		vehicles = {
			{vehicle = 'fenixpmerj', modelo = 'fenixpmerj'},
	
		}
	},

	[3] = {
		type = 'service',
		coords = vec3(-2468.1,3322.75,33.16),--EB--EB----------------------------EB--TERREMO 
		perm = 'perm.policia',
		vehiclePositions = {
			[1] = {vec3(-2468.72,3320.04,32.5), h = 238.98},
			[2] = {vec3(-1307.84,278.51,63.41), h = 238.98}
		},
		vehicles = {
			{vehicle = 'wrranger23ebc', modelo = 'wrranger23ebc'},
			{vehicle = 'wrranger23eb', modelo = ',wrranger23eb'},
			{vehicle = 'amarokeb', modelo = 'amarokeb'},
			{vehicle = 's10eb', modelo = 's10eb'},
			{vehicle = 'sw4eb', modelo = 'sw4eb'},
			{vehicle = 'trail19eb', modelo = 'trail19eb'},
			{vehicle = 'trail21eb', modelo = 'xrtrail21eb'},
			{vehicle = 'xregeb', modelo = ',xregeb'}
		}
	},

	[4] = {
		type = 'service',
		coords = vec3(-2409.03,3270.27,42.23),--EB--EB----------------------------EB---HELI--HELI
		perm = 'perm.policia',
		vehiclePositions = {
			[1] = {vec3(-2385.46,3298.45,42.61), h = 329.78},
		},
		vehicles = {
			{vehicle = 'uh1exercito', modelo = 'uh1exercito'}

		}
	},
	[5] = {
		type = 'service',
		coords = vec3(-2381.47,3321.25,33.04),--EB--EB----------------------------EB--CAMINHAO 
		perm = 'perm.policia',
		vehiclePositions = {
			[1] = {vec3(-2402.82,3335.4,32.4), h = 239.17},
			[2] = {vec3(-2399.55,3339.2,32.4), h = 239.17}
		},
		vehicles = {
			{vehicle = 'Barracks', modelo = 'Barracks'},
			{vehicle = 'wr5ton', modelo = 'wr5ton'},
			{vehicle = 'WRhmmwv', modelo = 'WRhmmwv'},----policia EB
			{vehicle = 'WRcrusader', modelo = 'WRcrusader'}
		}
	},


	-- [9] = {
	-- 	type = 'service',
	-- 	coords = vec3(-252.36,1542.74,338.61),---BLINDADOS BOPE
	-- 	perm = 'perm.policia',
	-- 	vehiclePositions = {
	-- 		[1] = {vec3(-228.67,1535.64,335.78), h = 90.50}
	-- 	},
	-- 	vehicles = {
	-- 		{vehicle = 'blindadopmerj', modelo = 'blindadopmerj'},
	-- 	}
	-- },
	[6] = {
		type = 'service',
		coords = vec3(-1634.3,205.21,60.59),
		perm = 'perm.pmerj',
		vehiclePositions = {
			[1] = {vec3(-1629.2,200.93,59.75), h = 293.30},
			[2] = {vec3(-1627.45,196.95,59.72), h = 293.30}
		},
		vehicles = {
			{vehicle = 'WRc7', modelo = 'WRc7'},
			{vehicle = 'wrcorollanew', modelo = 'Toyota Corolla'},
			{vehicle = 'wrtrailblazer22', modelo = 'Chevrolet TrailBlazer'},---pmerj foi comprada ja -okokoko
			{vehicle = 'wrduster22', modelo = 'Renault Duster'},
			{vehicle = 'wrranger23', modelo = 'Ford Ranger'},
			{vehicle = 'wrl200bope', modelo = 'Mitsubishi L200'},
			{vehicle = 'wrmustang', modelo = 'Ford Mustang'},
			{vehicle = 'wrfocusrs', modelo = 'Ford Focus RS'},
			{vehicle = 'wrimpala', modelo = 'Chevrolet Impala'},
			{vehicle = 'wrjeeptrack', modelo = 'Jeep Trackhawk'},
			{vehicle = 'wrm5', modelo = 'BMW M5'},
			{vehicle = 'wrr1200', modelo = 'BMW R1200'}
		}
	},
	[7] = {
		type = 'service',
		coords = vec3(-1632.89,202.42,60.56),
		perm = 'perm.pmerj',
		vehiclePositions = {
			[1] = {vec3(-1626.18,193.35,59.88), h = 293.30},
			[2] = {vec3(-1624.86,189.91,59.85), h = 293.30}
		},
		vehicles = {
			{vehicle = 'hiluxgam', modelo = 'hiluxgam'},
			{vehicle = 'hiluxpmerj', modelo = 'hiluxpmerj'},
			{vehicle = 'hiluxrecom', modelo = 'hiluxrecom'},---pmerj CARROS NOVOS---pmerj --comprada 
			{vehicle = 'hiluxcpam', modelo = 'hiluxcpam'},
			{vehicle = 'hiluxbprv', modelo = 'hiluxbprv'}
		}
	},
	[8] = {
		type = 'service',
		coords = vec3(-2403.24,3267.16,42.23),
		perm = 'perm.policia',
		vehiclePositions = {
			[1] = {vec3(-2395.76,3280.3,42.61), h = 167.25},
			[2] = {vec3(-2385.09,3299.25,42.61), h = 167.25},
		},
		vehicles = {
			{vehicle = 'Valkyrie2', modelo = 'Valkyrie2'},
			{vehicle = 'Savage', modelo = 'Savage'},
			{vehicle = 'Cargobob', modelo = 'Cargobob'},---EXERCITO HELI
			{vehicle = 'eb350', modelo = 'eb350'}
		}
	},
	[9] = {
		type = 'service',
		coords = vec3(-2669.93,3278.35,32.81),--AVIAO EB---PISTA 
		perm = 'perm.policia',
		vehiclePositions = {
			[1] = {vec3(-2716.4,3277.17,33.95), h = 239.19},
		},
		vehicles = {
			{vehicle = 'kc390', modelo = 'kc390'}
		}
	},

	[10] = {
		type = 'public',
		coords = vec3(-259.7,1542.84,338.61),---GARAGEM--PUBLICA --BOPE -NOVA --OK
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-261.17,1525.14,338.13), h = 81.64},--JJ
			[2] = {vec3(-262.9,1529.7,338.09), h = 81.64}
		}
	},
	[11] = {
		type = 'public',
		coords = vec3(-2433.08,3281.02,32.82),---GARAGEM-- EB 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-2428.45,3285.06,32.47), h = 240.11},
			[2] = {vec3(-2424.83,3291.39,32.47), h = 240.11}
		}
	},
	[12] = {
		type = 'service',
		coords = vec3(-232.24,1567.59,338.61),---BOPE--FRENTE CRISTO OK 
		perm = 'perm.blindado',
		vehiclePositions = {
			[1] = {vector3(-245.28,1573.09,338.26), h = 262.10},
			[2] = {vector3(-245.9,1567.9,338.13), h = 262.10},
			[3] = {vector3(-246.17,1562.62,338.13), h = 262.10},
			[4] = {vector3(-247.14,1557.59,338.13), h = 262.10}
		},
		vehicles = {
			{vehicle = 'WRtrailblazer22bope', modelo = 'Chevrolet TrailBlazer'},
			{vehicle = 'hiluxbope', modelo = 'Hilux bope'},-------wrmustangbope
			{vehicle = 'wrmustangbope', modelo = 'wrmustangbope'}-------wrmustangbope
		}
	},
	[13] = {
		type = 'service',
		coords = vec3(-1066.08,-848.99,5.04),
		perm = 'perm.policiacivil',
		vehiclePositions = {
			[1] = {vec3(-1052.32,-846.83,4.52), h = 217.18},
			[2] = {vec3(-1055.44,-849.11,4.52), h = 217.18},
		},
		vehicles = {
			{vehicle = 'wrcorollanewcivil', modelo = 'Toyota Corolla'},
			{vehicle = 'wrtrailblazer22civil', modelo = 'Chevrolet TrailBlazer'},---civil ok
			{vehicle = 'wrtrailblazercivil', modelo = 'TrailBlazer PCERJ'},
			{vehicle = 'wrpajerocivil', modelo = 'Mitsubishi Pajero'},
			{vehicle = 'wrl200civil', modelo = 'Mitsubishi L200'},
			{vehicle = 'wrranger23civil', modelo = 'Ford Ranger'},
			{vehicle = 'wrimpalacivil', modelo = 'Chevrolet Impala'},
			{vehicle = 'wrm5civil', modelo = 'BMW M5'},
			{vehicle = 'wrr1200civil', modelo = 'BMW R1200'},
			{vehicle = 'wrxt660', modelo = 'Yamaha XT 660'}
		}
	},
	[14] = {
		type = 'service',
		coords = vec3(-231.28,1546.49,336.54),---BLINDADOS BOPE
		perm = 'perm.blindado',
		vehiclePositions = {
			[1] = {vec3(-228.67,1535.64,335.78), h = 90.50},
		},
		vehicles = {
			{vehicle = 'blindadopmerj', modelo = 'blindadopmerj'},
			{vehicle = 'blindadoturq', modelo = 'blindadoturqen'},
			{vehicle = 'rangerbope', modelo = 'rangerbope'},
			{vehicle = 'WRranger23bope', modelo = 'WRranger23bope'},
			{vehicle = 'WRsprinterpol', modelo = 'WRsprinterpol'}
		}
	},
	[15] = {
		type = 'service',
		coords = vec3(-236.79,1555.42,358.65),-------heli bope 
		perm = 'perm.bope',
		vehiclePositions = {
			[1] = {vec3(-238.07,1550.15,358.65), h = 81.619},
			[2] = {vec3(-233.15,1566.65,359.02), h = 81.619},
		},
		vehicles = {
			{vehicle = 'WRas350', modelo = 'WRas350'},
			{vehicle = 'maverick', modelo = 'maverick'}
			
		}
	},
	[16] = {
		type = 'service',
		coords = vec3(-2869.14,-399.61,19.14),--ok--ok--fac comprada ja HELIPA-----agora dragon 
		perm = 'perm.dragons',
		vehiclePositions = {
			[1] = {vec3(-2864.26,-390.11,19.38), h = 37.154},
		},
		vehicles = {
			{vehicle = '150agstore', modelo = '150agstore'},
			{vehicle = 'amarok', modelo = 'amarok'},
			{vehicle = 'benson', modelo = 'benson'},
			{vehicle = 'm135dragons', modelo = 'm135dragons'}
	
			
		}
	},
	[17] = {
		type = 'public',
		blip = true,
		coords = vec3(1297.23,-1015.51,63.98),---helipa
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1291.18,-1011.69,63.0), h = 117.3}
		}
	},
	
	[18] = {
		type = 'service',
		coords = vec3(-251.81,1522.08,338.61),-------------------BOPE-todos -ok
		perm = 'perm.bope',
		vehiclePositions = {
			[1] = {vector3(-208.98,1521.51,335.41), h = 85.066},
			[2] = {vector3(-219.29,1522.37,336.19), h =  85.066},
			[3] = {vector3(-231.32,1523.4,337.08), h =  85.066},
			[4] = {vector3(-242.32,1524.35,337.91), h =  85.066},
		},
		vehicles = {
			{vehicle = 'WRl200bope2', modelo = 'WR1200'},
			{vehicle = 'wrjeeptrackbope', modelo = 'jeep'},
			{vehicle = 'WRduster22bope', modelo = 'Duster L200'},
			{vehicle = 'hiluxbope', modelo = 'hiluxbope'}

			
		}
	},
	
	[19] = {
		type = 'public',
		coords = vec3(-348.89, -874.73, 31.31),--frente vermelho
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-343.5, -875.1, 30.58), h = 348.67},
			[2] = {vector3(-340.07, -876.48, 30.58), h = 348.67}
		}
	},
	[20] = {
		type = 'public',
		coords = vec3(-280.76, -888.19, 31.31),--frente vermelho 01
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-285.7, -887.69, 30.58), h = 348.67},
			[2] = {vector3(-289.22, -887.18, 30.58), h = 348.67}
		}
	},
	[21] = {
		type = 'public',
		coords = vec3(55.96, -876.5, 30.65),--proximo praca 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(50.73, -873.21, 29.94), h = 340.16},
			[2] = {vector3(47.39, -872.12, 29.96), h = 340.16}
		}
	},
	[22] = {
		type = 'public',
		coords = vec3(213.55, -809.1, 31.0),--frente praca 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(231.84, -807.77, 30.25), h = 249.45},
			[2] = {vector3(234.86, -800.18, 30.28), h = 249.45}
		}
	},
	[23] = {
		type = 'public',
		coords = vec3(68.09, 13.07, 69.22),--perto bc
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(64.0, 16.96, 68.68), h = 158.75},
			[2] = {vector3(60.69, 17.82, 68.73), h = 155.91}
		}
	},
	[24] = {
		type = 'public',
		coords = vec3(-1659.33, 51.59, 62.97),--frente playboy
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-1664.33, 60.89, 62.68), h = 110.56},
			[2] = {vector3(-1667.38, 63.14, 62.87), h = 110.56}
		}
	},
	[25] = {
		type = 'public',
		blip = true,
		coords = vec3(-1159.19, -740.16, 19.88),---ok-------------------------------------------------------------------------------------
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-1144.98, -745.38, 19.39), h = 289.14},
			[2] = {vector3(-1143.45, -748.85, 19.21), h = 289.14}
		}
	},
	[26] = {
		type = 'public',
		coords = vec3(-217.31, -1954.61, 27.75),---estadio 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-214.69, -1947.41, 27.13), h = 113.39},
			[2] = {vector3(-211.3, -1955.84, 27.13), h = 107.72}
		}
	},
	[27] = {
		type = 'public',
		coords = vec3(-2542.64, 2350.04, 33.06),--posto de gas 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-2526.36, 2347.44, 32.54), h = 28.35},
			[2] = {vector3(-2530.39, 2347.42, 32.54), h = 28.35}
		}
	},
	[28] = {
		type = 'public',
		coords = vec3(-773.32, 5597.93, 33.6),---paleto --------------------------------BUGADA ARRUMAR 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-772.19, 5578.28, 32.97), h = 272.13},
			[2] = {vector3(-772.08, 5575.4, 32.97), h = 272.13}
		}
	},
	[29] = {
		type = 'public',
		coords = vec3(2890.37, 4391.64, 50.33),--norte 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(2904.36, 4396.37, 49.99), h = 22.68},
			[2] = {vector3(2907.53, 4398.22, 49.98), h = 19.85}
		}
	},
	[30] = {
		type = 'public',
		coords = vec3(317.46, 2623.09, 44.47),--norte 01
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(336.86, 2619.37, 44.21), h = 206.93},
			[2] = {vector3(342.27, 2621.86, 44.23), h = 209.77}
		}
	},
	[31] = {
		type = 'public',
		coords = vec3(596.71, 91.38, 93.13),--meio bc e motoclube 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(598.71, 98.43, 92.39), h = 68.04},
			[2] = {vector3(600.35, 101.97, 92.39), h = 65.2}
		}
	},
	[32] = {
		type = 'public',
		coords = vec3(95.69, -1394.07, 29.45),---loginha de rooupa perto vanila 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(99.7, -1394.69, 28.76), h = 323.15},
			[2] = {vector3(102.14, -1397.88, 28.75), h = 320.32}
		}
	},
	[33] = {
		type = 'public',
		coords = vec3(-42.96, -792.9, 44.21),---predio alto 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-21.58, -777.07, 43.98), h = 314.65},
			[2] = {vector3(-17.93, -780.27, 43.74), h = 317.49}
		}
	},
	[34] = {
		type = 'public',
		coords = vec3(2834.75, 2806.95, 57.39),--mineradora 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(2827.61, 2806.66, 56.88), h = 178.59},
		}
	},
	[35] = {
		type = 'public',
		coords = vec3(1145.81, -466.36, 66.57),--perto helipa 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(1155.22, -462.34, 66.29), h = 348.67},
			[2] = {vector3(1158.8, -462.97, 66.24), h = 348.67}
		}
	},
	[36] = {
		type = 'public',
		coords = vec3(1899.39, 2605.32, 45.97),---preisao 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1909.46, 2601.49, 45.29), h = 274.97},
		}
	},
	--[37] = {
		--type = 'public',
		--coords = vec3(315.38, -219.3, 54.22),---livre 
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vector3(314.59, -209.31, 53.58), h = 65.2},
			--[2] = {vector3(316.61, -206.47, 53.58), h = 68.04}
		--}
	--},
	[38] = {
		type = 'public',
		coords = vec3(-993.99, -2705.97, 14.02),---eroporto se quiser pode mudar de local 
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(-979.38, -2689.35, 13.55), h = 331.66},
			[2] = {vector3(-976.07, -2691.0, 13.55), h = 331.66}
		}
	},
	---[39] = {
		--type = 'public',
		--coords = vec3(4519.84, -4515.23, 4.48),--crips
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vector3(4511.85, -4517.45, 3.86), h = 17.01}
		--}
	--},
	[40] = {
		type = 'public',
		coords = vec3(1036.49, -763.09, 58.0),--vila do chaves
		perm = nil,
		vehiclePositions = {
			[1] = {vector3(1031.11, -773.27, 57.54), h = 325.99},
			[2] = {vector3(1028.15, -771.08, 57.53), h = 325.99}
		}
	},
	--[41] = {
		--type = 'public',
		--coords = vec3(-2279.05, 402.64, 174.6),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(-2284.48, 406.71, 173.94), h = 308.98},
			--[2] = {vec3(-2287.13, 409.63, 173.96), h = 314.65}
		--}
	--},
	--[42] = {
		--type = 'public',
		--coords = vec3(1183.36,-1533.01,39.39),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(1174.88,-1546.57,39.39), h = 180.04},
			--[2] = {vec3(1181.83,-1546.78,39.39), h = 180.04}
		--}
	--},
	[43] = {
		type = 'public',
		coords = vec3(-1184.28, -1509.67, 4.65),--praia
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1183.49, -1496.07, 3.86), h = 306.15},
			[2] = {vec3(-1185.28, -1493.44, 3.86), h = 306.15}
		}
	},
	[44] = {
		type = 'public',
		coords = vec3(100.53, -1073.36, 29.37),--lado praca 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(104.35, -1078.41, 28.68), h = 158.75},
			[2] = {vec3(107.98, -1079.55, 28.68), h = 155.91}
		}
	},
	--[45] = {
		--type = 'public',
		--coords = vec3(-3052.27, 112.12, 11.61),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(-3028.95, 129.26, 11.1), h = 306.15},
			--[2] = {vec3(-3030.9, 132.59, 11.09), h = 297.64}
		--}
	--},
	--[46] = {
		--type = 'public',
		--coords = vec3(-2052.6, -432.27, 11.54),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(-2060.3, -433.59, 11.53), h = 323.15}
		--}
	---},
	[47] = {
		type = 'public',
		coords = vec3(1695.88, 4785.14, 42.01),--norte 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1690.78, 4778.27, 41.4), h = 269.3},
			[2] = {vec3(1690.96, 4774.2, 41.4), h = 269.3}
		}
	},
	--[48] = {
		--type = 'public',
		--coords = vec3(1508.38, 767.07, 77.42),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(1512.89, 771.38, 76.92), h = 19.85}
		--}
	--},
	[49] = {
		type = 'public',
		coords = vec3(-340.81, 266.71, 85.68),--frente hospital
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-329.27, 277.68, 85.8), h = 274.97},
			[2] = {vec3(-329.4, 281.32, 85.73), h = 277.8}
		}
	},
	[50] = {
		type = 'public',
		coords = vec3(394.21, 284.05, 103.2),--TRAS DO BC
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(378.93, 293.17, 102.68), h = 343.0},
			[2] = {vec3(382.79, 291.74, 102.6), h = 345.83}
		}
	},
	
	
	[51] = {
		type = 'public',
		coords = vec3(-198.26, 6565.79, 11.12),--norte pier se quiser pode nudar 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-185.51, 6554.5, 10.58), h = 133.23},
			[2] = {vec3(-188.22, 6557.25, 10.58), h = 136.07}
		}
	},
	--[52] = {
		--type = 'public',
		--coords = vec3(-214.91, 6549.39, 11.09),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(-211.58, 6539.06, 10.58), h = 136.07},
			--[2] = {vec3(-214.1, 6540.99, 10.58), h = 136.07}
		--}
	--},
	--[53] = {
		--type = 'public',
		--coords = vec3(1164.19, -618.4, 63.59),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(1166.48, -609.7, 63.19), h = 189.93},
			--[2] = {vec3(1164.84, -599.98, 63.39), h = 189.93}
		--}
	---},
	[54] = {
		type = 'public',
		coords = vec3(275.49, -344.87, 45.17),--suk ok
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(295.01, -343.04, 44.4), h = 252.29},
			[2] = {vec3(297.26, -336.47, 44.4), h = 252.29}
		}
	},
	--[55] = {
		--type = 'public',
		--coords = vec3(-195.63, 6264.84, 31.49),
		--perm = nil,
		--vehiclePositions = {
			--[1] = {vec3(-203.05, 6275.12, 30.97), h = 36.86},
			--[2] = {vec3(-200.69, 6276.94, 30.97), h = 42.52}
		--}
	--},
	[56] = {
		type = 'service',
		coords = vec3(-142.54, 6273.47, 31.34),
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-136.18, 6278.87, 30.84), h = 45.36},--emprego
			[2] = {vec3(-131.45, 6283.51, 30.84), h = 42.52},
		},
		vehicles = {
			{vehicle = 'wrsprintersedex', modelo = 'wrsprintersedex'}
		}
	},
	
	[57] = {
		type = 'service',
		coords = vec3(67.14, 6414.16, 31.22),
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(71.99, 6403.46, 30.7), h = 314.65},--emprego
			[2] = {vec3(74.76, 6401.03, 30.72), h = 317.49},
		},
		vehicles = {
			{vehicle = 'wrbrickadecoca', modelo = 'wrbrickadecoca'}
		}
	},
	[58] = {
		type = 'service',
		coords = vec3(-52.97, 6522.36, 31.49),--emprego
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-37.06, 6536.48, 30.97), h = 317.49},
			[2] = {vec3(-40.06, 6538.8, 30.97), h = 317.49},
		},
		vehicles = {
			{vehicle = 'wrcaddyfood', modelo = 'wrcaddyfood'}
		}
	},
	--[59] = {
		--type = 'service',
		--coords = vec3(-741.34, -1458.94, 5.0),--vips heli 
		--perm = 'perm.vips',
		--vehiclePositions = {
			--[1] = {vec3(-745.89, -1469.01, 5.75), h = 323.15}
		--},
		--vehicles = {
			--{vehicle = 'volatus', modelo = 'volatus'},
			--{vehicle = 'Swift', modelo = 'Swift'}
		--}
	--},
	--[60] = {
		--type = 'service',
		--coords = vec3(-733.63, -1449.61, 5.0),
		--perm = 'perm.vips',
		--vehiclePositions = {
			--[1] = {vec3(-724.61, -1444.02, 5.75), h = 138.9}
		--},
		--vehicles = {
			--{vehicle = 'volatus', modelo = 'volatus'},
			--{vehicle = 'Swift', modelo = 'Swift'}
		--}
	--},
	[61] = {
		type = 'service',
		coords = vec3(-68.21, -813.61, 326.08),--predio alto
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(-75.16, -820.39, 326.92), h = 357.17},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'Swift', modelo = 'Swift'}
		}
	},
	[62] = {
		type = 'service',
		coords = vec3(-1114.94, -2874.83, 13.93),--eroporto
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(-1111.71, -2882.04, 14.68), h = 147.41},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'Swift', modelo = 'Swift'}
		}
	},
	[63] = {
		type = 'service',
		coords = vec3(1765.43, 3231.74, 42.29),--norte 
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(1772.1, 3240.43, 42.9), h = 99.22},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'Swift', modelo = 'Swift'}
		}
	},
	[64] = {
		type = 'service',
		coords = vec3(4895.12, -5747.65, 26.35),--cayoperico 
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(4889.97, -5737.93, 27.09), h = 337.33},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'Swift', modelo = 'Swift'}
		}
	},
	
	
	[65] = {
		type = 'service',
		coords = vec3(-471.7,175.31,75.23),--------------------HOSPITAL LUXUOSA 
		perm = 'perm.unizk',
		vehiclePositions = {
			[1] = {vec3(-466.0,178.19,75.23), h = 113.39},
			[2] = {vec3(-466.0,178.19,75.23), h = 113.39},
		},
		vehicles = {
			{vehicle = 'wrx6mf96', modelo = 'X6 SAMU'},
			{vehicle = 'wrsprinter22', modelo = 'SPRINTER SAMU'},
			{vehicle = 'energyr1200samu', modelo = 'R1200gs SAMU'}
		}
	},
	[66] = {
		type = 'service',
		coords = vec3(-1703.93, -742.4, 12.15),
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(-1708.39, -751.35, 12.81), h = 320.32},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'Swift', modelo = 'Swift'}
		}
	},
	[67] = {
		type = 'service',
		coords = vec3(-1700.46, -745.35, 12.13),---------------------PAROU DAQUIN-------------------------------------------
		perm = 'perm.judiciario',
		vehiclePositions = {
			[1] = {vec3(-1708.39, -751.35, 12.81), h = 320.32},--oab ok---
		},
		vehicles = {
			{vehicle = 'energy_volito', modelo = 'energy_volito'}
		}
	},
	
	[68] = {
		type = 'service',
		coords = vec3(2684.22,3475.3,64.72),-------------blipe STOPCAR ----HELI
		perm = 'lscustom.permissao',
		vehiclePositions = {
			[1] = {vec3(2684.09,3474.56,65.06), h = 336.89},
		},
		vehicles = {
			{vehicle = 'Khelimec', modelo = 'Khelimec'}
		}
	},
	
	[69] = {
		type = 'public',
		coords = vec3(2434.01,2412.69,64.33),-------------edit
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(2430.06,2422.54,63.74), h = 266.46},
			[2] = {vec3(-708.23, -1481.11, 4.14), h = 266.46}
		}
	},
	[70] = {
		type = 'service',
		coords = vec3(2754.95,3478.99,55.65),---STOP CAR CARROS SERVIÇOS 
		perm = 'lscustom.permissao',
		vehiclePositions = {
			[1] = {vec3(2776.44,3483.17,54.61), h = 244.43},--1
			[1] = {vec3(2773.63,3476.55,54.71), h = 244.43},
			[1] = {vec3(2779.76,3491.28,54.48), h = 244.43},
		},
		vehicles = {
			{vehicle = 'Kguinchomec', modelo = 'Kguinchomec'},
			{vehicle = 'Ksierramec', modelo = 'Ksierramec'},
			{vehicle = 'Kteneremec', modelo = 'Kteneremec'}
		}
	},
	[71] = {
		type = 'service',
		coords = vec3(-36.27, 6409.57, 31.49),-----------entrega de gas ----ok
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-32.28, 6407.64, 31.26), h = 107.72},
		},
		vehicles = {
			{vehicle = 'wrsaveirorobust', modelo = 'wrsaveirorobust'}
		}
	},
	[72] = {
		type = 'public',
		coords = vec3(-421.25,1613.83,356.95),---FAVELA BOLO--CV
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-416.46,1599.71,356.66), h = 164.05},
			[2] = {vec3(-423.3,1604.37,356.66), h = 188.82}
		}
	},

	

	[73] = {
		type = 'public',
		coords = vec3(845.75, -890.71, 25.24),----BABEL 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(854.05, -889.04, 25.58), h = 272.13},
			[2] = {vec3(853.4, -885.41, 25.54), h = 272.13}
		}
	},
	

	
	
	[74] = {
		type = 'public',
		coords = vec3(-1525.96, 893.71, 182.23),--FAZENDA 01
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1530.93, 889.44, 182.1), h = 201.26},
		}
	},
	[75] = {
		type = 'public',
		coords = vec3(967.61, 21.05, 81.15),--CASSINO 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(962.83, 26.19, 81.38), h = 147.41},
		}
	},
	[76] = {
		type = 'public',
		coords = vec3(-817.93, 189.9, 72.62),--MNASAO 01
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-821.24, 183.49, 72.23), h = 113.39},
		}
	},
	
	[77] = {
		type = 'public',
		coords = vec3(2430.76, 4977.2, 45.92),--FAZENDA NORTE 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(2434.21, 4983.75, 45.92), h = 314.65},
		}
	},
	
	
	[78] = {
		type = 'public',
		coords = vec3(1399.05, 1115.28, 114.83),---CARTEL
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1387.35, 1117.97, 114.98), h = 87.88},
		}
	},
	[79] = {
		type = 'public',
		coords = vec3(1021.19, -165.87, 74.24),--MOTOCLUB
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1024.01, -160.32, 74.48), h = 45.36},
		}
	},
	
	[80] = {
		type = 'public',
		coords = vec3(2747.37,3464.01,55.72),---stopcar
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(2762.79,3458.51,55.08), h = 65.2},
			
		}
	},
	
	
	
	[81] = {
		type = 'public',
		coords = vec3(-1606.99, -1026.89, 13.09),---PIER PARK
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1582.68, -1029.07, 12.5), h = 22.68},
			[2] = {vec3(-1585.7, -1030.5, 12.5), h = 22.68}
		}
	},
	
	
	[82] = {
		type = 'public',
		coords = vec3(-73.09, -2004.19, 18.27),--FRENTE STADIO 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-78.34, -2010.87, 17.93), h = 172.92},
		}
	},
	
	
	
	[83] = {
		type = 'service',
		coords = vec3(846.07, -879.34, 25.24),--ok--ok--fac comprada ja BABEL
		perm = 'perm.liderbabel',
		vehiclePositions = {
			[1] = {vec3(835.86, -874.49, 25.22), h = 87.88},
		},
		vehicles = {
			{vehicle = 's1000rr', modelo = 'S1000RR'},
			{vehicle = 'benson', modelo = 'BENSON'}
			
		}
	},
	

	
	[84] = {
		type = 'public',
		coords = vec3(-600.31, 327.68, 85.13),---TEQUILA
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-602.03, 333.7, 85.09), h = 263.63},
			[2] = {vec3(-615.41, 335.13, 85.09), h = 266.46}
		}
	},
	
	
	
	[85] = {
		type = 'public',
		coords = vec3(-1892.0, 2039.97, 140.88),--MANSAO VINE WUD
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1883.1, 2030.1, 140.44), h = 158.75},
			[2] = {vec3(-1891.85, 2032.73, 140.65), h = 158.75}
		}
	},
	
	[86] = {
		type = 'public',
		coords = vec3(2549.87, 1628.48, 29.4),--DOMINAS 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(2546.85, 1622.23, 29.59), h = 181.42},
			[2] = {vec3(2538.12, 1633.5, 29.28), h = 181.42}
		}
	},
	[87] = {
		type = 'public',
		coords = vec3(1690.3, 3581.17, 35.62),--NORTE 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1693.05, 3574.96, 35.81), h = 119.06},
			[2] = {vec3(1715.83, 3593.48, 35.55), h = 116.23}
		}
	},
	
	
	
	[88] = {
		type = 'public',
		coords = vec3(-828.69, 263.35, 86.19),--CASA PERTO CENTRO VERIFICAR 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-826.5, 273.78, 85.78), h = 164.41},
		}
	},
	
	[89] = {
		type = 'service',
		coords = vec3(-1780.6, 429.97, 127.4),--MANSAO 
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(-1770.13, 432.43, 127.96), h = 90.71},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'supervolito', modelo = 'supervolito'}
		}
	},
	
	[90] = {
		type = 'public',
		coords = vec3(25.26, 542.68, 176.03),--CASA VERIFICAR 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(12.78, 548.55, 176.03), h = 257.96},
		}
	},
	
	
	

	[91] = {
		type = 'service',
		coords = vec3(-1660.32, -784.68, 10.36),
		perm = 'perm.judiciario',
		vehiclePositions = {
			[1] = {vec3(-1653.62,-785.55,9.87), h = 320.3}--oab--ok
		},
		vehicles = {
			{vehicle = 'x6oab', modelo = 'X6 OAB'},
			{vehicle = 'jettaoab', modelo = 'jettaoab'},
			{vehicle = 'energy_yukon', modelo = 'energy_yukon'},
			{vehicle = 'energycamaro', modelo = 'energycamaro'}
		}
	},
	[92] = {
		type = 'service',
		coords = vec3(-1610.12, 247.77, 59.36),
		perm = 'perm.judiciario',
		vehiclePositions = {
			[1] = {vec3(-1594.81, 247.89, 58.57), h = 51.03},
		},
		vehicles = {
			{vehicle = 'jettaoab', modelo = 'jettaoab'},
			{vehicle = 'x6oab', modelo = 'X6 OAB'}
		}
	},

	
	[93] = {
		type = 'public',
		coords = vec3(969.16, -888.71, 14.84),--BABEL DENTRO 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(959.16, -888.11, 15.08), h = 87.88},
		}
	},
	
	
	[94] = {
		type = 'public',
		coords = vec3(3589.6, 3776.64, 30.08),--NIOBIO 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(3591.46, 3781.75, 29.86), h = 351.5},
		}
	},
	
	[95] = {
		type = 'public',
		coords = vec3(4934.15,-4889.52,3.93),---CAYO--PERICO--PALCO
	   perm = nil,
		vehiclePositions = {
		   [1] = {vec3(4937.25,-4892.2,3.15), h = 324.56},
		}
   },
   [96] = {
	type = 'public',
	coords = vec3(4999.26,-5685.58,20.0),---CAYO--PERICO--hotel02
   perm = nil,
	vehiclePositions = {
	   [1] = {vec3(4994.09,-5680.93,20.17), h = 315.35},
	}
},
[97] = {
	type = 'public',
	coords = vec3(4523.94,-4465.38,4.18),---CAYO--PERICO--entrada
   perm = nil,
	vehiclePositions = {
	   [1] = {vec3(4517.28,-4461.13,3.52), h = 196.87},
	}
},
	 [98] = {
	     type = 'public',
	     coords = vec3(5009.6,-5674.91,19.98),---CAYO--PERICO--hotel01
	    perm = nil,
	     vehiclePositions = {
	        [1] = {vec3(5005.18,-5669.32,20.03), h = 315.35}
	     }
	},
	
	[99] = {
		---- yacht2
		type = 'service',
		coords = vec3(4930.8, -5146.08, 2.48),--OK CAYO BARCOS 
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(4927.82, -5153.82, 0.37), h = 65.2},
		},
		vehicles = {
			{vehicle = 'yacht2', modelo = 'yacht2'}
		}
	},
	
	
	[100] = {
		type = 'public',
		coords = vec3(-1281.56, 295.8, 64.94),--FEDERAL
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1309.55, 297.54, 64.3), h = 96.38},
		}
	},
	
	[101] = {
		type = 'public',
		coords = vec3(-1096.24, 354.41, 68.49),----MANSAO VERIFICAR 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1099.02, 359.61, 68.65), h = 181.42},
		}
	},
	[102] = {
		type = 'public',
		coords = vec3(-1169.98, 351.64, 71.49),--MANSAO VERIFICAR 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1159.0, 358.71, 70.8), h = 260.79},
		}
	},
	[103] = {
		type = 'public',
		coords = vec3(733.46, 2523.38, 73.21),--DOMINAS 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(737.73, 2519.29, 73.16), h = 269.3},
			[2] = {vec3(737.57, 2527.64, 73.16), h = 272.13}
		}
	},
	
	
			
	[104] = {
		type = 'service',
		coords = vec3(2832.65, 2809.18, 57.39),---emprego mineracao 
		vehiclePositions = {
			[1] = {vec3(2828.22, 2800.16, 57.93), h = 181.42},
		},
		vehicles = {
			{vehicle = 'wrbrickdump', modelo = 'wrbrickdump'}
		}
	},
	

	[105] = {
		type = 'service',
		coords = vec3(-3546.21, -3965.27, 59.46),
		perm = 'perm.vips',
		vehiclePositions = {
			[1] = {vec3(-3548.45, -3955.89, 60.14), h = 178.59},
		},
		vehicles = {
			{vehicle = 'volatus', modelo = 'volatus'},
			{vehicle = 'supervolito', modelo = 'supervolito'}
		}
	},
	
	[106] = {
		type = 'service',
		coords = vec3(-1143.32,-1742.95,4.09),
		perm = 'perm.unizk',
		vehiclePositions = {
			[1] = {vec3(-1162.57,-1742.46,3.67), h = 122.73},--bombeiro NOVO OK
		},
		vehicles = {
			{vehicle = 'wras350cbm', modelo = 'Heli CBM'}
		}
	},
	
	[107] = {
		type = 'public',
		blip = true,
		coords = vec3(1297.23,-1015.51,63.98),---helipa
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1291.18,-1011.69,63.0), h = 117.3},
		}
	},
	[108] = {
		type = 'public',
		coords = vec3(1213.27,-225.41,75.77),---BARRAGEM--
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1204.66,-223.96,75.54), h = 243.5},
		}
	},
	[109] = {
		type = 'public',
		coords = vec3(-1075.99,-856.72,5.04),---CIVIL--GARAGEM 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1048.2,-864.79,4.75), h = 307.74},
		}
	},
	[110] = {
		type = 'service',
		coords = vec3(-1097.06,-838.87,37.69),
		perm = 'perm.policiacivil',
		vehiclePositions = {
			[1] = {vec3(-1097.31,-833.02,38.43), h = 129.58},--CIVIL--HELI
		},
		vehicles = {
			{vehicle = 'uh1pc', modelo = 'uh1pc'}
		}
	},
	[111] = {
		type = 'public',
		coords = vec3(-39.95,-1117.21,26.44),--CONCE 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-48.01,-1116.6,26.25), h = 3.471},
		}
	},
	[112] = {
		type = 'public',
		coords = vec3(194.4,-3160.31,5.78),--club 77 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(191.57,-3153.04,5.44), h = 54.138},
			[2] = {vec3(191.64,-3148.73,5.44), h = 54.138}
		}
	},

	[113] = {
		type = 'public',
		coords = vec3(-773.41,5597.69,33.6),--PALETO -----DOMONAS 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-773.18,5578.58,33.19), h = 90.796},
			[2] = {vec3(-773.28,5572.4,33.19), h = 90.796}
		}
	},

	[114] = {
		type = 'service',
		coords = vec3(604.87,-205.34,54.53),---RIDE OUT  CARROS SERVIÇOS 
		perm = "rideout.permissao",
		vehiclePositions = {
			[1] = {vec3(585.21,-219.53,54.17), h = 1.1558},--1
			[2] = {vec3(579.29,-219.66,54.17), h = 1.1558},
			[3] = {vec3(573.47,-220.21,54.27), h = 1.1558}
		},
		vehicles = {
			{vehicle = 'energyguinchoride', modelo = 'energyguinchoride'},
			{vehicle = 'energysierraride', modelo = 'energysierraride'},
			{vehicle = 'energytenereride', modelo = 'energytenereride'}
		}
	},
	[115] = {
		type = 'service',
		coords = vec3(620.97,-219.41,55.27),---RIDE OUT  HELLY
		perm = "rideout.permissao",
		vehiclePositions = {
			[1] = {vec3(614.34,-213.28,55.6), h = 270.16},--1
			
		},
		vehicles = {
			{vehicle = 'energyheliride', modelo = 'energyheliride'}
			
		}
	},
	
	[116] = {
		type = 'public',
		coords = vec3(846.39,2194.4,52.15),-- GARAGEM DOMINAS ARAMAS 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(852.06,2200.21,51.39), h = 0.9185},
			[2] = {vec3(856.57,2194.81,51.85), h = 0.9185},
			[3] = {vec3(843.29,2202.19,51.19), h = 0.9185}
		}
	},
	[117] = {
		type = 'public',
		coords = vec3(562.94,-215.44,54.76),--RIDE OUT ------------------
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(559.47,-236.66,54.27), h = 359.31},
			[2] = {vec3(553.31,-236.43,54.27), h = 359.31},
			[3] = {vec3(564.95,-236.25,54.27), h = 359.31}
		}
	},
	[118] = {
		type = 'public',
		coords = vec3(1047.16,1743.28,163.21),--mansao2
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1046.5,1748.13,162.85), h = 64.79},

		}
	},
	[119] = {
		type = 'public',
		coords = vec3(-1253.41,810.27,193.37),--mansao3
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1264.36,815.99,193.03), h = 246.07},

		}
	},
	[120] = {
		type = 'public',
		coords = vec3(-3199.75,819.25,8.93),--mansao4
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-3190.08,819.31,8.58), h = 122.11},

		}
	},
	[121] = {
		type = 'public',
		coords = vec3(-2702.1,-50.43,16.21),--mansao7
		perm = "perm.mansao7",
		vehiclePositions = {
			[1] = {vec3(-2708.47,-46.98,15.96), h = 310.68},

		}
	},
	[122] = {
		type = 'public',
		coords = vec3(-134.37,1005.16,235.75),--mansao8
		perm = "perm.mansao8",
		vehiclePositions = {
			[1] = {vec3(-124.35,1006.21,235.05), h = 198.82},

		}
	},
	[123] = {
		type = 'public',
		coords = vec3(828.41,3444.45,57.86),--mansao18 samuka 
		perm = "perm.mansao18",
		vehiclePositions = {
			[1] = {vec3(814.73,3437.06,57.51), h = 178.67},

		}
	},
	[124] = {
		type = 'service',
		coords = vec3(-1734.47,201.78,64.37),--------------------------------PMERJ  
		perm = 'perm.pmerj',
		vehiclePositions = {
			[1] = {vec3(-1736.71,204.77,65.33), h = 213.34},
		},
		vehicles = {
			{vehicle = 'WRas350', modelo = 'WRas350'}
			
		}
	},
	
	[125] = {
		type = 'service',
		coords = vec3(-2892.56,-372.1,19.14),--garagem lider 
		perm = 'perm.liderdragons',
		vehiclePositions = {
			[1] = {vec3(-2880.19,-373.08,19.38), h = 312.11},
		},
		vehicles = {
			{vehicle = 'bmws', modelo = 'bmws'},
			{vehicle = 'ram226x6', modelo = 'ram226x6'}
			
		}
	},
	
	[126] = {
		type = 'public',
		coords = vec3(-1673.14,-228.3,54.96),--semiterio
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1654.33,-236.28,54.34), h = 71.452},
			[2] = {vec3(-1651.37,-230.16,54.37), h = 71.452}


		
		},

	}, 

	[127] = {
		type = 'service',
		coords = vec3(604.87,-205.34,54.53),---RIDE OUT  CARROS SERVIÇOS 
		perm = "rideout.permissao",
		vehiclePositions = {
			[1] = {vec3(585.21,-219.53,54.17), h = 1.1558},--1
			[2] = {vec3(579.29,-219.66,54.17), h = 1.1558},
			[3] = {vec3(573.47,-220.21,54.27), h = 1.1558},
		},
		vehicles = {
			{vehicle = 'energyguinchoride', modelo = 'energyguinchoride'},
			{vehicle = 'energysierraride', modelo = 'energysierraride'},
			{vehicle = 'energytenereride', modelo = 'energytenereride'}
		}
	},
	[128] = {
		type = 'service',
		coords = vec3(620.97,-219.41,55.27),---RIDE OUT  HELLY
		perm = "rideout.permissao",
		vehiclePositions = {
			[1] = {vec3(614.34,-213.28,55.6), h = 270.16},--1
			
		},
		vehicles = {
			{vehicle = 'energyheliride', modelo = 'energyheliride'}
			
		}
	},
	[129] = {
		type = 'public',
		coords = vec3(-1670.53,-219.3,55.12),--semiterio
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1646.51,-216.85,54.8), h = 71.452},
			[2] = {vec3(-1649.26,-223.19,54.76), h = 71.452}


		
		},

	}, 
	[120] = {
		type = 'public',
		coords = vec3(-3277.85,532.78,12.27),--mansao vermelha b13-----SE DE MERDA E AQUI
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-3286.89,527.77,11.58), h = 121.92},
			[2] = {vec3(-3277.1,521.36,11.91), h = 99.88}
		}
	},


	[131] = {
		type = 'public',
		coords = vec3(-1419.29,-640.16,28.68),--BAHAMAS
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1409.4,-636.3,28.16), h = 38.448},
			[2] = {vec3(-1409.12,-636.14,28.32), h = 213.25}
		
		},
	},
	[132] = {
		type = 'public',
		coords = vec3(-1595.26,174.2,59.13),--PMERJ------SE DE MERDA FOI AQUI 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1599.4,178.81,58.62), h = 113.76},
			[2] = {vec3(-1602.6,186.11,58.69), h = 113.76}
		},

	},
	[133] = {
		type = 'service',
		coords = vec3(-1614.02,215.2,59.68),---BLINDADOS PMERJ 
		perm = 'perm.blindado',
		vehiclePositions = {
			[1] = {vec3(-1615.49,206.99,59.13), h = 113.97},
		},
		vehicles = {
			{vehicle = 'blindadopmerj', modelo = 'blindadopmerj'},
			{vehicle = 'blindadoturq', modelo = 'blindadoturqen'}
			
		},
	},
	[134] = {
		type = 'public',
		coords = vec3(-1158.18,-1736.24,4.77),--GARAGEM-- SPANER
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-1142.33,-1735.93,4.16), h = 304.66},
			[2] = {vec3(-1142.33,-1735.93,4.16), h = 304.66},
			[3] = {vec3(-1167.37,-1753.21,4.16), h = 304.66}
		},
	
	},
	[135] = {
		type = 'public',
		coords = vec3(2559.58,-599.3,64.99),--garagem dominas lavagem 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(2569.39,-592.49,65.19), h = 294.21},
			[2] = {vec3(2571.37,-600.84,64.97), h = 294.21}
		},
	},
	[136] = {
		type = 'public',
		coords = vec3(-2858.42,3728.08,12.77),--WOLVES---
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(-2852.17,3733.09,12.49), h = 244.88},
			[2] = {vec3(-2843.77,3729.09,12.49), h = 244.88}
		},

	},
	[137] = {
		type = 'public',
		coords = vec3(1133.48,3950.47,45.43),--nonymous
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(1145.21,3939.3,45.14), h = 199.64},
			[2] = {vec3(1140.7,3951.95,45.14), h = 199.64}
		},

	},
	[138] = {
		type = 'public',
		coords = vec3(2426.7,4496.42,35.59),--MANSAO FANY 09
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(2422.55,4487.81,35.3), h = 183.63},
		},

	},
	[139] = {
		type = 'service',
		coords = vec3(1212.35,-199.68,76.01),--garagem grota wesle 
		perm = 'perm.grota',
		vehiclePositions = {
			[1] = {vec3(1194.57,-218.8,71.11), h = 145.21},
			[2] = {vec3(1188.61,-227.45,70.03), h = 145.21}
		},
		vehicles = {
			{vehicle = 'baller6', modelo = ' baller6'},
			
		}
	},

	[140] = {
		type = 'service',
		coords = vec3(-1402.29,-651.65,28.68),--garagem bahamas 
		perm = 'perm.bahamas',
		vehiclePositions = {
			[1] = {vec3(-1397.01,-652.78,28.31), h = 33.135},
		},
		vehicles = {
			{vehicle = 'r', modelo = 'r'},
			
		}
	},
	[141] = {
		type = 'public',
		coords = vec3(821.93,-3151.0,6.03),-- GARAGEM DOMINAS geral 
		perm = nil,
		vehiclePositions = {
			[1] = {vec3(817.94,-3142.66,5.61), h = 0.3835},
			[2] = {vec3(821.97,-3144.39,5.61), h = 0.3835},
			[3] = {vec3(826.66,-3143.76,5.61), h = 0.3835}
		}
	},
}



