
vRP._prepare("sRP/insertOrder","INSERT INTO sjr_tuning(vehicle, mods, cart, mechanic, cartPrices, plate, status, created, user_id) VALUES(@vehicle, @mods, @cart, @mechanic, @cartPrices, @plate, @status, @created, @user_id )")

vRP._prepare("sRP/getOrder","SELECT * FROM sjr_tuning WHERE mechanic = @mechanic AND plate = @plate AND vehicle = @vehicle")

vRP._prepare("sRP/getOrderById","SELECT * FROM sjr_tuning WHERE user_id = @user_id")

vRP._prepare("sRP/getOrders","SELECT * FROM sjr_tuning")

vRP._prepare("sRP/updateOrder","UPDATE sjr_tuning SET mods = @mods, cartPrices = @cartPrices, cart = @cart WHERE plate = @plate AND mechanic = @mechanic AND vehicle = @vehicle")

vRP.prepare("sRP/DeleteOrder","DELETE from sjr_tuning WHERE vehicle = @vehicle AND plate = @plate AND id = @id")

vRP._prepare("sRP/updateStatus","UPDATE sjr_tuning SET status = @status WHERE plate = @plate AND mechanic = @mechanic AND vehicle = @vehicle")


Entity = {}

function SjR.CreateOrder(vehinfo,mods,cart,mec,price,plate,model)
	local nplayer = getUserByRegistration(plate)
	local nsource = getUserSource(nplayer)
	response = {}
	if nsource then
		local rows = vRP.query("sRP/getOrder", {mechanic = mec, plate = plate, vehicle = vehinfo})
		if price == nil then price = 0 end
		if rows[1] and rows[1] ~= nil then
			Entity[plate] = model
			vRP.execute("sRP/updateOrder", { mods = json.encode(mods), cartPrices = price, mechanic = mec, cart = json.encode(cart), plate = plate, vehicle = vehinfo })
		else
			Entity[plate] = model
			vRP.execute("sRP/insertOrder", {vehicle = vehinfo, mods = json.encode(mods), cart = json.encode(cart), mechanic = mec, cartPrices = price, plate = plate, status = 1, created = os.time(), user_id = nplayer  })
		end
		response.success = true
		return response
	end
	response.error = "Não identificado o dono do veiculo!"
	return response
end

function SjR.hasPermission()
    local source = source
    local user_id = getUserId(source)
    if user_id then
         return true --vRP.hasPermission(user_id, "admin.permissao")
    end
end

function SjR.GetOrder(mechanic, plate, vehicle)
	response = {}
	local rows = vRP.query("sRP/getOrder", {mechanic = mechanic, plate = plate, vehicle = vehicle})
	if rows[1] and rows[1] ~= nil then
		response = {
			cart = json.decode(rows[1].cart),
			custom = json.decode(rows[1].mods),
			cartPrices = rows[1].cartPrices
		}

		return response
	end
	return false
end

function SjR.GetBankMoney()
	local source = source
	local user_id = getUserId(source)
	if user_id then
		return getBankMoney(user_id)
	end
end

function SjR.HasPermission(permission)
	local source = source
	local user_id = getUserId(source)
	if user_id then
		return hasPermission(user_id, permission)
	end
end

function SjR.GetOrders()
	local rows = vRP.query("sRP/getOrders",{})
	if rows[1] and rows[1] ~= nil then
		Orders = {}
		for k,v in pairs(rows) do 
			if os.time() >= (v.created+25*Config.Orders.expireDays*120*120) then
				vRP.execute("sRP/DeleteOrder", { vehicle = v.vehicle, plate = v.plate, id = v.id })
			else
				local source = getUserSource(parseInt(v.user_id))
				local identity = getUserIdentity(parseInt(v.user_id))
				if not identity then
					identity = {}
					identity.nome = "Nome"
					identity.sobrenome = "Indefinido"
				end
				Orders[k] = v
				Orders[k].src = source
				Orders[k].name = identity.nome
				Orders[k].firstname = identity.sobrenome
				Orders[k].model = Entity[v.plate] or 0
				Orders[k].custom = json.decode(v.mods)
				Orders[k].cart = json.decode(v.cart)
				Orders[k].status = parseInt(v.status)
				Orders[k].id = parseInt(v.id)
			end
		end
		return Orders
	end
	return nil
