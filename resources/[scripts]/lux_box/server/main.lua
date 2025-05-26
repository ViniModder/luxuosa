Timing = {}
Coins = {}
PlayedTime = {}

vRP.prepare('sjr/getAllBoxByHours', 'SELECT * from sjr_box ORDER by played DESC')

vRP.prepare('sjr/getAllBoxByVip', 'SELECT * from sjr_box ORDER by vip DESC')

vRP.prepare('sjr/getAllBoxByCoin', 'SELECT * from sjr_box ORDER by coin DESC')

vRP.prepare('sjr/getBoxUser', 'SELECT * from sjr_box WHERE user_id = @user_id')

vRP.prepare('sjr/updateBox', 'REPLACE INTO sjr_box(user_id,coin,vip,played) VALUES(@user_id,@coin,@vip,@played)')

CreateTunnel.requestCoins = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return {coin = Coins[user_id]['free'], vipcoin = Coins[user_id]['vip']}
    end
end

CreateThread(function()
    local query = vRP.query('sjr/getAllBoxByCoin')
    if #query > 0 then
        for i = 1, #query do
            if vRP.getUserSource(query[i].user_id) then
                PlayedTime[query[i].user_id] = query[i].played
                Coins[query[i].user_id] = {
                    vip = query[i].vip,
                    free = query[i].coin
                }
                Timing[query[i].user_id] = {
                    timingVip = 0,
                    timingFree = 0
                }
            end
        end
    end
end)

CreateThread(function()
    while true do
        for k,v in pairs(Timing) do
            Timing[k]['timingVip'] = Timing[k]['timingVip'] + 1
            Timing[k]['timingFree'] = Timing[k]['timingFree'] + 1
            if Timing[k]['timingVip'] >= Config.timingVip then
                for group,_ in pairs(Config.vipsGroups) do
                    if vRP.hasGroup(parseInt(k),group) then
                        Coins[k]['vip'] = Coins[k]['vip']+Config.payVip
                    end
                end
                Timing[k]['timingVip'] = 0
            end
            if Timing[k]['timingFree'] >= Config.timingFree then
                Coins[k]['free'] = Coins[k]['free']+Config.payFree
                Timing[k]['timingFree'] = 0
            end
            PlayedTime[k] = PlayedTime[k]+60
        end
        Wait(60000)
    end
end)

getItemInfo = function(name)
    local info = {}
    for i = 1, #Config.store do
        if Config.store[i].spawn == name then
            info = Config.store[i]
        end
    end
    return info
end

CreateTunnel.paymentStore = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local valuetotal = 0
        for k,v in pairs(data.cart) do
            local infos = getItemInfo(v.index)
            valuetotal = valuetotal + (infos.price*v.amount)
        end

        if valuetotal > 0 then
            if Coins[user_id]['vip'] >= valuetotal then
                Coins[user_id]['vip'] = Coins[user_id]['vip']-valuetotal
                for l,w in pairs(data.cart) do
                    local infos = getItemInfo(w.index)
                    if infos.type == "ITEM" then
                        vRP.giveInventoryItem(user_id, infos.spawn, infos.amount*w.amount, true)
                    elseif infos.type == "VEHICLE" then
                        local query = vRP.query("bm_dealership/dealership/getVehicle", { user_id = user_id, vehicle = infos.spawn })
                        if #query > 0 then
                            Coins[user_id]['vip'] = Coins[user_id]['vip'] + (infos.price*w.amount)
                            TriggerClientEvent("Notify", source, 'negado', "Você já possui esse veiculo do carrinho, por isso a compra dele não foi concluida.", 5000)
                        else
                            vRP.execute("bm_dealership/dealership/addUserVehicle", { user_id = user_id, vehicle = infos.spawn, ipva = os.time() })
                        end
                    elseif infos.type == "OTHERS" then
                        infos.func(source, user_id, infos.amount*w.amount)
                    end
                end
                TriggerClientEvent("Notify", source, 'sucesso', "Você adquiriu os itens com sucesso.", 5000)
                return true
            else
                TriggerClientEvent("Notify", source, 'negado', "Você não tem Vipcoin suficiente para isso.", 5000)
                return false
            end
        end
    end
