
local minerios = {
    "bronze",
    "ferro",
     "ouro",
    "diamante",
    "rubi",
    "safira"
}



RegisterTunnel.checkPayment = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local item = math.random(1,#minerios)
        local quantidade = math.random(1,5)
        if vRP.computeInvWeight(user_id)+vRP.getItemWeight(minerios[item])*parseInt(quantidade) <= vRP.getInventoryMaxWeight(user_id) then -- CASO ESTIVER CHEIO
            vRP.giveInventoryItem(user_id, minerios[item], quantidade, true)
        end
    end
end