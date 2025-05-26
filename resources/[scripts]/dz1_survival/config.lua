


Config = {} 

Config.limitedevida = 300 -- limite de vida da sua base
Config.permissaoHospital = 'perm.unizk' -- permissao de paramedico da sua base para receber chamado
Config.primeiraPessoa = true -- se quer a primeira pessoa
Config.cutscene = true -- com essa opção true tem uma cutscene pos morte

Config.tempo = { 
    padrao = 500, -- tempo para todos padrao
    especiais = { -- abaixo permissoes caso tenha possibilidade de menos tempo
        { permissao = "mecanico.permissao", tempo = 300 }, -- use os exemplos para configurar como quiser
        { permissao = "paramedico.permissao", tempo = 220 },
    }
}

Config.locais = { 
    padrao = { cds = vec4(297.97, -585.53, 43.27,10.0), nome = "Hospital" }, -- em cds e a localização padrao para renascer
    especiais = { -- abaixo a permissao se o jogador tiver tera mais um local para renascer
        { permissao = "policia.permissao", cds = vec4(457.49, -968.93, 30.71,10.0),nome = 'Delegacia' },
        { permissao = "mecanico.permissao", cds = vec4(-211.44, -1308.67, 31.3,10.0),nome = 'Mecanica' },
    }
}

Config.Commands = {
    [1] = { command = "god", perms = {'admin.permissao'}, log = "sua log do comando aqui" },
    [2] = { command = "godp", perms = {'admin.permissao'}, log = "sua log do comando aqui" },
    [3] = { command = "godall", perms = {'admin.permissao'}, log = "sua log do comando aqui" },
    [4] = { command = "re", perms = {'paramedico.permissao'}, log = "sua log do comando aqui" },
}


Config.npcMedic = { true, "ambulance" } -- se for true e nao tiver paramedico tem medico npc , o segundo valor e o nome da ambulancia do spawn do ve

