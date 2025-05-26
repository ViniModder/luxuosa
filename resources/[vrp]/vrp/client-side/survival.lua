local mirt1nsurvival = false -- se for true e para usar o mirt1n survival e se for false nao
if mirt1nsurvival then 
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- HEALTH SYSTEM
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    function tvRP.varyHealth(variation)
        local ped = PlayerPedId()
        local n = math.floor(GetEntityHealth(ped)+variation)
        SetEntityHealth(ped,n)
    end

    function tvRP.getHealth()
        return GetEntityHealth(PlayerPedId())
    end

    function tvRP.setHealth(health)
        local n = math.floor(health)
        SetEntityHealth(PlayerPedId(),n)
    end

    function tvRP.setFriendlyFire(flag)
        NetworkSetFriendlyFireOption(flag)
        SetCanAttackFriendly(PlayerPedId(),flag,flag)
    end

    -----------------------------------------------------------------------------------------------------------------------------------------
    --[ NETWORKRESSURECTION ]----------------------------------------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------------------------------------------------------------
    function tvRP.killGod()
        nocauteado = false
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        NetworkResurrectLocalPlayer(x,y,z,true,true,false)
        ClearPedBloodDamage(ped)
        SetEntityInvincible(ped,false)
        SetEntityHealth(ped,400)
        ClearPedTasks(ped)
        ClearPedSecondaryTask(ped)
    end

    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- MIRTIN SURVIVAL
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    local isComa = false

    AddEventHandler("mirtin_survival:updateComa", function(boolean)
        isComa = boolean
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

else

    function tvRP.varyHealth(variation)
        local ped = PlayerPedId()
        local n = math.floor(GetEntityHealth(ped)+variation)
        SetEntityHealth(ped,n)
    end

    --[ GETHEALTH ]--------------------------------------------------------------------------------------------------------------------------

    function tvRP.getHealth()
        return GetEntityHealth(PlayerPedId())
    end

    --[ SETHEALTH ]--------------------------------------------------------------------------------------------------------------------------

    function tvRP.setHealth(health)
        local n = math.floor(health)
        SetEntityHealth(PlayerPedId(),n)
    end

    --[ SETFRIENDLYFIRE ]--------------------------------------------------------------------------------------------------------------------

    function tvRP.setFriendlyFire(flag)
        NetworkSetFriendlyFireOption(flag)
        SetCanAttackFriendly(PlayerPedId(),flag,flag)
    end


    --[ NOCAUTEVAR ]-------------------------------------------------------------------------------------------------------------------------

    local nocauteado = false
    local deathtimer = 300

    RegisterNetEvent("survival:mudarDeathtimer")
    AddEventHandler("survival:mudarDeathtimer", function(status)
        deathtimer = status
    end)

    --[ NOCAUTEADO ]-------------------------------------------------------------------------------------------------------------------------

    Citizen.CreateThread(function()
        while true do
            local idle = 1000
            local ped = PlayerPedId()
            if GetEntityHealth(ped) <= 101 and deathtimer >= 0 then
                idle = 5
                if not nocauteado then
                    local x,y,z = table.unpack(GetEntityCoords(ped))
                    NetworkResurrectLocalPlayer(x,y,z,true,true,false)
                    
                    deathtimer = 300
                    nocauteado = true
                    TriggerEvent('radio:outServers')
                    SetEntityHealth(ped,101)
                    -- SetEntityInvincible(ped,true)

                    if IsPedInAnyVehicle(ped) then
                        TaskLeaveVehicle(ped,GetVehiclePedIsIn(ped),4160)
                    end
                else
                    SetPedToRagdoll(ped,1000,1000,0,0,0,0)
                    SetEntityHealth(ped,101)
                end
            end
            SetPlayerHealthRechargeMultiplier(PlayerId(),0)
            Citizen.Wait(idle)
        end
    end)

    --[ DRAWTXT ]----------------------------------------------------------------------------------------------------------------------------

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



    --[ ISINCOMA ]---------------------------------------------------------------------------------------------------------------------------

    function tvRP.isInComa()
        return nocauteado
    end

    --[ NETWORKRESSURECTION ]----------------------------------------------------------------------------------------------------------------

    function tvRP.killGod()
        nocauteado = false
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))
        NetworkResurrectLocalPlayer(x,y,z,true,true,false)
        ClearPedBloodDamage(ped)
        SetEntityInvincible(ped,false)
        SetEntityHealth(ped,400)
        ClearPedTasks(ped)
        ClearPedSecondaryTask(ped)
    end


    --[ NETWORKPRISON ]----------------------------------------------------------------------------------------------------------------------

    function tvRP.PrisionGod()
        local ped = PlayerPedId()
        if GetEntityHealth(ped) <= 101 then
            nocauteado = false
            ClearPedBloodDamage(ped)
            SetEntityInvincible(ped,false)
            SetEntityHealth(ped,110)
            ClearPedTasks(ped)
            ClearPedSecondaryTask(ped)
        end
    end
end