local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}

Tunnel.bindInterface("zo_porte", src)
Proxy.addInterface("zo_porte", src)

vCLIENT = Tunnel.getInterface("zo_porte")

src.inPorte = {}

src.getInsPorte = function()
        return src.inPorte
end

src.checkInPorteClient = function()
        local source = source
        local user_id = zof.getUserId(source)

        return src.inPorte[tostring(user_id)] or false
end

src.setInPorte = function(bool)
        local source = source
        local user_id = zof.getUserId(source)

        src.inPorte[tostring(user_id)] = bool
end

function src.checkPermission(perms)
        local user_id = zof.getUserId(source)
        for k, group in pairs(perms) do
                if zof.hasPermission(user_id, group) then
                        return true
                end
        end

        return false
end

function src.setPlayerStand(ped)
        local source = source
        SetPlayerRoutingBucket(source, tonumber(source))

        local user_id = zof.getUserId(source)

        if user_id then
                local weapons = zof.replaceWeapons(source, {})

                if weapons then
                        for k, v in pairs(weapons) do
                                zof.giveInventoryItem(user_id, "wbody|"..k, 1)

                                if v.ammo > 0 then
                                        zof.giveInventoryItem(user_id, "wammo|"..k, v.ammo)
                                end
                        end

                        TriggerClientEvent("Notify", source, "sucesso", dict[0])
                end
        end
end

function src.returnPlayerStand()
        local source = source
        SetPlayerRoutingBucket(source, 0)
end

function src.verificarPorte(user_id)
        local consulta = zof.getSData("ZoPorte:" .. user_id)

        local resultado = json.decode(consulta) or {}
        resultado.possui = resultado.possui or 0

        if resultado.possui == 1 then
                return true
        else
                return false
        end
end

function src.getDadosPorte(pVerPortePolicia)
        local source = source
        local user_id = zof.getUserId(source)

        if pVerPortePolicia then
                if src.checkPermission(cfg.permissaoVerPorte) then
                        local nplayer = zof.getNearestPlayer(source, 2)
                        local nuser_id = zof.getUserId(nplayer)

                        if nuser_id then
                                local identity = zof.getUserIdentity(nuser_id)
                                local porte = "Não possui"

                                if src.verificarPorte(nuser_id) then
                                        porte = "Possui porte"
                                end

                                return {
                                        nome = identity.nome .. ' ' .. identity.sobrenome,
                                        foto = identity.foto,
                                        porte = porte
                                }
                        else
                                TriggerClientEvent("Notify", source, "negado", dict[1])
                                return false
                        end
                else
                        TriggerClientEvent("Notify", source, "negado", dict[2])
                        return false
                end
        end

        if user_id then
                local identity = zof.getUserIdentity(user_id)
                local porte = "Não possui"

                if src.verificarPorte(user_id) then
                        porte = "Possui porte"
                end

                return {
                        nome = identity.nome .. ' ' .. identity.sobrenome,
                        foto = identity.foto,
                        porte = porte
                }
        end
end

function src.setarPorte()
        local source = source
        local user_id = zof.getUserId(source)

        if not src.checkPermission(cfg.permissaoLiberarRemoverPorte) then
                TriggerClientEvent("Notify", source, "negado", dict[3])
                return
        end

        local nplayer = zof.getNearestPlayer(source, 2)
        local nuser_id = zof.getUserId(nplayer)

        if nuser_id then
                if src.verificarPorte(nuser_id) then
                        TriggerClientEvent("Notify", source, "negado", dict[4])
                else
                        if cfg.itemLaudoProvaPratica.gerarLaudo then
                                if zof.tryGetInventoryItem(nuser_id, cfg.itemLaudoProvaPratica.item, 1) then
                                        TriggerClientEvent("Notify", source, "sucesso", dict[5](tostring(cfg.comandoVerificarPortePolicia)))
                                        TriggerClientEvent("Notify", nplayer, "sucesso", dict[6](tostring(cfg.comandoVerPorte)))

                                        local a = { possui = 1 }
                                        zof.setSData("ZoPorte:" .. nuser_id, json.encode(a))
                                else
                                        TriggerClientEvent("Notify", source, "negado", dict[7])
                                        TriggerClientEvent("Notify", nplayer, "negado", dict[8])
                                end
                        else
                                TriggerClientEvent("Notify", source, "sucesso", dict[9](tostring(cfg.comandoVerificarPortePolicia)))
                                TriggerClientEvent("Notify", nplayer, "sucesso", dict[10](tostring(cfg.comandoVerPorte)))

                                local a = { possui = 1 }
                                zof.setSData("ZoPorte:" .. nuser_id, json.encode(a))
                        end
                end
        else
                TriggerClientEvent("Notify", source, "negado", dict[1])
        end
