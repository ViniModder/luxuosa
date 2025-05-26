-- VRP LIBRARY
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

-- SERVER CONNECTION
vSERVER = Tunnel.getInterface("calladmin")

-- VARIABLES
local CallTypes = {
    ["denounce"] = 1,
    ["staff_id"] = 2,
}
local Player = GetPlayerServerId(PlayerId())
local Statistics, Ranking, TicketsInfo = {}, {}, {}
local isAdmin = false
local ActiveTicket = false

-- FUNCTIONS
function SecondsToMinutes(seconds)
    local minutes = math.floor(seconds / 60)
    local seconds = seconds % 60
    return string.format("%02d:%02d", minutes, seconds)
end

function openTicket()
    if not ActiveTicket then
        if not isAdmin then
            SetNuiFocus(true, true)
        end
        TransitionToBlurred(1000)
        SendNUIMessage({ action = 'getHelpItems', data = { ["items"] = FAQConfig, } })
    end
end

function updateAndSendList(List)
    local Player = GetPlayerServerId(PlayerId())
    for i = #List, 1, -1 do
        if List[i] and List[i]["Status"] ~= 0 and List[i]["Admin"] ~= Player then
            table.remove(List, i)
        end
    end
    Wait(100)
    SendNUIMessage({ action = 'updateList', data = List })
end

-- COMMANDS
RegisterCommand("chamar", openTicket)
RegisterCommand("help", openTicket)
RegisterCommand("ajuda", openTicket)
RegisterCommand("calladm", openTicket)
RegisterCommand("calladmin", openTicket)
RegisterCommand("report", openTicket)
RegisterCommand("denunciar", openTicket)
RegisterCommand("call", openTicket)

-- NUI CALLBACKS
RegisterNUICallback("sendCall", function(Data, Callback)
    if #Data["text"] > 255 then
        TriggerEvent("Notify", "aviso", "A descrição não pode ultrapassar 255 caracteres.", 5000)
        cb(false)
        return
    end
    ActiveTicket = vSERVER.CreateTicket(CallTypes[Data["type"]], Data["text"])
    Wait(200)
    Callback(ActiveTicket)
end)

RegisterNUICallback("close", function(Data, Callback)
    if not ActiveTicket or isAdmin then
        TransitionFromBlurred(1000)
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'setVisible', data = false })
        TriggerServerEvent("calladmin:closeDashBoard")
        isAdmin = false
    end
end)

RegisterNetEvent('calladmin:CloseNUI')
AddEventHandler('calladmin:CloseNUI', function()
    if not ActiveTicket or isAdmin then
        TransitionFromBlurred(1000)
        SetNuiFocus(false, false)
        SendNUIMessage({ action = 'setVisible', data = false })
        TriggerServerEvent("calladmin:closeDashBoard")
        isAdmin = false
    end
end)


RegisterCommand("opendashboard", function(source, args, rawCommand)
    Player = GetPlayerServerId(PlayerId())
    Statistics, Ranking, TicketsInfo, List = vSERVER.openDashboard()

    if Statistics then
        updateAndSendList(List)
        TransitionToBlurred(1000)
        SetNuiFocus(true, true)
        SendNUIMessage({ action = 'openDashboard', data = { ["callsList"] = List, ["statistics"] = Statistics } })
        isAdmin = true
    end
end)

RegisterNUICallback("cancelCall", function(Data, Callback)
    local Cancelled = vSERVER.CancellTicket(parseInt(Data["id"]))
    if Cancelled then
        TransitionFromBlurred(50)
        if not isAdmin then
            SetNuiFocus(false, false)
        end
        ActiveTicket = false
    end
    Callback(Cancelled)
end)

RegisterCommand("cancelCall", function()
    if ActiveTicket then
        vSERVER.CancellTicket(ActiveTicket)
        ActiveTicket = false
        TransitionFromBlurred(1000)
        SetNuiFocus(false, false)
    end
end)


