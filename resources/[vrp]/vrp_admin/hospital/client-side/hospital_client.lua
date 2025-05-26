local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
emP = Tunnel.getInterface("emp_hospital")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local macas = {
    ---[2] = { -467.78,-290.03,34.92 , deitado = { -467.08,-291.08,35.84,210.82 } },antigo hospital

}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEITANDO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        local x, y, z = GetEntityCoords(ped)

        for k, v in pairs(macas) do
            local distance = GetDistanceBetweenCoords(v[1], v[2], v[3], x, y, z, true)

            if distance <= 1.1 then
                drawTxt("~r~E~w~  DEITAR    ~g~G~w~  TRATAMENTO", 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)

                if IsControlJustPressed(0, 38) then
                    SetEntityCoords(ped, v.deitado[1], v.deitado[2], v.deitado[3])
                    SetEntityHeading(ped, v.deitado[4])
                    vRP._playAnim(false, {{"amb@world_human_sunbathe@female@back@idle_a", "idle_a"}}, true)
                end

                if IsControlJustPressed(0, 47) then
                    if emP.checkServices() then
                        TriggerEvent('tratamento-macas')
                        TriggerEvent('resetDiagnostic')
                        TriggerEvent('resetWarfarina')
                        SetEntityCoords(ped, v.deitado[1], v.deitado[2], v.deitado[3])
                        SetEntityHeading(ped, v.deitado[4])
                        vRP._playAnim(false, {{"amb@world_human_sunbathe@female@back@idle_a", "idle_a"}}, true)
                    else
                        TriggerEvent("Notify", "aviso", "Existem paramédicos em serviço.")
                    end
                end
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES
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

RegisterNetEvent('tratamento-macas')
AddEventHandler('tratamento-macas',function()
    print('iniciou o trataaaaaaa')
	-- TriggerEvent("cancelando",true)
	-- repeat
	-- 	SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId())+1)
	-- 	Citizen.Wait(1500)
	-- until GetEntityHealth(PlayerPedId()) <= 101
	-- TriggerEvent("Notify","importante","Tratamento concluido.")
	-- TriggerEvent("cancelando",false)
    local ped = PlayerPedId()
    local health = GetEntityHealth(ped)
	TriggerEvent("cancelando",true)

    repeat
        Citizen.Wait(600)
            SetEntityHealth(ped,GetEntityHealth(ped)+1)
    until GetEntityHealth(ped) >= 400 or GetEntityHealth(ped) <= 102
	TriggerEvent("Notify","importante","Tratamento concluido.")
	TriggerEvent("cancelando",false)
end)