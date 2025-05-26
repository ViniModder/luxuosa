 local cfg = {}
-- ITEM | NOME | DESC | TYPE | PESO | FOME | SEDE

cfg.items = {

     --FOME E SEDE--CONFIGUE AQUI NESSA LINHA 
	["agua"] = { "Agua", "beber", 0.3, nil, nil},
	["pizza"] = { "Pizza", "comer", 0.2, nil, nil},
	["coxinha"] = { "Coxinha", "comer", 0.2, nil, nil},
	["pipoca"] = { "Pipoca", "comer", 0.2, nil, nil},
	["hamburguer"] = { "Hamburguer", "comer", 0.2, nil, nil},
	["sprunk"] = { "Sprunk", "comer", 0.2, nil, nil},
	["paodequeijo"] = { "Paodequeijo", "comer", 0.2, nil, nil},
	["pastel"] = { "Pastel", "comer", 0.2, nil, nil},
	["chocolate"] = { "Choocolate", "comer", 0.2, nil, nil},
	["cafe"] = { "Cafe", "beber", 0.2, nil, nil},
	["sucol2"] = { "Sucol2", "beber", 0.2, nil, nil}, 
	["hamburguer"] = { "Hamburguer", "comer", 0.2, nil, nil}, 
	["hotdog"] = { "Hotdog", "comer", 0.2, nil, nil}, --hotdog
	["batata"] = { "Batata", "comer", 0.2, nil, nil}, --


	["apple_watch"] = { "apple Watch", "usar", 0.2, nil, nil}, --




	["none"] = { "none", "none", 0.0, nil, nil},
 	["roupas"] = { "Roupas", "none", 0.0, nil, nil},
 	["money"] = { "Dinheiro","none", 0.0, nil, nil},
 	["cirurgia"] = { "Cirurgia","usarVIP", 0.0, nil, nil},
 	["carrinho"] = { "Carrinho","none", 0.5, nil, nil},
  --ITENS VIP
 	["alterarplaca"] = { "Alterar Placa", "usarVIP", 0.0, nil, nil},
 	["alterarrg"] = { "Alterar RG", "usarVIP", 0.0, nil, nil},
 	["alterartelefone"] = { "Alterar Telefone", "usarVIP", 0.0, nil, nil},
 	["plastica"] = { "Plastica", "usarVIP", 0.0, nil, nil}, 	["valecasa"] = { "Vale Casa", "usarVIP", 0.0, nil, nil},
 	["valegaragem"] = { "Vale Garagem", "usarVIP", 0.0, nil, nil},
	["valemansao8m"] = { "Vale mansao 8m", "usarVIP", 0.0, nil, nil},
 	["valemansao10m"] = { "Vale mansao 10m", "usarVIP", 0.0, nil, nil},
 	["valemansao100m"] = { "Vale mansao 100m", "usarVIP", 0.0, nil, nil},

-- 	-- Utilitarios
 	["mochila"] = { "Mochila", "usar", 2.0, nil, nil},
 	["skate"] = { "Skate", "usar", 1.0, nil, nil},
 	["algemas"] = { "Algemas", "usar", 2.0, nil, nil},
 	["ticket"] = { "Ticket Corrida", "usar", 1.0, nil, nil},
 	["laudo"] = { "Laudo CAC", "usar", 1.0, nil, nil},
 	["plastico"] = { "Plástico", "usar", 0.1, nil, nil},
 	["distintivopolicial"] = { "Distintivo Policial", "usar", 0.3, nil, nil},
 	["corda"] = { "Corda", "usar", 1.0, nil, nil},
 	["chave_algemas"] = { "Chave de algemas", "usar", 0.3, nil, nil},
	["emptybottle"] = { "Garrafa Vazia", "usar", 0.1, nil, nil},
 	["attachs"] = { "Attachs", "usar", 0.1, nil, nil},
 	["alianca"] = { "Alianca", "usar", 1.0, nil, nil},

-- 	-- carro
	["pedecabra"] = { "pedecabra","usar", 3.0, nil, nil},

-- 	-- Mecanica
 	["pneus"] = { "Pneus","usar", 10.0, nil, nil},
 	["repairkit"] = { "Kit de Reparos", "usar", 1.0, nil, nil},
 	["militec"] = { "Militec", "usar", 1.0, nil, nil},
-- 	-- Eletronicos
 	["radio"] = { "Radio", "usar", 1.0, nil, nil},
     ["celular"] = { "Celular", "usar", 1.0, nil, nil},

	 ["apple_watch"] = { "apple_watch", "usar", 1.0, nil, nil},
	
-- 	-- Itens para Roubar
 	["keycard"] = { "Keycard", "none", 1.0, nil, nil},
 	["c4"] = { "C4", "none", 5.0, nil, nil},
 	["bolsadinheiro"] = { "Bolsa de Dinheiro", "none", 2.0, nil, nil},
 	["masterpick"] = { "MasterPick", "none", 1.0, nil, nil},
 	["pendrive"] = { "Pendrive", "none", 1.0, nil, nil},
 	["furadeira"] = { "Furadeira", "none", 3.0, nil, nil},
 	["lockpick"] = { "Lock Pick", "usar", 1.0, nil, nil},
 	["placa"] = { "Placa", "usar", 1.0, nil, nil},
 	["rastreador"] = { "rastreador", "usar", 1.0, nil, nil},
 	["chave"] = { "chave", "usar", 1.0, nil, nil},

-- 	-- Itens Mafia
     ["m-aco"] = { "Aço", "none", 0.1, nil, nil},
 	["metal"] = { "Placa de Metal", "none", 0.1, nil, nil},
 	["pecadearma"] = { "Peça de arma", "none", 0.3, nil, nil},
 	["molas"] = { "Molas", "none", 0.3, nil, nil},
     ["m-capa_colete"] = { "Capa Colete", "none", 0.8, nil, nil},
     ["m-corpo_ak47_mk2"] = { "Corpo de AK47", "none", 0.5, nil, nil},
     ["m-corpo_g3"] = { "Corpo de G3", "none", 0.5, nil, nil},
     ["m-corpo_machinepistol"] = { "Corpo de TEC-9", "none", 2.0, nil, nil},
     ["m-corpo_pistol_mk2"] = { "Corpo de Pistol", "none", 0.5, nil, nil},
     ["m-corpo_shotgun"] = { "Corpo de Shotgun", "none", 0.8, nil, nil},
     ["m-corpo_smg_mk2"] = { "Corpo de SMG", "none", 2.0, nil, nil},
     ["m-corpo_snspistol_mk2"] = { "Corpo de Fajuta", "none", 1.0, nil, nil},
     ["m-gatilho"] = { "Gatilho", "none", 0.8, nil, nil},
 	["gatilho"] = { "Gatilho", "none", 0.1, nil, nil},
     ["m-malha"] = { "Malha", "none", 0.1, nil, nil},
    ["aluminio"] = { "Aluminio", "none", 0.1, nil, nil},
     ["m-tecido"] = { "Tecido", "none", 0.1, nil, nil},

-- 	-- Itens Cartel
 	["c-cobre"] = { "Cobre", "none", 0.1, nil, nil},
    ["c-ferro"] = { "Ferro", "none", 0.1, nil, nil},
     ["c-fio"] = { "Fio", "none", 0.1, nil, nil},
 	["c-polvora"] = { "Polvora", "none", 0.3, nil, nil},
 	["polvora"] = { "Polvora", "none", 0.1, nil, nil},
 	["capsulas"] = { "Cápsulas", "none", 0.1, nil, nil},

-- 	-- Itens Lavagem
 	["l-alvejante"] = { "Alvejante", "none", 0.1, nil, nil},

 	-- Itens Drogas
	["haxixe"] = { "Haxixe", "usar", 0.2, nil, nil},
 	["resinacannabis"] = { "Resina de Cannabis", "none", 0.3, nil, nil},  
	["folhamaconha"] = { "Folha de Maconha", "none", 0.3, nil, nil},
     ["maconha"] = { "Maconha", "usar", 0.2, nil, nil},
     ["pastabase"] = { "Pasta Base", "none", 0.3, nil, nil},
     ["cocaina"] = { "Cocaina", "usar", 0.2, nil, nil},
 	["Acidodolacisd"] = { "Acido LSD", "none", 0.3, nil, nil},
 	["tiner"] = {"Tiner", "none", 0.3, nil, nil},
 	["lancaperfume"] = {"Lança Perfume", "none", 0.3, nil, nil},
 	["opiopapoula"] = { "Pó de Opio", "none", 0.3, nil, nil},
	

-- 	-- Pacotes de craft
 	["pacote_eletrico"] = { "Pacote Eletrico", "none", 3.0, nil, nil},
    ["pacote_componentes"] = { "Pacote de Componentes", "none", 5.0, nil, nil},
 	["pacote_tecido"] = { "Pacote de Tecido", "none", 0.4, nil, nil},
 	["pacote_metalico"] = { "Pacote Metalico", "none", 0.9, nil, nil},
 	["pacote_polvora"] = { "Pacote de Polvora", "none", 0.6, nil, nil},

-- 	--hospital
 	["elastico"] = { "elastico", "none", 0.2, nil, nil},
 	["fita_de_pano"] = { "fita_de_pano", "none", 0.2, nil, nil},

--     -- Ilegal
 	["colete"] = { "Colete", "usar", 10.0, nil, nil},
     ["capuz"] = { "Capuz", "usar", 0.1, nil, nil},
     ["dinheirosujo"] = { "Dinheiro Sujo", "none", 0.0, nil, nil},
     ["scubagear"] = { "Kit de Mergulho", "usar", 10.0, nil, nil},

-- 	-- Itens Joalheria
 	["relogioroubado"] = { "Relogio", "none", 0.5, nil, nil},
 	["colarroubado"] = { "Colar", "none", 0.1, nil, nil},
 	["anelroubado"] = { "Anel", "none", 0.1, nil, nil},
 	["brincoroubado"] = { "Brinco", "none", 0.1, nil, nil},
 	["pulseiraroubada"] = { "Pulseira", "none", 0.1, nil, nil},

--     -- Drogas
 	["opio"] = { "Ópio", "usar", 0.3, nil, nil}, 
 	["lsd"] = { "LSD", "usar", 0.3, nil, nil}, 
 	["morfina"] = { "Morfina", "none", 0.3, nil, nil},
 	["heroina"] = { "Heroina", "usar", 0.3, nil, nil},
 	["anfetamina"] = { "Anfetamina", "none", 0.3, nil, nil},
 	["metanfetamina"] = { "Metanfetamina ", "usar", 0.3, nil, nil},
 	["balinha"] = { "Balinha", "usar", 0.3, nil, nil},

--     -- Tartaruga
     ["tartaruga"] = { "Tartaruga", "none", 3.0, nil, nil},

--     -- Pescaria
     ["isca"] = { "Isca", "none", 0.15, nil, nil},
     ["pacu"] = { "Pacu", "none", 1.5, nil, nil},
     ["tilapia"] = { "Tilapia", "none", 0.50, nil, nil},
     ["salmao"] = { "Salmao", "none", 1.0, nil, nil},
     ["tucunare"] = { "Tucunare", "none", 2.0, nil, nil},
     ["dourado"] = { "Dourado", "none", 3.0, nil, nil},

--     -- Lenhador
     ["madeira"] = { "Madeira", "none", 2.5, nil, nil},

-- 	-- Graos
     ["graosimpuros"] = { "Graos", "none", 1.0, nil, nil},
	
-- 	-- Entregador
 	["caixa"] = { "Caixa de entrega", "none", 1.5, nil, nil},

-- 	-- Mineracao
 	["bronze"] = { "Bronze", "none", 1.0, nil, nil},
 	["ferro"] = { "Ferro", "none", 0.1, nil, nil},
 	["ouro"] = { "Ouro", "none", 1.0, nil, nil},
 	["diamante"] = { "Diamante", "none", 1.0, nil, nil},
 	["rubi"] = { "Rubi", "none", 1.0, nil, nil},
 	["safira"] = { "Safira", "none", 1.0, nil, nil},
 	-- BEBIDAS
 	["energetico"] = { "Energetico", "beber", 0.15, nil, -50},

-- 	-- ALCOLICAS
 	["vodka"] = { "Vodka", "bebera", 1.0, 10, -7},
	["cerveja"] = { "Cerveja", "bebera", 0.5, 3, -10},
 	["corote"] = { "Corote", "bebera", 0.5, 20, -10},
 	["pinga"] = { "Pinga", "bebera", 1.0, 15, -10},
 	["whisky"] = { "Whisky", "bebera", 1.0, 10, -8}, 
 	["absinto"] = { "Absinto", "bebera", 0.5, 10, -10},
 	["skolb"] = { "Skol Beats", "bebera", 0.15, 5, -13},

-- 	-- REMEDIOS
 	["amoxilina"] = { "Amoxilina", "remedio", 0.05, 5, nil},
 	["cataflan"] = { "Cataflan", "remedio", 0.05, 5, nil},
 	["cicatricure"] = { "Cicatricure", "remedio", 0.05, 5, nil},
 	["clozapina"] = { "Clozapina", "remedio", 0.05, 5, nil},
 	["dipirona"] = { "Dipirona", "remedio", 0.05, 5, nil},
	["paracetamol"] = { "Paracetamol", "remedio", 0.05, 5, nil},
 	["rivotril"] = { "Rivotril", "remedio", 0.05, 5, nil},
 	["riopan"] = { "Riopan", "remedio", 0.05, 5, nil},
 	["luftal"] = { "Luftal", "remedio", 0.05, 5, nil},
 	["coumadin"] = { "Coumadin", "remedio", 0.05, 5, nil},
 	["dorflex"] = { "Dorflex", "remedio", 0.05, 5, nil},
 	["anticoncepcional"] = { "Anticoncepcional", "remedio", 0.05, 5, nil},
 	["camisinha"] = { "Camisinha", "remedio", 0.05, 5, nil},
 	["fluoxetina"] = { "Fluoxetina", "remedio", 0.05, 5, nil},
 	["bandagem"] = { "Bandagem", "remedio", 0.5, 5, nil},

	["comboluxo"] = { "Combo Luxo", "usar", 0.5, 5, nil},


 	["WEAPON_FIREWORK"] = { "Fogos", "equipar", 3.0, nil, nil},
 	["WEAPON_SNOWBALL"] = { "Bola de Neve", "equipar", 3.0, nil, nil},
 	["WEAPON_BZGAS"] = { "Gas", "equipar", 3.0, nil, nil},
 	["WEAPON_REVOLVER_MK2"] = { "Revolver", "equipar", 3.0, nil, nil},


-- 	-- PISTOLAS
 	["WEAPON_SNSPISTOL_MK2"] = { "Fajuta", "equipar", 3.0, nil, nil},
 	["AMMO_SNSPISTOL_MK2"] = { "M-Fajuta", "recarregar", 0.05, nil, nil},

 	["WEAPON_PISTOL_MK2"] = { "Five-Seven", "equipar", 3.0, nil, nil},
 	["AMMO_PISTOL_MK2"] = { "M-Five-Seven", "recarregar", 0.05, nil, nil},

 	["WEAPON_FLAREGUN"] = { "FLAREGUN", "equipar", 3.0, nil, nil},
 	["WEAPON_RAYPISTOL"] = { "RAYPISTOL", "equipar", 3.0, nil, nil},

 	["WEAPON_FIREWORK"] = { "Fogos", "equipar", 3.0, nil, nil},
 	["WEAPON_SNOWBALL"] = { "Bola de Neve", "equipar", 3.0, nil, nil},
 	["WEAPON_BZGAS"] = { "Gas", "equipar", 3.0, nil, nil},
 	["WEAPON_REVOLVER_MK2"] = { "Revolver", "equipar", 3.0, nil, nil},

 	["AMMO_FIREWORK"] = { "M-Fogos", "recarregar", 0.05, nil, nil},
 	["AMMO_SNOWBALL"] = { "M-Bola", "recarregar", 0.05, nil, nil},
 	["AMMO_BZGAS"] = { "M-Gas", "recarregar", 0.05, nil, nil},
 	["AMMO_REVOLVER_MK2"] = { "M-Revolver", "recarregar", 0.05, nil, nil},



 	["WEAPON_GUSENBERG"] = { "Submetralhadora Thompson", "equipar", 3.0, nil, nil},
 	["AMMO_GUSENBERG"] = { "M-Thompson", "recarregar", 0.05, nil, nil},

 	["WEAPON_PISTOL50"] = { "Desert Eagle", "equipar", 3.0, nil, nil},
 	["AMMO_PISTOL50"] = { "M-Desert", "recarregar", 0.05, nil, nil},

	["WEAPON_COMBATPISTOL"] = { "Glock", "equipar", 3.0, nil, nil},
 	["AMMO_COMBATPISTOL"] = { "M-Glock", "recarregar", 0.05, nil, nil},

 	["WEAPON_COMBATPDW"] = { "Combat Pdw", "equipar", 3.0, nil, nil},
 	["AMMO_COMBATPDW"] = { "M-Pdw", "recarregar", 0.05, nil, nil},

-- 	-- MACHADOS
 	["WEAPON_HATCHET"] = { "Machados", "equipar", 3.0, nil, nil},
 	["WEAPON_KNIFE"] = { "Faca", "equipar", 3.0, nil, nil},
 	["WEAPON_DAGGER"] = { "Dagger", "equipar", 3.0, nil, nil},
 	["WEAPON_KNUCKLE"] = { "Knuckle", "equipar", 3.0, nil, nil},
 	["WEAPON_MACHETE"] = { "Machete", "equipar", 3.0, nil, nil},
 	["WEAPON_SWITCHBLADE"] = { "SwitchBlade", "equipar", 3.0, nil, nil},
 	["WEAPON_WRENCH"] = { "Wrench", "equipar", 3.0, nil, nil},
	["WEAPON_HAMMER"] = { "Hammer", "equipar", 3.0, nil, nil},
	["WEAPON_GOLFCLUB"] = { "GolfClub", "equipar", 3.0, nil, nil},
 	["WEAPON_CROWBAR"] = { "CrowBar", "equipar", 3.0, nil, nil},
 	["WEAPON_FLASHLIGHT"] = { "Lanterna", "equipar", 3.0, nil, nil},
 	["WEAPON_BAT"] = { "Bastão de Beisebol", "equipar", 3.0, nil, nil},
 	["WEAPON_BOTTLE"] = { "Bottle", "equipar", 3.0, nil, nil},
 	["WEAPON_BATTLEAXE"] = { "Battleaxe", "equipar", 3.0, nil, nil},
	["WEAPON_POOLCUE"] = { "Poolcue", "equipar", 3.0, nil, nil},
	["GADGET_PARACHUTE"] = { "Paraquedas", "equipar", 3.0, nil, nil},
 	["WEAPON_FLARE"] = { "Sinalizador", "equipar", 3.0, nil, nil},
	
-- 	-- SUBMETRALHADORA
 	["WEAPON_MACHINEPISTOL"] = { "Tec-9", "equipar", 6.0, nil, nil},
 	["AMMO_MACHINEPISTOL"] = { "M-Tec-9", "recarregar", 0.05, nil, nil},

 	["WEAPON_SMG_MK2"] = { "Smg MK2", "equipar", 6.0, nil, nil},
 	["AMMO_SMG_MK2"] = { "M-Smg MK2", "recarregar", 0.05, nil, nil},

 	["WEAPON_SMG"] = { "SMG", "equipar", 6.0, nil, nil},
 	["AMMO_SMG"] = { "M-SMG", "recarregar", 0.05, nil, nil},

 	["WEAPON_MICROSMG"] = { "MICRO-SMG", "equipar", 6.0, nil, nil},
 	["AMMO_MICROSMG"] = { "MICRO-M-SMG", "recarregar", 0.05, nil, nil},

 	["WEAPON_ASSAULTSMG"] = { "MTAR", "equipar", 6.0, nil, nil},
 	["AMMO_ASSAULTSMG"] = { "M-MTAR", "recarregar", 0.05, nil, nil},

-- 	-- SHOTGUN
 	["WEAPON_SAWNOFFSHOTGUN"] = { "Shotgun", "equipar", 8.0, nil, nil},
 	["AMMO_SAWNOFFSHOTGUN"] = { "M-Shotgun", "recarregar", 0.05, nil, nil},

 	["WEAPON_PUMPSHOTGUN_MK2"] = { "Pump Shotgun", "equipar", 8.0, nil, nil},
 	["AMMO_PUMPSHOTGUN_MK2"] = { "M-Pump Shotgun", "recarregar", 0.05, nil, nil},

-- 	-- FUZIL
 	["WEAPON_ASSAULTRIFLE"] = { "AK 47", "equipar", 8.0, nil, nil},
 	["AMMO_ASSAULTRIFLE"] = { "M-AK-47", "recarregar", 0.05, nil, nil},
 	["WEAPON_ASSAULTRIFLE_MK2"] = { "AK MK2", "equipar", 8.0, nil, nil}, --POLICIA
 	["AMMO_ASSAULTRIFLE_MK2"] = { "M-AK MK2", "recarregar", 0.05, nil, nil},

 	["WEAPON_HEAVYSNIPER"] = { "SNIPER", "equipar", 8.0, nil, nil},
 	["AMMO_HEAVYSNIPER"] = { "M-SNIPER", "recarregar", 0.05, nil, nil},
	

 	["WEAPON_SPECIALCARBINE_MK2"] = { "G3", "equipar", 8.0, nil, nil},
 	["AMMO_SPECIALCARBINE_MK2"] = { "M-G3", "recarregar", 0.05, nil, nil},

 	["WEAPON_DOUBLEACTION"] = { "DOUBLEACTION", "equipar", 8.0, nil, nil},
 	["AMMO_DOUBLEACTION"] = { "M-DOUBLEACTION", "recarregar", 0.05, nil, nil},

 	["WEAPON_CARBINERIFLE"] = { "M4", "equipar", 8.0, nil, nil},
 	["AMMO_CARBINERIFLE"] = { "M-M4", "recarregar", 0.05, nil, nil},
 	["WEAPON_CARBINERIFLE_MK2"] = { "M4", "equipar", 6.0, nil, nil},
 	["AMMO_CARBINERIFLE_MK2"] = { "M-M4", "recarregar", 0.05, nil, nil},

 	["WEAPON_SPECIALCARBINE"] = { "Parafal", "equipar", 8.0, nil, nil},
 	["AMMO_SPECIALCARBINE"] = { "M-Parafal", "recarregar", 0.05, nil, nil},
	
-- 	-- TAZER
 	["WEAPON_STUNGUN"] = { "Tazer", "equipar", 1.0, nil, nil},

-- 	-- GALAO DE GASOLINA
 	["WEAPON_PETROLCAN"] = { "Galão de gasolina", "equipar", 1.0, nil, nil},
	["AMMO_PETROLCAN"] = { "Gasolina", "equipar", 0.05, nil, nil},
}





 return cfg

