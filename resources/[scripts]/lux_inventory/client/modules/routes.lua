local ts = tostring
local tn = tonumber
local PENDING_CB <const> = {}
local COOLDOWN = GetGameTimer()

Routes = {
    ---@see UI

    ["CLOSE_INVENTORY"] = function(data)
        if data.right then 
            Remote._emitCloseListeners()
        end
        SetNuiFocus()
        API.isInVehicleChest()
    end,

    ["PLAY_SOUND"] = function(data)
        if data.sound == 'success' then
            PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
        elseif data.sound == 'error' then
            PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
        end
    end,

    ---@see Shop
    ["SHOP_ACTION"] = function(data)
        ---@return boolean | table
        return Remote.shopAction(data.store_name, data.item, data.amount, data.slot)
    end,
    ---@see Chest
    ["TAKE_CHEST_ITEM"] = function(data)
        ---@return boolean | table
        return Remote.takeChestItem(data.item, data.amount,ts(data.slot), ts(data.playerslot))
    end,
    ["STORE_CHEST_ITEM"] = function(data)
        ---@return boolean
        return Remote.storeChestItem(ts(data.slot), data.amount, ts(data.to_slot))
    end,


    ---@see User Inventory
    ["GET_WEAPONS"] = function()
        ---@return table<string, number> | false
        return vRP.getWeapons() -- { ['WEAPON_SPECIALCARBINE'] = { ammo = 500} }
    end,
    ["MANAGE_WEAPONS"] = function(data)
        ---@return table<string, string | boolean>
        if (COOLDOWN - GetGameTimer()) > 0 then return end
        COOLDOWN = (GetGameTimer() + 3000)

        return Remote.storeWeapons(data.weapons)
    end,
    
    ["GET_INVENTORY"] = function(data)
        ---@return table<string, table | number> | false
        --[[
            {
                weight: number, 
                max_weight: number,
                inventory: {
                    [slot: string]: {
                        item: string,
                        amount: number,
                    },
                }
            }
        ]]
        return Remote.getInventory()
    end,

    -- ["REQUEST_USER_WEIGHT"] = function(data)
    --     ---@return table<string, number> | false 
    --     --[[
    --         {
    --             weight: number,
    --         }
    --     ]]
    --     return 5000--Remote.getWeight()
    -- end,

    ["SWAP_SLOT"] = function(data)
        ---@return boolean | nil
        return Remote.swapSlot(
            ts(data.from_slot), -- slot inicial
            tn(data.from_amount), -- quantidade à ser movida
            ts(data.to_slot) -- slot alvo!
        )
    end,

    ["SEND_ITEM"] = function(data)
        ---@return boolean | table
        return Remote.sendItem(
            ts(data.slot), -- slot inicial
            tn(data.amount) -- quantidade à ser usada
        )
    end,
    
    ["USE_ITEM"] = function(data)
        ---@return boolean | nil

        return Remote.useItem(
            ts(data.slot), -- slot inicial
            tn(data.amount) -- quantidade à ser usada
        )
    end,

    ["DROP_ITEM"] = function(data)
    --    print(json.encode(data))
    --    TriggerEvent("Notify","mochila","Dropou: ".. data.amount .." : " .. data.item)
        ---@return boolean | nil
        if GetVehiclePedIsIn(PlayerPedId()) ~= 0 then TriggerEvent('Notify', 'negado', 'Você não pode dropar itens de dentro de um veiculo', 5000) return end
        return Remote.dropItem(
            ts(data.slot), -- slot inicial
            tn(data.amount) -- quantidade à ser usada
        )
    end,


    -- ["REQUEST_PICKUPS_NEAR"] = function()
    --     return {}--API.getPickups()
    -- end,

    ---@see Inspect

    ["TAKE_INSPECT_ITEM"] = function(data)
        --[[ data.slot => Slot do item a ser roubado ]]
        ---@return boolean
        return Remote.takeInspectItem(ts(data.from_slot), ts(data.to_slot), tn(data.amount))
    end,

    ["PUT_INSPECT_ITEM"] = function(data)
        --[[ data.slot => Slot do item a ser roubado ]]
        ---@return boolean
        return Remote.putInspectItem(ts(data.from_slot), ts(data.to_slot), tn(data.amount))
    end,


    ---@see Config
    ["REQUEST_ITEMS_CONFIG"] = function(data)
        local config = Remote.getItems() 
        for k,v in pairs(config) do 
            if v.func then 
                config[k].func = nil
            end
        end
        return config
    end,


}


local NoWait = {
    ["USE_ITEM"] = true
}
CreateThread(function()
    for k,v in pairs(Routes) do
        RegisterNUICallback(k, function(data, cb)
            if not PENDING_CB[k] or NoWait[k] then 
                PENDING_CB[k] = true
                local result = v(data)
                PENDING_CB[k] = nil
                if cb then
                    cb(result)
                end
            else 
                -- error("Callback "..k.." is already pending!")
                cb(false)
            end
        end)
    end
end)