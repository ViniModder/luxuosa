-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("lux_hud", cRP)
vCLIENT = Tunnel.getInterface("lux_hud")
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALSTATE
-----------------------------------------------------------------------------------------------------------------------------------------
GlobalState["Hours"] = 18
GlobalState["Minutes"] = 0
GlobalState["Weather"] = "CLEAR"
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREAD GLOBAL TIME AND WEATHER SYNC
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        GlobalState["Minutes"] = GlobalState["Minutes"] + 1

        if GlobalState["Minutes"] >= 60 then
            GlobalState["Hours"] = GlobalState["Hours"] + 1
            GlobalState["Minutes"] = 0

            if GlobalState["Hours"] >= 24 then
                GlobalState["Hours"] = 0
            end
        end

        TriggerClientEvent("lux_hud:syncTimers", -1, { GlobalState["Hours"], GlobalState["Minutes"], GlobalState["Weather"] })
        Wait(10000)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMANDO PARA ALTERAR TEMPO E CLIMA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("timeset", function(source, args)
    local user_id = vRP.getUserId(source)
    if user_id and vRP.hasPermission(user_id, "admin.permissao") then
        GlobalState["Hours"] = parseInt(args[1]) or GlobalState["Hours"]
        GlobalState["Minutes"] = parseInt(args[2]) or GlobalState["Minutes"]
        GlobalState["Weather"] = args[3] or GlobalState["Weather"]

        TriggerClientEvent("lux_hud:syncTimers", -1, { GlobalState["Hours"], GlobalState["Minutes"], GlobalState["Weather"] })
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SINCRONIZAR AO SPAWN DO PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn", function(user_id, source)
    TriggerClientEvent("lux_hud:syncTimers", source, { GlobalState["Hours"], GlobalState["Minutes"], GlobalState["Weather"] })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR SE HUD PODE SER ATIVADA
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkhud()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        return true
    end
    return false
end
