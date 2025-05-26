local patrulhamento = {}

function vRP.setPatrulhamento(user_id)
	patrulhamento[user_id] = true
end

function vRP.removePatrulhamento(user_id)
    patrulhamento[user_id] = nil
end

function vRP.checkPatrulhamento(user_id)
	return patrulhamento[user_id]
end

function alertPolice(data)
    local policia = vRP.getUsersByPermission("perm.policia") 
    if #policia > 0 then
        for k,v in pairs(policia) do
            local nsource = vRP.getUserSource(parseInt(v))
            if nsource then
                if vRP.checkPatrulhamento(parseInt(v)) then
                    TriggerClientEvent("NotifyPush", nsource, { x = data.x, y = data.y, z = data.z, blipID = data.blipID, blipColor = data.blipColor, blipScale = data.blipScale, time = data.time, code = data.code, title = data.title, name = data.name })
                end
            end
        end
    end
end

exports("alertPolice", function(...)
    alertPolice(...)
end)
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -- TOOGLE
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('toogle', function(source,args)
    --vRP.setPatrulhamento(user_id)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id, "perm.unizk") or vRP.hasPermission(user_id, "perm.mecanica") or vRP.hasGroup(user_id, "perm.mecanica2") then
            if patrulhamento[user_id] then
                patrulhamento[user_id] = false
                TriggerClientEvent("Notify",source,"negado","Voce saiu de <b>serviço</b>.", 5000)
                corpoWebHook = { { ["color"] = 6356736, ["title"] = "**".. "TOOGLE | Novo Registro" .."**\n", ["thumbnail"] = { ["url"] = "https://imgur.com/P5q9Z8E" }, ["description"] = "**ID:**\n```cs\n- ID: "..user_id.."  ```\n**STATUS:**\n```cs\n- SAIU DE SERVIÇO ```\n**Horario:**\n```cs\n"..os.date("[%d/%m/%Y as %H:%M]").." ```", ["footer"] = { ["text"] = "Mirt1n Store", }, } }
                
                if vRP.hasPermission(user_id, "perm.policia") then
                    vRPclient.giveWeapons(source, {}, true)
                end
                TriggerEvent("vrp_sysblips:ExitService",source)

                vRP.addUserGroup(user_id, "mecanica")
            else
                if vRP.hasGroup(user_id, "mecanica") then
                    vRP.removeUserGroup(user_id, "mecanica")
                end

                patrulhamento[user_id] = true
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("Notify",source,"sucesso","Voce entrou em <b>serviço</b>.", 5000)
                corpoWebHook = { { ["color"] = 6356736, ["title"] = "**".. "TOOGLE | Novo Registro" .."**\n", ["thumbnail"] = { ["url"] = "https://imgur.com/P5q9Z8E" }, ["description"] = "**ID:**\n```cs\n- ID: "..user_id.."  ```\n**STATUS:**\n```cs\n- ENTROU EM SERVIÇO ```\n**Horario:**\n```cs\n"..os.date("[%d/%m/%Y as %H:%M]").." ```", ["footer"] = { ["text"] = "Mirt1n Store", }, } }
                if vRP.hasPermission(user_id, "perm.policia") then
                    vRP.setPatrulhamento(user_id)
                    TriggerClientEvent("sysblips:ToggleService",source, "Policia" , 3,"Policia")
                else
                  if vRP.hasPermission(user_id, "perm.mecanica") then
                    vRP.setPatrulhamento(user_id)
                     TriggerClientEvent("sysblips:ToggleService",source, "Mecanica" , 3,"Mecanica")
                  end 
                    if vRP.hasPermission(user_id, "perm.unizk") then
                        vRP.setPatrulhamento(user_id)
                        TriggerClientEvent("sysblips:ToggleService",source, "Hospital" , 3,"Hospital")
                    end
                    if vRP.hasPermission(user_id, "perm.disparo") then
                        vRP.setPatrulhamento(user_id)
                        TriggerClientEvent("sysblips:ToggleService",source, "Policia" , 3,"Policia")
                    end
                    if vRP.hasPermission(user_id, "perm.judiciario") then
                        vRP.setPatrulhamento(user_id)
                        TriggerClientEvent("sysblips:ToggleService",source, "Hospital" , 3,"Hospital")
                    end
                    return
                end
            end
            vRP.sendLog("TOOGLE", corpoWebHook, "embeds")
        end
    end
end)



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAGENS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    patrulhamento[user_id] = nil
end)
  
AddEventHandler("vRP:playerLeave",function(user_id,source)
    local data = vRP.getUserDataTable(user_id)
    if patrulhamento[user_id] then
        if not vRP.hasPermission(user_id, "perm.mecanica2") or not vRP.hasPermission(user_id, "perm.unizk") or not vRP.hasPermission(user_id, "perm.policia") or not vRP.hasPermission(user_id, "perm.mecanica") then
            if data then
                data.weapons = {}
            end
        end

        patrulhamento[user_id] = nil
    end
end)