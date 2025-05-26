
userBlock = {}

src.useButton = function(name, bottom)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if userBlock[user_id] and userBlock[user_id] > os.time() then
            TriggerClientEvent("Notify", source, "negado", "Você já solicitou esse interforne recentemente, aguarde para fazer novamente.", 5000)
            return
        end
        local identity = vRP.getUserIdentity(user_id)
        local info = Config[name]
        if info and info['buttons'][bottom] then
            userBlock[user_id] = os.time()+60
            local users = vRP.getUsersByPermission(info['permission'])
            local onlinePlayers = 0
            for k,v in pairs(users) do
                local nplayer = vRP.getUserSource(parseInt(v))
                if nplayer then
                    onlinePlayers = onlinePlayers + 1
                    TriggerClientEvent('Notify', nplayer, 'importante',"O "..identity.nome.." "..identity.sobrenome..info['buttons'][bottom], 5000)
                end
            end
            if onlinePlayers == 0 then
                TriggerClientEvent("Notify", source, "negado", "Não há nenhum membro ou funcionario online para atender à sua solicitação. Por favor, tente novamente mais tarde.", 6000)
            end
        else
            TriggerClientEvent("Notify", source, "negado", "Essa funcionario não possui esse tipo de chamado.", 5000)
        end
    end
end







