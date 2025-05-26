--emP = Tunnel.getInterface("jobs")

local servico = false
local locais = 0
local processo = false
local tempo = 0
local animacao = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEGAR TRABALHO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local dom = 1000
		local x,y,z = 1130.0, -674.16, 56.82
		local distance = #(GetEntityCoords(PlayerPedId()) - vec3(x,y,z))
		if distance < 20 then
			dom = 5
			DrawText3Ds(x,y,z + 0.5,"~w~PRESSIONE ~g~E ~w~PARA PEGAR O SERVIÇO")
			DrawMarker(27,x,y,z-1.0,0,0,0,0,0,0,0.5,0.5,0.5,178,236,177,100,0,300,0,1)
			if not servico then
				if distance < 1 then
					if IsControlJustPressed(0, 38) then
						TriggerEvent("Notify","pesca","Você entrou em serviço.")
						Wait(2000)
						TriggerEvent("Notify","pesca","Se dirija ao local de pesca!")
						servico = true
					end
				end
			end
		end
		 
		Citizen.Wait(dom)
	end
end)	
-----------------------------------------------------------------------------------------------------------------------------------------
-- PESCAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local dom = 1000
		if servico then
			local x,y,z = 1112.21, -684.59, 59.16
			local distance = #(GetEntityCoords(PlayerPedId()) - vec3(x,y,z))
			if distance <= 15 then 
				dom = 5
                --DrawMarker(1,x,y,z-1.5,0,0,0,0,0,0,350.0,350.0,50.0,255,255,255,30,0,0,0,0)
                --if distance <= 80 then
					drawTxt("PRESSIONE  ~r~E~w~  PARA INICIAR A PESCARIA",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0, 38) and not IsPedInAnyVehicle(ped) then
						animacao = true
						if animacao then
							if not IsEntityPlayingAnim(ped,"amb@world_human_stand_fishing@idle_a","idle_c",3) then
								vRP._CarregarObjeto("amb@world_human_stand_fishing@idle_a","idle_c","prop_fishing_rod_01",15,60309)
							end			

							local taskBarFishing = exports["vrp_taskbar"]:taskFishing()
							if not taskBarFishing then
								TriggerEvent("Notify","negado","O Peixe Escapou.")
							else
								vTunnel.givePeixe()
							end	
							
							vRP.stopAnim(false)
							vRP._DeletarObjeto()
							animacao = false	
						end	
					end
				--end
		    end                   
		end
	Citizen.Wait(dom)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELANDO SERVICO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0,168) and servico then
			TriggerEvent("Notify","pesca","Você saiu do serviço.")
			--emP.removeBlips2()
			servico = false
			TriggerEvent('cancelando',false)
			vRP.playSound("Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
			if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_stand_fishing@idle_a","idle_c",3) then
				vRP._stopAnim(false)
				vRP._DeletarObjeto()
			end
			TriggerEvent('cancelando',false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCÕES
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.50,0.35)
	SetTextColour(255,255,255,500)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/0
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,80)
end

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
-- DESABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function Desabilitar()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1)
			if animacao then
				BlockWeaponWheelThisFrame()
				DisableControlAction(0,16,true)
				DisableControlAction(0,17,true)
				DisableControlAction(0,24,true)
				DisableControlAction(0,25,true)
				DisableControlAction(0,29,true)
				DisableControlAction(0,56,true)
				DisableControlAction(0,57,true)
				DisableControlAction(0,73,true)
				DisableControlAction(0,166,true)
				DisableControlAction(0,167,true)
				DisableControlAction(0,170,true)				
				DisableControlAction(0,182,true)	
				DisableControlAction(0,187,true)
				DisableControlAction(0,188,true)
				DisableControlAction(0,189,true)
				DisableControlAction(0,190,true)
				DisableControlAction(0,243,true)
				DisableControlAction(0,245,true)
				DisableControlAction(0,257,true)
				DisableControlAction(0,288,true)
				DisableControlAction(0,289,true)
				DisableControlAction(0,344,true)		
			end	
		end
	end)
end