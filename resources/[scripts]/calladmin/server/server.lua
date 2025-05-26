-- VRP
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")

-- CONNECTION
local Creative = {}
Tunnel.bindInterface("calladmin", Creative)
vCLIENT = Tunnel.getInterface("calladmin")

-- Prepares
vRP._prepare("calladmin/GetRanking", "SELECT * FROM calladminranking ORDER BY user_id")
vRP._prepare("calladmin/Checkuser_id", "SELECT user_id FROM CallAdminRanking WHERE user_id = @user_id")
vRP._prepare("calladmin/AddToRanking", "INSERT INTO CallAdminRanking(user_id, Name,Rating, TotalTicket) VALUES (@user_id, @Name, @Rating, @TotalTicket)")
vRP._prepare("calladmin/IncrementTicket", "UPDATE CallAdminRanking SET TotalTicket = TotalTicket + 1 WHERE user_id = @user_id")
vRP._prepare("calladmin/ResetAll", "DELETE FROM CallAdminRanking")

-- Variables
local Tickets = {}
local Ranking = {}
local Statistics = {
    ['attendedToday'] = 0,
    ['finalizedCalls'] = 0,
    ['canceledCalls'] = 0,
}
local TicketsInfo = {
    ["Total"]     = 0,
    ["Answered"]  = 0,
    ["Finished"]  = 0,
    ["Cancelled"] = 0
}

-- Functions
function isuser_idInRanking(user_id)
    local result = vRP.query("calladmin/Checkuser_id", { user_id = user_id })
    if result[1] then
        return true
    end
    return false
end

function addToRanking(user_id)
    local identity = vRP.getUserIdentity(user_id)
    local Name = identity["nome"] .. " " .. identity["sobrenome"] .. " (" .. user_id .. ")"
    local Rating = 0
    local TotalTicket = 0
    vRP.query("calladmin/AddToRanking", {
        user_id = user_id,
        Name = Name,
        Rating = Rating,
        TotalTicket = TotalTicket,
    })
end

function notifyAdministrator(ticketId)
    local user_id = Tickets[ticketId].user_id
    local Coords = GetEntityCoords(GetPlayerPed(vRP.getUserSource(user_id)))
    local Identity = vRP.getUserIdentity(user_id)
    local playerName = Identity["nome"] .. " " .. Identity["sobrenome"] .. " (" .. user_id .. ")"
    for nuser_id, nsource in pairs(vRP.getUsers()) do
        if vRP.hasPermission(nuser_id, "admin.permissao") or vRP.hasPermission(nuser_id, "moderador.permissao") or vRP.hasPermission(nuser_id, "suporte.permissao") then
            async(function()
                vRPC.PlaySound(nsource, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
                TriggerClientEvent("Notify", nsource, "aviso", playerName .. "<br> " .. Tickets[ticketId].Description, 20000)
                TriggerClientEvent('calladmin:CloseNUI', nsource) -- Fecha a NUI
                TriggerClientEvent("NotifyPush", source, {
                    code = 20,
                    title = "Ajuda (Administração)",
                    text = Tickets[ticketId].Description,
                    x = Coords["x"],
                    y = Coords["y"],
                    z = Coords["z"],
                    name = playerName,
                    time = "Recebido às " .. os.date("%H:%M"),
                    blipColor = 25
                })
            end)
        end
    end
    -- Notificação de sucesso para o jogador
    local playerSource = vRP.getUserSource(user_id)
    if playerSource then
        TriggerClientEvent("Notify", playerSource, "sucesso", "Aguarde um momento enquanto um administrador estiver disponível para atendê-lo!", 30000)
    end
end


function Creative.openDashboard()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id, "suporte.permissao") then
            if not isuser_idInRanking(user_id) then
                addToRanking(user_id)
            end
            Ranking = vRP.query("calladmin/GetRanking")
            table.sort(Ranking, function(a, b)
                return a.user_id < b.user_id
            end)
            return Statistics, Ranking, TicketsInfo, Tickets
        end
    end
    return false
