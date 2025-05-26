local short = false

RegisterKeyMapping("ShortcutClose","Fechar atalho","keyboard","u")
RegisterCommand("ShortcutClose",function()
    short = false
    SendNUIMessage({ "CLOSE_NUI", "shortcut" })

   -- exports.lux_hud:updateShortcurt()
end)

CreateThread(function()
    Wait(1000)
	while not LocalPlayer.state.spawned do
        Wait(1)
	end
    short = true
    SendNUIMessage({ "SHOW_NUI", "shortcut" })
end)

RegisterCommand('atalhos', function() 
    if not short then 
        SendNUIMessage({ "SHOW_NUI", "shortcut" })
        short = true
    else 
        SendNUIMessage({ "CLOSE_NUI", "shortcut" })
        short = false
    end
end)