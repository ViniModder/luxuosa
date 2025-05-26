local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-- foxzin = {}
-- Tunnel.bindInterface("havan_craft_v2",foxzin)
vRPclient = Tunnel.getInterface("vRP")

craftingItem = {}

vRP.prepare('sjr/setItens', 'REPLACE INTO sjr_farmsystem(user_id, itens, day) VALUES(@user_id, @itens, @day)')
vRP.prepare('sjr/getItens', 'SELECT * from sjr_farmsystem WHERE user_id = @user_id')

src.checkPerm = function(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return vRP.hasPermission(user_id, perm)
    end
    return false
end

src.getStorage = function(data)
    if not Config.Storages[data.name] or not Config.Storages[data.name].itens then return {} end
    local storage = vRP.getSData('Storage:'..data.name)
    if storage then
        local itens = json.decode(storage) or {}
        local table = {}
        for k,v in pairs(Config.Storages[data.name].itens) do
            if itens[k] then
                table[#table+1] = {name = k, qtdStock = itens[k], img = Config.images..""..k..".png", qtdMax = v}
            else
                table[#table+1] = {name = k, qtdStock = 0, img = Config.images..""..k..".png", qtdMax = v}
            end
        end
        return table
    end
    return {}
end

src.storageItem = function(data, type, id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local query = vRP.query('sjr/getItens', { user_id = user_id })
        local info = Config.Tables[type]
        if not info or not info['locations'] or not info['locations'][id] or not info['locations'][id].requireStorage or not info['locations'][id].requireStorage.name then TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazem, abra e feche e tente novamente.", 5000) return true end
        local datatable = vRP.getSData('Storage:'..info['locations'][id].requireStorage.name)
        local storage = json.decode(datatable) or {}
        if storage[data.name] then
            local amount = vRP.getInventoryItemAmount(user_id,data.name)
            if amount > 0 and vRP.tryGetInventoryItem(user_id, data.name, amount, true) then
                storage[data.name] = parseInt(storage[data.name]) + amount
                vRP.setSData('Storage:'..info['locations'][id].requireStorage.name,json.encode(storage))
                local temp = os.date("*t", os.time())
                if #query > 0 then
                    local value = json.decode(query[1].itens)
                    if value[data.name] then
                        value[data.name] = value[data.name] + amount
                    else
                        value[data.name] = amount
                    end
                    vRP.execute('sjr/setItens', {user_id = user_id, itens = json.encode(value), day = temp.day})
                else
                    local value = {}
                    value[data.name] = amount
                    vRP.execute('sjr/setItens', {user_id = user_id, itens = json.encode(value), day = temp.day})
                end
                TriggerClientEvent('Notify', source, 'sucesso', "Item guardado com sucesso.", 5000)
            else
                TriggerClientEvent('Notify', source, 'negado', "Você não possui esse item para depositar.", 5000)
            end
        else
            storage[data.name] = 0
            local amount = vRP.getInventoryItemAmount(user_id,data.name)
            if amount > 0 and vRP.tryGetInventoryItem(user_id, data.name, amount, true) then
                storage[data.name] = amount
                vRP.setSData('Storage:'..info['locations'][id].requireStorage.name,json.encode(storage))
                local temp = os.date("*t", os.time())
                if #query > 0 then
                    local value = json.decode(query[1].itens)
                    if value[data.name] then
                        value[data.name] = value[data.name] + amount
                    else
                        value[data.name] = amount
                    end
                    vRP.execute('sjr/setItens', {user_id = user_id, itens = json.encode(value), day = temp.day})
                else
                    local value = {}
                    value[data.name] = amount
                    vRP.execute('sjr/setItens', {user_id = user_id, itens = json.encode(value), day = temp.day})
                end
                TriggerClientEvent('Notify', source, 'sucesso', "Item guardado com sucesso.", 5000)
            else
                TriggerClientEvent('Notify', source, 'negado', "Você não possui esse item para depositar.", 5000)
            end
        end
    end
    return true
end



src.startCrafting = function(data, qtd, type, id)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if user_id then
        local info = Config.Tables[type]
        
        if craftingItem[user_id] and craftingItem[user_id][data.name] then
            TriggerClientEvent('Notify', source, 'negado', "Você já está craftando esse item, aguarde finalizar para iniciar ele novamente.", 5000)
            return false
        end
        
        if not info or not info['locations'] or not info['locations'][id] or not info['locations'][id].craftPermission then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return false
        end
        
        if vRP.hasPermission(user_id, info['locations'][id].craftPermission) then
            local table = info['craft'][data.id]
            local checked = #table.requires
            local value = 0
            local datatable = vRP.getSData('Storage:'..info['locations'][id].requireStorage.name)
            local storage = json.decode(datatable) or {}
            
            for k,v in pairs(table.requires) do
                if storage[v.item] and storage[v.item] >= (v.amount*qtd) then
                    value = value + 1
                end
            end
            
            local removed = {}
            
            if checked == value then
                for k,v in pairs(table.requires) do
                    storage[v.item] = storage[v.item] - (v.amount * qtd)
                    removed[v.item] = (v.amount * qtd)
                end
                
                vRP.setSData('Storage:'..info['locations'][id].requireStorage.name, json.encode(storage))
                
                if not craftingItem[user_id] then
                    craftingItem[user_id] = {}
                end
                
                craftingItem[user_id][data.name] = { amount = data.qtd * qtd, type = type, id = id, itens = removed }
                
                -- Registra o log do item craftado
                vRP.sendLog("https://discord.com/api/webhooks/1300572708563845203/alP3NVjuOHHOGTjYouK1sWkv0P3t8cVlWd9zf7rNc-oYJFzOLccquwW0lO4PRlNA8a4b", "O ID "..user_id.." craftou o item: "..data.name.." na quantidade de "..(data.qtd * qtd))---ok
                
                return true
            else
                TriggerClientEvent('Notify', source, 'negado', "Não possui itens suficientes no armazém.", 5000)
            end
        else
            TriggerClientEvent('Notify', source, 'negado', "Você não possui permissão para craftar.", 5000)
        end
    end
end

src.producedItem = function(data, type)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if user_id then
        local info = Config.Tables[type]
        
        if craftingItem[user_id] and craftingItem[user_id][data.name] then
            vRP.giveInventoryItem(user_id, data.name, craftingItem[user_id][data.name].amount, true)
            
            -- Registra o log do item recebido como presente
            vRP.sendLog("https://discord.com/api/webhooks/1300571940230270997/Ca5bO4L4qZvEr_jkQQwGHRNPbxo4Cy0ZhQOzs6tZaFLzwB66zbuBSYbPQ3i5y26hyuaY", "O ID "..user_id.." recebeu o item: "..data.name.." como presente na quantidade de "..craftingItem[user_id][data.name].amount)--ook
            
            craftingItem[user_id][data.name] = nil
        else
            TriggerClientEvent('Notify', source, 'negado', "Você não está craftando esse item, então não é possível recebê-lo.", 5000)
            return false
        end
    end
end



src.storageItemAll = function(type, id)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if user_id then
        local query = vRP.query('sjr/getItens', { user_id = user_id })
        local info = Config.Tables[type]
        
        -- Verificações de configuração
        if not info or not info['locations'] or not info['locations'][id] or not info['locations'][id].requireStorage or not info['locations'][id].requireStorage.name then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return false
        end
        
        if not Config.Storages[info['locations'][id].requireStorage.name] or not Config.Storages[info['locations'][id].requireStorage.name].itens then
            TriggerClientEvent('Notify', source, 'negado', "Não foi encontrado o armazém, abra e feche e tente novamente.", 5000)
            return false
        end
        
        local datatable = vRP.getSData('Storage:'..info['locations'][id].requireStorage.name)
        local storage = json.decode(datatable) or {}
        local depositou = false
        local temp = os.date("*t", os.time())
        
        -- Processamento de itens
        for k, v in pairs(Config.Storages[info['locations'][id].requireStorage.name].itens) do
            local amount = vRP.getInventoryItemAmount(user_id, k)
            if amount > 0 and vRP.tryGetInventoryItem(user_id, k, amount, true) then
                if storage[k] then
                    storage[k] = parseInt(storage[k]) + amount
                else
                    storage[k] = amount
                end
                depositou = true
                
                -- Atualização dos itens no banco de dados
                if #query > 0 then
                    local value = json.decode(query[1].itens)
                    if value[k] then
                        value[k] = value[k] + amount
                    else
                        value[k] = amount
                    end
                    vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(value), day = temp.day })
                else
                    local value = {}
                    value[k] = amount
                    vRP.execute('sjr/setItens', { user_id = user_id, itens = json.encode(value), day = temp.day })
                end
                
                -- Registrar log para cada item depositado com sua quantidade
                local itemName = vRP.getItemName(k)
                vRP.sendLog("https://discord.com/api/webhooks/1300572989208793098/tSRmr2-ayOART0heIr7mTfOlk3xa_-ETlUTNtHR_nKs5q-cxGl1Q8WXn_aZXLdkCwngW", "O ID "..user_id.." depositou o item: "..itemName.." na quantidade de "..amount)--nao esta dando 
            end
        end
        
        -- Ações após o depósito
        if depositou then
            TriggerClientEvent('Notify', source, 'sucesso', "Itens guardados com sucesso.", 5000)
            vRP.setSData('Storage:'..info['locations'][id].requireStorage.name, json.encode(storage))
            return true
        end
    end
    
    return false
end



AddEventHandler('vRP:playerLeave', function(user_id, source)
    if user_id then
        if craftingItem[user_id] then
            for k,v in pairs(craftingItem[user_id]) do
                local info = Config.Tables[v.type]
                local datatable = vRP.getSData('Storage:'..info['locations'][v.id].requireStorage.name)
                local storage = json.decode(datatable)
                for item, amount in pairs(v.itens) do
                    storage[item] = storage[item] + amount
                end
                vRP.setSData('Storage:'..info['locations'][v.id].requireStorage.name,json.encode(storage))
                craftingItem[user_id][k] = nil
            end
        end
    end
end)


function alertPolice(data)
    local policia = vRP.getUsersByPermission("perm.disparo") 
    if #policia > 0 then
        for k,v in pairs(policia) do
            local nsource = vRP.getUserSource(parseInt(v))
            if nsource then
                TriggerClientEvent("NotifyPush", nsource, { x = data.x, y = data.y, z = data.z, blipID = data.blipID, blipColor = data.blipColor, blipScale = data.blipScale, time = data.time, code = data.code, title = data.title, name = data.name })
            end
        end
    end
end

src.giveItem = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local change = false
        for k,v in pairs(data.parts) do
            local random = math.random(v.qtdMin, v.qtdMax)
            local check = exports.mirtin_dominacao:GetUserDominationZone(user_id)
            if check and data.status then
                random = random*data.bonus
            end
            if vRP.computeInvWeight(user_id) + vRP.getItemWeight(v.name) * random <= vRP.getInventoryMaxWeight(user_id) then
                vRP.giveInventoryItem(user_id,v.name,random, true)
                change = true
            else
                TriggerClientEvent("Notify",source,"negado","Sua mochila esta cheia, você não pode pegar o item "..v.name..".", 3) 
            end
        end
        if data.callPolice then
            local chance = math.random(0,100)
            if chance <= data.percentualPolice then
                local cds = GetEntityCoords(GetPlayerPed(source))
                alertPolice({ x = cds.x, y = cds.y, z = cds.z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = 'Denúncia de coleta', name = "Uma pessoa avistou alguém coletando itens ilicitos nesse local."})
            end
        end
        return change
    end
end

src.sellItem = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local change = false
        for k,v in pairs(data.parts) do
            local random = math.random(v.qtdMin, v.qtdMax)
            if v.type == 'legal' then
                if vRP.tryGetInventoryItem(user_id, v.name, random, true) then
                    vRP.giveInventoryItem(user_id,'money',v.payment, true)
                    change = true
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possui a quantidade de "..random.." do item "..v.name.." para vender.", 3) 
                end
            else
                if vRP.tryGetInventoryItem(user_id, v.name, random, true) then
                    vRP.giveInventoryItem(user_id,Config.dirtymoney,v.payment, true)
                    change = true
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possui a quantidade de "..random.." do item "..v.name.." para vender.", 3) 
                end
            end
        end
        if data.callPolice then
            local chance = math.random(0,100)
            if chance <= data.percentualPolice then
                local cds = GetEntityCoords(GetPlayerPed(source))
                alertPolice({ x = cds.x, y = cds.y, z = cds.z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = 'Denúncia de coleta', name = "Uma pessoa avistou alguém coletando itens ilicitos nesse local."})
            end
        end
        return change
    end
end




















