local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
local Tools = module("vrp", "lib/Tools")
vRP = Proxy.getInterface("vRP")
src = {}
Tunnel.bindInterface("zo_porte", src)
Proxy.addInterface("zo_porte", src)
vSERVER = Tunnel.getInterface("zo_porte")

function close()
    SetNuiFocus(false, false)
    zof._DeletarObjeto()
    zof._stopAnim(false)
    SendNUIMessage({type = 'fecharQuizPorte'})
    ClearPedTasks(PlayerPedId())
end
Citizen.CreateThread(function()
    close()
    RegisterCommand(cfg.comandoVerificarPortePolicia, function() src.abrirPorte(true) end)
    RegisterCommand(cfg.comandoVerPorte, function() src.abrirPorte(false) end)
    RegisterCommand(cfg.comandoLiberarPorte, function() vSERVER.setarPorte() end)
    RegisterCommand(cfg.comandoRemoverPorte, function() vSERVER.removerPorte() end)
end)
RegisterNUICallback("ButtonClick", function(data, cb)
    if data.action == "fecharQuizPorte" then close() end
    if data.action == "iniciar-teste-teorico" then
        vSERVER.verificarTesteTeorico()
    end
    if data.action == "iniciar-teste-pratico" then
        vSERVER.verificarTestePratico()
    end
    if data.action == "resultado-teste-teorico" then
        vSERVER.resultadoTesteTeorico(data.resultado)
    end
end)

function src.iniciarTesteTeorico()
    SetNuiFocus(true, true)
    SendNUIMessage({type = "iniciar-teste-teorico"})
end

function src.abrirPorte(pVerPortePolicia)
    local dados = nil
    dados = vSERVER.getDadosPorte(pVerPortePolicia)
    if dados ~= false then
        zof._CarregarObjeto("amb@world_human_stand_mobile@female@text@base", "base", "p_ld_id_card_01", 49, 28422)
        if dados.foto == nil or dados.foto == "" then
            dados.foto = "https://www.moxtra.com/service/themes/images/default/avatar-single-360.png"
        end
        SetNuiFocus(true, true)
        SendNUIMessage({type = "ver-porte", dados = dados})
    end
end
Citizen.CreateThread(function()
    while true do
        local wait = 1000
        local ped = PlayerPedId()
        local blipPratico = cfg.localBlipTestePratico
        local blipTeorico = cfg.localBlipTesteTeorico
        local cdsPlayer = GetEntityCoords(ped)
        local cdsPratico = vector3(blipPratico.x, blipPratico.y, blipPratico.z)
        local distancePratica = #(cdsPlayer - cdsPratico)
        local cdsTeorico = vector3(blipTeorico.x, blipTeorico.y, blipTeorico.z)
        local distanceTeorico = #(cdsPlayer - cdsTeorico)
        if distancePratica < 10 then
            wait = 5
            DrawMarker(21, blipPratico.x, blipPratico.y, blipPratico.z - 0.6, 0, 0, 0, 0.0, 0, 0, 0.5, 0.5, 0.4, 0, 0, 255, 50, 0, 0, 0, 1)
            if IsControlJustPressed(1, 38) and distancePratica < 2 then
                zof._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", "prop_cs_tablet", 49, 28422)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    type = "abrirPraticaPorte",
                    valor = cfg.precoProvaPratica,
                    laudo = cfg.itemLaudoProvaTeorica.gerarLaudo
                })
            end
        end
        if distanceTeorico < 10 then
            wait = 5
            DrawMarker(21, blipTeorico.x, blipTeorico.y, blipTeorico.z - 0.6, 0, 0, 0, 0.0, 0, 0, 0.5, 0.5, 0.4, 0, 0, 255, 50, 0, 0, 0, 1)
            if IsControlJustPressed(1, 38) and distanceTeorico < 2 then
                zof._CarregarObjeto("amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", "prop_cs_tablet", 49, 28422)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    type = "abrirQuizPorte",
                    valor = cfg.precoProvaTeorica
                })
            end
        end
        Citizen.Wait(wait)
    end
