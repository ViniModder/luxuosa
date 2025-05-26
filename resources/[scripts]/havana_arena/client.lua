
local in_arena = 0
local time_arena = 0
local openedCoords
local arenaCoords

local reasonDeath
local pedKiller
local Killer
local cooldown = 0
local cooldownBoard = 0
local morto = false

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARENA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000

        if in_arena == 0 then
            local ped = PlayerPedId()
            local playercoords = GetEntityCoords(ped)
            local vida = GetEntityHealth(ped)

            for k,v in pairs(config.locArenas) do
                local distance = #(playercoords - v)
                if distance <= 15.0 then
                    time = 0
                    config.drawMarker(v)
                   -- mBMarker(v, 1.0, 1.0, 0.5, 'arena', 'PvP')
                    if distance <= 2.0 then
                        if IsControlJustPressed(0,38) and vida > 101 then
                            openedCoords = v
                            openNui()
                        end
                    end
                end
            end
        end

        Citizen.Wait(time)
    end
end)


function mBMarker(vector, sizex, sizey, sizez, src, id)
    if not HasStreamedTextureDictLoaded(src) then
        RequestStreamedTextureDict(src, true)
        while not HasStreamedTextureDictLoaded(src) do
            Wait(1)
        end
    else
        local x,y,z = table.unpack(vector)
        DrawMarker(9, x, y, z, 0.0, 0.0, 0.0, tonumber('90.0'), tonumber('90.0'), 0.0, sizex, sizey, sizez, 255, 255, 255, 255,false, true, 2, true, src, id, false)
    end
end    

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
src.setArena = function(id, coords)
    DoScreenFadeOut(1000)
    in_arena = parseInt(id)

    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), coords[1],coords[2],coords[3])
    arenaCoords = { coords[1],coords[2],coords[3] }

    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    time_arena = vSERVER.getTimeArena(in_arena)

    async(function()
        while in_arena > 0 do
            time_arena = time_arena - 1

            if time_arena >= 0 then
                SendNUIMessage({ contadorArena = true, tempo = time_arena })
            end

            Citizen.Wait(1000)
        end
    end)
end

src.removePlayerArena = function()
    DoScreenFadeOut(1000)
    RemoveAllPedWeapons(PlayerPedId(),true)

    Wait(1000)
    in_arena = tonumber(0)
    closeAllNuis()

    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), openedCoords[1],openedCoords[2],openedCoords[3])

    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
end

Citizen.CreateThread(function()
    while true do
        if in_arena > 0 then
            time_arena = vSERVER.getTimeArena(in_arena)
        end
        
        Citizen.Wait(60*1000)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NUIS CALL BACKS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeNui", function(data, cb)
	closeNui()
end)

RegisterNUICallback("entrarArena", function(data, cb)
  --  if not vRP.getStateBase() then return end
    vSERVER.apostarArena(data.arena)
end)



RegisterNUICallback("Startaimlab", function(data, cb)
  --  if not vRP.getStateBase() then return end
    TriggerEvent("Big-pvp:client:enterAimLab","baloon")
end)


