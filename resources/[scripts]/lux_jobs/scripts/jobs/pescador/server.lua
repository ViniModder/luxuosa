
local peixes = {
    "pacu",
    "tilapia",
     "salmao" ,
    "tucunare",
    "dourado"
}



RegisterTunnel.givePeixe = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local item = math.random(1,#peixes)
        local quantidade = math.random(1,5)
        if vRP.computeInvWeight(user_id)+vRP.getItemWeight(peixes[item])*parseInt(quantidade) <= vRP.getInventoryMaxWeight(user_id) then -- CASO ESTIVER CHEIO
            vRP.giveInventoryItem(user_id, peixes[item], quantidade, true)
        end
    end
end