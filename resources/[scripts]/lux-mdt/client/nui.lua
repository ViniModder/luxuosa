mdt = {}
local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
Tunnel.bindInterface(GetCurrentResourceName(), mdt)
vSERVER = Tunnel.getInterface(GetCurrentResourceName())
visible = false

RegisterCommand("qth",function(source,args)
	vSERVER.pressCode({code = 'QTH'})
end)

RegisterKeyMapping("qth","Alerta policia","keyboard","f2")

routes = {
    ['close'] = function(data)
        vSERVER.refreshMode()
        return mdt.visibility()
    end,
    ['pressCode'] = function(data)
        vSERVER.pressCode(data)
        return print(json.encode(data))
    end,
    ['consult'] = function(data)
        return vSERVER.consult({action = data.type, data = data})
    end,
    ['requestAccept'] = function(data)
        return vSERVER.handleRequest(data, 'accept')
    end,
    ['requestRefuse'] = function(data)
        return vSERVER.handleRequest(data, 'refuse')
    end,
    ['report'] = function(data)
        return vSERVER.multar(data)
    end,
    ['applyPunish'] = function(data)
        return vSERVER.prender(data)
    end,
    ['nameRegistered'] = function(data)
        local uData = vSERVER.getUserData(data.value)
        if (not uData) then
            return SendNUIMessage({action = 'updateInviteName',name = 'Player inexistente'})
        end
        return SendNUIMessage({action = 'updateInviteName',name = uData})
    end,
    ['confirmExonerate'] = function(data)
        return vSERVER.exonerar(data)
    end,
    ['confirmInvite'] = function(data)
        return vSERVER.invite(data)
    end,
    ['demote'] = function(data)
        return vSERVER.leaveOrg()
    end,
}

registerRoutes = function()
    for k, v in pairs(routes) do
        RegisterNUICallback(k, function(data, cb)
            local res = v(data)
            if cb then
                cb(res)
            end
        end)
    end
end
mdt.visibility = function()
    visible = not visible
    if (visible) then
        local payload = vSERVER.requestOpen()
        TransitionToBlurred(0)
        SetNuiFocus(visible, visible)
        SendNUIMessage(payload)
    else
        TransitionFromBlurred(0)
        SetNuiFocus(visible, visible)
        SendNUIMessage({action = 'close'})
    end
end

CreateThread(registerRoutes)