-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MAIN
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {} -- Não mexer

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.timeUnbans = 5 -- (minutos) Configura o tempo para o refresh de desbanimentos automaticos
config.createTable = true -- Depois de ligar o script pela 1x coloque false
config.permissionBan = "admin.permissao" -- Permissao para o comando /ban & /unban
config.timeConnect = 3000 -- Caso não estja aparecendo a mensagem de banimento ou trave na tela checando banimento aumente esse valor

config.geral = {
    logo = "https://a.imagem.app/39AxX3.png", -- LOGO do Servidor
    background = "https://cdn.discordapp.com/attachments/1132183222982283314/1233273357215203358/background.c6e5aa7a.webp?ex=662c7ed1&is=662b2d51&hm=b89063a1b79fbab8c97ebfd4892c23d64911cf5f155e75736d83472b89c52839&", -- Fundo da Tela de banimento
    discord = "https://discord.gg/9VZPu26h", -- Discord do Servidor (Colocar https://)

    color = 6356736, -- Cor da Lateral do WeebHook
    footer = "© luxuosa  RP", -- RODAPE do WeebHook

    whookBan = "https://discord.com/api/webhooks/1264648188997013544/R5ZPkQzgWrh4f0Hz4q723EZU14VOcKLqtGTir-ovJ0TM1suaSlyMfa4j4wrZHIk5prej", -- WEEBHOOK para quando o jogador for banido
    whookUnban = "https://discord.com/api/webhooks/1264648188997013544/R5ZPkQzgWrh4f0Hz4q723EZU14VOcKLqtGTir-ovJ0TM1suaSlyMfa4j4wrZHIk5prej", -- WEEBHOOK para quando o jogador for desbanido
    whookUnbanTime = "https://discord.com/api/webhooks/1264648188997013544/R5ZPkQzgWrh4f0Hz4q723EZU14VOcKLqtGTir-ovJ0TM1suaSlyMfa4j4wrZHIk5prej", -- WEEBHOOK para quando o jogador for desbanido automaticamente ( BAN TEMPORARIO )
    whookHWIDlogin = "https://discord.com/api/webhooks/1264648188997013544/R5ZPkQzgWrh4f0Hz4q723EZU14VOcKLqtGTir-ovJ0TM1suaSlyMfa4j4wrZHIk5prej", -- WEEBHOOK para quando o estiver banido HWID e logar com outra conta.
}

config.serverLang = {
    isBanned = function(source) 
        return TriggerClientEvent("Notify", source, "negado", "Este jogador ja está banido.", 5000)
    end,

    isNotBanned = function(source) 
        return TriggerClientEvent("Notify", source, "negado", "Este jogador não está banido.", 5000)
    end,

    banned = function(source, id, motivo, tempo) 
        return TriggerClientEvent("Notify", source, "aviso", "Você baniu o <b>ID: "..id.."</b> pelo motivo: <b> "..motivo.."</b>", 5000)
    end,

    unbanned = function(source, id) 
        return TriggerClientEvent("Notify", source, "aviso", "Você desbaniu o <b>ID: "..id.."</b>.", 5000)
    end,

    kickBan = function(nsource, motivo, dataBan, dataUnban) 
        vRP.kick(nsource, "\nVocê foi banido do servidor.\nMotivo: "..motivo.."\nData do Banimento: "..dataBan.."\nData do Desbanimento: "..dataUnban.." ")
    end,
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ban', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, config.permissionBan) then
            local idBan = tonumber(args[1])
            if idBan == nil then
                TriggerClientEvent("Notify",source,"negado","Este ID não foi encotrado.", 5000)
                return
            end

            local motivoBan = ""
            local tempoBan = 0
            for i=2,#args do
            local allargs = args[i]
                if allargs:match('%d+[mhdMHD]') then
                    tempoBan = allargs
                    break
                else
                    motivoBan = motivoBan..' '..allargs
                end
            end

            if motivoBan == "" then
                motivoBan = "Sem Motivo"
            end

            src.setBanned(source, idBan, motivoBan, convertTime(tempoBan), 0)
        end
    end
end)

RegisterCommand('bansrc', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, config.permissionBan) then
            local idSource = tonumber(args[1])

            local ids = GetPlayerIdentifiers(idSource)
            if #ids > 0 then

                local idBan
                for k,v in pairs(ids) do
                    local rows = vRP.query("getUserId", { identifier = v })
                    if #rows > 0 then
                        idBan = rows[1].user_id
                        break;
                    end
                end
               
                if idBan then
                    local motivoBan = ""
                    local tempoBan = 0
                    for i=2,#args do
                    local allargs = args[i]
                        if allargs:match('%d+[mhdMHD]') then
                            tempoBan = allargs
                            break
                        else
                            motivoBan = motivoBan..' '..allargs
                        end
                    end
        
                    if motivoBan == "" then
                        motivoBan = "Sem Motivo"
                    end
                   
                    src.setBanned(source, idBan, motivoBan, convertTime(tempoBan), 0)
                else
                    TriggerClientEvent("Notify",source,"negado","Não conseguimos capturar um id com esse source.", 5000)
                end
            else
                TriggerClientEvent("Notify",source,"negado","Este source não foi encontrado.", 5000)
            end
        end
    end
end)

