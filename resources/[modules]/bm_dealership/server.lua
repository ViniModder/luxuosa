local Tunnel = module("vrp","lib/Tunnel")
local RESOURCE_NAME = GetCurrentResourceName()
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

RegisterTunnel = {}
Tunnel.bindInterface(RESOURCE_NAME, RegisterTunnel)

vCLIENT = Tunnel.getInterface(RESOURCE_NAME)



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUERYS DEALERSHIP
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("bm_dealership/dealership/createTable", "CREATE TABLE IF NOT EXISTS `bm_dealership` ( `vehicle` varchar(50) NOT NULL, `stock` int(11) DEFAULT 0, PRIMARY KEY (`vehicle`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4; ")
vRP._prepare("bm_dealership/dealership/getVehicles", "SELECT * FROM bm_dealership")
vRP._prepare("bm_dealership/dealership/updateStock", "UPDATE bm_dealership SET stock = @stock WHERE vehicle = @vehicle")
vRP._prepare("bm_dealership/dealership/removeVehicle", "DELETE FROM bm_dealership WHERE vehicle = @vehicle")
vRP._prepare("bm_dealership/dealership/addVehicle", "REPLACE INTO bm_dealership(vehicle,stock) VALUES(@vehicle,@stock)")

vRP._prepare("bm_dealership/dealership/getVehicle", "SELECT veiculo FROM vrp_user_veiculos WHERE user_id = @user_id AND veiculo = @vehicle")
vRP._prepare("bm_dealership/dealership/totalVehicles", "SELECT COUNT(veiculo) as qtd FROM vrp_user_veiculos WHERE user_id = @user_id")
vRP._prepare("bm_dealership/dealership/addUserVehicle", "INSERT INTO vrp_user_veiculos(user_id,veiculo,ipva) VALUES(@user_id,@vehicle,@ipva)")
vRP._prepare("bm_dealership/dealership/removeUserVehicle", "DELETE FROM vrp_user_veiculos WHERE veiculo = @vehicle AND user_id = @user_id")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS DEALERSHIP
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local dealership = {
    list = {}
}

function dealership:addCar(index, value, insert)
    self.list[index] = value

    if insert then
        vRP._execute("bm_dealership/dealership/addVehicle", { vehicle = index, stock = self.list[index].estoque })
    end
end

function dealership:remCar(index)
    if not self.list[index] then return end

    self.list[index] = nil
    vRP._execute("bm_dealership/dealership/removeVehicle", { vehicle = index })
end

function dealership:getCar(index)
    if not index then return end
    if not self.list[index] then print("Cadastrar o veiculo: "..index) return false end

    return self.list[index]
end

function dealership:updateStock(index, amount)
    if not self.list[index] then return end

    self.list[index].estoque = amount
    vRP._execute("bm_dealership/dealership/updateStock", { vehicle = index, stock = self.list[index].estoque })
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.dealershipRequest(type, value)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if type == "addCar" then
            dealership:addCar(value.vehicle, {
                name = exports.lux_garages:getVehicleName(value.vehicle),
                model = exports.lux_garages:getVehicleModel(GetHashKey(value.vehicle)),
                estoque = value.estoque,
                preco = exports.lux_garages:getVehiclePrice(value.vehicle),
                class = exports.lux_garages:getVehicleType(value.vehicle),
                portamalas = exports.lux_garages:getVehicleTrunk(value.vehicle)
            }, true)

            return
        end

        if type == "remCar" then
            dealership:remCar(value)
            return
        end

        if type == "updateCar" then
            dealership:updateStock(value.vehicle, value.amount)
            return
        end

        if type == "requestList" then
            local vips = cfgconce.main['discountCars']
            local discount = 0
            for i = 1, #cfgconce.main['discountCars'] do
                if vRP.hasPermission(user_id, vips[i].permission) then
                    discount = vips[i].discount
                end
            end
            return dealership.list
        end

        if type == "requestMyVehicles" then
            local query = vRP.query("bm_module/lux_garages/getAllUserVehicles", { user_id = user_id })
            local t = {}
            for i = 1, #query do
                local value = dealership:getCar(query[i].veiculo)
                local vehPrice = exports.lux_garages:getVehiclePrice(query[i].veiculo)
                t[#t + 1] = {
                    spawn =  query[i].veiculo,
                    name = exports.lux_garages:getVehicleName(query[i].veiculo),
                    model = exports.lux_garages:getVehicleModel(GetHashKey(query[i].veiculo)),
                    preco = parseInt(vehPrice - (vehPrice/cfgconce.main['vehPrice'])),
                    class = exports.lux_garages:getVehicleType(query[i].veiculo) or "nenhum",
                    estoque = (value and value.estoque or 0),
                    portamalas = (value and value.portamalas or 0),
                }
            end

            return t
        end
    end
end

