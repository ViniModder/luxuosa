local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("mirtin_bans",src)
Proxy.addInterface("mirtin_bans",src)

vCLIENT = Tunnel.getInterface("mirtin_bans")
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local totalBanidos = 0
local autenticado = true

src.setBanned = function(source, target_id, motivo, tempo, hwid)
    if autenticado then
        local source = source
        local user_id = vRP.getUserId(source)
        local rows = vRP.query("mirtin/getUserBanned", { user_id = target_id })
        local nsource = vRP.getUserSource(target_id)

        if user_id then
            if #rows > 0 then
                config.serverLang['isBanned'](source)
                return
            end

            local formatHWID
            if hwid == nil or hwid <= 0 then
                formatHWID = "Não"
                hwid = 0
            else
                formatHWID = "Sim"
                hwid = 1
            end
            
            local dataBan = os.date("%d/%m/%Y as %H:%M")
            local dataUnban = os.date("%d/%m/%Y as %H:%M", tempo)
            local timeBan = tempo

            if tempo == 0 then
                dataUnban = "Nunca"
            end

            totalBanidos = totalBanidos + 1
            vRP.execute("mirtin/insertBanned", { user_id = target_id, motivo = motivo, banimento = dataBan, desbanimento = dataUnban, time = timeBan, hwid = hwid })
            config.serverLang['banned'](source, target_id, motivo, tempo)

            if nsource then
                config.serverLang['kickBan'](nsource, motivo, dataBan, dataUnban)
            end

            local discord
            local corpoBan
            local ids = GetPlayerIdentifiers(source)

            for k,v in pairs(ids) do
                if string.find(v,"discord:") then
                    discord = string.gsub(v, "discord:","")
                end
            end

            if discord == nil then 
                corpoBan = { 
                    { 
                        ["color"] = config.geral['color'], 
                        ["title"] = "**".. ":no_entry_sign: | Novo Banimento Registrado " .."**\n", 
                        ["thumbnail"] = { ["url"] = config.geral['logo'] },
                        ["description"] = "**Banido:**\n```cs\nID: "..target_id.."```\n**Banido por: **\n```cs\nID: "..user_id.."```\n**MOTIVO:** ```css\n - "..motivo.."```\n**Data do Banimento:**\n ```cs\n "..dataBan.."```\n**Data do Desbanimento:**\n ```cs\n "..dataUnban.."``` **HWID:** ```cs\n "..formatHWID.."``` ", 
                        ["footer"] = { ["text"] = config.geral['footer'], }, } 
                }
                sendToDiscord(config.geral['whookBan'], corpoBan)
                return
            end

            corpoBan = { 
                { 
                    ["color"] = config.geral['color'], 
                    ["title"] = "**".. ":no_entry_sign: | Novo Banimento Registrado " .."**\n", 
                    ["thumbnail"] = { ["url"] = config.geral['logo'] },
                    ["description"] = "**Banido:**\n```cs\nID: "..target_id.."```\n**Banido por: **\n```cs\nID: "..user_id.."``` ``Discord:`` <@"..discord..">\n\n**MOTIVO:** ```css\n - "..motivo.."```\n**Data do Banimento:**\n ```cs\n "..dataBan.."```\n**Data do Desbanimento:**\n ```cs\n "..dataUnban.."``` **HWID:** ```cs\n "..formatHWID.."``` ", 
                    ["footer"] = { ["text"] = config.geral['footer'], }, } 
            }
            sendToDiscord(config.geral['whookBan'], corpoBan)
        end
    end
end

