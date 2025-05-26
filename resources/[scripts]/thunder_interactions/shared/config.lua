Config = {
    InteractionsMenu = {
        [1] = {
            name = "Roupas",
            desc = "Mudança de Roupas",
            image = "clothes",
            type = "clothes",

            body = {
                [1] = {
                    name = "Slot 1",
                    desc = "Disponivel",
                    image = "clothes2",

                    execute = function(source, user_id, index) 
              
                    end,
                },

                [2] = {
                    name = "Slot 2",
                    desc = "Disponivel",
                    image = "clothes2",

                    execute = function(source, user_id, index) 
                        
                    end,
                },

                [3] = {
                    name = "Slot 3",
                    desc = "Disponivel",
                    image = "clothes2",

                    execute = function(source, user_id, index) 

                    end,
                },
                [4] = {
                    name = "Slot 4",
                    desc = "Disponivel",
                    image = "clothes2",

                    execute = function(source, user_id, index) 
              
                    end,
                },

                [5] = {
                    name = "Slot 5",
                    desc = "Disponivel",
                    image = "clothes2",

                    execute = function(source, user_id, index) 
                        
                    end,
                },

                [6] = {
                    name = "Slot 6",
                    desc = "Disponivel",
                    image = "clothes2",

                    execute = function(source, user_id, index) 

                    end,
                },
            }
        },

        [2] = {
            name = "Jogador",
            desc = "Jogador mais proximo de você.",
            image = "player",
            type = "player",

            body = {
                [1] = {
                    name = "Carregar nos ombros",
                    desc = "Carregar a pessoa mais proxima.",
                    image = "carry",

                    execute = function(source, user_id, index) 
                        local nplayer = vRPclient.getNearestPlayer(source,3)
                        if not nplayer then TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.",6000) return false end

                        TriggerClientEvent('carregar_ombro', source)
                        return true
                    end,
                },
                [2] = {
                    name = "Peds",
                    desc = "skin player",
                    image = "carry",

                    execute = function(source, user_id, index)
                        TriggerClientEvent("target:peds", source)
                        return true
                    end,
                },
                [3] = {
                    name = "Adiciona Titulo",
                    desc = "Add Emoji e Titulo",
                    image = "carry",

                    execute = function(source, user_id, index)
                        TriggerClientEvent("me:foxzin", source)
                        return true
                    end,
                },
                [4] = {
                    name = "Remove Titulo",
                    desc = "remove Emoji e Titulo",
                    image = "carry",

                    execute = function(source, user_id, index)
                        TriggerClientEvent("me:tirar", source)
                        return true
                    end,
                },
            }
        },

        [3] = {
            name = "Homes",
            desc = "Casas e config.",
            image = "player",
            type = "player",
        
            body = {
                [1] = {
                    name = "Casas Disponivél",
                    desc = "Casas para comprar",
                    image = "carry",
        
                    execute = function(source, user_id, index)
                        TriggerEvent("mirtin:Blips", source)
                        return true
                    end,
                    },
                [2] = {
                    name = "Minhas propriedades",
                    desc = "Minhas casas.",
                    image = "carry",

                    execute = function(source, user_id, index)
                        local user_id = vRP.getUserId(source)
                        if user_id then
                            TriggerEvent("mirtin:propriedades", source)
                            return true
                        else
                            return false
                        end
                    end,
                    },
                [3] = {
                    name = "Moradores",
                    desc = "Adicionar Moradores",
                    image = "carry",

                    execute = function(source, user_id, index)
                        local user_id = vRP.getUserId(source)
                        if user_id then
                            TriggerEvent("mirtin:moradores", source)
                            return true
                        else
                            return false
                        end
                    end,
                    },
                [4] = {
                    name = "Vender Casa",
                    desc = "Vender Minha casa",
                    image = "carry",

                    execute = function(source, user_id, index)
                        local user_id = vRP.getUserId(source)
                        if user_id then
                            TriggerEvent("mirtin:Vender", source)
                            return true
                        else
                            return false
                        end
                    end,
                    },
                [5] = {
                    name = "Iptu",
                    desc = "Ver dia de vencimento Iptu",
                    image = "carry",

                    execute = function(source, user_id, index)
                        local user_id = vRP.getUserId(source)
                        if user_id then
                            TriggerEvent("mirtin:iptu", source)
                            return true
                        else
                            return false
                        end
                    end,
                    },               

                }
            },
        }
        
        
 } 

