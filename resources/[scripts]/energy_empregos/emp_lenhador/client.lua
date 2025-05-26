------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servico = false
local zonas = {}
local segundos = 0

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR EMPREGO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local lenhador = {
	["Lenhador"] = {
		iniciar = vec3(-841.0, 5401.7, 34.62),
		pegarcaminhao = vec3(-794.85, 5410.32, 34.16),
	}
}
local BlockPlayer = false 
Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)

		for k,v in pairs(lenhador) do
			if not servico then
				local distance = #(playercoords - v.iniciar)
				if distance <= 2.0 then
					time = 5
					DrawMarker(2,v.iniciar[1],v.iniciar[2],v.iniciar[3]-0.20, 0,0, 0,0, 0,0, 0.5, 0.4, 0.5, 255,69,0, 80, 1, 0, 0, 0)
					--RequestStreamedTextureDict('energy_marker', true)
					---while not HasStreamedTextureDictLoaded('energy_marker') do
					----	Citizen.Wait(0)
				---	end
					--DrawMarker(3,v.iniciar[1],v.iniciar[2],v.iniciar[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'lenhador',false)
					if IsControlJustReleased(1, 51) and segundos <= 0 and checkInService() then
						ExecuteCommand("roupas lenhador")
						segundos = 10
						servico = true
						zonas = carregarZonas("Lenhador", true)
					end
				end
			else
				local distance2 = #(playercoords - v.pegarcaminhao)
				if distance2 <= 2.0 then
					time = 5
					-- RequestStreamedTextureDict('energy_marker', true)
					-- while not HasStreamedTextureDictLoaded('energy_marker') do
					-- 	Citizen.Wait(0)
					-- end
					DrawMarker(2,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3], 0,0, 0,0, 0,0, 0.5, 0.4, 0.5, 255,69,0, 80, 1, 0, 0, 0)
				--	DrawMarker(3,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'garbage',false)

					if IsControlJustReleased(1, 51) and segundos <= 0 then
						segundos = 10

						criarVehicle(-806.59,5411.33,33.99,59.27,"ratloader", false)
						--criarVehicle(-788.79,5401.0,34.27,90.11,"ratloader", true)
					end
				end
			end
		end
		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ZONAS DE COLETAR MADEIRA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if servico then
			local ped = PlayerPedId()
			local playercoords = GetEntityCoords(ped)
			local todasColetadas = false

			for k,v in pairs(zonas) do
				local distance = #(playercoords - v.coords)
				if distance <= 30.0 and v.visivel then
					local _,weaponHash = GetCurrentPedWeapon(ped, true)
					time = 4
					if GetHashKey('weapon_hatchet') == weaponHash then
						DrawMarker(21,v.coords[1],v.coords[2],v.coords[3],0,0,0,0,180.0,130.0,0.3,0.3,0.3,255,255,0,180 ,1,0,0,1)
						if distance <= 2.5 then
							if IsControlJustReleased(1, 51) and segundos <= 0 and not IsPedInAnyVehicle(PlayerPedId()) then
								segundos = 30
								vRP._playAnim(false,{{"melee@hatchet@streamed_core","plyr_front_takedown_b"}},true)


								BlockPlayer = true 
								removeToBlip(k)
								zonas[k] = { coords = zonas[k].coords, visivel = false }
								TriggerEvent("progress", 30000, "Quebrando madeira")
								Wait(1 * 30000)
								BlockPlayer = false 
								FreezeEntityPosition(PlayerPedId(), false)
								vRP._stopAnim(true)
								vRP._DeletarObjeto(true)
								ClearPedTasks(PlayerPedId())
								payment("Lenhador", 4)
						
								vRP._stopAnim(false)
								vRP._DeletarObjeto()
							end
						end
						-- Verifica se todas as zonas foram coletadas
						local zonasAtivas = 0
						for k,v in pairs(zonas) do
							if v.visivel then
								zonasAtivas = zonasAtivas + 1
							end
						end
						if zonasAtivas == 1 or zonasAtivas <= 10 then
							todasColetadas = true
						end
					end
				end
			end
			-- Reinicia as zonas se todas elas foram coletadas
			if todasColetadas == true then
				zonas = carregarZonas("Lenhador", true)
			end
		end
		Citizen.Wait(time)
	end
end)
----------------------------------
----------------------------------
----------------------------------

CreateThread(function()
	while true do 
		local time = 1500
		if BlockPlayer then 
			time = 5
			FreezeEntityPosition(PlayerPedId(), true)
		end 
		Wait(time)
	end 
end)

function task()
	if exports['energy_task']:taskBar(2400,math.random(6,9)) then
		if exports['energy_task']:taskBar(1600,math.random(6,9)) then
			if exports['energy_task']:taskBar(1600,math.random(6,9)) then
				if exports['energy_task']:taskBar(1600,math.random(6,9)) then
					if exports['energy_task']:taskBar(800,math.random(6,9)) then
						TriggerEvent('closetask')
						return false
					end
				end
			end
		end
	end
	TriggerEvent('closetask')
	return true
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EM SERVIÇO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		if servico then
			time = 5
			drawTxt("~w~APERTE ~r~F7~w~ PARA w O EXPEDIENTE.\nCOLETE AS ~y~MADEIRAS~w~ PELOS PONTOS NO MAPA.", 0.215,0.94)

			if IsControlJustPressed(0, 168) and not IsPedInAnyVehicle(PlayerPedId()) then
				ExecuteCommand("roupas")
				servico = false
				sairServico()
				deletarVehicle()
				removeBlips()
				BlockPlayer = false 
			end
		end
		
		Citizen.Wait(time)
	end
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if segundos >= 0 then
			segundos = segundos - 1

			if segundos <= 0 then
				segundos = 0
			end
		end
		Citizen.Wait(time)
	end
end)