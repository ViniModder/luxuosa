RegisterNetEvent('randallfetish:sendRequest')
AddEventHandler('randallfetish:sendRequest', function(targetId, action)
	TriggerClientEvent('randallfetish:receiveRequest', targetId, source, action)
end)

RegisterNetEvent('randallfetish:cancelRequest')
AddEventHandler('randallfetish:cancelRequest', function(sourceId)
	TriggerClientEvent('randallfetish:requestDeclined', sourceId)
end)

RegisterNetEvent('randallfetish:acceptRequest')
AddEventHandler('randallfetish:acceptRequest', function(sourceId)
	local targetId = source
	TriggerClientEvent('randallfetish:requestAccepted', sourceId, targetId)
	TriggerClientEvent('randallfetish:requestAccepted', targetId, sourceId)
end)

RegisterNetEvent('randallfetish:syncStopAnim')
AddEventHandler('randallfetish:syncStopAnim', function(playerId, action)
	if playerId == nil or action == nil then return end
	TriggerClientEvent('randallfetish:stopAnim', playerId, action)
end)


