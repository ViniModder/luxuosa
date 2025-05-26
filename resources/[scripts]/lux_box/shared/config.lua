Config = {
    finishTime = 1706758685,
    website = 'https://luxuosarj.hydrus.gg/categories/325867https://luxuosarj.hydrus.gg/categories/325867',
    payFree = 5, --- pagamento nos minutos free
    payVip = 10, --- pagamento nos minutos vip
    timingVip = 30, --- tempo vip pra dar as moedas acima
    timingFree = 10,  --- tempo free pra dar as moedas acima
    defaultReward = { ----- ranking do ultimo ganhador
        photo = '',
        name = 'luxuosa',
        user_id = 1,
        award = '1x VIP OURO',
        time_played = 60,
        desc = 'Ola,',
    },

    topRewards = { -- PREMIAÇÃO 1/2/3 do ranking
        [1] = '1x VIP OURO',
        [2] = '1x VIP PRATA',
        [3] = '1x BRONZE',
    },

    vipsGroups = { -- LISTA DE VIPS que recebem a moeda vip
        ['Bronze'] = true,
        ['Prata'] = true,
        ['Ouro'] = true,
        ['Platina'] = true,
        ['Diamante'] = true,
        ['Luxuosa'] = true,
        ['Monster'] = true,
        ['God'] = true,
        ['Rubi'] = true,
        ['Esmeralda'] = true,
        ['VipWipe'] = true,
        ['SupremoLuxuosa'] = true,
        ['Streamer'] = true,
        
    },

    rarityColors = { -- CORES DAS RARIDADES --- cor q vai mostrar na nui no open box
        ['COMUM'] = '#4482FF',
        ['SPECIAL'] = '#FFB742',
        ['EPIC'] = '#FF445D',
        ['LEGENDARY'] = '#A41AFF',
    },

    percentualRarity = { -- CALCULO DAS RARIDADES ---- recomendo nao mexer
        ['COMUM'] = 51, -- 50% ( checa se o numero é maior que 51 ou igual )
        ['SPECIAL'] = 50, --- 30% ( 50-20% do lendario = 30%)
        ['EPIC'] = 20, --- 15% ( 20-5%(do lendario) = 15% )
        ['LEGENDARY'] = 5, --- 5%
    },

    crate = {
        { ----- manter o index certinho pra nao ter perigo
            crate_index = 1, --- sempre na ordem pra n ter erro
            name = 'COMUM',
            icon = 'http://189.127.165.210/box/fechado.png', 
            iconOpened = 'http://189.127.165.210/box/aberto.png',
            coins = 50,

            itens = {
                {
                    type = 'VEHICLE', -- ITEM/VEHICLE/OTHERS
                    spawn = 'bmx',
                    amount = 1,
                    rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "panto",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'celular',
                    amount = 1,
                    rarity = 'SPECIAL', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "Celular",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'radio',
                    amount = 1,
                    rarity = 'EPIC', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "radio",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'bandagem',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "bandagem",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'lsd',
                    amount = 10,
                    maxAmount = 20,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "lsd",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'pneus',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "pneus",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'alianca',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "alianca",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'mochila',
                    amount = 3,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "mochila",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'militec',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "militec",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'roupas',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "roupas",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'money',
                    amount = 50000,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "money",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'repairkit',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "repairkit",
                    func = function(source,user_id, amount)
                        print('chegou aqui papi')
                    end,
                },
                

            }
        },

        {
            crate_index = 2, ---- ordem q falei
            name = 'ESPECIAL',
            icon = 'http://189.127.165.210/box/fechado2.png', 
            iconOpened = 'http://189.127.165.210/box/aberto2.png',
            coins = 250,

            itens = {
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'algemas',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "algemas",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'corda',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "corda",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'colete',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "colete",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'capuz',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "capuz",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'lockpick',
                    amount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "lockpick",
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    spawn = 'dinheirosujo',
                    amount = 200000,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    name = "dinheirosujo",
               },
               {
                type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                spawn = 'rastreador',
                amount = 2,
                rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                name = "rastreador",
             },
             {
               type = 'ITEM', -- ITEM/VEHICLE/OTHERS
               spawn = 'chave',
               amount = 2,
               rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
               name = "chave",
             },
             {
                type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                spawn = 'placa',
                amount = 2,
                rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                name = "placa",
              },
             }
        },

        {
            crate_index = 3, --- ordem
            name = 'EPICA',
            icon = 'http://189.127.165.210/box/fechado3.png', 
            iconOpened = 'http://189.127.165.210/box/aberto3.png',
            coins = 500,
            
            itens = {
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "G3",
                    spawn = 'WEAPON_SPECIALCARBINE_MK2',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "combo-luxo",
                    spawn = 'comboluxo',
                    amount = 1,
                    maxAmount = 2,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "paraquedas",
                    spawn = 'GADGET_PARACHUTE',
                    amount = 2,
                    maxAmount = 9,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "MK2",
                    spawn = 'WEAPON_PISTOL_MK2',
                    amount = 1,
                    maxAmount = 2,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "pendrive",
                    spawn = 'pendrive',
                    amount = 1,
                    maxAmount = 5,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "cirurgia",
                    spawn = 'cirurgia',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "M-MK2",
                    spawn = 'AMMO_PISTOL_MK2',
                    amount = 350,
                    maxAmount = 400,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },

                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "M-G3",
                    spawn = 'AMMO_SPECIALCARBINE_MK2',
                    amount = 350,
                    maxAmount = 400,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },

                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "SMG",
                    spawn = 'WEAPON_SMG',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },

                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "M-SMG",
                    spawn = 'AMMO_SMG',
                    amount = 300,
                    maxAmount = 400,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },

                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "Tec-9",
                    spawn = 'WEAPON_MACHINEPISTOL',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS--
                    name = "AK-MK2",
                    spawn = 'WEAPON_ASSAULTRIFLE_MK2',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS--
                    name = "AK-47",
                    spawn = 'WEAPON_ASSAULTRIFLE',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS--teste
                    name = "COCAINA",
                    spawn = 'COCAINA',
                    amount = 25,
                    maxAmount = 45,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS--
                    name = "MACONHA",
                    spawn = 'MACONHA',
                    amount = 25,
                    maxAmount = 45,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                 
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS--
                    name = "metanfetamina",
                    spawn = 'metanfetamina',
                    amount = 25,
                    maxAmount = 45,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                 
                   
                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS--
                    name = "lsd",
                    spawn = 'lsd',
                    amount = 25,
                    maxAmount = 45,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
                 

                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS-
                    name = "FAJUTA",
                    spawn = 'WEAPON_SNSPISTOL_MK2',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },

                {
                    type = 'ITEM', -- ITEM/VEHICLE/OTHERS
                    name = "M-Tec-9",
                    spawn = 'AMMO_MACHINEPISTOL',
                    amount = 300,
                    maxAmount = 400,
                    rarity = 'COMUM', -- COMUM, SPECIAL, EPIC, LEGENDARY
                },
            }
        },

        {
            crate_index = 4, -- ordem
            name = 'LENDARIA',
            icon = 'http://189.127.165.210/box/fechado4.png', 
            iconOpened = 'http://189.127.165.210/box/aberto4.png',
            coins = 1000,
            
            itens = {
                { -- /rbg de 10 à 20 dias
                    name = "rgbcar",
                    type = 'OTHERS', -- ITEM/VEHICLE/OTHERS
                    spawn = 'rbg',
                    amount = 4,
                    maxAmount = 4,
                    rarity = 'EPIC', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    func = function(source,user_id, amount)
                    
                        vRP._addUserGroup(user_id, 'rgb')
                       
                    end,
                },
            }
        },

        {
            crate_index = 5,
            name = 'LUXUOSA',
            icon = 'http://189.127.165.210/box/fechado5.png', 
            iconOpened = 'http://189.127.165.210/box/aberto5.png',
            coins = 5000,
            
            itens = {
                { -- /rbg de 10 à 20 dias
                    name = "VipBronze",
                    type = 'OTHERS', -- ITEM/VEHICLE/OTHERS
                    spawn = 'VipBronze',
                    amount = 1,
                    maxAmount = 1,
                    rarity = 'EPIC', -- COMUM, SPECIAL, EPIC, LEGENDARY
                    func = function(source,user_id, amount)
                       
                        vRP._addUserGroup(user_id, 'VipBronze')
                       
                    end,
                },
                { -- /rbg de 10 à 20 dias
                name = "VipPrata",
                type = 'OTHERS', -- ITEM/VEHICLE/OTHERS
                spawn = 'VipPrata',
                amount = 1,
                maxAmount = 1,
                rarity = 'EPIC', -- COMUM, SPECIAL, EPIC, LEGENDARY
                func = function(source,user_id, amount)
                 
                    vRP._addUserGroup(user_id, 'VipPrata')
                 
                end,
               },
               { -- /rbg de 10 à 20 dias
               name = "VipOuro",
               type = 'VEHICLE', -- ITEM/VEHICLE/OTHERS
               spawn = 'VipOuro',
               amount = 1,
               maxAmount = 1,
               rarity = 'EPIC', -- COMUM, SPECIAL, EPIC, LEGENDARY
               func = function(source,user_id, amount)
                
                 vRP._addUserGroup(user_id, 'VipOuro')
              
                end,
                },
                { -- /rbg de 10 à 20 dias
              name = "VipPlatina",
              type = 'OTHERS', -- ITEM/VEHICLE/OTHERS
              spawn = 'VipPlatina',
              amount = 1,
              maxAmount = 1,
              rarity = 'EPIC', -- COMUM, SPECIAL, EPIC, LEGENDARY
              func = function(source,user_id, amount)
             
              vRP._addUserGroup(user_id, 'VipPlatina')
             
           end,
          },
          }
        },
    },

    store = {
        {
            price = 100,
            type = 'ITEM',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'celular',
            amount = 5,
            name = "celular"
        },

        {
            price = 100,
            type = 'ITEM',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'radio',
            amount = 5,
            name = "Radio"
        },
        


        {
            price = 1900,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'weevil',
            amount = 5,
            name = "weevil",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 1000,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'bikelete',
            amount = 5,
            name = "bikelete",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },


        {
            price = 1000,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'rmodbacalar',
            amount = 5,
            name = "rmodbacalar",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 1000,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'fordfocus',
            amount = 5,
            name = "fordfocus",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },


        {
            price = 1200,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'fox',
            amount = 5,
            name = "fox",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 1200,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'cb500x',
            amount = 5,
            name = "cb500x",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 1200,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'bora',
            amount = 5,
            name = "bora",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 1200,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'ftoro',
            amount = 5,
            name = "ftoro",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },


        {
            price = 1000,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'CeltaCH',
            amount = 5,
            name = "CeltaCH",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 1500,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'pcx',
            amount = 5,
            name = "pcx",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 10000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'xxxxx',
            amount = 5,
            name = "xxxxx",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 20000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'rumpo3',
            amount = 5,
            name = "rumpo3",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 10000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'hilux2019',
            amount = 5,
            name = "hilux2019",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 10000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'panamera17turbo',
            amount = 5,
            name = "panamera17turbo",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 10000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'divo',
            amount = 5,
            name = "divo",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 5000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'xre3',
            amount = 5,
            name = "xre3",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 5000,---xxxxx
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY-- benznatal
            spawn = 'p1',
            amount = 5,
            name = "p1",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },
        {
            price = 1300,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 'golg2',
            amount = 5,
            name = "golg2",
            func = function(source,user_id, amount)
                print('testando')
            end,
        },

        {
            price = 300,
            type = 'VEHICLE',  -- ITEM/VEHICLE
            rarity = 'LEGENDARY', -- COMUM, SPECIAL, EPIC, LEGENDARY
            spawn = 't20',
            amount = 5,
            name = "t20",
        },


    }
}