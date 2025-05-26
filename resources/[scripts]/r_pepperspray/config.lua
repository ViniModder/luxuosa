/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-pepper-spray
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Configuration ]]

Config = {
    Language = 'en', -- Language library used for the script, see the last lines to modify the text of the language. (Config.Languages)

    CheckVersion = true, -- Checks if an update is needed, the message will be put in the server console when the resource is started

    ESX = false, -- ESX compatibility (you can modify this function on cl_utils.lua)
        
    QB = false, -- QB compatibility (you can modify this function on cl_utils.lua)

    AcePermission = { -- Use of the ace permission system (you can modify this function on cl_utils.lua)
        enabled = false,
        permission = 'perm.policia'
    },

    RechargeCoords = { -- Coordinated to recharge the pepper spray and decontamination spray
        vector3(-1642.32,177.58,61.81),
        vector3(-1583.12,213.37,59.31),
    },
    RechargeRadius = 3.0, -- Distance to recharge

    DisableSprintWhenGassed = true, --Ativar ou não o fato de correr quando a pessoa for gaseada
    DisableEnterVehicleWhenGassed = true, -- Ativar ou desativar a capacidade de entrar em um veículo quando ele estiver abastecido

    PepperSpray = { -- Aqui você pode configurar um novo spray quantas vezes quiser (veja a documentação para mais informações)
    -- Você pode adicionar quantos sprays de pimenta quiser nesta tabela!
        ['spray'] = {
            weapon = `WEAPON_PEPPERSPRAY`, -- Model of the weapon for the spray
            requiredJob = { -- Job required to recover this gas (this configuration is enabled when you activate ESX or QB above)
                'police',
                'fbi'
            },

            sprayQuantity = 500, -- Quantity of spray
            sprayDescent = 20, --Tempo em milissegundos para diminuir a taxa de recuperação (quanto maior o número, maior o tempo)
            sprayRange = 6, -- A distância do spray para atingir os outros jogadores
            sprayDamageMultiplier = 1, -- 25*the multiplier (for the bar to be at 100, the multiplier must be at 4 the maximum of the multiplier) (by default the multiplier is set to 1 so the bar will rise in 25)

            gasDescent = 500, -- Rate of descent of the progress bar

            splitEnabled = true, -- Active or not to spit
            splitDescent = 5, -- How many percent when you spit the recovery rate will decrease
            splitTimeout = 10000, -- Time in milliseconds to spit again

            rubbingEnabled = true, -- Active or not for rubbing the eyes
            rubbingDescent = 2.0, -- The above descentSpeed will be divided into this number when you rub your eyes

            selfDecontamination = true, -- Activate or not the player's self decontamination with a decontamination spray when you are gassed.

            effect = {
                timecycle = { -- Visual effects when gassing (two effects maximum) (to disable an effect, simply delete the 'name' content) https://wiki.rage.mp/index.php?title=Timecycle_Modifiers
                    [1] = {
                        name = 'ufo',
                        opacity = 1.0
                    },
                    [2] = {
                        name = 'MP_death_grade_blend01',
                        opacity = 0.8
                    }
                },
                shakeCamera = { -- Screen shake (to disable, simply remove the 'name' content) https://pastebin.com/NdpyVNP0
                    name = 'DRUNK_SHAKE',
                    intensity = 3.0
                }
            },

            particle = { -- Particle of the spray when it will be in action
                dict = 'core',
                particle = 'exp_sht_extinguisher',
                particleCoords = vector3(0.10, 0.0, 0.0),
                particleRotation = vector3(-80.0, 0.0, -90.0),
                particleSize = 0.5
            },

            gasMask = { -- Exeption of gas damage when you have one of the following masks (see the documentation for more information)
                [`mp_m_freemode_01`] = { -- Male
                    [1] = {}, -- example: {38, 39}
                    [2] = {}
                },
                [`mp_f_freemode_01`] = { -- Female
                    [1] = {},
                    [1] = {}
                }
            }
        }
    },

    Decontamination = {
        command = 'antidote', -- Command to recover the decontamination spray (you can modify the command from cl_utils.lua)
        weapon = `WEAPON_ANTIDOTE`, -- Decontamination spray weapon
        requiredJob = { -- Job required to recover this gas (this configuration is enabled when you activate ESX or QB above)
            'police',
            'fbi'
        },

        decontaminationQuantity = 100, -- Quantity of decontamination spray
        decontaminationDescent = 10, -- Time in milliseconds to lower the recovery rate (The higher the number, the longer the time)
        decontaminationTimeout = 2000, -- Time in miliseconds to use the decontamination spray

        decreaseLevel = 10, -- The rate of descent when you apply the decontamination spray on someone

        particle = { -- Particle of the decontamination spray when it will be in action
            dict = 'scr_bike_business',
            particle = 'scr_bike_spraybottle_spray',
            particleCoords = vector3(0.30, 0.0, 0.0),
            particleRotation = vector3(-80.0, 0.0, -90.0),
            particleSize = 1.5,
        }
    }
}

Config.Design = {
    ProgressBar = {
        color = {52, 152, 219}, -- RGB color of the progress bar.
        text = 'RECOVERY' -- Max 8 caracters. (If you don't put anything here, the text will be deleted and the bar will become bigger)
    }
}

-- https://docs.fivem.net/docs/game-references/controls/
Config.Keys = {
    SplitKey = 47, -- Key to spit
    SplitKeyString = '~INPUT_DETONATE~', -- Key string to spit

    RubbingKey = 104, -- Key to rub the eyes
    RubbingKeyString = '~INPUT_VEH_SHUFFLE~', -- Key string to rub the eyes

    ReplaceKey = 47, -- Key to replace your pepper spray
    ReplaceKeyString = '~INPUT_DETONATE~' -- Key string to replace your pepper spray
}

-- Libraries of languages.
Config.Languages = {
    ['en'] = {
        ['quantity'] = 'You have ~b~{s}ml',
        ['split'] = 'To spit press '..Config.Keys.SplitKeyString,
        ['rubbing'] = 'Rubbing the eyes press '..Config.Keys.RubbingKeyString,
        ['replacepepperspray'] = 'Replace your pepper spray press '..Config.Keys.ReplaceKeyString,
        ['replacedecontamination'] = 'Replace your decontamination spray press '..Config.Keys.ReplaceKeyString
    },
    ['fr'] = {
        ['quantity'] = 'Il vous reste ~b~{s}ml',
        ['split'] = 'Pour cracher presse '..Config.Keys.SplitKeyString,
        ['rubbing'] = 'Pour se frotter les yeux presse '..Config.Keys.RubbingKeyString,
        ['replacepepperspray'] = 'Remplacer la gazeuse presse '..Config.Keys.ReplaceKeyString,
        ['replacedecontamination'] = 'Changer de décontaminant presse '..Config.Keys.ReplaceKeyString
    }
}