announces = {
    ['ilegal'] = {},
    ['legal'] = {}
}

open = {}

formatAnnounce = function(data)
    local table = {}
    for k,v in pairs(data) do
        if not v.deleted then
            table[#table+1] = v
        end
    end
    return table
end

RegisterTunnel.getInfos = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local org = ''
        local myAnnounces = {}
        for k,v in pairs(Config.Orgs) do
            if vRP.hasPermission(user_id, v.permission) then
                org = k
                open[user_id] = k
                if announces[v.type] then
                    for i = 1,#announces[v.type] do
                        if announces[v.type][i] and announces[v.type][i].org == org and not announces[v.type][i].deleted then
                            myAnnounces[#myAnnounces+1] = { desc = announces[v.type][i].desc, loc = announces[v.type][i].loc, id = announces[v.type][i].id }
                        end
                    end
                end
            end
        end
        return myAnnounces, org, (org ~= ''), formatAnnounce(announces['ilegal']), formatAnnounce(announces['legal'])
    end
end

RegisterTunnel.createAnnounce = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local identity = vRP.getUserIdentity(user_id)
        if not Config.Orgs[data.org] then return end
        local type = Config.Orgs[data.org].type
        if announces[type] then
            local table = announces[type]
            for k,v in pairs(table) do
                if v.org == data.org and not v.deleted then
                    TriggerClientEvent('Notify', source, 'negado',"Sua organização já possui um anuncio ativo, exclua o atual para poder criar um novamente.", 5000)
                    return false
                end
            end
            local cds = Config.Orgs[data.org].cds
            local request = vRP.request(source, 'Você deseja usar sua localização atual? ( caso não, será utilizado a localização da sua fac ou org )', 15)
            if request then
                local loc = GetEntityCoords(GetPlayerPed(source))
                cds = vec3(loc.x, loc.y, loc.z)
                TriggerClientEvent( "Notify", source, "sucesso", "Você enviou o anuncio do recrutamento com sucesso.", 5000 )
            end
            table[#table+1] = {
                id = #table+1,
                org = data.org,
                desc = data.description,
                author = identity.nome.." "..identity.sobrenome,
                cds = cds,
                loc = true,
                deleted = false
            }
            vTunnel.createNotify(-1, {org = data.org, timing = Config.Timing})
            return true
        end
    end
    return false
end

RegisterTunnel.deleteAnnounce = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if not open[user_id] then return false end
        if not Config.Orgs[open[user_id]] then return end
        local type = Config.Orgs[open[user_id]].type
        if announces[type] then
            if announces[type][data.announce.id] then
                announces[type][data.announce.id].deleted = true
                TriggerClientEvent( "Notify", source, "sucesso", "Você deletou o anuncio do recrutamento com sucesso.", 5000 )
                 -- print("enviou aqui")
            end
            return true
        end
    end
    return false
end

RegisterTunnel.updateLoc = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if not open[user_id] then return false end
        if not Config.Orgs[open[user_id]] then return end
        local type = Config.Orgs[open[user_id]].type
        if announces[type] then
            for k,v in pairs(announces[type]) do
                if v.org == open[user_id] and not v.deleted then
                    if announces[type][v.id] then
                        announces[type][v.id].loc = data.localization
                    end
                    return true
                end
            end

        end
    end
    return false
end




