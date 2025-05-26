local droplist = {}

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE DROPAR ITENS
-----------------------------------------------------------------------------------------------------------------------------------------
function API.updateDrops(id,marker)
	droplist[id] = marker
end

function API.removeDrop(id)
	if droplist[id] ~= nil then
		droplist[id] = nil
	end
end

Citizen.CreateThread(function()
    while true do
        local time = 1000
        local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

		for k,v in pairs(droplist) do
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = #(coords - vector3(v.x,v.y,cdz))
			if distance <= 15 and GetEntityHealth(ped) > 101 and not vRP.isHandcuffed() then
				time = 5
				DrawMarker(21,v.x,v.y,cdz+0.2, 0, 0, 0, 0, 180.0, 130.0, 0.3, 0.3, 0.3, 130, 86, 255, 50, 0, 0, 0, 1)
				DrawText3D(v.x, v.y,v.z-0.6, "Pressione ~p~[E] ~p~para pegar ~p~ "..v.item.." x".. v.count .." ~y~")
                if distance < 1.2 then 
    
                    if IsControlJustPressed(0, 38) then 
                        Remote.pegarItem(k)
						
                        Wait(1000)
                    end
                end
			end
		end

        Citizen.Wait(time)
    end
end)

