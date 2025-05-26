function CreateTunnel.RequestMenu()
    local source = source
    local identity = vRP.getUserIdentity(user_id)
    local user_id = vRP.getUserId(source)
    if not user_id then
        return
    end
    local identity = vRP.getUserIdentity(user_id)
    if not identity then
        return
    end
    local Response = {}
    Response.main = {
        user_id = user_id,
        name = Config.Info.main.name(user_id, source, identity) or "Individo Indigente",
        genre = Config.Info.main.genre(user_id, source) or "Indefinido",
        wallet = Config.Info.main.wallet(user_id, source) or 0,
        bank = Config.Info.main.bank(user_id, source) or 0,
        image = Config.Info.main.image(user_id, source) or "Nenhuma"
    }
    Response.others = {}
    for index in pairs(Config.Info.others) do
        Response.others[index] = Config.Info.others[index](user_id, source, identity)
    end
    Response.amountPlys = GetNumPlayerIndices()
    Response.status = {}
    for index in pairs(Config.Status.list) do
        Response.status[index] = (#Config.Status.func(Config.Status.list[index])) or 0
    end
    Response.maxPlayers = GetConvarInt("sv_maxclients", 2048)
    return Response
end










