

function RegisterTunnel.checkPermission(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if perm == nil or vRP.hasPermission(user_id, perm) then
            return true
        end
    end
end


local desmanchando = {}

function RegisterTunnel.checkVehicleStatus(mPlaca,mName)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        
        if mName == "hornet" or mName == "Hornet" then
            TriggerClientEvent("Notify",source,"negado","Este veiculo nao pode ser desmanchado.", 5000)
            return
        end
        
         if dc ~= nil then
        TriggerClientEvent("Notify",source,"negado","Você não possui 1x Card para desmanchar esse veiculo.", 5000)
            return
        end
        
        local nuser_id = vRP.getUserByRegistration(mPlaca)
        if nuser_id then
            local rows = vRP.query("vRP/get_veiculos_status", {user_id = nuser_id, veiculo = mName})
            if rows[1] then
                if rows[1].status == 0 then
                    desmanchando[mPlaca] = user_id
                    exports["vrp"]:setBlockCommand(user_id, 40)
                    return true
                else
                    TriggerClientEvent("Notify",source,"negado","Este veiculo ja se encontra detido/retido.", 5000)
                end
            end
        else
            TriggerClientEvent("Notify",source,"negado","Este veiculo nao possui nenhum proprietario.", 5000)
        end
    end
end

function RegisterTunnel.pagarDesmanche(mPlaca,mName,mPrice,mVeh)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local nuser_id = vRP.getUserByRegistration(mPlaca)
        if nuser_id then
            if mName == "hornet" or mName == "Hornet" then
                TriggerClientEvent("Notify",source,"negado","Este veiculo nao pode ser desmanchado.", 5000)
                return
            end

            if desmanchando[mPlaca] == user_id then
                exports["vrp"]:setBlockCommand(user_id, 0)
                vRP.execute("vRP/set_status",{ user_id = nuser_id, veiculo = mName, status = 2})
                vRP.giveInventoryItem(user_id, "dinheirosujo", mPrice*0.15, true)

                exports['lux_garages']:deleteVehicle(source, mVeh)
                vRP._stopAnim(false)
                desmanchando[mPlaca] = nil
                vRP.sendLog("DESMANCHE", "O ID: "..user_id.." desmanchou o veiculo do id "..nuser_id.." veiculo: "..mName.." placa: "..mPlaca.." e recebeu $ "..vRP.format(mPrice*0.15))
            else
                print(user_id, "Troxa dupando #DUPANDO")
            end
        else
            TriggerClientEvent("Notify",source,"negado","Este veiculo nao possui nenhum proprietario.", 5000)
        end
    end
end

-- local itensDesmanche = {
--     ["molas"] = 1,
-- }

-- function RegisterTunnel.checkItensD()
--     local source = source
--     local user_id = vRP.getUserId(source)
--     if user_id then
--         local mensagem = ""
--         local status = true

--         for k,v in pairs(itensDesmanche) do
--             if vRP.getInventoryItemAmount(user_id, k) < v then
--                 status = false
--                 --mensagem = mensagem .. "Você não possui "..vRP.getItemName(k).." na quantidade de "..v..".<br>"
--                 TriggerClientEvent("Notify",source,"negado","Você não possui "..vRP.getItemName(k).." na quantidade de "..v..".<br>.", 5000)
--             end

--             if status then
--                 vRP.tryGetInventoryItem(user_id, k, v) 
--             end
--         end

--          if mensagem ~= "" then
--              TriggerClientEvent("Notify",source,"negado",mensagem, 5)
--          end

--          return status
--     end
--end
 