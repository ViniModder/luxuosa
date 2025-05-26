Config = {
    images = 'http://189.127.165.210/inventario/', -- URL DAS SUAS IMAGENS
    storeLink = 'https://luxuosarj.hydrus.gg/', -- LINK DA SUA LOJA
    dirtymoney = 'dinheirosujo', -- SPAWN DO DINHEIRO SUJO
    Tables = {
        ['Armas'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'WEAPON_SNSPISTOL_MK2', -- fajuta-----
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 60 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 30 },  
                        { item = "molas" , amount =30 },  
                        { item = "metal" , amount = 60 }
                    }
                },
                {
                    item = 'WEAPON_PISTOL_MK2', -- FIVEN-SERVEN 
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 90}, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 60 },  
                        { item = "molas" , amount = 60 },  
                        { item = "metal" , amount = 90 }
                    }
                },
                {
                    item = 'WEAPON_MACHINEPISTOL', -- TEC-9-----------------
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 150}, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 100 },  
                        { item = "molas" , amount = 100},  
                        { item = "metal" , amount = 150}
                    }
                },
                {
                    item = 'WEAPON_MICROSMG', -- MICRO
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 175 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 100 },  
                        { item = "molas" , amount = 100},  
                        { item = "metal" , amount = 175 }
                    }
                },

                {
                    item = 'WEAPON_SMG', -- MP5
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 30, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount =175 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 100 },  
                        { item = "molas" , amount = 100},  
                        { item = "metal" , amount = 175 }
                    }
                },
                {
                    item = 'WEAPON_ASSAULTRIFLE', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 35, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 300}, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 150 },  
                        { item = "molas" , amount = 150 },  
                        { item = "metal" , amount = 300 }
                    }
                },
                {
                    item = 'WEAPON_ASSAULTRIFLE_MK2', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 40, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 325 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 150},  
                        { item = "molas" , amount = 150 },  
                        { item = "metal" , amount = 325 }
                    }
                },
                {
                    item = 'WEAPON_SPECIALCARBINE_MK2', -- G3
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 45, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pecadearma" , amount = 400 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "gatilho" , amount = 200},  
                        { item = "molas" , amount = 200 },  
                        { item = "metal" , amount = 400 }
                    }
                }
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'molas', minAmount = 10, maxAmount = 15},
                            {item = 'metal', minAmount = 10, maxAmount = 15},
                            {item = 'gatilho', minAmount = 10, maxAmount = 15},
                            {item = 'pecadearma', minAmount = 10, maxAmount = 15}
                        }
                    },
                }
            },
            delivery = {
                list = {

                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )-------WEAPON_PISTOL_MK2
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            }
                        },
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            }
                        },
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            }
                        },
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                           }
                       }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Anonymous',
                    coords = vec3(1143.17,3998.71,45.36), -- ARMAS OK---LIVRE --dragons 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Anonymous'
                    },
                    tablePermission = 'perm.anonymous', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.Anonymous', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'HELIPA',
                    coords = vec3(1272.41,-991.14,68.6), -- ARMAS  ARMAS OK--------------robson agora e dragon 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'HELIPA'
                    },
                    tablePermission = 'perm.helipa', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderhelipa', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Cosanostra',
                    coords = vec3(-1870.25,2062.08,135.44), -- COORDENADAS DA BANCADA----ok--ARMAS 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Cosanostra'
                    },
                    tablePermission = 'perm.cosanostra', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.cosanostra', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'BABEL',
                    coords = vec3(1012.7,-893.78,17.81), -- COORDENADAS DA BANCADA--babel--ok--ARMAS 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'BABEL'
                    },
                    tablePermission = 'perm.babel', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderbabel', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
            }
        }, -- FIM DE UMA BANCADA
        
        ['Municao'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'AMMO_SNSPISTOL_MK2', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 10 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 10 }  
                    }
                },
                {
                    item = 'AMMO_PISTOL_MK2', -- SPAWN DO ITEM
                    amount = 10, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 20 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 20 }  
                    }
                },
                {
                    item = 'AMMO_MACHINEPISTOL', -- SPAWN DO ITEM
                    amount = 15, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 50 }  
                    }
                },
                {
                    item = 'AMMO_SMG', -- SPAWN DO ITEM
                    amount = 20, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 60 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 60 }  
                    }
                },
                {
                    item = 'AMMO_MICROSMG', -- SPAWN DO ITEM
                    amount = 20, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 60 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 60}  
                    }
                },
               
                {
                    item = 'AMMO_ASSAULTRIFLE', -- SPAWN DO ITEM
                    amount = 30, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 80 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 80}  
                    }
                },
                {
                    item = 'AMMO_ASSAULTRIFLE_MK2', -- SPAWN DO ITEM
                    amount = 30, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 90 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 90 }  
                    }
                },
                {
                    item = 'AMMO_SPECIALCARBINE_MK2', -- G3--------------------
                    amount = 30, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "capsulas" , amount = 100 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "polvora" , amount = 100}  
                    }
                }
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = true, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'capsulas', minAmount = 15, maxAmount = 20},
                            {item = 'polvora', minAmount = 15, maxAmount = 20}

                        }
                    }
                }
            },
            delivery = {
                list = {
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            }
                        },
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            }
                        },
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            }
                        },
                        {
                            dangerRoute = {
                                status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                                percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                            },
                            itensList = {
                                {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                                {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                           }
                       }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                -- {
                --     -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                --     name = 'Bratva',
                --     coords = vec3(-2361.25,1754.04,212.12), -- COORDENADAS DA BANCADA
                --     requireStorage = {
                --         -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                --         active = true,
                --         name = 'Bratva'
                --     },
                --     tablePermission = 'perm.Bratva', -- PERMISSAO PARA ACESSAR A BANCADA
                --     craftPermission = 'perm.liderBratva', -- PERMISSAO PARA CRAFTAR ITEM
                --     drawMarker = function(coords, dist)
                --         if dist <= 5.0 then
                --             DrawText3Ds(
                --                 coords.x,
                --                 coords.y,
                --                 coords.z + 0.1,
                --                 'Pressione ~b~[E]~w~ para acessar a bancada.'
                --             )
                --             DrawMarker(
                --                 27,
                --                 coords.x,
                --                 coords.y,
                --                 coords.z - 0.95,
                --                 0,
                --                 0,
                --                 0,
                --                 0,
                --                 0,
                --                 0,
                --                 1.5,
                --                 1.5,
                --                 1.5,
                --                 132,
                --                 102,
                --                 226,
                --                 180,
                --                 0,
                --                 0,
                --                 0,
                --                 1
                --             )
                --         end
                --     end -- BLIP DO CHAO
                -- },            
  
                  {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Grota',
                    coords = vec3(1230.27,-251.65,76.36), -- MUNIÇAO OK GROTA 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Grota'
                    },
                    tablePermission = 'perm.grota', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidergrota', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Mafia',
                    coords = vec3(2408.64,5005.53,38.28), -- MUNIÇAO OK  FAZENDA NORTE 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Mafia'
                    },
                    tablePermission = 'perm.mafia', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidermafia', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

               {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Wolves',---antigo alemao 
                    coords = vec3(-2886.42,3768.16,12.7), -- ALEMAO MUNIÇAO MUDAR DE LUGAR 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Wolves'
                    },
                    tablePermission = 'perm.wolves', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderwolves', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
           }
        },

        ['Desmanche'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'lockpick', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "aluminio" , amount = 50 }  
                    }
                },
                {
                    item = 'chave', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 25 }  
                    }
                },
               
                {
                    item = 'pedecabra', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 5, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'colete', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "m-malha" , amount = 45 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "ferro" , amount = 30 }  
                    }
                },
                {
                    item = 'capuz', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "m-malha" , amount = 45 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'ferro', minAmount = 10, maxAmount = 10},
                            {item = 'm-malha', minAmount = 10, maxAmount = 10},
                            {item = 'aluminio', minAmount = 10, maxAmount = 10},
                            {item = 'plastico', minAmount = 10, maxAmount = 10},
                        }
                    }
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                       }
                   }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Motoclub',
                    coords = vec3(1001.17,-128.7,74.05), -- MUNIÇAO  MUDA OOS ITEM PRA MUNIÇAOO  
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Motoclub'
                    },
                    tablePermission = 'perm.motoclub', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidermotoclub', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Cartel',
                    coords = vec3(1398.44,1154.89,108.14), -- MUANBAS-OK
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Cartel'
                    },
                    tablePermission = 'perm.cartel', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidercartel', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },


                {
                    --------- altera aqui desmanche
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'alteraraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'alteraraq'
                    },
                    tablePermission = 'alteraraq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'alteraraq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'alteraraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'alteraraq'
                    },
                    tablePermission = 'alteraraq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'alteraraq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
             --   {
                --     -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                --     name = 'Alemao',
                --     coords = vec3(-571.71,288.94,79.18), -- COORDENADAS DA BANCADA
                --     requireStorage = {
                --         -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                --         active = true,
                --         name = 'Alemao'
                --     },
                --     tablePermission = 'perm.Alemao', -- PERMISSAO PARA ACESSAR A BANCADA
                --     craftPermission = 'perm.liderAlemao', -- PERMISSAO PARA CRAFTAR ITEM
                --     drawMarker = function(coords, dist)
                --         if dist <= 5.0 then
                --             DrawText3Ds(
                --                 coords.x,
                --                 coords.y,
                --                 coords.z + 0.1,
                --                 'Pressione ~b~[E]~w~ para acessar a bancada.'
                --             )
                --             DrawMarker(
                --                 27,
                --                 coords.x,
                --                 coords.y,
                --                 coords.z - 0.95,
                --                 0,
                --                 0,
                --                 0,
                --                 0,
                --                 0,
                --                 0,
                --                 1.5,
                --                 1.5,
                --                 1.5,
                --                 0,
                --                 179,
                --                 255,
                --                 180,
                --                 0,
                --                 0,
                --                 0,
                --                 1
                --             )
                --         end
                --     end -- BLIP DO CHAO
                -- }
            }
        }, -- FIM DE UMA BANCADA
        ['MECANICA'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'repairkit', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "metal" , amount = 8 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 8 }  
                    }
                },
                {
                    item = 'rastreador', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "plastico" , amount = 8 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "c-cobre" , amount = 8 }  
                    }
                }
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'plastico', minAmount = 10, maxAmount = 10},
                            {item = 'metal', minAmount = 10, maxAmount = 10},
                            {item = 'c-cobre', minAmount = 10, maxAmount = 10}
                        }
                    }
                }
            },
            delivery = {
                list = {}
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'STOPCAR',
                    coords = vec3(2680.21,3484.03,55.71), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )---------okok
                        active = true,
                        name = 'STOPCAR'
                    },
                    tablePermission = "lscustom.permissao", -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidermecanica', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'RIDEOUT',
                    coords = vec3(591.95,-180.3,54.53), -- COORDENADAS DA BANCADA--POR MEC AINDA 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'RIDEOUT'
                    },
                    tablePermission = "rideout.permissao", -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderrideout', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
            } -- FIM DA  CONFIGURACAO
        },


        ['HOSPITAL'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'bandagem', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "fita_de_pano" , amount = 8 }, -- ITEM / QUANTIDADE ( POR UNIDADE )---okok
                        { item = "elastico" , amount = 8 }  
                    }
                },
                {
                    item = 'militec', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "fita_de_pano" , amount = 5 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "elastico" , amount = 5 }  
                    }
                }
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 3 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'fita_de_pano', minAmount = 5, maxAmount = 8},
                            {item = 'elastico', minAmount = 5, maxAmount = 8}
                        }
                    }
                }
            },
            delivery = {
                list = {

                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Hospitalluxuosa',
                    coords = vec3(-471.9,206.14,83.71), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )--ok
                        active = true,
                        name = 'Hospitalluxuosa'
                    },
                    tablePermission = 'perm.unizk', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.hplider', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }

            } -- FIM DE UMA BANCADA

        }, -- FIM DA  CONFIGURACAO

    

        ['Lavagem'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'money', -- SPAWN DO ITEM
                    amount = 80000, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "dinheirosujo" , amount = 100000 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "l-alvejante" , amount = 50 }  
                    }
                },
                {
                    item = 'money', -- SPAWN DO ITEM
                    amount = 180000, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "dinheirosujo" , amount = 200000 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "l-alvejante" , amount = 100 }  
                    }
                },
                {
                    item = 'money', -- SPAWN DO ITEM
                    amount = 280000, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 20, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "dinheirosujo" , amount = 300000 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "l-alvejante" , amount = 150 }  
                    }
                },
                {
                    item = 'money', -- SPAWN DO ITEM
                    amount = 800000, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 30, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "dinheirosujo" , amount = 1000000 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "l-alvejante" , amount = 500 } 
                    }
                },
                {
                    item = 'lockpick', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "aluminio" , amount = 50 }  
                    }
                },
                {
                    item = 'chave', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 50 }  
                    }
                },
                {
                    item = 'ticket', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 10, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 100 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 100 }  
                    }
                },
                {
                    item = 'pedecabra', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 5, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "ferro" , amount = 50 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                    }
                },
                {
                    item = 'colete', -- SPAWN DO ITEM
                    amount = 1, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "m-malha" , amount = 100 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "ferro" , amount = 100 }  
                    }
                }
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = false, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 30 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'l-alvejante', minAmount = 10, maxAmount = 15},
                            {item = 'ferro', minAmount = 10, maxAmount = 15},
                            {item = 'm-malha', minAmount = 10, maxAmount = 15},
                            {item = 'aluminio', minAmount = 10, maxAmount = 15},
                            {item = 'plastico', minAmount = 10, maxAmount = 15},
                        }
                    },
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment =  5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                       }
                   }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'crips',
                    coords = vec3(251.4,-3154.85,-0.19), -- LAVAGEM OK-- CLUB 77
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'crips'
                    },
                    tablePermission = 'perm.crips', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidercrips', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Cassino',
                    coords = vec3(920.46,46.05,72.07), -- LAVAGEM TUDO OK 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Cassino'
                    },
                    tablePermission = 'perm.cassino', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidercassino', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },

                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Bahamas',
                    coords = vec3(-1387.16,-637.25,28.7), -- OK-------------------------------------------------------------------
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Bahamas'
                    },
                    tablePermission = 'perm.bahamas', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderbahamas', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },







                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Tequila',
                    coords = vec3(-571.71,288.94,79.18), -- LAVAGEM OK
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Tequila'
                    },
                    tablePermission = 'perm.tequila', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidertequila', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                {
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'Iluminatis',----LAVAGEM
                    coords = vec3(-3226.45,818.01,14.07), -- LAVAGEM ok
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'Iluminatis'
                    },
                    tablePermission = 'perm.iluminatis', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lideriluminatis', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
            }
        }, -- FIM DE UMA BANCADA
        

        ['Metanfetamina'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'metanfetamina', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "anfetamina" , amount = 10 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 10 }
                    }
                },
    
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'anfetamina', minAmount = 7, maxAmount = 7},
                            {item = 'plastico', minAmount = 7, maxAmount = 7},
                        }
                    },
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                       }
                   }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
            }
        }, -- FIM DE UMA BANCADA
    
        ['Lsd'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
    
                {
                    item = 'lsd', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "Acidodolacisd" , amount = 10 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 10 }
                    }
                },
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'Acidodolacisd', minAmount = 7, maxAmount = 7},
                            {item = 'plastico', minAmount = 7, maxAmount = 7},
                        }
                    },
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                       }
                   }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADA
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'B13',
                    coords = vec3(-3280.32,580.67,6.13), -- COORDENADAS DA BANCADA-----asumida 
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'B13'
                    },
                    tablePermission = 'perm.b13', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderb13', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
            }
        }, -- FIM DE UMA BANCADA
    
        ['Cocaina'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'cocaina', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "pastabase" , amount = 10 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 10 }
                    }
                },
    
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 3 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'pastabase', minAmount = 10, maxAmount = 15},--DROGAS 
                            {item = 'plastico', minAmount = 10, maxAmount = 15},
                        }
                    },
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                   }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADAS
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'ROCINHA',
                    coords = vec3(2434.08,2387.07,64.92), --COCAINA---OK
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'ROCINHA'
                    },
                    tablePermission = 'perm.rocinha', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.liderrocinha', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                }
            }
        }, -- FIM DE UMA BANCADA
        
    
        ['Maconha'] = {
            -- INICIO DE UMA BANCADA, NUNCA REPETIR ESSE NOME
            craft = {
                -- ZONA DE CRAFT
                {
                    item = 'maconha', -- SPAWN DO ITEM
                    amount = 5, -- Quantidade de item que vai receber por unidade selecionada.
                    itemTime = 15, -- 30 segundo(s) para a maquina concluir o craft.
                    requires = {
                        -- ITENS NECESSARIOS PARA O CRAFT
                        { item = "folhamaconha" , amount = 10 }, -- ITEM / QUANTIDADE ( POR UNIDADE )
                        { item = "plastico" , amount = 10 }
                    }
                },
               
    
            },
            farm = {
                -- ZONA DE FARM
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 3 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        dominationBonus = {
                            -- Caso utilize o script mirtin_dominacao e queira dobrar/triplicar o farm se tiver a zona dominada.
                            status = true, -- Se o sistema ta ativo ou não
                            zone = false, -- Qual a zona que precisa ter dominada para boostar o farm. Exemplo: [ 'Armas', 'Municao' ou etc ]
                            bonus = 2 -- 2x Quantidade que o farm vai duplicar quando estiver com a zona dominada.
                        },
                        itensList = {
                            {item = 'plastico', minAmount = 10, maxAmount = 15},
                            {item = 'folhamaconha', minAmount = 10, maxAmount = 15},
                        }
                    },
                }
            },
            delivery = {
                list = {
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'maconha', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'metanfetamina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                        }
                    },
                    {
                        dangerRoute = {
                            status = true, -- Rota Perigosa ( CHANCE DE CHAMAR A POLICIA )
                            percentualPolice = 50 -- 3% De chamar A Policia ( APENAS SE O DangerRoute For ativo )
                        },
                        itensList = {
                            {item = 'lsd', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000}, -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                            {item = 'cocaina', minAmount = 3, maxAmount = 3, type = 'ilegal', payment = 5000} -- ( TYPE legal = dinheiro normal, ilegal = dinheiro sujo) ( payment valor por unidade )
                       }
                   }
                }
            },
            locations = {
                -- LOCALIZACOES DESSAS BANCADA
    
               

                
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                0,
                                38,
                                255,
                                255,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'trocaraq',
                    coords = vec3(1,1,1), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'trocaraq'
                    },
                    tablePermission = 'permaq', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'permaq', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
    
                {
                    
                    
                    -- POSSIVEL ADICIONAR VARIAS LOCALIZACOES E VARIAS ORGANIZACOES DIFERENTE
                    name = 'CV',
                    coords = vec3(-388.49,1599.83,351.64), -- COORDENADAS DA BANCADA
                    requireStorage = {
                        -- SE VAI PUXAR OS ITENS DO ARMAZEM NA HORA DE FABRICAR ( Caso for true configurar na parte Storages )
                        active = true,
                        name = 'CV'
                    },
                    tablePermission = 'perm.cv', -- PERMISSAO PARA ACESSAR A BANCADA
                    craftPermission = 'perm.lidercv', -- PERMISSAO PARA CRAFTAR ITEM
                    drawMarker = function(coords, dist)
                        if dist <= 5.0 then
                            DrawText3Ds(
                                coords.x,
                                coords.y,
                                coords.z + 0.1,
                                'Pressione ~b~[E]~w~ para acessar a bancada.'
                            )
                            DrawMarker(
                                27,
                                coords.x,
                                coords.y,
                                coords.z - 0.95,
                                0,
                                0,
                                0,
                                0,
                                0,
                                0,
                                1.5,
                                1.5,
                                1.5,
                                132,
                                102,
                                226,
                                180,
                                0,
                                0,
                                0,
                                1
                            )
                        end
                    end -- BLIP DO CHAO
                },
            }
        }, -- FIM DE UMA BANCADA
    },

    -- CONFIGURACAO DOS ARMAZENS
    Storages = {
        ---DROGAS 
        ['Grota'] = {-------------------oook macooonha 
            itens = {
                ['capsulas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['polvora'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
               
            }
        },

        ['ROCINHA'] = {-------------cocaina 
            itens = {
                ['pastabase'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['plastico'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
               
            }
        },




        ['Anonymous'] = {
            itens = {
                ['pecadearma'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['gatilho'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['molas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999 -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
        ['Croacia'] = {
            itens = {
                ['pecadearma'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['gatilho'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['molas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999 -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
        ['Cosanostra'] = {
            itens = {
                ['pecadearma'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['gatilho'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['molas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999 -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
        ['BABEL'] = {
            itens = {
                ['pecadearma'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['gatilho'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['molas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999 -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
        ['HELIPA'] = {
            itens = {
                ['pecadearma'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['gatilho'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['molas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999 -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },

        ---MACONHA
        ['CV'] = {
            itens = {
                ['folhamaconha'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['plastico'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                
            }
        },

        ['B13'] = {-------------------LSD OK
            itens = {
                ['Acidodolacisd'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['plastico'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
          ---DROGAS
          ['canada'] = {
            itens = {
                ['anfetamina'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['Acidodolacisd'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['pastabase'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['plastico'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['folhamaconha'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },

        ['MILICIA'] = {
            itens = {
                ['anfetamina'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['Acidodolacisd'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['pastabase'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['plastico'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['folhamaconha'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },

        ---MUNI
        ['Mafia'] = {
            itens = {
                ['capsulas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['polvora'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },

        ---MUNI
        ['Turquia'] = {
            itens = {
                ['capsulas'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['polvora'] = 9999999,-- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },


        ---LAVAGEM
        ['Iluminatis'] = {
            itens = {
                ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['l-alvejante'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
            }
        },

        ----LAVAGEM
        ['Vanilla'] = {
            itens = {
                ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['l-alvejante'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
            }
        },
        
        ----LAVAGEM
        ['Cassino'] = {
            itens = {
                ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['l-alvejante'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
            
            }
        },
                ----LAVAGEM
        ['Tequila'] = {
            itens = {
                ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['l-alvejante'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
             
            }
        },
               ----LAVAGEM
        ['Bahamas'] = {
            itens = {
                ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['l-alvejante'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
             
            }
        },

               ----LAVAGEM
       ['crips'] = {
         itens = {
                 ['dinheirosujo'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                 ['l-alvejante'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                 ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                 ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                 ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                 ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                 ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
              
           }
        },

        ['Wolves'] = {
            itens = {
                ['capsulas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['polvora'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },

        -------------DESMANCHE--------------
        ['Motoclub'] = {
            itens = {
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 

            }
        },
        ['Mudar'] = {
            itens = {
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDARm-malha
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
            }
        },

       
                -------------DESMANCHE--------------
        ['Cartel'] = {
            itens = {
                ['ferro'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['aluminio'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDARm-malha
                ['m-malha'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['molas'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR 
            }
        },
        -------------MECANICA--------------
        ['STOPCAR'] = {
            itens = {
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDARm-malha
                ['c-cobre'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
        ['RIDEOUT'] = {
            itens = {
                ['plastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['metal'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDARm-malha
                ['c-cobre'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
            }
        },
        ['Hospitalluxuosa'] = {
            itens = {
                ['fita_de_pano'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDAR
                ['elastico'] = 9999999, -- ITEM / QUANTIDADE MAXIMA QUE CONSEGUE GUARDARm-malha
            }
        }


    }, -- final do storages
    -- LOCALIZAÇÕES DAS ROTAS DE COLETA
    Locations = {
        ['SUL'] = {
            {['x'] = 269.72659301758, ['y'] = -433.30996704102, ['z'] = 45.258628845215},
            {['x'] = 1095.2623291016, ['y'] = -265.18560791016, ['z'] = 69.314659118652},
            {['x'] = 1215.4553222656, ['y'] = -1381.8483886719, ['z'] = 35.360610961914},
            {['x'] = 1149.3568115234, ['y'] = -2506.0375976563, ['z'] = 33.346450805664},
            {['x'] = 155.51463317871, ['y'] = -3038.2861328125, ['z'] = 7.0317249298096},
            {['x'] = 174.5284576416, ['y'] = -2025.7756347656, ['z'] = 18.331029891968},
            {['x'] = 184.11695861816, ['y'] = -1256.9632568359, ['z'] = 29.198429107666},
            {['x'] = 58.734958648682, ['y'] = -269.14291381836, ['z'] = 48.188236236572},
            {['x'] = -994.46783447266, ['y'] = 92.465660095215, ['z'] = 51.955184936523},
            {['x'] = -1998.3210449219, ['y'] = 540.85241699219, ['z'] = 109.51490783691},
            {['x'] = -1599.8289794922, ['y'] = -370.38012695313, ['z'] = 44.385177612305},
            {['x'] = -2187.79296875, ['y'] = -408.98895263672, ['z'] = 13.147369384766},
            {['x'] = -1329.2437744141, ['y'] = -1150.451171875, ['z'] = 4.38121509552},
            {['x'] = -508.26608276367, ['y'] = -1212.435546875, ['z'] = 18.596347808838},
            {['x'] = -917.13891601563, ['y'] = -1820.6671142578, ['z'] = 23.339479446411},
            {['x'] = 11.778308868408, ['y'] = -2054.2321777344, ['z'] = 10.360652923584},
            {['x'] = -733.16345214844, ['y'] = -1726.1092529297, ['z'] = 28.955078125},
            {['x'] = -838.60534667969, ['y'] = -609.32543945313, ['z'] = 29.026960372925},
            {['x'] = -448.94778442383, ['y'] = -132.73837280273, ['z'] = 39.08292388916},
            {['x'] = -195.33979797363, ['y'] = -835.03845214844, ['z'] = 30.730991363525}
        },
        ['NORTE'] = {
            {['x'] = -2194.1354980469, ['y'] = -388.45462036133, ['z'] = 13.4704246521},
            {['x'] = -3056.3854980469, ['y'] = 176.16958618164, ['z'] = 11.608025550842},
            {['x'] = -3070.3815917969, ['y'] = 1734.58984375, ['z'] = 36.621490478516},
            {['x'] = -2568.1369628906, ['y'] = 2347.6342773438, ['z'] = 33.080039978027},
            {['x'] = -3036.3552246094, ['y'] = 3338.3732910156, ['z'] = 9.9349489212036},
            {['x'] = -2188.9052734375, ['y'] = 4252.9638671875, ['z'] = 48.940746307373},
            {['x'] = -1046.5561523438, ['y'] = 5323.1616210938, ['z'] = 45.031158447266},
            {['x'] = -388.29217529297, ['y'] = 6269.0458984375, ['z'] = 30.446243286133},
            {['x'] = 578.3857421875, ['y'] = 6558.1704101563, ['z'] = 28.018701553345},
            {['x'] = 1745.3806152344, ['y'] = 6415.900390625, ['z'] = 34.9426612854},
            {['x'] = 2559.7729492188, ['y'] = 5241.736328125, ['z'] = 44.841533660889},
            {['x'] = 1792.2270507813, ['y'] = 4593.7094726563, ['z'] = 37.682899475098},
            {['x'] = 812.02703857422, ['y'] = 4229.8442382813, ['z'] = 52.776302337646},
            {['x'] = 1662.9755859375, ['y'] = 4768.0571289063, ['z'] = 42.007564544678},
            {['x'] = 2803.7299804688, ['y'] = 4971.3461914063, ['z'] = 33.498306274414},
            {['x'] = 3066.6625976563, ['y'] = 3820.4030761719, ['z'] = 74.83943939209},
            {['x'] = 2086.1723632813, ['y'] = 2707.5336914063, ['z'] = 48.272926330566},
            {['x'] = 1925.9898681641, ['y'] = 1794.541015625, ['z'] = 64.200401306152},
            {['x'] = 2498.7375488281, ['y'] = 808.64178466797, ['z'] = 94.018333435059},
            {['x'] = 2386.96875, ['y'] = -391.27166748047, ['z'] = 75.157066345215}
        }
    },
    -- LOCALIZAÇÕES DAS ENTREGAS
    DeliveryLocations = {
        {['x'] = 727.77172851563, ['y'] = 216.70178222656, ['z'] = 87.030082702637},
        {['x'] = 200.47122192383, ['y'] = 495.94183349609, ['z'] = 140.99989318848},
        {['x'] = -184.89025878906, ['y'] = 502.69140625, ['z'] = 134.91850280762},
        {['x'] = -355.51943969727, ['y'] = 343.93936157227, ['z'] = 109.34753417969},
        {['x'] = -568.55474853516, ['y'] = 494.0881652832, ['z'] = 106.95864105225},
        {['x'] = -836.76580810547, ['y'] = 454.63809204102, ['z'] = 88.595893859863},
        {['x'] = -1161.8542480469, ['y'] = 480.41220092773, ['z'] = 86.093757629395},
        {['x'] = -1455.5434570313, ['y'] = 413.61660766602, ['z'] = 109.88622283936},
        {['x'] = -1481.2939453125, ['y'] = -7.4827694892883, ['z'] = 55.236015319824},
        {['x'] = -1149.9549560547, ['y'] = -388.05087280273, ['z'] = 36.635585784912},
        {['x'] = -895.76831054688, ['y'] = -779.05114746094, ['z'] = 15.910481452942},
        {['x'] = -870.94580078125, ['y'] = -1129.8197021484, ['z'] = 7.0695457458496},
        {['x'] = -1138.6221923828, ['y'] = -1410.21484375, ['z'] = 5.2557005882263},
        {['x'] = -1351.5860595703, ['y'] = -1216.1368408203, ['z'] = 5.944146156311},
        {['x'] = -1012.6721801758, ['y'] = -1138.9058837891, ['z'] = 2.1586010456085},
        {['x'] = -1315.2711181641, ['y'] = -903.45721435547, ['z'] = 11.322186470032},
        {['x'] = -1586.9901123047, ['y'] = -571.14691162109, ['z'] = 34.97908782959},
        {['x'] = -1997.5615234375, ['y'] = -334.21292114258, ['z'] = 48.106292724609},
        {['x'] = -1630.5080566406, ['y'] = -361.54281616211, ['z'] = 48.140926361084},
        {['x'] = -2235.0270996094, ['y'] = -362.39163208008, ['z'] = 13.311479568481},
        {['x'] = -2819.4743652344, ['y'] = 64.266174316406, ['z'] = 14.754144668579},
        {['x'] = -3031.900390625, ['y'] = 516.42614746094, ['z'] = 7.3950986862183},
        {['x'] = -3224.7846679688, ['y'] = 1098.7489013672, ['z'] = 10.571074485779},
        {['x'] = -3008.2175292969, ['y'] = 1912.2239990234, ['z'] = 28.482349395752},
        {['x'] = -2520.0417480469, ['y'] = 2315.4816894531, ['z'] = 33.216365814209},
        {['x'] = -2351.4899902344, ['y'] = 3994.7272949219, ['z'] = 26.699678421021},
        {['x'] = -1491.5766601563, ['y'] = 4980.5122070313, ['z'] = 63.323047637939},
        {['x'] = -581.72552490234, ['y'] = 5621.5712890625, ['z'] = 38.658626556396},
        {['x'] = -182.99453735352, ['y'] = 6311.8110351563, ['z'] = 31.489393234253},
        {['x'] = 756.95104980469, ['y'] = 6461.7241210938, ['z'] = 31.427434921265},
        {['x'] = 1745.1613769531, ['y'] = 6411.2065429688, ['z'] = 35.239028930664},
        {['x'] = 2559.6745605469, ['y'] = 5241.7177734375, ['z'] = 44.855991363525},
        {['x'] = 1959.9293212891, ['y'] = 5172.603515625, ['z'] = 47.927612304688},
        {['x'] = 1819.3823242188, ['y'] = 4588.7680664063, ['z'] = 36.047267913818},
        {['x'] = 2667.91015625, ['y'] = 4763.7509765625, ['z'] = 34.724266052246},
        {['x'] = 2845.0456542969, ['y'] = 3436.298828125, ['z'] = 50.762619018555},
        {['x'] = 2538.9609375, ['y'] = 2572.9411621094, ['z'] = 37.944816589355},
        {['x'] = 2333.9645996094, ['y'] = 1196.4398193359, ['z'] = 64.543518066406},
        {['x'] = 2276.1181640625, ['y'] = -487.01263427734, ['z'] = 81.982582092285},
        {['x'] = 1001.8076171875, ['y'] = -813.86273193359, ['z'] = 33.975234985352},
        {['x'] = 91.650726318359, ['y'] = -1209.86328125, ['z'] = 37.548927307129},
        {['x'] = 474.55722045898, ['y'] = -1062.0173339844, ['z'] = 29.211532592773},
        {['x'] = 493.51379394531, ['y'] = -583.89660644531, ['z'] = 24.714595794678},
        {['x'] = 633.35852050781, ['y'] = -291.8196105957, ['z'] = 39.99861907959},
        {['x'] = 936.87609863281, ['y'] = -875.10345458984, ['z'] = 43.794380187988},
        {['x'] = 767.81390380859, ['y'] = -1318.5142822266, ['z'] = 27.275230407715},
        {['x'] = 765.59387207031, ['y'] = -1901.9017333984, ['z'] = 29.173307418823},
        {['x'] = 421.52984619141, ['y'] = -1543.0887451172, ['z'] = 29.249750137329},
        {['x'] = 26.712888717651, ['y'] = -1458.2862548828, ['z'] = 30.478290557861},
        {['x'] = -425.20614624023, ['y'] = -1699.0222167969, ['z'] = 19.079179763794},
        {['x'] = -76.685134887695, ['y'] = -1313.3244628906, ['z'] = 29.260971069336},
        {['x'] = -253.92417907715, ['y'] = -944.14013671875, ['z'] = 31.219984054565},
        {['x'] = -663.40991210938, ['y'] = -890.51904296875, ['z'] = 24.578384399414},
        {['x'] = -703.26116943359, ['y'] = -1390.6459960938, ['z'] = 5.1502690315247},
        {['x'] = -549.00323486328, ['y'] = -939.03460693359, ['z'] = 23.852233886719},
        {['x'] = -829.84509277344, ['y'] = -623.87945556641, ['z'] = 29.026956558228},
        {['x'] = -900.43634033203, ['y'] = -195.82566833496, ['z'] = 38.067127227783},
        {['x'] = -352.57220458984, ['y'] = 14.588917732239, ['z'] = 47.854736328125},
        {['x'] = -33.800872802734, ['y'] = -23.058477401733, ['z'] = 68.997619628906},
        {['x'] = 290.91644287109, ['y'] = -293.37322998047, ['z'] = 53.981533050537}
    },
}

-- OUTRAS CONFIGURAÇÕES
if not SERVER then
    function DrawText3Ds(x, y, z, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        SetTextFont(4)
        SetTextScale(0.35, 0.35)
        SetTextColour(255, 255, 255, 200)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
