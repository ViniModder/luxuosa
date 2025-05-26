local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")


RegisterCommand('spec', function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id, 'gerente.permissao') then
		if args[1] then
			local player = vRP.getUserSource(parseInt(args[1]))
			if player then
				local mundo = GetPlayerRoutingBucket(player)
				if mundo then
					SetPlayerRoutingBucket(source, mundo)
					TriggerClientEvent('Notify', source, 'alerta', 'Você foi teleportado para o mundo: '..mundo)
					Citizen.Wait(1000)
				end
				if GetPlayerName(player) then
					local coords = GetEntityCoords(GetPlayerPed(player))
					if coords.x ~= 0 and coords.y ~= 0 and coords.z ~= 0 then
						TriggerClientEvent('spectate:main', source, coords, player)
					end
				end
			end
		end
    end
end)