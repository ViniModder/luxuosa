CreateTunnel.SetClothes = function(action, index, custom)
    local source = source
    local user_id = vRP.getUserId(source)

    if action == "save" then 
        vRP.setUData(user_id, index.."saveClothes", json.encode(custom))
        TriggerClientEvent("Notify", source, "sucesso", "Roupas salvas.", 3000)
        return true
    end

    if action == "wear" then 
        local data = vRP.getUData(user_id, index.."saveClothes")
        local sdata = json.decode(data) or 0
        TriggerClientEvent("updateRoupas", source, sdata)
        return true
    end

    if action == "delete" then 
        vRP.setUData(user_id, index.."saveClothes", 0)
        TriggerClientEvent("CLOSE_NUI", source) 
        TriggerClientEvent("Notify", source, "sucesso", "Roupa deletada com sucesso!", 5000)
        return true
    end

    return false
end

CreateTunnel.CheckSlot = function(index)
    local source = source
    local user_id = vRP.getUserId(source)
    local data = vRP.getUData(user_id,index.."saveClothes")
    local sdata = json.decode(data)
    TriggerClientEvent("CLOSE_NUI",source)
    if sdata ~= nil and sdata ~= 0 then
        return true
    end
    return false
end

CreateTunnel.RequestClothes = function(index)
    local interactionsList = {}
    if Config.InteractionsMenu[index] and Config.InteractionsMenu[index].type == 'clothes' then
        interactionsList = Config.InteractionsMenu[index].body
    end

    return interactionsList
end

CreateTunnel.executeInteraction = function(actualTab, index)
    local source = source
    local user_id = vRP.getUserId(source)

    local tabela = Config.InteractionsMenu[actualTab].body

    local element = tabela[index]
   

    if element.execute and type(element.execute) == "function" then
        element.execute(source, user_id, index)
    end
end