end

function src.removerPorte()
        local source = source
        local user_id = zof.getUserId(source)

        if not src.checkPermission(cfg.permissaoLiberarRemoverPorte) then
                TriggerClientEvent("Notify", source, "negado", dict[11])
                return
        end

        local nplayer = zof.getNearestPlayer(source, 2)
        local nuser_id = zof.getUserId(nplayer)

        if nuser_id then
                if not src.verificarPorte(nuser_id) then
                        TriggerClientEvent("Notify", source, "negado", dict[12])
                else
                        TriggerClientEvent("Notify", source, "sucesso", dict[13](tostring(cfg.comandoVerificarPortePolicia)))
                        TriggerClientEvent("Notify", nplayer, "negado", dict[14](tostring(cfg.comandoVerPorte)))

                        local a = { possui = 0 }
                        zof.setSData("ZoPorte:" .. nuser_id, json.encode(a))
                end
        else
                TriggerClientEvent("Notify", source, "negado", dict[1])
        end
end

function src.resultadoTesteTeorico(resultado)
        local source = source
        local user_id = zof.getUserId(source)

        if resultado then
                if cfg.itemLaudoProvaTeorica.gerarLaudo then
                        zof.giveInventoryItem(user_id, cfg.itemLaudoProvaTeorica.item, 1)
                        TriggerClientEvent("Notify", source, "sucesso", dict[15])
                end

                TriggerClientEvent("Notify", source, "sucesso", dict[16])
        else
                TriggerClientEvent("Notify", source, "negado", dict[17])
        end
end

function src.verificarTesteTeorico()
        local source = source
        local user_id = zof.getUserId(source)

        if src.verificarPorte(user_id) then
                TriggerClientEvent("Notify", source, "negado", dict[18])
                return
        end

        if zof.tryFullPayment(user_id, parseInt(cfg.precoProvaTeorica)) then
                vCLIENT.iniciarTesteTeorico(source)
        else
                TriggerClientEvent("Notify", source, "negado", dict[19])
        end
end

function src.verificarTestePratico()
        local source = source
        local user_id = zof.getUserId(source)

        if src.verificarPorte(user_id) then
                TriggerClientEvent("Notify", source, "negado", dict[18])
                return
        end

        if zof.tryFullPayment(user_id, parseInt(cfg.precoProvaPratica)) then
                if cfg.itemLaudoProvaTeorica.gerarLaudo then
                        if zof.tryGetInventoryItem(user_id, cfg.itemLaudoProvaTeorica.item, 1) then
                                vCLIENT.realizarTestePratico(source)
                        else
                                TriggerClientEvent("Notify", source, "negado", dict[20])
                        end
                else
                        vCLIENT.realizarTestePratico(source)
                end
        else
                TriggerClientEvent("Notify", source, "negado", dict[19])
        end
end

function src.resultadoTestePratico(resultado)
        local source = source
        local user_id = zof.getUserId(source)

        if resultado then
                if cfg.itemLaudoProvaPratica.gerarLaudo then
                        zof.giveInventoryItem(user_id, cfg.itemLaudoProvaPratica.item, 1)
                        TriggerClientEvent("Notify",source, "sucesso", dict[21])
                end

                TriggerClientEvent("Notify", source, "sucesso", dict[22])
        else
                TriggerClientEvent("Notify", source, "negado", dict[23])
        end
end

AddEventHandler("playerDropped", function(reason)
        local source = source
        local user_id = zof.getUserId(source)

        if src.inPorte[tostring(user_id)] then
                local data = zof.getUserDataTable(user_id)
                data.weapons = {}

                src.inPorte[tostring(user_id)] = nil
                zof.setUserData(user_id, data)
                vRP.setUData(user_id, "vRP:datatable", json.encode(data))
        end
end)




