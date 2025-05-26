-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ply = {
    IsOpened = false,
    actualTab = 0
}

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
OpenInteraction = function()
    ply.IsOpened = true

    InteractionsList = {}
    for index in pairs(Config.InteractionsMenu) do
        InteractionsList[index] = {
            name = Config.InteractionsMenu[index].name,
            desc = Config.InteractionsMenu[index].desc,
            image = Config.InteractionsMenu[index].image,
        }
    end

    SetNuiFocus(true, true)
    SendNUIMessage({ action = "SHOW_NUI", body = InteractionsList })
end

CloseInteraction = function()
    ply.IsOpened = false
    
    SetNuiFocus(false, false)
    SendNUIMessage({ action = "CLOSE_NUI" })
end

RegisterNetEvent("updateRoupas")
AddEventHandler("updateRoupas",function(custom)
    vRP.setCustomization(custom)
    --UseClothes(custom)
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function GetMyCustom()
    local ply = PlayerPedId()
	local custom     = {}

	for i = 0, 20 do
		custom[i] = {GetPedDrawableVariation(ply, i), GetPedTextureVariation(ply, i), GetPedPaletteVariation(ply, i)}
	end

	for i = 0, 10 do
		custom["p" .. i] = {GetPedPropIndex(ply, i), math.max(GetPedPropTextureIndex(ply, i), 0)}
	end

	return custom
end

function CreateTunnel.UseClothes(clothes)
    local ply = PlayerPedId()
    local custom = clothes

    for k, v in pairs(custom) do
        if k ~= "name" then
            local isprop, index = parse_part(k)
            if isprop then
                if v[1] < 0 then
                    ClearPedProp(ply, index)
                else
                    SetPedPropIndex(ply, index, v[1], v[2], v[3] or 2)
                end
            else
                SetPedComponentVariation(ply, index, v[1], v[2], v[3] or 2)
            end
        end
    end
end

function parse_part(key)
	if type(key) == "string" and string.sub(key, 1, 1) == "p" then
		return true, tonumber(string.sub(key, 2))
	else
		return false, tonumber(key)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACKS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('CLOSE_NUI', function() 
    CloseInteraction()
end)

RegisterNUICallback('actionClick', function(data, cb) 
    if not data.index then return end

    ply.actualTab = data.index

    InteractionsListId = {}
    if false then
        InteractionsListId = true 
    else
        for index in pairs(Config.InteractionsMenu[data.index].body) do
            if Config.InteractionsMenu[data.index].name == "Roupas" then
                InteractionsListId[index] = {
                    name = Config.InteractionsMenu[data.index].body[index].name,
                    desc = Config.InteractionsMenu[data.index].body[index].desc,
                    image = Config.InteractionsMenu[data.index].body[index].image,
                    used = Execute.CheckSlot(index)
                }
            elseif Config.InteractionsMenu[data.index].name == "Veiculo" then
                InteractionsListId[index] = {
                    name = Config.InteractionsMenu[data.index].body[index].name,
                    desc = Config.InteractionsMenu[data.index].body[index].desc,
                    image = Config.InteractionsMenu[data.index].body[index].image,
                    type = Config.InteractionsMenu[data.index].type,
                    action = Config.InteractionsMenu[data.index].body[index].action
                }
            else
                InteractionsListId[index] = {
                    name = Config.InteractionsMenu[data.index].body[index].name,
                    desc = Config.InteractionsMenu[data.index].body[index].desc,
                    image = Config.InteractionsMenu[data.index].body[index].image,
                }
            end
        end
    end

    cb({ type = Config.InteractionsMenu[data.index].type, list = InteractionsListId })
end)

RegisterNUICallback('actionUse', function(data, cb) 
    --  print(Execute.SetClothes(data.action, data.index, GetMyCustom()))
    if (data.type == "clothes") then
		local ped = PlayerPedId()
		local vida = GetEntityHealth(ped)
		if vida > 101 then
			local res = Execute.SetClothes(data.action, data.index, vRP.getCustomization())
			cb(res)
			return
		else
			TriggerEvent("Notify","sucesso","Voce esta morto..",5000)
			return
		end
		
    elseif (data.type == "player") then
		local ped = PlayerPedId()
		local vida = GetEntityHealth(ped)
		if vida > 101 then
			Execute.PlayerFunction(data.action)
			cb(true)
		else
			TriggerEvent("Notify","sucesso","Voce esta morto..",5000)
			return
		end
    end

    cb(Execute.executeInteraction(ply.actualTab, data.index))
end)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do  
        local SLEEP_TIME = 1000

        if ply.IsOpened then
            SLEEP_TIME = 0

            DisableControlAction(2, 37, true)
            DisablePlayerFiring(PlayerPedId(),true)
            DisableControlAction(0, 106, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 263, true)
        end

        Wait( SLEEP_TIME )
    end 
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- KEY MAPPING
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("open_interactionmenu","Open Interactions","keyboard","f9")
RegisterCommand('open_interactionmenu', function(source,args)
    if ply.IsOpened then return end

    OpenInteraction()
end)