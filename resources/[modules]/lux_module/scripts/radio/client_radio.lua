local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')
vSERVER = Tunnel.getInterface('radio')


local privateChannel = {
----------------EMPREGOS LEGAIS ----------------------
  { channel = 1, perm = "perm." },
  { channel = 2, perm = "perm." }, 
  { channel = 3, perm = "perm." },
  { channel = 4, perm = "perm." }, 
  { channel = 5, perm = "perm." },
  { channel = 6, perm = "perm." }, 
  { channel = 7, perm = "perm." },
  { channel = 8, perm = "perm.l" }, 
  { channel = 9, perm = "perm." },
  { channel = 10, perm = "perm." }, 
  { channel = 11, perm = "perm." },
  { channel = 12, perm = "perm." }, 
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 12, perm = "perm." },
  { channel = 157, perm = "perm.dragons" },
  --{ channel = 195, perm = "perm.radioexercito" },
  { channel = 191, perm = "perm.radio" },--------------------------BOPE 
  { channel = 195, perm = "perm.radiofederal" },------------------------FEDERAL
  { channel = 197, perm = "perm.radiocivil" },-------------------CIVIL
  { channel = 190, perm = "perm.radiopmerj" },-----------------PMERJ
  { channel = 192, perm = "perm.radiohp" },-------------------------HSPITAL
  { channel = 193, perm = "perm.radiobombeiros" }, ------------------BOOMBEIRO
  ---------------------------------------------------------
}

local GuiOpened = false

RegisterCommand("radio", function()
  if vRP.getHealth() <= 101 or vRP.isHandcuffed() or IsPauseMenuActive() then
    closeGui()
    TriggerEvent('radio:outServers')
    TriggerEvent('Notify', 'negado', 'Você não pode entrar na radio agora.', 5000)
    return
  end
  if vSERVER.hasRadio() then
    openGui()
  else
    TriggerEvent("Notify", "negado", "Você não possui um rádio", 5000)
  end
  Wait(1)
end)

RegisterNetEvent('Nikito:OpenRadio')
AddEventHandler('Nikito:OpenRadio', function()
  openGui()
end)

function openGui()
  if not GuiOpened then
    GuiOpened = true
    SetNuiFocus(false, false)
    SetNuiFocus(true, true)
    SendNUIMessage({ 'SHOW_NUI', 'radio' })
  else
    GuiOpened = false
    SetNuiFocus(false, false)
    SendNUIMessage({ 'CLOSE_NUI' })
  end
  TriggerEvent("animation:radio", GuiOpened)
end

RegisterNetEvent('ChannelSet')
AddEventHandler('ChannelSet', function(chan)
  SendNUIMessage({ set = true, setChannel = chan })
end)

RegisterNetEvent('radio:resetNuiCommand')
AddEventHandler('radio:resetNuiCommand', function()
  SendNUIMessage({ reset = true })
end)

local notificationDisplayed = false
local timer = nil

function checkPermission(data)
  if privateChannel then
    for k, v in pairs(privateChannel) do
      local selectedChannel = tonumber(data.channel) or nil
      if selectedChannel then
        if tonumber(v.channel) == selectedChannel then
          if not vSERVER.hasPermission(v.perm) then
            if not notificationDisplayed then
              notificationDisplayed = true
              TriggerEvent("Notify", "negado", "Você não tem permissão para entrar nessa frequência.", 5000)
              timer = SetTimeout(500, function()
                notificationDisplayed = false
              end)
            end
            return false
          end
        end
      end
    end
  end
  return true
end

function closeGui()
  if GuiOpened then
    GuiOpened = false
    SetNuiFocus(false, false)
    SendNUIMessage({ 'CLOSE_NUI' })
  end
end

RegisterNetEvent('Nikito:CloseRadio')
AddEventHandler('Nikito:CloseRadio', function()
  if inPhone then
    closeGui()
    inPhone = false
  end
end)

