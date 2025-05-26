local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)
vSERVER = Tunnel.getInterface(GetCurrentResourceName())

local activenui = false
local playergroups = {}
local inf_table,total_p,total_s = {}
local itemlist = vSERVER.getitemlist()
local grouplist = vSERVER.catchgroups()

RegisterKeyMapping('paineladm',"Abrir Painel ADM","keyboard",cfg.tecla)
RegisterCommand('paineladm', function(_, args, rawCommand)

    inf_table,total_p,total_s = vSERVER.getplayerson()
    
    if not activenui then
        if vSERVER.checkPermOpen(cfg.permissao) then
            SendNUIMessage({
                showNUI = true,
                inf_ply = inf_table,
                itemlist = itemlist,
                server_groups = {},
                locais = cfg.locais,
                total_p = total_p,
                total_s = total_s,
                carlist = cfg.carlist,
                skinlist = cfg.skinlist
            })
            SetNuiFocus(true,true)      
            activenui = true
        end
    end
    
end)

RegisterNUICallback("close", function(data, callback)
    SetNuiFocus(false,false)            
    activenui = false
end)

RegisterNUICallback("mgpc:tpto", function(data, callback)

    if string.find(data,"ID: ") then
        id_ = string.gsub(data, "%a","")
        id = string.gsub(id_,"%p","")
    end 
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('mgps:tpto',id)
    SetNuiFocus(false,false)            
    activenui = false
end)

RegisterNUICallback("mgpc:tptome", function(data, callback)

    if string.find(data,"ID: ") then
        id_ = string.gsub(data, "%a","")
        id = string.gsub(id_,"%p","")
    end
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('mgps:tptome',id)
    SetNuiFocus(false,false)            
    activenui = false
end)

RegisterNUICallback("mgpc:revive", function(data, callback)

    if string.find(data,"ID: ") then
        id_ = string.gsub(data, "%a","")
        id = string.gsub(id_,"%p","")
    end
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('mgps:s_revive',id)
    SetNuiFocus(false,false)            
    activenui = false
end)

RegisterNUICallback("mgpc:c_giveitem", function(data, callback)

    item = data.item
    qtd = data.qtd
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('mgpc:s_giveitem',item,qtd)

end)

RegisterNUICallback("mgpc:c_confirmgeral", function(data, callback)

    id = parseInt(data.idplayer)
    data_act = data.data_act
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    if id >= 1 then
        TriggerServerEvent('mgpc:s_confirmgeral',id,data_act)
    else
        TriggerEvent("Notify",'negado',"Coloque um id válido!")
    end

end)

RegisterNUICallback("att_groups_player", function(data, callback)

    id = parseInt(data)
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    if id >= 1 then
        TriggerServerEvent('catch_playergroups',id)
    else
        TriggerEvent("Notify",'negado',"Coloque um id válido!")
    end

end)


RegisterNetEvent('confirm_player_groups')
AddEventHandler('confirm_player_groups',function(p_groups)

    p_groups = p_groups
    inf_table,total_p,total_s = vSERVER.getplayerson()

    SendNUIMessage({
        showNUI = true,
        table = cfg.valores_padroes,
        inf_ply = inf_table,
        itemlist = itemlist,
        server_groups = grouplist,
        playergroups = p_groups,
        locais = cfg.locais,
        total_p = total_p,
        total_s = total_s
    })

end)

RegisterNUICallback("addusergroup", function(data, callback)
    id = data.idplayer
    group = data.group
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('s_addusergroup',id,group)
end)

RegisterNUICallback("remusergroup", function(data, callback)
    id = data.idplayer
    group = data.group
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('s_remusergroup',id,group)
end)

RegisterNUICallback("tp_to_loc", function(data, callback)

    cds = data.cds
    tipo = data.tipo
    nome = data.nome
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    TriggerServerEvent('s_tptoloc',cds,tipo,nome)

end)

RegisterNUICallback("get_staffson", function(data, callback)
    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
 
    TriggerServerEvent('mg:getstaffs')

end)


RegisterNUICallback("mg_spawncar_setskin", function(data, callback)

    if cfg.som_ao_clicar then
        vRP._playSound(cfg.som.arg,cfg.som.arg2)
    end
    if data.act == 'spawncar' then
        TriggerServerEvent('mg:spawncar',data.data)
    elseif data.act == 'setskin' then
        TriggerServerEvent('mg:setskin',data.data)
    end
    SetNuiFocus(false,false)            
    activenui = false

end)





RegisterNetEvent('limparArmas')
AddEventHandler('limparArmas',function()
        RemoveAllPedWeapons(GetPlayerPed(-1), true);
        SetPedAmmo(ped,GetHashKey("WEAPON_COMBATPISTOL"),0)
        RemoveWeaponFromPed(ped,GetHashKey("WEAPON_COMBATPISTOL"))
end)


function src.returnHashVeh(veh)
    return GetEntityModel(veh)
end


