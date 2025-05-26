------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servico = false
local zonas = {}
local segundos = 0

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR EMPREGO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local minerador = {
	["Minerador"] = {
		iniciar = vec3(2831.75, 2799.51, 57.53),
		pegarcaminhao = vec3(2834.53, 2806.87, 57.32),
	}
}

local BlockPlayer = false 

Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)

		for k,v in pairs(minerador) do
			if not servico then
				local distance = #(playercoords - v.iniciar)
				if distance <= 3.0 then
					time = 5
					RequestStreamedTextureDict('energy_marker', true)
					while not HasStreamedTextureDictLoaded('energy_marker') do
						Citizen.Wait(0)
					end
					DrawMarker(3,v.iniciar[1],v.iniciar[2],v.iniciar[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'miner',false)
				
					if IsControlJustReleased(1, 51) and segundos <= 0 and checkInService() then
						ExecuteCommand("roupas lixeiro")
						segundos = 10
						servico = true
						zonas = carregarZonas("Minerador", true)
					end
				end
			else
				local distance2 = #(playercoords - v.pegarcaminhao)
				if distance2 <= 2.0 then
					time = 5
					RequestStreamedTextureDict('energy_marker', true)
					while not HasStreamedTextureDictLoaded('energy_marker') do
						Citizen.Wait(0)
					end
					DrawMarker(3,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'garbage',false)

					if IsControlJustReleased(1, 51) and segundos <= 0 then
						segundos = 10
						criarVehicle(2828.07,2802.49,57.55,146.81,"TipTruck", false)
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ZONAS DE MINERAR
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
					time = 5
					DrawMarker(21,v.coords[1],v.coords[2],v.coords[3],0,0,0,0,180.0,130.0,0.3,0.3,0.3,255,255,0,180 ,1,0,0,1)

					if distance <= 2.5 then
						if IsControlJustReleased(1, 51) and segundos <= 0 and not IsPedInAnyVehicle(PlayerPedId()) then
							segundos = 30
							vRP.CarregarObjeto("amb@world_human_const_drill@male@drill@base","base","prop_tool_jackham",15,28422)

							BlockPlayer = true 
							removeToBlip(k)
							zonas[k] = { coords = zonas[k].coords, visivel = false }
							TriggerEvent('Notify', 'importante', 'Espere 30 segundos pra receber o minerio') 
							TriggerEvent("progress", 30000, "Quebrando minério")
							Wait(1 * 30000)
							BlockPlayer = false 
							FreezeEntityPosition(PlayerPedId(), false)
							vRP._stopAnim(true)
							vRP._DeletarObjeto(true)
							ClearPedTasks(PlayerPedId())
							payment("Minerador", math.random(2,4))

			
							vRP._stopAnim(true)
							vRP._DeletarObjeto(true)
						end
					end
					-- Verifica se todas as zonas foram coletadas
					local zonasAtivas = 0
					for k,v in pairs(zonas) do
						if v.visivel then
							zonasAtivas = zonasAtivas + 1
						end
					end
					if zonasAtivas == 0 or zonasAtivas <= 10 then
						todasColetadas = true
					end
				end
			end
			-- Reinicia as zonas se todas elas foram coletadas
			if todasColetadas == true then
				zonas = carregarZonas("Minerador", true)
			end
		end
		Citizen.Wait(time)
	end
end)

----------------------------------


CreateThread(function()
	--FreezeEntityPosition(PlayerPedId(), false)
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
			drawTxt("~w~APERTE ~r~F7~w~ PARA FINALIZAR O EXPEDIENTE.\nCOLETE AS ~y~ROCHAS~w~ PELOS PONTOS NO MAPA.", 0.215,0.94)

			if IsControlJustPressed(0, 168) and not IsPedInAnyVehicle(PlayerPedId()) then
				servico = false
				sairServico()
				deletarVehicle()
				removeBlips()
				ExecuteCommand("roupas")
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