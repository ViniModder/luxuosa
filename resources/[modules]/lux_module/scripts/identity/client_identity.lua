-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
Tunnel = module("vrp","lib/Tunnel")
Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROXY
-----------------------------------------------------------------------------------------------------------------------------------------
cRPiidentity = {}
Tunnel.bindInterface("module",cRPiidentity)
vSERVERidentity = Tunnel.getInterface("module")
--vRPserver = Tunnel.getInterface("vRP","paraisopolis_module_inspect")
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local identity = false

RegisterNUICallback('closeIdentity', function()
    identity = false
end)

RegisterKeyMapping("meurg", "Identity", "keyboard", "F11")
RegisterCommand("meurg", function()
	if not identity then
		SendNUIMessage({"SHOW_NUI","identity"})		
		identity = true
	else
		SendNUIMessage({"CLOSE_NUI","identity"})
		identity = false
	end
end)

RegisterNUICallback("requestIdentity",function(data,cb)
	local infos = vSERVERidentity.Identity()
	if infos then
		cb({ infos = infos })
	end
end)

RegisterKeyMapping("abrirIdentidade", "Abrir Identidade", "keyboard", "F11") -- Mapeia a tecla F11 para abrir a identidade

RegisterCommand("abrirIdentidade", function()
    TriggerServerEvent("atualizarCacheMultas") -- Chama o evento personalizado no servidor para atualizar o cache de multas
end)







