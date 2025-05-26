
local user_id 

RegisterNetEvent("loginPly:init",function(userId)
    user_id = userId
    SetRichPresence('[ID: '..user_id.. '] '..GlobalState["playersOn"]..'/2048')
end)

AddStateBagChangeHandler('playersOn', 'global', function(_bagName, _key, _value) -- New handler
    while not user_id do
		SetRichPresence('Se conectando! ('.._value..'/2048)')
		Citizen.Wait(10000)
	end
    SetRichPresence('[ID: '..user_id.. '] '.._value..'/2048')
end)

CreateThread(function()
   SetDiscordAppId(1294231051924668520) ----- descomentar

    -- Here you will have to put the image name for the "large" icon.
    SetDiscordRichPresenceAsset('insmind-2')
    
    -- (11-11-2018) New Natives:

    -- Here you can add hover text for the "large" icon.
    SetDiscordRichPresenceAssetText('discord.gg/cMedUkA3h3')
   
    -- Here you will have to put the image name for the "small" icon.
    SetDiscordRichPresenceAssetSmall('logo')

    -- Here you can add hover text for the "small" icon.
    SetDiscordRichPresenceAssetSmallText('discord.gg/bgttqfdAgH')

    SetDiscordRichPresenceAction(0, "Discord", "https://discord.gg/cMedUkA3h3")
    SetDiscordRichPresenceAction(1, "Conectar!", "fivem://connect/9m6e5a")

    -- SetRichPresence('Se conectando! ('..GlobalState["playersOn"]..'/2048)')
    
end)