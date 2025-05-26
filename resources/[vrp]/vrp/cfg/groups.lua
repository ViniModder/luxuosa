local cfg = {}

cfg.groups = {
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ADMINISTRAÇÃO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["owner"] = { _config = { gtype = "staff", salario = 0 }, "admin.permissao", "owner.permissao", "dv.permissao", "player.som", "prop.permissao","imunidade.permissao","wall.permissao","configuracao.permissao","spawner.permissao","tban.permissao","tunban.permissao","ticket.permissao","skins.permissao",  "developer.permissao","player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao","hall.permissao", "perm.ptr.staff",  "perm.algemar", "perm.portearmas" },
	["owneroff"] = { _config = { gtype = "staff", salario = 0 }, "perm.user", "staffoff.permissao","skins.permissao",  "perm.ptr.staff" },
	["administrador"] = { _config = { gtype = "staff", salario = 5000 }, "admin.permissao", "dv.permissao","developer.permissao", "player.blips", "player.noclip", "player.teleport","wall.permissao", "player.secret",  "player.spec", "adminm.permissao","player.wall","spec.permissao", "perm.ptr.staff", "perm.algemar", },
	["admin"] = { _config = { gtype = "staff", salario = 4000 }, "admin.permissao", "dv.permissao", "player.blips", "player.noclip", "player.teleport", "wall.permissao","player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar", },
	["adminoff"] = { _config = { gtype = "staff", salario = 0 }, "perm.user", "staffoff.permissao","skins.permissao",  "perm.ptr.staff" },
	["moderador"] = { _config = { gtype = "staff", salario = 3000 }, "moderador.permissao", "dv.permissao","skins.permissao",  "ticket.permissao", "player.blips", "player.noclip", "wall.permissao","player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar", },
	["moderadoroff"] = { _config = { gtype = "staff", salario = 0 }, "perm.user", "staffoff.permissao","skins.permissao",  "perm.ptr.staff" },
	["suporte"] = { _config = { gtype = "staff", salario = 1000 }, "suporte.permissao", "dv.permissao","skins.permissao",  "player.som","ticket.permissao", "player.blips", "player.noclip","wall.permissao", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar", },
	["suporteoff"] = { _config = { gtype = "staff", salario = 0 }, "perm.user", "staffoff.permissao","skins.permissao",  "perm.ptr.staff" },
	["user"] = { "perm.user"},
	["streamer"] = { _config = { gtype = "player.som",},"Vipstreamer", "streamer.permissao",},
	["investidoranjo"] = { _config = { gtype = "staff" }, "investidoranjo.permissao" },


	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- VIPS 
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	---- VIPS  
	["GaragemVip"] = { _config = { salario = 0, ptr = nil }, "perm.garagemvip" },
	--["Inicial"] = { _config = { gtype = "Inicial", salario = 4000, ptr = nil }, "perm.vips", "perm.inicial" },
	["VipNatal"] = { _config = { gtype = "Vip Natal", salario = 50000, ptr = nil }, "perm.vips", "perm.vipnatal", "skins.permissao", "perm.roupas", "perm.mochila","player.som" },
	["Vipfacção"] = { _config = { gtype = "Vip Facção", salario = 10000, ptr = nil }, "perm.Vipfacção", },---vipfacçao

	["VipWipe"] = { _config = { gtype = "Vip Wipe", salario = 10000, ptr = nil }, "perm.vips","perm.ati", "perm.vipwipe", "perm.fixvip", "perm.roupas", "perm.mochila","player.som" },
	["Bronze"] = { _config = { gtype = "Vip Bronze", salario = 4000, ptr = nil }, "perm.bronze", "perm.mochila",},---vip robson 
	["Prata"] = { _config = { gtype = "Vip Prata", salario = 4500, ptr = nil }, "perm.prata", "perm.mochila","perm.roupas", },
    ["Ouro"] = { _config = { gtype = "Vip Ouro", salario = 6000, ptr = nil }, "perm.vipouro",  "perm.roupas","player.som" },
	["Platina"] = { _config = { gtype = "Vip Platina", salario = 8000, ptr = nil }, "perm.vips", "perm.vipplatina", "skins.permissao", "perm.roupas", "player.som" },
	["Diamante"] = { _config = { gtype = "Vip Diamante", salario = 10500, ptr = nil }, "perm.vips", "perm.vipdiamante", "skins.permissao", "perm.roupas", "perm.mochila","player.som" },
	["Luxuosa"] = { _config = { gtype = "Vip LUXUOSA", salario = 13000, ptr = nil }, "perm.vips", "perm.vipluxuosa", "skins.permissao", "perm.roupas", "perm.mochila","player.som" },
	["SupremoLuxuosa"] = { _config = { gtype = "VipSupremo LUXUOSA", salario = 16000, ptr = nil }, "perm.vips", "perm.vipsupremoluxuosa", "skins.permissao", "perm.roupas", "perm.mochila","player.som", "perm.fixvip" },
	["Monster"] = { _config = { gtype = "Vip Monster", salario = 20000, ptr = nil }, "perm.vips", "perm.vipmonster", "skins.permissao", "perm.roupas", "perm.mochila","player.som", "perm.fixvip" },
	["God"] = { _config = { gtype = "Vip God", salario = 22000, ptr = nil }, "perm.vips","perm.vipgod","skins.permissao", "perm.roupas", "perm.mochila","player.som", "perm.fixvip" },
	["Rubi"] = { _config = { gtype = "Vip Rubi", salario = 25000, ptr = nil }, "perm.vips","perm.viprubi","skins.permissao", "perm.roupas", "perm.mochila","player.som", "perm.fixvip" },
	["Esmeralda"] = { _config = { gtype = "Vip Esmeralda", salario = 35000, ptr = nil }, "perm.vips","perm.vipesmeralda", "skins.permissao", "hall.permissao", "perm.roupas", "perm.mochila","player.som", "perm.fixvip" },
	["Streamer"] = { _config = { gtype = "player.som",},"Vipstreamer", "streamer.permissao", "perm.fixvip"  },


     ["PilotoParticular"] = { _config = { salario = 0, ptr = nil }, "hall.permissao" },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Mansoes
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["mansao1"] = { _config = { salario = 0, ptr = nil }, "perm.mansao1"},--mansao roftop 01  -866.2,-2165.7,101.99
["mansao2"] = { _config = { salario = 0, ptr = nil }, "perm.mansao2"},--mansao aguia norte 1024.77,1721.0,163.11
["mansao3"] = { _config = { salario = 0, ptr = nil }, "perm.mansao3"},--mansao tem uma pantera -1261.55,847.98,191.82
["mansao4"] = { _config = { salario = 0, ptr = nil }, "perm.mansao4"},--mansao 04 zanccudo -3131.65,799.8,17.71
["mansao5"] = { _config = { salario = 0, ptr = nil }, "perm.mansao5"},--mansao 05  -2643.66,1306.91,145.85---norte 
["mansao6"] = { _config = { salario = 0, ptr = nil }, "perm.mansao6"},---mansao 06 -- -2598.31,1669.81,141.17--norte 1
["mansao7"] = { _config = { salario = 0, ptr = nil }, "perm.mansao7"},--mansao 07  -2694.65,-56.16,16.01----- mansao jhon 
["mansao8"] = { _config = { salario = 0, ptr = nil }, "perm.mansao8"},--mansao 08   -125.47,987.38,235.75--robson
["mansao9"] = { _config = { salario = 0, ptr = nil }, "perm.mansao9"},---mansao 9   2470.65,4479.49,36.38--stremer fanny
["mansao10"] = { _config = { salario = 0, ptr = nil }, "perm.mansao10"},---mansao 10 editando ainda 14.5,548.47,176.18
["mansao11"] = { _config = { salario = 0, ptr = nil }, "perm.mansao11"},
["mansao12"] = { _config = { salario = 0, ptr = nil }, "perm.mansao12"},
["mansao13"] = { _config = { salario = 0, ptr = nil }, "perm.mansao13"},
["mansao14"] = { _config = { salario = 0, ptr = nil }, "perm.mansao14"},
["mansao15"] = { _config = { salario = 0, ptr = nil }, "perm.mansao15"},
["mansao16"] = { _config = { salario = 0, ptr = nil }, "perm.mansao16"},
["mansao17"] = { _config = { salario = 0, ptr = nil }, "perm.mansao17"},
["mansao18"] = { _config = { salario = 0, ptr = nil }, "perm.mansao18"},--samuca 

---rgbcar 
["rgbcar"] = { _config = { salario = 0, ptr = nil }, "rgbcar.permissao"},
["ati"] = { _config = { salario = 0, ptr = nil }, "ati.permissao"},---------eduard ataches 
["spotfay"] = { _config = { salario = 0, ptr = nil }, "player.som"},---------eduard ataches 







------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BENEFICIOS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Estagiario"] = { _config = { gtype = "jobdois", salario = 2000, ptr = nil }, "perm.estagiario"},
	["Funcionario"] = { _config = { gtype = "jobtres", salario = 4000, ptr = nil }, "perm.funcionario"},
	["Gerente"] = { _config = { gtype = "jobquatro", salario = 6000, ptr = nil }, "perm.gerente"},
	["Patrao"] = { _config = { gtype = "jobcinco", salario = 8000, ptr = nil }, "perm.patrao"},

	
	["CasaDoFranklin"] = { _config = { gtype = "jobseis", salario = 0, ptr = nil }, "perm.franklin"},
	["spotify"] = { _config = { gtype = "spotify", salario = 0, ptr = nil },"player.som", "perm.spotify" },
	["Booster"] = { _config = { salario = 0, ptr = nil }, "skins.permissao" },
	["Verificado"] = { _config = { salario = 0, ptr = nil }, "perm.verificado"},
	["Vagas"] = { _config = { salario = 0, ptr = nil }, "perm.vagastres"},
	["VagasQuarenta"] = { _config = { salario = 0, ptr = nil }, "perm.vagasquarenta"}, 
	
	["valecasa"] = { _config = { salario = 0, ptr = nil }, "valecasa.permissao"}, 
	["valegaragem"] = { _config = { salario = 0, ptr = nil }, "valegaragem.permissao"}, 
	["cirurgia"] = { _config = { salario = 0, ptr = nil }, "cirurgia.permissao"}, 
	["foxzin"] = { _config = { salario = 0, ptr = nil }, "foxzin.permissao"}, 
	["ilegal"] = { _config = { salario = 25000, ptr = nil }, "ilegal.permissao"}, 
	["evento"] = { _config = { salario = 25000, ptr = nil }, "perm.evento"}, 

	["ValeCasaEsmeralda"] = { _config = { salario = 0, ptr = nil }, "valecasaesmeralda.permissao"}, 
	["ValeCasaRubi"] = { _config = { salario = 0, ptr = nil }, "valecasarubi.permissao"}, 

	["playboy"] = { _config = { salario = 0, ptr = nil }, "playboy.permissao"}, 
	["malibu"] = { _config = { salario = 0, ptr = nil }, "perm.malibu"}, 

	["starckhouse"] = { _config = { salario = 0, ptr = nil }, "perm.starckhouse"}, 
	["snakehouse"] = { _config = { salario = 0, ptr = nil }, "perm.snakehouse"}, 
	["beiramarhouse"] = { _config = { salario = 0, ptr = nil }, "perm.beiramarhouse"}, 
	["casadolado"] = { _config = { salario = 0, ptr = nil }, "perm.casadolago"}, 

	["manobras"] = { _config = { salario = 0, ptr = nil }, "perm.manobras"}, 

	-- barcos

	["sr650fly"] = { _config = { salario = 0, ptr = nil }, "sr650fly.permissao"}, 
	["yacht2"] = { _config = { salario = 0, ptr = nil }, "yacht2.permissao"}, 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- ["paintball"] = { _config = { salario = 0, ptr = nil }, "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall" },
	-- ["Porte de Armas"] = { _config = { salario = 0, ptr = nil }, "perm.portearmas" },
	--------------SKINS-----------------------------
	------------------------------------------------
	["GirlBooster"] = { _config = { salario = 0, ptr = nil }, "GirlBooster.permissao"}, 
	["jessica"] = { _config = { salario = 0, ptr = nil }, "jessica.permissao"}, 
	["majuzinha"] = { _config = { salario = 0, ptr = nil }, "majuzinha.permissao"}, 
	["KidKolt"] = { _config = { salario = 0, ptr = nil }, "KidKolt.permissao"}, 
	["jubyleu"] = { _config = { salario = 0, ptr = nil }, "jubyleu.permissao"}, 
	["Ananda"] = { _config = { salario = 0, ptr = nil }, "Ananda.permissao"}, 
	["Zack2"] = { _config = { salario = 0, ptr = nil }, "Zack2.permissao"}, 
	["LS_Maimai"] = { _config = { salario = 0, ptr = nil }, "LS_Maimai.permissao"}, 
	["dudinha"] = { _config = { salario = 0, ptr = nil }, "dudinha.permissao"}, 
	--------------------Adultos--------------------
	["queijinho"] = { _config = { salario = 0, ptr = nil }, "queijinho.permissao"},
	["ig_datena"] = { _config = { salario = 0, ptr = nil }, "ig_datena.permissao"},
	["TeenDuda"] = { _config = { salario = 0, ptr = nil }, "TeenDuda.permissao"},
	["ig_indio"] = { _config = { salario = 0, ptr = nil }, "ig_indio.permissao"},
	["gaab"] = { _config = { salario = 0, ptr = nil }, "gaab.permissao"},
	["paola"] = { _config = { salario = 0, ptr = nil }, "paola.permissao"},
	["ig_henry"] = { _config = { salario = 0, ptr = nil }, "ig_henry.permissao"},
	["ig_gigante"] = { _config = { salario = 0, ptr = nil }, "ig_gigante.permissao"},
	["caioba"] = { _config = { salario = 0, ptr = nil }, "caioba.permissao"},
	["ig_mineiro"] = { _config = { salario = 0, ptr = nil }, "ig_mineiro.permissao"},
	["ig_thimagro2"] = { _config = { salario = 0, ptr = nil }, "ig_thimagro2.permissao"},
	["ig_thimagro"] = { _config = { salario = 0, ptr = nil }, "ig_thimagro.permissao"},
	["caioanao"] = { _config = { salario = 0, ptr = nil }, "caioanao.permissao"},
	["LUCI_LuisAnao"] = { _config = { salario = 0, ptr = nil }, "LUCI_LuisAnao.permissao"},
	["Scooby"] = { _config = { salario = 0, ptr = nil }, "Scooby.permissao"},
	["LEOGULLO"] = { _config = { salario = 0, ptr = nil }, "LEOGULLO.permissao"},
	["ig_tmaia"] = { _config = { salario = 0, ptr = nil }, "ig_tmaia.permissao"},
	["ig_geraldo"] = { _config = { salario = 0, ptr = nil }, "ig_geraldo.permissao"},
	["ig_gagao"] = { _config = { salario = 0, ptr = nil }, "ig_gagao.permissao"},
	["ig_guuh"] = { _config = { salario = 0, ptr = nil }, "ig_guuh.permissao"},
	["ig_freddie"] = { _config = { salario = 0, ptr = nil }, "ig_freddie.permissao"},
	["ig_fejao"] = { _config = { salario = 0, ptr = nil }, "ig_fejao.permissao"},
	["JujuHysiz"] = { _config = { salario = 0, ptr = nil }, "JujuHysiz.permissao"},
	["ig_tiaveia"] = { _config = { salario = 0, ptr = nil }, "ig_tiaveia.permissao"},
	["Smeagol"] = { _config = { salario = 0, ptr = nil }, "Smeagol.permissao"},
	["pedtia"] = { _config = { salario = 0, ptr = nil }, "pedtia.permissao"},
	["nam"] = { _config = { salario = 0, ptr = nil }, "nam.permissao"},
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA PMERJ
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["ComandoPMERJ"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.pmerj","perm.blindado", "perm.CoronelBope","perm.recrutamentopm","perm.ComandoPMERJ", "perm.baupolicialiderpmerj", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj" },
["CoronelPMERJ"] = { _config = { gtype = "org", salario = 9000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.pmerj","perm.recrutamentopm","perm.blindado", "perm.baupolicialiderpmerj", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj" },
["TenenteCoronelPMERJ"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.blindado","perm.pmerj","perm.baupolicialiderpmerj","perm.recrutamentopm", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["MajorPMERJ"] = { _config = { gtype = "org", salario = 7000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.blindado", "player.blips","perm.recrutamentopm", "perm.pmerj","perm.baupolicialiderpmerj", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["CapitaoPMERJ"] = { _config = { gtype = "org", salario = 6000, ptr = nil , orgName = "Policia"}, "perm.policia", "player.blips","perm.recrutamentopm","perm.baupolicialiderpmerj","perm.pmerj", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["PrimeiroTenentePMERJ"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.pmerj", "player.blips","perm.recrutamentopm", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["SegundoTenentePMERJ"] = { _config = { gtype = "org", salario = 4000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.pmerj","player.blips","perm.recrutamentopm", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["SubTenentePMERJ"] = { _config = { gtype = "org", salario = 3000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips", "perm.disparo","perm.recrutamentopm", "perm.portasolicia", "perm.algemar", "perm.pmerj","perm.radiopmerj"  },
["PrimeiroSargentoPMERJ"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.pmerj","perm.recrutamentopm", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["SegundoSargentoPMERJ"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.recrutamentopm", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["TerceiroSargentoPMERJ"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.pmerj","player.blips","perm.recrutamentopm", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["CaboPMERJ"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.pmerj", "player.blips", "perm.disparo","perm.recrutamentopm", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },
["SoldadoPMERJ"] = { _config = { gtype = "org", salario = 1000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia","perm.pmerj", "perm.algemar", "perm.radiopmerj"  },
["AlunoPMERJ"] = { _config = { gtype = "org", salario = 1000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.pmerj", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopmerj"  },


["Chamado Policia"] = { _config = { salario = 0, ptr = nil }, "perm.chamadoPolicia" },

	
-------------------------------------------------
-- POLICIA EXERCITO ---------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Coronel"] = { _config = { gtype = "org", salario = 30000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.Coronel", "perm.baupolicialider","perm.recrutamentoexercito", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiopolicia" },
["TenenteCoronel"] = { _config = { gtype = "org", salario = 28000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.baupolicialider","perm.recrutamentoexercito", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["Major"] = { _config = { gtype = "org", salario = 26000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips", "perm.disparo","perm.recrutamentoexercito", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["Capitao"] = { _config = { gtype = "org", salario = 24000, ptr = nil , orgName = "Policia"}, "perm.policia", "player.blips", "perm.disparo","perm.recrutamentoexercito", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["PrimeiroTenente"] = { _config = { gtype = "org", salario = 22000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.recrutamentoexercito", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["SegundoTenente"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.recrutamentoexercito", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["SubTenente"] = { _config = { gtype = "org", salario = 18000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.recrutamentoexercito", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["PrimeiroSargento"] = { _config = { gtype = "org", salario = 16000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.recrutamentoexercito", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["SegundoSargento"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips", "perm.recrutamentoexercito","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["TerceiroSargento"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips","perm.recrutamentoexercito", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["Cabo"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },
["Soldado"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Policia" }, "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioexercito"  },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA BOPE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["CoronelBope"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.ComandoPMERJ", "perm.bope","perm.blindado","perm.CoronelBope","perm.baupolicialider","perm.heli","perm.recrutamentobope", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope" },
["TenenteCoronelBope"] = { _config = { gtype = "org", salario = 18000, ptr = nil, orgName = "Policia" }, "perm.policia","perm.blindado", "perm.bope", "perm.baupolicialider","perm.recrutamentobope","perm.heli", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["MajorBope"] = { _config = { gtype = "org", salario = 16000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "perm.blindado","perm.baupolicialider","perm.recrutamentobope", "player.blips", "perm.heli","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["CapitaoBope"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "perm.baupolicialider","perm.recrutamentobope", "player.blips", "perm.disparo", "perm.heli","perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["PrimeiroTenenteBope"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "perm.baupolicialider","perm.recrutamentobope", "player.blips", "perm.disparo","perm.heli", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["SegundoTenenteBope"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "perm.heli", "player.blips", "perm.disparo","perm.recrutamentobope", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["AspiranteBope"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["PrimeiroSargentoBope"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["SegundoSargentoBope"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["TerceiroSargentoBope"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },
["CaboBope"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.bope", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiobope"  },


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA FEDERAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["CoronelFederal"] = { _config = { gtype = "org", salario = 18000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.CoronelFederal","perm.federal", "perm.baupolicialider","perm.recrutamentofederal", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal" },
["MajorFederal"] = { _config = { gtype = "org", salario = 16000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "perm.baupolicialider","perm.recrutamentofederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },
["CapitaoFederal"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "perm.baupolicialider","perm.recrutamentofederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },
["TenenteFederal"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "perm.baupolicialider","perm.recrutamentofederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },
["SargentoFederal"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "perm.baupolicialider","perm.recrutamentofederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },
["CaboFederal"] = { _config = { gtype = "org", salario = 80000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "player.blips", "perm.disparo","perm.recrutamentofederal", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },
["SoldadoFederal"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },
["RecrutaFederal"] = { _config = { gtype = "org", salario = 4000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.federal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiofederal"  },



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA PRF
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["CoronelPRF"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "perm.baupolicialider","perm.recrutamentoprf", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf" },
["MajorPRF"] = { _config = { gtype = "org", salario = 18000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "perm.baupolicialider","perm.recrutamentoprf", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },
["CapitaoPRF"] = { _config = { gtype = "org", salario = 16000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "perm.baupolicialider","perm.recrutamentoprf", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },
["TenentePRF"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "perm.baupolicialider","perm.recrutamentoprf", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },
["SargentoPRF"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "perm.baupolicialider","perm.recrutamentoprf", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },
["CaboPRF"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "player.blips", "perm.disparo","perm.recrutamentoprf", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },
["SoldadoPRF"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },
["RecrutaPRF"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.prf", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radioprf"  },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA CIVIL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["DelegadoGeral"] = { _config = { gtype = "org", salario = 25000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.DelegadoGeral","perm.recrutamentocivil", "perm.baupoliciacivillider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["ComandanteCore"] = { _config = { gtype = "org", salario = 25000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.recrutamentocivil", "perm.baupoliciacivillider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["SubComandanteCore"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.recrutamentocivil", "perm.baupoliciacivillider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["Delegado"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.recrutamentocivil", "perm.policia","player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["Core"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.recrutamentocivil", "player.blips", "perm.disparo", "perm.policia.radio", "perm.portasolicia", "perm.algemar", "perm.radiocivil" },
["Perito"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.recrutamentocivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["Escrivao"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.recrutamentocivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["Investigador"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia","perm.recrutamentocivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["Agente"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },
["Recruta"] = { _config = { gtype = "org", salario = 4000, ptr = nil, orgName = "Policia" }, "perm.policiacivil","perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.radiocivil"  },


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HOSPITAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Diretor"] = { _config = { gtype = "org", salario = 16000, ptr = nil, orgName = "Hospital" },"dv.permissao","perm.recrutamentohp","perm.Diretor", "hospital.permissao","perm.unizk","perm.hplider","perm.radiohp","samu.permissao" },
["ViceDiretor"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Hospital"},"dv.permissao","perm.recrutamentohp", "hospital.permissao","perm.unizk","perm.hplider","perm.radiohp", "samu.permissao" },
["Medico"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Hospital"},"dv.permissao","perm.recrutamentohp", "hospital.permissao","perm.unizk", "perm.radiohp","samu.permissao" },
["Enfermeiro"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Hospital"}, "hospital.permissao","perm.recrutamentohp","perm.unizk","perm.radiohp", "samu.permissao" },
["Socorrista"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Hospital"}, "hospital.permissao","perm.unizk","perm.radiohp", "samu.permissao" },
["Estagiario"] = { _config = { gtype = "org", salario = 6000, ptr = nil, orgName = "Hospital"},"dv.permissao", "hospital.permissao","perm.unizk", "perm.radiohp","samu.permissao" },

["Chamado Hospital"] = { _config = { salario = 0, ptr = nil }, "perm.chamadoHospital" },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BOMBEIROS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["CoronelBombeiros"] = { _config = { gtype = "org", salario = 27000, ptr = nil, orgName = "Bombeiro" },"dv.permissao","perm.CoronelBombeiros","perm.recrutamentobombeiro","bombeiroslider.permissao", "perm.radiobombeiros", "perm.unizk" },
["MajorBombeiros"] = { _config = { gtype = "org", salario = 25000, ptr = nil, orgName = "Bombeiro"},"dv.permissao","bombeiroslider.permissao","perm.recrutamentobombeiro", "perm.radiobombeiros", "perm.unizk" },
["SargentoBombeiros"] = { _config = { gtype = "org", salario = 23000, ptr = nil, orgName = "Bombeiro"},"dv.permissao","bombeiroslider.permissao","perm.recrutamentobombeiro","perm.radiobombeiros",  "perm.unizk" },
["TenenteBombeiros"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Bombeiro"},"dv.permissao","bombeiroslider.permissao", "perm.recrutamentobombeiro","perm.radiobombeiros", "perm.unizk" },
["SubTenenteBombeiros"] = { _config = { gtype = "org", salario = 17000, ptr = nil, orgName = "Bombeiro"},"dv.permissao", "perm.unizk" },
["SocorristaBombeiros"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Bombeiro"}, "perm.unizk" },

["Chamado Hospital"] = { _config = { salario = 0, ptr = nil }, "perm.chamadoBombeiro" },
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JUDICIARIO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Ministro"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Judiciario"}, "perm.judiciario","perm.policia","perm.radiojudiciario", "perm.recrutamentojudiciario" },
["Juiz"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Judiciario"}, "perm.judiciario","perm.policia", "perm.radiojudiciario","perm.recrutamentojudiciario"},
["Desembargador"] = { _config = { gtype = "org", salario = 10000, orgName = "Judiciario"}, "perm.judiciario","perm.policia","perm.radiojudiciario","perm.recrutamentojudiciario" },
["Promotor"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Judiciario"}, "perm.judiciario","perm.policia","perm.radiojudiciario","perm.recrutamentojudiciario" },
["Advogado"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Judiciario"}, "perm.judiciario","perm.policia","perm.radiojudiciario","perm.recrutamentojudiciario" },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  /groupadd 1 "lider bloods"
-- ARMAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--Milicia--armas 
	["Lider [MILICIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Milicia", orgType = "Municao"}, "perm.gerentemilicia","perm.recrutamentomilicia", "perm.milicia", "perm.lidermilicia", "perm.arma", "perm.ilegal", "perm.baumilicia", "perm.baulidermilicia"},
	["Sub-Lider [MILICIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Milicia", orgType = "Municao"}, "perm.gerentemilicia","perm.lidermilicia","perm.recrutamentomilicia", "perm.milicia", "perm.arma", "perm.ilegal", "perm.baumilicia", "perm.baulidermilicia"},
	["Gerente [MILICIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Milicia", orgType = "Municao"}, "perm.gerentemilicia","perm.milicia","perm.recrutamentomilicia", "perm.arma", "perm.ilegal", "perm.baumilicia", "perm.baulidermilicia"},
	["Recrutador [MILICIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Milicia", orgType = "Municao"}, "perm.milicia", "perm.arma","perm.recrutamentomilicia", "perm.ilegal", "perm.baumilicia"},
	["Membro [MILICIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Milicia", orgType = "Municao"}, "perm.milicia", "perm.arma", "perm.ilegal","perm.recrutamentomilicia", "perm.baumilicia"},
	["Aviaozinho [MILICIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Milicia", orgType = "Municao"}, "perm.milicia", "perm.arma", "perm.ilegal"},

        --DEMONIKE--nao tem na cidade -------------------------------------------------------------------------------------------------------------------------------------
    ["Lider [DEMONIKE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Demonike", orgType = "Armas"}, "perm.demonike","perm.recrutamentodemonike", "perm.liderdemonike", "perm.arma", "perm.ilegal", "perm.baudemonike", "anunciofestinha.permissao"},
    ["Sub-Lider [DEMONIKE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Demonike", orgType = "Armas"}, "perm.liderdemonike","perm.recrutamentodemonike", "perm.demonike", "perm.arma", "perm.ilegal", "perm.baudemonike"},
    ["Gerente [DEMONIKE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Demonike", orgType = "Armas"}, "perm.demonike","perm.recrutamentodemonike", "perm.arma", "perm.ilegal", "perm.baudemonike"},
    ["Recrutador [DEMONIKE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Demonike", orgType = "Armas"}, "perm.demonike","perm.recrutamentodemonike", "perm.arma", "perm.ilegal", "perm.baudemonike"},
    ["Membro [DEMONIKE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Demonike", orgType = "Armas"}, "perm.demonike","perm.recrutamentodemonike", "perm.arma", "perm.ilegal", "perm.baudemonike"},
    ["Aviaozinho [DEMONIKE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Demonike", orgType = "Armas"}, "perm.demonike", "perm.arma", "perm.ilegal"},

   --PCC--nao tem na cidade ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    ["Lider [PCC]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "PCC", orgType = "Armas"}, "perm.pcc","staff.permissao", "perm.liderpcc","perm.recrutamentopcc", "perm.arma", "perm.ilegal", "perm.baupcc"},
    ["Sub-Lider [PCC]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "PCC", orgType = "Armas"}, "perm.liderpcc", "perm.pcc","perm.recrutamentopcc", "perm.arma", "perm.ilegal", "perm.baupcc"},
    ["Gerente [PCC]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "PCC", orgType = "Armas"}, "perm.pcc", "perm.arma","perm.recrutamentopcc", "perm.ilegal", "perm.baupcc"},
    ["Recrutador [PCC]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "PCC", orgType = "Armas"}, "perm.pcc", "perm.arma","perm.recrutamentopcc", "perm.ilegal", "perm.baupcc"},
    ["Membro [PCC]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "PCC", orgType = "Armas"}, "perm.pcc", "perm.arma","perm.recrutamentopcc", "perm.ilegal", "perm.baupcc"},
    ["Aviaozinho [PCC]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "PCC", orgType = "Armas"}, "perm.pcc", "perm.arma", "perm.ilegal"},
	
	--MAFIA--
	["Lider [MAFIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mafia", orgType = "Municao"}, "perm.mafia", "perm.lidermafia","perm.recrutamentomafia", "perm.arma", "perm.ilegal", "perm.baumafia"},
	["Sub-Lider [MAFIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mafia", orgType = "Municao"}, "perm.lidermafia", "perm.mafia","perm.recrutamentomafia", "perm.arma", "perm.ilegal", "perm.baumafia"},
	["Gerente [MAFIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mafia", orgType = "Municao"}, "perm.mafia", "perm.arma", "perm.ilegal","perm.recrutamentomafia", "perm.baumafia"},
	["Recrutador [MAFIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mafia", orgType = "Municao"}, "perm.mafia", "perm.arma", "perm.ilegal","perm.recrutamentomafia", "perm.baumafia"},
	["Membro [MAFIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mafia", orgType = "Municao"}, "perm.mafia", "perm.arma", "perm.ilegal","perm.recrutamentomafia", "perm.baumafia"},
	["Aviaozinho [MAFIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mafia", orgType = "Municao"}, "perm.mafia", "perm.arma","perm.recrutamentomafia", "perm.ilegal"},
	
	
	
	--COSANOSTRA--
	["Lider [COSANOSTRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cosanostra", orgType = "Armas"}, "perm.cosanostra","perm.recrutamentocosanostra",  "perm.lidercosanostra", "perm.arma", "perm.ilegal", "perm.baucosanostra"},
	["Sub-Lider [COSANOSTRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cosanostra", orgType = "Armas" }, "perm.lidercosanostra","perm.recrutamentocosanostra", "perm.cosanostra", "perm.arma", "perm.ilegal", "perm.baucosanostra"},-- COSANOSTRA ARMAS--ok 
	["Gerente [COSANOSTRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cosanostra", orgType = "Armas" }, "perm.cosanostra","perm.recrutamentocosanostra", "perm.arma", "perm.ilegal", "perm.baucosanostra"},
	["Recrutador [COSANOSTRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cosanostra", orgType = "Armas" }, "perm.cosanostra", "perm.arma","perm.recrutamentocosanostra", "perm.ilegal", "perm.baucosanostra"},
	["Membro [COSANOSTRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cosanostra", orgType = "Armas" }, "perm.cosanostra","perm.recrutamentocosanostra", "perm.arma", "perm.ilegal", "perm.baucosanostra"},
	["Aviaozinho [COSANOSTRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cosanostra", orgType = "Armas" }, "perm.cosanostra", "perm.arma", "perm.ilegal"},

	
	--FRANCA--nao tem craft -------------------------------------------------------------------------------------------------
	["Lider [FRANCA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Franca", orgType = "Armas"}, "perm.franca","perm.recrutamentofranca", "perm.liderfranca", "perm.arma", "perm.ilegal", "perm.baufranca"},
	["Sub-Lider [FRANCA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Franca", orgType = "Armas"}, "perm.liderfranca","perm.recrutamentofranca", "perm.franca", "perm.arma", "perm.ilegal", "perm.baufranca"},
	["Gerente [FRANCA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Franca", orgType = "Armas"}, "perm.franca","perm.recrutamentofranca", "perm.arma", "perm.ilegal", "perm.baufranca"},
	["Recrutador [FRANCA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Franca", orgType = "Armas"}, "perm.franca", "perm.recrutamentofranca","perm.arma", "perm.ilegal", "perm.baufranca"},
	["Membro [FRANCA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Franca", orgType = "Armas"}, "perm.franca", "perm.recrutamentofranca","perm.arma", "perm.ilegal", "perm.baufranca"},
	["Aviaozinho [FRANCA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Franca", orgType = "Armas"}, "perm.franca", "perm.arma", "perm.ilegal"},
	
	--WOLVES--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [WOLVES]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Wolves", orgType = "Armas"}, "perm.wolves","perm.recrutamentowolves", "perm.liderwolves", "perm.arma", "perm.ilegal", "perm.bauwolves"},
	["Sub-Lider [WOLVES]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Wolves", orgType = "Armas"}, "perm.liderwolves","perm.recrutamentowolves", "perm.wolves", "perm.arma", "perm.ilegal", "perm.bauwolves"},
	["Gerente [WOLVES]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Wolves", orgType = "Armas"}, "perm.wolves","perm.recrutamentowolves", "perm.arma", "perm.ilegal", "perm.bauwolves"},
	["Recrutador [WOLVES]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Wolves", orgType = "Armas"}, "perm.wolves", "perm.recrutamentowolves","perm.arma", "perm.ilegal", "perm.bauwolves"},
	["Membro [WOLVES]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Wolves", orgType = "Armas"}, "perm.wolves", "perm.recrutamentowolves","perm.arma", "perm.ilegal", "perm.bauwolves"},
	["Aviaozinho [WOLVES]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Wolves", orgType = "Armas"}, "perm.wolves", "perm.arma", "perm.ilegal"},
	
	--Yakuza--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [YAKUZA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Yakuza", orgType = "Armas"}, "perm.lideryakuza", "perm.recrutamentoyakuza","perm.yakuza", "perm.armas", "perm.ilegal", "perm.bauyakuza"},
	["Sub-Lider [YAKUZA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Yakuza", orgType = "Armas"}, "perm.lideryakuza","perm.recrutamentoyakuza", "perm.yakuza", "perm.armas", "perm.ilegal", "perm.bauyakuza"},
	["Gerente [YAKUZA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Yakuza", orgType = "Armas"}, "perm.yakuza","perm.recrutamentoyakuza", "perm.armas", "perm.ilegal", "perm.bauyakuza"},
	["Recrutador [YAKUZA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Yakuza", orgType = "Armas"}, "perm.yakuza","perm.recrutamentoyakuza", "perm.armas", "perm.ilegal", "perm.bauyakuza"},
	["Membro [YAKUZA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Yakuza", orgType = "Armas"}, "perm.yakuza", "perm.recrutamentoyakuza","perm.armas", "perm.ilegal", "perm.bauyakuza"},
	["Aviaozinho [YAKUZA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Yakuza", orgType = "Armas"}, "perm.yakuza", "perm.armas", "perm.ilegal"},
	
	--Triade--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [TRIADE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Triade", orgType = "Armas"}, "perm.lidertriade", "perm.recrutamentotriade","perm.triade", "perm.armas", "perm.ilegal", "perm.bautriade"},
	["Sub-Lider [TRIADE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Triade", orgType = "Armas"}, "perm.lidertriade","perm.recrutamentotriade", "perm.triade", "perm.armas", "perm.ilegal", "perm.bautriade"},
	["Gerente [TRIADE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Triade", orgType = "Armas"}, "perm.triade","perm.recrutamentotriade", "perm.armas", "perm.ilegal", "perm.bautriade"},
	["Recrutador [TRIADE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Triade", orgType = "Armas"}, "perm.triade","perm.recrutamentotriade", "perm.armas", "perm.ilegal", "perm.bautriade"},
	["Membro [TRIADE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Triade", orgType = "Armas"}, "perm.triade", "perm.recrutamentotriade","perm.armas", "perm.ilegal", "perm.bautriade"},
	["Aviaozinho [TRIADE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Triade", orgType = "Armas"}, "perm.triade", "perm.armas", "perm.ilegal"},
	
	--Merlim--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [MERLIM]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Merlim", orgType = "Armas"}, "perm.lidermerlim", "perm.recrutamentomerlim","perm.merlim", "perm.armas", "perm.ilegal", "perm.baumerlim"},
	["Sub-Lider [MERLIM]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Merlim", orgType = "Armas"}, "perm.lidermerlim","perm.recrutamentomerlim", "perm.merlim", "perm.armas", "perm.ilegal", "perm.baumerlim"},
	["Gerente [MERLIM]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Merlim", orgType = "Armas"}, "perm.merlim","perm.recrutamentomerlim", "perm.armas", "perm.ilegal", "perm.baumerlim"},
	["Recrutador [MERLIM]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Merlim", orgType = "Armas"}, "perm.merlim","perm.recrutamentomerlim", "perm.armas", "perm.ilegal", "perm.baumerlim"},
	["Membro [MERLIM]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Merlim", orgType = "Armas"}, "perm.merlim", "perm.recrutamentomerlim","perm.armas", "perm.ilegal", "perm.baumerlim"},
	["Aviaozinho [MERLIM]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Merlim", orgType = "Armas"}, "perm.merlim", "perm.armas", "perm.ilegal"},
	
	--BABEL-OK--
	["Lider [BABEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "babel", orgType = "Armas"}, "perm.gerentebabel","perm.recrutamentobabel",  "perm.babel", "perm.liderbabel", "perm.arma", "perm.ilegal", "perm.baubabel", "perm.bauliderbabel"},
	["Sub-Lider [BABEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "babel", orgType = "Armas"}, "perm.gerentebabel","perm.recrutamentobabel","perm.liderbabel", "perm.babel", "perm.arma", "perm.ilegal", "perm.baubabel", "perm.bauliderbabel"},
	["Gerente [BABEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "babel", orgType = "Armas"}, "perm.gerentebabel","perm.recrutamentobabel","perm.babel", "perm.arma", "perm.ilegal", "perm.baubabel", "perm.bauliderbabel"},
	["Recrutador [BABEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "babel", orgType = "Armas"}, "perm.babel","perm.recrutamentobabel", "perm.arma", "perm.ilegal", "perm.baubabel"},
	["Membro [BABEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "babel", orgType = "Armas"}, "perm.babel", "perm.arma","perm.recrutamentobabelbabel", "perm.ilegal", "perm.baubabel"},
	["Aviaozinho [BABEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "babel", orgType = "Armas"}, "perm.babel", "perm.arma", "perm.ilegal"},
	
	
	--TURQUIA--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [TURQUIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Turquia", orgType = "Municao"}, "perm.gerenteturquia", "perm.turquia","perm.recrutamentoturquia", "perm.liderturquia", "perm.arma", "perm.ilegal", "perm.bauturquia", "perm.bauliderturquia"},
	["Sub-Lider [TURQUIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Turquia", orgType = "Municao"}, "perm.gerenteturquia","perm.liderturquia","perm.recrutamentoturquia", "perm.turquia", "perm.arma", "perm.ilegal", "perm.bauturquia", "perm.bauliderturquia"},
	["Gerente [TURQUIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Turquia", orgType = "Municao"}, "perm.gerenteturquia","perm.turquia","perm.recrutamentoturquia", "perm.arma", "perm.ilegal", "perm.bauturquia", "perm.bauliderturquia"},
	["Recrutador [TURQUIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Turquia", orgType = "Municao"}, "perm.turquia", "perm.arma", "perm.ilegal","perm.recrutamentoturquia", "perm.bauturquia"},
	["Membro [TURQUIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Turquia", orgType = "Municao"}, "perm.turquia", "perm.arma", "perm.ilegal","perm.recrutamentoturquia", "perm.bauturquia"},
	["Aviaozinho [TURQUIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Turquia", orgType = "Municao"}, "perm.turquia", "perm.arma", "perm.ilegal"},
	
	--BLACKOUT--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [BLACKOUT]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "BlackOut", orgType = "Armas"}, "perm.gerenteblackout", "perm.blackout","perm.recrutamentoblackout", "perm.liderblackout", "perm.arma", "perm.ilegal", "perm.baublackout", "perm.bauliderblackout"},
	["Sub-Lider [BLACKOUT]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "BlackOut", orgType = "Armas"}, "perm.gerenteblackout","perm.liderblackout","perm.recrutamentoblackout", "perm.blackout", "perm.arma", "perm.ilegal", "perm.baublackout", "perm.bauliderblackout"},
	["Gerente [BLACKOUT]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "BlackOut", orgType = "Armas"}, "perm.gerenteblackout","perm.blackout","perm.recrutamentoblackout", "perm.arma", "perm.ilegal", "perm.baublackout", "perm.bauliderblackout"},
	["Recrutador [BLACKOUT]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "BlackOut", orgType = "Armas"}, "perm.blackout", "perm.arma", "perm.ilegal","perm.recrutamentoblackout", "perm.baublackout"},
	["Membro [BLACKOUT]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "BlackOut", orgType = "Armas"}, "perm.blackout", "perm.arma", "perm.ilegal","perm.recrutamentoblackout", "perm.baublackout"},
	["Aviaozinho [BLACKOUT]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "BlackOut", orgType = "Armas"}, "perm.blackout", "perm.arma", "perm.ilegal"},
	
	
	
	
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- MUNIÇÃO E DESMANCHE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    --BRATVA--
	["Lider [BRATVA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bratva", orgType = "Lavagem"}, "perm.liderbratva", "perm.recrutamentobratva", "perm.bratva", "perm.lavagem", "perm.ilegal", "perm.baubratva"},
	["Sub-Lider [BRATVA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bratva", orgType = "Lavagem"}, "perm.liderbratva","perm.recrutamentobratva", "perm.bratva", "perm.lavagem", "perm.ilegal", "perm.baubratva"},
	["Gerente [BRATVA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bratva", orgType = "Lavagem"}, "perm.bratva","perm.recrutamentobratva", "perm.lavagem", "perm.ilegal", "perm.baubratva"},
	["Recrutador [BRATVA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bratva", orgType = "Lavagem"}, "perm.bratva", "perm.lavagem","perm.recrutamentobratva", "perm.ilegal", "perm.baubratva"},
	["Membro [BRATVA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bratva", orgType = "Lavagem"}, "perm.bratva", "perm.recrutamentobratva","perm.lavagem", "perm.ilegal", "perm.baubratva"},
	["Aviaozinho [BRATVA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bratva", orgType = "Lavagem"}, "perm.bratva", "perm.lavagem", "perm.ilegal"},
	
         --Cartel--MUANBAS 
    ["Lider [CARTEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cartel", orgType = "Armas"}, "perm.cartel", "perm.recrutamentocartel", "perm.lidercartel", "perm.arma", "perm.ilegal", "perm.baucartel"},
    ["Sub-Lider [CARTEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cartel", orgType = "Armas"}, "perm.lidercartel","perm.recrutamentocartel",  "perm.cartel", "perm.arma", "perm.ilegal", "perm.baucartel"},
    ["Gerente [CARTEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cartel", orgType = "Armas"}, "perm.cartel","perm.recrutamentocartel",  "perm.arma", "perm.ilegal", "perm.baucartel"},
    ["Recrutador [CARTEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cartel", orgType = "Armas"}, "perm.cartel","perm.recrutamentocartel",  "perm.arma", "perm.ilegal", "perm.baucartel"},
    ["Membro [CARTEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cartel", orgType = "Armas"}, "perm.cartel","perm.recrutamentocartel",  "perm.arma", "perm.ilegal", "perm.baucartel"},
    ["Aviaozinho [CARTEL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cartel", orgType = "Armas"}, "perm.cartel", "perm.arma", "perm.ilegal"},

	--Alemao--nao tem na cidade -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [ALEMAO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Alemao", orgType = "Desmanche"}, "perm.gerentealemao","perm.recrutamentoalemao", "perm.alemao", "perm.lideralemao", "perm.arma", "perm.ilegal", "perm.baualemao", "perm.baulideralemao"},
	["Sub-Lider [ALEMAO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Alemao", orgType = "Desmanche"}, "perm.gerentealemao","perm.recrutamentoalemao","perm.lideralemao", "perm.alemao", "perm.arma", "perm.ilegal", "perm.baualemao", "perm.baulideralemao"},
	["Gerente [ALEMAO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Alemao", orgType = "Desmanche"}, "perm.gerentealemao","perm.recrutamentoalemao","perm.alemao", "perm.arma", "perm.ilegal", "perm.baualemao", "perm.baulideralemao"},
	["Recrutador [ALEMAO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Alemao", orgType = "Desmanche"}, "perm.alemao", "perm.arma","perm.recrutamentoalemao", "perm.ilegal", "perm.baualemao"},
	["Membro [ALEMAO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Alemao", orgType = "Desmanche"}, "perm.alemao", "perm.arma","perm.recrutamentoalemao", "perm.ilegal", "perm.baualemao"},
	["Aviaozinho [ALEMAO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Alemao", orgType = "Desmanche"}, "perm.alemao", "perm.arma", "perm.ilegal"},
	
	--FURIOUS--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [FURIOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Furious", orgType = "Desmanche"}, "perm.furious","perm.recrutamentofurious", "perm.liderfurious", "perm.gerentefurious", "perm.desmanche", "perm.ilegal", "perm.baufurious"},
	["Sub-Lider [FURIOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Furious", orgType = "Desmanche"}, "perm.liderfurious","perm.recrutamentofurious", "perm.gerentefurious", "perm.furious", "perm.desmanche", "perm.ilegal", "perm.baufurious"},
	["Gerente [FURIOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Furious", orgType = "Desmanche"}, "perm.gerentefurious","perm.recrutamentofurious", "perm.furious", "perm.desmanche", "perm.ilegal", "perm.baufurious"},
	["Recrutador [FURIOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Furious", orgType = "Desmanche"}, "perm.furious", "perm.recrutamentofurious","perm.desmanche", "perm.ilegal", "perm.baufurious"},
	["Membro [FURIOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Furious", orgType = "Desmanche"}, "perm.furious","perm.recrutamentofurious", "perm.desmanche", "perm.ilegal", "perm.baufurious"},
	["Aviaozinho [FURIOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Furious", orgType = "Desmanche"}, "perm.furious", "perm.desmanche", "perm.ilegal"},

	--Motoclub--MUNBAS 
	["Lider [MOTOCLUB]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Motoclub", orgType = "Desmanche"}, "perm.motoclub","perm.recrutamentomotoclub", "perm.desmanche", "perm.lidermotoclub", "perm.ilegal", "perm.baumotoclub"},
	["Sub-Lider [MOTOCLUB]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Motoclub", orgType = "Desmanche"}, "perm.lidermotoclub","perm.recrutamentomotoclub", "perm.motoclub", "perm.desmanche", "perm.ilegal", "perm.baumotoclub"},
	["Gerente [MOTOCLUB]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Motoclub", orgType = "Desmanche"}, "perm.motoclub","perm.recrutamentomotoclub", "perm.desmanche", "perm.ilegal", "perm.baumotoclub"},
	["Recrutador [MOTOCLUB]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Motoclub", orgType = "Desmanche"}, "perm.motoclub","perm.recrutamentomotoclub", "perm.desmanche", "perm.ilegal", "perm.baumotoclub"},
    ["Membro [MOTOCLUB]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Motoclub", orgType = "Desmanche"}, "perm.motoclub","perm.recrutamentomotoclub", "perm.desmanche", "perm.ilegal", "perm.baumotoclub"},
    ["Aviaozinho [MOTOCLUB]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Motoclub", orgType = "Desmanche"}, "perm.motoclub", "perm.desmanche", "perm.ilegal"},

	 
	 --LACOSTE--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	 ["Lider [LACOSTE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Lacoste", orgType = "Desmanche"}, "perm.lacoste","perm.recrutamentolacoste", "perm.liderlacoste", "perm.desmanche", "perm.ilegal", "perm.baulacoste"},
	["Sub-Lider [LACOSTE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Lacoste", orgType = "Desmanche"}, "perm.liderlacoste", "perm.lacoste","perm.recrutamentolacoste", "perm.desmanche", "perm.ilegal", "perm.baulacoste"},
	["Gerente [LACOSTE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Lacoste", orgType = "Desmanche"}, "perm.lacoste", "perm.desmanche","perm.recrutamentolacoste", "perm.ilegal", "perm.baulacoste"},
	["Recrutador [LACOSTE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Lacoste", orgType = "Desmanche"}, "perm.lacoste", "perm.desmanche","perm.recrutamentolacoste", "perm.ilegal", "perm.baulacoste"},
	["Membro [LACOSTE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Lacoste", orgType = "Desmanche"}, "perm.lacoste", "perm.desmanche","perm.recrutamentolacoste", "perm.ilegal", "perm.baulacoste"},
	["Aviaozinho [LACOSTE]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Lacoste", orgType = "Desmanche"}, "perm.lacoste", "perm.desmanche", "perm.ilegal"},
	
	 --HELLSANGELS--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	 ["Lider [HELLSANGELS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "HellsAngels", orgType = "Desmanche"}, "perm.hellsamgels","perm.recrutamentohellsamgels", "perm.desmanche", "perm.liderhellsamgels", "perm.ilegal", "perm.bauhellsamgels"},
	["Sub-Lider [HELLSANGELS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "HellsAngels", orgType = "Desmanche"}, "perm.liderhellsamgels","perm.recrutamentohellsamgels", "perm.hellsamgels", "perm.desmanche", "perm.ilegal", "perm.bauhellsamgels"},
	["Gerente [HELLSANGELS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "HellsAngels", orgType = "Desmanche"}, "perm.hellsamgels", "perm.recrutamentohellsamgels","perm.desmanche", "perm.ilegal", "perm.bauhellsamgels"},
	["Recrutador [HELLSANGELS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "HellsAngels", orgType = "Desmanche"}, "perm.hellsamgels","perm.recrutamentohellsamgels", "perm.desmanche", "perm.ilegal", "perm.bauhellsamgels"},
	["Membro [HELLSANGELS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "HellsAngels", orgType = "Desmanche"}, "perm.hellsamgels","perm.recrutamentohellsamgels", "perm.desmanche", "perm.ilegal", "perm.bauhellsamgels"},
	["Aviaozinho [HELLSANGELS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "HellsAngels", orgType = "Desmanche"}, "perm.hellsamgels", "perm.desmanche", "perm.ilegal"},
	
	-- --BENNYS--nao tem craft ----------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [BENNYS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bennys", orgType = "Desmanche"}, "perm.bennys","perm.recrutamentobennys", "perm.desmanche", "perm.liderbennys", "perm.ilegal", "perm.baubennys"},
	["Sub-Lider [BENNYS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bennys", orgType = "Desmanche"}, "perm.liderbennys","perm.recrutamentobennys", "perm.bennys", "perm.desmanche", "perm.ilegal", "perm.baubennys"},
	["Gerente [BENNYS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bennys", orgType = "Desmanche"}, "perm.bennys","perm.recrutamentobennys", "perm.desmanche", "perm.ilegal", "perm.baubennys"},
	["Recrutador [BENNYS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bennys", orgType = "Desmanche"}, "perm.bennys","perm.recrutamentobennys", "perm.desmanche", "perm.ilegal", "perm.baubennys"},
	["Membro [BENNYS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bennys", orgType = "Desmanche"}, "perm.bennys","perm.recrutamentobennys", "perm.desmanche", "perm.ilegal", "perm.baubennys"},
	["Aviaozinho [BENNYS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bennys", orgType = "Desmanche"}, "perm.bennys", "perm.desmanche", "perm.ilegal"},
	
	
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- LAVAGEM
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--VANILLA--nao tem na cidade ---------------------------------------------------------------------
	["Lider [VANILLA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Vanilla", orgType = "Lavagem"}, "perm.lidervanilla","perm.recrutamentovanilla", "perm.vanilla", "perm.lavagem", "perm.ilegal", "perm.bauvanilla"},
	["Sub-Lider [VANILLA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Vanilla",orgType = "Lavagem"}, "perm.lidervanilla","perm.recrutamentovanilla", "perm.vanilla", "perm.lavagem", "perm.ilegal", "perm.bauvanilla"},	
	["Gerente [VANILLA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Vanilla",orgType = "Lavagem"}, "perm.vanilla","perm.recrutamentovanilla", "perm.lavagem", "perm.ilegal", "perm.bauvanilla"},
	["Recrutador [VANILLA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Vanilla",orgType = "Lavagem"}, "perm.vanilla","perm.recrutamentovanilla", "perm.lavagem", "perm.ilegal", "perm.bauvanilla"},
	["Membro [VANILLA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Vanilla",orgType = "Lavagem"}, "perm.vanilla","perm.recrutamentovanilla", "perm.lavagem", "perm.ilegal", "perm.bauvanilla"},
	["Aviaozinho [VANILLA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Vanilla",orgType = "Lavagem"}, "perm.vanilla", "perm.lavagem", "perm.ilegal"},
	
	--BAHAMAS--ASUMIDA ------------------------------------------------------------------------------------------------------------------------ASSUMIDA 
	["Lider [BAHAMAS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bahamas", orgType = "Lavagem"}, "perm.liderbahamas", "perm.recrutamentobahamas", "perm.bahamas", "perm.lavagem", "perm.ilegal", "perm.baubahamas"},
	["Sub-Lider [BAHAMAS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bahamas", orgType = "Lavagem"},"perm.recrutamentobahamas", "perm.bahamas", "perm.lavagem", "perm.ilegal", "perm.baubahamas"},
	["Gerente [BAHAMAS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bahamas", orgType = "Lavagem"}, "perm.bahamas","perm.recrutamentobahamas", "perm.lavagem", "perm.ilegal", "perm.baubahamas"},
	["Recrutador [BAHAMAS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bahamas", orgType = "Lavagem"}, "perm.bahamas", "perm.lavagem","perm.recrutamentobahamas", "perm.ilegal", "perm.baubahamas"},
	["Membro [BAHAMAS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bahamas", orgType = "Lavagem"}, "perm.bahamas", "perm.recrutamentobahamas","perm.lavagem", "perm.ilegal", "perm.baubahamas"},
	["Aviaozinho [BAHAMAS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Bahamas", orgType = "Lavagem"}, "perm.bahamas", "perm.lavagem", "perm.ilegal"},
	
	
		--CRIPS--
    ["Lider [CRIPS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Crips", orgType = "Municao"}, "perm.crips", "perm.lidercrips","perm.recrutamentocrips", "perm.drogas", "perm.metanfetamina", "perm.ilegal", "perm.baucrips"},
    ["Sub-Lider [CRIPS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Crips", orgType = "Municao"}, "perm.lidercrips", "perm.crips","perm.recrutamentocrips", "perm.drogas", "perm.ilegal", "perm.metanfetamina", "perm.baucrips"},
	["Gerente [CRIPS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Crips", orgType = "Municao"}, "perm.crips", "perm.drogas", "perm.ilegal","perm.recrutamentocrips", "perm.metanfetamina", "perm.baucrips"},
	["Recrutador [CRIPS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Crips", orgType = "Municao"}, "perm.crips", "perm.drogas", "perm.ilegal","perm.recrutamentocrips", "perm.metanfetamina", "perm.baucrips"},
	["Membro [CRIPS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Crips", orgType = "Municao"}, "perm.crips", "perm.drogas", "perm.ilegal","perm.recrutamentocrips", "perm.metanfetamina", "perm.baucrips"},
	["Aviaozinho [CRIPS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Crips", orgType = "Municao"}, "perm.crips", "perm.drogas", "perm.metanfetamina", "perm.ilegal"},
	
	
	--TEQUILA--
	["Lider [TEQUILA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Tequila", orgType = "Lavagem"}, "perm.lidertequila", "perm.recrutamentotequila", "perm.tequila", "perm.lavagem", "perm.ilegal", "perm.bautequila"},
	["Sub-Lider [TEQUILA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Tequila", orgType = "Lavagem"}, "perm.lidertequila","perm.recrutamentotequila", "perm.tequila", "perm.lavagem", "perm.ilegal", "perm.bautequila"},
	["Gerente [TEQUILA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Tequila", orgType = "Lavagem"}, "perm.tequila","perm.recrutamentotequila", "perm.lavagem", "perm.ilegal", "perm.bautequila"},
	["Recrutador [TEQUILA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Tequila", orgType = "Lavagem"}, "perm.tequila", "perm.lavagem","perm.recrutamentotequila", "perm.ilegal", "perm.bautequila"},
	["Membro [TEQUILA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Tequila", orgType = "Lavagem"}, "perm.tequila", "perm.recrutamentotequila","perm.lavagem", "perm.ilegal", "perm.bautequila"},
	["Aviaozinho [TEQUILA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Tequila", orgType = "Lavagem"}, "perm.tequila", "perm.lavagem", "perm.ilegal"},
	
	--ILUMINATIS--
	["Lider [ILUMINATIS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Iluminatis", orgType = "Lavagem"}, "perm.lideriluminatis", "perm.recrutamentoiluminatis", "perm.iluminatis", "perm.lavagem", "perm.ilegal", "perm.bauiluminatis"},
	["Sub-Lider [ILUMINATIS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Iluminatis", orgType = "Lavagem"}, "perm.lideriluminatis","perm.recrutamentoiluminatis", "perm.iluminatis", "perm.lavagem", "perm.ilegal", "perm.bauiluminatis"},
	["Gerente [ILUMINATIS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Iluminatis", orgType = "Lavagem"}, "perm.iluminatis","perm.recrutamentoiluminatis", "perm.lavagem", "perm.ilegal", "perm.bauiluminatis"},
	["Recrutador [ILUMINATIS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Iluminatis", orgType = "Lavagem"}, "perm.iluminatis", "perm.lavagem","perm.recrutamentoiluminatis", "perm.ilegal", "perm.bauiluminatis"},
	["Membro [ILUMINATIS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Iluminatis", orgType = "Lavagem"}, "perm.iluminatis", "perm.recrutamentoiluminatis","perm.lavagem", "perm.ilegal", "perm.bauiluminatis"},
	["Aviaozinho [ILUMINATIS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Iluminatis", orgType = "Lavagem"}, "perm.iluminatis", "perm.lavagem", "perm.ilegal"},

	--ARMAS--ANONYMOUS -------------------------------------------------------------------------------------------------------------------------------------------------
    ["Lider [ANONYMOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Anonymous", orgType = "Armas"}, "perm.lideranonymous","perm.anonymousgerente", "perm.recrutamentoanonymous", "perm.anonymous", "perm.armas", "perm.ilegal", "perm.bauanonymous"},
    ["Sub-Lider [ANONYMOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Anonymous", orgType = "Armas"}, "perm.lideranonymous", "perm.anonymousgerente","perm.recrutamentoanonymous", "perm.anonymous", "perm.armas", "perm.ilegal", "perm.bauanonymous"},
    ["Gerente [ANONYMOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Anonymous", orgType = "Armas"}, "perm.anonymous", "perm.anonymousgerente","perm.recrutamentoanonymous", "perm.lavagem", "perm.ilegal", "perm.bauanonymous"},
    ["Recrutador [ANONYMOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Anonymous", orgType = "Armas"}, "perm.anonymous", "perm.armas","perm.recrutamentoanonymous", "perm.ilegal", "perm.bauanonymous"},
    ["Membro [ANONYMOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Anonymous", orgType = "Armas"}, "perm.anonymous", "perm.recrutamentoanonymous","perm.armas", "perm.ilegal", "perm.bauanonymous"},
    ["Aviaozinho [ANONYMOUS]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Anonymous", orgType = "Armas"}, "perm.anonymous", "perm.armas", "perm.ilegal"},

		--GALAXY--NAOO TEM NA CIDADE ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [GALAXY]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Galaxy", orgType = "Lavagem"}, "perm.lidergalaxy", "perm.recrutamentogalaxy", "perm.galaxy", "perm.lavagem", "perm.ilegal", "perm.baugalaxy"},
	["Sub-Lider [GALAXY]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Galaxy", orgType = "Lavagem"}, "perm.lidergalaxy","perm.recrutamentogalaxy", "perm.galaxy", "perm.lavagem", "perm.ilegal", "perm.baugalaxy"},
	["Gerente [GALAXY]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Galaxy", orgType = "Lavagem"}, "perm.galaxy","perm.recrutamentogalaxy", "perm.lavagem", "perm.ilegal", "perm.baugalaxy"},
	["Recrutador [GALAXY]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Galaxy", orgType = "Lavagem"}, "perm.galaxy", "perm.lavagem","perm.recrutamentogalaxy", "perm.ilegal", "perm.baugalaxy"},
	["Membro [GALAXY]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Galaxy", orgType = "Lavagem"}, "perm.galaxy", "perm.recrutamentogalaxy","perm.lavagem", "perm.ilegal", "perm.baugalaxy"},
	["Aviaozinho [GALAXY]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Galaxy", orgType = "Lavagem"}, "perm.galaxy", "perm.lavagem", "perm.ilegal"},

		--CASSINO--
	["Lider [CASSINO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cassino", orgType = "Lavagem"}, "perm.lidercassino", "perm.recrutamentocassino", "perm.cassino", "perm.lavagem", "perm.ilegal", "perm.baucassino"},
	["Sub-Lider [CASSINO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cassino", orgType = "Lavagem"}, "perm.lidercassino","perm.recrutamentocassino", "perm.cassino", "perm.lavagem", "perm.ilegal", "perm.baucassino"},
	["Gerente [CASSINO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cassino", orgType = "Lavagem"}, "perm.cassino","perm.recrutamentocassino", "perm.lavagem", "perm.ilegal", "perm.baucassino"},
	["Recrutador [CASSINO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cassino", orgType = "Lavagem"}, "perm.cassino", "perm.lavagem","perm.recrutamentocassino", "perm.ilegal", "perm.baucassino"},
	["Membro [CASSINO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cassino", orgType = "Lavagem"}, "perm.cassino", "perm.recrutamentogalaxy","perm.lavagem", "perm.ilegal", "perm.baucassino"},
	["Aviaozinho [CASSINO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cassino", orgType = "Lavagem"}, "perm.cassino", "perm.lavagem", "perm.ilegal"},
	

	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- DROGAS
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--CANADA--na tem na cidade ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [CANADA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Canada", orgType = "Drogas"}, "perm.canada","perm.recrutamentocanada", "perm.lidercanada", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baucanada"},
	["Sub-Lider [CANADA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Canada", orgType = "Drogas"}, "perm.lidercanada", "perm.recrutamentocanada","perm.canada", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baucanada"},
	["Gerente [CANADA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Canada", orgType = "Drogas"}, "perm.canada","perm.recrutamentocanada", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baucanada"},
	["Recrutador [CANADA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Canada", orgType = "Drogas"}, "perm.canada","perm.recrutamentocanada", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baucanada"},
	["Membro [CANADA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Canada", orgType = "Drogas"}, "perm.canada","perm.recrutamentocanada", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baucanada"},
	["Aviaozinho [CANADA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Canada", orgType = "Drogas"}, "perm.canada", "perm.drogas", "perm.maconha", "perm.ilegal"},
    
          --B13--DROOGAS 
	 ["Lider [B13]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "B13", orgType = "Desmanche"}, "perm.b13", "perm.desmanche","perm.recrutamentob13", "perm.liderb13", "perm.ilegal", "perm.baub13"},
	 ["Sub-Lider [B13]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "B13", orgType = "Desmanche"}, "perm.liderb13", "perm.b13","perm.recrutamentob13", "perm.desmanche", "perm.ilegal", "perm.baub13"},
	 ["Gerente [B13]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "B13", orgType = "Desmanche"}, "perm.b13", "perm.desmanche","perm.recrutamentob13", "perm.ilegal", "perm.baub13"},
	 ["Recrutador [B13]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "B13", orgType = "Desmanche"}, "perm.b13", "perm.desmanche","perm.recrutamentob13", "perm.ilegal", "perm.baub13"},
	 ["Membro [B13]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "B13", orgType = "Desmanche"}, "perm.b13", "perm.desmanche", "perm.recrutamentob13","perm.ilegal", "perm.baub13"},
	 ["Aviaozinho [B13]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "B13", orgType = "Desmanche"}, "perm.b13", "perm.desmanche", "perm.ilegal"},
	 

	--Rocinha--DROOGAS 
	["Lider [ROCINHA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Rocinha", orgType = "Desmanche"}, "perm.gerenterocinha","perm.recrutamentorocinha", "perm.rocinha", "perm.liderrocinha", "perm.arma", "perm.ilegal", "perm.baurocinha", "perm.bauliderrocinha"},
	["Sub-Lider [ROCINHA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Rocinha", orgType = "Desmanche"}, "perm.gerenterocinha","perm.recrutamentorocinha","perm.liderrocinha", "perm.rocinha", "perm.arma", "perm.ilegal", "perm.baurocinha", "perm.bauliderrocinha"},
	["Gerente [ROCINHA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Rocinha", orgType = "Desmanche"}, "perm.gerenterocinha","perm.recrutamentorocinha","perm.rocinha", "perm.arma", "perm.ilegal", "perm.baurocinha", "perm.bauliderrocinha"},
	["Recrutador [ROCINHA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Rocinha", orgType = "Desmanche"}, "perm.rocinha", "perm.arma","perm.recrutamentorocinha", "perm.ilegal", "perm.baurocinha"},
	["Membro [ROCINHA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Rocinha", orgType = "Desmanche"}, "perm.rocinha","perm.recrutamentorocinha", "perm.arma", "perm.ilegal", "perm.baurocinha"},
	["Aviaozinho [ROCINHA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Rocinha", orgType = "Desmanche"}, "perm.rocinha", "perm.arma", "perm.ilegal"},
	
	--Helipa--armas ----------------armas 
	["Lider [HELIPA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Helipa", orgType = "Desmanche"}, "perm.gerentehelipa","hall.permissao","perm.recrutamentohelipa", "perm.helipa", "perm.liderhelipa", "perm.arma", "perm.ilegal", "perm.bauhelipa", "perm.bauliderhelipa"},
	["Sub-Lider [HELIPA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Helipa", orgType = "Desmanche"}, "perm.gerentehelipa","perm.recrutamentohelipa","perm.liderhelipa", "perm.helipa", "perm.arma", "perm.ilegal", "perm.bauhelipa", "perm.bauliderhelipa"},
	["Gerente [HELIPA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Helipa", orgType = "Desmanche"}, "perm.gerentehelipa","perm.recrutamentohelipa","perm.helipa", "perm.arma", "perm.ilegal", "perm.bauhelipa", "perm.bauliderhelipa"},
	["Recrutador [HELIPA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Helipa", orgType = "Desmanche"}, "perm.helipa","perm.recrutamentohelipa", "perm.arma", "perm.ilegal", "perm.bauhelipa"},
	["Membro [HELIPA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Helipa", orgType = "Desmanche"}, "perm.helipa","perm.recrutamentohelipa", "perm.arma", "perm.ilegal", "perm.bauhelipa"},
	["Aviaozinho [HELIPA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Helipa", orgType = "Desmanche"}, "perm.helipa", "perm.arma", "perm.ilegal"},

	--GROTA--DROGAS 
	["Lider [GROTA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "grota", orgType = "Drogas"}, "perm.grota","hall.permissao","perm.recrutamentogrotagrotagrota", "perm.lidergrota", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baugrota"},
	["Sub-Lider [GROTA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "grota", orgType = "Drogas"}, "perm.lidergrota","perm.recrutamentogrota", "perm.grota", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.grota"},
	["Gerente [GROTA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "grota", orgType = "Drogas"}, "perm.grota","perm.recrutamentogrota", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baugrota"},
	["Recrutador [GROTA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "grota", orgType = "Drogas"}, "perm.grota","perm.recrutamentogrota", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baugrota"},
	["Membro [GROTA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "grota", orgType = "Drogas"}, "perm.grotagrota","perm.recrutamentogrota", "perm.drogas", "perm.ilegal", "perm.maconha", "perm.baugrota"},
	["Aviaozinho [GROTA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "grota", orgType = "Drogas"}, "perm.grota", "perm.drogas", "perm.maconha", "perm.ilegal"},
	
	-- --NIGERIA--nao tem na cidade ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [NIGERIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Nigeria", orgType = "Drogas"}, "perm.nigeria","perm.recrutamentonige", "perm.lidernigeria", "perm.balinha", "perm.ilegal", "perm.baunigeria"},
	["Sub-Lider [NIGERIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Nigeria", orgType = "Drogas"}, "perm.lidernigeria","perm.recrutamentonige", "perm.nigeria", "perm.balinha", "perm.ilegal", "perm.baunigeria"},
	["Gerente [NIGERIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Nigeria", orgType = "Drogas"}, "perm.nigeria","perm.recrutamentonige", "perm.balinha", "perm.ilegal", "perm.baunigeria"},
	["Recrutador [NIGERIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Nigeria", orgType = "Drogas"}, "perm.nigeria","perm.recrutamentonige", "perm.balinha", "perm.ilegal", "perm.baunigeria"},
	["Membro [NIGERIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Nigeria", orgType = "Drogas"}, "perm.nigeria", "perm.recrutamentonige","perm.balinha", "perm.ilegal", "perm.baunigeria"},
	["Aviaozinho [NIGERIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Nigeria", orgType = "Drogas"}, "perm.nigeria", "perm.balinha", "perm.ilegal"},

	 --COLOMBIA--NAOO TEM NA CIDADE -------------------------------------------------------------
	 ["Lider [COLOMBIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Colombia", orgType = "Drogas"}, "perm.colombia","perm.recrutamentocolombia", "perm.lidercolombia", "perm.balinha", "perm.ilegal", "perm.baucolombia"},
	["Sub-Lider [COLOMBIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Colombia", orgType = "Drogas"}, "perm.lidercolombia","perm.recrutamentocolombia", "perm.colombia", "perm.balinha", "perm.ilegal", "perm.baucolombia"},
	["Gerente [COLOMBIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Colombia", orgType = "Drogas"}, "perm.colombia","perm.recrutamentocolombia", "perm.balinha", "perm.ilegal", "perm.baucolombia"},
	["Recrutador [COLOMBIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Colombia", orgType = "Drogas"}, "perm.colombia","perm.recrutamentocolombia", "perm.balinha", "perm.ilegal", "perm.baucolombia"},
	["Membro [COLOMBIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Colombia", orgType = "Drogas"}, "perm.colombia","perm.recrutamentocolombia", "perm.balinha", "perm.ilegal", "perm.baucolombia"},
	["Aviaozinho [COLOMBIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Colombia", orgType = "Drogas"}, "perm.colombia", "perm.balinha", "perm.ilegal"},
	
	--ARGENTINA--NAO TEM NA CIDE NAO TEM NA CIDADE ----------------------------------------------------------------------------------------------------
	["Lider [ARGENTINA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Argentina", orgType = "Drogas"}, "perm.argentina","perm.recrutamentoargentina", "perm.liderargentina", "perm.balinha", "perm.ilegal", "perm.bauargentina"},
	["Sub-Lider [ARGENTINA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Argentina", orgType = "Drogas"}, "perm.liderargentina","perm.recrutamentoargentina", "perm.argentina", "perm.balinha", "perm.ilegal", "perm.bauargentina"},
	["Gerente [ARGENTINA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Argentina", orgType = "Drogas"}, "perm.argentina","perm.recrutamentoargentina", "perm.balinha", "perm.ilegal", "perm.bauargentina"},
	["Recrutador [ARGENTINA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Argentina", orgType = "Drogas"}, "perm.argentina","perm.recrutamentoargentina", "perm.balinha", "perm.ilegal", "perm.bauargentina"},
	["Membro [ARGENTINA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Argentina", orgType = "Drogas"}, "perm.argentina", "perm.recrutamentoargentina","perm.balinha", "perm.ilegal", "perm.bauargentina"},
	["Aviaozinho [ARGENTINA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Argentina", orgType = "Drogas"}, "perm.argentina", "perm.balinha", "perm.ilegal"},
	
	-- --PORTUGAL--NAO TEM NA CIDADE ----------------------------------------------------------------------------------------------------------
	["Lider [PORTUGAL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Portugal", orgType = "Drogas"}, "perm.portugal","perm.recrutamentoportugal", "perm.liderportugal", "perm.balinha", "perm.ilegal", "perm.bauportugal"},
	["Sub-Lider [PORTUGAL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Portugal", orgType = "Drogas"}, "perm.liderportugal", "perm.recrutamentoportugal","perm.portugal", "perm.balinha", "perm.ilegal", "perm.bauportugal"},
	["Gerente [PORTUGAL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Portugal", orgType = "Drogas"}, "perm.portugal","perm.recrutamentoportugal", "perm.balinha", "perm.ilegal", "perm.bauportugal"},
	["Recrutador [PORTUGAL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Portugal", orgType = "Drogas"}, "perm.portugal","perm.recrutamentoportugal", "perm.balinha", "perm.ilegal", "perm.bauportugal"},
	["Membro [PORTUGAL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Portugal", orgType = "Drogas"}, "perm.portugal","perm.recrutamentoportugal", "perm.balinha", "perm.ilegal", "perm.bauportugal"},
	["Aviaozinho [PORTUGAL]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Portugal", orgType = "Drogas"}, "perm.portugal", "perm.balinha", "perm.ilegal"},
	
	--CV-----drogas editando ainda --------------------------------------------------------------------------------------------
	["Lider [CV]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cv", orgType = "Drogas"}, "perm.cv", "perm.lidercv","perm.recrutamentocv", "perm.arma", "perm.ilegal", "perm.baucv"},
	["Sub-Lider [CV]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cv", orgType = "Drogas"}, "perm.lidercv", "perm.cv","perm.recrutamentocv", "perm.arma", "perm.ilegal", "perm.baucv"},
	["Gerente [CV]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cv", orgType = "Drogas"}, "perm.cv", "perm.arma", "perm.ilegal","perm.recrutamentocv", "perm.baucv"},
	["Recrutador [CV]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cv", orgType = "Drogas"}, "perm.cv", "perm.arma", "perm.ilegal","perm.recrutamentocv", "perm.baucv"},
	["Membro [CV]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cv", orgType = "Drogas"}, "perm.cv", "perm.arma", "perm.ilegal","perm.recrutamentocv", "perm.baucv"},
	["Aviaozinho [CV]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Cv", orgType = "Drogas"}, "perm.cv", "perm.arma", "perm.ilegal"},

	--CAMORRA--NAO TEM NA CIDADE -------------------------------------------------------------------------------------------------------------------------
	["Lider [CAMORRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Camorra", orgType = "Drogas"}, "perm.camorra", "perm.lidercamorra","perm.recrutamentocamorra", "perm.arma", "perm.ilegal", "perm.baucamorra"},
	["Sub-Lider [CAMORRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Camorra", orgType = "Drogas"}, "perm.lidercamorrai", "perm.camorra","perm.recrutamentocamorra", "perm.arma", "perm.ilegal", "perm.baucamorra"},
	["Gerente [CAMORRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Camorra", orgType = "Drogas"}, "perm.camorra", "perm.arma", "perm.ilegal","perm.recrutamentocamorra", "perm.baucamorra"},
	["Recrutador [CAMORRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Camorra", orgType = "Drogas"}, "perm.camorra", "perm.arma", "perm.ilegal","perm.recrutamentocamorra", "perm.baucamorra"},
	["Membro [CAMORRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Camorra", orgType = "Drogas"}, "perm.camorra", "perm.arma", "perm.ilegal","perm.recrutamentocamorra", "perm.baucamorra"},
	["Aviaozinho [CAMORRA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Camorra", orgType = "Drogas"}, "perm.camorra", "perm.arma", "perm.ilegal"},
	
	--MEXICO--NAOO TEM NA CIDADE ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [MEXICO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mexico", orgType = "Drogas"}, "perm.mexico", "perm.lidermexico","perm.recrutamentomexico", "perm.arma", "perm.ilegal", "perm.baumexico"},
	["Sub-Lider [MEXICO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mexico", orgType = "Drogas"}, "perm.lidermexicoi", "perm.mexico","perm.recrutamentomexico", "perm.arma", "perm.ilegal", "perm.baumexico"},
	["Gerente [MEXICO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mexico", orgType = "Drogas"}, "perm.mexico", "perm.arma", "perm.ilegal","perm.recrutamentomexico", "perm.baumexico"},
	["Recrutador [MEXICO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mexico", orgType = "Drogas"}, "perm.mexico", "perm.arma", "perm.ilegal","perm.recrutamentomexico", "perm.baumexico"},
	["Membro [MEXICO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mexico", orgType = "Drogas"}, "perm.mexico", "perm.arma", "perm.ilegal","perm.recrutamentomexico", "perm.baumexico"},
	["Aviaozinho [MEXICO]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Mexico", orgType = "Drogas"}, "perm.mexico", "perm.arma", "perm.ilegal"},
	
	--JAMAICA--NAOO TEM NA CIDADE -------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [JAMAICA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Jamaica", orgType = "Drogas"}, "perm.jamaica", "perm.liderjamaica","perm.recrutamentojamaica", "perm.arma", "perm.ilegal", "perm.baujamaica"},
	["Sub-Lider [JAMAICA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Jamaica", orgType = "Drogas"}, "perm.liderjamaicai", "perm.jamaica","perm.recrutamentojamaica", "perm.arma", "perm.ilegal", "perm.baujamaica"},
	["Gerente [JAMAICA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Jamaica", orgType = "Drogas"}, "perm.jamaica", "perm.arma", "perm.ilegal","perm.recrutamentojamaica", "perm.baujamaica"},
	["Recrutador [JAMAICA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Jamaica", orgType = "Drogas"}, "perm.jamaica", "perm.arma", "perm.ilegal","perm.recrutamentojamaica", "perm.baujamaica"},
	["Membro [JAMAICA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Jamaica", orgType = "Drogas"}, "perm.jamaica", "perm.arma", "perm.ilegal","perm.recrutamentojamaica", "perm.baujamaica"},
	["Aviaozinho [JAMAICA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Jamaica", orgType = "Drogas"}, "perm.jamaica", "perm.arma", "perm.ilegal"},
	
	--AUSTRALIA--NAO TEM NA CIDADE ------------------------------------------------------------------------------------------------------------------------------------------------------
	["Lider [AUSTRALIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Australia", orgType = "Drogas"}, "perm.australia", "perm.lideraustralia","perm.recrutamentoaustralia", "perm.arma", "perm.ilegal", "perm.bauaustralia"},
	["Sub-Lider [AUSTRALIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Australia", orgType = "Drogas"}, "perm.lideraustraliai", "perm.australia","perm.recrutamentoaustralia", "perm.arma", "perm.ilegal", "perm.bauaustralia"},
	["Gerente [AUSTRALIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Australia", orgType = "Drogas"}, "perm.australia", "perm.arma", "perm.ilegal","perm.recrutamentoaustralia", "perm.bauaustralia"},
	["Recrutador [AUSTRALIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Australia", orgType = "Drogas"}, "perm.australia", "perm.arma", "perm.ilegal","perm.recrutamentoaustralia", "perm.bauaustralia"},
	["Membro [AUSTRALIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Australia", orgType = "Drogas"}, "perm.australia", "perm.arma", "perm.ilegal","perm.recrutamentoaustralia", "perm.bauaustralia"},
	["Aviaozinho [AUSTRALIA]"] = { _config = { gtype = "org", salario = 0, ptr = nil, orgName = "Australia", orgType = "Drogas"}, "perm.australia", "perm.arma", "perm.ilegal"},

	
	
	
	
	
	
	

	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- PAISANA--N TEM 

	----------------------------------------------------------------------------------------------------------------------------
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- Mecanicas
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["LiderCustom"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Mecanica" }, "dv.permissao2","perm.recrutamentomec", "mecanico.permissao",'perm.mecanica','perm.lidermecanica',  "lscustom.permissao"},
	["SubLiderCustom"] = { _config = { gtype = "org", salario = 4000, ptr = nil, orgName = "Mecanica" }, "dv.permissao2", "mecanico.permissao","perm.recrutamentomec",'perm.mecanica','perm.lidermecanica', "perm.algemar", "lscustom.permissao"},
	["GerenteCustom"] = { _config = { gtype = "org", salario = 3000, ptr = nil, orgName = "Mecanica" }, "dv.permissao2", "mecanico.permissao","perm.recrutamentomec",'perm.mecanica',  "lscustom.permissao"},
	["MecanicoCustom"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Mecanica" }, "dv.permissao2", "mecanico.permissao","perm.recrutamentomec",'perm.mecanica',  "lscustom.permissao"},
	["AprendizCustom"] = { _config = { gtype = "org", salario = 1000, ptr = nil, orgName = "Mecanica" }, "mecanico.permissao2",'perm.mecanica', "lscustom.permissao"},
	----MECANICA RIDE OUT
	["LiderRIDEOUT"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Mecanica2" }, "dv.permissao","perm.recrutamentomec", "mecanico.permissao",'perm.mecanica2','perm.liderrideout','perm.mecanica2', "perm.algemar", "rideout.permissao"}, 
	["SubLiderRIDEOUT"] = { _config = { gtype = "org", salario = 4000, ptr = nil, orgName = "Mecanica2" }, "dv.permissao", "mecanico2.permissao","perm.recrutamentomec",'perm.mecanica2','perm.lidersportrace2','perm.mecanica2', "perm.algemar", "rideout.permissao"},
    ["GerenterRIDEOUT"] = { _config = { gtype = "org", salario = 3000, ptr = nil, orgName = "Mecanica2" }, "dv.permissao", "mecanico2.permissao","perm.recrutamentomec",'perm.mecanica2','perm.mecanica2', "perm.algemar", "rideout.permissao"},
    ["MecanicorRIDEOUT"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Mecanica2" }, "dv.permissao", "mecanico2.permissao2","perm.recrutamentomec",'perm.mecanica2','perm.mecanica2', "perm.algemar", "rideout.permissao"},
    ["AprendizRIDEOUT"] = { _config = { gtype = "org", salario = 1000, ptr = nil, orgName = "Mecanica2" }, "mecanico2.permissao","perm.recrutamentomec",'perm.mecanica','perm.mecanica2', "rideout.permissao"},

---------------------------------------------------------------------------------------------------

["Chamado Mecanica"] = { _config = { salario = 0, ptr = nil }, "perm.chamadoMecanica" },


---------------------------------------------------------------------------------------------------


}

cfg.users = {
	[1] = { "owner" },

}

cfg.selectors = { }

return cfg

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -- POLICIA MILITAR
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ["CoronelPRF"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "perm.baupolicialider","perm.recrutamentomilitar", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia" },
-- ["MajorPRF"] = { _config = { gtype = "org", salario = 18000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "perm.baupolicialider","perm.recrutamentomilitar", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
-- ["CapitaoPRF"] = { _config = { gtype = "org", salario = 16000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "perm.baupolicialider","perm.recrutamentomilitar", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
-- ["TenentePRF"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "perm.baupolicialider","perm.recrutamentomilitar", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
-- ["SargentoPRF"] = { _config = { gtype = "org", salario = 12000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "perm.baupolicialider","perm.recrutamentomilitar", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
-- ["CaboPRF"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "player.blips", "perm.disparo","perm.recrutamentomilitar", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
-- ["SoldadoPRF"] = { _config = { gtype = "org", salario = 8000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
-- ["RecrutaPRF"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Policia" }, "perm.policia", "perm.militar", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },







	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETIRADOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


    -- --CDD--
	-- ["Lider [CDD]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "CDD", orgType = "fDesmanche"}, "perm.lidercdd","perm.recrutamentocdd", "perm.cdd", "perm.desmanche", "perm.ilegal", "perm.baujapao"},
	-- ["Sub-Lider [CDD]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "CDD", orgType = "fDesmanche"}, "perm.lidercdd","perm.recrutamentocdd", "perm.cdd", "perm.desmanche", "perm.ilegal", "perm.baujapao"},
	-- ["Gerente [CDD]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "CDD", orgType = "fDesmanche"}, "perm.cdd","perm.recrutamentocdd", "perm.desmanche", "perm.ilegal", "perm.baucdd"},
	-- ["Membro [CDD]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "CDD", orgType = "fDesmanche"}, "perm.cdd","perm.recrutamentocdd", "perm.desmanche", "perm.ilegal", "perm.baucdd"},
	-- ["Recrutador [CDD]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "CDD", orgType = "fDesmanche"}, "perm.cdd","perm.recrutamentocdd", "perm.desmanche", "perm.ilegal", "perm.baucdd"},
	-- ["Aviaozinho [CDD]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "CDD", orgType = "fDesmanche"}, "perm.cdd", "perm.desmanche", "perm.ilegal"},



	-- --DARKS--
	-- ["Lider [DARKS]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Darks", orgType = "Drogas"}, "perm.darks", "perm.liderdarks", "perm.balinha", "perm.ilegal", "perm.baudarks"},
	-- ["Sub-Lider [DARKS]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Darks", orgType = "Drogas"}, "perm.liderdarks", "perm.darks", "perm.balinha", "perm.ilegal", "perm.baudarks"},
	-- ["Gerente [DARKS]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Darks", orgType = "Drogas"}, "perm.darks", "perm.balinha", "perm.ilegal", "perm.baudarks"},
	-- ["Membro [DARKS]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Darks", orgType = "Drogas"}, "perm.darks", "perm.balinha", "perm.ilegal", "perm.baudarks"},
	-- ["Aviaozinho [DARKS]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Darks", orgType = "Drogas"}, "perm.darks", "perm.balinha", "perm.ilegal"},

	-- 	--WHITES--
	-- ["Lider [WHITES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Whites", orgType = "Drogas"}, "perm.whites", "perm.liderwhites", "perm.balinha", "perm.ilegal", "perm.bauwhites"},
	-- ["Sub-Lider [WHITES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Whites", orgType = "Drogas"}, "perm.liderwhites", "perm.whites", "perm.balinha", "perm.ilegal", "perm.bauwhites"},
	-- ["Gerente [WHITES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Whites", orgType = "Drogas"}, "perm.whites", "perm.balinha", "perm.ilegal", "perm.bauwhites"},
	-- ["Membro [WHITES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Whites", orgType = "Drogas"}, "perm.whites", "perm.balinha", "perm.ilegal", "perm.bauwhites"},
	-- ["Aviaozinho [WHITES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Whites", orgType = "Drogas"}, "perm.whites", "perm.balinha", "perm.ilegal"},

	-- 	--FALCOES--
	-- ["Lider [FALCOES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Falcoes", orgType = "Drogas"}, "perm.falcoes", "perm.liderfalcoes", "perm.balinha", "perm.ilegal", "perm.baufalcoes"},
	-- ["Sub-Lider [FALCOES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Falcoes", orgType = "Drogas"}, "perm.liderfalcoes", "perm.falcoes", "perm.balinha", "perm.ilegal", "perm.baufalcoes"},
	-- ["Gerente [FALCOES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Falcoes", orgType = "Drogas"}, "perm.falcoes", "perm.balinha", "perm.ilegal", "perm.baufalcoes"},
	-- ["Membro [FALCOES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Falcoes", orgType = "Drogas"}, "perm.falcoes", "perm.balinha", "perm.ilegal", "perm.baufalcoes"},
	-- ["Aviaozinho [FALCOES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Falcoes", orgType = "Drogas"}, "perm.falcoes", "perm.balinha", "perm.ilegal"},
	
	-- 	--Tubaroes--
	-- ["Lider [TUBAROES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Tubaroes", orgType = "Drogas"}, "perm.tubaroes", "perm.lidertubaroes", "perm.balinha", "perm.ilegal", "perm.bautubaroes"},
	-- ["Sub-Lider [TUBAROES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Tubaroes", orgType = "Drogas"}, "perm.lidertubaroes", "perm.tubaroes", "perm.balinha", "perm.ilegal", "perm.bautubaroes"},
	-- ["Gerente [TUBAROES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Tubaroes", orgType = "Drogas"}, "perm.tubaroes", "perm.balinha", "perm.ilegal", "perm.bautubaroes"},
	-- ["Membro [TUBAROES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Tubaroes", orgType = "Drogas"}, "perm.tubaroes", "perm.balinha", "perm.ilegal", "perm.bautubaroes"},
	-- ["Aviaozinho [TUBAROES]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Tubaroes", orgType = "Drogas"}, "perm.tubaroes", "perm.balinha", "perm.ilegal"},

	