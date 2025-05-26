------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servico = false
local zonas = {}
local segundos = 0
local blips = {}
local selecionado = 0
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR EMPREGO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local motorista = {
	["Motorista"] = {
		iniciar = vec3(449.97,-656.71,28.43),
		pegarcaminhao = vec3(451.89,-633.12,28.53)
	}
}

Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)

		for k,v in pairs(motorista) do
			if not servico then
				local distance = #(playercoords - v.iniciar)
				if distance <= 3.0 then
					time = 5
					-- RequestStreamedTextureDict('energy_marker', true)
					-- while not HasStreamedTextureDictLoaded('energy_marker') do
					-- 	Citizen.Wait(0)
					-- end
					
					-- DrawMarker(3,v.iniciar[1],v.iniciar[2],v.iniciar[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'busdrive',false)
					DrawMarker(2,v.iniciar[1],v.iniciar[2],v.iniciar[3], 0,0, 0,0, 0,0, 0.5, 0.4, 0.5, 255,69,0, 80, 1, 0, 0, 0)
					if IsControlJustReleased(1, 51) and segundos <= 0 and checkInService() then
						ExecuteCommand("roupas taxista")
						segundos = 5
						servico = true
						zonas = carregarZonas("Motorista", false)
						selecionado = 1
						CriandoBlipMotorista(selecionado)
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
					-- DrawMarker(3,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'garbage',false)
					DrawMarker(2,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3], 0,0, 0,0, 0,0, 0.5, 0.4, 0.5, 255,69,0, 80, 1, 0, 0, 0)
					if IsControlJustReleased(1, 51) and segundos <= 0 then
						segundos = 5
						criarVehicle(459.03,-632.9,28.5,214.15,"bus", false)
					end
				end

			end
		end

		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ZONAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)

		if servico and segundos <= 0 then
			local distance = #(playercoords - zonas[selecionado].coords)
			if distance <= 30.0 then
				time = 5
				DrawMarker(21,zonas[selecionado].coords[1],zonas[selecionado].coords[2],zonas[selecionado].coords[3],0,0,0,0,180.0,130.0,1.0,1.0,0.5, 255,69,0,180 ,1,0,0,1)

				if distance <= 5.0 then
					if IsControlJustReleased(1, 51) and segundos <= 0 and IsPedInAnyVehicle(PlayerPedId()) then
						segundos = 15

						local vehicle = GetPlayersLastVehicle()
						if GetPedInVehicleSeat(vehicle, -1) then
							if IsVehicleModel(vehicle,GetHashKey("bus")) then
								TriggerEvent("progress", 10)
								-- SetVehicleUndriveable(vehicle, true)
								backentrega = selecionado
								SetTimeout(1*1000, function()
									RemoveBlip(blips)
									SetVehicleUndriveable(vehicle, false)
									payment("Motorista", 0, selecionado)
									if selecionado == #zonas then
										selecionado = 1
									else
										selecionado = selecionado + 1
									end
									
									CriandoBlipMotorista(selecionado)
								end)
							else
								TriggerEvent("Notify","importante","Você não pode fazer entrega utilizando outro veiculo", 5000)
							end
						end
						
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EM SERVIÇO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		
		if servico then
			time = 5
			drawTxt("~w~APERTE ~r~F7~w~ SE PARA FINALIZAR O EXPEDIENTE.\nENTREGUE OS ~y~PASSAGEIROS~w~ PELA CIDADE.", 0.215,0.94)

			if IsControlJustPressed(0, 168) and not IsPedInAnyVehicle(PlayerPedId()) then
				ExecuteCommand("roupas")
				servico = false
				sairServico()
				deletarVehicle()
				RemoveBlip(blips)
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

function CriandoBlipMotorista(selecionado)
	blips = AddBlipForCoord(zonas[selecionado].coords[1],zonas[selecionado].coords[2],zonas[selecionado].coords[3])
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Motorista")
	EndTextCommandSetBlipName(blips)
end