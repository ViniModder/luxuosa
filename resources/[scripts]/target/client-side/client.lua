-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vHOSPITAL = Tunnel.getInterface("emergency")
vGARAGES = Proxy.getInterface("garages")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Zones = {}
local Models = {}
local success = false
local innerEntity = {}
local dismantleList = {}
local setDistance = 10.0
local targetActive = false
local adminService = false
local policeService = false
local paramedicService = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:UPDATESERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("police:updateService")
AddEventHandler("police:updateService",function(status)
	policeService = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:UPDATESERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:updateService")
AddEventHandler("paramedic:updateService",function(status)
	paramedicService = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:TOGGLEADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:toggleAdmin")
AddEventHandler("target:toggleAdmin",function()
	if adminService then
		setDistance = 10.0
		adminService = false
		TriggerEvent("Notify","amarelo","Sistema desativado.",5000)
	else
		setDistance = 99.0
		adminService = true
		TriggerEvent("Notify","verde","Sistema ativado.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	RegisterCommand("+entityTarget",playerTargetEnable)
	RegisterCommand("-entityTarget",playerTargetDisable)
	RegisterKeyMapping("+entityTarget","Target","keyboard","LMENU")

	AddTargetModel({ 1631638868,2117668672,-1498379115,-1519439119,-289946279 },{
		options = {
			{
				event = "target:animDeitar",
				label = "Deitar",
				tunnel = "client"
			}
		},
		distance = 1.00
	})

	AddTargetModel({ -171943901,-109356459,1805980844,-99500382,1262298127,1737474779,2040839490,1037469683,867556671,-1521264200,-741944541,-591349326,-293380809,-628719744,-1317098115,1630899471,38932324,-523951410,725259233,764848282,2064599526,536071214,589738836,146905321,47332588,-1118419705,538002882,-377849416,96868307,-1195678770,-606800174 },{
		options = {
			{
				event = "target:animSentar",
				label = "Sentar",
				tunnel = "client"
			}
		},
		distance = 1.00
	})
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDICMENU
-----------------------------------------------------------------------------------------------------------------------------------------
local paramedicMenu = {
	{
		event = "paramedic:reanimar",
		label = "Reanimar",
		tunnel = "paramedic"
	},
	{
		event = "paramedic:tratamento",
		label = "Tratamento",
		tunnel = "paramedic"
	},
	{
		event = "paramedic:maca",
		label = "Deitar Paciente",
		tunnel = "paramedic"
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEVEH
-----------------------------------------------------------------------------------------------------------------------------------------
local policeVeh = {
	{
		event = "police:runPlate",
		label = "Verificar Placa",
		tunnel = "police"
	},
	{
		event = "police:runArrest",
		label = "Detenção do Veículo",
		tunnel = "police"
	},
	{
		event = "police:inputVehicle2",
		label = "RV",
		tunnel = "police"
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERVEH
-----------------------------------------------------------------------------------------------------------------------------------------
local playerVeh = {
	{
		event = "OpenPMalas",
		label = "Porta-Malas",
		tunnel = "client" 
	},

	{
		event = "ngs:OnTrunk",
		label = "Entrar e Sair",
		tunnel = "server" 
	},
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEPED
-----------------------------------------------------------------------------------------------------------------------------------------
local policePed = {
	{
		event = "police:runInspect",
		label = "Revistar",
		tunnel = "police"
	},
	{
		event = "police:inputVehicle",
		label = "Colocar no veiculo",
		tunnel = "police"
	},

	{
		event = "paramedic:reanimar",
		label = "Reanimar",
		tunnel = "paramedic"
	},

}

-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEPED
-----------------------------------------------------------------------------------------------------------------------------------------
local twoPed = {
	{
		event = "revistar",
		label = "Roubar",
		tunnel = "server"
	},
	{
		event = "vrp_policia:algemar",
		label = "Algemar/Desalgemar",
		tunnel = "server"
	},

	{
		event = "capuzEvent",
		label = "Encapuzar",
		tunnel = "server"
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMINMENU
-----------------------------------------------------------------------------------------------------------------------------------------
local adminMenu = {
	{
		event = "tryDeleteObject",
		label = "Deletar Objeto",
		tunnel = "admin"
	},
	{
		event = "garages:deleteVehicle",
		label = "Deletar Veículo",
		tunnel = "admin"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERTARGETENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function playerTargetEnable()
	if vRP.isHandcuffed() or success or IsPedArmed(PlayerPedId(),6) or IsPedInAnyVehicle(PlayerPedId()) then
		return
	end

	targetActive = true

	SendNUIMessage({ response = "openTarget" })

	while targetActive do
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

		if hit == 1 then
			innerEntity = {}

			if GetEntityType(entity) ~= 0 then
				if adminService then
					if DoesEntityExist(entity) then
						if #(coords - entCoords) <= setDistance then
							success = true

							NetworkRegisterEntityAsNetworked(entity)
							while not NetworkGetEntityIsNetworked(entity) do
								NetworkRegisterEntityAsNetworked(entity)
								Citizen.Wait(1)
							end

							local netObjects = NetworkGetNetworkIdFromEntity(entity)
							SetNetworkIdCanMigrate(netObjects,true)
							NetworkSetNetworkIdDynamic(netObjects,false)
							SetNetworkIdExistsOnAllMachines(netObjects,true)

							if IsEntityAVehicle(entity) then
								innerEntity = { netObjects,GetVehicleNumberPlateText(entity) }
							else
								innerEntity = { netObjects }
							end

							SendNUIMessage({ response = "validTarget", data = adminMenu })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > setDistance then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					end
				elseif IsEntityAVehicle(entity) then
					if #(coords - entCoords) <= 1.0 then
						success = true

						innerEntity = { GetVehicleNumberPlateText(entity) }

						if policeService then 
							SendNUIMessage({ response = "validTarget", data = policeVeh })
						else
							SendNUIMessage({ response = "validTarget", data = playerVeh })
						end

						while success and targetActive do
							local ped = PlayerPedId()
							local coords = GetEntityCoords(ped)
							local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

							DisablePlayerFiring(ped,true)

							if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
								SetCursorLocation(0.5,0.5)
								SetNuiFocus(true,true)
							end

							if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
								success = false
							end

							Citizen.Wait(1)
						end

						SendNUIMessage({ response = "leftTarget" })
					end
				elseif IsPedAPlayer(entity)  then
					if #(coords - entCoords) <= 1.0 then
						local index = NetworkGetPlayerIndexFromPed(entity)
						local source = GetPlayerServerId(index)

						success = true
						innerEntity = { source }
						if policeService then 
							SendNUIMessage({ response = "validTarget", data = policePed })
						else
							SendNUIMessage({ response = "validTarget", data = twoPed })
						end

						while success and targetActive do
							local ped = PlayerPedId()
							local coords = GetEntityCoords(ped)
							local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

							DisablePlayerFiring(ped,true)

							if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
								SetCursorLocation(0.5,0.5)
								SetNuiFocus(true,true)
							end

							if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
								success = false
							end

							Citizen.Wait(1)
						end

						SendNUIMessage({ response = "leftTarget" })
					end
				elseif IsPedAPlayer(entity) and paramedicService then
					if #(coords - entCoords) <= 1.0 then
						local index = NetworkGetPlayerIndexFromPed(entity)
						local source = GetPlayerServerId(index)

						success = true
						innerEntity = { source,entity }
						SendNUIMessage({ response = "validTarget", data = paramedicMenu })

						while success and targetActive do
							local ped = PlayerPedId()
							local coords = GetEntityCoords(ped)
							local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

							DisablePlayerFiring(ped,true)

							if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
								SetCursorLocation(0.5,0.5)
								SetNuiFocus(true,true)
							end

							if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
								success = false
							end

							Citizen.Wait(1)
						end

						SendNUIMessage({ response = "leftTarget" })
					end
				else
					for k,v in pairs(Models) do
						if DoesEntityExist(entity) then
							if k == GetEntityModel(entity) then
								if #(coords - entCoords) <= Models[k]["distance"] then

									if Models[k]["desmanche"] then
										local distance = #(coords - vector3(602.39,-437.2,24.75))
										if distance > 25 then
											goto scapeModel
										end
									end

									success = true

									NetworkRegisterEntityAsNetworked(entity)
									while not NetworkGetEntityIsNetworked(entity) do
										NetworkRegisterEntityAsNetworked(entity)
										Citizen.Wait(1)
									end

									while not NetworkHasControlOfEntity(entity) do
										NetworkRequestControlOfEntity(entity)
										Citizen.Wait(1)
									end

									local netObjects = NetworkGetNetworkIdFromEntity(entity)
									SetNetworkIdCanMigrate(netObjects,true)
									NetworkSetNetworkIdDynamic(netObjects,false)
									SetNetworkIdExistsOnAllMachines(netObjects,true)

									innerEntity = { entity,k,netObjects,GetEntityCoords(entity) }
									SendNUIMessage({ response = "validTarget", data = Models[k]["options"] })

									while success and targetActive do
										local ped = PlayerPedId()
										local coords = GetEntityCoords(ped)
										local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

										DisablePlayerFiring(ped,true)

										if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
											SetCursorLocation(0.5,0.5)
											SetNuiFocus(true,true)
										end

										if GetEntityType(entity) == 0 or #(coords - entCoords) > Models[k]["distance"] then
											success = false
										end

										Citizen.Wait(1)
									end

									SendNUIMessage({ response = "leftTarget" })
								end
							end
						end
					end

					::scapeModel::
				end
			end

			for k,v in pairs(Zones) do
				if Zones[k]:isPointInside(entCoords) then
					if #(coords - Zones[k]["center"]) <= v["targetoptions"]["distance"] then
						success = true

						SendNUIMessage({ response = "validTarget", data = Zones[k]["targetoptions"]["options"] })

						if v["targetoptions"]["shop"] ~= nil then
							innerEntity = { v["targetoptions"]["shop"] }
						end

						while success and targetActive do
							local ped = PlayerPedId()
							local coords = GetEntityCoords(ped)
							local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

							DisablePlayerFiring(ped,true)

							if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
								SetCursorLocation(0.5,0.5)
								SetNuiFocus(true,true)
							end

							if not Zones[k]:isPointInside(entCoords) or #(coords - Zones[k]["center"]) > v["targetoptions"]["distance"] then
								success = false
							end

							Citizen.Wait(1)
						end

						SendNUIMessage({ response = "leftTarget" })
					end
				end
			end
		end

		Citizen.Wait(250)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveTargetModel(models)
	for k,v in pairs(models) do
		if Models[v] then
			Models[v] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:SENTAR
-----------------------------------------------------------------------------------------------------------------------------------------
local chairs = {
	[-171943901] = 0.0,
	[-109356459] = 0.5,
	[1805980844] = 0.5,
	[-99500382] = 0.3,
	[1262298127] = 0.0,
	[1737474779] = 0.5,
	[2040839490] = 0.0,
	[1037469683] = 0.4,
	[867556671] = 0.4,
	[-1521264200] = 0.0,
	[-741944541] = 0.4,
	[-591349326] = 0.5,
	[-293380809] = 0.5,
	[-628719744] = 0.5,
	[-1317098115] = 0.5,
	[1630899471] = 0.5,
	[38932324] = 0.5,
	[-523951410] = 0.5,
	[725259233] = 0.5,
	[764848282] = 0.5,
	[2064599526] = 0.5,
	[536071214] = 0.5,
	[589738836] = 0.5,
	[146905321] = 0.5,
	[47332588] = 0.5,
	[-1118419705] = 0.5,
	[538002882] = -0.1,
	[-377849416] = 0.5,
	[96868307] = 0.5,
	[-1195678770] = 0.7,
	[-606800174] = 0.5
}

RegisterNetEvent("target:animSentar")
AddEventHandler("target:animSentar",function()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 then
		local objCoords = GetEntityCoords(innerEntity[1])

		FreezeEntityPosition(innerEntity[1],true)
		SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + chairs[innerEntity[2]],1,0,0,0)
		if chairs[innerEntity[2]] == 0.7 then
			SetEntityHeading(ped,GetEntityHeading(innerEntity[1]))
		else
			SetEntityHeading(ped,GetEntityHeading(innerEntity[1]) - 180.0)
		end

		vRP.playAnim(false,{ task = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERTARGETDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function playerTargetDisable()
	if success or not targetActive then
		return
	end

	targetActive = false
	SendNUIMessage({ response = "closeTarget" })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELECTTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("selectTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
	SendNUIMessage({ response = "closeTarget" })

	if data["tunnel"] == "client" then
		TriggerEvent(data["event"],innerEntity)
	elseif data["tunnel"] == "server" then
		TriggerServerEvent(data["event"],innerEntity)
	elseif data["tunnel"] == "shop" then
		TriggerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "paramedic" then
		TriggerServerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "police" then
		TriggerServerEvent(data["event"],innerEntity,data["service"])
	elseif data["tunnel"] == "objects" then
		TriggerServerEvent(data["event"],innerEntity[3])
	elseif data["tunnel"] == "admin" then
		TriggerServerEvent(data["event"],innerEntity[1],innerEntity[2])
	else
		TriggerServerEvent(data["event"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSETARGET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
	SendNUIMessage({ response = "closeTarget" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESETDEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:resetDebug")
AddEventHandler("target:resetDebug",function()
	success = false
	targetActive = false
	SetNuiFocus(false,false)
	SendNUIMessage({ response = "closeTarget" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATIONTODIRECTION
-----------------------------------------------------------------------------------------------------------------------------------------
function RotationToDirection(rotation)
	local adjustedRotation = {
		x = (math.pi / 180) * rotation["x"],
		y = (math.pi / 180) * rotation["y"],
		z = (math.pi / 180) * rotation["z"]
	}

	local direction = {
		x = -math.sin(adjustedRotation["z"]) * math.abs(math.cos(adjustedRotation["x"])),
		y = math.cos(adjustedRotation["z"]) * math.abs(math.cos(adjustedRotation["x"])),
		z = math.sin(adjustedRotation["x"])
	}

	return direction
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RAYCASTGAMEPLAYCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
function RayCastGamePlayCamera(distance)
	local cameraCoord = GetGameplayCamCoord()
	local cameraRotation = GetGameplayCamRot()
	local direction = RotationToDirection(cameraRotation)

	local destination = {
		x = cameraCoord["x"] + direction["x"] * distance,
		y = cameraCoord["y"] + direction["y"] * distance,
		z = cameraCoord["z"] + direction["z"] * distance
	}

	local a,b,c,d,e = GetShapeTestResult(StartShapeTestRay(cameraCoord["x"],cameraCoord["y"],cameraCoord["z"],destination["x"],destination["y"],destination["z"],-1,PlayerPedId(),0))

	return b,c,e
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddCircleZone(name,center,radius,options,targetoptions)
	Zones[name] = CircleZone:Create(center,radius,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBOXZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddBoxZone(name,center,length,width,options,targetoptions)
	Zones[name] = BoxZone:Create(center,length,width,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDPOLYZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddPolyzone(name,points,options,targetoptions)
	Zones[name] = PolyZone:Create(points,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function AddTargetModel(models,parameteres)
	for k,v in pairs(models) do
		Models[v] = parameteres
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddBoxZone",AddBoxZone)
exports("AddPolyzone",AddPolyzone)
exports("AddCircleZone",AddCircleZone)
exports("AddTargetModel",AddTargetModel)