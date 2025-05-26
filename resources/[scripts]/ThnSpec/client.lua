-- spectate
local cdspectate = false
local spectate = false
local lastcoords = nil
local positionped = nil
local spectateped = nil

RegisterNetEvent('spectate:main')
AddEventHandler('spectate:main', function(coords, playerId)
	if not cdspectate then
		cdspectate = true
		if spectate then
			spectate = false
			Wait(300)
			RequestCollisionAtCoord(positionped)
			NetworkSetInSpectatorMode(false, spectateped)
			FreezeEntityPosition(PlayerPedId(), false)
			SetEntityCoords(PlayerPedId(), lastcoords)
			SetEntityVisible(PlayerPedId(), true)
			lastcoords = nil
			positionped = nil
			spectateped = nil
			cdspectate = false
		else
			spectate = true
			local foundplayer = false
			lastcoords = GetEntityCoords(PlayerPedId())
			SetEntityVisible(PlayerPedId(), false)
			SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z + 10.0)
			FreezeEntityPosition(PlayerPedId(), true)
			Wait(1500)
			SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z - 10.0)
			for _, i in ipairs(GetActivePlayers()) do
				if NetworkIsPlayerActive(i) and tonumber(GetPlayerServerId(i)) == tonumber(playerId) then
					foundplayer = true
					local ped = GetPlayerPed(i)
					positionped = GetEntityCoords(ped)
					spectateped = ped
					RequestCollisionAtCoord(positionped)
					NetworkSetInSpectatorMode(true, spectateped)
					cdspectate = false
					while spectate do
						Wait(100)
						local cped = GetEntityCoords(spectateped)
						if cped.x == 0 and cped.y == 0 and cped.z == 0 then
							spectate = false
							Wait(300)
							RequestCollisionAtCoord(positionped)
							NetworkSetInSpectatorMode(false, spectateped)
							FreezeEntityPosition(PlayerPedId(), false)
							SetEntityCoords(PlayerPedId(), lastcoords)
							SetEntityVisible(PlayerPedId(), true)
							lastcoords = nil
							positionped = nil
							spectateped = nil
							cdspectate = false
						else
							SetEntityCoords(PlayerPedId(), cped.x, cped.y, cped.z - 10.0)
						end
					end
					break
				end
			end
			if not foundplayer then
				FreezeEntityPosition(PlayerPedId(), false)
				SetEntityCoords(PlayerPedId(), lastcoords)
				SetEntityVisible(PlayerPedId(), true)
				lastcoords = nil
				spectate = false
				cdspectate = false
			end
		end
	end
end)