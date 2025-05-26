------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HEALTH SYSTEM
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function tvRP.varyHealth(variation)
--     local ped = PlayerPedId()
--     local n = math.floor(GetEntityHealth(ped)+variation)
--     SetEntityHealth(ped,n)
-- end

-- function tvRP.getHealth()
--     return GetEntityHealth(PlayerPedId())
-- end

-- function tvRP.setHealth(health)
--     local n = math.floor(health)
--     SetEntityHealth(PlayerPedId(),n)
-- end

-- function tvRP.setFriendlyFire(flag)
--     NetworkSetFriendlyFireOption(flag)
--     SetCanAttackFriendly(PlayerPedId(),flag,flag)
-- end



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
-- function drawTxt(text,font,x,y,scale,r,g,b,a)
--     SetTextFont(font)
--     SetTextScale(scale,scale)
--     SetTextColour(r,g,b,a)
--     SetTextOutline()
--     SetTextCentre(1)
--     SetTextEntry("STRING")
--     AddTextComponentString(text)
--     DrawText(x,y)
-- end

-- -------------------------------------------------------------------------------------------------------------------------------------
-- --[ NETWORKRESSURECTION ]------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------
-- function tvRP.killGod()
--     nocauteado = false
--     local ped = PlayerPedId()
--     local x,y,z = table.unpack(GetEntityCoords(ped))
--     NetworkResurrectLocalPlayer(x,y,z,true,true,false)
--     ClearPedBloodDamage(ped)
--     SetEntityInvincible(ped,false)
--     SetEntityHealth(ped,400)
--     ClearPedTasks(ped)
--     ClearPedSecondaryTask(ped)
-- end