GlobalState["hazzard_wall"] = math.random(213444500,213445500)
GlobalState["hazzardsv"] = math.random(113444500,113445500)

pedrin = {}
module("vrp","lib/Tunnel").bindInterface(GlobalState["hazzardsv"],pedrin)
local chain = GlobalState["hazzard_wall"]
vRP = module("vrp","lib/Proxy").getInterface("vRP")

local wall_infos = {}

function pedrin.setWallInfos()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        wall_infos[source] = {}
        wall_infos[source].user_id = vRP.getUserId(source)
        local name = GetPlayerName(source)
        if name == nil or name == "" or name == -1 then
            name = "N/A"
        else
            wall_infos[source].name = name
        end
        wall_infos[source].wallstats = false
    end
end

RegisterCommand("walladm", function(source, args)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "player.wall") then
        if wall_infos[source].wallstats == true then
            wall_infos[source].wallstats = false
            TriggerClientEvent(chain .. ":wall", source, wall_infos[source].wallstats)
        else
            wall_infos[source].wallstats = true
            TriggerClientEvent(chain .. ":wall", source, wall_infos[source].wallstats)
        end
    end
end)

function pedrin.getWallInfos()
    return wall_infos
end