src.setUnBanned = function(source, target_id, motivo)
    if autenticado then
        local source = source
        local user_id = vRP.getUserId(source)
        local rows = vRP.query("mirtin/getUserBanned", { user_id = target_id })
        if user_id then
            if #rows == 0 then
                config.serverLang['isNotBanned'](source)
                return
            end

            totalBanidos = totalBanidos - 1
            vRP.execute("mirtin/removeBanned", { user_id = target_id })
            config.serverLang['unbanned'](source, target_id)

            local discord
            local corpoBan
            local ids = GetPlayerIdentifiers(source)

            for k,v in pairs(ids) do
                if string.find(v,"discord:") then
                    discord = string.gsub(v, "discord:","")
                end
            end

            if discord == nil then
                corpoBan = { 
                    { 
                        ["color"] = config.geral['color'], 
                        ["title"] = "**".. ":no_entry:  | Novo Desbanimento Registrado " .."**\n", 
                        ["thumbnail"] = { ["url"] = config.geral['logo'] },
                        ["description"] = "**Desbanido:**\n```cs\nID: "..target_id.."```\n**Desbanido por: **\n```cs\nID: "..user_id.."```\n**Data do Desbanimento:** ```cs\n "..os.date("%d/%m/%Y as %H:%M").."```\n**Motivo do Desbanimento:** ```cs\n "..motivo.."``` ", 
                        ["footer"] = { ["text"] = config.geral['footer'], }, } 
                }
                sendToDiscord(config.geral['whookUnban'], corpoBan)
                return
            end

            corpoBan = { 
                { 
                    ["color"] = config.geral['color'], 
                    ["title"] = "**".. ":no_entry:  | Novo Desbanimento Registrado " .."**\n", 
                    ["thumbnail"] = { ["url"] = config.geral['logo'] },
                    ["description"] = "**Desbanido:**\n```cs\nID: "..target_id.."```\n**Desbanido por: **\n```cs\nID: "..user_id.."``` ``Discord:`` <@"..discord..">\n\n**Data do Desbanimento:** ```cs\n "..os.date("%d/%m/%Y as %H:%M").."```\n**Motivo do Desbanimento:** ```cs\n "..motivo.."``` ", 
                    ["footer"] = { ["text"] = config.geral['footer'], }, } 
            }
            sendToDiscord(config.geral['whookUnban'], corpoBan)
        end
    end
end

src.getHcheck = function(source, target_id)
    local source = source
    local user_id = vRP.getUserId(source)
    local rows = vRP.query("mirtin/getUserBanned", { user_id = target_id })
    if user_id then
        if #rows == 0 then
            config.serverLang['isNotBanned'](source)
            return
        end

        TriggerClientEvent('chatMessage', source, "^9 ID: "..target_id.."\nData do Banimento: "..rows[1].banimento.."\nData do Desbanimento: "..rows[1].desbanimento.."\nMotivo do Banimento: "..rows[1].motivo.."  . ")
    end
end

Citizen.CreateThread(function()
    while true do
        if autenticado then
            local rows = vRP.query("mirtin/getAllBans", {})
            if #rows > 0 then
                for k,v in pairs(rows) do
                    if v.time > 0 and os.time() > v.time then
                        vRP.execute("mirtin/removeBanned", { user_id = v.user_id })

                        local corpoBan = { 
                            { 
                                ["color"] = config.geral['color'], 
                                ["title"] = "**".. ":no_entry:  | Novo Desbanimento Registrado " .."**\n", 
                                ["thumbnail"] = { ["url"] = config.geral['logo'] },
                                ["description"] = "**Desbanido:**\n```cs\nID: "..v.user_id.."```\n**Desbanido por: **\n```cs\n AUTOMATICO```\n**Data do Desbanimento:** ```cs\n "..os.date("%d/%m/%Y as %H:%M").."``` ", 
                                ["footer"] = { ["text"] = config.geral['footer'], }, } 
                        }
                        sendToDiscord(config.geral['whookUnbanTime'], corpoBan)
                    end
                end
            end

            totalBanidos = #rows
        end
        Citizen.Wait(config.timeUnbans*60*1000)
    end
end)

function sendToDiscord(weebhook, message)
    PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({embeds = message}), { ['Content-Type'] = 'application/json' })
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAGEM DO JOGADOR BANIDO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local TimeUnit = {
    ['m'] = 60, -- 1 minuto tem 60 segundos
    ['h'] = 3600, -- 1 hora tem 3600 segundos
    ['d'] = 86400 -- 1 dia tem 86400 segundos
}
  
convertTime = function (value)
    if value ~= 0 then
        local unit = value:match('[mhdMHD]'):lower()
        local time = tonumber(value:match('%d+'))
        return (os.time() + (TimeUnit[unit] * time)), os.time() + (TimeUnit[unit] * time)
    end
    return 0
end

