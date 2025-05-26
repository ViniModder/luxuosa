
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECK ROUPAS
-----------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.checkItem2()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id,"corda") >= 1 then
			return true 
		else
			 TriggerClientEvent("Notify",source,"negado","Você não possui <b>Cordas</b> na mochila para carregar.", 5000) 
			return false
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("carregar_ombro")
AddEventHandler("carregar_ombro",function(target, animationLib, animationLib2, animation, animation2, distans, distans2, height, targetSrc, length,spin, controlFlagSrc, controlFlagTarget, animFlagTarget)
		local source = source
		local user_id = vRP.getUserId(source)
		local nplayer = vRPclient.getNearestPlayer(source, 3)
		local identity = vRP.getUserIdentity(user_id)
		local request = false

		if vRPclient.getHealth(nplayer) <= 101 then
			request = true
			TriggerClientEvent("Notify", source, "aviso", "Você está sendo carrregado por " .. identity.nome .. " " .. identity.sobrenome .. "!", 5000)
		else
			request = vRP.request(nplayer,"Você deseja ser carregado por " .. identity.nome .. " " .. identity.sobrenome .. "?", 15)
		end

		if request then
			TriggerClientEvent("cmg2_animations:syncTarget479", targetSrc, source, animationLib2, animation2, distans,distans2, height, length, spin, controlFlagTarget, animFlagTarget)
			TriggerClientEvent("cmg2_animations:syncMe479", source, animationLib, animation, length, controlFlagSrc,animFlagTarget)
		else
			TriggerClientEvent("Notify", source, "negado", "O jogador recusou seu pedido de carregar.", 5000)
		end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMATION STOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("cmg2_animations:stop479")
AddEventHandler("cmg2_animations:stop479", function(targetSrc)
	if targetSrc > 0 then
		TriggerClientEvent("cmg2_animations:cl_stop479", targetSrc)
	end
end)


	