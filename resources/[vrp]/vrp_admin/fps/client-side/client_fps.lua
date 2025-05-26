
local user_id = nil




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- /FPS ON | OFF
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


local kvpEntry = GetResourceKvpString("fpscommand")
local TIME_INDEX = 0
local FPS_COMMAND = ((kvpEntry ~= nil and kvpEntry == "true") and true or false)

CreateThread(function()
	if FPS_COMMAND then
		SetTimecycleModifier("cinema")
		TriggerEvent("Notify", "sucesso", "Modo FPS ativado.")
		TIME_INDEX = GetTimecycleModifierIndex()
		TimecycleThread()
	end
end)

function TimecycleThread()
	CreateThread(function()
		while FPS_COMMAND do
			if TIME_INDEX ~= GetTimecycleModifierIndex() then
				SetTimecycleModifier("cinema")
				TIME_INDEX = GetTimecycleModifierIndex()
			end
			Wait(1000)
		end
	end)
end
RegisterCommand("fps",function(source, args)
	if args[1] == "on" then
		FPS_COMMAND = true
		SetTimecycleModifier("cinema")
		TIME_INDEX = GetTimecycleModifierIndex()
		TimecycleThread()
		TriggerEvent("Notify", "sucesso", "Modo FPS ativado.")
	elseif args[1] == "off" then
		FPS_COMMAND = false
		SetTimecycleModifier("default")
		TriggerEvent("Notify", "negado", "Modo FPS desativado.")
	end
	SetResourceKvp("fpscommand", tostring(FPS_COMMAND))
end)