end


function SjR.ParseCart(cart)
	items = {}
	for k,v in pairs(cart) do
		if Config.Customs[k] ~= nil and Config.Customs[k].item then
			table.insert(items,	{ item = Config.Customs[k].item[1], required_amount = Config.Customs[k].item[2], item_tunning = k })
		end
	end
	return items
end

function SjR.CancelOrder(id)
	local rows = vRP.query("sRP/getOrderById", { user_id = id })
	if rows[1] and rows[1] ~= nil then
		vRP.execute("sRP/DeleteOrder", { vehicle = rows[1].vehicle, plate = rows[1].plate, id = rows[1].id })
	end
	TriggerClientEvent("tunning:UpdateOrders", -1, SjR.GetOrders())
end

function SjR.ChangeOrderState(info, value, item)
	local source = source
	local user_id = getUserId(source)
	if user_id then
		local check = SjR.ParseCart(info.cart)
		if value == 1 then
			if item then
				for k,v in pairs(check) do
					giveInventoryItem(user_id,v['item'], parseInt(v['required_amount']))
				end
			end
			TriggerClientEvent("tunning:UpdateOrders", -1, SjR.GetOrders())
			vRP.execute("sRP/updateStatus", { status = value, vehicle = info.vehicle, mechanic = info.mechanic, plate = info.plate })
			
		elseif value == 2 then
			vRP.execute("sRP/updateStatus", { status = value, vehicle = info.vehicle, mechanic = info.mechanic, plate = info.plate })
			TriggerClientEvent("tunning:UpdateOrders", -1, SjR.GetOrders())
		end
	end
end


function SjR.AnswerOrder(info, action)
	local source = source
	local user_id = getUserId(source)
	local rows = vRP.query("sRP/getOrder", {mechanic = info.mechanic, plate = info.plate, vehicle = info.vehicle})
	response = {}
	if user_id then
		if action == "CHECK" then
			if rows[1] and rows[1] ~= nil then
				local check = SjR.ParseCart(info.cart)
				if info then
					local count = 0
					for k,v in pairs(check) do
						if getInventoryItemAmount(user_id,v['item']) >= parseInt(v['required_amount']) then
							count = count+1
						end
					end
					if count == #check then
						if tryFullPayment(parseInt(info.user_id),parseInt(info.cartPrices)) or parseInt(info.cartPrices) == 0 then
							for k,v in pairs(check) do
								tryGetInventoryItem(user_id, v['item'], parseInt(v['required_amount']))
								response.sucess = true
							end
						else
							response.error = "O player não possui dinheiro suficiente!."
						end
					else
						response.error = "Você não possui a quantidade necessaria de items!."
					end
				end
				return response
			end
		elseif action == "EXECUTE" then
			local nuser_id = getUserByRegistration(info.plate)
			if not nuser_id then nuser_id = parseInt(info.user_id) end
			if parseInt(info.cartPrices) > 0 then
				giveBankMoney(user_id,parseInt(info.cartPrices))
			end
    		setSData("custom:u" .. nuser_id .. "veh_" .. tostring(info.vehicle),rows[1].mods)
			vRP.execute("sRP/DeleteOrder", { vehicle = info.vehicle, plate = info.plate, id = info.id })
			response.sucess = true
			return response
		end
	end
	response.error = "Veiculo não encontrado no banco de dados da nossa mêcanica."
	return response
end


RegisterServerEvent("tunning:syncApplyMods")
AddEventHandler("tunning:syncApplyMods",function(vehicle,vehicle_tuning)
    TriggerClientEvent("tunning:applyTunning",-1,vehicle, vehicle_tuning)
end)

RegisterServerEvent("tunning:applyTunning")
AddEventHandler("tunning:applyTunning",function(vehicle,vehname,plate)
	local user_id = getUserByRegistration(plate)
	local data = getSData("custom:u"..user_id.."veh_"..tostring(vehname))
	local custom = json.decode(data)
    if custom then
		TriggerClientEvent("tunning:applyTunning",-1,vehicle, custom)
    end
end)





