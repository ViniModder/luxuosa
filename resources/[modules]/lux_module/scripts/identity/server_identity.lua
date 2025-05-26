local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
fclient = Tunnel.getInterface("module")
Foxzin = {}
Tunnel.bindInterface("module", Foxzin)

function Foxzin.Identity()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    local groupv = vRP.getUserGroupByType(user_id, "org") or "Desempregado"
    local groupname = vRP.getGroupTitle(groupv)
    local vips = ""
    if vRP.hasGroup(user_id, "Inicial") then vips = vips.." Inicial" end
    if vRP.hasGroup(user_id, "Bronze") then vips = vips.. " Bronze" end
    if vRP.hasGroup(user_id, "Prata") then vips = vips.." Prata" end
    if vRP.hasGroup(user_id, "Ouro") then vips = vips.." Ouro" end
    if vRP.hasGroup(user_id, "Platina") then vips = vips.." Platina" end
    if vRP.hasGroup(user_id, "Diamante") then vips = vips.." Diamante" end
    if vRP.hasGroup(user_id, "Esmeralda") then vips = vips.." Esmeralda" end
    if vRP.hasGroup(user_id, "Safira") then vips = vips.." Safira" end
    if vRP.hasGroup(user_id, "Rubi") then vips = vips.." Rubi" end
    if vRP.hasGroup(user_id, "Luxuosa") then vips = vips.." Luxuosa" end
    if vRP.hasGroup(user_id, "Monster") then vips = vips.." Monster" end
    if vRP.hasGroup(user_id, "God") then vips = vips.." God" end
    if vRP.hasGroup(user_id, "VipWipe") then vips = vips.." VipWipe" end
    if vRP.hasGroup(user_id, "VipNatal") then vips = vips.." VipNatal" end
    if vRP.hasGroup(user_id, "SupremoLuxuosa") then vips = vips.." SupremoLuxuosa" end
    if vips == "" then vips = "Nenhum" end
    if user_id then
        local relacionamento = json.decode(identity.relacionamento)
        local consulta = vRP.getSData("ZoPorte:" .. user_id)
        local resultado = json.decode(consulta) or {}
        resultado.possui = resultado.possui or 0
        if resultado.possui == 1 then
            parmas = "Sim Possui"
        end

        -- Obtém as informações do jogador
        infos = {
            passaporte = user_id,
            nome = identity.nome,
            sobrenome = identity.sobrenome,
            registro = identity.registro,
            celular = identity.telefone,
            emprego = groupname,
            vip = vips,
            carteira = vRP.getMoney(user_id) or 0,
            banco = vRP.getBankMoney(user_id) or 0,
            relacionamento = (relacionamento and relacionamento.tipo or "Solteiro (a)"),
            multas = vRP.getMultas(user_id) or 0,
            valegaragem = vRP.getInventoryItemAmount(user_id, "itemaqui") or 0,
            valecasa = vRP.getInventoryItemAmount(user_id, "itemaqui") or 0,
            parmas = (resultado and resultado.possui or 0 ),
        }
        return infos
    end
end


