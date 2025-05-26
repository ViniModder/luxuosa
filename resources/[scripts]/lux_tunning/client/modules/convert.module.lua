
function hasNeonKit(veh)
	for i = 0, 3 do 
		if not IsVehicleNeonLightEnabled(veh,i) then 
			return false 
		end 
	end 
	return true
end

_G['getVehicleMods_retro'] = function(veh)
	local myveh = {}
	myveh.vehicle = veh
	myveh.model = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
	myveh.color =  table.pack(GetVehicleColours(veh))
	myveh.customPcolor = table.pack(GetVehicleCustomPrimaryColour(veh))
	myveh.customScolor = table.pack(GetVehicleCustomSecondaryColour(veh))
	myveh.extracolor = table.pack(GetVehicleExtraColours(veh))
	myveh.neon = hasNeonKit(veh)
	myveh.neoncolor     = table.pack(GetVehicleNeonLightsColour(veh))
	myveh.xenoncolor    = GetVehicleHeadlightsColour(veh)
	myveh.smokecolor    = table.pack(GetVehicleTyreSmokeColor(veh))
	myveh.plateindex    = GetVehicleNumberPlateTextIndex(veh)
	myveh.mods = {}
	for i = 0, 48 do
		myveh.mods[i] = {mod = nil}
	end
	for i,t in pairs(myveh.mods) do 
		if i == 22 or i == 18 then
			if IsToggleModOn(veh,i) then
				t.mod = 1
			else
				t.mod = 0
			end
		elseif i == 23 or i == 24 then
			t.mod = GetVehicleMod(veh,i)
			t.variation = GetVehicleModVariation(veh, i)
		else
			t.mod = GetVehicleMod(veh,i)
		end
	end
	if GetVehicleWindowTint(veh) == -1 or GetVehicleWindowTint(veh) == 0 then
		myveh.windowtint = false
	else
		myveh.windowtint = GetVehicleWindowTint(veh)
	end
	if myveh.xenoncolor > 12 or myveh.xenoncolor < -1 then
		myveh.xenoncolor = -1
	end
	myveh.wheeltype = GetVehicleWheelType(veh)
	myveh.bulletProofTyres = GetVehicleTyresCanBurst(veh)
	myveh.damage = (1000 - GetVehicleBodyHealth(vehicle))/100
	return myveh
end




function smokeColor(veh,color)
	local r,g,b = parseInt(color[1]),parseInt(color[2]),parseInt(color[3])
	ToggleVehicleMod(veh,20,true)
	SetVehicleTyreSmokeColor(veh,r,g,b)
end

_G['setVehicleMods_retro'] = function (veh,myveh)
	SetVehicleModKit(veh,0)
	
	if not myveh or not myveh.customPcolor then
		return
	end

	local bug = false
	local primary = myveh.color[1]
	local secondary = myveh.color[2]
	local cprimary = myveh.customPcolor

	if cprimary['1'] or cprimary.r then
		bug = true
	end
	local csecondary = myveh.customScolor
	local perolado = myveh.extracolor[1]
	local wheelcolor = myveh.extracolor[2]
	local neoncolor = myveh.neoncolor
	local smokecolor = myveh.smokecolor
	ClearVehicleCustomPrimaryColour(veh)
	ClearVehicleCustomSecondaryColour(veh)
	SetVehicleWheelType(veh,myveh.wheeltype)
	SetVehicleColours(veh,primary,secondary)
	if bug then
		SetVehicleCustomPrimaryColour(veh,cprimary['1'],cprimary['2'],cprimary['3'])
		SetVehicleCustomSecondaryColour(veh,csecondary['1'],csecondary['2'],csecondary['3'])

		if cprimary.r then
			SetVehicleCustomPrimaryColour(veh,cprimary.r,cprimary.g,cprimary.b)
			SetVehicleCustomSecondaryColour(veh,csecondary.r,csecondary.g,csecondary.b)
		end
	else
		SetVehicleCustomPrimaryColour(veh,cprimary[1],cprimary[2],cprimary[3])
		SetVehicleCustomSecondaryColour(veh,csecondary[1],csecondary[2],csecondary[3])
	end
	SetVehicleExtraColours(veh,perolado,wheelcolor)
	SetVehicleNeonLightsColour(veh,neoncolor[1],neoncolor[2],neoncolor[3])
	SetVehicleXenonLightsColour(veh,myveh.xenoncolor)
	SetVehicleNumberPlateTextIndex(veh,myveh.plateindex)
	SetVehicleWindowTint(veh,myveh.windowtint)
	for i,t in pairs(myveh.mods) do 
		if tonumber(i) == 22 or tonumber(i) == 18 then
			if t.mod > 0 then
				ToggleVehicleMod(veh,tonumber(i),true)
			else
				ToggleVehicleMod(veh,tonumber(i),false)
			end
		elseif tonumber(i) == 20 then
			smokeColor(veh,smokecolor)
		elseif tonumber(i) == 23 or tonumber(i) == 24 then
			SetVehicleMod(veh,tonumber(i),tonumber(t.mod),tonumber(t.variation))
		else
			SetVehicleMod(veh,tonumber(i),tonumber(t.mod))
		end
	end
	SetVehicleTyresCanBurst(veh,myveh.bulletProofTyres)
	if myveh.neon then
		for i = 0, 3 do
			SetVehicleNeonLightEnabled(veh,i,true)
		end
	else
		for i = 0, 3 do
			SetVehicleNeonLightEnabled(veh,i,false)
		end
	end
	if myveh.damage > 0 then
		SetVehicleBodyHealth(veh,myveh.damage)
	end

end

RegisterNetEvent("tunning:applyTunning") 
AddEventHandler("tunning:applyTunning",function(netId, custom)
	if DoesEntityExist(netId) then
		setVehicleMods_retro(netId, custom)
	end
end) 