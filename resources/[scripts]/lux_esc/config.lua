Config = {
    websiteUrl = "https://luxuosarj.hydrus.gg/",
    
    Info = {
        main = {
            name = function(user_id, source, identity) 
                return identity.nome .. " " .. identity.sobrenome
            end,

            genre = function(user_id, source) 
                return (GetEntityModel(GetPlayerPed(source)) == GetHashKey("mp_m_freemode_01") and "HOMEM" or "MULHER")
            end,

            image = function(user_id, source)
                -- vRP._prepare("identity/getImagem", "SELECT avatarURL from smartphone_instagram WHERE user_id = @user_id ")
                --local rows = vRP.query("identity/getImagem", { user_id = user_id })
 
                return "nao-encontrado.png" --[[ (#rows > 0 and rows[1].avatarURL or "nao-encontrado.png" ) ]]
            end,

            wallet = function(user_id, source) 
                return vRP.getMoney(user_id)
            end,

            bank = function(user_id, source) 
                return vRP.getBankMoney(user_id)
            end,
        },

        others = {
            ["VIP"] = function(user_id, source, identity) 
                local Vips = { -- Coloque aqui o nome do seus VIPS
                 "Bronze",
                 "Prata",
                 "Ouro",
                 "Platina",
                 "Diamante",
                 "Luxuosa",
                 "SupremoLuxuosa",
                 "Monster",
                 "God",
                 "Rubi",
                 "Esmeralda",
                 "Streamer",----VipWipe
                 "VipWipe",
                }

                local FormatVips = {}
                for index in pairs(Vips) do
                    if vRP.hasGroup(user_id, Vips[index]) then
                        FormatVips[#FormatVips + 1] = Vips[index]
                    end
                end           

                return (#FormatVips == 0 and "Nenhum"  or FormatVips)
            end,
    
            ["TRABALHO"] = function(user_id, source, identity) 
                return vRP.getUserGroupByType(user_id, "org")
            end,
    
            ["IDENTIDADE"] = function(user_id, source, identity)
                return identity.registro or "Nenhum"
            end,
    
            ["IDADE"] = function(user_id, source, identity) 
                return identity.idade
            end,
    
            ["TELEFONE"] = function(user_id, source, identity) 
                return identity.telefone
            end,
        }
    },

    Social = { -- REDES SOCIAIS
        ["INSTAGRAM"] = {
            active = true,
            url = "https://www.instagram.com/capitalrjbrasil/", -- LINK QUE SERA REDERICIONADO APOS CLICAR
            image = "images/instagram.svg"
        },

        ["TIKTOK"] = {
            active = true,
            url = "https://www.tiktok.com/@capitalrjbrasil", -- LINK QUE SERA REDERICIONADO APOS CLICAR
            image = "images/tiktok.svg"
        },

        ["SITE VIP"] = {
            active = true,
            url = "https://luxuosarj.hydrus.gg/", -- LINK QUE SERA REDERICIONADO APOS CLICAR
            image = "images/donate.svg"
        },

        ["DISCORD"] = {
            active = true,
            url = "https://luxuosarj.hydrus.gg/", -- LINK QUE SERA REDERICIONADO APOS CLICAR
            image = "images/discord.svg"
        }
    },

    Status = {
        func = vRP.getUsersByPermission, -- SUA FUNCAO DE CONTAR AS PERMISSOES

        list = {
            ["foxzin"] = "perm.user",
        }
    }
}