RegisterNUICallback("Startrolas", function(data, cb)
   -- if not vRP.getStateBase() then return end
    TriggerEvent("Big-pvp:client:enterAimLab","npc")
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS NUIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function openNui()
 --   if not vRP.getStateBase() then return end
    local arenas = vSERVER.showNuiArena()
    if arenas then
        SetNuiFocus(true,true)
		TransitionToBlurred(1000)
		SendNUIMessage({ showArena = true, arenas = arenas })
    end
end

function closeNui()
    SetNuiFocus(false, false)
    TransitionFromBlurred(1000)
    SendNUIMessage({ closeArena = true })
end

function closeAllNuis()
    SetNuiFocus(false, false)
    TransitionFromBlurred(1000)
    SendNUIMessage({ closeArena = true })
    SendNUIMessage({ closeContadorArena = true })
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONTROLADOR DE KILLS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000

        if in_arena > 0  then
            local ped = PlayerPedId()
            local vida = GetEntityHealth(ped)
            local x,y,z = table.unpack(GetEntityCoords(ped,true))
            time = 150

            if IsEntityDead(ped) then
                time = 0
                if GetPedCauseOfDeath(ped) ~= 0 and cooldown == 0 then
                    cooldown = 2
                    if not morto then
                        reasonDeath = GetPedCauseOfDeath(ped)
                        pedKiller = GetPedSourceOfDeath(ped)
        
                        if IsEntityAPed(pedKiller) and IsPedAPlayer(pedKiller) then
                            Killer = NetworkGetPlayerIndexFromPed(pedKiller)
                        elseif IsEntityAVehicle(pedKiller) and IsEntityAPed(GetPedInVehicleSeat(pedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(pedKiller, -1)) then
                            Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(pedKiller, -1))
                        end
                        
                        sendToLog(PlayerId(), reasonDeath, Killer)
                    end
                end

                NetworkResurrectLocalPlayer(x,y,z,true,true, false)
                SetEntityHealth(ped, 101)
            end
			
			 if vida < 101 then
				time = 0
				
				NetworkResurrectLocalPlayer(x,y,z,true,true, false)
				SetEntityHealth(ped, 101)
             end

            if vida <= 101 and not morto then
                morto = true
                SetEntityHealth(ped, 101)
            end

            if morto then
                time = 0

                if vida <= 101 then
                    SetPedToRagdoll(ped, 1500, 1500,0, 0, 0, 0)
                end
                
                config.drawTxt()
                if IsControlJustPressed(0, config.keys['spawn']) and morto then
                    morto = false
                    
                    Wait(1000)
                    local coords,health = vSERVER.randomSpawn()
                    if coords then
                        SetEntityCoords(PlayerPedId(), coords[1],coords[2],coords[3])
                        SetEntityHealth(ped, health)
                    end
                end
            end

            if arenaCoords ~= nil then
                local distance = #(GetEntityCoords(PlayerPedId()) - vec3(arenaCoords[1],arenaCoords[2],arenaCoords[3]))
                if distance >= config.rangeDistance then
                    SetEntityCoords(PlayerPedId(), arenaCoords[1],arenaCoords[2],arenaCoords[3])
                end
            end
        end
        
        Citizen.Wait(time)
    end
end)

sendToLog = function(idMorto, arma, quemMatou)
    local source = 0
    local ksource = 0

    if idMorto ~= 0 then
        source = GetPlayerServerId(idMorto)
    end

    if quemMatou ~= 0 then
        ksource = GetPlayerServerId(quemMatou)
    end
    
    if source then
        vSERVER.receberMorte(source, arma, ksource)
    end
end

function src.sendChatKill(kName, nName, arma, delay)
    SendNUIMessage({ chatKill = true, killer = kName, vitima = nName, arma = arma, delay = delay })
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SCOREBOARD
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local pressionado = false

Citizen.CreateThread(function()
    while true do
        local time = 1000
        if in_arena > 0  then
            time = 5

            if IsControlPressed(0, config.keys['scoreboard']) then
                if not pressionado and cooldownBoard <= 0 then
                    cooldownBoard = 1
                    pressionado = true
                    
                    local dados,user_list = vSERVER.scoreBoard(in_arena)
                    if dados and user_list then
                        SendNUIMessage({ scoreboard = true, dados = dados, user_list = user_list })
                    end
                end
            else
                if pressionado then
                    pressionado = false
                    SendNUIMessage({ closeScoreboard = true })
                end
            end
        end

        Citizen.Wait(time)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONTADOR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000
        
        if cooldown > 0 then
            cooldown = cooldown - 1

            if cooldown <= 0 then
                cooldown = 0
            end
        end

        if cooldownBoard > 0 then
            cooldownBoard = cooldownBoard - 1

            if cooldownBoard <= 0 then
                cooldownBoard = 0
            end
        end

        Citizen.Wait(time)
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end

function src.inArena()
    return in_arena > 0
end