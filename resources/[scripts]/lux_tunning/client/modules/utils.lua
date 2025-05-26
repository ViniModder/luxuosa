_G["rgb_to_hex"] = function(rgb)
    local r,g,b = table.unpack(rgb)
    --%02x: 0 means replace " "s with "0"s, 2 is width, x means hex
	return string.format("#%02x%02x%02x", 
		r,
		g,
		b)
end
_G["floor"] = math.floor

_G["Draw2dText"] = function(x,y,width,height,scale,text,r,g,b,a, outline)
    SetTextFont(4)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
	if outline then 
		SetTextDropShadow(0, 0, 0, 0, 200)
		SetTextDropShadow()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end
_G["hex_to_rgb"] = function(hex)
    hex = hex:gsub("#","")
    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end

_G["tofloat"] = function(int)
	return (int + 0.00001)
end

_G["Notify"] = {}
function Notify:Negado(msg)
	return TriggerEvent("Notify",'negado',msg,6000)
end
function Notify:negado(msg)
	return TriggerEvent("Notify",'negado',msg,6000)
end
function Notify:Sucesso(msg)
	return TriggerEvent("Notify",'negado',msg,6000)
end