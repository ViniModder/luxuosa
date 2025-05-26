
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface('vrp_animacoes_', src)
vSERVER = Tunnel.getInterface('vrp_animacoes_')
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e
-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e (com suporte a animações individuais e em dupla)
-----------------------------------------------------------------------------------------------------------------------------------------

-- Defina a lista de animações
local animList = {
    { ["anim"] = "comprimentar", ["nome"] = "te <b>Comprimentar</b>", ["anim1"] = "mp_common", ["anim2"] = "givetake1_a", ["sync"] = 0.8, ["block"] = false, ["tempo"] = 2, ["distancia"] = 1  },
    { ["anim"] = "abracar", ["nome"] = "te <b>Abracar</b>", ["anim1"] = "mp_ped_interaction", ["anim2"] = "hugs_guy_a", ["sync"] = 0.9, ["block"] = false, ["tempo"] = 2, ["distancia"] = 1  },
    { ["anim"] = "beijar", ["nome"] = "te <b>Beijar</b>", ["anim1"] = "mp_ped_interaction", ["anim2"] = "kisses_guy_a", ["block"] = false, ["sync"] = 1.3, ["tempo"] = 5, ["distancia"] = 1  },
    { ["anim"] = "tapa", ["nome"] = "te dar um <b>Tapa</b>", ["anim1"] = "melee@unarmed@streamed_variations", ["anim2"] = "plyr_takedown_front_backslap", ["block"] = true, ["sync"] = 1.3, ["tempo"] = 1, ["distancia"] = 1 },
    { ["anim"] = "murro", ["nome"] = "te dar um <b>Murro</b>", ["anim1"] = "melee@unarmed@streamed_variations", ["anim2"] = "plyr_takedown_rear_lefthook", ["block"] = true, ["sync"] = 0.9, ["tempo"] = 1, ["distancia"] = 1 },
    { ["anim"] = "dancar1", ["nome"] = "<b>Dancar</b>", ["anim1"] = "anim@amb@casino@mini@dance@dance_solo@female@var_b@", ["anim2"] = "high_center", ["block"] = false, ["sync"] = 1.2, ["tempo"] = 60, ["distancia"] = 2 },
    { ["anim"] = "dancar2", ["nome"] = "<b>Dancar</b>", ["anim1"] = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", ["anim2"] = "low_center", ["block"] = false, ["sync"] = 0.6, ["tempo"] = 60, ["distancia"] = 2 },
    { ["anim"] = "sexo1", ["nome"] = "<b>Sexo</b>", ["anim1"] = "anim@amb@nightclub@lazlow@hi_chair@", ["anim2"] = "seatedidle_hi_13_sexualadvance_laz", ["block"] = false, ["sync"] = 0.6, ["tempo"] = 60, ["distancia"] = 2 },
}

-- Registro do comando /e
RegisterCommand('e', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if (GetEntityHealth(GetPlayerPed(source)) > 102) and exports["vrp"]:checkCommand(user_id) then
        local comando = table.concat(args, " ")
        local foundAnim = false

        -- Verifique se o comando está em animList
        for k, v in pairs(animList) do
            if comando == v.anim then
                local nplayer = vRPclient.getNearestPlayer(source, v.distancia)
                local nuser_id = vRP.getUserId(nplayer)
                local source = source
		        local user_id = vRP.getUserId(source)
                local identity = vRP.getUserIdentity(user_id)

                if nplayer then
                    local ok = vRP.request(nplayer, "O " .. identity.nome .. " " .. identity.sobrenome .. " está pedindo para " .. v.nome .. "!", 5000)
                    if ok then
                        TriggerClientEvent("Nikito:EmotesDupla", nplayer, v.sync)
                        vRPclient._playAnim(source, false, {{v.anim1, v.anim2}}, true)

                        if not v.block then
                            vRPclient._playAnim(nplayer, false, {{v.anim1, v.anim2}}, true)
                            SetTimeout(v.tempo * 1000, function()
                                vRPclient._stopAnim(nplayer, false)
                                vRPclient._stopAnim(source, false)
                            end)
                        else
                            if v.anim == "tapa" then
                                vRPclient._playAnim(nplayer, false, {{"melee@unarmed@streamed_variations", "victim_takedown_front_slap"}}, true)
                                SetTimeout(v.tempo * 1000, function()
                                    vRPclient._stopAnim(source, false)
                                    vRPclient._playScreenEffect(nplayer, "Rampage", 5)
                                    SetTimeout(1.2 * 1000, function()
                                        vRPclient._stopAnim(nplayer, false)
                                        TriggerClientEvent("Nikito:ragDoll", nplayer, 8)
                                    end)
                                end)
                            elseif v.anim == "murro" then
                                SetTimeout(400, function()
                                    vRPclient._playAnim(nplayer, false, {{"melee@unarmed@streamed_variations", "victim_takedown_front_cross_r"}}, true)
                                    vRPclient._playScreenEffect(nplayer, "Rampage", 17)
                                    SetTimeout(v.tempo * 1000, function()
                                        vRPclient._stopAnim(source, false)
                                        SetTimeout(1 * 1000, function()
                                            vRPclient._stopAnim(nplayer, false)
                                            TriggerClientEvent("Nikito:ragDoll", nplayer, 15)
                                        end)
                                    end)
                                end)
                            end
                        end
                    else
                        TriggerClientEvent("notify", source, "negado", "Essa pessoa recusou seu pedido!", 5000)
                    end
                else
                    TriggerClientEvent("Notify", source, "negado", "Ninguem por perto!", 5000)
                end

                foundAnim = true
                break
            end
        end

        -- Se não encontrou uma animação em animList, realize a animação padrão
        if not foundAnim then 
            TriggerClientEvent("emotes", source, comando)
        end
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- /e3
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e3',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)

	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer and args[2] then
				TriggerClientEvent("emotes",nplayer,args[2])
			else
				local nplayer2 = vRPclient.getNearestPlayer(source,5)
				if nplayer2 then
					TriggerClientEvent("emotes",nplayer2,args[1])
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e4
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e4', function(source, args, rawCommand)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        for _,playerId in pairs(GetPlayers()) do
            TriggerClientEvent("emotes",playerId,args[1])
        end
    end
end)


function RegisterTunnel.checkCommands()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if exports["vrp"]:checkCommand(user_id) then
            return true
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------
-- CARREGAR CAVALINHO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent('cmg2_animations:syncSCRIPTFODIDO_2')
AddEventHandler('cmg2_animations:syncSCRIPTFODIDO_2', function(target, animationLib, animation, animation2, distans, distans2, height,targetSrc,length,spin,controlFlagSrc,controlFlagTarget,animFlagTarget)	
	function getDistance(coords, ncoords) return #(vector3(coords.x, coords.y, coords.z) - vector3(ncoords.x, ncoords.y, ncoords.z))end

	local ped = GetPlayerPed(source) 
	local loc = GetEntityCoords(ped) 
	local nped = GetPlayerPed(targetSrc) 
	local nloc = GetEntityCoords(nped)
	
	if(getDistance(nloc,loc)<8)then	
		TriggerClientEvent('cmg2_animations:syncTargetSCRIPTFODIDO', targetSrc, source, animationLib, animation2, distans, distans2, height, length,spin,controlFlagTarget,animFlagTarget)
		TriggerClientEvent('cmg2_animations:syncMeSCRIPTFODIDO', source, animationLib, animation,length,controlFlagSrc,animFlagTarget)
	end	
end)

RegisterServerEvent('cmg2_animations:stopSCRIPTFODIDO')
AddEventHandler('cmg2_animations:stopSCRIPTFODIDO', function(targetSrc)
	TriggerClientEvent('cmg2_animations:cl_stopSCRIPTFODIDO', targetSrc)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PANO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end