RegisterCommand('hban', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, config.permissionBan) then
            local idBan = tonumber(args[1])
            if idBan == nil then
                TriggerClientEvent("Notify",source,"negado","Este ID não foi encotrado.", 5000)
                return
            end

            local motivoBan = ""
            local tempoBan = 0
            for i=2,#args do
            local allargs = args[i]
                if allargs:match('%d+[mhdMHD]') then
                    tempoBan = allargs
                    break
                else
                    motivoBan = motivoBan..' '..allargs
                end
            end

            if motivoBan == "" then
                motivoBan = "Sem Motivo"
            end

            src.setBanned(source, idBan, motivoBan, convertTime(tempoBan), 1)
        end
    end
end)

RegisterCommand('unban', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, config.permissionBan) then
            local idBan = tonumber(args[1])
            if idBan == nil then
                TriggerClientEvent("Notify",source,"negado","Este ID não foi encotrado.", 5000)
                return
            end

            local motivoUnBan = ""
            for i=2, #args do
                motivoUnBan = motivoUnBan.. " " ..args[i]
            end

            if motivoUnBan == "" then
                motivoUnBan = "Sem Motivo"
            end

            src.setUnBanned(source, idBan, motivoUnBan)
        end
    end
end)

RegisterCommand('mcheck', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
            local idBan = tonumber(args[1])
            if idBan == nil then
                TriggerClientEvent('chatMessage', source, "^9Digite o ID corretamente. ")
                return
            end

            src.getHcheck(source, idBan)
        end
    end
end)

RegisterCommand('kick', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, config.permissionBan) or vRP.hasPermission(user_id, "moderador.permissao") then
            local idKick = tonumber(args[1])
            if idKick == nil then
                TriggerClientEvent("Notify",source,"negado","Este ID não foi encontrado.", 5000)
                return
            end

            local nsource = vRP.getUserSource(idKick)
            if nsource == nil then
                TriggerClientEvent("Notify",source,"negado","Este jogador não está online.", 5000)
                return
            end

            local motivoKick = table.concat(args, " ", 2)
            if motivoKick == "" then
                motivoKick = "Sem Motivo"
            end

            vRP.kick(nsource,"Você foi kickado da cidade: ("..motivoKick.." ) ")

            local corpoWebHook = {
                {
                    ["color"] = 6356736,
                    ["title"] = "**KICK | Novo Registro**\n",
                    ["thumbnail"] = {
                        ["url"] = "https://cdn.discordapp.com/attachments/867220374336831519/1014997973228339200/LOGO_TOKYO_96x96_Transparente_-_by_Design_Ideal.png"
                    },
                    ["description"] = "**ADMIN:**\n```cs\n- ID: "..user_id.."  ```\n**ID:**\n```cs\n- ID: "..idKick.."  ```\n**MOTIVO:**\n```cs\n- "..motivoKick.."  ```\n**Horario:**\n```cs\n"..os.date("[%d/%m/%Y as %H:%M]").." ```",
                    ["footer"] = {
                        ["text"] = "Mirt1n Store"
                    }
                }
            }
            PerformHttpRequest("https://discord.com/api/webhooks/1264647489001230448/YvhEStrivHsPb2iPTjgiR-oPXPpPZOObb4tDKZ0RVaEVU7-3e_1cSSCkmFz0dZqRjLfM", function(err, text, headers) end, 'POST', json.encode({username = "Nome do Bot", embeds = corpoWebHook}), { ['Content-Type'] = 'application/json' })
        end
    end
end)



RegisterCommand('idsrc', function(source,args)
    local user_id = vRP.getUserId(source)

    if vRP.hasPermission(user_id, config.permissionBan) then
        local ids = GetPlayerIdentifiers(args[1])

        local idBan
        for k,v in pairs(ids) do
            local rows = vRP.query("getUserId", { identifier = v })
            if #rows > 0 then
                idBan = rows[1].user_id
                break;
            end
        end

        if idBan ~= nil then
            TriggerClientEvent("Notify", source, "negado", "Source ID: "..idBan.." .", 5000)
        end
    end

end)

async(function()
    if config.createTable then
        vRP.execute("mirtin/createBanDB", {})
        vRP.execute("mirtin/createBanDBHWID", {})
    end
end)