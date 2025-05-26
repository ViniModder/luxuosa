local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
GlobalState["RandomIdentifier_roubos"] = math.random(1000) + os.time()
src = {}
trap = {}
Tunnel.bindInterface(GlobalState["RandomIdentifier_roubos"],src)
Tunnel.bindInterface("mirtin_roubos",trap)
Tunnel.bindInterface("vrp_roubos",trap)
Proxy.addInterface(GlobalState["RandomIdentifier_roubos"],src)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local robberyList = {}
local block_roubar = {}
local idgens = Tools.newIDGenerator()
function trap.giveItem(item,tblCfg)
    local source = source
    local user_id = vRP.getUserId(source)

    DropPlayer(source, "KKKKKKKKKKKKKKKKK FRACO")
    vRP.setBanned(user_id,1)

end

local Robbery = {}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.giveItem(item,tblCfg)
    local source = source
    local amount = math.random(tblCfg.minValue,tblCfg.maxValue)
    local user_id = vRP.getUserId(source)
    if user_id then
        if not Robbery[source] then
            print(user_id..' tentando spawnar dinheiro pelo roubos')
            DropPlayer(user_id,"Abuso")
            vRP.setBanned(user_id,1) 
            return 
        end
        if item ~= "dinheirosujo" then 
                DropPlayer(source, "Oops!")
                vRP.setBanned(user_id,1)
            return 
        end
        vRP.giveInventoryItem(user_id, "dinheirosujo", amount, true)
    end
end

function src.checkRobbery(id)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if cfg.locationRoubos[id] == nil then return end

        local tipo = cfg.locationRoubos[id].type
        if tipo ~= nil then
            local infoRoubo = cfg.roubos[tostring(tipo)]
            local itensRoubo = infoRoubo.itens
            local permissRoubo = infoRoubo.permiss
            local inPtr = src.totalPtr()
            
            if permissRoubo ~= "perm.nil" then
                if not vRP.hasPermission(user_id, permissRoubo) then
                    TriggerClientEvent("Notify",source,"negado","Você não possui permissao para roubar esse local.", 5000)
                    return
                end
            end

            for k,v in pairs(itensRoubo) do
                local itemAmount = vRP.getInventoryItemAmount(user_id, v)
                if itemAmount < 1 then
                    block_roubar[parseInt(user_id)] = true
                end
            end
            
            if block_roubar[user_id] then
                TriggerClientEvent("Notify",source,"negado","Você não possui os itens necessarios para roubar esse local.", 5000)
            else
                if robberyList[id] == nil then
                    if inPtr >= infoRoubo.pmPTR then
                        for k,v in pairs(itensRoubo) do vRP.tryGetInventoryItem(user_id, v, 1, true) end

                        if cfg.locationRoubos[id].type == "Loja" then
                            local i = 0
                            while i <= 10 do
                                robberyList[i] = infoRoubo.cooldown
                                i = i + 1
                            end
                        else
                            robberyList[id] = infoRoubo.cooldown
                        end
                        
                        exports["vrp"]:setBlockCommand(user_id, infoRoubo.tempo)
                        if cfg.locationRoubos[id].type == "Caixa Eletronico" then
                            vRP.sendLog("https://discord.com/api/webhooks/1233270405028909197/x0yTjApT6M4ypdpLJNyOIlR7UMabOjaBAEqCaRMcqDvrd3Of29jVH0ekQJwefutnuFKE", "O "..user_id.." está roubando o(a) ("..id..") "..cfg.locationRoubos[id].type.." .")
                        elseif cfg.locationRoubos[id].type == "Registradora" then
                            vRP.sendLog("https://discord.com/api/webhooks/1233270405028909197/x0yTjApT6M4ypdpLJNyOIlR7UMabOjaBAEqCaRMcqDvrd3Of29jVH0ekQJwefutnuFKE", "O "..user_id.." está roubando o(a) ("..id..") "..cfg.locationRoubos[id].type.." .")
                        else
                            vRP.sendLog("https://discord.com/api/webhooks/1233270405028909197/x0yTjApT6M4ypdpLJNyOIlR7UMabOjaBAEqCaRMcqDvrd3Of29jVH0ekQJwefutnuFKE", "O "..user_id.." está roubando o(a) ("..id..") "..cfg.locationRoubos[id].type.." .")
                        end
                        Robbery[source] = true
                        return true
                    else
                        TriggerClientEvent("Notify",source,"negado","Sem policias em patrulhamento no momento. ", 5000)
                    end
                else
                    TriggerClientEvent("Notify",source,"negado","Aguarde <b>"..robberyList[id].." segundo(s)</b> para roubar este local.", 5000)
                end
            end
            

            block_roubar[user_id] = false
        end
    end
end

function src.cancelRobbery()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        exports["vrp"]:setBlockCommand(user_id, 0)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA NOTIFY
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.totalPtr()
    local policia = vRP.getUsersByPermission("perm.policia")	
    local contadorPOLICIA = 0
    for k,v in pairs(policia) do
        local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
        if patrulhamento then
            contadorPOLICIA = contadorPOLICIA + 1
        end
    end
    
    return contadorPOLICIA
end 

function src.alertPolice(x,y,z,blipText, mensagem)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        exports['vrp']:alertPolice({ x = x, y = y, z = z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = blipText, name = mensagem})
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONTADOR DE ROUBOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		
		for k,v in pairs(robberyList) do
			if v > 0 then
				robberyList[k] = v - 10
			end

			if robberyList[k] == 0 then
				robberyList[k] = nil
			end
		end

        Citizen.Wait(10000)
	end
end)



