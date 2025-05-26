------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servico = false
local zonas = {}
local segundos = 0
local coletando = false
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- INICIAR EMPREGO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local caminhoneiro = {
	["Caminhoneiro"] = {
		iniciar = vec3(-349.59, -1569.6, 25.23),
		pegarcaminhao = vec3(-330.72, -1564.82, 25.24),
	}
}

Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		
		for k,v in pairs(caminhoneiro) do
			if not servico then
				local distance = #(playercoords - v.iniciar)
				if distance <= 3.0 then
					time = 5
					-- RequestStreamedTextureDict('energy_marker', true)
					-- while not HasStreamedTextureDictLoaded('energy_marker') do
					-- 	Citizen.Wait(0)
					-- end
					DrawMarker(2,v.iniciar[1],v.iniciar[2],v.iniciar[3], 0,0, 0,0, 0,0, 0.5, 0.4, 0.5, 255,69,0, 80, 1, 0, 0, 0)
					--DrawMarker(3,v.iniciar[1],v.iniciar[2],v.iniciar[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'',false)
				
					if IsControlJustReleased(1, 51) and segundos <= 0 and checkInService() then
						segundos = 10
						servico = true
						zonas = carregarZonas("Lixeiro", true)
						ExecuteCommand("roupas lixeiro", true)
					end
				end
			else
				local distance2 = #(playercoords - v.pegarcaminhao)
				if distance2 <= 2.0 then
					time = 5
					--RequestStreamedTextureDict('energy_marker', true)
					--while not HasStreamedTextureDictLoaded('energy_marker') do
				--		Citizen.Wait(0)
				--	end
					--DrawMarker(3,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3],0.0,0.0,0.0,0.0,90.0,0.0,0.8,0.8,0.8,255,255,255,255,false,true,2,false,"energy_marker",'garbage',false)
					DrawMarker(2,v.pegarcaminhao[1],v.pegarcaminhao[2],v.pegarcaminhao[3], 0,0, 0,0, 0,0, 0.5, 0.4, 0.5, 255,69,0, 80, 1, 0, 0, 0)
					if IsControlJustReleased(1, 51) and segundos <= 0 then
						segundos = 10
						criarVehicle(-338.37,-1562.67,24.95,57.78,"trash2", false)
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ZONAS DE LIXO
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
				if distance <= 15.0 and v.visivel then
					time = 5
					DrawMarker(21,v.coords[1],v.coords[2],v.coords[3],0,0,0,0,180.0,130.0,0.3,0.3,0.3,255,255,0,180 ,1,0,0,1)

					if distance <= 1.5 and not IsPedInAnyVehicle(PlayerPedId()) then
						if IsControlJustReleased(1, 51) and segundos <= 0 and not coletando then
							segundos = 3
							zonas[k] = { coords = zonas[k].coords, visivel = false }
							removeToBlip(k)
							animLixo(true)
						end
					end
					-- Verifica se todas as zonas foram coletadas
					local zonasAtivas = 0
					for k,v in pairs(zonas) do
						if v.visivel then
							zonasAtivas = zonasAtivas + 1
						end
					end
					if zonasAtivas == 0 or zonasAtivas <= 20 then
						todasColetadas = true
					end
				end
			end

			local veh = getVehicleRadius(10)
			if veh then
				local model = GetEntityModel(veh)
				local coordsVehicle = GetOffsetFromEntityInWorldCoords(veh, 0.0, -2.7, 0.0)

				if model == -1255698084 and segundos <= 0 then
					local distance = #(playercoords - coordsVehicle)
					if distance <= 5 then
						time = 5
						if IsControlJustReleased(1, 51) and not IsPedInAnyVehicle(PlayerPedId()) and segundos <= 0 and coletando then
							coletando = false
							segundos = 12
							SetVehicleDoorOpen(veh,5,0,0)
							vRP.playAnim(true,{{"mp_common","givetake1_a"}},true)
							Wait(1500)
							animLixo(false)
							payment("Lixeiro", 0, 'suamaeeminha')
							Wait(1000)
							SetVehicleDoorShut(veh,5,0)
						end
					end
				end
			end

			-- Reinicia as zonas se todas elas foram coletadas
			if todasColetadas == true then
				zonas = carregarZonas("Lixeiro", true)
			end
		end
		Citizen.Wait(time)
	end
end)



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ANIM PEGAR LIXO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local prop = 0

function animLixo(status)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
	if status then
		prop = CreateObject(600967813, x + 5.5, y + 5.5, z + 0.2, true, true, true)
		AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 0x6F06), 0.00, 0.0, -0.7, 0.0, 0.0, 0.0, true, true, false, true, 1, true )
		RequestAnimDict("missfbi4prepp1")
		while not HasAnimDictLoaded("missfbi4prepp1") do
			Wait(0)
		end
		TaskPlayAnim(GetPlayerPed(-1), "missfbi4prepp1", "_bag_walk_garbage_man", 8.0, -8, -1, 49, 0, 0, 0, 0)
		Wait(2000)
		coletando = true
	else
		vRP.DeletarObjeto()
		DetachEntity(prop, true, false)
		SetEntityCoords(prop, 0.0, 0.0, 0.0, false, false, false, true)
		coletando = false
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EM SERVIÇO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		if servico then
			time = 5
			drawTxt("~w~APERTE ~r~F7~w~ PARA FINALIZAR O EXPEDIENTE.\nCOLETE OS ~y~LIXOS~w~ PELA CIDADE.", 0.215,0.94)

			if IsControlJustPressed(0, 168) and not IsPedInAnyVehicle(PlayerPedId()) then
				servico = false
				coletando = false
				ExecuteCommand("roupas")
				sairServico()
				deletarVehicle()
				removeBlips()
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

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function getVehicleRadius(radius)
	local veh
	local vehs = getVehiclesRadius(radius)
	local min = radius+0.0001
	for _veh,dist in pairs(vehs) do
		if dist < min then
			min = dist
			veh = _veh
		end
	end
	return veh
end

function getVehiclesRadius(radius)
	local r = {}
	local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local vehs = {}
	local it,veh = FindFirstVehicle()
	if veh then
		table.insert(vehs,veh)
	end
	local ok
	repeat
		ok,veh = FindNextVehicle(it)
		if ok and veh then
			table.insert(vehs,veh)
		end
	until not ok
	EndFindVehicle(it)

	for _,veh in pairs(vehs) do
		local x,y,z = table.unpack(GetEntityCoords(veh,true))
		local distance = GetDistanceBetweenCoords(x,y,z,px,py,pz,true)
		if distance <= radius then
			r[veh] = distance
		end
	end
	return r
end

