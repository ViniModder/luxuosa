local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface(GetCurrentResourceName())
-----------------------------------------------------------------------------------------------------------------------------------------
-- vSync
-----------------------------------------------------------------------------------------------------------------------------------------
CurrentWeather = 'EXTRASUNNY'

AvailableWeatherTypes = {--por clima e esese nomes  
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS',  
    'RAIN',
    'THUNDER',
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}

local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0
local freezeTime = false
local blackout = true

local tempo = false
local clima = false

function ShiftToMinute(minute)
    timeOffset = timeOffset - ( ( (baseTime+timeOffset) % 60 ) - minute )
end

function ShiftToHour(hour)
    timeOffset = timeOffset - ( ( ((baseTime+timeOffset)/60) % 24 ) - hour ) * 60
end


RegisterNetEvent('vSync:freezeClima')
AddEventHandler('vSync:freezeClima', function(args)
    if clima then
        clima = false
        TriggerEvent('Notify', 'sucesso', 'Você desativou o modo de clima.')
        TriggerServerEvent('vSync:requestSync')
    else

        local validWeatherType = false
        if args[1] == nil then
            TriggerEvent('Notify', 'negado', 'Você deve informar o modo do clima, exemplo: /clima <modo>..')
        else
            for i,wtype in ipairs(AvailableWeatherTypes) do
                if wtype == string.upper(args[1]) then
                    validWeatherType = true
                end
            end
            if validWeatherType then
                clima = true
                CurrentWeather = string.upper(args[1])
                TriggerEvent('Notify', 'sucesso', 'Você ativou o modo de clima, para sair digite o mesmo comando.')
            else
                TriggerEvent('Notify', 'negado', 'Você deve informar um modo de clima valido, esse não existe..')
            end
        end
    end
end)

RegisterNetEvent('vSync:freezeTempo')
AddEventHandler('vSync:freezeTempo', function(args)
    if tempo then
        tempo = false
        TriggerEvent('Notify', 'sucesso', 'Você desativou o modo de tempo.')
    else
        if tonumber(args[1]) ~= nil and tonumber(args[2]) ~= nil then
            tempo = true
            local argh = tonumber(args[1])
            local argm = tonumber(args[2])
            if argh < 24 then
                ShiftToHour(argh)
            else
                ShiftToHour(0)
            end
            if argm < 60 then
                ShiftToMinute(argm)
            else
                ShiftToMinute(0)
            end
            local newtime = math.floor(((baseTime+timeOffset)/60)%24) .. ":"
            local minute = math.floor((baseTime+timeOffset)%60)
            if minute < 10 then
                newtime = newtime .. "0" .. minute
            else
                newtime = newtime .. minute
            end
            TriggerEvent('Notify', 'sucesso', 'Você ativou o modo de tempo, para sair digite o mesmo comando.')
        else
            TriggerEvent('Notify', 'negado', 'Você deve informar o horario e minutos, exemplo: /tempo 12 00..')
        end
    end
end)

RegisterNetEvent('vSync:updateWeather')
AddEventHandler('vSync:updateWeather', function(NewWeather, newblackout)
    if not clima then
        CurrentWeather = NewWeather
        blackout = newblackout
    end
end)

Citizen.CreateThread(function()
    while true do
        if lastWeather ~= CurrentWeather then
            lastWeather = CurrentWeather
            SetWeatherTypeOverTime(CurrentWeather, 15.0)
            Citizen.Wait(15000)
        end
        Citizen.Wait(100) -- Wait 0 seconds to prevent crashing.
        SetBlackout(blackout)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(lastWeather)
        SetWeatherTypeNow(lastWeather)
        SetWeatherTypeNowPersist(lastWeather)
        if lastWeather == 'XMAS' then
            SetForceVehicleTrails(true)
            SetForcePedFootstepsTracks(true)
        else
            SetForceVehicleTrails(false)
            SetForcePedFootstepsTracks(false)
        end
    end
end)

RegisterNetEvent('vSync:updateTime')
AddEventHandler('vSync:updateTime', function(base, offset, freeze)
    if not tempo then
        freezeTime = freeze
        timeOffset = offset
        baseTime = base
    end
end)

Citizen.CreateThread(function()
    local hour = 0
    local minute = 0
    while true do
        Citizen.Wait(0)
        local newBaseTime = baseTime
        if GetGameTimer() - 500  > timer then
            newBaseTime = newBaseTime + 0.25
            timer = GetGameTimer()
        end
        if freezeTime then
            timeOffset = timeOffset + baseTime - newBaseTime			
        end
        baseTime = newBaseTime
        hour = math.floor(((baseTime+timeOffset)/60)%24)
        minute = math.floor((baseTime+timeOffset)%60)
        NetworkOverrideClockTime(hour, minute, 0)
    end
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('vSync:requestSync')
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/weather')
    TriggerEvent('chat:addSuggestion', '/time')
    TriggerEvent('chat:addSuggestion', '/freezetime')
    TriggerEvent('chat:addSuggestion', '/freezeweather')
    TriggerEvent('chat:addSuggestion', '/morning')
    TriggerEvent('chat:addSuggestion', '/noon')
    TriggerEvent('chat:addSuggestion', '/evening')
    TriggerEvent('chat:addSuggestion', '/night')
    TriggerEvent('chat:addSuggestion', '/blackout')
end)

-- Display a notification above the minimap.
function ShowNotification(text, blink)
    if blink == nil then blink = false end
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(blink, false)
end

RegisterNetEvent('vSync:notify')
AddEventHandler('vSync:notify', function(message, blink)
    ShowNotification(message, blink)
end)