Config.kill = {
    log = "https://discord.com/api/webhooks/1087095650660913262/-JD2G_h9TTAefHOcPsFsdveev4TnRS9t6OLxXeoCezLOMO_6_JB9FT1Qn1MYigTjBKvg",
    admins = {'admin.permissao'},
    alertInGame = false,
    webhookMensagemKill = "o ID {deathId} foi morto por ID {killerId} usando ARMA {weapon}",
    webhookMensagemSuicide = "o ID {deathId} se suicidou!",
    Weapons = { -- armas para log de kill
        [tostring(GetHashKey('WEAPON_UNARMED'))] = 'Unarmed',
        [tostring(GetHashKey('WEAPON_KNIFE'))] = 'Knife',
        [tostring(GetHashKey('WEAPON_NIGHTSTICK'))] = 'Nightstick',
        [tostring(GetHashKey('WEAPON_HAMMER'))] = 'Hammer',
        [tostring(GetHashKey('WEAPON_BAT'))] = 'Baseball Bat',
        [tostring(GetHashKey('WEAPON_GOLFCLUB'))] = 'Golf Club',
        [tostring(GetHashKey('WEAPON_CROWBAR'))] = 'Crowbar',
        [tostring(GetHashKey('WEAPON_PISTOL'))] = 'Pistol',
        [tostring(GetHashKey('WEAPON_COMBATPISTOL'))] = 'Combat Pistol',
        [tostring(GetHashKey('WEAPON_APPISTOL'))] = 'AP Pistol',
        [tostring(GetHashKey('WEAPON_PISTOL50'))] = 'Pistol .50',
        [tostring(GetHashKey('WEAPON_MICROSMG'))] = 'Micro SMG',
        [tostring(GetHashKey('WEAPON_SMG'))] = 'SMG',
        [tostring(GetHashKey('WEAPON_ASSAULTSMG'))] = 'Assault SMG',
        [tostring(GetHashKey('WEAPON_ASSAULTRIFLE'))] = 'Assault Rifle',
        [tostring(GetHashKey('WEAPON_CARBINERIFLE'))] = 'Carbine Rifle',
        [tostring(GetHashKey('WEAPON_ADVANCEDRIFLE'))] = 'Advanced Rifle',
        [tostring(GetHashKey('WEAPON_MG'))] = 'MG',
        [tostring(GetHashKey('WEAPON_COMBATMG'))] = 'Combat MG',
        [tostring(GetHashKey('WEAPON_PUMPSHOTGUN'))] = 'Pump Shotgun',
        [tostring(GetHashKey('WEAPON_SAWNOFFSHOTGUN'))] = 'Sawed-Off Shotgun',
        [tostring(GetHashKey('WEAPON_ASSAULTSHOTGUN'))] = 'Assault Shotgun',
        [tostring(GetHashKey('WEAPON_BULLPUPSHOTGUN'))] = 'Bullpup Shotgun',
        [tostring(GetHashKey('WEAPON_STUNGUN'))] = 'Stun Gun',
        [tostring(GetHashKey('WEAPON_SNIPERRIFLE'))] = 'Sniper Rifle',
        [tostring(GetHashKey('WEAPON_HEAVYSNIPER'))] = 'Heavy Sniper',
        [tostring(GetHashKey('WEAPON_REMOTESNIPER'))] = 'Remote Sniper',
        [tostring(GetHashKey('WEAPON_GRENADELAUNCHER'))] = 'Grenade Launcher',
        [tostring(GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'))] = 'Smoke Grenade Launcher',
        [tostring(GetHashKey('WEAPON_RPG'))] = 'RPG',
        [tostring(GetHashKey('WEAPON_PASSENGER_ROCKET'))] = 'Passenger Rocket',
        [tostring(GetHashKey('WEAPON_AIRSTRIKE_ROCKET'))] = 'Airstrike Rocket',
        [tostring(GetHashKey('WEAPON_STINGER'))] = 'Stinger [Vehicle]',
        [tostring(GetHashKey('WEAPON_MINIGUN'))] = 'Minigun',
        [tostring(GetHashKey('WEAPON_GRENADE'))] = 'Grenade',
        [tostring(GetHashKey('WEAPON_STICKYBOMB'))] = 'Sticky Bomb',
        [tostring(GetHashKey('WEAPON_SMOKEGRENADE'))] = 'Tear Gas',
        [tostring(GetHashKey('WEAPON_BZGAS'))] = 'BZ Gas',
        [tostring(GetHashKey('WEAPON_MOLOTOV'))] = 'Molotov',
        [tostring(GetHashKey('WEAPON_FIREEXTINGUISHER'))] = 'Fire Extinguisher',
        [tostring(GetHashKey('WEAPON_PETROLCAN'))] = 'Jerry Can',
        [tostring(GetHashKey('OBJECT'))] = 'Object',
        [tostring(GetHashKey('WEAPON_BALL'))] = 'Ball',
        [tostring(GetHashKey('WEAPON_FLARE'))] = 'Flare',
        [tostring(GetHashKey('VEHICLE_WEAPON_TANK'))] = 'Tank Cannon',
        [tostring(GetHashKey('VEHICLE_WEAPON_SPACE_ROCKET'))] = 'Rockets',
        [tostring(GetHashKey('VEHICLE_WEAPON_PLAYER_LASER'))] = 'Laser',
        [tostring(GetHashKey('AMMO_RPG'))] = 'Rocket',
        [tostring(GetHashKey('AMMO_TANK'))] = 'Tank',
        [tostring(GetHashKey('AMMO_SPACE_ROCKET'))] = 'Rocket',
        [tostring(GetHashKey('AMMO_PLAYER_LASER'))] = 'Laser',
        [tostring(GetHashKey('AMMO_ENEMY_LASER'))] = 'Laser',
        [tostring(GetHashKey('WEAPON_RAMMED_BY_CAR'))] = 'Rammed by Car',
        [tostring(GetHashKey('WEAPON_BOTTLE'))] = 'Bottle',
        [tostring(GetHashKey('WEAPON_GUSENBERG'))] = 'Gusenberg Sweeper',
        [tostring(GetHashKey('WEAPON_SNSPISTOL'))] = 'SNS Pistol',
        [tostring(GetHashKey('WEAPON_VINTAGEPISTOL'))] = 'Vintage Pistol',
        [tostring(GetHashKey('WEAPON_DAGGER'))] = 'Antique Cavalry Dagger',
        [tostring(GetHashKey('WEAPON_FLAREGUN'))] = 'Flare Gun',
        [tostring(GetHashKey('WEAPON_HEAVYPISTOL'))] = 'Heavy Pistol',
        [tostring(GetHashKey('WEAPON_SPECIALCARBINE'))] = 'Special Carbine',
        [tostring(GetHashKey('WEAPON_MUSKET'))] = 'Musket',
        [tostring(GetHashKey('WEAPON_FIREWORK'))] = 'Firework Launcher',
        [tostring(GetHashKey('WEAPON_MARKSMANRIFLE'))] = 'Marksman Rifle',
        [tostring(GetHashKey('WEAPON_HEAVYSHOTGUN'))] = 'Heavy Shotgun',
        [tostring(GetHashKey('WEAPON_PROXMINE'))] = 'Proximity Mine',
        [tostring(GetHashKey('WEAPON_HOMINGLAUNCHER'))] = 'Homing Launcher',
        [tostring(GetHashKey('WEAPON_HATCHET'))] = 'Hatchet',
        [tostring(GetHashKey('WEAPON_COMBATPDW'))] = 'Combat PDW',
        [tostring(GetHashKey('WEAPON_KNUCKLE'))] = 'Knuckle Duster',
        [tostring(GetHashKey('WEAPON_MARKSMANPISTOL'))] = 'Marksman Pistol',
        [tostring(GetHashKey('WEAPON_MACHETE'))] = 'Machete',
        [tostring(GetHashKey('WEAPON_MACHINEPISTOL'))] = 'Machine Pistol',
        [tostring(GetHashKey('WEAPON_FLASHLIGHT'))] = 'Flashlight',
        [tostring(GetHashKey('WEAPON_DBSHOTGUN'))] = 'Double Barrel Shotgun',
        [tostring(GetHashKey('WEAPON_COMPACTRIFLE'))] = 'Compact Rifle',
        [tostring(GetHashKey('WEAPON_SWITCHBLADE'))] = 'Switchblade',
        [tostring(GetHashKey('WEAPON_REVOLVER'))] = 'Heavy Revolver',
        [tostring(GetHashKey('WEAPON_FIRE'))] = 'Fire',
        [tostring(GetHashKey('WEAPON_HELI_CRASH'))] = 'Heli Crash',
        [tostring(GetHashKey('WEAPON_RUN_OVER_BY_CAR'))] = 'Run over by Car',
        [tostring(GetHashKey('WEAPON_HIT_BY_WATER_CANNON'))] = 'Hit by Water Cannon',
        [tostring(GetHashKey('WEAPON_EXHAUSTION'))] = 'Exhaustion',
        [tostring(GetHashKey('WEAPON_EXPLOSION'))] = 'Explosion',
        [tostring(GetHashKey('WEAPON_ELECTRIC_FENCE'))] = 'Electric Fence',
        [tostring(GetHashKey('WEAPON_BLEEDING'))] = 'Bleeding',
        [tostring(GetHashKey('WEAPON_DROWNING_IN_VEHICLE'))] = 'Drowning in Vehicle',
        [tostring(GetHashKey('WEAPON_DROWNING'))] = 'Drowning',
        [tostring(GetHashKey('WEAPON_BARBED_WIRE'))] = 'Barbed Wire',
        [tostring(GetHashKey('WEAPON_VEHICLE_ROCKET'))] = 'Vehicle Rocket',
        [tostring(GetHashKey('WEAPON_BULLPUPRIFLE'))] = 'Bullpup Rifle',
        [tostring(GetHashKey('WEAPON_ASSAULTSNIPER'))] = 'Assault Sniper',
        [tostring(GetHashKey('VEHICLE_WEAPON_ROTORS'))] = 'Rotors',
        [tostring(GetHashKey('WEAPON_RAILGUN'))] = 'Railgun',
        [tostring(GetHashKey('WEAPON_AIR_DEFENCE_GUN'))] = 'Air Defence Gun',
        [tostring(GetHashKey('WEAPON_AUTOSHOTGUN'))] = 'Automatic Shotgun',
        [tostring(GetHashKey('WEAPON_BATTLEAXE'))] = 'Battle Axe',
        [tostring(GetHashKey('WEAPON_COMPACTLAUNCHER'))] = 'Compact Grenade Launcher',
        [tostring(GetHashKey('WEAPON_MINISMG'))] = 'Mini SMG',
        [tostring(GetHashKey('WEAPON_PIPEBOMB'))] = 'Pipebomb',
        [tostring(GetHashKey('WEAPON_POOLCUE'))] = 'Poolcue',
        [tostring(GetHashKey('WEAPON_WRENCH'))] = 'Wrench',
        [tostring(GetHashKey('WEAPON_SNOWBALL'))] = 'Snowball',
        [tostring(GetHashKey('WEAPON_ANIMAL'))] = 'Animal',
        [tostring(GetHashKey('WEAPON_COUGAR'))] = 'Cougar'
    }
}

if not IsDuplicityVersion() then 
    local controleEventos = false
    local controleEventos2 = false
    RegisterNetEvent("morte:eventos") -- coloque eventos ou algo na hora que a pessoa morrer ou ser revivida
    AddEventHandler("morte:eventos", function(morto)
        if morto then -- eventos se tiver morto
            controleEventos = false
            if not controleEventos2 then 
                controleEventos2 = true
                TriggerEvent("radio:outServers")
                TriggerServerEvent("pma-voice:muteUpdate", true)
                TriggerServerEvent('pma-voice:toggleMutePlayer', true)
                NetworkSetVoiceActive(false)
            end
        else -- eventos se tiver vivo
            NetworkSetVoiceActive(true)
            if not controleEventos then 
                controleEventos = true
                controleEventos2 = false
                TriggerEvent("resetBleeding")
                TriggerEvent("resetDiagnostic")
                TriggerServerEvent("pma-voice:muteUpdate", false) 
                TriggerServerEvent('pma-voice:toggleMutePlayer', false)
            end
        end
    end)


    AddEventHandler("mirtin_survival:updateArena", function(status)
        TriggerEvent('survival:updateArena',status)
    end)

else
    
    RegisterNetEvent("morte:eventos:sv")
    AddEventHandler("morte:eventos:sv", function()
        local source = source
        local user_id = vRP.getUserId(source)
        if user_id then
            vRP.clearAccount(user_id)
        end
    end)

    RegisterServerEvent("god:reviver") 
    AddEventHandler("god:reviver",function(src)
        local id_player = getUserId(src)
        TriggerClientEvent('dzinv:giveArma',src,true) 
        if id_player then 
            vRP.varyThirst(id_player,100) -- dar 100% de sede para base life
            vRP.varyHunger(id_player,100) -- dar 100% de fome para base life
        end
    end)

    getUserId = function(src)
        return vRP.getUserId(src)
    end

    hasPermission = function(id,perm)
        return vRP.hasPermission(id, perm)
    end

    getUserSource = function(i)
        return vRP.getUserSource(i)
    end

    getUsersByPermission = function(i)
        return vRP.getUsersByPermission(i)
    end

    getUserIdentity = function(id)
        return vRP.getUserIdentity(id)
    end
    
    function getNamePlayer(id) -- forma de pegar o nome de sua base
        if id then
            local identidade = getUserIdentity(id)
            return identidade.nome , identidade.sobrenome
        end
        return 'sem' , 'nome'
    end
    
    function hasPermissions(id,permissao)
        for k, v in pairs(permissao) do
            if hasPermission(id,tostring(v),false) then 
                return true
            end
        end
        return false
    end
    
    function setArmour(src,v) -- forma de dar colete via server de sua base
        return vRPclient._setArmour(src,v) or vRP.SetArmour(src,v)
    end
    
    function setHealth(src,v) -- sua função de dar vida ao jogador via server
        return  vRPclient._setHealth(src,v) or vRPclient.SetHealth(src,v)
    end
    
    function killGod(src) -- função de killgod de sua base para reviver o ped
        return vRPclient.killGod(src)
    end

    function playAnim(src,a,a2,a3,a4,re) -- forma de animação via server de sua base
        if re then 
            return vRPclient._playAnim(src,false,{{a,a2},{a3,a4}},true) or vRPclient.playAnim(src,false,{a,a2},{a3,a4},true)
        end
        return vRPclient._playAnim(src,false,{{a,a2}},false) or vRPclient.playAnim(src,false,{a,a2},false)
    end

    function getInventoryItemAmount(id)
        return vRP.getInventoryItemAmount(id,'apple_watch') > 0 
    end
end

return Config
