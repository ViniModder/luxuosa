RegisterNetEvent("itensNotify")
AddEventHandler("itensNotify", function(mode, idname, quantidade, itemname )
	SendNUIMessage({ "UPDATE_NUI","notify",{ notifyType = "itemNotify", mode = mode, name = idname, amount = quantidade, item = itemname  } })
end)