end)
function random(tb)
    local keys = {}
    for k in pairs(tb) do table.insert(keys, k) end
    return tb[keys[math.random(1, #keys)]]
end
-- local shotT2 = {
--     x = 13.611126899719,
--     y = -1097.2608642578,
--     z = 29.834735870361,
--     h = 340.15747070313
-- }
-- local t2 = {
--     {x = 19.31, y = -1069.66, z = 29.84}, {x = 22.15, y = -1070.59, z = 29.84},
--     {x = 25.04, y = -1071.73, z = 29.84},
--     {x = 13.340914726257, y = -1089.0189208984, z = 29.845031738281},
--     {x = 16.22508430481, y = -1089.9288330078, z = 29.845054626465},
--     {x = 19.011026382446, y = -1091.0222167969, z = 29.845048904419},
--     {x = 23.917650222778, y = -1083.1088867188, z = 29.845048904419},
--     {x = 21.239490509033, y = -1082.1401367188, z = 29.845048904419},
--     {x = 18.379222869873, y = -1081.1363525391, z = 29.845048904419},
--     {x = 16.544593811035, y = -1080.4211425781, z = 29.845052719116},
--     {x = 14.653549194336, y = -1079.7932128906, z = 29.845052719116},
--     {x = 14.295181274414, y = -1089.3125, z = 29.844982147217},
--     {x = 17.158149719238, y = -1090.3665771484, z = 29.845052719116},
--     {x = 24.80193901062, y = -1071.7053222656, z = 29.845052719116},
--     {x = 21.277896881104, y = -1070.3050537109, z = 29.845048904419},
--     {x = 22.188034057617, y = -1070.66796875, z = 29.845052719116},
--     {x = 23.14471244812, y = -1071.095703125, z = 29.845052719116}
-- }
-- local shotT = {x = 821.477, y = -2163.663, z = 29.657, h = 181.556}
-- local t = {
--     {x = 826.701, y = -2171.449}, {x = 824.588, y = -2171.393},
--     {x = 822.058, y = -2171.258}, {x = 819.853, y = -2171.35},
--     {x = 817.223, y = -2171.293}, {x = 816.428, y = -2180.542},
--     {x = 818.678, y = -2180.556}, {x = 821.051, y = -2180.49},
--     {x = 823.112, y = -2180.499}, {x = 825.06, y = -2180.514},
--     {x = 826.297, y = -2180.558}, {x = 826.784, y = -2191.586},
--     {x = 824.875, y = -2191.548}, {x = 823.196, y = -2191.56},
--     {x = 821.123, y = -2191.599}, {x = 819.525, y = -2191.561},
--     {x = 818.209, y = -2191.575}, {x = 816.858, y = -2191.564}
-- }
local score = 0
local sequenceShots = {}
function isMale()
    local hashSkinMale = GetHashKey("mp_m_freemode_01")
    local hashSkinFemale = GetHashKey("mp_f_freemode_01")
    
    if GetEntityModel(PlayerPedId()) == hashSkinMale then
        return true
    elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
        return false
    end
end
function ReqAnimDict(animDict)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
end
function TargetSpawn(x, y, z, a, v)
    local model = GetHashKey("prop_range_target_01")
    local shot = 0
    RequestModel(model)
    while (not HasModelLoaded(model)) do Wait(1) end
    local obj = CreateObject(model, x, y, z, true, true, true)
    SetEntityProofs(obj, false, true, false, false, false, false, 0, false)
    SetEntityRotation(obj, GetEntityRotation(obj) + vector3(-90, 0.0, 0))
    local r = -90
    PlaySoundFrontend(-1, "SHOOTING_RANGE_ROUND_OVER", "HUD_AWARDS", 1)
    while r ~= 0 do
        SetEntityRotation(obj, GetEntityRotation(obj) + vector3(9, 0.0, 0))
        r = r + 9
        Wait(1)
    end
    DeleteEntity(obj)
    Citizen.Wait(1)
    local obj = CreateObject(model, x, y, z, true, true, true)
    local fin = 0
    while shot < a do
        Citizen.Wait(0)
        fin = fin + 1
        if IsPedShooting(GetPlayerPed(-1)) then
            Wait(100)
            if fin > v then
                PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET",
                                  1)
                shot = shot + 100
                table.insert(sequenceShots, false)
            elseif HasEntityBeenDamagedByWeapon(obj, 0, 2) then
                PlaySoundFrontend(-1, "HACKING_SUCCESS", 0, 1)
                shot = shot + 1
                score = score + 1
                table.insert(sequenceShots, true)
                ClearEntityLastDamageEntity(obj)
            elseif not HasEntityBeenDamagedByWeapon(obj, 0, 2) then
                PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET",
                                  1)
                shot = shot + 1
                table.insert(sequenceShots, false)
            end
        elseif fin > v then
            PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
            shot = shot + 100
            table.insert(sequenceShots, false)
        end
    end
    while r ~= -90 do
        SetEntityRotation(obj, GetEntityRotation(obj) - vector3(5, 0.0, 0))
        r = r - 5
        Wait(1)
    end
    DeleteEntity(obj)
    SetModelAsNoLongerNeeded(model)
end
function src.realizarTestePratico()
    close()
    vSERVER.setPlayerStand(PlayerPedId())
    vSERVER.setInPorte(true)
    -- SetPedInfiniteAmmo(GetPlayerPed(-1), true, GetHashKey(cfg.armaTestePratico))
    SetPedInfiniteAmmoClip(PlayerPedId(), true)
    SetPlayerControl(PlayerId(), true)
    local x = 1
    local T = 500
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
    score = 0
    SetNuiFocus(false, false)
    zof.giveWeapons(cfg.armaTestePratico, 100)
    GiveWeaponToPed(ped, GetHashKey(cfg.armaTestePratico), 100, false, true)
    SetCurrentPedWeapon(ped, GetHashKey(cfg.armaTestePratico), true)
    Citizen.Wait(400)
    local timer = 2000
    DoScreenFadeOut(timer)
    Wait(4000)
    if isMale() then
        SetPedPropIndex(ped, 0, 0, 0, true)
        SetPedPropIndex(ped, 1, 15, 0, true)
    else
        SetPedPropIndex(ped, 0, 0, 0, true)
        SetPedPropIndex(ped, 1, 25, 0, true)
    end
    local shotT2 = cfg.configuracaoTestePratico.cordenadaDeTiro
    SetEntityHeading(PlayerPedId(), shotT2.h)
    SetEntityCoordsNoOffset(PlayerPedId(), shotT2.x, shotT2.y, shotT2.z, 0)
    FreezeEntityPosition(ped, true)
    ReqAnimDict("anim@deathmatch_intros@1hmale")
    TaskPlayAnim(ped, "anim@deathmatch_intros@1hmale", "intro_male_1h_d_trevor", 8.0, 5.0, -1, true, 1, 0, 0, 0)
    DoScreenFadeIn(timer)
    Citizen.Wait(10000)
    ClearPedTasks(ped)
    RemoveAnimDict("anim@deathmatch_intros@1hmale")
    SendNUIMessage({ type = "pistaFria" })
    while x == 1 do
        Wait(5)
        if IsControlJustPressed(1, 38) then
            sequenceShots = {}
            SetNuiFocus(false, false)
            SendNUIMessage({ type = "pistaQuente" })
            score = 0
            PlaySoundFrontend(-1, "Checkpoint_Hit", "GTAO_FM_Events_Soundset", 0)
            Wait(1000)
            PlaySoundFrontend(-1, "Checkpoint_Hit", "GTAO_FM_Events_Soundset", 0)
            Wait(1000)
            PlaySoundFrontend(-1, "CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", 0)
            Wait(1000)
            for i = 1, 10 do
                local spawn = random(cfg.configuracaoTestePratico.cordenadaAlvos)
                TargetSpawn(spawn.x, spawn.y, spawn.z, 1, 100)
                SendNUIMessage({type = "atualizar-pista", score = sequenceShots})
                Wait(1000)
            end
            x = 2
        end
        if IsControlJustPressed(1, 105) then x = 2 end
    end
    DoScreenFadeOut(timer)
    Wait(4000)
    if isMale() then
        SetPedPropIndex(ped, 0, 8, 0, true)
        SetPedPropIndex(ped, 1, 0, 0, true)
    else
        SetPedPropIndex(ped, 0, 0, 0, true)
        SetPedPropIndex(ped, 1, 57, 0, true)
    end
    FreezeEntityPosition(ped, false)
    SetEntityHeading(PlayerPedId(), 180.0)
    SetEntityCoordsNoOffset(PlayerPedId(), coords, 0)
    ReqAnimDict("switch@franklin@chopshop")
    TaskPlayAnim(ped, "switch@franklin@chopshop", "checkshoe", 8.0, 5.0, -1, true, 1, 0, 0, 0)
    SetPedAmmo(PlayerPedId(), GetHashKey(cfg.armaTestePratico), 0)
    SendNUIMessage({ type = "fechar-pista" })
    -- SetPedInfiniteAmmo(GetPlayerPed(-1), false, GetHashKey(cfg.armaTestePratico))
    SetPedInfiniteAmmoClip(PlayerPedId(), false)
    SetPedAmmo(PlayerPedId(), GetHashKey(cfg.armaTestePratico), 0)
    RemoveWeaponFromPed(ped, GetHashKey(cfg.armaTestePratico))
    
    DoScreenFadeIn(timer)
    Wait(4000)
    ClearPedTasks(ped)
    vSERVER.setInPorte(false)
    vSERVER.returnPlayerStand()
    local aprovado = score >= cfg.configuracaoTestePratico.quantidadeAcertosParaPassar
    vSERVER.resultadoTestePratico(aprovado)
end
Citizen.CreateThread(function()
    if cfg.localBlipTesteTeorico.blipNoMapa.geralBlip then
        local blip = cfg.localBlipTesteTeorico.blipNoMapa
        local nblip = AddBlipForCoord(cfg.localBlipTesteTeorico.x, cfg.localBlipTesteTeorico.y, cfg.localBlipTesteTeorico.z)
        SetBlipSprite(nblip, blip.id)
        SetBlipDisplay(nblip, 4)
        SetBlipScale(nblip, blip.scale)
        SetBlipColour(nblip, blip.colour)
        SetBlipAsShortRange(nblip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blip.title)
        EndTextCommandSetBlipName(nblip)
    end
    if cfg.localBlipTestePratico.blipNoMapa.geralBlip then
        local blip = cfg.localBlipTestePratico.blipNoMapa
        local nblip = AddBlipForCoord(cfg.localBlipTestePratico.x, cfg.localBlipTestePratico.y, cfg.localBlipTestePratico.z)
        SetBlipSprite(nblip, blip.id)
        SetBlipDisplay(nblip, 4)
        SetBlipScale(nblip, blip.scale)
        SetBlipColour(nblip, blip.colour)
        SetBlipAsShortRange(nblip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blip.title)
        EndTextCommandSetBlipName(nblip)
    end
end)