RegisterNUICallback('click', function(data, cb)
  PlaySound(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
end)

local volume = 0.0

RegisterNUICallback('volumeUp', function(data, cb)
  if volume <= 0.9 then
    volume = volume + 0.1
    MumbleSetVolumeOverride(PlayerPedId(), volume)
  else
  end
end)

RegisterNUICallback('volumeDown', function(data, cb)
  if volume >= 0.0 then
    volume = volume - 0.1
    MumbleSetVolumeOverride(PlayerPedId(), volume)
  else
  end
end)

RegisterNUICallback('volume', function(data, cb)
  exports["pma-voice"]:setRadioVolume(tonumber(data.volume))   -- VAI DE 0 A 100
end)

RegisterNUICallback('cleanClose', function(data, cb)
  TriggerEvent("InteractSound_CL:PlayOnOne", "radioclick", 0.6)
  GuiOpened = false
  SetNuiFocus(false, false)
  TriggerEvent("animation:radio", GuiOpened)
end)

RegisterNUICallback('poweredOn', function(data, cb)
  if checkPermission(data) then
    TriggerEvent("InteractSound_CL:PlayOnOne", "radioclick", 0.6)
    local newChannel = tonumber(data.channel)
    if newChannel == nil then
      newChannel = 0
    end

    if newChannel == 0 then
      exports["pma-voice"]:removePlayerFromRadio()
      exports["pma-voice"]:setVoiceProperty('radioEnabled', false)
      TriggerServerEvent("dispatch:GetRadioChannel", newChannel)
      channel = "Desligado"
      TriggerEvent("hud:channel", channel)
      TriggerEvent('DS:setFrequencyRadio','OFF') 
    else
      if vRP.getHealth() <= 101 or vRP.isHandcuffed() or IsPauseMenuActive() then
        TriggerEvent("Notify", "negado", "Você não pode me beijar agora.", 5000)
        return
      end
      TriggerEvent("hud:channel", newChannel)
      TriggerEvent('DS:setFrequencyRadio',parseInt(newChannel))
      exports["pma-voice"]:setRadioChannel(newChannel)
      TriggerServerEvent("dispatch:GetRadioChannel", newChannel)
      exports["pma-voice"]:setVoiceProperty('radioEnabled', true)
    end
  end
end)

RegisterNUICallback('poweredOff', function(data, cb)
  exports["pma-voice"]:removePlayerFromRadio()
  exports["pma-voice"]:setVoiceProperty('radioEnabled', false)
  TriggerServerEvent("dispatch:GetRadioChannel", 0)
  channel = "Desligado"
  TriggerEvent("hud:channel", channel)
  TriggerEvent('DS:setFrequencyRadio','OFF') 
end)

RegisterNUICallback('close', function(data, cb)
  if checkPermission(data) then
    TriggerEvent("InteractSound_CL:PlayOnOne", "radioclick", 0.6)
    local newChannel = tonumber(data.channel)
    if newChannel == nil then
      newChannel = 0
    end

    if newChannel == 0 then
      exports["pma-voice"]:removePlayerFromRadio()
      exports["pma-voice"]:setVoiceProperty('radioEnabled', false)
      channel = "Desligado"
      TriggerEvent("hud:channel", channel)
      TriggerEvent('DS:setFrequencyRadio',parseInt(channel))
      TriggerServerEvent("dispatch:GetRadioChannel", 0)
    else
      TriggerEvent("hud:channel", newChannel)
      TriggerEvent('DS:setFrequencyRadio',parseInt(newChannel))
      exports["pma-voice"]:SetRadioChannel(newChannel)
      exports["pma-voice"]:setVoiceProperty('radioEnabled', true)
      TriggerServerEvent("dispatch:GetRadioChannel", newChannel)
    end

    GuiOpened = false
    SetNuiFocus(false, false)
    SendNUIMessage({ 'CLOSE_NUI' })
    TriggerEvent("animation:radio", GuiOpened)
  end
end)



CreateThread(function()
  while true do
    if GuiOpened then      
      Wait(1)
      DisableControlAction(0, 1, GuiOpened)   -- LookLeftRight
      DisableControlAction(0, 2, GuiOpened)   -- LookUpDown
      DisableControlAction(0, 14, GuiOpened)  -- INPUT_WEAPON_WHEEL_NEXT
      DisableControlAction(0, 15, GuiOpened)  -- INPUT_WEAPON_WHEEL_PREV
      DisableControlAction(0, 16, GuiOpened)  -- INPUT_SELECT_NEXT_WEAPON
      DisableControlAction(0, 17, GuiOpened)  -- INPUT_SELECT_PREV_WEAPON
      DisableControlAction(0, 99, GuiOpened)  -- INPUT_VEH_SELECT_NEXT_WEAPON
      DisableControlAction(0, 100, GuiOpened) -- INPUT_VEH_SELECT_PREV_WEAPON
      DisableControlAction(0, 115, GuiOpened) -- INPUT_VEH_FLY_SELECT_NEXT_WEAPON
      DisableControlAction(0, 116, GuiOpened) -- INPUT_VEH_FLY_SELECT_PREV_WEAPON
      DisableControlAction(0, 142, GuiOpened) -- MeleeAttackAlternate
      DisableControlAction(0, 106, GuiOpened) -- VehicleMouseControlOverride
    else
      Wait(20)
    end
  end
end)

RegisterNetEvent('animation:radio')
AddEventHandler('animation:radio', function(enable)
  local lPed = PlayerPedId()
  inPhone = enable

  RequestAnimDict("cellphone@")
  while not HasAnimDictLoaded("cellphone@") do
    Wait(0)
  end

  local intrunk = false
  if not intrunk then
    TaskPlayAnim(lPed, "cellphone@", "cellphone_text_in", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
  end
  Wait(300)
  if inPhone then
    Wait(150)
    while inPhone do
      local dead = false
      if dead then
        closeGui()
        inPhone = false
      end
      local intrunk = false
      if not intrunk and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_text_read_base", 3) and not IsEntityPlayingAnim(lPed, "cellphone@", "cellphone_swipe_screen", 3) then
        TaskPlayAnim(lPed, "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
      end
      Wait(1)
    end
    local intrunk = false
    if not intrunk then
      ClearPedTasks(PlayerPedId())
    end
  else
    local intrunk = false
    if not intrunk then
      Wait(100)
      ClearPedTasks(PlayerPedId())
      TaskPlayAnim(lPed, "cellphone@", "cellphone_text_out", 2.0, 1.0, 5.0, 49, 0, 0, 0, 0)
      Wait(400)
      Wait(400)
      ClearPedTasks(PlayerPedId())
    end
  end
end)

RegisterNetEvent("radio:outServers")
AddEventHandler("radio:outServers", function()
  exports["pma-voice"]:SetRadioChannel(0)
  exports["pma-voice"]:removePlayerFromRadio()
  exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
  channel = "Desligado"
  TriggerEvent("hud:channel", channel)
  TriggerServerEvent("dispatch:GetRadioChannel", 0)
  TriggerEvent("Notify", "negado", "Você saiu de <b>todas</b> as frequências.", 3000)
end)
-------------------------------------------------------------------------------------
--- COMANDO PARA AUMENTA O VOLUME DA RADIO
-------------------------------------------------------------------------------------
RegisterCommand("volume", function(source, args)
  if vRP.getHealth() <= 101 or vRP.isHandcuffed() or IsPauseMenuActive() then
    TriggerEvent("Notify", "negado", "Você não pode mudar o volume da radio agora", 5000)
    return
  end

  if args[1] then
    local volume = parseInt(args[1])
    if volume <= 100 then
      exports["pma-voice"]:setRadioVolume(volume)
      TriggerEvent("Notify", "sucesso", "<b>Volume:</b> " .. volume .. "%", 5000)
    end
  end
end)
