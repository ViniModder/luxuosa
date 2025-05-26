local UsersList = {}

function UpdateVoip(source, talking, plyInfo)
    if talking then
        UsersList[tostring(source)] = plyInfo
    else
        UsersList[tostring(source)] = nil
    end
    
    SendNUIMessage({ "UPDATE_NUI", "talking", UsersList })
end


exports('infoVoip', function(...)
	UpdateVoip(...)
end)