end

CreateTunnel.requestHomeInfo = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local status = 0
        for k,v in pairs(Config.vipsGroups) do
            if vRP.hasGroup(user_id,k) then
                status = 1
            end
        end
        return { paydayVip = {amount = Config.payVip, status = status, timing = (Config.timingVip-Timing[user_id]['timingVip'])} , payday = (Config.timingFree-Timing[user_id]['timingFree']) }
    end
end


CreateTunnel.requestStore = function()
    local store = {}
    for k,v in pairs(Config.store) do
        store[#store+1] = { price = v.price, type = v.type, spawn = v.spawn, amount = v.amount, name = v.name, index = v.spawn, color = Config.rarityColors[v.rarity] }
    end
    return {bestSellers = {}, store = store}
end

CreateTunnel.openCrate = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local crateInfos = Config.crate[data.indexCrate]
        if crateInfos and Coins[user_id]['free'] >= crateInfos.coins then
            Coins[user_id]['free'] = Coins[user_id]['free'] - crateInfos.coins
            local value = math.random(1,100)
            local itemtype = 'COMUM'
            if value <= Config.percentualRarity['LEGENDARY'] then
                itemtype = 'LEGENDARY'
            elseif value <= Config.percentualRarity['EPIC'] then
                itemtype = 'EPIC'
            elseif value <= Config.percentualRarity['SPECIAL'] then
                itemtype = 'SPECIAL'
            elseif value >= Config.percentualRarity['COMUM'] then
                itemtype = 'COMUM'
            end
            local itens = {}
            for i = 1, #crateInfos.itens do
                if crateInfos.itens[i].rarity == itemtype then
                    itens[#itens+1] = crateInfos.itens[i]
                end
            end
            if #itens == 0 then
                local newrandom = math.random(1,#crateInfos.itens)
                itens[#itens+1] = crateInfos.itens[newrandom]
            end
            local randomitem = math.random(1,#itens)
            if itens[randomitem] and itens[randomitem].spawn then
                if itens[randomitem].type == "OTHERS" then
                    itens[randomitem].func(source, user_id, itens[randomitem].amount)
                elseif itens[randomitem].type == "ITEM" then
                    vRP.giveInventoryItem(user_id,itens[randomitem].spawn, itens[randomitem].amount, false)
                elseif itens[randomitem].type == "VEHICLE" then
                    local query = vRP.query("bm_dealership/dealership/getVehicle", { user_id = user_id, vehicle = itens[randomitem].spawn })
                    if #query > 0 then
                        TriggerClientEvent("Notify",source,"negado","Você já possui esse veiculo, o prêmio foi anulado e devolvido as coins.", 5000)
                        Coins[user_id]['free'] = Coins[user_id]['free'] + crateInfos.coins
                        return
                    end

                    vRP.execute("bm_dealership/dealership/addUserVehicle", { user_id = user_id, vehicle = itens[randomitem].spawn, ipva = os.time() })
                end
                return {name = itens[randomitem].name, amount = itens[randomitem].amount, type = itens[randomitem].type, spawn = itens[randomitem].spawn}
            end
        else
            TriggerClientEvent('Notify', source, "negado", "Você não possui coins suficientes para isso.", 5000)
        end

    end
    --return {name = "teste", amount = 50, type = 'ITEM', spawn = 'celular'}
end

-- RegisterCommand('addintable', function(source,args)
--     local user_id = vRP.getUserId(source)
--     Timing[user_id] = {
--         timingFree = 0,
--         timingVip = 0
--     }
--     PlayedTime[user_id] = 0
--     Coins[user_id] = {
--         vip = 1000,
--         free = 0,
--     }
-- end)

AddEventHandler('vRP:playerLeave', function(user_id, source)
    if user_id and PlayedTime[user_id] then
        vRP.query('sjr/updateBox', { user_id = user_id, coin = Coins[user_id]['free'], vip = Coins[user_id]['vip'], played = PlayedTime[user_id] })
        Timing[user_id] = nil
        PlayedTime[user_id] = nil
        Coins[user_id] = nil
    end
end)

AddEventHandler('vRP:playerJoin', function(user_id, source)
    if user_id then
        local query = vRP.query('sjr/getBoxUser', { user_id = user_id })
        if #query > 0 then
            PlayedTime[user_id] = query[1].played
            Coins[user_id] = {
                vip = query[1].vip,
                free = query[1].coin,
            }
        else
            PlayedTime[user_id] = 0
            Coins[user_id] = {
                vip = 0,
                free = 0,
            }
        end
        Timing[user_id] = {
            timingFree = 0,
            timingVip = 0
        }
    end
end)


local RankCache = nil
CreateTunnel.requestRanking = function()
    if not RankCache then
        local query = vRP.query('sjr/getAllBoxByHours')
        local query2 = vRP.query('sjr/getAllBoxByVip')
        local query3 = vRP.query('sjr/getAllBoxByCoin')
        local hours = {}
        if #query > 0 then
            for i = 1, #query do
                local identity = vRP.getUserIdentity(parseInt(query[i].user_id))
                if not identity then
                    identity = {
                        nome = "Nome",
                        sobrenome = "Indefinido",
                    }
                end
                local seconds = parseInt(query[i].played)
                local coin = parseInt(query[i].coin)
                local vip = parseInt(query[i].vip)
                if PlayedTime[parseInt(query[i].user_id)] then
                    seconds = PlayedTime[parseInt(query[i].user_id)]
                    coin = Coins[parseInt(query[i].user_id)]['free']
                    vip = Coins[parseInt(query[i].user_id)]['vip']
                end
                hours[#hours+1] = {
                    
                    name = identity.nome.." "..identity.sobrenome,
                    seconds = (seconds/60),
                    user_id = parseInt(query[i].user_id),
                    coin = coin,
                    vipcoin = vip
                }
            end
        end
        local vipss = {}
        if #query2 > 0 then
            for i = 1, #query2 do
                local identity = vRP.getUserIdentity(parseInt(query2[i].user_id))
                if not identity then
                    identity = {
                        nome = "Nome",
                        sobrenome = "Indefinido",
                    }
                end
                local seconds = parseInt(query2[i].played)
                local coin = parseInt(query2[i].coin)
                local vip = parseInt(query2[i].vip)
                if PlayedTime[parseInt(query2[i].user_id)] then
                    seconds = PlayedTime[parseInt(query2[i].user_id)]
                    coin = Coins[parseInt(query2[i].user_id)]['free']
                    vip = Coins[parseInt(query2[i].user_id)]['vip']
                end
                vipss[#vipss+1] = {
                    
                    name = identity.nome.." "..identity.sobrenome,
                    seconds = (seconds/60),
                    user_id = parseInt(query2[i].user_id),
                    coin = coin,
                    vipcoin = vip
                }
            end
        end
        local coinss = {}
        if #query3 > 0 then
            for i = 1, #query3 do
                local identity = vRP.getUserIdentity(parseInt(query3[i].user_id))
                if not identity then
                    identity = {
                        nome = "Nome",
                        sobrenome = "Indefinido",
                    }
                end
                local seconds = parseInt(query3[i].played)
                local coin = parseInt(query3[i].coin)
                local vip = parseInt(query3[i].vip)
                if PlayedTime[parseInt(query3[i].user_id)] then
                    seconds = PlayedTime[parseInt(query3[i].user_id)]
                    coin = Coins[parseInt(query3[i].user_id)]['free']
                    vip = Coins[parseInt(query3[i].user_id)]['vip']
                end
                coinss[#coinss+1] = {
                    
                    name = identity.nome.." "..identity.sobrenome,
                    seconds = (seconds/60),
                    user_id = parseInt(query3[i].user_id),
                    coin = coin,
                    vipcoin = vip
                }
            end
        end
        RankCache = {
            hours = hours,
            coin = coinss,
            vipcoin = vipss
        }
    end
    local lastwinner = {
        avatar = Config.defaultReward.photo,
        desc = Config.defaultReward.desc,
        award = Config.defaultReward.award,
        name = Config.defaultReward.name,
        time_played = Config.defaultReward.time_played
    }
    return {rank = RankCache, time = (Config.finishTime-os.time()), lastWinner = lastwinner, topRewards = Config.topRewards}
end



