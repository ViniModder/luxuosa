local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("energy_empregos",src)
vSERVER = Tunnel.getInterface("energy_empregos")
vGARAGE = Tunnel.getInterface("nation_garages")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local zonas = {}
local blips = {}
local namedServico = nil
local veiculoS = 0
local veiculoS2 = 0

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR EM SERVICO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function checkInService()
	if namedServico == nil then
		return true
	else
		TriggerEvent("Notify","importante","Você precisa sair do serviço atual para iniciar outro.", 5000)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR ZONAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function carregarZonas(tipo,blip)
    if cfg.config[tipo] then
        zonas = cfg.config[tipo].rotas
		namedServico = tipo

		for k,v in pairs(zonas) do
			zonas[k] = { coords = v.coords, visivel = true }
		end

        if blip then
            for k,v in pairs(zonas) do
				if v.visivel then
					blips[k] = AddBlipForCoord(v.coords[1],v.coords[2],v.coords[3])
					SetBlipSprite(blips[k], 1)
					SetBlipAsShortRange(blips[k] ,true)
					SetBlipColour(blips[k] ,3)
					SetBlipScale(blips[k], 0.3)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString("Coleta")
					EndTextCommandSetBlipName(blips[k])
				end
            end
        end
		

        return zonas
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER BLIPS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function removeBlips()
	if #blips > 0 then
		local i = 0
		while i <= #blips do
			RemoveBlip(blips[i])
			i = i + 1
		end
	end
end

function removeToBlip(id)
	if blips[id] then
		RemoveBlip(blips[id])
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CRIAR VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function criarVehicle(x,y,z,h,veiculo, extra)
	local checkPos = GetClosestVehicle(x,y,z,3.001,0,71)
	if DoesEntityExist(checkPos) and checkPos ~= nil then
		TriggerEvent("Notify","importante","Todas as vagas estão ocupadas no momento.", 5)
		return false
	else
		if veiculo then
			local mhash = GetHashKey(veiculo)
			while not HasModelLoaded(mhash) do
				RequestModel(mhash)
				Citizen.Wait(10)
			end

			if HasModelLoaded(mhash) then
				local nveh = CreateVehicle(mhash,x,y,z,h,true,false)

				SetVehicleOnGroundProperly(nveh)
				SetVehicleNumberPlateText(nveh, vSERVER.checkPlate())
				SetEntityAsMissionEntity(nveh,true,true)
				SetModelAsNoLongerNeeded(mhash)

				if extra then
					veiculoS2 = nveh
				else
					veiculoS = nveh
				end
				
			end
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETAR VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function deletarVehicle()
	if veiculoS > 0 then
		TriggerServerEvent("trydeleteveh41657",VehToNet(veiculoS))
		vGARAGE.delVehicle(veiculoS)
		veiculoS = 0
	end
	
	if veiculoS2 > 0 then
		TriggerServerEvent("trydeleteveh41657",VehToNet(veiculoS2))
		vGARAGE.delVehicle(veiculoS2)
		veiculoS2 = 0
	end
	
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SAIR DE SERVICO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function sairServico()
	namedServico = nil
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.checkInServico()
	return namedServico
end

function payment(tipo,quantidade)
	return vSERVER.payment(tipo, quantidade)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTRAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,x,y)
	local res_x, res_y = GetActiveScreenResolution()

	SetTextFont(4)
	SetTextScale(0.3,0.3)
	SetTextColour(255,255,255,255)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)

	if res_x >= 2000 then
		DrawText(x+0.076,y)
	else
		DrawText(x,y)
	end
end

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/370
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end


local blipIniciar = {}

local blips = {
	[1] = {pos = vec3(-841.65,5401.1,34.62), label = 'Lenhador'},
	[2] = {pos = vec3(-350.07,-1569.89,25.23), label = 'Lixeiro'},--entra em cerbiços 
	[3] = {pos = vec3(2832.58,2799.74,57.48), label = 'Minerador'},
	[4] = {pos = vec3(450.57,-636.35,28.52), label = 'Motorista'},
},


CreateThread(function()
	for k, v in pairs(blips) do 
		blipIniciar[k] = AddBlipForCoord(v.pos)
		SetBlipSprite(blipIniciar[k] , 498)
		SetBlipAsShortRange(blipIniciar[k] ,true)
		SetBlipColour(blipIniciar[k] ,3)
		SetBlipScale(blipIniciar[k] , 0.7)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Emprego: '..v.label)
		EndTextCommandSetBlipName(blipIniciar[k] )
	end
end)