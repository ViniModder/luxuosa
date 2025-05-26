-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for i = 1,120 do
		EnableDispatchService(i,false)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- NAO ATIRAR COM RADIO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
		local time = 500
        local ped = PlayerPedId()

		if GetSelectedPedWeapon(ped) ~= -1569615261 then
			time = 5
			 
			if IsEntityPlayingAnim(ped, "random@arrests","generic_radio_enter", 3) then
				DisablePlayerFiring(PlayerId() , true)
			end
		end 

		Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR DIRIGIVEL + NPCS 
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait(0)
        SetTrafficDensity(0.0)
    end
end)

function SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
    SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
end

DisableBikeWings = true --false para usar asas em bicicletas (como opressor)/true para NÃO usar
DisableVehicleJump = true  ---–-false para ativar saltos de carro/true para NÃO ativar saltos de carro (como K2000)
DisableVehicleTransform = true --false para ativar a “transformação” (deluxo por exemplo)/true para NÃO ativá-la
DisableVehicleWeapons = true --false para ativar armas de carro/true para NÃO ativá-lo

CreateThread(function()
    while true do
		local time = 1000
        local playerped = PlayerPedId()
        local vehicle  =   GetVehiclePedIsIn(playerped, true)
        if IsPedInAnyVehicle(playerped, false) then
			time = 0
            if DisableBikeWings then
                DisableControlAction(0, 354, true)
            end

            if DisableVehicleJump then
                DisableControlAction(0, 350, true)
            end

            if DisableVehicleTransform then
                DisableControlAction(0, 357, true)
            end

            local veh = GetVehiclePedIsUsing(playerped)
            if DoesVehicleHaveWeapons(veh) == 1 and DisableVehicleWeapons and vehicleweaponhash ~= 1422046295 then
                vehicleweapon, vehicleweaponhash = GetCurrentPedVehicleWeapon(playerped)
                if vehicleweapon == 1 then
                    DisableVehicleWeapon(true, vehicleweaponhash, veh, playerped)
                    SetCurrentPedWeapon(playerped, GetHashKey("weapon_unarmed"))
                end
            end
        end
        Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESABILITAR A CORONHADA
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
		local ped = PlayerPedId()
		local idle = 1000
		if IsPedArmed(ped,6) then
			idle = 5
            DisableControlAction(0,140,true)
            DisableControlAction(0,141,true)
            DisableControlAction(0,142,true)
		end
		
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if IsPedShooting(PlayerPedId()) then
				ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.01)
				SetGameplayCamShakeAmplitude(0.08)
			end
		end
		Wait(idle)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- NAO RECUPERAR VIDA
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
		SetPlayerHealthRechargeMultiplier(PlayerId(),0)
		Wait(500)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- STAMINA INFINITA
