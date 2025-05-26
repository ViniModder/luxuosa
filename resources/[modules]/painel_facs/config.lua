orgsConfig = {}

orgsConfig.blackList = 1
orgsConfig.PermAdmin = "admin.permissao"
orgsConfig.debug = true
orgsConfig.webhook = {
	demote = "https://discord.com/api/webhooks/1233269854404870165/zSrywBwf4NAAwX_kHTpVwCPMNI0QHQbjNAuRhKMqI9QJY9g1cEp5IYbuHHtua7mc3YeI",
	invite = "https://discord.com/api/webhooks/1233269854404870165/zSrywBwf4NAAwX_kHTpVwCPMNI0QHQbjNAuRhKMqI9QJY9g1cEp5IYbuHHtua7mc3YeI",
	bankDeposit = "https://discord.com/api/webhooks/1233269854404870165/zSrywBwf4NAAwX_kHTpVwCPMNI0QHQbjNAuRhKMqI9QJY9g1cEp5IYbuHHtua7mc3YeI",
	bankWithdraw = "https://discord.com/api/webhooks/1233269854404870165/zSrywBwf4NAAwX_kHTpVwCPMNI0QHQbjNAuRhKMqI9QJY9g1cEp5IYbuHHtua7mc3YeI",
	reward = "https://discord.com/api/webhooks/1233269854404870165/zSrywBwf4NAAwX_kHTpVwCPMNI0QHQbjNAuRhKMqI9QJY9g1cEp5IYbuHHtua7mc3YeI",
	hire = "https://discord.com/api/webhooks/1233269854404870165/zSrywBwf4NAAwX_kHTpVwCPMNI0QHQbjNAuRhKMqI9QJY9g1cEp5IYbuHHtua7mc3YeI"
}

orgsConfig.PaymentDefault = {
	maxMonthly = 5000,
	maxDaily = 450,
	payment = 10000


--  itemName = "teste",
--  playerRewarded = true,
--  playerDailyFarm = 10,
--  playerMonthly = 10,
}

orgsConfig.langs = {
	isBlackList = function(source,dia,mes,hora,minutos) return TriggerClientEvent("Notify",source, "negado","Atenção: Você so podera entrar em organização no dia "..dia.."/"..mes.." as "..hora..":"..minutos..".", 5000) end,
    haveBlackList = function(source,dia,mes,hora,minutos) return TriggerClientEvent("Notify",source, "negado","Este jogador está proibido de entrar em qualquer organização até dia "..dia.."/"..mes.." as "..hora..":"..minutos..".", 5000) end,
}


orgsConfig.main = {
	createAutomatic = true, -- Criar Automaticamente Organizações no banco de dados, so é preciso startar uma vez a cada alteração com ela em TRUE.
}

