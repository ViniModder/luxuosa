

 -----------------------------------------------------------------------------------------------------------------------------------------
 -- CARREGAR
 -----------------------------------------------------------------------------------------------------------------------------------------
 RegisterCommand("carregar", function(source, args)
    if not carryingBackInProgress then
        if not incorda then
            if vTunnel.checkItem2() then
                carryingBackInProgress = true
                local player = PlayerPedId()
                TriggerEvent('cancelando', true)
                lib = 'missfinale_c2mcs_1'
                anim1 = 'fin_c2_mcs_1_camman'
                lib2 = 'nm'
                anim2 = 'firemans_carry'
                distans = 0.15
                distans2 = 0.27
                height = 0.63
                spin = 0.0
                length = 100000
                controlFlagMe = 49
                controlFlagTarget = 33
                animFlagTarget = 1
                local closestPlayer = GetClosestPlayer(3)
                if closestPlayer ~= -1 then  -- Verifica se há um jogador próximo
                    local target = GetPlayerServerId(closestPlayer)
                    TriggerServerEvent('carregar_ombro', target, lib, lib2, anim1, anim2, distans, distans2, height, target, length, spin, controlFlagMe, controlFlagTarget, animFlagTarget)
                else
                    TriggerEvent("Notify", "negado", "Ninguém por perto", 5000)
                end
            else
                TriggerEvent("Notify","negado","Você não possui Cordas na mochila.", 5000) 
            end
        else
            TriggerEvent("Notify", "negado", "Você não pode carregar alguém dentro de uma safezone!", 5000)
        end
    else
        carryingBackInProgress = false
        TriggerEvent('cancelando', false)
        ClearPedSecondaryTask(GetPlayerPed(-1))
        DetachEntity(GetPlayerPed(-1), true, false)
        local closestPlayer = GetClosestPlayer(3)
        if closestPlayer ~= -1 then
            local target = GetPlayerServerId(closestPlayer)
            TriggerServerEvent("cmg2_animations:stop479", target)
        end
    end
end)

 
 -----------------------------------------------------------------------------------------------------------------------------------------
 -- SYNC
 -----------------------------------------------------------------------------------------------------------------------------------------
 RegisterNetEvent('cmg2_animations:syncTarget479')
 AddEventHandler('cmg2_animations:syncTarget479', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
 	local playerPed = GetPlayerPed(-1)
 	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
 	carryingBackInProgress = true
 	RequestAnimDict(animationLib)
 	while not HasAnimDictLoaded(animationLib) do
 		Wait(10)
 	end
 	if spin == nil then spin = 180.0 end
 	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
 	if controlFlag == nil then controlFlag = 0 end
 	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
 end)
 -----------------------------------------------------------------------------------------------------------------------------------------
 -- SYNCME
 -----------------------------------------------------------------------------------------------------------------------------------------
 RegisterNetEvent('cmg2_animations:syncMe479')
 AddEventHandler('cmg2_animations:syncMe479', function(animationLib, animation,length,controlFlag,animFlag)
 	local playerPed = GetPlayerPed(-1)
 	RequestAnimDict(animationLib)
 	while not HasAnimDictLoaded(animationLib) do
 		Wait(10)
 	end
 	Wait(500)
 	if controlFlag == nil then controlFlag = 0 end
 	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
 	Wait(length)
 end)
 -----------------------------------------------------------------------------------------------------------------------------------------
 -- CL_STOP
 -----------------------------------------------------------------------------------------------------------------------------------------
 RegisterNetEvent('cmg2_animations:cl_stop479')
 AddEventHandler('cmg2_animations:cl_stop479', function()
 	carryingBackInProgress = false
 	ClearPedSecondaryTask(GetPlayerPed(-1))
 	DetachEntity(GetPlayerPed(-1), true, false)
 end)
 function GetPlayers()
 	local players = {}	
     for _, player in ipairs(GetActivePlayers()) do
       table.insert(players, player)
     end
     return players
 end
 -----------------------------------------------------------------------------------------------------------------------------------------
 -- GETCLOSESTPLAYER
 -----------------------------------------------------------------------------------------------------------------------------------------
 function GetClosestPlayer(radius)
     local players = GetPlayers()
     local closestDistance = -1
     local closestPlayer = -1
     local ply = GetPlayerPed(-1)
     local plyCoords = GetEntityCoords(ply, 0)
     for index,value in ipairs(players) do
         local target = GetPlayerPed(value)
         if(target ~= ply) then
             local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
             local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
             if(closestDistance == -1 or closestDistance > distance) then
                 closestPlayer = value
                 closestDistance = distance
             end
         end
     end
 	if closestDistance <= radius then
 		return closestPlayer
 	else
 		return nil
 	end
 end
 
 exports("setcarregar2", function(status)
 	incorda = status
 end)