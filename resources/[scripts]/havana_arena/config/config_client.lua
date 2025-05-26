------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("havana_arena",src)
vSERVER = Tunnel.getInterface("havana_arena")
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {}
config.rangeDistance = 100 -- Distancia se o player se afastar muito voltar para a arena

config.locArenas = { -- Localizações das arenas
    vec3(-401.1,1212.49,325.93)
}

config.keys = {
    scoreboard = 137, -- CAPS
    spawn = 38, -- SPAWNAR
}

config.drawMarker = function(coords) -- DRAWMARKER DO BLIP DA ARENA
 
    DrawMarker(1,coords[1],coords[2],coords[3]-1.0,0,0,0,0,0,0,1.0,1.0,0.9,0,0,255,155,0,0,0,1)
    DrawText3Ds(coords[1],coords[2],coords[3], "Aperte ~g~ E ~w~ para acessar a arena")
end

config.drawTxt = function()
    drawTxt("VOCÊ ESTÁ MORTO PRESSIONE ~b~E~w~ PARA SPAWNAR",4,0.5,0.93,0.50,255,255,255,255)
end


function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	-- DrawText(_x,_y)
end