orgsConfig.List = {
 
	["Hospital"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "Hospital",
			itens = {
				['bandagem'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'HOSPITAL',''},

		groups = {
			["Diretor"] = { -- CARGO
				prefix = "Diretor", -- PREFIX
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["ViceDiretor"] = { -- CARGO
				prefix = "ViceDiretor", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gestao"] = { -- CARGO
				prefix = "Gestao", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Psiquiatra"] = { -- CARGO
				prefix = "Psiquiatra", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Medico"] = { -- CARGO
				prefix = "Medico", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Enfermeiro"] = { -- CARGO
				prefix = "Enfermeiro", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["Socorrista"] = { -- CARGO
				prefix = "Socorrista", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["Bombeiro"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "Bombeiro",
			itens = {
				['bandagem'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["CoronelBombeiros"] = { -- CARGO
				prefix = "CoronelBombeiros", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MajorBombeiros"] = { -- CARGO
				prefix = "MajorBombeiros", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SargentoBombeiros"] = { -- CARGO
				prefix = "SargentoBombeiros", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["TenenteBombeiros"] = { -- CARGO
				prefix = "TenenteBombeiros", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["SubTenenteBombeiros"] = { -- CARGO
				prefix = "SubTenenteBombeiros", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SocorristaBombeiros"] = { -- CARGO
				prefix = "SocorristaBombeiros", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["StreetRacing"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "StreetRacing",
			itens = {
				['plastico'] = true,
				['metal'] = true,
				['c-cobre'] = true,
			}
		},
		baus = {'MECANICA01',''},

		groups = {
			["LiderStreetRacing"] = { -- CARGO
				prefix = "LiderStreetRacing", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SubLiderStreetRacinge"] = { -- CARGO
				prefix = "SubLiderStreetRacinge", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["GerenteStreetRacing"] = { -- CARGO
				prefix = "GerenteStreetRacing", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MecanicoStreetRacing"] = { -- CARGO
				prefix = "MecanicoStreetRacing", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["AprendizStreetRacinge"] = { -- CARGO
				prefix = "AprendizStreetRacinge", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["HavanaCustom"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "HavanaCustom",
			itens = {
				['plastico'] = true,
				['metal'] = true,
				['c-cobre'] = true,
			}
		},
		baus = {'HAVANACUSTOM01',''},

		groups = {
			["LiderCustom"] = { -- CARGO
			 prefix = "LiderCustom", -- PREFIX
			 tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
		     access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SubLiderCustom"] = { -- CARGO
				 prefix = "SubLiderCustom", -- PREFIX
				 tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
			     access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["GerenteCustom"] = { -- CARGO
				prefix = "GerenteCustom", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MecanicoCustom"] = { -- CARGO
				prefix = "MecanicoCustom", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["AprendizCustom"] = { -- CARGO
				prefix = "AprendizCustom", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["Judiciario"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "Judiciario",
			itens = {
				['bandagem'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["Ministro"] = { -- CARGO
				prefix = "Ministro", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Juiz"] = { -- CARGO
				prefix = "Juiz", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Desembargador"] = { -- CARGO
				prefix = "Desembargador", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Promotor"] = { -- CARGO
				prefix = "Promotor", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Advogado"] = { -- CARGO
				prefix = "Advogado", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},

	["PoliciaCivil"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "PoliciaCivil",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["DelegadoGeral"] = { -- CARGO
				prefix = "DelegadoGeral", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["ComandanteCore"] = { -- CARGO
				prefix = "ComandanteCore", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SubComandanteCore"] = { -- CARGO
				prefix = "SubComandanteCore", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Delegado"] = { -- CARGO
				prefix = "Delegado", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Core"] = { -- CARGO
				prefix = "Core", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Perito"] = { -- CARGO
				prefix = "Perito", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["Escrivao"] = { -- CARGO
				prefix = "Escrivao", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},

	["PMERJ"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "PMERJ",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["ComandoPMERJ"] = { -- CARGO
				prefix = "ComandoPMERJ", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 14, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["CoronelPMERJ"] = { -- CARGO
				prefix = "CoronelPMERJ", -- PREFIX
				tier = 13, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["TenenteCoronelPMERJ"] = { -- CARGO
				prefix = "TenenteCoronelPMERJ", -- PREFIX
				tier = 12, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MajorPMERJ"] = { -- CARGO
				prefix = "MajorPMERJ", -- PREFIX
				tier = 11, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["CapitaoPMERJ"] = { -- CARGO
				prefix = "CapitaoPMERJ", -- PREFIX
				tier = 10, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["PrimeiroTenentePMERJ"] = { -- CARGO
				prefix = "PrimeiroTenentePMERJ", -- PREFIX
				tier = 9, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["SegundoTenentePMERJ"] = { -- CARGO
				prefix = "SegundoTenentePMERJ", -- PREFIX
				tier = 8, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["SubTenentePMERJ"] = { -- CARGO
			prefix = "SubTenentePMERJ", -- PREFIX
			tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
			access = {
				info = true,
				bank = true,
				hire = false,
				demote = false,
				partner = false,
				metaslist= true,
				chest = true,
				linkimage = true,
			},
		},
		["PrimeiroSargentoPMERJ"] = { -- CARGO
		prefix = "PrimeiroSargentoPMERJ", -- PREFIX
		tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
		access = {
			info = true,
			bank = true,
			hire = false,
			demote = false,
			partner = false,
			metaslist= true,
			chest = true,
			linkimage = true,
		},
	},
	["SegundoSargentoPMERJ"] = { -- CARGO
	prefix = "SegundoSargentoPMERJ", -- PREFIX
	tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
	   access = {
		info = true,
		bank = true,
		hire = false,
		demote = false,
		partner = false,
		metaslist= true,
		chest = true,
		linkimage = true,
	},
},
    ["TerceiroSargentoPMERJ"] = { -- CARGO
    prefix = "TerceiroSargentoPMERJ", -- PREFIX
    tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
    access = {
		info = true,
		bank = true,
		hire = false,
		demote = false,
		partner = false,
		metaslist= true,
		chest = true,
		linkimage = true,
    },
},
    ["CaboPMERJ"] = { -- CARGO
    prefix = "CaboPMERJ", -- PREFIX
    tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
    access = {
		info = true,
		bank = true,
		hire = false,
		demote = false,
		partner = false,
		metaslist= true,
		chest = true,
		linkimage = true,
    },
},

    ["SoldadoPMERJ"] = { -- CARGO
    prefix = "SoldadoPMERJ", -- PREFIX
    tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
         access = {
			info = true,
			bank = true,
			hire = false,
			demote = false,
			partner = false,
			metaslist= true,
			chest = true,
			linkimage = true,
   },
},

    ["AlunoPMERJ"] = { -- CARGO
    prefix = "AlunoPMERJ", -- PREFIX
    tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
            access = {
			info = true,
			bank = true,
			hire = false,
			demote = false,
			partner = false,
			metaslist= true,
			chest = true,
			linkimage = true,
                },
            },
		},
	},
	["Exercito"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "Exercito",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["Coronel"] = { -- CARGO
				prefix = "Coronel", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 12, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["TenenteCoronel"] = { -- CARGO
				prefix = "TenenteCoronel", -- PREFIX
				tier = 11, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Major"] = { -- CARGO
				prefix = "Major", -- PREFIX
				tier = 10, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Capitao"] = { -- CARGO
				prefix = "Capitao", -- PREFIX
				tier = 9, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["PrimeiroTenente"] = { -- CARGO
				prefix = "PrimeiroTenente", -- PREFIX
				tier = 8, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SegundoTenente"] = { -- CARGO
				prefix = "SegundoTenente", -- PREFIX
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["SubTenente"] = { -- CARGO
				prefix = "SubTenente", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["PrimeiroSargento"] = { -- CARGO
				prefix = "PrimeiroSargento", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["SegundoSargento"] = { -- CARGO
				prefix = "SegundoSargento", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["TerceiroSargento"] = { -- CARGO
				prefix = "TerceiroSargento", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["Cabo"] = { -- CARGO
				prefix = "Cabo", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["Soldado"] = { -- CARGO
				prefix = "Soldado", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["Bope"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "Bope",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'BOPE01','BOPE02'},

		groups = {
			["CoronelBope"] = { -- CARGO
				prefix = "CoronelBope", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 8, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MajorBope"] = { -- CARGO
				prefix = "MajorBope", -- PREFIX
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["CapitaoBope"] = { -- CARGO
				prefix = "CapitaoBope", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["TenenteBope"] = { -- CARGO
				prefix = "TenenteBope", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["SargentoBope"] = { -- CARGO
				prefix = "SargentoBope", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["CaboBope"] = { -- CARGO
				prefix = "CaboBope", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["SoldadoBope"] = { -- CARGO
				prefix = "SoldadoBope", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["RecrutaBope"] = { -- CARGO
				prefix = "RecrutaBope", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["PoliciaFederal"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "PoliciaFederal",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["CoronelFederal"] = { -- CARGO
				prefix = "CoronelFederal", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 8, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MajorFederal"] = { -- CARGO
				prefix = "MajorFederal", -- PREFIX
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["CapitaoFederal"] = { -- CARGO
				prefix = "CapitaoFederal", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["TenenteFederal"] = { -- CARGO
				prefix = "TenenteFederal", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["SargentoFederal"] = { -- CARGO
				prefix = "SargentoFederal", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["CaboFederal"] = { -- CARGO
				prefix = "CaboFederal", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["SoldadoFederal"] = { -- CARGO
				prefix = "SoldadoFederal", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["RecrutaFederal"] = { -- CARGO
				prefix = "RecrutaFederal", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},

	["PRF"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "PRF",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["CoronelPRF"] = { -- CARGO
				prefix = "CoronelPRF", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 8, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["MajorPRF"] = { -- CARGO
				prefix = "MajorPRF", -- PREFIX
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["CapitaoPRF"] = { -- CARGO
				prefix = "CapitaoPRF", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["TenentePRF"] = { -- CARGO
				prefix = "TenentePRF", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["SargentoPRF"] = { -- CARGO
				prefix = "SargentoPRF", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["CaboPRF"] = { -- CARGO
				prefix = "CaboPRF", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["SoldadoPRF"] = { -- CARGO
				prefix = "SoldadoPRF", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["RecrutaPRF"] = { -- CARGO
				prefix = "RecrutaPRF", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["PoliciaCivil"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "PoliciaCivil",
			itens = {
				['colete'] = true,
				['repairkit'] = true,
			}
		},
		baus = {'',''},

		groups = {
			["DelegadoGeral"] = { -- CARGO
				prefix = "DelegadoGeral", -- PREFIX
				leader = true, -- Para Não aparecer na tela de ( Invite / Promote )
				tier = 10, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["ComandanteCore"] = { -- CARGO
				prefix = "ComandanteCore", -- PREFIX
				tier = 9, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["SubComandanteCore"] = { -- CARGO
				prefix = "SubComandanteCore", -- PREFIX
				tier = 8, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Delegado"] = { -- CARGO
				prefix = "Delegado", -- PREFIX
				tier = 7, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Core"] = { -- CARGO
				prefix = "Core", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Perito"] = { -- CARGO
				prefix = "Perito", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
						
			["Escrivao"] = { -- CARGO
				prefix = "Escrivao", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["Investigador"] = { -- CARGO
				prefix = "Investigador", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			["Agente"] = { -- CARGO
			    prefix = "Agente", -- PREFIX
			    tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
			    access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
			    },
		    },
			["Recruta"] = { -- CARGO
				prefix = "Recruta", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  /groupadd 1 "lider bloods"
-- ARMAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	["DEMONIKE"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "DEMONIKE",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'DEMONIKE01','DEMONIKE02'},

		groups = {
			["Lider [DEMONIKE]"] = { -- CARGO
				prefix = "Lider [DEMONIKE]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [DEMONIKE]"] = { -- CARGO
				prefix = "Sub-Lider [DEMONIKE]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [DEMONIKE]"] = { -- CARGO
				prefix = "Gerente [DEMONIKE]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [DEMONIKE]"] = { -- CARGO
				prefix = "Recrutador [DEMONIKE]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [DEMONIKE]"] = { -- CARGO
				prefix = "Membro [DEMONIKE]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [DEMONIKE]"] = { -- CARGO
				prefix = "Aviaozinho [DEMONIKE]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = false,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["PCC"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "PCC",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'PCC01','PCC02'},

		groups = {
			["Lider [PCC]"] = { -- CARGO
				prefix = "Lider [PCC]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [PCC]"] = { -- CARGO
				prefix = "Sub-Lider [PCC]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [PCC]"] = { -- CARGO
				prefix = "Gerente [PCC]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [PCC]"] = { -- CARGO
				prefix = "Recrutador [PCC]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [PCC]"] = { -- CARGO
				prefix = "Membro [PCC]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [PCC]"] = { -- CARGO
				prefix = "Aviaozinho [PCC]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["MAFIA"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "MAFIA",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'MAFIA01','MAFIA02'},

		groups = {
			["Lider [MAFIA]"] = { -- CARGO
				prefix = "Lider [MAFIA]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [MAFIA]"] = { -- CARGO
				prefix = "Sub-Lider [MAFIA]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [MAFIA]"] = { -- CARGO
				prefix = "Gerente [MAFIA]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [MAFIA]"] = { -- CARGO
				prefix = "Recrutador [MAFIA]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [MAFIA]"] = { -- CARGO
				prefix = "Membro [MAFIA]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [MAFIA]"] = { -- CARGO
				prefix = "Aviaozinho [MAFIA]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["CARTEL"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "CARTEL",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
				['plastico'] = true,
			}
		},
		baus = {'BauLiderCartel','BauMembroCartel'},

		groups = {
			["Lider [CARTEL]"] = { -- CARGO
				prefix = "Lider [CARTEL]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [CARTEL]"] = { -- CARGO
				prefix = "Sub-Lider [CARTEL]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [CARTEL]"] = { -- CARGO
				prefix = "Gerente [CARTEL]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [CARTEL]"] = { -- CARGO
				prefix = "Recrutador [CARTEL]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [CARTEL]"] = { -- CARGO
				prefix = "Membro [CARTEL]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [CARTEL]"] = { -- CARGO
				prefix = "Aviaozinho [CARTEL]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["CROACIA"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "CROACIA",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
				['metal'] = true,
				['gatilho'] = true,
			}
		},
		baus = {'CROACIA01','CROACIA02'},

		groups = {
			["Lider [CROACIA]"] = { -- CARGO
				prefix = "Lider [CROACIA]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [CROACIA"] = { -- CARGO
				prefix = "Sub-Lider [CROACIA]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [CROACIA]"] = { -- CARGO
				prefix = "Gerente [CROACIA]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [CROACIA]"] = { -- CARGO
				prefix = "Recrutador [CROACIA]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [CROACIA]"] = { -- CARGO
				prefix = "Membro [CROACIA]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [CROACIA]"] = { -- CARGO
				prefix = "Aviaozinho [CROACIA]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["FRANCA"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "FRANCA",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'FRANCA01','FRANCA02'},

		groups = {
			["Lider [FRANCA]"] = { -- CARGO
				prefix = "Lider [FRANCA]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [FRANCA"] = { -- CARGO
				prefix = "Sub-Lider [FRANCA]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [FRANCA]"] = { -- CARGO
				prefix = "Gerente [FRANCA]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [FRANCA]"] = { -- CARGO
				prefix = "Recrutador [FRANCA]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [FRANCA]"] = { -- CARGO
				prefix = "Membro [FRANCA]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [FRANCA]"] = { -- CARGO
				prefix = "Aviaozinho [FRANCA]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["WOLVES"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "WOLVES",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'WOLVES01','WOLVES02'},

		groups = {
			["Lider [WOLVES]"] = { -- CARGO
				prefix = "Lider [WOLVES]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [WOLVES"] = { -- CARGO
				prefix = "Sub-Lider [WOLVES]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [WOLVES]"] = { -- CARGO
				prefix = "Gerente [WOLVES]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [WOLVES]"] = { -- CARGO
				prefix = "Recrutador [WOLVES]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [WOLVES]"] = { -- CARGO
				prefix = "Membro [WOLVES]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [WOLVES]"] = { -- CARGO
				prefix = "Aviaozinho [WOLVES]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["YAKUZA"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "YAKUZA",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'YAKUZA01','YAKUZA02'},

		groups = {
			["Lider [YAKUZA]"] = { -- CARGO
				prefix = "Lider [YAKUZA]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [YAKUZA"] = { -- CARGO
				prefix = "Sub-Lider [YAKUZA]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [YAKUZA]"] = { -- CARGO
				prefix = "Gerente [YAKUZA]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [YAKUZA]"] = { -- CARGO
				prefix = "Recrutador [YAKUZA]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [YAKUZA]"] = { -- CARGO
				prefix = "Membro [YAKUZA]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [YAKUZA]"] = { -- CARGO
				prefix = "Aviaozinho [YAKUZA]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["TRIADE"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "TRIADE",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'TRIADE01','TRIADE02'},

		groups = {
			["Lider [TRIADE]"] = { -- CARGO
				prefix = "Lider [TRIADE]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [TRIADE"] = { -- CARGO
				prefix = "Sub-Lider [TRIADE]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [TRIADE]"] = { -- CARGO
				prefix = "Gerente [TRIADE]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [TRIADE]"] = { -- CARGO
				prefix = "Recrutador [TRIADE]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [TRIADE]"] = { -- CARGO
				prefix = "Membro [TRIADE]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [TRIADE]"] = { -- CARGO
				prefix = "Aviaozinho [TRIADE]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["MERLIM"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "MERLIM",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'','MERLIM02'},

		groups = {
			["Lider [MERLIM]"] = { -- CARGO
				prefix = "Lider [MERLIM]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [MERLIM"] = { -- CARGO
				prefix = "Sub-Lider [MERLIM]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [MERLIM]"] = { -- CARGO
				prefix = "Gerente [MERLIM]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [MERLIM]"] = { -- CARGO
				prefix = "Recrutador [MERLIM]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [MERLIM]"] = { -- CARGO
				prefix = "Membro [MERLIM]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [MERLIM]"] = { -- CARGO
				prefix = "Aviaozinho [MERLIM]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["GROTA"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "GROTA",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
				['metal'] = true,
				['gatilho'] = true,
			}
		},
		baus = {'BauLiderGrota','BauMembroGrota'},
		groups = {
			["Lider [GROTA]"] = { -- CARGO
				prefix = "Lider [GROTA]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [GROTA"] = { -- CARGO
				prefix = "Sub-Lider [GROTA]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [GROTA]"] = { -- CARGO
				prefix = "Gerente [GROTA]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [GROTA]"] = { -- CARGO
				prefix = "Recrutador [GROTA]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [GROTA]"] = { -- CARGO
				prefix = "Membro [GROTA]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = false,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [GROTA]"] = { -- CARGO
				prefix = "Aviaozinho [GROTA]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = false,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["TURQUIA"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "TURQUIA",
			itens = {
				['c-fio'] = true,
				['pacote_tecido'] = true,
				['m-aco'] = true,
				['c-ferro'] = true,
				['l-alvejante'] = true,
			}
		},
		baus = {'TURQUIA01','TURQUIA02'},

		groups = {
			["Lider [TURQUIA]"] = { -- CARGO
				prefix = "Lider [TURQUIA]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [TURQUIA"] = { -- CARGO
				prefix = "Sub-Lider [TURQUIA]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [TURQUIA]"] = { -- CARGO
				prefix = "Gerente [TURQUIA]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [TURQUIA]"] = { -- CARGO
				prefix = "Recrutador [TURQUIA]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [TURQUIA]"] = { -- CARGO
				prefix = "Membro [TURQUIA]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [TURQUIA]"] = { -- CARGO
				prefix = "Aviaozinho [TURQUIA]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
	["BLACKOUT"] = {
		config = {
			maxMembers = 200, -- Maximo de Jogadores
		},

		armazem = {
			name = "BLACKOUT",
			itens = {
				['pecadearma'] = true,
				['molas'] = true,
			}
		},
		baus = {'BLACKOUT01','BLACKOUT02'},

		groups = {
			["Lider [BLACKOUT]"] = { -- CARGO
				prefix = "Lider [BLACKOUT]", -- PREFIX
				tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Sub-Lider [BLACKOUT"] = { -- CARGO
				prefix = "Sub-Lider [BLACKOUT]", -- PREFIX
				tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Gerente [BLACKOUT]"] = { -- CARGO
				prefix = "Gerente [BLACKOUT]", -- PREFIX
				tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = true,
					partner = true,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Recrutador [BLACKOUT]"] = { -- CARGO
				prefix = "Recrutador [BLACKOUT]", -- PREFIX
				tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = true,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},

			["Membro [BLACKOUT]"] = { -- CARGO
				prefix = "Membro [BLACKOUT]", -- PREFIX
				tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
			["Aviaozinho [BLACKOUT]"] = { -- CARGO
				prefix = "Aviaozinho [BLACKOUT]", -- PREFIX
				tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
				access = {
					info = true,
					bank = true,
					hire = false,
					demote = false,
					partner = false,
					metaslist= true,
					chest = true,
					linkimage = true,
					chestlist = true,
				},
			},
			
		},
	},
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- MUNIÇÃO E DESMANCHE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
          ["MILICIA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "MILICIA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
					['metal'] = true,
					['gatilho'] = true,
				}
			},
			baus = {'bauLiderMilicia','bauMembroMilicia'},
	
			groups = {
				["Lider [MILICIA]"] = { -- CARGO
					prefix = "Lider [MILICIA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [MILICIA"] = { -- CARGO
					prefix = "Sub-Lider [MILICIA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [MILICIA]"] = { -- CARGO
					prefix = "Gerente [MILICIA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [MILICIA]"] = { -- CARGO
					prefix = "Recrutador [MILICIA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [MILICIA]"] = { -- CARGO
					prefix = "Membro [MILICIA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [MILICIA]"] = { -- CARGO
					prefix = "Aviaozinho [MILICIA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["ALEMAO"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "ALEMAO",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'ALEMAO01','ALEMAO02'},
	
			groups = {
				["Lider [ALEMAO]"] = { -- CARGO
					prefix = "Lider [ALEMAO]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [ALEMAO"] = { -- CARGO
					prefix = "Sub-Lider [ALEMAO]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [ALEMAO]"] = { -- CARGO
					prefix = "Gerente [ALEMAO]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [ALEMAO]"] = { -- CARGO
					prefix = "Recrutador [ALEMAO]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [ALEMAO]"] = { -- CARGO
					prefix = "Membro [ALEMAO]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [ALEMAO]"] = { -- CARGO
					prefix = "Aviaozinho [ALEMAO]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["HELIPA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "HELIPA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
			baus = {'HELIPA01','HELIPA02'},
	
			groups = {
				["Lider [HELIPA]"] = { -- CARGO
					prefix = "Lider [HELIPA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [HELIPA"] = { -- CARGO
					prefix = "Sub-Lider [HELIPA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [HELIPA]"] = { -- CARGO
					prefix = "Gerente [HELIPA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [HELIPA]"] = { -- CARGO
					prefix = "Recrutador [HELIPA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [HELIPA]"] = { -- CARGO
					prefix = "Membro [HELIPA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [HELIPA]"] = { -- CARGO
					prefix = "Aviaozinho [HELIPA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["ROCINHA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "ROCINHA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'ROCINHA01','ROCINHA02'},
	
			groups = {
				["Lider [ROCINHA]"] = { -- CARGO
					prefix = "Lider [ROCINHA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [ROCINHA"] = { -- CARGO
					prefix = "Sub-Lider [ROCINHA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [ROCINHA]"] = { -- CARGO
					prefix = "Gerente [ROCINHA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [ROCINHA]"] = { -- CARGO
					prefix = "Recrutador [ROCINHA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [ROCINHA]"] = { -- CARGO
					prefix = "Membro [ROCINHA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [ROCINHA]"] = { -- CARGO
					prefix = "Aviaozinho [ROCINHA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["CRIPS"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "CRIPS",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'CRIPS01','CRIPS02'},
	
			groups = {
				["Lider [CRIPS]"] = { -- CARGO
					prefix = "Lider [CRIPS]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [CRIPS"] = { -- CARGO
					prefix = "Sub-Lider [CRIPS]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [CRIPS]"] = { -- CARGO
					prefix = "Gerente [CRIPS]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [CRIPS]"] = { -- CARGO
					prefix = "Recrutador [CRIPS]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [CRIPS]"] = { -- CARGO
					prefix = "Membro [CRIPS]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [CRIPS]"] = { -- CARGO
					prefix = "Aviaozinho [CRIPS]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["FURIOUS"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "FURIOUS",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'FURIOUS01','FURIOUS02'},
	
			groups = {
				["Lider [FURIOUS]"] = { -- CARGO
					prefix = "Lider [FURIOUS]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [FURIOUS"] = { -- CARGO
					prefix = "Sub-Lider [FURIOUS]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [FURIOUS]"] = { -- CARGO
					prefix = "Gerente [FURIOUS]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [FURIOUS]"] = { -- CARGO
					prefix = "Recrutador [FURIOUS]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [FURIOUS]"] = { -- CARGO
					prefix = "Membro [FURIOUS]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [FURIOUS]"] = { -- CARGO
					prefix = "Aviaozinho [FURIOUS]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["MOTOCLUB"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "MOTOCLUB",
				itens = {
					['ferro'] = true,
					['aluminio'] = true,
					['m-malha'] = true,
					['molas'] = true,
					['plastico'] = true,
				}
			},
			baus = {'bauLiderMotoClub','bauMembroMotoClub'},
			groups = {
				["Lider [MOTOCLUB]"] = { -- CARGO
					prefix = "Lider [MOTOCLUB]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [MOTOCLUB]"] = { -- CARGO
					prefix = "Sub-Lider [MOTOCLUB]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [MOTOCLUB]"] = { -- CARGO
					prefix = "Gerente [MOTOCLUB]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [MOTOCLUB]"] = { -- CARGO
					prefix = "Recrutador [MOTOCLUB]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = false,
						bank = false,
						hire = false,
						demote = false,
						partner = false,
						metaslist= false,
						chest = true,
						linkimage = false,
					},
				},
	
				["Membro [MOTOCLUB]"] = { -- CARGO
					prefix = "Membro [MOTOCLUB]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = false,
						bank = false,
						hire = false,
						demote = false,
						partner = false,
						metaslist= false,
						chest = false,
						linkimage = false,
					},
				},
				
				["Aviaozinho [MOTOCLUB]"] = { -- CARGO
					prefix = "Aviaozinho [MOTOCLUB]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = false,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = false,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["B13"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "B13",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'B1301','B1302'},
	
			groups = {
				["Lider [B13]"] = { -- CARGO
					prefix = "Lider [B13]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [B13"] = { -- CARGO
					prefix = "Sub-Lider [B13]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [B13]"] = { -- CARGO
					prefix = "Gerente [B13]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [B13]"] = { -- CARGO
					prefix = "Recrutador [B13]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [B13]"] = { -- CARGO
					prefix = "Membro [B13]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [B13]"] = { -- CARGO
					prefix = "Aviaozinho [B13]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["LACOSTE"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "LACOSTE",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'LACOSTE01','LACOSTE02'},
	
			groups = {
				["Lider [LACOSTE]"] = { -- CARGO
					prefix = "Lider [LACOSTE]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [LACOSTE"] = { -- CARGO
					prefix = "Sub-Lider [LACOSTE]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [LACOSTE]"] = { -- CARGO
					prefix = "Gerente [LACOSTE]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [LACOSTE]"] = { -- CARGO
					prefix = "Recrutador [LACOSTE]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [LACOSTE]"] = { -- CARGO
					prefix = "Membro [LACOSTE]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [LACOSTE]"] = { -- CARGO
					prefix = "Aviaozinho [LACOSTE]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["HELLSANGELS"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "HELLSANGELS",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'HELLSANGELS01','HELLSANGELS02'},
	
			groups = {
				["Lider [HELLSANGELS]"] = { -- CARGO
					prefix = "Lider [HELLSANGELS]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [HELLSANGELS"] = { -- CARGO
					prefix = "Sub-Lider [HELLSANGELS]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [HELLSANGELS]"] = { -- CARGO
					prefix = "Gerente [HELLSANGELS]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [HELLSANGELS]"] = { -- CARGO
					prefix = "Recrutador [HELLSANGELS]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [HELLSANGELS]"] = { -- CARGO
					prefix = "Membro [HELLSANGELS]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [HELLSANGELS]"] = { -- CARGO
					prefix = "Aviaozinho [HELLSANGELS]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["BENNYS"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "BENNYS",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'',''},
	
			groups = {
				["Lider [BENNYS]"] = { -- CARGO
					prefix = "Lider [BENNYS]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [BENNYS"] = { -- CARGO
					prefix = "Sub-Lider [BENNYS]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [BENNYS]"] = { -- CARGO
					prefix = "Gerente [BENNYS]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [BENNYS]"] = { -- CARGO
					prefix = "Recrutador [BENNYS]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [BENNYS]"] = { -- CARGO
					prefix = "Membro [BENNYS]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [BENNYS]"] = { -- CARGO
					prefix = "Aviaozinho [BENNYS]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- LAVAGEM
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
             ["VANILLA"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "VANILLA",
					itens = {
						['c-fio'] = true,
						['pacote_tecido'] = true,
						['m-aco'] = true,
						['c-ferro'] = true,
						['l-alvejante'] = true,
					}
				},
				 baus = {'VANILLA01','VANILLA02'},
		
				groups = {
					["Lider [VANILLA]"] = { -- CARGO
						prefix = "Lider [VANILLA]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [VANILLA"] = { -- CARGO
						prefix = "Sub-Lider [VANILLA]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [VANILLA]"] = { -- CARGO
						prefix = "Gerente [VANILLA]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [VANILLA]"] = { -- CARGO
						prefix = "Recrutador [VANILLA]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [VANILLA]"] = { -- CARGO
						prefix = "Membro [VANILLA]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [VANILLA]"] = { -- CARGO
						prefix = "Aviaozinho [VANILLA]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["BAHAMAS"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "BAHAMAS",
					itens = {
						['pecadearma'] = true,
						['molas'] = true,
					}
				},
				 baus = {'BAHAMAS01','BAHAMAS02'},
		
				groups = {
					["Lider [BAHAMAS]"] = { -- CARGO
						prefix = "Lider [BAHAMAS]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [BAHAMAS"] = { -- CARGO
						prefix = "Sub-Lider [BAHAMAS]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [BAHAMAS]"] = { -- CARGO
						prefix = "Gerente [BAHAMAS]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [BAHAMAS]"] = { -- CARGO
						prefix = "Recrutador [BAHAMAS]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [BAHAMAS]"] = { -- CARGO
						prefix = "Membro [BAHAMAS]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [BAHAMAS]"] = { -- CARGO
						prefix = "Aviaozinho [BAHAMAS]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["BRATVA"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "BRATVA",
					itens = {
						['pecadearma'] = true,
						['molas'] = true,
						['metal'] = true,
						['gatilho'] = true,
					
					}
				},
				 baus = {'BRATVA01','BRATVA02'},
		
				groups = {
					["Lider [BRATVA]"] = { -- CARGO
						prefix = "Lider [BRATVA]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [BRATVA"] = { -- CARGO
						prefix = "Sub-Lider [BRATVA]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [BRATVA]"] = { -- CARGO
						prefix = "Gerente [BRATVA]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [BRATVA]"] = { -- CARGO
						prefix = "Recrutador [BRATVA]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [BRATVA]"] = { -- CARGO
						prefix = "Membro [BRATVA]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [BRATVA]"] = { -- CARGO
						prefix = "Aviaozinho [BRATVA]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["TEQUILA"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "TEQUILA",
					itens = {
						['pecadearma'] = true,
						['molas'] = true,
					}
				},
				 baus = {'TEQUILA01','TEQUILA02'},
		
				groups = {
					["Lider [TEQUILA]"] = { -- CARGO
						prefix = "Lider [TEQUILA]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [TEQUILA"] = { -- CARGO
						prefix = "Sub-Lider [TEQUILA]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [TEQUILA]"] = { -- CARGO
						prefix = "Gerente [TEQUILA]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [TEQUILA]"] = { -- CARGO
						prefix = "Recrutador [TEQUILA]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [TEQUILA]"] = { -- CARGO
						prefix = "Membro [TEQUILA]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [TEQUILA]"] = { -- CARGO
						prefix = "Aviaozinho [TEQUILA]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["ILUMINATIS"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "ILUMINATIS",
					itens = {
						['c-fio'] = true,
						['pacote_tecido'] = true,
						['m-aco'] = true,
						['c-ferro'] = true,
						['l-alvejante'] = true,
					}
				},
				 baus = {'ILUMINATIS01','ILUMINATIS02'},
		
				groups = {
					["Lider [ILUMINATIS]"] = { -- CARGO
						prefix = "Lider [ILUMINATIS]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [ILUMINATIS"] = { -- CARGO
						prefix = "Sub-Lider [ILUMINATIS]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [ILUMINATIS]"] = { -- CARGO
						prefix = "Gerente [ILUMINATIS]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [ILUMINATIS]"] = { -- CARGO
						prefix = "Recrutador [ILUMINATIS]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [ILUMINATIS]"] = { -- CARGO
						prefix = "Membro [ILUMINATIS]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [ILUMINATIS]"] = { -- CARGO
						prefix = "Aviaozinho [ILUMINATIS]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["LUXURY"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "LUXURY",
					itens = {
						['pecadearma'] = true,
						['molas'] = true,
					}
				},
				 baus = {'LUXURY01','LUXURY02'},
		
				groups = {
					["Lider [LUXURY]"] = { -- CARGO
						prefix = "Lider [LUXURY]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [LUXURY"] = { -- CARGO
						prefix = "Sub-Lider [LUXURY]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [LUXURY]"] = { -- CARGO
						prefix = "Gerente [LUXURY]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [LUXURY]"] = { -- CARGO
						prefix = "Recrutador [LUXURY]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [LUXURY]"] = { -- CARGO
						prefix = "Membro [LUXURY]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [LUXURY]"] = { -- CARGO
						prefix = "Aviaozinho [LUXURY]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["GALAXY"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "GALAXY",
					itens = {
						['pecadearma'] = true,
						['molas'] = true,
					}
				},
				 baus = {'',''},
		
				groups = {
					["Lider [GALAXY]"] = { -- CARGO
						prefix = "Lider [GALAXY]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [GALAXY"] = { -- CARGO
						prefix = "Sub-Lider [GALAXY]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [GALAXY]"] = { -- CARGO
						prefix = "Gerente [GALAXY]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Recrutador [GALAXY]"] = { -- CARGO
						prefix = "Recrutador [GALAXY]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Membro [GALAXY]"] = { -- CARGO
						prefix = "Membro [GALAXY]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Aviaozinho [GALAXY]"] = { -- CARGO
						prefix = "Aviaozinho [GALAXY]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
				},
			},
			["CASSINO"] = {
				config = {
					maxMembers = 200, -- Maximo de Jogadores
				},
		
				armazem = {
					name = "CASSINO",
					itens = {
						['c-fio'] = true,
						['pacote_tecido'] = true,
						['m-aco'] = true,
						['c-ferro'] = true,
						['l-alvejante'] = true,
					}
				},
				baus = {'BauLiderCassino','BauMembroCassino'},
		
				groups = {
					["Lider [CASSINO]"] = { -- CARGO
						prefix = "Lider [CASSINO]", -- PREFIX
						tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
		
					["Sub-Lider [CASSINO"] = { -- CARGO
						prefix = "Sub-Lider [CASSINO]", -- PREFIX
						tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = true,
							chestlist = true,
						},
					},
					
					["Gerente [CASSINO]"] = { -- CARGO
						prefix = "Gerente [CASSINO]", -- PREFIX
						tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = true,
							partner = true,
							metaslist= true,
							chest = true,
							linkimage = false,
							chestlist = true,
						},
					},
		
					["Recrutador [CASSINO]"] = { -- CARGO
						prefix = "Recrutador [CASSINO]", -- PREFIX
						tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = true,
							demote = false,
							partner = false,
							metaslist= true,
							chest = false,
							linkimage = false,
							chestlist = true,
						},
					},
		
					["Membro [CASSINO]"] = { -- CARGO
						prefix = "Membro [CASSINO]", -- PREFIX
						tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = false,
							linkimage = false,
							chestlist = true,
						},
					},
					
					["Aviaozinho [CASSINO]"] = { -- CARGO
						prefix = "Aviaozinho [CASSINO]", -- PREFIX
						tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
						access = {
							info = true,
							bank = true,
							hire = false,
							demote = false,
							partner = false,
							metaslist= true,
							chest = false,
							linkimage = false,
							chestlist = true,
						},
					},
					
				},
			},
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- DROGAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
         ["CANADA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "CANADA",
				itens = {
					['plastico'] = true,
					['polvora'] = true,
					['c-fio'] = true,
					['folhamaconha'] = true,
					['aluminio'] = true,
					['c-cobre'] = true,
					['ferro'] = true,
				}
			},
			baus = {'BauLiderCanada','BauCanadaMembro'},
			groups = {
				["Lider [CANADA]"] = { -- CARGO
					prefix = "Lider [CANADA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [CANADA"] = { -- CARGO
					prefix = "Sub-Lider [CANADA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [CANADA]"] = { -- CARGO
					prefix = "Gerente [CANADA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [CANADA]"] = { -- CARGO
					prefix = "Recrutador [CANADA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [CANADA]"] = { -- CARGO
					prefix = "Membro [CANADA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [CANADA]"] = { -- CARGO
					prefix = "Aviaozinho [CANADA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = false,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["BRASIL"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "BRASIL",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'BRASIL01','BRASIL02'},
	
			groups = {
				["Lider [BRASIL]"] = { -- CARGO
					prefix = "Lider [BRASIL]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [BRASIL"] = { -- CARGO
					prefix = "Sub-Lider [BRASIL]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [BRASIL]"] = { -- CARGO
					prefix = "Gerente [BRASIL]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [BRASIL]"] = { -- CARGO
					prefix = "Recrutador [BRASIL]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [BRASIL]"] = { -- CARGO
					prefix = "Membro [BRASIL]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [BRASIL]"] = { -- CARGO
					prefix = "Aviaozinho [BRASIL]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["NIGERIA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "NIGERIA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'NIGERIA01','NIGERIA02'},
	
			groups = {
				["Lider [NIGERIA]"] = { -- CARGO
					prefix = "Lider [NIGERIA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [NIGERIA"] = { -- CARGO
					prefix = "Sub-Lider [NIGERIA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [NIGERIA]"] = { -- CARGO
					prefix = "Gerente [NIGERIA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [NIGERIA]"] = { -- CARGO
					prefix = "Recrutador [NIGERIA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [NIGERIA]"] = { -- CARGO
					prefix = "Membro [NIGERIA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [NIGERIA]"] = { -- CARGO
					prefix = "Aviaozinho [NIGERIA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["COLOMBIA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "COLOMBIA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'COLOMBIA01','COLOMBIA02'},
	
			groups = {
				["Lider [COLOMBIA]"] = { -- CARGO
					prefix = "Lider [COLOMBIA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [COLOMBIA"] = { -- CARGO
					prefix = "Sub-Lider [COLOMBIA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [COLOMBIA]"] = { -- CARGO
					prefix = "Gerente [COLOMBIA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [COLOMBIA]"] = { -- CARGO
					prefix = "Recrutador [COLOMBIA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [COLOMBIA]"] = { -- CARGO
					prefix = "Membro [COLOMBIA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [COLOMBIA]"] = { -- CARGO
					prefix = "Aviaozinho [COLOMBIA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["ARGENTINA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "ARGENTINA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'BauLiderArgentina','BauMembroArgentina'},
	
			groups = {
				["Lider [ARGENTINA]"] = { -- CARGO
					prefix = "Lider [ARGENTINA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [ARGENTINA"] = { -- CARGO
					prefix = "Sub-Lider [ARGENTINA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [ARGENTINA]"] = { -- CARGO
					prefix = "Gerente [ARGENTINA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [ARGENTINA]"] = { -- CARGO
					prefix = "Recrutador [ARGENTINA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [ARGENTINA]"] = { -- CARGO
					prefix = "Membro [ARGENTINA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [ARGENTINA]"] = { -- CARGO
					prefix = "Aviaozinho [ARGENTINA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["PORTUGAL"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "PORTUGAL",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'PORTUGAL01','PORTUGAL02'},
	
			groups = {
				["Lider [PORTUGAL]"] = { -- CARGO
					prefix = "Lider [PORTUGAL]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [PORTUGAL"] = { -- CARGO
					prefix = "Sub-Lider [PORTUGAL]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [PORTUGAL]"] = { -- CARGO
					prefix = "Gerente [PORTUGAL]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [PORTUGAL]"] = { -- CARGO
					prefix = "Recrutador [PORTUGAL]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [PORTUGAL]"] = { -- CARGO
					prefix = "Membro [PORTUGAL]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [PORTUGAL]"] = { -- CARGO
					prefix = "Aviaozinho [PORTUGAL]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["CV"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "CV",
				itens = {
					['plastico'] = true,
					['polvora'] = true,
					['c-fio'] = true,
					['folhamaconha'] = true,
					['aluminio'] = true,
					['c-cobre'] = true,
					['ferro'] = true,
				}
			},
		    baus = {'BauLiderCV','BauMembroCV'},
	
			groups = {
				["Lider [CV]"] = { -- CARGO
					prefix = "Lider [CV]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [CV]"] = { -- CARGO
					prefix = "Sub-Lider [CV]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [v]"] = { -- CARGO
					prefix = "Gerente [CV]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [CV]"] = { -- CARGO
					prefix = "Recrutador [CV]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = false,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = false,
					},
				},
	
				["Membro [CV]"] = { -- CARGO
					prefix = "Membro [CV]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = false,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = false,
					},
				},
				
				["Aviaozinho [CV]"] = { -- CARGO
					prefix = "Aviaozinho [CV]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = false,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = false,
					},
				},
				
			},
		},
		["CAMORRA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "CAMORRA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'CAMORRA01','CAMORRA02'},
	
			groups = {
				["Lider [CAMORRA]"] = { -- CARGO
					prefix = "Lider [CAMORRA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [CAMORRA"] = { -- CARGO
					prefix = "Sub-Lider [CAMORRA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [CAMORRA]"] = { -- CARGO
					prefix = "Gerente [CAMORRA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [CAMORRA]"] = { -- CARGO
					prefix = "Recrutador [CAMORRA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [CAMORRA]"] = { -- CARGO
					prefix = "Membro [CAMORRA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [CAMORRA]"] = { -- CARGO
					prefix = "Aviaozinho [CAMORRA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["MEXICO"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "MEXICO",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'MEXICO01','MEXICO02'},
	
			groups = {
				["Lider [MEXICO]"] = { -- CARGO
					prefix = "Lider [MEXICO]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [MEXICO"] = { -- CARGO
					prefix = "Sub-Lider [MEXICO]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [MEXICO]"] = { -- CARGO
					prefix = "Gerente [MEXICO]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [MEXICO]"] = { -- CARGO
					prefix = "Recrutador [MEXICO]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [MEXICO]"] = { -- CARGO
					prefix = "Membro [MEXICO]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [MEXICO]"] = { -- CARGO
					prefix = "Aviaozinho [MEXICO]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["JAMAICA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "JAMAICA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'JAMAICA01','JAMAICA02'},
	
			groups = {
				["Lider [JAMAICA]"] = { -- CARGO
					prefix = "Lider [JAMAICA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [JAMAICA"] = { -- CARGO
					prefix = "Sub-Lider [JAMAICA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [JAMAICA]"] = { -- CARGO
					prefix = "Gerente [JAMAICA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [JAMAICA]"] = { -- CARGO
					prefix = "Recrutador [JAMAICA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [JAMAICA]"] = { -- CARGO
					prefix = "Membro [JAMAICA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [JAMAICA]"] = { -- CARGO
					prefix = "Aviaozinho [JAMAICA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
		["AUSTRALIA"] = {
			config = {
				maxMembers = 200, -- Maximo de Jogadores
			},
	
			armazem = {
				name = "AUSTRALIA",
				itens = {
					['pecadearma'] = true,
					['molas'] = true,
				}
			},
		    baus = {'BauLiderAustralia','BauMembroAustralia'},
	
			groups = {
				["Lider [AUSTRALIA]"] = { -- CARGO
					prefix = "Lider [AUSTRALIA]", -- PREFIX
					tier = 6, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Sub-Lider [AUSTRALIA"] = { -- CARGO
					prefix = "Sub-Lider [AUSTRALIA]", -- PREFIX
					tier = 5, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Gerente [AUSTRALIA]"] = { -- CARGO
					prefix = "Gerente [AUSTRALIA]", -- PREFIX
					tier = 4, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = true,
						partner = true,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Recrutador [AUSTRALIA]"] = { -- CARGO
					prefix = "Recrutador [AUSTRALIA]", -- PREFIX
					tier = 3, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = true,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
	
				["Membro [AUSTRALIA]"] = { -- CARGO
					prefix = "Membro [AUSTRALIA]", -- PREFIX
					tier = 2, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
				["Aviaozinho [AUSTRALIA]"] = { -- CARGO
					prefix = "Aviaozinho [AUSTRALIA]", -- PREFIX
					tier = 1, -- Nivel do Cargo ( Para ter uma Ordem )
					access = {
						info = true,
						bank = true,
						hire = false,
						demote = false,
						partner = false,
						metaslist= true,
						chest = true,
						linkimage = true,
						chestlist = true,
					},
				},
				
			},
		},
}