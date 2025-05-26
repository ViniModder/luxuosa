local NEAR_SHOP = false

local function ParseItems(items) 
    local response = {}
    local count = 0
    for k,v in pairs(items) do
        count += 1 
        response[tostring(count)] = {
            price = items[k],
            item = k,
            slot = tostring(count)
        }
    end
    return response
end
CreateThread(function() 
    for k,v in pairs(Shops) do 
        Shops[k].items = ParseItems(v.items)
    end
    SearchShopThread()
end)

function SearchShopThread()
    CreateThread(function() 
        while not NEAR_SHOP do 
            local sleep = 1002
            local ply       = PlayerPedId()
            local plyCds    = GetEntityCoords(ply)
            for k,v in pairs(Shops) do
                for i = 1, #v.coords do
                    local distance = #(plyCds - v.coords[i])
                    if distance < 7.0 then
                        NEAR_SHOP = true
                        NearShopThread(k, i)
                    end
                end
            end
            Wait(sleep)
        end
    end)
end


function NearShopThread(store, coordIndex)
    CreateThread(function()
        while NEAR_SHOP do
            local sleep = 4
            local ply = PlayerPedId()
            local plyCds = GetEntityCoords(ply)
            local distance = #(plyCds - Shops[store].coords[coordIndex])
            if distance > 7.0 or (GetEntityHealth(PlayerPedId()) <= 101) then
                CloseShop()
                break
            end 
            DrawMarker(29, Shops[store].coords[coordIndex].x,Shops[store].coords[coordIndex].y,Shops[store].coords[coordIndex].z-0.4, 0, 0, 0, 0, 180.0, 0, 0.7, 0.7, 0.7, 255, 255, 255, 75, 1, 0, 0, 1)
            if distance <= 1.3 then
                if IsControlJustPressed(0, 38) then
                    print("near shop!")
                    print("SHOP ID: "..coordIndex.." TYPE: "..store)
                    if (not Shops[store].perm or Remote.checkPermission(Shops[store].perm)) then 
                        SendNUIMessage({
                            route = "OPEN_SHOP",
                            payload = {
                                mode = Shops[store].mode, -- buy|sell
                                store_name = store, -- buy|sell
                                inventory = Shops[store].items, -- [item: string] = price;
                            }
                        })
                        SetNuiFocus(true,true)
                    end  
                end
            end
            Wait(sleep)
        end
    end)
end

CloseShop = function()
    NEAR_SHOP = false
    SearchShopThread()

    SendNUIMessage({
        route = "CLOSE_INVENTORY",
        payload = false
    })
    SetNuiFocus(false,false)
end 