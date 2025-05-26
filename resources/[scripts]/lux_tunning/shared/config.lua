----======================================================================================----
----CONFIG DO SCRIPT
----======================================================================================----

Config = {
	Orders = {
		timeToFoundVehicle = 25000, -- 25 segundos para chegar perto do veículo.
		expireDays = 2,
	},
	Shops = {
        ["STOPCAR"] = { 
            perm = "lscustom.permissao",
            customerLocations = {
                vec3(2721.16,3488.14,55.69),---stopcar
				vec3(2713.88,3492.0,55.72),----
				vec3(2706.22,3495.05,55.72),---
				vec3(2743.88,3499.28,55.64),---
				vec3(2703.21,3467.78,64.72),--helicopro
				vec3(2723.13,3466.92,55.45),-----
				vec3(2715.86,3470.62,55.45),----
                vec3(2708.64,3473.66,55.45),--
                vec3(2700.74,3476.76,55.45),---
                vec3(2693.58,3480.37,55.45),---
                vec3(2685.8,3483.39,55.45)----

            },
        },
         ["RIDEOUT"] = { 
           	perm = "rideout.permissao",
            customerLocations = {
                 vec3(571.23,-147.45,54.17),---01
                 vec3(579.54,-147.0,54.17),--02
                 vec3(587.5,-146.87,54.17),--03
                 vec3(595.69,-146.94,54.17),--04
				 vec3(571.23,-147.45,54.17),---01
                 vec3(579.54,-147.0,54.17), ---02
                 vec3(587.5,-146.87,54.17), ---03
                 vec3(595.69,-146.94,54.17),---04
				 vec3(603.74,-147.17,54.53),---05
                 vec3(583.35,-178.68,54.42),---01--lado b
				 vec3(587.53,-179.02,54.76),---02--lado b
				 vec3(614.8,-213.19,55.27),---helicopro
                 vec3(583.35,-178.68,54.42)--o4--lado b
             },
         },
    },

	Permission = "perm.mecanica",

	Customs = {
		colorTypes = {
			["Cromado"] = {
				index = 5,
				price = 10000,
				colorsIndex = { 120 },
			},
			["Metálico"] = {
				index = 1,
				price = 10000,
				colorsIndex = {
					0,
					147,
					1,
					11,
					2,
					3,
					4,
					5,
					6,
					7,
					8,
					9,
					10,
					27,
					28,
					29,
					150,
					30,
					31,
					32,
					33,
					34,
					143,
					35,
					135,
					137,
					136,
					36,
					38,
					138,
					99,
					90,
					88,
					89,
					91,
					49,
					50,
					51,
					52,
					53,
					54,
					92,
					141,
					61,
					62,
					63,
					64,
					65,
					66,
					67,
					68,
					69,
					73,
					70,
					74,
					96,
					101,
					95,
					94,
					97,
					103,
					104,
					98,
					100,
					102,
					99,
					105,
					106,
					71,
					72,
					142,
					145,
					107,
					111,
					112,
				},
			},
			["Fosco"] = {
				index = 2,
				price = 10000,
				colorsIndex = { 12, 13, 14, 131, 83, 82, 84, 149, 148, 39, 40, 41, 42, 55, 128, 151, 155, 152, 153, 154 },
			},
			["Metal"] = {
				index = 4,
				price = 10000,
				colorsIndex = { 117, 118, 119, 158, 159 },
			},
		},
		["Tipo de Roda"] = {
			type = "wheel",
			--item = { "rodas", 1 },
			price = 10000,
			getter = function(vehicle)
				return GetVehicleWheelType(vehicle)
			end,
			setter = function(vehicle, value)
				SetVehicleWheelType(vehicle, value)
			end,
		},
		["Cores"] = {
			--item = {"latasdetinta",1},
			type = "color",
			price = 10000,
			getter = function(...)
				-- add smoke & neon colors
				local data = {}
				data.primaryColor = rgb_to_hex({ GetVehicleCustomPrimaryColour(...) })
				data.secondaryColor = rgb_to_hex({ GetVehicleCustomSecondaryColour(...) })
				data["Primária"] = data.primaryColor
				data["Secundária"] = data.secondaryColor
				data["Neon"] = rgb_to_hex({ GetVehicleNeonLightsColour(...) })
				data["Fumaça Pneu"] = rgb_to_hex({ GetVehicleTyreSmokeColor(...) })
				return data
			end,
			setter = function(colorType, veh, ...)
				if colorType == "Primária" then
					SetVehicleCustomPrimaryColour(veh,...)
				elseif colorType == "Secundária" then
					SetVehicleCustomSecondaryColour(veh,...)
				elseif colorType == "Neon" then
					SetVehicleNeonLightsColour(veh,...)
				elseif colorType == "Fumaça Pneu" then
					SetVehicleTyreSmokeColor(veh,...)
				end
			end,
		},
		["Pneu a Prova de Bala"] = {
			type = "toggle",
			--item = {"pneu",1},
			price = 300000,
			getter = function(...)
				return GetVehicleTyresCanBurst(...)
			end,
			setter = function(...)
				SetVehicleTyresCanBurst(..., not GetVehicleTyresCanBurst(...))
			end,
		},
		["Neon"] = {
			type = "toggle",
			price = 25000,
			getter = function(...)
				return IsVehicleNeonLightEnabled(..., 1)
			end,
			setter = function(...)
				local state = not IsVehicleNeonLightEnabled(..., 1)
				for i = 0, 3 do
					SetVehicleNeonLightEnabled(..., i, state)
				end
			end,
		},
		["Fumaça Pneu"] = {
			type = "toggle",
			mod = 20,
			price = 10000,
		},
		["Pintura"] = {
			type = "painting",
			price = 10000,
			--item = {"latasdetinta",1},
			setter = function(vehicle, colours)
				if colours == nil then 
					colours = {}
				end
				local p, s = table.unpack(colours)
				if p == -500 then 
					p = (GetVehicleColours(vehicle))
				elseif s == -500 then 
					_, cc = (GetVehicleColours(vehicle))
					s = cc
				end
				print(vehicle,p,s)
				print("p:",p,"s:",s)
				print(GetVehicleColours(vehicle))
				SetVehicleColours(vehicle, p,s)
			end,
			getter = function(...)
				local data 		= {}
				data["Primária"],data["Secundária"] = GetVehicleColours(...)
				return data
			end,
		},

		["Vidro"] = {
			type = 'vidro',
			mod = -1,
			price = 10000,
			increasedPrice = 0,
			--item = {"insufilm",1},
			counter = GetNumVehicleWindowTints,
			getter = function(...)
				return GetVehicleWindowTint(...)
			end,
			setter = function(...)
				SetVehicleWindowTint(...)
			end,
		},
		["Xenon"] = {
			type = "xenon",
			mod = 22,
			price =10000,
			counter = function() return 13 end,
			getter = function(vehicle)
				return IsToggleModOn(vehicle,22)
			end,
			setter = function(vehicle, color)
				if color == -1 then 
					ToggleVehicleMod(vehicle,22,false)
					return
				end
				ToggleVehicleMod(vehicle,22,true)
				SetVehicleHeadlightsColour(vehicle, color)
			end,
		},
		["Decal"] = {
			mod = 48,
			price = 10000,
			increasedPrice = 0,
		},
		["Janelas"] = {
			increasedPrice = 0,
			mod = 46,
			price = 10000,
		},
		["Tanque"] = {
			mod = 45,
			price = 10000,
			increasedPrice = 0,
		},
		["Trim"] = {
			mod = 44,
			price = 10000,
			increasedPrice = 0,
		},
		["Aerials"] = {
			mod = 43,
			price = 10000,
			increasedPrice = 0,
		},
		["Arch Cover"] = {
			mod = 42,
			price = 10000,
			increasedPrice = 0,
		},
		["Struts"] = {
			mod = 41,
			price = 10000,
			increasedPrice = 0,
		},
		["Filtro de Ar"] = {
			mod = 40,
			--item = {"filtrodear",1},
			price = 10000,
			increasedPrice = 0,
		},
		["Bloco de motor"] = {
			mod = 39,
			price = 10000,
			increasedPrice = 0,
			--item = {"motor",1}
		},
		["Hidraulica"] = {
			mod = 37,
			price = 10000,
			increasedPrice = 0,
			--item = {"hidraulica",1}
		},
		["Trunk"] = {
			mod = 37,
			price = 10000,
			increasedPrice = 0,
		},
		["Speakers"] = {
			mod = 36,
			price = 10000,
			increasedPrice = 0,
		},
		["Plaques"] = {
			mod = 35,
			price = 10000,
			increasedPrice = 0,
		},
		["Shift leavers"] = {
			mod = 34,
			price = 10000,
			increasedPrice = 0,
		},
		["Steeringwheel"] = {
			mod = 33,
			price = 10000,
			increasedPrice = 0,
		},
		["Bancos"] = {
			mod = 32,
			price = 10000,
			increasedPrice = 0,
		},
		["Portas"] = {
			mod = 31,
			price = 10000,
			increasedPrice = 0,
		},
		["Dial"] = {
			mod = 30,
			price = 10000,
			increasedPrice = 0,
		},
		["Painel"] = {
			mod = 29,
			price = 10000,
			increasedPrice = 0,
		},
		["Ornaments"] = {
			mod = 28,
			price = 10000,
			increasedPrice = 0,
		},
		["Trim"] = {
			mod = 27,
			price = 10000,
			increasedPrice = 0,
		},
		["Vanity plates"] = {
			mod = 26,
			price = 10000,
			increasedPrice = 0,
		},
		["Plate holder"] = {
			mod = 25,
			price = 10000,
			increasedPrice = 0,
		},
		["Rodas Traseira"] = {
			mod = 24,
			price = 80000,
			increasedPrice = 0,
		},
		["Rodas Dianteira"] = {
			mod = 23,
			price = 40000,
			increasedPrice = 0,
		},
		["Turbo"] = {
			mod = 18,
			type = "toggle",
			price = 50000,
			increasedPrice = 0,
			--time = 1*60*1000, ---- alterar apenas o "1" referente a 1 minuto, para 30 segundos colocar apenas 30*1000 e assim a diante em caso de segundos
			--item = {"radio",1},
		},
		["Blindagem"] = {
			mod = 16,
			price = 200000,
			--time = 1*60*1000, ---- alterar apenas o "1" referente a 1 minuto, para 30 segundos colocar apenas 30*1000 e assim a diante em caso de segundos
			increasedPrice = 200000,
			--item = {"celular",1},
		},
		["Suspensão"] = {
			mod = 15,
			price = 20000,
			increasedPrice = 20000,
			--item = {"suspensao",1},
		},
		["Buzina"] = {
			mod = 14,
			price = 20000,
			increasedPrice = 0,
		},
		["Transmissão"] = {
			mod = 13,
			price = 20000,
			increasedPrice = 20000,
			--item = {"transmissao",1},
		},
		["Freios"] = {
			mod = 12,
			price = 20000,
			increasedPrice = 20000,
			--item = {"freios",1},
		},
		["Motor"] = {
			mod = 11,
			price = 20000,
			increasedPrice = 20000,
			-- item = {"motor",1},
		},
		["Teto"] = {
			mod = 10,
			price = 20000,
			increasedPrice = 0,
			--item = {"motor",1},
		},
		["Para-lama"] = {
			mod = 8,
			price = 10000,
			increasedPrice = 0,
			--item = {"fender",1},
		},
		["Capô"] = {
			mod = 7,
			price = 10000,
			increasedPrice = 0,
			--item = {"capo",1},
		},
		["Grelha"] = {
			mod = 6,
			price = 10000,
			increasedPrice = 0,
			--item = {"grade",1},
		},

		["Roll cage"] = {
			mod = 5,
			price = 10000,
			increasedPrice = 0,
			--item = {"santoantonio",1},
		},
		["Escapamento"] = {
			mod = 4,
			price = 10000,
			increasedPrice = 0,
			--item = {"escapamento",1},
		},
		["Saias"] = {
			mod = 3,
			price = 10000,
			increasedPrice = 0,
			--item = {"saias",1},
		},
		["Parachoque Traseiro"] = {
			mod = 2,
			price = 10000,
			increasedPrice = 0,
			--item = {"parachoque",1},
		},
		["Parachoque Dianteiro"] = {
			mod = 1,
			price = 10000,
			increasedPrice = 0,
		--	item = {"parachoque",1},
		},
		["Aerofólio"] = {
			mod = 0,
			price = 10000,
			increasedPrice = 0,
			--item = {"aerofolio",1},
		},
	},
}