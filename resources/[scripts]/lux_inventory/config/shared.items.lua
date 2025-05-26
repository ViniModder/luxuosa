local blips = {}

Items = {
    ["ammo_pistol_mk2"] = {
        index = "ammo_pistol_mk2",
        name = "Munição Five 7",
        png = "m-fiveseven",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_advancedrifle"] = {
        index = "ammo_advancedrifle",
        name = "Munição AdvancedRifle",
        png = "m-advancedrifle",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_machinepistol"] = {
        index = "ammo_machinepistol",
        name = "Munição Machinepistol",
        png = "m-machinepistol",
        weight = 0.01,
        type = "recharge"
    },
    ["machinepistol"] = {
        index = "machinepistol",
        name = "Machine Pistol",
        png = "machinepistol",
        weight = 5.0,
        type = "equip"
    },
    ["pumpshotgun"] = {
        index = "pumpshotgun",
        name = "Remington 870",
        png = "pumpshotgun",
        weight = 5.0,
        type = "equip"
    },

    ["ammo_pumpshotgun"] = {
        index = "ammo_pumpshotgun",
        name = "Munição Remington 870",
        png = "m-pumpshotgun",
        weight = 0.01,
        type = "recharge"
    },
    ["ammo_assaultrifle"] = {
        index = "ammo_assaultrifle",
        name = "Munição AK 103",
        png = "m-ak103",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_microsmg"] = {
        index = "ammo_microsmg",
        name = "Munição Uzi",
        png = "m-uzi",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_assaultsmg"] = {
        index = "ammo_assaultsmg",
        name = "Munição Mtar21",
        png = "m-mtar21",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_gusenberg"] = {
        index = "ammo_gusenberg",
        name = "Munição Tompson",
        png = "m-thompson",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_combatpistol"] = {
        index = "ammo_combatpistol",
        name = "Munição Glock",
        png = "m-glock",
        weight = 0.03,
        type = "recharge"
    },	
    ["ammo_carbinerifle"] = {
        index = "ammo_carbinerifle",
        name = "Munição M4A1",
        png = "m-m4a1",
        weight = 0.03,
        type = "recharge"
    },	
    ["ammo_smg"] = {
        index = "ammo_smg",
        name = "Munição MP5",
        png = "m-mp5",
        weight = 0.03,
        type = "recharge"
    },	
    ["ammo_combatpdw"] = {
        index = "ammo_combatpdw",
        name = "Munição Sig Sauer",
        png = "m-sigsauer",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_specialcarbine"] = {
        index = "ammo_specialcarbine",
        name = "Munição Special Carbine",
        png = "m-specialcarbine",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_stungun"] = {
        index = "ammo_stungun",
        name = "Munição Taser",
        png = "m-taser",
        weight = 0.03,
        type = "recharge"
    },	
    ["ammo_parachute"] = {
        index = "ammo_parachute",
        name = "Munição Paraquedas",
        png = "m-paraquedas",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_snspistol"] = {
        index = "ammo_snspistol",
        name = "Munição HK P7M10",
        png = "m-hkp7m10",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_pistol50"] = {
        index = "ammo_pistol50",
        name = "Munição Pistol 50",
        png = "m-vp9",
        weight = 0.03,
        type = "recharge"
    },
    
    ["ammo_ak47"] = {
        index = "ammo_ak47",
        name = "Munição AK47 ADD",
        png = "ammo_ak47",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_ar10a4"] = {
        index = "ammo_ar10a4",
        name = "Munição AR10A4",
        png = "ammo_ar10a4",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_fal"] = {
        index = "ammo_fal",
        name = "Munição Fal",
        png = "ammo_fal",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_hk416"] = {
        index = "ammo_hk416",
        name = "Munição HK416",
        png = "ammo_hk416",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_m110"] = {
        index = "ammo_m110",
        name = "Munição M110",
        png = "ammo_m110",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_scarh"] = {
        index = "ammo_scarh",
        name = "Munição Scar H",
        png = "ammo_scarh",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_navycarbine"] = {
        index = "ammo_navycarbine",
        name = "Munição Navy Carbine",
        png = "ammo_navycarbine",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_m9a3"] = {
        index = "ammo_m9a3",
        name = "Munição M9 A3",
        png = "ammo_m9a3",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_mp5k"] = {
        index = "ammo_mp5k",
        name = "Munição Mp5k",
        png = "ammo_mp5k",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_mp9"] = {
        index = "ammo_mp9",
        name = "Munição Mp9",
        png = "ammo_mp9",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_nsr"] = {
        index = "ammo_nsr",
        name = "Munição Nsr",
        png = "ammo_nsr",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_parafal"] = {
        index = "ammo_parafal",
        name = "Munição Parafal",
        png = "ammo_parafal",
        weight = 0.03,
        type = "recharge"
    },
    ["ammo_scorpionevo"] = {
        index = "ammo_scorpionevo",
        name = "Munição Scorpionevo",
        png = "ammo_scorpionevo",
        weight = 0.03,
        type = "recharge"
    },

    ["ammo_specialcarbine_mk2"] = {
        index = "ammo_specialcarbine_mk2",
        name = "Munição G36",
        png = "m-vp9",
        weight = 0.03,
        type = "recharge"
    },

    ["ammo_carbinerifle_mk2"] = {
        index = "ammo_carbinerifle_mk2",
        name = "Munição M?",
        png = "m-vp9",
        weight = 0.03,
        type = "recharge"
    },

    ["assaultrifle_mk2"] = {
        index = "assaultrifle_mk2",
        name = "AK-47",
        png = "m4a1",
        weight = 5.0,
        type = "equip"
    },

    ["ammo_assaultrifle_mk2"] = {
        index = "ammo_assaultrifle_mk2",
        name = "Munição AK-47",
        png = "m-vp9",
        weight = 0.03,
        type = "recharge"
    },

    ["carbinerifle_mk2"] = {
        index = "carbinerifle_mk2",
        name = "M4A4",
        png = "m4a1",
        weight = 5.0,
        type = "equip"
    },

    ["specialcarbine_mk2"] = {
        index = "specialcarbine_mk2",
        name = "G36",
        png = "m4a1",
        weight = 5.0,
        type = "equip"
    },
    
    ["ak47"] = {
        index = "ak47",
        name = "AK47 ADD",
        png = "ak47",
        weight = 5.0,
        type = "equip"
    },
    ["ar10a4"] = {
        index = "ar10a4",
        name = "AR10A4",
        png = "ar10a4",
        weight = 5.0,
        type = "equip"
    },
    ["fal"] = {
        index = "fal",
        name = "Fal",
        png = "fal",
        weight = 5.0,
        type = "equip"
    },
    ["hk416"] = {
        index = "hk416",
        name = "HK416",
        png = "hk416",
        weight = 5.0,
        type = "equip"
    },
    ["m110"] = {
        index = "m110",
        name = "M110",
        png = "m110",
        weight = 5.0,
        type = "equip"
    },
    ["scarh"] = {
        index = "scarh",
        name = "Scar H",
        png = "scarh",
        weight = 5.0,
        type = "equip"
    },
    ["navycarbine"] = {
        index = "navycarbine",
        name = "Navy Carbine",
        png = "navycarbine",
        weight = 5.0,
        type = "equip"
    },
    ["m9a3"] = {
        index = "m9a3",
        name = "M9 A3",
        png = "m9a3",
        weight = 5.0,
        type = "equip"
    },
    ["mp5k"] = {
        index = "mp5k",
        name = "Mp5k",
        png = "mp5k",
        weight = 5.0,
        type = "equip"
    },
    ["mp9"] = {
        index = "mp9",
        name = "Mp9",
        png = "mp9",
        weight = 5.0,
        type = "equip"
    },
    ["nsr"] = {
        index = "nsr",
        name = "Nsr",
        png = "nsr",
        weight = 5.0,
        type = "equip"
    },
    ["parafal"] = {
        index = "parafal",
        name = "Parafal",
        png = "parafal",
        weight = 5.0,
        type = "equip"
    },
    ["scorpionevo"] = {
        index = "scorpionevo",
        name = "Scorpionevo",
        png = "scorpionevo",
        weight = 5.0,
        type = "equip"
    },
    
    ["knife"] = {
        index = "knife",
        name = "Faca",
        png = "faca",
        weight = 5.0,
        type = "equip"
    },
    ["nightstick"] = {
        index = "nightstick",
        name = "Cassetete",
        png = "cassetete",
        weight = 5.0,
        type = "equip"
    },
    ["flashlight"] = {
        index = "flashlight",
        name = "Lanterna",
        png = "lanterna",
        weight = 5.0,
        type = "equip"
    },
    ["battleaxe"] = {
        index = "battleaxe",
        name = "Machado de Batalha",
        png = "battleaxe",
        weight = 5.0,
        type = "equip"
    },
    ["switchblade"] = {
        index = "switchblade",
        name = "Canivete",
        png = "canivete",
        weight = 5.0,
        type = "equip"
    },
    ["bat"] = {
        index = "bat",
        name = "Taco de Beisebol",
        png = "beisebol",
        weight = 5.0,
        type = "equip"
    },
    ["knuckle"] = {
        index = "knuckle",
        name = "Soco-Inglês",
        weight = 5.0,
        type = "equip"
    },
    ["hatchet"] = {
        index = "hatchet",
        name = "Machado",
        png = "machado",
        weight = 5.0,
        type = "equip"
    },
    ["pistol50"] = {
        index = "pistol50",
        name = "Pistol 50",
        png = "atfix45",
        weight = 5.0,
        type = "equip"
    },
    ["snspistol"] = {
        index = "snspistol",
        name = "HK P7M10",
        png = "hkp7m10",
        weight = 5.0,
        type = "equip"
    },
    ["parachute"] = {
        index = "parachute",
        name = "Paraquedas",
        png = "paraquedas",
        weight = 5.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            vRPc.giveWeapons(source, { ["GADGET_PARACHUTE"] = {ammo = 100} })
            cb(true)
        end
    },
    ["stungun"] = {
        index = "stungun",
        name = "Taser",
        png = "taser",
        weight = 5.0,
        type = "equip"
    },
    ["specialcarbine"] = {
        index = "specialcarbine",
        name = "Special Carbine",
        png = "specialcarbine",
        weight = 5.0,
        type = "equip"
    },
    ["combatpdw"] = {
        index = "combatpdw",
        name = "Sig Sauer",
        png = "sigsauer",
        weight = 5.0,
        type = "equip"
    },
    ["smg"] = {
        index = "smg",
        name = "MP5",
        png = "mp5",
        weight = 5.0,
        type = "equip"
    },
    ["pistol_mk2"] = {
        index = "pistol_mk2",
        name = "FN Five Seven",
        png = "fiveseven",
        weight = 5.0,
        type = "equip"
    },
    ["assaultrifle"] = {
        index = "assaultrifle",
        name = "AK-103",
        png = "ak103",
        weight = 5.0,
        type = "equip"
    },
    ["microsmg"] = {
        index = "microsmg",
        name = "Uzi",
        png = "uzi",
        weight = 5.0,
        type = "equip"
    },
    ["advancedrifle"] = {
        index = "advancedrifle",
        name = "advancedrifle",
        png = "weapon_advancedrifle",
        weight = 5.0,
        type = "equip"
    },

    ["sniperrifle"] = {
        index = "sniperrifle",
        name = "Arma Sniper Rifle",
        png = "weapon_sniperrifle",
        weight = 5.0,
        type = "equip"
    },

    ["ammo_sniperrifle"] = {
        index = "ammo_sniperrifle",
        name = "Munição Sniper Rifle",
        png = "ammo_sniperrifle",
        weight = 0.09,
        type = "recharge"
    },

    ["assaultsmg"] = {
        index = "assaultsmg",
        name = "MTAR-21",
        png = "mtar21",
        weight = 5.0,
        type = "equip"
    },
    ["gusenberg"] = {
        index = "gusenberg",
        name = "Thompson",
        png = "thompson",
        weight = 5.0,
        type = "equip"
    },
    ["combatpistol"] = {
        index = "combatpistol",
        name = "Glock 19",
        png = "glock",
        weight = 5.0,
        type = "equip"
    },
    ["carbinerifle"] = {
        index = "carbinerifle",
        name = "M4A1",
        png = "m4a1",
        weight = 5.0,
        type = "equip"
    },


    ["esmeralda"] = {
        index = "esmeralda",
        name = "Min. Esmeralda",
        weight = 0.9,
    },

    ["encomenda"] = {
        index = "encomenda",
        name = "Encomenda",
        weight = 1.2,
    },
    ["lenha"] = {
        index = "lenha",
        name = "Lenha",
        weight = 0.75,
    },
    ["rubi"] = {
        index = "rubi",
        name = "Min. Rubi",
        weight = 0.75,
    },
    ["fertilizante"] = {
        index = "fertilizante",
        name = "Fertilizante",
        weight = 0.8,
    },
    ["tabletroubado"] = {
        index = "tabletroubado",
        name = "Tablet Roubado",
        weight = 0.2,
    },
    ["bronze2"] = {
        index = "bronze2",
        name = "Bronze",
        weight = 0.2,
    },
    ["dinheirosujo"] = {
        index = "dinheirosujo",
        name = "Dinheiro Sujo",
        weight = 0,
    },
    ["fichas"] = {
        index = "fichas",
        name = "Fichas",
        weight = 0,
    },
    ["dollars"] = {
        index = "dollars",
        name = "Dinheiro",
        weight = 0,
    },
    ["graos"] = {
        index = "graos",
        name = "Graos",
        weight = 0.5,
    },
    ["carrinho"] = {
        index = "carrinho",
        name = "Carrinnho",
        weight = 0.5,
    },


    ["sucata"] = {
        index = "sucata",
        name = "Sucata",
        weight = 0.3,
    },
    ["otima-fotografia"] = {
        index = "otima-fotografia",
        name = "Fotografia Plus",
        weight = 0.2,
    },
    ["skate"] = {
        index = "skate",
        name = "Skate",
        weight = 5.0,
        keep_item = true, -- (e.g. don't remove item after use)
        type = "usar",
        func = function (user_id, source, item)
            TriggerClientEvent("skate",source)
        end
    },
    ["luftal"] = {
        index = "luftal",
        name = "Luftal",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },

    ["comboluxo"] = {
        index = "comboluxo",
        name = "Combo Luxo",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.tryGetInventoryItem(user_id, 'comboluxo', 1, true) then
                vRP.giveInventoryItem(user_id, 'sucol2', 1, true)
                vRP.giveInventoryItem(user_id, 'pizza', 1, true)
                TriggerClientEvent("Notify",source,"sucesso","Você abriu o combo com sucesso.",8000)
            end
        end
    },

    ["maquiagemroubada"] = {
        index = "maquiagemroubada",
        name = "Maquiagem Roubada",
        weight = 0.2,
        type = "usar"
    },
    ["dourado"] = {
        index = "dourado",
        name = "Dourado",
        weight = 0.6,
        type = "usar"
    },
    ["garrafadeleite"] = {
        index = "garrafadeleite",
        name = "Garrafa de leite",
        weight = 0.3,
        type = "usar"
    }, 
    ["laranjas"] = {
        index = "laranja",
        name = "Laranjas",
        weight = 0.03,
        type = "usar"
    },
    ["whisky"] = {
        index = "whisky",
        name = "whisky",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,30000,"bebendo")
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","p_whiskey_notop",49,28422)

            SetTimeout(30*1000, function()
                cb(true)
                vRPc.playScreenEffect(source,"RaceTurbo",180)
                vRPc.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Whisky</b> utilizada com sucesso.",8000)
            end)
        end,
        type = "beber"
    },

    ["binoculos"] = {
        index = "binoculos",
        name = "Binóculos",
        weight = 2.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent("binoculos",source,true)
            vRPc.CarregarObjeto(source,"amb@world_human_binoculars@male@enter","enter","prop_binoc_01",50,28422)
            cb(true)
        end
    },
    ["rubi2"] = {
        index = "rubi2",
        name = "Rubi",
        weight = 0.25,
        type = "usar"
    },
    ["lockpick"] = {
        keep_item = true,
        index = "lockpick",
        name = "Lockpick",
        weight = 2.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vZONE.inSafe(source) then
                TriggerClientEvent("Notify",source,"aviso","Você não pode utilizar isso aqui..",7000)
                return cb(false)
            end

            TriggerClientEvent('lockpicks:UseLockpick', source)
            local vehicle,vehNet,vehPlate,vehName,vehLock,vehBlock,vehHealth,vehModel,vehClass = vRPc.vehList(source,3)
            if vehicle and vehClass ~= 15 and vehClass ~= 16 then
                if vRP.getInventoryItemAmount(user_id,item) >= 1 then
                    local randomPorc = math.random(100)
                    if randomPorc >= 70 then vRP.tryGetInventoryItem(user_id,item,1,true,slot) end
                    if vRPc.inVehicle(source) then
                        vRPc._stopAnimActived(source)
                        Remote.closeInventory(source)
                        Remote.blockButtons(source,true)
                        vGARAGE.startAnimHotwired(source)
                        local taskResult = vTASKBAR.taskLockpick(source)
                        if taskResult then
                            local iddoroubado = vRP.getUserByRegistration(vehPlate)
                            if iddoroubado and math.random(100) >= 50 then
                                TriggerClientEvent("Notify",source,"aviso","O alarme do seu veículo <b>"..vRP.vehicleName(vehName).."</b> foi acionado.",7000)
                            end
                            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                            cb(true)
                            if math.random(100) >= 20 then 
                                TriggerEvent("setPlateEveryone",vehPlate)
                                TriggerEvent("setPlatePlayers",vehPlate,user_id) 
                                local entity = NetworkGetEntityFromNetworkId(vehNet)
                                SetVehicleDoorsLocked(entity, 1)
                            end
                            if math.random(100) >= 75 then
                                local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(source)))
                                local copAmount = vRP.getUsersByPermission("policia.permissao")
                                for k,v in pairs(copAmount) do
                                    if not vRP.hasPermission(v, "medicomilitar.permissao") then 
                                        async(function()
                                        local player = vRP.getUserSource(parseInt(v))
                                        TriggerClientEvent("Notify", player, "qru", _, _, _, 31, {x = x, y = y, z = z}, "Opa tem um cara aqui no bairro querendo roubar um carro <br>"..vRP.vehicleName(vehName).." - "..vehPlate)
                                        end)
                                    end
                                end
                            end
                        else
                            TriggerClientEvent("Notify",source,"aviso","Voce falhou, tente novamente.",7000)
                        end
                        if parseInt(math.random(1000)) >= 950 then
                            vRP.removeInventoryItem(user_id,item,1,true,slot)
                        end
                        Remote.blockButtons(source,false)
                        vGARAGE.stopAnimHotwired(source,vehicle)
                    else
                        vRPc._stopAnimActived(source)
                        Remote.closeInventory(source)
                        Remote.blockButtons(source,true)
                        vRPc._playAnim(source,false,{"missfbi_s4mop","clean_mop_back_player"},true)
                        local taskResult = vTASKBAR.taskLockpick(source)
                        if taskResult then
                            cb(true)

                            local iddoroubado = vRP.getUserByRegistration(vehPlate)
                            if iddoroubado then
                                local identity = vRP.getUserIdentity(user_id)
                                local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(source)))
                                TriggerEvent("setPlateEveryone",vehPlate)
                                local entity = NetworkGetEntityFromNetworkId(vehNet)
                                SetVehicleDoorsLocked(entity, 1)										
                                --vRP.Log("```prolog\n[ID]: "..user_id.." "..identity.name.." "..identity.firstname.." (Account ID: "..vRP.getAccountById(user_id)..") \n[ROUBOU CARRO]: ("..vehName..") "..vRP.vehicleName(vehName).." ("..iddoroubado..")\n[CDS]: ("..x..","..y..","..z..") "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```","lockpick")
                                vRP._LogN(vRP.getAccountById(user_id) , user_id , identity.name.." "..identity.firstname , "[ROUBOU CARRO]: ("..vehName..") "..vRP.vehicleName(vehName).." ("..iddoroubado..")\n[CDS]: "..x..","..y..","..z , "ROUBOS-USOU-LOCKPICK")
                                TriggerClientEvent("Notify",source,"aviso","Veículo <b>"..vRP.vehicleName(vehName).."</b> foi roubado.",7000)
                                vRPc._stopAnim(source,false)
                            end										
                            if math.random(100) >= 75 then
                                local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(source)))
                                local copAmount = vRP.getUsersByPermission("policia.permissao")
                                for k,v in pairs(copAmount) do
                                    if not vRP.hasPermission(v, "medicomilitar.permissao") then 
                                        async(function() 
                                            local player = vRP.getUserSource(parseInt(v))
                                            local blip = vRPc.addBlip(player, x,y,z, 10,49, "Roubo a veiculo", 0.5,false)
                                            TriggerClientEvent("Notify",player, "qru", "Um veiculo acaba de ser roubado", _, _, 31, {x = x, y = y, z = z})
                                            SetTimeout(5 * 1000, function()
                                                vRPc._removeBlip(player, blip)
                                            end)
                                        end)
                                    end
                                end
                            end
                        else
                            vRPc._stopAnim(source,false)
                            TriggerClientEvent("Notify",source,"aviso","Voce falhou.",7000)
                        end
                        if math.random(1000) >= 950 then
                            vRP.removeInventoryItem(user_id,item,1,true,slot)
                            cb(true)
                        else
                            cb(false)
                        end
                        Remote.blockButtons(source,false)
                        vRPc._stopAnimActived(source,false)
                    end
                end
            end
            end,
    },
    ["diamante2"] = {
        index = "diamante2",
        name = "Diamante",
        weight = 0.3,
        type = "usar"
    },
    ["orgao"] = {
        index = "orgao",
        name = "Orgão",
        weight = 1.2,
        type = "usar"
    },
    ["colete"] = {
        index = "colete",
        name = "Colete",
        weight = 2.5,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            cb(true)
            vRPc._playAnim(source,true,{"oddjobs@basejump@ig_15","puton_parachute"},false)
            TriggerClientEvent("progress",source,3000)

            SetTimeout(3*1000, function()
                vRPc.setArmour(source,100)
                TriggerClientEvent("Notify",source,"sucesso","<b>Colete</b> colocado com sucesso.",8000)
            end)
        end
    },

    ["money"] = {
        index = "money",
        name = "Dinheiro",
        weight = 0.0,
        type = "usar"
    },

    ["dinheiro"] = {
        index = "dinheiro",
        name = "Dólares",
        weight = 0.0,
        type = "usar"
    },
    ["energetico"] = {
        index = "energetico",
        name = "Energetico",
        weight = 0.0,
        type = "beber"
    },
    ["bandagem"] = {
        index = "bandagem",
        name = "Bandagem",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            vRPc._CarregarObjeto(source,"amb@world_human_clipboard@male@idle_a","idle_c","v_ret_ta_firstaid",49,60309)
            TriggerClientEvent("progress",source, 15)
            
            SetTimeout(15*1000, function()
                vRPc._DeletarObjeto(source)
                Remote._useBandagem(source)
                TriggerClientEvent( "Notify", source, "medico", "Você utilizou a bandagem, não tome nenhum tipo de dano para não ser cancelada..", 5000)
                cb(true)
            end)
        end
    },
    ["corvina"] = {
        index = "corvina",
        name = "Corvina",
        weight = 0.6,
        type = "usar"
    },
    ["pendriveinformacoes"] = {
        index = "pendriveinformacoes",
        name = "Pendrive Informações",
        weight = 0.1,
        type = "usar"
    },

    ["rastreador"] = {
        index = "rastreador",
        name = "Rastreador",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)

            local vehicle,vnetid,placa,vname,lock,banned = vRPc.vehList(source,7)
            local placa_user = vRP.getUserByRegistration(placa)
            if placa then
                TriggerClientEvent("Notify",source,"sucesso","Instalando rastreador do veiculo....",8000)
                    
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,15000,"instalando rastreador")
                vGARAGE.vehicleClientHood(source,vnetid,false)
                vRPc._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
                
                SetTimeout(15*1000, function()
                    vGARAGE.vehicleClientHood(source,vnetid,true)
                    TriggerClientEvent('cancelando',source,false)
                    vRPc._stopAnim(source,false)

                    exports["oxmysql"]:executeSync([[UPDATE vrp_user_vehicles SET `tracker` = ? WHERE `user_id` = ? AND `vehicle` = ?]],{1,placa_user,vname })
                    exports.vrp_admin:AddTrackerVehicle(placa_user, vname, vnetid)
                end)

                cb(true)
            end

        end
    },

    ["alicate"] = {
        index = "alicate",
        name = "Alicate",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)

            local vehicle,vnetid,placa,vname,lock,banned = vRPc.vehList(source,7)
            local placa_user = vRP.getUserByRegistration(placa)
            if placa then
                TriggerClientEvent("Notify",source,"sucesso","Removendo rastreador do veiculo....",8000)
                    
                TriggerClientEvent('cancelando',source,true)
                TriggerClientEvent("progress",source,15000,"removendo rastreador")
                vGARAGE.vehicleClientHood(source,vnetid,false)
                vRPc._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
                
                SetTimeout(15*1000, function()
                    vGARAGE.vehicleClientHood(source,vnetid,true)
                    TriggerClientEvent('cancelando',source,false)
                    vRPc._stopAnim(source,false)

                    exports["oxmysql"]:executeSync([[UPDATE vrp_user_vehicles SET `tracker` = ? WHERE `user_id` = ? AND `vehicle` = ?]],{0,placa_user,vname })
                    exports.vrp_admin:RemTrackerVehicle(vnetid)
                end)

                cb(true)
            end

        end
    },


    ["viporiginp30"] = {
        index = "viporiginp30",
        name = "Vip Origin Plus 30 Dias",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local time = string.sub(item,11)
            local vip_time = os.time() + time*24*60*60
            vRP.execute("updateVipTime",{ id = user_id, vip_time = vip_time })
            vRP.addUserGroup(parseInt(user_id),"OriginP")
            cb(true)
            vRP.giveBankMoney(parseInt(user_id),500000)
            vRP.giveInventoryItem(user_id, "xenon", 1, true)
            vRP.giveInventoryItem(user_id, "roupas", 1, true)		
            vRP.execute("vRP/add_priority",{ id = user_id, priority = 100 })		
            TriggerClientEvent("Notify",source,"sucesso","<b>VIP Origin Plus 30 dias</b>, utilizado com sucesso.",8000)
        end
    },
    ["rivotril"] = {
        index = "rivotril",
        name = "Rivotril",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["amoxilina"] = {
        index = "amoxilina",
        name = "Amoxilina",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["lambari"] = {
        index = "lambari",
        name = "Lambari",
        weight = 0.6,
        type = "usar"
    },
    ["coumadin"] = {
        index = "coumadin",
        name = "Coumadin",
        weight = 0.1,
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,20000,"coumadin")
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(20 * 1000,function() 						
                TriggerClientEvent('cancelando',source,false)
                TriggerClientEvent("resetBleeding",source)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"sucesso","<b>Coumadin</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["pulseiraroubada"] = {
        index = "pulseiraroubada",
        name = "Pulseira Roubada",
        weight = 0.2,
        type = "usar"
    },
    ["keysinvasao"] = {
        index = "keysinvasao",
        name = "Keys Invasao",
        weight = 0.1,
        type = "usar"
    },
    ["defibrillator"] = {
        index = "defibrillator",
        name = "Desfibrilador",
        weight = 0.7,
        type = "usar"
    },
    ["novalgina"] = {
        index = "novalgina",
        name = "Novalgina",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                Remote._usePill(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["pacu"] = {
        index = "pacu",
        name = "Pacu",
        weight = 0.6,
        type = "usar"
    },
    ["safira"] = {
        index = "safira",
        name = "Min. Safira",
        weight = 0.25,
        type = "usar"
    },
    ["metanfetamina"] = {
        index = "metanfetamina",
        name = "Metanfetamina",
        weight = 0.2,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.hasPermission(user_id, "crianca.permissao") then return end

            vRPc._playAnim(source,true,{"mp_player_int_uppersmoke","mp_player_int_smoke"},true)
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            
            SetTimeout(10*1000, function()
                TriggerClientEvent('energeticos',source,true)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"drogas","<b>Droga</b> utilizada com sucesso.",8000)
            end)

            SetTimeout(40000,function()
                TriggerClientEvent('energeticos',source,false)
                TriggerClientEvent("Notify",source,"aviso","O coração voltou a bater normalmente.",8000)
            end)
        end
    },
    ["xenon"] = {
        index = "xenon",
        name = "Xenon",
        weight = 0.8,
        type = "usar"
    },
    ["tucunare"] = {
        index = "tucunare",
        name = "Tucunare",
        weight = 0.6,
        type = "usar"
    },
    ["ingresso"] = {
        index = "ingresso",
        name = "Ingresso",
        weight = 0.1,
        type = "usar"
    },
    ["eventkey"] = {
        index = "eventkey",
        name = "Event Key",
        weight = 0.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local identity = vRP.getUserIdentity(user_id)
            local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPc.vehList(source,7)
            if vehicle then
                if vRP.tryGetInventoryItem(user_id,item,1,true,slot) then
                    cb(true)								
                    TriggerClientEvent('cancelando',source,true)					
                    TriggerClientEvent("progress",source,10000,"abrindo")
                    vRPc._playSound(source,"Timer_10s","DLC_HALLOWEEN_FVJ_Sounds")
                    vRPc._playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
                    SetTimeout(10*1000, function()
                        TriggerClientEvent('cancelando',source,false)
                        vRPc._stopAnim(source,false)
                        if math.random(100) >= 90 then
                            TriggerEvent("setPlateEveryone",placa)
                            -- vGARAGE.vehicleClientLock(-1,vnetid,lock)
                            vGARAGE.toggleLock(source,vnetid)
                            TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
                            TriggerClientEvent("Notify",source,"sucesso","Parabéns, você conseguiu.",8000)
                            TriggerClientEvent('chatMessage',-1,"",{19,197,43},"O jogador"..identity.name.." "..identity.firstname.." abriu o carro "..vRP.vehicleName(vname), 'vencedor')
                        else
                            TriggerClientEvent("Notify",source,"negado","Infelizmente não foi desta vez.",8000)
                        end
                    end)
                end
            end
        end
    },
    ["keycard"] = {
        index = "keycard",
        name = "Key Card",
        weight = 0.04,
        type = "usar"
    },
    ["vipplaca"] = {
        index = "vipplaca",
        name = "Vip Placa",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local descricao = vRP.prompt(source,"Mudança de placa (8 Caractér):","")
            local descricao2 = sanitizeString(descricao,"abcdefghijklmnopqrstuvwxyz0123456789",true)
            if descricao2 == "" or vRP.getUserByRegistration(descricao2) ~= nil or string.len(descricao2) ~= 8 then
                return
            end
            vRP.execute("vRP/update_registration",{ user_id = user_id, registration = string.upper(descricao2) })
            TriggerClientEvent("Notify",source,"sucesso","<b>Placa Modificada</b> com sucesso, favor relogar.",8000)
        end
    },
    ["pasta-base"] = {
        index = "pasta-base",
        name = "Pasta Base",
        weight = 0.25,
        type = "usar"
    },
    ["pasta-impura"] = {
        index = "pasta-impura",
        name = "Pasta Impura",
        weight = 0.2,
        type = "usar"
    },
    ["cocaina"] = {
        index = "cocaina",
        name = "Cocaina",
        weight = 0.2,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.hasPermission(user_id, "crianca.permissao") then return end

            vRPc._playAnim(source,true,{"mp_player_int_uppersmoke","mp_player_int_smoke"},true)
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            
            SetTimeout(10*1000, function()
                TriggerClientEvent('energeticos',source,true)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"drogas","<b>Droga</b> utilizada com sucesso.",8000)
            end)

            SetTimeout(40000,function()
                TriggerClientEvent('energeticos',source,false)
                TriggerClientEvent("Notify",source,"aviso","O coração voltou a bater normalmente.",8000)
            end)
        end
    },
    ["cocainavenda"] = {
        index = "cocainavenda",
        name = "cocaina para venda",
        weight = 0.8,
        type = "usar"
    },
    ["isca"] = {
        index = "isca",
        name = "Isca",
        weight = 0.6,
        type = "usar"
    },
    ["vipgaragem"] = {
        index = "vipgaragem",
        name = "Vip Garagem",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            vRP.execute("creative/update_garages",{ id = user_id })
            cb(true)
            TriggerClientEvent("Notify",source,"sucesso","<b>Adicionado +1 Garagem</b> com sucesso.",8000)
        end
    },
    ["cerveja"] = {
        index = "cerveja",
        name = "Cerveja",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,30000,"bebendo")
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
            SetTimeout(30*1000, function()
                if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                cb(true)
                vRPc.playScreenEffect(source,"RaceTurbo",180)
                vRPc.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Cerveja</b> utilizada com sucesso.",8000)
            end)
        end
    },
    ["cirurgia"] = {
        index = "cirurgia",
        name = "cirurgia",
        weight = 0.5,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('closeInventory', source)
            TriggerClientEvent('resetchar', source)
        end
    },
    ["ferramenta"] = {
        index = "ferramenta",
        name = "Ferramenta",
        weight = 3.0,
        type = "usar"
    },
    ["vipaparencia"] = {
        index = "vipaparencia",
        name = "Vip Aparencia",
        weight = 0.0,
        type = "usar"
    },
    ["riopan"] = {
        index = "riopan",
        name = "Riopan",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["pano"] = {
        index = "pano",
        name = "Pano",
        weight = 0.02,
        type = "usar"
    },
    ["aluminio"] = {
        index = "aluminio",
        name = "Aluminio",
        weight = 0.05,
        type = "usar"
    },
    ["linha"] = {
        index = "linha",
        name = "Linha",
        weight = 0.01,
        type = "usar"
    },
    -- ["ametista"] = {
    --     index = "ametista",
    --     name = "Min. Ametista",
    --     weight = 0.6,
    --     type = "usar"
    -- },
    ["viporigin30"] = {
        index = "viporigin30",
        name = "Vip Origin 30 Dias",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local time = string.sub(item,10)
            local vip_time = os.time() + time*24*60*60
            vRP.execute("updateVipTime",{ id = user_id, vip_time = vip_time })
            vRP.addUserGroup(parseInt(user_id),"Origin")							
            vRP.giveBankMoney(parseInt(user_id),300000)
            vRP.giveInventoryItem(user_id, "xenon", 1, true)
            vRP.giveInventoryItem(user_id, "roupas", 1, true)
            cb(true)
            vRP.execute("vRP/add_priority",{ id = user_id, priority = 100 })		
            TriggerClientEvent("Notify",source,"sucesso","<b>VIP Origin 30 dias</b>, utilizado com sucesso.",8000)
        end
    },
    ["vipplatinum30"] = {
        index = "vipplatinum30",
        name = "Vip Platinum 30 Dias",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local time = string.sub(item,12)
            local vip_time = os.time() + time*24*60*60
            vRP.execute("updateVipTime",{ id = user_id, vip_time = vip_time })
            vRP.addUserGroup(parseInt(user_id),"Platinum")							
            vRP.giveBankMoney(parseInt(user_id),100000)
            vRP.giveInventoryItem(user_id, "xenon", 1, true)
            vRP.giveInventoryItem(user_id, "roupas", 1, true)		
            vRP.execute("vRP/add_priority",{ id = user_id, priority = 90 })
            cb(true)
            TriggerClientEvent("Notify",source,"sucesso","<b>VIP Platinum 30 dias</b>, utilizado com sucesso.",8000)
        end
    },
    ["vipplatinum15"] = {
        index = "vipplatinum15",
        name = "Vip Platinum 15 Dias",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local time = string.sub(item,12)
            local vip_time = os.time() + time*24*60*60
            vRP.execute("updateVipTime",{ id = user_id, vip_time = vip_time })
            vRP.addUserGroup(parseInt(user_id),"Platinum")
            vRP.giveBankMoney(parseInt(user_id),50000)
            vRP.giveInventoryItem(user_id, "xenon", 1, true)
            vRP.giveInventoryItem(user_id, "roupas", 1, true)		
            vRP.execute("vRP/add_priority",{ id = user_id, priority = 90 })							
            TriggerClientEvent("Notify",source,"sucesso","<b>VIP Platinum 15 dias</b>, utilizado com sucesso.",8000)
        end
    },
    ["vipgold30"] = {
        index = "vipgold30",
        name = "Vip Gold 30 Dias",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local time = string.sub(item,8)
            local vip_time = os.time() + time*24*60*60
            vRP.execute("updateVipTime",{ id = user_id, vip_time = vip_time })
            vRP.addUserGroup(parseInt(user_id),"Gold")
            vRP.execute("vRP/add_priority",{ id = user_id, priority = 50 })		
            TriggerClientEvent("Notify",source,"sucesso","<b>VIP Gold 30 dias</b>, utilizado com sucesso.",8000)
        end
    },
    ["vipgold15"] = {
        index = "vipgold15",
        name = "Vip Gold 15 Dias",
        weight = 0.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local time = string.sub(item,8)
            local vip_time = os.time() + time*24*60*60
            vRP.execute("updateVipTime",{ id = user_id, vip_time = vip_time })
            vRP.addUserGroup(parseInt(user_id),"Gold")
            vRP.execute("vRP/add_priority",{ id = user_id, priority = 50 })		
            TriggerClientEvent("Notify",source,"sucesso","<b>VIP Gold 15 dias</b>, utilizado com sucesso.",8000)
        end
    },
    ["xerelto"] = {
        index = "xerelto",
        name = "Xerelto",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,20000,"xerelto")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(20 * 1000,function() 
                TriggerClientEvent('cancelando',source,false)
                TriggerClientEvent("resetBleeding",source)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"sucesso","<b>Xerelto</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["graosimpuros"] = {
        index = "graosimpuros",
        name = "Graos Impuros",
        weight = 0.5,
        type = "usar"
    },
    ["oxigenio"] = {
        index = "oxigenio",
        name = "Oxigenio",
        weight = 10.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
        	TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,3000,"Roupa de mergulho")
            cb(true)
            vRPc._playAnim(source,true,{"oddjobs@basejump@ig_15","puton_parachute"},false)

            if not Remote.checkScuba(source) then
                Remote._setScuba(source, true)
                TriggerClientEvent("Notify",source,"sucesso","Roupa de <b>Mergulho</b> colocada com sucesso.",8000)	
            else
                TriggerClientEvent( "Notify", source, "negado", "Você ja possui uma scuba equipada, para retira-la /rscuba", 5 )
            end
        end
    },
    ["roupas"] = {
        index = "roupas",
        name = "Roupas",
        weight = 3.0,
        type = "usar"
    },
    ["allegra"] = {
        index = "allegra",
        name = "Allegra",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["topazio2"] = {
        index = "topazio2",
        name = "Topazio",
        weight = 0.3,
        type = "usar"
    },
    ["pneus"] = {
        index = "pneus",
        name = "Pneus",
        weight = 1.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRPc.isInVehicle(source) then
                local vehicle = vRPc.getNearestVehicle(source,3)
                if vehicle then
                    if vRP.hasPermission(user_id,"mecanico.permissao") then
                        cb(true)
                        TriggerClientEvent('cancelando',source,true)
                        TriggerClientEvent("progress",source,20000,"reparando pneus")
                        vRPc._playAnim(source,false,{"amb@medic@standing@tendtodead@base","base"},true)
                        vRPc._CarregarObjeto(source,"","","prop_wheel_tyre",49,60309,-0.05,0.2,0.0,0.0,0.0,50.0)
                        
                        SetTimeout(20*1000, function()
                            TriggerClientEvent('cancelando',source,false)
                            vRPc._DeletarObjeto(source)
                            vRPc._stopAnim(source,false)
                            TriggerClientEvent('repararpneus',source,vehicle)
                        end)
                    else
                        if vRP.tryGetInventoryItem(user_id,item,1,true,tostring(slot)) then	
                            TriggerClientEvent('cancelando',source,true)
                            TriggerClientEvent("progress",source,20000,"reparando pneus")
                            cb(true)
                            vRPc._playAnim(source,false,{"amb@medic@standing@tendtodead@base","base"},true)
                            vRPc._CarregarObjeto(source,"","","prop_wheel_tyre",49,60309,-0.05,0.2,0.0,0.0,0.0,50.0)

                            SetTimeout(20*1000, function()
                                TriggerClientEvent('cancelando',source,false)
                                vRPc._DeletarObjeto(source)
                                vRPc._stopAnim(source,false)
                                TriggerClientEvent('repararpneus',source,vehicle)
                            end)
                        end
                    end
                end
            end
        end
    },
    ["serra"] = {
        index = "serra",
        name = "Serra",
        weight = 5.0,
        type = "usar"
    },
    ["placa"] = {
        index = "placa",
        name = "Placa",
        weight = 1.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRPc.GetVehicleSeat(source) then
                local placa = "CLONADA"
                if vRP.tryGetInventoryItem(user_id,item,1,true,slot) then				
                    TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("vehicleanchor",source,true)
                    TriggerClientEvent("progress",source,30000,"clonando")
                    cb(true)
                    SetTimeout(30*1000, function()
                        TriggerClientEvent('cancelando',source,false)
                        TriggerClientEvent("cloneplates",source,placa)
                        TriggerEvent("setPlateEveryone",placa)
                        TriggerClientEvent("Notify",source,"sucesso","Veículo clonado com sucesso.",8000)
                        TriggerClientEvent("vehicleanchor",source,false)
                    end)
                end
            end
        end
    },
    ["celular"] = {
        index = "celular",
        name = "Celular",
        weight = 0.5,
        type = "usar"
    },
    ["apple_watch"] = {
        index = "watch",
        name = "apple_watch",
        weight = 0.5,
        type = "usar"
    },
    ["radio"] = {
        index = "radio",
        name = "Rádio",
        weight = 0.5,
        type = "usar"
    },
    ["airdrop"] = {
        index = "airdrop",
        name = "Air Drop",
        weight = 40.0,
        type = "usar"
    },
    ["ametista2"] = {
        index = "ametista2",
        name = "Ametista",
        weight = 0.2,
        type = "usar"
    },
    ["furadeira"] = {
        index = "furadeira",
        name = "Furadeira",
        weight = 5.0,
        type = "usar"
    },
    ["safira2"] = {
        index = "safira2",
        name = "Safira",
        weight = 0.25,
        type = "usar"
    }, 
    ["esmeralda2"] = {
        index = "esmeralda2",
        name = "Esmeralda",
        weight = 0.3,
        type = "usar"
    },
    ["ferro2"] = {
        index = "ferro2",
        name = "Ferro",
        weight = 0.3,
        type = "usar"
    },
    ["ouro2"] = {
        index = "ouro2",
        name = "Ouro",
        weight = 0.25,
        type = "usar"
    },
    ["topazio"] = {
        index = "topazio",
        name = "Min. Topazio",
        weight = 0.9,
        type = "usar"
    },
    ["ferro"] = {
        index = "ferro",
        name = "Min. Ferro",
        weight = 0.6,
        type = "usar"
    },
    ["bronze"] = {
        index = "bronze",
        name = "Min. Bronze",
        weight = 0.6,
        type = "usar"
    },
    ["ouro"] = {
        index = "ouro",
        name = "Min. Ouro",
        weight = 0.75,
        type = "usar"
    },
        ["prata"] = {
        index = "prata",
        name = "Min. Prata",
        weight = 0.75,
        type = "usar"
    },
    ["diamante"] = {
        index = "diamante",
        name = "Min. Diamante",
        weight = 0.9,
        type = "usar"
    },
    ["salmao"] = {
        index = "salmao",
        name = "Salmao",
        weight = 0.6,
        type = "usar"
    },
    ["pintado"] = {
        index = "pintado",
        name = "Pintado",
        weight = 0.6,
        type = "usar"
    },
    -- ["fireworks"] = {
    --     index = "fireworks",
    --     name = "Fogos de Artifícios",
    --     weight = 5.0,
    --     keep_item = true,
    --     func = function(user_id, source, item, slot, cb)
    --         if not vRPc.isInVehicle(source) then
    --             if not API.returnfireWorks(source) then
    --                 if vRP.tryGetInventoryItem(user_id,item,1,true) then
    --                     return true
    --                 end
    --             end
    --         end
    --     end
    -- },
    ["buscofem"] = {
        index = "buscofem",
        name = "Buscofem",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["absinto"] = {
        index = "absinto",
        name = "Absinto",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            cb(true)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,30000,"bebendo")
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)
            
            SetTimeout(30*1000, function()
                if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                cb(true)
                vRPc.playScreenEffect(source,"RaceTurbo",180)
                vRPc.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Absinto</b> utilizada com sucesso.",8000)
            end)
        end,
        type = "beber"
    },
    ["logsinvasao"] = {
        index = "logsinvasao",
        name = "Logs de Invasão",
        weight = 0.1,
        type = "usar"
    },
    ["pecadearma"] = {
        index = "pecadearma",
        name = "Peça de Arma",
        weight = 0.01,
        type = "usar"
    },
    ["placa-metal"] = {
        index = "placa-metal",
        name = "Placa de Metal",
        weight = 0.01,
        type = "usar"
    },
    ["molas"] = {
        index = "molas",
        name = "Molas",
        weight = 0.01,
        type = "usar"
    },
    ["gatilho"] = {
        index = "gatilho",
        name = "Gatilhos",
        weight = 0.01,
        type = "usar"
    },
    ["firstaid"] = {
        index = "firstaid",
        name = "First Aid",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRPc.isInVehicle(source) then
                local nplayer = vRPc.getNearestPlayer(source,2)
                if nplayer then
                    if GetEntityHealth(GetPlayerPed(nplayer)) <= 101 then
                        if vRP.hasPermission(user_id,"hospital.permissao") then					
                            TriggerClientEvent('cancelando',source,true)
                            TriggerClientEvent("progress",source,15000,"firstaid")
                            cb(true)
                            vRPc._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)

                            SetTimeout(15 * 1000, function() 
                                TriggerClientEvent('cancelando',source,false)
                                vRPc._stopAnim(source,false) 
                            end)
                        else
                            if vRP.tryGetInventoryItem(user_id,item,1,true,slot) then
                                TriggerClientEvent('cancelando',source,true)
                                TriggerClientEvent("progress",source,15000,"firstaid")
                                cb(true)
                                vRPc._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)

                                SetTimeout(15 * 1000, function() 
                                    TriggerClientEvent('cancelando',source,false)
                                    vRPc._stopAnim(source,false)
                                end)
                            end
                        end
                    end
                end
            end
        end
    },
    ["armacaodearma"] = {
        index = "armacaodearma",
        name = "Armação de Arma",
        weight = 0.8,
        type = "usar"
    },
    ["acidobateria"] = {
        index = "acidobateria",
        name = "Acido de Bateria",
        weight = 0.4,
        type = "usar"
    },
    ["bateria"] = {
        index = "bateria",
        name = "Bateria",
        weight = 0.8,
        type = "usar"
    },
    ["ecstasy"] = {
        index = "ecstasy",
        name = "Ecstasy",
        weight = 0.8,
        type = "usar"
    },
    -- ["cafeina"] = {
    --     index = "cafeina",
    --     name = "Cafeina",
    --     weight = 0.8,
    --     type = "usar"
    -- },
    ["carnedepuma"] = {
        index = "carnedepuma",
        name = "Carne de Puma",
        weight = 1.3,
        type = "usar"
    },
    ["carnedelobo"] = {
        index = "carnedelobo",
        name = "Carne de Lobo",
        weight = 1.0,
        type = "usar"
    },
    ["alianca"] = {
        index = "alianca",
        name = "Aliança",
        weight = 0.0,
        type = "usar"
    },
    ["aliancacasamento"] = {
        index = "aliancacasamento",
        name = "Aliança de Casamento",
        weight = 0.0,
        type = "usar"
    },
    ["brincoroubado"] = {
        index = "brincoroubado",
        name = "Brinco Roubado",
        weight = 0.2,
        type = "usar"
    },
    ["repairkit"] = {
        index = "repairkit",
        name = "Repairkit",
        weight = 1.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRPc.isInVehicle(source) then
                local vehicle,vnetid = vRPc.vehList(source,3.5)
                if vehicle then
                    if vRP.hasPermission(user_id,"mecanico.permissao") then
                        cb(true)
                        TriggerClientEvent('cancelando',source,true)
                        TriggerClientEvent("progress",source,30000,"reparando veículo")
                        --vGARAGE.vehicleClientHood(source,vnetid,false)
                        vRPc._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
                        
                        SetTimeout(30*1000, function()
                            TriggerClientEvent('cancelando',source,false)
                            vRPc._stopAnim(source,false)
                            TriggerClientEvent('reparar',source)
                            --vGARAGE.vehicleClientHood(source,vnetid,true)

                            Wait(3000)

                            exports.conexao_garages:saveVehicle(vnetid,source)
                        end)
                    else
                        if vRP.tryGetInventoryItem(user_id,item,1,true,slot) then
                            cb(true)
                            TriggerClientEvent('cancelando',source,true)
                            TriggerClientEvent("progress",source,30000,"reparando veículo")
                            --vGARAGE.vehicleClientHood(source,vnetid,false)
                            vRPc._playAnim(source,false,{"mini@repair","fixing_a_player"},true)

                            SetTimeout(30*1000, function()
                                TriggerClientEvent('cancelando',source,false)
                                vRPc._stopAnim(source,false)
                                TriggerClientEvent('reparar',source)
                                --vGARAGE.vehicleClientHood(source,vnetid,true)

                                Wait(3000)

                                exports.conexao_garages:saveVehicle(vnetid,source)
                            end)
                        end
                    end
                end
            end
        end
    },
    ["anfetamina"] = {
        index = "anfetamina",
        name = "Anfetamina",
        weight = 0.2,
        type = "usar"
    },
    ["efedrina"] = {
        index = "efedrina",
        name = "Efedrina",
        weight = 0.4,
        type = "usar"
    },
    ["malote"] = {
        index = "malote",
        name = "Malote",
        weight = 0.8,
        type = "usar"
    },
    ["lsd"] = {
        index = "lsd",
        name = "LSD",
        weight = 0.2,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.hasPermission(user_id, "crianca.permissao") then return end
            
            vRPc._playAnim(source,true,{"mp_player_int_uppersmoke","mp_player_int_smoke"},true)
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            
            SetTimeout(10*1000, function()
                TriggerClientEvent('energeticos',source,true)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"drogas","<b>Droga</b> utilizada com sucesso.",8000)
            end)

            SetTimeout(40000,function()
                TriggerClientEvent('energeticos',source,false)
                TriggerClientEvent("Notify",source,"aviso","O coração voltou a bater normalmente.",8000)
            end)
        end
    },
    ["pedradecrack"] = {
        index = "pedradecrack",
        name = "Pedra de Crack",
        weight = 0.2,
        type = "usar"
    },
    ["dietilamina"] = {
        index = "dietilamina",
        name = "Dietilamina",
        weight = 0.25,
        type = "usar"
    },
    ["fungo"] = {
        index = "fungo",
        name = "Fungo",
        weight = 0.25,
        type = "usar"
    },
    ["pastadecoca"] = {
        index = "pastadecoca",
        name = "Pasta de Coca",
        weight = 0.4,
        type = "usar"
    },
    ["pedecabra"] = {
        index = "pedecabra",
        name = "Pe de Cabra",
        weight = 0.8,
        keep_item = true,
        func = function(user_id, source, item, slot, cb)
            local vehicle,vnetid = vRPc.vehList(source,3.5)-------------------------------------------------------------------
            if vehicle then
                if vRP.tryGetInventoryItem(user_id, "pedecabra", 1, true) then
                    Remote._SearchChest(source, true)
                    cb(true)
                end
            else
                TriggerClientEvent("Notify",source,"negado","Nenhum veículo por perto.",8000)
            end
        end
    },


    ["energetico"] = {
        index = "energetico",
        name = "Energético",
        weight = 0.8,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            cb(true)
            TriggerClientEvent("progress",source,10000,"bebendo")
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_energy_drink",49,28422)

            SetTimeout(10*1000, function()
                TriggerClientEvent('energeticos',source,true)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Energético</b> utilizado com sucesso.",8000)
            end)

            SetTimeout(40000,function()
                TriggerClientEvent('energeticos',source,false)
                TriggerClientEvent("Notify",source,"aviso","O efeito do energético passou e o coração voltou a bater normalmente.",8000)
            end)
        end
    },
    ["po"] = {
        index = "po",
        name = "Pó",
        weight = 0.8,
        type = "usar"
    },
    ["skunk"] = {
        index = "skunk",
        name = "Skunk",
        weight = 0.8,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('bong',source)
            SetTimeout(9000,function()
                TriggerClientEvent("Notify",source,"drogas","<b>Skunk</b> utilizada com sucesso.",8000)
                if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                cb(true)
            end)
        end
    },
    ["tequila"] = {
        index = "tequila",
        name = "Tequila",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,30000,"bebendo")
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)

            SetTimeout(30*1000, function()
                cb(true)
                vRPc.playScreenEffect(source,"RaceTurbo",180)
                vRPc.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Tequila</b> utilizada com sucesso.",8000)
            end)
        end
    },
    ["etiqueta"] = {
        index = "etiqueta",
        name = "Etiqueta",
        weight = 0.0,
        type = "usar"
    },
    ["carregadorroubado"] = {
        index = "carregadorroubado",
        name = "Carregador Roubado",
        weight = 0.2,
        type = "usar"
    },
    ["paracetamol"] = {
        index = "paracetamol",
        name = "Paracetamol",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["masterpick"] = {
        index = "masterpick",
        name = "Masterpick",
        weight = 30.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local vehicle,vnetid,placa,vname,lock,banned,trunk,model,street = vRPc.vehList(source,7)
            local policia = exports["vrp"]:getUsersByPermission("policia.permissao")
            if vehicle then
                if vRP.hasPermission(user_id,"policia.permissao") then
                    TriggerEvent("setPlateEveryone",placa)
                    vGARAGE.toggleLock(source,vnetid)
                    TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
                    cb(true)
                    return
                end
                if #policia < 5 then
                    cb({error = "Número insuficiente de policiais no momento para iniciar o roubo."})
                    return true
                end
                if vRP.tryGetInventoryItem(user_id,item,1,true) then
                    cb(true)								
                    TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("progress",source,60000,"roubando")
                    vRPc._playAnim(source,false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)
                    SetTimeout(60*1000, function()
                        TriggerClientEvent('cancelando',source,false)
                            vRPc._stopAnim(source,false)
                            TriggerEvent("setPlateEveryone",placa)
                            vGARAGE.toggleLock(source,vnetid)
                            TriggerClientEvent("vrp_sound:source",source,'lock',0.5)
                            local x,y,z = vRPc.getPosition(source)
                            local policia = exports["vrp"]:getUsersByPermission("policia.permissao")
                            for k,v in pairs(policia) do
                                if not vRP.hasPermission(v, "medicomilitar.permissao") then 
                                    local player = vRP.getUserSource(parseInt(v))
                                    if player then
                                        TriggerClientEvent("Notify",player, "qru", _, _, _, 31, {x = x, y = y, z = z}, "Roubo de veículo <br> <b>"..vRP.vehicleName(vname).." - "..placa.."</b>")
                                    end
                                end
                            end
                    end)
                end
            end
        end
    },
    ["sapatosroubado"] = {
        index = "sapatosroubado",
        name = "Sapatos Roubado",
        weight = 0.2,
        type = "usar"
    },
    ["nitro"] = {
        index = "nitro",
        name = "Nitro",
        weight = 1.0,
        type = "usar"
    },
    ["colarroubado"] = {
        index = "colarroubado",
        name = "Colar Roubado",
        weight = 0.2,
        type = "usar"
    },
    ["cicatricure"] = {
        index = "cicatricure",
        name = "Cicatricure",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["anelroubado"] = {
        index = "anelroubado",
        name = "Anel Roubado",
        weight = 0.2,
        type = "usar"
    },
    ["relogioroubado"] = {
        index = "relogioroubado",
        name = "Relógio Roubado",
        weight = 0.3,
        type = "usar"
    },
    ["conhaque"] = {
        index = "conhaque",
        name = "Conhaque",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            cb(true)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,30000,"bebendo")
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)

            SetTimeout(30*1000, function()
                if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                cb(true)
                vRPc.playScreenEffect(source,"RaceTurbo",180)
                vRPc.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Conhaque</b> utilizada com sucesso.",8000)
            end)
        end
    },
    ["carnedecorvo"] = {
        index = "carnedecorvo",
        name = "Carne de Corvo",
        weight = 0.7,
        type = "usar"
    },
    ["vibrador"] = {
        index = "vibradorroubado",
        name = "Vibrador",
        weight = 0.2,
        type = "usar"
    },
    ["cordas"] = {
        index = "cordas",
        name = "Cordas",
        weight = 5.0,
        type = "usar"
    },
    ["capsula"] = {
        index = "capsula",
        name = "Cápsula",
        weight = 0.02,
        type = "usar"
    },
    ["capsula_ak"] = {
        index = "capsula_ak",
        name = "Cápsula AK",
        weight = 0.02,
        type = "usar"
    },
    ["capsula_thomp"] = {
        index = "capsula_thomp",
        name = "Cápsula Thompson",
        weight = 0.02,
        type = "usar"
    },
    ["capsula_mtar"] = {
        index = "capsula_mtar",
        name = "Cápsula Mtar",
        weight = 0.02,
        type = "usar"
    },
    ["capsula_uzi"] = {
        index = "capsula_uzi",
        name = "Cápsula Uzi",
        weight = 0.02,
        type = "usar"
    },
    ["carnedecoyote"] = {
        index = "carnedecoyote",
        name = "Carne de Coyote",
        weight = 1.0,
        type = "usar"
    },
    ["adubo"] = {
        index = "adubo",
        name = "Adubo",
        weight = 0.1,
        type = "usar"
    },
    ["camisinha"] = {
        index = "camisinha",
        name = "Camisinha",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,10000,"camisinha")
            vRPc._playAnim(source,true,{"misscarsteal2peeing","peeing_intro"},false)

            SetTimeout(10*1000, function()
                TriggerClientEvent('cancelando',source,false)
                TriggerClientEvent("Notify",source,"sucesso","<b>Camisinha</b> utilizada com sucesso.",5000)
                vRPc._stopAnim(source,false)
            end)
        end
    },
    ["camisinhausada"] = {
        index = "camisinhausada",
        name = "Camisinha usada",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local entity = GetPlayerPed(source)
            local life = GetEntityHealth(entity)

            if life <= 101 then 
                return cb({error = ""})
            end

            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,10000,"camisinha")
            vRPc._playAnim(source,true,{"misscarsteal2peeing","peeing_intro"},false)

            SetTimeout(20*1000, function()
                TriggerClientEvent('cancelando',source,false)
                TriggerClientEvent("Notify",source,"sucesso","<b>Camisinha</b> utilizada com sucesso.",5000)
                vRPc._stopAnim(source,false)

                Wait(2000)

                life = GetEntityHealth(entity)
                vRPc.setHealth(source, life - (life * 0.16))
            end)
        end
    },
    ["cataflan"] = {
        index = "cataflan",
        name = "Cataflan",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["dipirona"] = {
        index = "dipirona",
        name = "Dipirona",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["medkit"] = {
        index = "medkit",
        name = "Med Kit",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRPc.isInVehicle(source) then
                if vRP.hasPermission(user_id,"hospital.permissao") then
                    local nplayer = vRPc.getNearestPlayer(source,2)
                    if nplayer then
                        if GetEntityHealth(GetPlayerPed(nplayer)) > 101 then
                            vRPc.DeleteCam(nplayer)
                            TriggerClientEvent("tratamento",nplayer)
                            TriggerClientEvent("resetBleeding",nplayer)
                            TriggerClientEvent("resetDiagnostic",nplayer)
                            TriggerClientEvent("Notify",source,"medico","Tratamento no paciente iniciado com sucesso.",10000)
                            cb(true)
                        end
                    end
                end
            end
        end
    },

    ["carteiraroubada"] = {
        index = "carteiraroubada",
        name = "Carteira Roubada",
        weight = 0.2,
        type = "usar"
    },

    ["pirarucu"] = {
        index = "pirarucu",
        name = "Pirarucu",
        weight = 0.6,
        type = "usar"
    },

    ["tilapia"] = {
        index = "tilapia",
        name = "Tilapia",
        weight = 0.6,
        type = "usar"
    },
    
    ["acessodeepweb"] = {
        index = "acessodeepweb",
        name = "Acesso a Deep Web",
        weight = 0.1,
        type = "usar"
    },

    ["turtlemeat"] = {
        index = "turtlemeat",
        name = "Carne de Tartaruga",
        weight = 0.5,
        type = "usar"
    },

    ["vodka"] = {
        index = "vodka",
        name = "Vodka",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,30000,"bebendo")
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)
            vRPc._CarregarObjeto(source,"amb@world_human_drinking@beer@male@idle_a","idle_a","prop_amb_beer_bottle",49,28422)

            SetTimeout(30*1000, function()
                cb(true)
                vRPc.playScreenEffect(source,"RaceTurbo",180)
                vRPc.playScreenEffect(source,"DrugsTrevorClownsFight",180)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"bebidas","<b>Tequila</b> utilizada com sucesso.",8000)
            end)
        end
    },

    ["militec"] = {
        index = "militec",
        name = "Militec",
        weight = 0.8,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRPc.isInVehicle(source) then
                local vehicle,vnetid = vRPc.vehList(source,3.5)
                if vehicle then
                    if vRP.hasPermission(user_id,"mecanico.permissao") then
                        if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                        cb(true)
                        TriggerClientEvent('cancelando',source,true)
                        TriggerClientEvent("progress",source,30000,"reparando motor")
                        vGARAGE.vehicleClientHood(source,vnetid,false)
                        vRPc._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
                        SetTimeout(10*1000, function()
                            TriggerClientEvent('cancelando',source,false)
                            vRPc._stopAnim(source,false)
                            TriggerClientEvent('repararmotor',source,vehicle)
                            vGARAGE.vehicleClientHood(source,vnetid,true)

                            Wait(3000)

                            exports.conexao_garages:saveVehicle(vnetid,source)
                        end)
                    else
                        if vRP.tryGetInventoryItem(user_id,item,1,true,slot) then								
                            TriggerClientEvent('cancelando',source,true)
                            TriggerClientEvent("progress",source,30000,"reparando motor")
                            vGARAGE.vehicleClientHood(source,vnetid,false)
                            vRPc._playAnim(source,false,{"mini@repair","fixing_a_player"},true)
                            SetTimeout(10*1000, function()
                                TriggerClientEvent('cancelando',source,false)
                                vRPc._stopAnim(source,false)
                                TriggerClientEvent('repararmotor',source,vehicle)
                                vGARAGE.vehicleClientHood(source,vnetid,true)

                                Wait(3000)

                                exports.conexao_garages:saveVehicle(vnetid,source)
                            end)
                        end
                    end
                end
            end
        end
    },

    ["carnedecervo"] = {
        index = "carnedecervo",
        name = "Carne de Cervo",
        weight = 0.9,
        type = "usar"
    },

    ["carnedeaguia"] = {
        index = "carnedeaguia",
        name = "Carne de Aguia",
        weight = 0.8,
        type = "usar"
    },

    ["carnedecormorao"] = {
        index = "carnedecormorao",
        name = "Carne de Cormorao",
        weight = 0.7,
        type = "usar"
    },

    ["ticket"] = {
        index = "ticket",
        name = "Ticket",
        weight = 0.2,
        type = "usar"
    },
    ["casino_ticket"] = {
        index = "casino_ticket",
        name = "Casino Ticket",
        weight = 0.0,
        type = "usar"
    },
    ["casino_token"] = {
        index = "casino_token",
        name = "Casino Token",
        weight = 0.0,
        type = "usar"
    },

    ["petrolcan"] = {
        index = "petrolcan",
        name = "Galão Gasolina",
        weight = 5.0,
        type = "usar"
    },

    ["clozapina"] = {
        index = "clozapina",
        name = "Clozapina",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    
    ["racao"] = {
        index = "racao",
        name = "Racao",
        weight = 0.2,
        type = "usar"
    },
    ["omeprazol"] = {
        index = "omeprazol",
        name = "Omeprazol",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["polvora"] = {
        index = "polvora",
        name = "Pólvora",
        weight = 0.01,
        type = "usar"
    },
    ["polvora_ak"] = {
        index = "polvora_ak",
        name = "Pólvora AK",
        weight = 0.01,
        type = "usar"
    },
    ["polvora_thomp"] = {
        index = "polvora_thomp",
        name = "Pólvora Thompson",
        weight = 0.01,
        type = "usar"
    },
    ["polvora_mtar"] = {
        index = "polvora_mtar",
        name = "Pólvora Mtar",
        weight = 0.01,
        type = "usar"
    },
    ["polvora_uzi"] = {
        index = "polvora_uzi",
        name = "Pólvora Uzi",
        weight = 0.01,
        type = "usar"
    },
    ["tora"] = {
        index = "tora",
        name = "Tora",
        weight = 0.6,
        type = "usar"
    },
    ["adrenaline"] = {
        index = "adrenaline",
        name = "Adrenaline",
        weight = 0.7,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRPc.checkDistance(source,2435.12,4966.3,42.35,10) then
                local nplayer = vRPc.getNearestPlayer(source,2)
                if nplayer then
                    if GetEntityHealth(GetPlayerPed(nplayer)) <= 101 then
                        if vRP.getInventoryItemAmount(user_id,"adrenaline") >= 3 then
                            if vRP.tryGetInventoryItem(user_id, item, 3, true) then
                                TriggerClientEvent('cancelando',source,true)
                                TriggerClientEvent("progress",source,15000,"reanimando")
                                if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                                cb(true)
                                vRPc._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
                                SetTimeout(15 * 1000, function() 
                                    vRPc.killGod(nplayer)
                                    vRPc.setHealth(nplayer,150)
                                    TriggerClientEvent("resetBleeding",nplayer)
                                    TriggerClientEvent("resetDiagnostic",nplayer)
                                    TriggerClientEvent('cancelando',source,false)
                                    vRPc._stopAnim(source,false)	

                                end)
                            end
                        end
                    else
                        cb({error = "A pessoa precisa estar em coma para prosseguir."})
                    end
                end
            end
        end
    },
    ["algemas"] = {
        index = "algemas",
        name = "Algemas",
        weight = 1.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent("inventory_algema",source)
        end
    },
    ["postit"] = {
        index = "postit",
        name = "Postit",
        weight = 1.0,
        type = "usar"
    },
    ["garrafavazia"] = {
        index = "garrafavazia",
        name = "Garrafavazia",
        weight = 0.2,
        func =  nil,
        type = "usar"
    },	
    
    -- COMEDA
    
    ["agua"] = {
        index = "agua",
        name = "Agua",
        weight = 0.2,
        func =  nil,
        type = "beber"
    },
    ["hotdog"] = {
        index = "hotdog",
        name = "Hotdog",
        weight = 0.2,
        func =  nil,
        type = "beber"
    },
    ["cocacola"] = {
        index = "cocacola",
        name = "Coca Cola",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },

    ["cafe"] = {
        index = "cafe",
        name = "Cafe",
        weight = 0.2,
        func =  nil,
        type = "beber"
    },
    ["frango"] = {
        index = "frango",
        name = "Frango",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },
    ["pastel"] = {
        index = "pastel",
        name = "Pastel",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },
    ["sucol2"] = {
        index = "sucol2",
        name = "Sucol2",
        weight = 0.2,
        func =  nil,
        type = "beber"
    },
   
    ["pizza"] = {
        index = "pizza",
        name = "Pizza",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },
    ["batata"] = {
        index = "batata",
        name = "Batata",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },
    ["sprunk"] = {
        index = "sprunk",
        name = "Sprunk",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },
    ["pipoca"] = {
        index = "pipoca",
        name = "Pipoca",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },

    ["sanduiche"] = {
        index = "sanduiche",
        name = "Sanduiche",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },

    ["coxinha"] = {
        index = "coxinha",
        name = "Coxinha",
        weight = 0.2,
        func =  nil,
        type = "comer"
    },

    -- COMEDA

    ["sabonete"] = {
        index = "sabonete",
        name = "Sabonete",
        weight = 0.2,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local status, time = exports['vrp']:getCooldown(user_id, "limparmaos")
            if status then
            exports['vrp']:setCooldown(user_id, "limparmaos", 7)
            else
            Notify(source,"negado","Aguarde "..((time or "alguns")).." segundos para lavar novamente!")
            return
            end
            TriggerClientEvent('checkIsEntityInWater',source)
            Wait(500)
            if not IN_WATER[source].water then TriggerClientEvent("Notify",source,"negado","Você precisa estar sob a água.",7000) return cb(true) end
            TriggerClientEvent("progress",source,6000,"Lavando as mãos...")
            Remote.blockButtons(source,true)           
            vRPc._playAnim(source,false,{"amb@prop_human_bum_bin@idle_b","idle_d"},true)
            TriggerClientEvent("scanner:cleanHandEffect", source)
            vRP._removeInventoryItem(user_id,"sabonete",1)
            if GetResourceState('scanner') == 'started' then exports['scanner']:cleanHand(user_id, source) end
            cb(true)
            SetTimeout(1000, function()
                Remote.blockButtons(source,false)
                vRPc._removeObjects(source,"one")
                
            end)
        end,
        type = "usar"
    },	

    ["cafe"] = {
        index = "cafe",
        name = "Café",
        weight = 0.8,
        type = "beber"
    },
    ["pendrive"] = {
        index = "pendrive",
        name = "Pendrive",
        weight = 0.1,
        type = "usar"
    },
    ["carnedecoelho"] = {
        index = "carnedecoelho",
        name = "Carne de Coelho",
        weight = 0.7,
        type = "usar"
    },
    ["perfumeroubado"] = {
        index = "perfumeroubado",
        name = "Perfume Roubado",
        weight = 0.2,
        type = "usar"
    },
    ["laptop"] = {
        index = "laptop",
        name = "Notebook",
        weight = 3.0,
        type = "usar"
    },
    ["fotografia"] = {
        index = "fotografia",
        name = "Fotografia",
        weight = 0.1,
        type = "usar"
    },
    ["fluoxetina"] = {
        index = "fluoxetina",
        name = "Fluoxetina",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },

    ["capuz"] = {
        index = "capuz",
        name = "Capuz",
        weight = 0.5,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local nplayer = vRPc.getNearestPlayer(source,2)
            if nplayer then
                if not vRPc.isCapuz(nplayer) then
                    if not vRPc.isHandcuffed(nplayer) then 
                        TriggerClientEvent("Notify", source, "negado", "O jogador precisa estar algemado!") 
                        return 
                    end
                    vRP._tryGetInventoryItem(user_id, 'capuz', 1)
                end
                vRPc.setCapuz(nplayer) 
                vRP.closeMenu(nplayer)
                TriggerClientEvent("Notify",source,"aviso","Capuz utilizado com sucesso.",8000)
            end  
        end
    },
    ["dorflex"] = {
        index = "dorflex",
        name = "Dorflex",
        weight = 0.1, 
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                Remote._usePill(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["anesthesia"] = {
        index = "anesthesia",
        name = "Anestesia",
        weight = 0.7,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.hasPermission(user_id,"hospital.permissao") then
                local nplayer = vRPc.getNearestPlayer(source,2)
                if nplayer then
                    if GetEntityHealth(GetPlayerPed(nplayer)) > 101 then
                        TriggerClientEvent("anesthesia",nplayer)
                        TriggerClientEvent("Notify",source,"medico","Anestesia no paciente aplicada com sucesso.",10000)
                        if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                        cb(true)
                    end
                end
            end
        end
    },
    ["anestesia"] = {
        index = "anestesia",
        name = "Anestesia",
        weight = 0.5,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRP.hasPermission(user_id, "hospital.permissao") then 
                return
            end

            local nplayer = vRPc.getNearestPlayer(source,5)

            if not nplayer then 
                TriggerClientEvent('Notify',source,'negado','Não <b>existe</b> um paciente perto de você.')
                cb(false)
                return
            end

            local effectTime = tonumber(vRP.prompt(source, 'Digite o tempo em segundos para duração da anestesia', '55'))

            if not effectTime then
                TriggerClientEvent('Notify',source,'negado','Informe o <b>tempo</b> em <b>segundos</b>.')
                cb(false)
                return
            end

            if effectTime > 60 then 
                TriggerClientEvent('Notify',source,'negado','O tempo máximo é de <b>60</b> segundos.')
                cb(false)
                return 
            end 
            
            TriggerClientEvent('Notify',source,'sucesso','Você <b>aplicou</b> anestesia no paciente.')
            TriggerClientEvent('Notify',nplayer,'sucesso','Você <b>foi</b> anestesiado.')

            TriggerClientEvent('anesthesia:effect',nplayer,effectTime)
            
            cb(true)
        end
    },
    ["bodybag"] = {
        index = "bodybag",
        name = "Saco de Óbito",
        weight = 0.7,
        keep_item = true, 
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if not vRPc.isInVehicle(source) then
                if vRP.hasPermission(user_id,"hospital.permissao") then
                    local value = vRP.getUData(parseInt(user_id),"vRP:ParamedicPromotion")
                    local pp = json.decode(value) or 0
                    if pp >= 4 then
                        local nplayer = vRPc.getNearestPlayer(source,2)
                        if nplayer then
                            if GetEntityHealth(GetPlayerPed(nplayer)) <= 101 then
                                TriggerClientEvent('personDeath',nplayer)
                                TriggerClientEvent("Notify",source,"medico","Paciente foi a óbito.")
                                if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
                                cb(true)
                            else
                                TriggerClientEvent("Notify",source,"importante","A pessoa precisa estar em coma para prosseguir.",8000)
                                cb(true)
                            end
                        end
                    end
                end
            end
        end
    },
    ["sacodelixo"] = {
        index = "sacodelixo",
        name = "Saco de Lixo",
        weight = 1.0,
        type = "usar"
    },
    ["anticoncepcional"] = {
        index = "anticoncepcional",
        name = "Anticoncepcional",
        weight = 0.1,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,5000,"remedio")
            vRPc._CarregarObjeto(source,"mp_player_intdrink","loop_bottle","ng_proc_drug01a002",49,60309)

            SetTimeout(5*1000, function()
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"medico","<b>Remédio</b> utilizado com sucesso.",8000)
            end)
        end
    },
    ["carnedejavali"] = {
        index = "carnedejavali",
        name = "carne de Javali",
        weight = 1.4,
        type = "usar"
    },
    ["chip"] = {
        index = "chip",
        name = "Chip",
        weight = 1.0,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            vRP.execute("vRP/update_phone",{ user_id = user_id, phone = vRP.generatePhoneNumber() })
            cb(true)
        end
    },
    ["garrafadeleite"] = {
        index = "garrafadeleite",
        name = "Garrafa de Leite",
        weight = 0.5,
        type = "usar"
    },


    ["latasdetinta"] = {
        index = "latasdetinta",
        name = "Lata de Tinta",
        weight = 0.1,
        type = "usar"
    },
    ["insufilm"] = {
        index = "insufilm",
        name = "Insufilm",
        weight = 0.1,
        type = "usar"
    },
    ["turbo"] = {
        index = "turbo",
        name = "Turbo",
        weight = 0.2,
        type = "usar"
    },
    ["transmissao"] = {
        index = "transmissao",
        name = "Transmissao",
        weight = 0.2,
        type = "usar"
    },
    ["suspensao"] = {
        index = "suspensao",
        name = "Suspensao",
        weight = 0.2,
        type = "usar"
    },
    ["saias"] = {
        index = "saias",
        name = "Saias",
        weight = 0.1,
        type = "usar"
    },
    ["rodas"] = {
        index = "rodas",
        name = "Rodas",
        weight = 0.2,
        type = "usar"
    },
    ["parachoque"] = {
        index = "parachoque",
        name = "Parachoque",
        weight = 0.2,
        type = "usar"
    },
    ["motor"] = {
        index = "motor",
        name = "Motor",
        weight = 0.2,
        type = "usar"
    },
    ["hidraulica"] = {
        index = "hidraulica",
        name = "Hidraulica",
        weight = 0.2,
        type = "usar"
    },
    ["freios"] = {
        index = "freios",
        name = "Freios",
        weight = 0.2,
        type = "usar"
    },
    ["filtrodear"] = {
        index = "filtrodear",
        name = "Filtrodear",
        weight = 0.2,
        type = "usar"
    },
    ["escapamento"] = {
        index = "escapamento",
        name = "Escapamento",
        weight = 0.2,
        type = "usar"
    },
    ["capo"] = {
        index = "capo",
        name = "Capo",
        weight = 0.1,
        type = "usar"
    },
    ["buzina"] = {
        index = "buzina",
        name = "Buzina",
        weight = 0.1,
        type = "usar"
    },
    ["aerofolio"] = {
        index = "aerofolio",
        name = "Aerofolio",
        weight = 0.1,
        type = "usar"
    },
    ["pneu"] = {
        index = "pneu",
        name = "Pneu",
        weight = 0.1,
        type = "usar"
    },
    ["kevlar"] = {
        index = "kevlar",
        name = "Kevlar",
        weight = 0.2,
        type = "usar"
    },
    ["fender"] = {
        index = "fender",
        name = "Fender",
        weight = 0.1,
        type = "usar"
    },

    ["grade"] = {
        index = "grade",
        name = "Grade",
        weight = 0.2,
        type = "usar"
    },
    ["santoantonio"] = {
        index = "santoantonio",
        name = "Santoantonio",
        weight = 0.1,
        type = "usar"
    },
    ["muda-cannabis"] = {
        index = "muda-cannabis",
        name = "Muda Cannabis",
        weight = 0.8,
        type = "usar"
    },    
    ["bucha-cannabis"] = {
        index = "bucha-cannabis",
        name = "Bucha Cannabis",
        weight = 0.8,
        type = "usar"
    },
    ["heroina"] = {
        index = "heroina",
        name = "Heroina",
        weight = 0.2,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.hasPermission(user_id, "crianca.permissao") then return end

            vRPc._playAnim(source,true,{"mp_player_int_uppersmoke","mp_player_int_smoke"},true)
            cb(true)

            SetTimeout(10*1000, function()
                TriggerClientEvent('energeticos',source,true)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"drogas","<b>Droga</b> utilizada com sucesso.",8000)
            end)

            SetTimeout(40000,function()
                TriggerClientEvent('energeticos',source,false)
                TriggerClientEvent("Notify",source,"aviso","O coração voltou a bater normalmente.",8000)
            end)
        end
    },
    ["opio"] = {
        index = "opio",
        name = "Opio",
        weight = 0.1,
        type = "usar"
    },
    ["morfina"] = {
        index = "morfina",
        name = "Morfina",
        weight = 0.1,
        type = "usar"
    },
    ["taurina"] = {
        index = "taurina",
        name = "Taurina",
        weight = 0.4,
        type = "usar"
    },
    ["cafeina"] = {
        index = "cafeina",
        name = "Cafeina",
        weight = 0.2,
        type = "usar"
    },
    ["cristalrefinado"] = {
        index = "cristalrefinado",
        name = "Cristalrefinado",
        weight = 0.4,
        type = "usar"
    },
    ["cannabis"] = {
        index = "cannabis",
        name = "Cannabis",
        weight = 0.4,
        type = "usar"
    },
    ["haxixe"] = {
        index = "haxixe",
        name = "Haxixe",
        weight = 0.4,
        type = "usar"
    },
    ["pastabase"] = {
        index = "pastabase",
        name = "Pastabase",
        weight = 0.4,
        type = "usar"
    },
    ["docedeecstasy"] = {
        index = "docedeecstasy",
        name = "Doce de Ecstasy",
        weight = 0.4,
        type = "usar"
    },
    ["ametista"] = {
        index = "ametista",
        name = "Ametista",
        weight = 0.4,
        type = "usar"
    },
    ["hidrazida"] = {
        index = "hidrazida",
        name = "Hidrazida",
        weight = 0.1,
        type = "usar"
    },
    ["acidocloridrico"] = {
        index = "acidocloridrico",
        name = "Acidocloridrico",
        weight = 0.1,
        type = "usar"
    },
    ["pirazol"] = {
        index = "pirazol",
        name = "Pirazol",
        weight = 0.4,
        type = "usar"
    },
    ["pastadecrack"] = {
        index = "pastadecrack",
        name = "Pasta de crack",
        weight = 0.1,
        type = "usar"
    },
    ["maconha"] = {
        index = "maconha",
        name = "Maconha",
        weight = 0.2,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.hasPermission(user_id, "crianca.permissao") then return end

            vRPc._playAnim(source,true,{"mp_player_int_uppersmoke","mp_player_int_smoke"},true)
            if GetResourceState('scanner') == 'started' then exports['scanner']:dirtyHand(user_id, Items[item].index) end
            cb(true)

            SetTimeout(10*1000, function()
                TriggerClientEvent('energeticos',source,true)
                TriggerClientEvent('cancelando',source,false)
                vRPc._DeletarObjeto(source)
                TriggerClientEvent("Notify",source,"drogas","<b>Droga</b> utilizada com sucesso.",8000)
            end)

            SetTimeout(40000,function()
                TriggerClientEvent('energeticos',source,false)
                TriggerClientEvent("Notify",source,"aviso","O coração voltou a bater normalmente.",8000)
            end)
        end
    },
    ["semente"] = {
        index = "semente",
        name = "Semente",
        weight = 0.1,
        type = "usar"
    },
    ["folhadecoca"] = {
        index = "folhadecoca",
        name = "Folha de Coca",
        weight = 0.4,
        type = "usar"
    },
    ["backpackp"] = {
        index = "backpackp",
        name = "Mochila P",
        type = "usar",
        weight = 1.0
    },
    ["backpackm"] = {
        index = "backpackm",
        name = "Mochila M",
        type = "usar",
        weight = 2.0
    },
    ["backpackg"] = {
        index = "backpackg",
        name = "Mochila G",
        type = "usar",
        weight = 3.0
    },
    ["backpackx"] = {
        index = "backpackx",
        name = "Mochila X",
        type = "usar",
        weight = 4.0
    },
    ["eletronics"] = {
        index = "eletronics",
        name = "Eletrônico",
        type = "usar",
        weight = 0.01
    },
    ["notebook"] = {
        index = "notebook",
        name = "Notebook",
        weight = 2.0,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRPc.isInVehicle(source) then
                local vehicle,vnetid,placa,vname,lock,banned = vRPc.vehList(source,7)
                if vehicle and placa then
                    cb(true)
                    vGARAGE.freezeVehicleNotebook(source,vehicle)
                    TriggerClientEvent('cancelando',source,true)
                    TriggerClientEvent("progress",source,59500,"removendo rastreador")
                    SetTimeout(60000,function()									
                        TriggerClientEvent('cancelando',source,false)
                        local placa_user_id = vRP.getUserByRegistration(placa)
                        if placa_user_id then
                            local player = vRP.getUserSource(placa_user_id)
                            if player then
                                vGARAGE.removeGpsVehicle(player,vname)
                            end
                        end
                    end)
                end
            end
        end
    },
    ["keyboard"] = {
        index = "keyboard",
        name = "Teclado",
        type = "usar",
        weight = 0.4
    },
    ["mouse"] = {
        index = "mouse",
        name = "Mouse",
        type = "usar",
        weight = 0.2
    },
    ["watch"] = {
        index = "watch",
        name = "Relógio",
        type = "usar",
        weight = 0.3
    },
    ["c4"] = {
        index = "c4",
        name = "C4",
        type = "usar",
        weight = 3.0
    },
    ["lighter"] = {
        index = "lighter",
        name = "Isqueiro",
        type = "usar",
        weight = 0.3
    },
    ["vape"] = {
        index = "vape",
        name = "Vape",
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            Remote.closeInventory(source)
            Remote.blockButtons(source,true)
            TriggerClientEvent("progress",source,60000,"Fumando...")
            vRPc._CarregarObjeto(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","ba_prop_battle_vape_01",49,18905,0.08,-0.00,0.03,-150.0,90.0,-10.0)
            cb(true)

            SetTimeout(60*1000, function()
                Remote.blockButtons(source,false)
                vRPc._removeObjects(source,"one")
            end)
        end,
        weight = 0.8
    },
    ["blackcard"] = {
        index = "blackcard",
        name = "Cartão Preto",
        type = "usar",
        weight = 0.1
    },
    ["bluecard"] = {
        index = "bluecard",
        name = "Cartão Azul",
        type = "usar",
        weight = 0.1
    },
    ["chocolate"] = {
        index = "chocolate",
        name = "Chocolate",
        weight = 0.2,
        func =  nil,
        type = "usar"
    },
    ["hamburguer"] = {
        index = "hamburguer",
        name = "Hamburguer",
        weight = 0.2,
        func =  nil,
        type = "usar"
    },
    ["sandwich"] = {
        index = "sandwich",
        name = "Sanduiche",
        type = "usar",
        weight = 0.2
    },
    ["rose"] = {
        index = "rose",
        name = "Rosa",
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            Remote.closeInventory(source)
            vRPc._CarregarObjeto(source,"anim@heists@humane_labs@finale@keycards","ped_a_enter_loop","prop_single_rose",49,18905,0.13,0.15,0.0,-100.0,0.0,-20.0)
        end,
        weight = 0.1
    },
    ["teddy"] = {
        index = "teddy",
        name = "Teddy",
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            Remote.closeInventory(source)
            vRPc._CarregarObjeto(source,"impexp_int-0","mp_m_waremech_01_dual-0","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
        end,
        weight = 0.8
    },
    ["cigarro"] = {
        index = "cigarro",
        name = "Cigarro",
        weight = 0.25,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            if vRP.getInventoryItemAmount(user_id,"isqueiro") >= 1 then
                TriggerClientEvent("emotes", source, "fumar999nt")
                cb(true)
            else
                vRP.giveInventoryItem(user_id, item, 1, true)
                TriggerClientEvent("Notify",source,"negado","Você precisa de um isqueiro para acender o cigarro.",5000)
            end
            return cb(false)
        end
    },
    ["isqueiro"] = {
        index = "isqueiro",
        name = "Isqueiro",
        weight = 0.25,
        keep_item = true,
        type = "usar"
    },
    ["absolut"] = {
        index = "absolut",
        name = "Absolut",
        type = "usar",
        weight = 0.2
    },
    ["chandon"] = {
        index = "chandon",
        name = "Chandon",
        type = "usar",
        weight = 0.2
    },
    ["dewars"] = {
        index = "dewars",
        name = "Dewars",
        type = "usar",
        weight = 0.2
    },
    ["hennessy"] = {
        index = "hennessy",
        name = "Hennessy",
        type = "usar",
        weight = 0.2
    },
    ["identity"] = {
        index = "identity",
        name = "Identidade",
        weight = 0.2,
        keep_item = true,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local nplayer = vRPc.getNearestPlayer(source,2)
            if nplayer then
                local identity = vRP.getUserIdentity(user_id)
                if identity then
                    TriggerClientEvent("Identity2",nplayer,identity.name,identity.firstname,identity.user_id,identity.registration)
                    cb(true)
                end
            end
        end
    },
    ["goldbar"] = {
        index = "goldbar",
        name = "Barra de Ouro",
        type = "usar",
        weight = 1.0
    },
    ["camera"] = {
        index = "camera",
        name = "Câmera",
        type = "usar",
        weight = 2.5
    },
    ["playstation"] = {
        index = "playstation",
        name = "Playstation",
        type = "usar",
        weight = 2.0
    },
    ["xbox"] = {
        index = "xbox",
        name = "Xbox",
        type = "usar",
        weight = 2.0
    },
    ["legos"] = {
        index = "legos",
        name = "Legos",
        type = "usar",
        weight = 0.1
    },
    ["ominitrix"] = {
        index = "ominitrix",
        name = "Ominitrix",
        type = "usar",
        weight = 0.5
    },
    ["bracelet"] = {
        index = "bracelet",
        name = "Bracelete",
        type = "usar",
        weight = 0.2
    },

    ["gsrkit"] = {
        index = "gsrkit",
        name = "Kit Residual",
        type = "usar",
        weight = 0.75
    },
    ["gdtkit"] = {
        index = "gdtkit",
        name = "Kit Químico",
        type = "usar",
        weight = 0.75
    },
    ["fueltech"] = {
        index = "fueltech",
        name = "Fueltech",
        type = "usar",
        weight = 3.00
    },
    ["cpuchip"] = {
        index = "cpuchip",
        name = "Processador",
        type = "usar",
        weight = 0.75
    },
    ["arroz"] = {
        index = "arroz",
        name = "Arroz",
        type = "usar",
        weight = 0.3
    },
    ["nori"] = {
        index = "nori",
        name = "Nori",
        type = "usar",
        weight = 0.3
    },
    ["pate"] = {
        index = "pate",
        name = "Pate",
        type = "usar",
        weight = 0.3
    },
    ["onigiri"] = {
        index = "onigiri",
        name = "Onigiri",
        type = "usar",
        weight = 0.3
    },

    ["papel"] = {
        index = "papel",
        name = "Papel",
        type = "usar",
        weight = 0.1
    },
    ["tinta"] = {
        index = "tinta",
        name = "Tinta",
        type = "usar",
        weight = 0.1
    },
    ["plastico"] = {
        index = "plastico",
        name = "Plástico",
        type = "usar",
        weight = 0.1
    },
    ["metal"] = {
        index = "metal",
        name = "Metal",
        type = "usar",
        weight = 0.05
    },

    ["tintaperolado"] = {
        index = "tintaperolado",
        name = "Lata de Tinta Especial",
        weight = 0.1,
        type = "usar"
    },
    ["teto"] = {
        index = "teto",
        name = "Teto",
        weight = 0.5,
        type = "usar"
    },
    ["tintaDeCaneta"] = {
        index = "tintaDeCaneta",
        name = "Tinta de Caneta",
        weight = 0.1,
        type = "usar"
    },
    ["clipe"] = {
        index = "clipe",
        name = "Clipe",
        weight = 0.1,
        type = "usar"
    },
    ["fogos-azul"] = {
        index = "fogos-azul",
        name = "Fogos Azul",
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            createFireWork(source,'blue')
            Remote.closeInventory(source)
        end,
        weight = 0.1
    },
    ["fogos-rosa"] = {
        index = "fogos-rosa",
        name = "Fogos Rosa",
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            createFireWork(source,'rose')
            Remote.closeInventory(source)
        end,
        weight = 0.1
    },

    ["macadoamor"] = {
        index = "macadoamor",
        name = "Maça do amor",
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent("emotes", source, "maca")
            Remote.closeInventory(source)
            SetTimeout(20000, function()
                vRPc._DeletarObjeto(source)
            end)
        end,
        weight = 0.1
    },
    ["pamonha"] = {
        index = "pamonha",
        name = "Pamonha",
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent("emotes", source, "pamonha")
            Remote.closeInventory(source)
            SetTimeout(20000, function()
                vRPc._DeletarObjeto(source)
            end)
        end,
        weight = 0.1
    },
    ["primeirossocorros"] = {
        index = "primeirossocorros",
        name = "Primeiros Socorros",
        weight = 0.7,
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            local nplayer = vRPc.getNearestPlayer(source,2)

            if GetResourceState('scanner') ~= 'started' then
                return cb({error = "Script [scanner] não iniciado."})
            end

            if not nplayer then 
                return  cb({error = "Ninguém por perto."})
            end

            if GetEntityHealth(GetPlayerPed(nplayer)) > 101 then 
                return cb({error = "A pessoa precisa estar em coma para prosseguir."})
            end

            TriggerClientEvent('cancelando',source,true)
            TriggerClientEvent("progress",source,7000,"reanimando")
            exports['scanner']:dirtyHand(user_id, Items[item].index)
            cb(true)
            vRPc._playAnim(source,false,{"mini@cpr@char_a@cpr_str","cpr_pumpchest"},true)
            
            SetTimeout(10 * 1000, function()
                vRPc.killGod(nplayer)
                vRPc.setHealth(nplayer,150)
                TriggerClientEvent("resetBleeding",nplayer)
                TriggerClientEvent("resetDiagnostic",nplayer)
                TriggerClientEvent('cancelando',source,false)
                vRPc._stopAnim(source,false)
            end)
        end
    },

    
    ["milho"] = {
        index = "milho",
        name = "Milho",
        type = "usar",
        func = function(user_id, source, item, slot, cb)
            TriggerClientEvent("emotes", source, "milho")
            Remote.closeInventory(source)
            SetTimeout(20000, function()
                vRPc._DeletarObjeto(source)
            end)
        end,
        weight = 0.1
    },
    ["correnteroubada"] = {
        index = "correnteroubada",
        name = "Corrente Roubada",
        weight = 0.2,
        type = "usar"
    },   
    ["celularroubado"] = {
        index = "celularroubado",
        name = "Celular Roubado",
        weight = 0.2,
        type = "usar"
    },
    
    ["produto-quimico"] = {
        index = "produto-quimico",
        name = "Produto químico",
        weight = 0.02,
        type = "usar"
    },

    ["nos"] = {
        index = "nos",
        name = "Nos",
        weight = 0.02,
        type = "usar"
    },
    ["cartaoroubado"] = {
        index = "cartaoroubado",
        name = "Cartão Roubado",
        weight = 0.02,
        type = "usar"
    },
    ["chipdecartao"] = {
        index = "chipdecartao",
        name = "Chip de Cartão ",
        weight = 0.02,
        type = "usar"
    },

    ["honrapolicial"] = {
        index = "blackcard",
        name = "Honra Policial",
        type = "usar",
        weight = 0.1
    },
    ["bala"] = {
        index = "bala",
        name = "Bala",
        type = "usar",
        weight = 0.2
    },

    ["latinha"] = {
        index = "latinha",
        name = "Latinha",
        type = "usar",
        weight = 0.5
    },

    ["papelamassado"] = {
        index = "papelamassado",
        name = "Papel amassado",
        type = "usar",
        weight = 0.5
    },

    ["papelaorasgado"] = {
        index = "papelaorasgado",
        name = "Papelão rasgado",
        type = "usar",
        weight = 0.5
    },

    ["plastico"] = {
        index = "plastico",
        name = "Plastico",
        type = "usar",
        weight = 0.1
    },

    ["fusiongroupcoin"] = {
        index = "fusiongroupcoin",
        name = "Dominascoin",
        type = "usar",
        weight = 0.1
    },

    ["vidro"] = {
        index = "vidro",
        name = "Vidro",
        type = "usar",
        weight = 0.5
    },

    ["cascadebanana"] = {
        index = "cascadebanana",
        name = "Casca de banana",
        type = "usar",
        weight = 0.5
    },

    ["macamordida"] = {
        index = "macamordida",
        name = "Maça mordida",
        type = "usar",
        weight = 0.5
    },

    ["camisinhausada"] = {
        index = "camisinhausada",
        name = "Camisinha usada",
        type = "usar",
        weight = 0.5
    },
    
    ["xcarteira"] = {
        index = "xcarteira",
        name = "Carteira OAB",
        type = "usar",
        weight = 0
    },
}

if IsDuplicityVersion() then 
    RegisterCommand('rscuba', function(source,args)
        local user_id = vRP.getUserId(source)
        if user_id then
            local ok = vRP.request(source, "Você deseja retirar a sua scuba?", 30)
            if ok and (GetEntityHealth(GetPlayerPed(source)) > 105) then
                if Remote.checkScuba(source) then
                    Remote._setScuba(source, false)
                    TriggerClientEvent("Notify",source,"negado","Você retirou sua scuba, não conseguimos recuperar ela houve um vazamento.", 5)
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possui scuba equipada.", 5)
                end
            end
        end
    end)
end



function itemBodyList(item)
	if Items[item] then
		return Items[item]
	end
end

function itemIndexList(item)
	if Items[item] then
		return Items[item].index
	end
end

function itemImageList(item)
	if Items[item] then
        if Items[item].png then
            return Items[item].png
        end
        return Items[item].index
    end
end

function itemList(item)
	if Items[item] then
		return Items[item].name
	end
	return "Deleted"
end

function itemTypeList(item)
	if Items[item] then
		return Items[item].type
	end
end

function itemAmmoList(item)
	if Items[item] then
		return Items[item].ammo
	end
end

function itemWeightList(item)
	if Items[item] then
		return Items[item].weight
	end
	return 0
end
