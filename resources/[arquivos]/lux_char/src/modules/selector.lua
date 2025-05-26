
---
-- Spawn Selector
--- 
SelectorManager = {
	Characters = {

	},

	OldCoords = vec3(0,0,0)
}

function SelectorManager:Select(first_spawn,plyCoords)
    if not first_spawn then 
        DeleteCameras(self.camera)
		LocalPlayer.state:set("spawned",true,true)
        SetEntityVisible(PlayerPedId(),true)
		SetTimeout(5000, function()
			SetEntityVisible(PlayerPedId(),true)
			Remote._spawnCharacter()
			print('aq to aqui', plyCoords.x+0.0001, plyCoords.y+0.0001, plyCoords.z)
			SetEntityCoords(PlayerPedId(), plyCoords.x+0.0001, plyCoords.y+0.0001, plyCoords.z+0.03, 1,0,0,1)
		end)
    else 
        local camId = CreateSpawnCam()
        InterpolateCam(self.camera,camId)
    end

	if plyCoords.x then 
		self.OldCoords = plyCoords
	end

	SetTimeout(5000, function()
		local Reponse = Remote.GetPlayerInfos()

		SendNUIMessage({
			action = ((first_spawn) and 'OPEN_SPAWN' or 'CLOSE_UI'),
			data = {
				params = Config.SpawnPoints,
				playerData = {
					name = Reponse.name,
					id = Reponse.user_id,
					gametime = 0,
					bank = Reponse.bank,
					wallet = Reponse.wallet,
				}
			}
		})
		SetNuiFocus(first_spawn, first_spawn)
		SetEntityVisible(PlayerPedId(),true)

		
		DoScreenFadeIn(1000)
	end)
end


RegisterCommand('testing', function ()
	local Reponse = Remote.GetPlayerInfos()

	SendNUIMessage({
		action = 'OPEN_SPAWN',
		data = {
			params = Config.SpawnPoints,
			playerData = {
				name = Reponse.name,
				id = Reponse.id,
				gametime = 0,
				bank = Reponse.bank,
				wallet = Reponse.wallet,
			}
		}
	})

	SetNuiFocus(true, true)
	SetEntityVisible(PlayerPedId(),true)
	DoScreenFadeIn(1000)
end)