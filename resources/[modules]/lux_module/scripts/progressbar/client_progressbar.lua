RegisterNetEvent("progress")
AddEventHandler("progress",function(time, message)
	SendNUIMessage({"UPDATE_NUI", "progressbar", { time = tonumber(time-500), message = message } })
end)