function RegisterTunnel.dealershipBuyVehicle(name, custom)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local car = dealership:getCar(name)
        if car then
            if car.estoque <= 0 then
                TriggerClientEvent("Notify",source,"negado","Veiculo sem stock.", 5000)
                return
            end

            local query = vRP.query("bm_dealership/dealership/getVehicle", { user_id = user_id, vehicle = name })
            if #query > 0 then
                TriggerClientEvent("Notify",source,"negado","Você já possui esse veiculo em sua garagem.", 5000)
                return
            end

            local maxCars, totalCars = getUserAmountCars(user_id)
            if totalCars >= maxCars then
                TriggerClientEvent("Notify",source,"negado","Você não possui mais vagas na garagem.", 5000)
                return
            end

            local check = exports.lux_garages:getVehicleType(name)
            if check and check == 'vip' then
                TriggerClientEvent("Notify",source,"negado","Você não pode comprar veiculos vip aqui, acesse nossa loja.", 5000)
                return
            end


            local vips = cfgconce.main['discountCars']
            local discount = 0
            for i = 1, #cfgconce.main['discountCars'] do
                if vRP.hasPermission(user_id, vips[i].permission) then
                    discount = vips[i].discount
                end
            end

            local price = parseInt(car.preco - ( car.preco * discount/100 ))
            if vRP.tryFullPayment(user_id, price) then
                TriggerClientEvent("Notify",source,"sucesso","Parabens pela compra!!! Você comprou um <b>"..car.name.."</b> por <b>R$ "..vRP.format(price).."</b>", 5000)
                vCLIENT.resetCache(-1)
                vRP.execute("bm_dealership/dealership/addUserVehicle", { user_id = user_id, vehicle = name, ipva = os.time() })
                Wait(500)
                vRP.execute("vRP/update_tuning",{ user_id = user_id, veiculo = name, tunagem = json.encode(custom) })
                dealership:updateStock(name, (car.estoque - 1))
            else
                TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro.", 5000)
            end
        end

    end
end

function RegisterTunnel.dealershipSellVehicle(name, callback)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local status, time = exports['vrp']:getCooldown(user_id, "conce")
        print(status, time)
        --if status then
            exports['vrp']:setCooldown(user_id, "conce", 5000)

            local car = dealership:getCar(name)
            if car then
                local query = vRP.query("bm_dealership/dealership/getVehicle", { user_id = user_id, vehicle = name })
                if #query > 0 then
                    local price = parseInt(car.preco - (car.preco/cfgconce.main['vehPrice']))
                    vRP.giveMoney(user_id, price)
                    TriggerClientEvent("Notify",source,"sucesso","Você vendeu seu veiculo <b>"..car.name.."</b> para concessionaria e recebeu R$ ".. price, 5000)

                    vRP.execute("bm_dealership/dealership/removeUserVehicle", { user_id = user_id, vehicle = name })
                    vRP.sendLog("https://discord.com/api/webhooks/1264865606612549693/uUrNbbfuBreKxmF91X5OEXZKjcuLadzX8tOVU-vtkjdNuo0rdEg82q7DkZYAi6U68p1Q", "```prolog\n[USER_ID]: "..user_id.."\n[VENDEU]: "..car.name.."\n[POR]: "..price.."```")
                    return { status = true }                 
                else
                    TriggerClientEvent("Notify",source,"negado","Você não possui esse veiculo em sua garagem.", 5000)
                    return { status = false } 
                   
                end
            end
       -- end
    end
    return { status = false } 

end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function getUserAmountCars(user_id)
    if user_id then
        local query = vRP.query("bm_dealership/dealership/totalVehicles", { user_id = user_id })
        if query then
            local maxCars = cfgconce.main['maxCars']
            local vips = cfgconce.main['discountCars']
            local totalCars = query[1].qtd
            for i = 1, #cfgconce.main['discountCars'] do
                if vRP.hasPermission(user_id, vips[i].permission) then
                    maxCars = maxCars + vips[i].maxCars
                end
            end

            return maxCars,totalCars
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOAD DEALERSHIP VEHICLES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    vRP._execute("bm_dealership/dealership/createTable", {})

    local query = vRP.query("bm_dealership/dealership/getVehicles", {})
    for i = 1, #query do
        dealership:addCar(query[i].vehicle, {
            name = exports.lux_garages:getVehicleName(query[i].vehicle),
            estoque = query[i].stock,
            preco = exports.lux_garages:getVehiclePrice(query[i].vehicle),
            class = exports.lux_garages:getVehicleType(query[i].vehicle),
            portamalas = exports.lux_garages:getVehicleTrunk(query[i].vehicle),
            model = exports.lux_garages:getVehicleModel(GetHashKey(query[i].vehicle)),
        }, false)
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('conce', function(source, args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if not vRP.hasPermission(user_id, "developer.permissao") then return end

        local query = vRP.query("bm_dealership/dealership/getVehicles", {})
        local t = ""

        for i = 1, #query do
            t = t..", "..query[i].vehicle
        end

        local v_value = vRP.prompt(source, "Digite o veiculo: ", t)
        if v_value == "" or not v_value then
            return
        end

        local s_value = vRP.prompt(source, "Digite a quantidade de estoque: ", 100)
        if s_value == "" or not s_value then
            return
        end

        dealership:updateStock(v_value, s_value)
        TriggerClientEvent("Notify",source,"sucesso","Você alterou o stock do veiculo: "..v_value.." para "..s_value.."x .", 5000)
    end
end)