-----------------------------------------------------------------------------------------------------------------------------------------
--  CreateThread(function()
-- 	while true do
--  		RestorePlayerStamina(PlayerId(),1.0)
--          Wait(500)
--      end
--  end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESATIVAR WEAPONS NPCS E DROP
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
        Wait(3000)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FICAR NO BANCO ESCOLHIDO
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local total = 0
    while true do
        local time = 100
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
                if GetIsTaskActive(GetPlayerPed(-1), 165) then
                    SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                end
            end
        end

        Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTOURAR OS PNEUS QUANDO CAPOTA
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local time = 300
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            if GetPedInVehicleSeat(vehicle,-1) == ped then
				time = 100
                local roll = GetEntityRoll(vehicle)
                if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
                    if IsVehicleTyreBurst(vehicle, wheel_rm1, 0) == false then
						SetVehicleTyreBurst(vehicle, 0, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 1, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 2, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 3, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 4, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 5, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 45, 1)
						Wait(100)
						SetVehicleTyreBurst(vehicle, 47, 1)
                    end
                end
            end
        end

		Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER HUD
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	AddTextEntry("FE_THDR_GTAO","LUXUOSA RJ")
	AddTextEntry('PM_PANE_LEAVE', 'Sair')
	ReplaceHudColour(116, 50)
	StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
	SetAudioFlag("PoliceScannerDisabled",true);

	for i = 1,51 do
		if i ~= 10 and i ~= 14 and i ~= 16 and i ~= 19 then
			SetHudComponentPosition(i,  1000.0001, 1000.0001)
		end
	end
	
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.3)
 
	--N_0x4757f00bc6323cfe(-1553120962, 0.0) --------- dano de veiculo talvez
	while true do
		DisableControlAction(0,44,true)
		DisableControlAction(0,36,true)
		DisableControlAction(0,157,false)
		
		N_0xf4f2c0d4ee209e20()
		
		DisableVehicleDistantlights(true)
		DisablePlayerVehicleRewards(PlayerId())
		SetPedSuffersCriticalHits(PlayerPedId(), true)
			
		Wait(5)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- [ AUTO CAPACETE ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread( function()
    while true do
		local time = 1000
        
        local veh = GetVehiclePedIsUsing(PlayerPedId())
        if veh ~= 0 then 
			time = 5
            SetPedConfigFlag(PlayerPedId(),35,false) 
        end

		Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DRIFT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			time = 5
			local vehicle = GetVehiclePedIsIn(PlayerPedId())
			local speed = GetEntitySpeed(vehicle) * 3.6
			if GetPedInVehicleSeat(vehicle,-1) == ped then
				if speed <= 40.0 then
					if IsControlPressed(1,21) then
						SetVehicleReduceGrip(vehicle,true)
					else
						SetVehicleReduceGrip(vehicle,false)
					end
				end
			end
		end
		Wait(time)
	end
end)

local recoil = {
	[453432689] = 0, -- PISTOL
	[3219281620] = 0, -- PISTOL MK2
	[584646201] = 0, -- AP PISTOL
	[2578377531] = 0, -- PISTOL .50
	[324215364] = 0, -- MICRO SMG
	[4024951519] = 0, -- ASSAULT SMG
	[3220176749] = 0, -- ASSAULT RIFLE
	[2937143193] = 0, -- ADVANCED RIFLE
	[2634544996] = 0, -- MG
	[2144741730] = 0, -- COMBAT MG
	[3686625920] = 0, -- COMBAT MG MK2
	[487013001] = 0, -- PUMP SHOTGUN
	[961495388] = 0, -- ASSAULT RIFLE MK2
	[-2084633992] = 0, -- CARBINE RIFLE
	[-86904375] = 0, -- CARBINE RIFLE MK2
	[-1768145561] = 0, -- SPECIAL CARBINE MK2
	[-1075685676] = 0, -- PISTOL MK2
	[1593441988] = 0, -- COMBAT PISTOL
	[-1076751822] = 0, -- SNS PISTOL
	[-771403250] = 0, -- HEAVY PISTOL
	[1432025498] = 0, -- PUMP SHOTGUN MK2
	[2017895192] = 0, -- SAWNOFF SHOTGUN
	[3800352039] = 0, -- ASSAULT SHOTGUN
	[2640438543] = 0, -- BULLPUP SHOTGUN
	[911657153] = 0, -- STUN GUN
	[100416529] = 0, -- SNIPER RIFLE
	[205991906] = 0, -- HEAVY SNIPER
	[177293209] = 0, -- HEAVY SNIPER MK2
	[856002082] = 0, -- REMOTE SNIPER
	[2726580491] = 0, -- GRENADE LAUNCHER
	[1305664598] = 0, -- GRENADE LAUNCHER SMOKE
	[2982836145] = 0, -- RPG
	[1752584910] = 0, -- STINGER
	[1119849093] = 0, -- MINIGUN
	[3218215474] = 0, -- SNS PISTOL
	[1627465347] = 0, -- GUSENBERG
	[3523564046] = 0, -- HEAVY PISTOL
	[2132975508] = 0, -- BULLPUP RIFLE
	[-619010992] = 0, -- MACHINE PISTOL
	[736523883] = 0, -- SMG
	[2024373456] = 0, -- SMG MK2
	[171789620] = 0, -- COMBAT PDW
	[-2066285827] = 0, -- BULLPUP RIFLE MK2
	[137902532] = 0, -- VINTAGE PISTOL
	[2828843422] = 0, -- MUSKET
	[984333226] = 0, -- HEAVY SHOTGUN
	[3342088282] = 0, -- MARKSMAN RIFLE
	[1785463520] = 0, -- MARKSMAN RIFLE MK2
	[1672152130] = 0, -- HOMING LAUNCHER
	[1198879012] = 0, -- FLARE GUN
	[3696079510] = 0, -- MARKSMAN PISTOL
	[1834241177] = 0, -- RAILGUN
	[3675956304] = 0, -- MACHINE PISTOL
	[3249783761] = 0, -- REVOLVER
	[-879347409] = 0, -- REVOLVER MK2
	[4019527611] = 0, -- DOUBLE BARREL SHOTGUN
	[1649403952] = 0, -- COMPACT RIFLE
	[317205821] = 0, -- AUTO SHOTGUN
	[125959754] = 0, -- COMPACT LAUNCHER
	[3173288789] = 0, -- MINI SMG			
	[2725352035] = 0, -- SOCO	
}
	------------------------------------------------------------------------------
	-- DANO POR OSSO + RECOIL CONFIG
	------------------------------------------------------------------------------
	CreateThread(function()
		while true do
			local idle = 100
			if GetVehiclePedIsIn(PlayerPedId()) then
				if IsPedShooting(PlayerPedId()) then
					idle = 5
					local wep = GetSelectedPedWeapon(PlayerPedId())
					if recoil[wep] and recoil[wep] ~= 0 then
						Wait(1000)
						p = GetGameplayCamRelativePitch()
						if not IsPedInAnyHeli(PlayerPedId()) then
							SetGameplayCamRelativePitch(p+recoil[wep], 1.2)
						end
					end
				end
			end
			
			Wait(idle)
		end
	end)