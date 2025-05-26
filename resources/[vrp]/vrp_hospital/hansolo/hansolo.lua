-----------------------------------------------------------------------------------------------------------------------------------------
--[ vRP ]--------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ CONEXÃO ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
Resg = Tunnel.getInterface("vrp_hospital")
emP = Tunnel.getInterface("vrp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
--[ VARIÁVEIS ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------
--[ REANIMAR ]---------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('reanimar')
AddEventHandler('reanimar',function()
	local handle,ped = FindFirstPed()
	local finished = false
	local reviver = nil
	repeat
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(ped),true)
		if IsPedDeadOrDying(ped) and not IsPedAPlayer(ped) and distance <= 1.5 and reviver == nil then
			reviver = ped
			TriggerEvent("cancelando",true)
			vRP._playAnim(false,{{"amb@medic@standing@tendtodead@base","base"},{"mini@cpr@char_a@cpr_str","cpr_pumpchest"}},true)
			TriggerEvent("progress",15000,"reanimando")
			SetTimeout(15000,function()
				SetEntityHealth(reviver,110)
				local newped = ClonePed(reviver,GetEntityHeading(reviver),true,true)
				TaskWanderStandard(newped,10.0,10)
				local model = GetEntityModel(reviver)
				SetModelAsNoLongerNeeded(model)
				Citizen.InvokeNative(0xAD738C3085FE7E11,reviver,true,true)
				TriggerServerEvent("trydeleteped",PedToNet(reviver))
				vRP._stopAnim(false)
				TriggerServerEvent("reanimar:pagamento")
				TriggerEvent("cancelando",false)
			end)
			finished = true
		end
		finished,ped = FindNextPed(handle)
	until not finished
	EndFindPed(handle)
end)

-- [ COORDINATES ] --
local macas = {
	{ ['x'] = -460.9, ['y'] = -287.22, ['z'] = 34.92, ['x2'] = -460.31, ['y2'] = -288.55, ['z2'] = 35.84, ['h'] = 200.0 },
	{ ['x'] = -464.21, ['y'] = -288.69, ['z'] = 34.92, ['x2'] = -463.68, ['y2'] = -290.06, ['z2'] = 35.84, ['h'] = 200.0 },
	{ ['x'] = -467.56, ['y'] = -290.01, ['z'] = 34.92, ['x2'] = -466.95, ['y2'] = -291.48, ['z2'] = 35.84, ['h'] = 200.0 },
	{ ['x'] = -469.33, ['y'] = -285.65, ['z'] = 34.92, ['x2'] = -469.91, ['y2'] = -284.25, ['z2'] = 35.84, ['h'] = 10.0 },
	{ ['x'] = -465.9, ['y'] = -284.19, ['z'] = 34.92, ['x2'] = -466.55, ['y2'] = -282.68, ['z2'] = 35.84, ['h'] = 10.0 },
	{ ['x'] = -462.15, ['y'] = -282.66, ['z'] = 34.92, ['x2'] = -462.78, ['y2'] = -281.13, ['z2'] = 35.84, ['h'] = 10.0 },
	{ ['x'] = -458.42, ['y'] = -281.13, ['z'] = 34.92, ['x2'] = -459.1, ['y2'] = -279.57, ['z2'] = 35.84, ['h'] = 10.0 },
	{ ['x'] = -454.53, ['y'] = -279.45, ['z'] = 34.92, ['x2'] = -455.2, ['y2'] = -277.89, ['z2'] = 35.84, ['h'] = 10.0 },
	{ ['x'] = -448.91, ['y'] = -282.39, ['z'] = 34.92, ['x2'] = -448.38, ['y2'] = -283.69, ['z2'] = 35.84, ['h'] = 200.0 },
	{ ['x'] = -452.08, ['y'] = -283.61, ['z'] = 34.92, ['x2'] = -451.52, ['y2'] = -285.03, ['z2'] = 35.84, ['h'] = 200.0 },
	{ ['x'] = -455.48, ['y'] = -285.09, ['z'] = 34.92, ['x2'] = -454.96, ['y2'] = -286.42, ['z2'] = 35.84, ['h'] = 200.0 }
}


-- [ MAIN THREADS ] --
Citizen.CreateThread(function()
	while true do
		local sleep = 1000
		for k,v in pairs(macas) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = GetDistanceBetweenCoords(v.x,v.y,cdz,x,y,z,true)
			local macas = macas[k]
			if distance <= 15.5 then
				DrawMarker(21, macas.x, macas.y, macas.z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0, 139, 139,90,0,0,0,1)
				sleep = 5
				if distance <= 1.2 then
					drawTxt("~b~E~w~  DEITAR    ~g~G~w~  TRATAMENTO",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) then
						SetEntityCoords(ped,v.x2,v.y2,v.z2)
						SetEntityHeading(ped,v.h)
						vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
					end
					if IsControlJustPressed(0,47) then
						if GetEntityHealth(ped) >= 300 then
							TriggerEvent("Notify","negado","Você não precisa de tratamento.")
						else
							if emP.checkServices() then
								TriggerEvent('cancelando',source,true)
								TriggerServerEvent('progresso-maca')
								SetEntityCoords(ped,v.x2,v.y2,v.z2)
								SetEntityHeading(ped,v.h)
								vRP._playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a"}},true)
								SetTimeout(150000,function()
									TriggerEvent('cancelando',source,false)
									SetEntityHealth(ped,300)
									TriggerEvent("Notify","sucesso","Você já pode levantar.")
								end)
							else
								TriggerEvent("Notify","aviso","Existem médicos em serviço.")
							end
						end
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)

-- [ FUNCTIONS ] --
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
--[ TRATAMENTO ]-------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
local tratamento = false
RegisterNetEvent("tratamento")
AddEventHandler("tratamento",function()
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
    local armour = GetPedArmour(ped)

    SetEntityHealth(ped,health)
    SetPedArmour(ped,armour)
	--TriggerEvent("batatafritajoel",armour)
	
	if true then
		if tratamento then
			return
		end

		tratamento = true
		TriggerEvent("Notify","sucesso","Tratamento iniciado, aguarde a liberação do <b>profissional médico.</b>.",8000)
		TriggerEvent('resetWarfarina')
		TriggerEvent('resetDiagnostic')
		

		if tratamento then
			repeat
				Citizen.Wait(600)
				if GetEntityHealth(ped) > 101 then
					SetEntityHealth(ped,GetEntityHealth(ped)+1)
				end
			until GetEntityHealth(ped) >= 400 or GetEntityHealth(ped) <= 101
				TriggerEvent("Notify","sucesso","Tratamento concluido.",8000)
				tratamento = false
		end
	else
		TriggerEvent("Notify","negado","Você precisa estar deitado em uma maca para ser tratado.",8000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
--[ FUNÇÕES ]----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.28, 0.28)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 41, 11, 41, 68)
end