end

function Creative.CreateTicket(type, text)
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local Name = identity["nome"] .. " " .. identity["sobrenome"] .. " (" .. user_id .. ")"
    local id = #Tickets + 1

    Tickets[id] = {
        ['id'] = id,
        ['Type'] = type,
        ['Description'] = text,
        ['user_id'] = user_id,
        ['Status'] = 0,
        ['Admin'] = 0,
        ['Time'] = os.date("%H:%M:%S", os.time()),
        ['Player'] = Name,
        ['staff_id'] = 0
    }
    notifyAdministrator(id)
    local nsource = vRP.getUserSource(user_id) 
    TriggerClientEvent('calladmin:CloseNUI', nsource) 
    TicketsInfo.Total = TicketsInfo.Total + 1
    return id
end


function Creative.CancellTicket(ticketId)
    local source = source
    if Tickets[ticketId] then
        Tickets[ticketId] = nil
        Statistics.canceledCalls = Statistics.canceledCalls + 1
        TicketsInfo.Cancelled = TicketsInfo.Cancelled + 1
        TriggerClientEvent("calladmin:FinishTicket", source)
        return true
    end
    return false
end

function Creative.AnswerTicket(ticketId)
    local source = source
    local user_id = vRP.getUserId(source)
    if Tickets[ticketId] then
        Tickets[ticketId]['Status'] = 1
        Tickets[ticketId]['Admin'] = source
        Tickets[ticketId]['staff_id'] = user_id
        Tickets[ticketId]['AnswerTime'] = os.time()
        Statistics.attendedToday = Statistics.attendedToday + 1
        TicketsInfo.Answered = TicketsInfo.Answered + 1
        local PlayerSource = vRP.getUserSource(Tickets[ticketId]['user_id'])
        local Coords = GetEntityCoords(GetPlayerPed(PlayerSource))
        TriggerClientEvent("calladmin:AnswerTicket", PlayerSource)
        vRP.teleport(source, Coords.x, Coords.y, Coords.z)
        return true
    end
    return false
end

function Creative.FinishTicket(ticketId)
    local source = source
    local user_id = vRP.getUserId(source)
    if Tickets[ticketId] then
        Statistics.finalizedCalls = Statistics.finalizedCalls + 1
        TicketsInfo.Finished = TicketsInfo.Finished + 1
        vRP.query("calladmin/IncrementTicket", { user_id = vRP.getUserId(Tickets[ticketId]['Admin']) })
        local nSource = vRP.getUserSource(parseInt(Tickets[ticketId]['user_id']))
        Tickets[ticketId] = nil
        return true
    end
    return false
end

function Creative.AnswerTicket(ticketId)
    local source = source
    local user_id = vRP.getUserId(source)
    if Tickets[ticketId] then
        -- Solicita confirmação do administrador
        local request = vRP.request(source, "Você deseja aceitar o chamado?", 30)
        
        if request then
            Tickets[ticketId]['Status'] = 1
            Tickets[ticketId]['Admin'] = source
            Tickets[ticketId]['staff_id'] = user_id
            Tickets[ticketId]['AnswerTime'] = os.time()
            Statistics.attendedToday = Statistics.attendedToday + 1
            TicketsInfo.Answered = TicketsInfo.Answered + 1
            
            local PlayerSource = vRP.getUserSource(Tickets[ticketId]['user_id'])
            local Coords = GetEntityCoords(GetPlayerPed(PlayerSource))

            -- Envia a posição do jogador ao administrador
            TriggerClientEvent("calladmin:TeleportToPlayer", source, Coords.x, Coords.y, Coords.z)

            -- Notifica o jogador que o chamado foi aceito
            TriggerClientEvent("calladmin:AnswerTicket", PlayerSource)

            return true
        else
            -- Caso o administrador recuse, pode-se enviar uma notificação ou realizar outra ação
            TriggerClientEvent("Notify", source, "aviso", "Você recusou o chamado.", 5000)
            return false
        end
    end
    return false
end