RegisterNUICallback("getCallData", function(Data, Callback)
    Wait(200)
    if not isAdmin then
        SetNuiFocus(false, false)
    end
    TransitionFromBlurred(50)
    Callback({
        time = SecondsToMinutes(parseInt(GlobalState["AnswerTime"])),
        id = ActiveTicket
    })
end)

RegisterNUICallback("callInProgress", function(Data, Callback)
    Callback(vSERVER.AnswerTicket(parseInt(Data["id"])))
end)

RegisterNUICallback("callConcluded", function(Data, Callback)
    Callback(vSERVER.FinishTicket(parseInt(Data["id"])))
end)

RegisterNUICallback("callFeedback", function(Data, Callback)
    TransitionFromBlurred(500)
    if not isAdmin then
        SetNuiFocus(false, false)
    end
    ActiveTicket = false
    Callback(vSERVER.isSolved(Data["id"], Data["isCallResolved"]))
end)

RegisterNUICallback("closeCallModal", function(Data, Callback)
    TransitionFromBlurred(1000)
    if not isAdmin then
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback("getRanking", function(Data, Callback)
    local Stats = {
        Answered = parseInt(TicketsInfo["Total"] / TicketsInfo["Answered"]) .. "%",
        Finished = parseInt(TicketsInfo["Total"] / TicketsInfo["Finished"]) .. "%",
        Cancelled = parseInt(TicketsInfo["Total"] / TicketsInfo["Cancelled"]) .. "%",
    }

    if TicketsInfo["Cancelled"] == 0 then
        Stats["Cancelled"] = "0%"
    end

    Callback({ ranking = Ranking, statistics = Stats })
end)

RegisterNUICallback("getCityName", function(Data, Callback)
    cityName = GetConvar("cityName", "")
    Callback(string.lower(cityName))
end)

-- EVENTS
RegisterNetEvent("calladmin:AnswerTicket")
AddEventHandler("calladmin:AnswerTicket", function(Data)
    SendNUIMessage({ action = 'callAccepted', data = Data })
    ActiveTicket = false
end)

RegisterNetEvent("calladmin:FinishTicket")
AddEventHandler("calladmin:FinishTicket", function()
    SendNUIMessage({ action = 'openCallModal', data = true })
    ActiveTicket = false
end)

RegisterCommand("cancelCall", function()
    print("foxzin")
    TriggerServerEvent("calladmin:closeDashBoard")
end)

-- KEY MAPPINGS
--RegisterKeyMapping("cancelCall", "Cancelar Chamado", "keyboard", "F7")

RegisterKeyMapping("opendashboard", "Abrir o painel de chamados", "keyboard", "F5")



-- Escuta o evento de teletransporte enviado pelo servidor
RegisterNetEvent("calladmin:TeleportToPlayer")
AddEventHandler("calladmin:TeleportToPlayer", function(x, y, z)
    local ped = PlayerPedId()
    SetEntityCoords(ped, x, y, z) -- Teletransporta o administrador para a posição do jogador
    -- Adicione um aviso ou feedback visual
    TriggerEvent("Notify", "sucesso", "Você foi teleportado para o jogador!", 5000)
end)

-- Callback para aceitar o chamado
RegisterNUICallback("callInProgress", function(Data, Callback)
    local result = vSERVER.AnswerTicket(parseInt(Data["id"]))
    if result then
        -- Atualize o UI ou faça outras ações necessárias após a aceitação do chamado
        SendNUIMessage({ action = 'callAccepted', data = { id = Data["id"] } })
    end
    Callback(result)
end)

-- Exemplo de notificação ao aceitar o chamado
RegisterNetEvent("calladmin:AnswerTicket")
AddEventHandler("calladmin:AnswerTicket", function(Data)
    SendNUIMessage({ action = 'callAccepted', data = Data })
    ActiveTicket = false
end)

