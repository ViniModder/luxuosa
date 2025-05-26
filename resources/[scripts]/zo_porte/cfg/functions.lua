zof = {
    getUserId = function(source)
        return vRP.getUserId(source)
    end,

    hasPermission = function(user_id, group)
        return vRP.hasPermission(user_id, group)
    end,

    replaceWeapons = function(source, weapons)
        return vRPclient.replaceWeapons(source, weapons)
    end,

    giveInventoryItem = function(user_id, item, qtd)
        return vRP.giveInventoryItem(user_id, item, qtd)
    end,

    getSData = function(key)
        return vRP.getSData(key)
    end,

    getUserIdentity = function(user_id)
        return vRP.getUserIdentity(user_id)
    end,

    getNearestPlayer = function(source, range)
        return vRPclient.getNearestPlayer(source, range)
    end,
    
    tryGetInventoryItem = function(user_id, item, qtd)
        return vRP.tryGetInventoryItem(user_id, item, qtd)
    end,
    
    setSData = function(key, data)
        return vRP.setSData(key, data)
    end,
    
    tryFullPayment = function(user_id, value)
        return vRP.tryFullPayment(user_id, value)
    end,
    
    getUserDataTable = function(user_id)
        return vRP.getUserDataTable(user_id)
    end,
    
    setUserData = function(user_id, data)
        return vRP.setUserData(user_id, data)
    end,

    giveWeapons = function(arma, municao)
        vRP.giveWeapons({
            [arma] = {
                ammo = municao
            }
        })
    end,

    _CarregarObjeto = function(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
        return vRP._CarregarObjeto(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
    end,

    _stopAnim = function(bool)
        return vRP._stopAnim(bool)
    end,

    _DeletarObjeto = function()
        return vRP._DeletarObjeto()
    end,
}