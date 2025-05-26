local notify = true
local orgatual = ''


RegisterCommand('recrutamento', function()
    local myAnnounces, org, perm, ilegal, legal = vTunnel.getInfos()
    SetNuiFocus(true, true)
    SendNUIMessage({
        myAnnounces = myAnnounces,
        org = org,
        hasPerm = perm,
        legal = legal,
        ilegal = ilegal,
        show = true
    })
end)

-- RegisterCommand('recrutamento', function()
--     local myAnnounces, org, perm, ilegal, legal = vTunnel.getInfos()
--     SetNuiFocus(true, true)
--     SendNUIMessage({

--         hasPerm = false,
--         legal = legal,
--         ilegal = ilegal,
--         show = true
--     })
-- end)


RegisterCommand('fechar', function()
    notify = not notify
    SendNUIMessage({notify = notify, org = orgatual})
end)




RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({show = false})
end)

RegisterTunnel.createNotify = function(table)
    orgatual = table.org
    if notify then
        SendNUIMessage({
            org = table.org,
            timer = table.timing,
            notify = true
        })
    end
end

close = function()
    SetNuiFocus(false, false)
    SendNUIMessage({show = false})
end

RegisterNUICallback('createAnnounce', function(data, cb)
    cb(true)
    local createAnnounce = vTunnel.createAnnounce(data)
end)

RegisterNUICallback('updateLoc', function(data, cb)
    local loc = vTunnel.updateLoc(data)
    if loc then
        cb(true)
    end
end)

RegisterNUICallback('getLoc', function(data, cb)
    if data and data.announce and data.announce.cds then
        TriggerEvent('Notify', 'sucesso', 'Rota marcada em seu GPS!')
        SetNewWaypoint(data.announce.cds.x+0.0001,data.announce.cds.y+0.0001)
        close()
    end
end)

RegisterNUICallback('deleteAnnounce', function(data, cb)
    local deleteAnnounce = vTunnel.deleteAnnounce(data)
    if deleteAnnounce then
        close()
        cb(true)
    end
    cb(false)
end)


exports('getRecruitmentAlert', function()
    return statusAlert
end)

-- function .openAlert()
--     statusAlert = true
-- end