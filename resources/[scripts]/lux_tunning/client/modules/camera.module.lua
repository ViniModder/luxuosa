_G["CameraControl"] = {
    Instance = nil,
    vehicle = nil,
    freeCam = false,
}
local tunpack = table.unpack


function CameraControl:Init(vehicle)
    self.Instance = self
    self.vehicle = vehicle
    self.gameplayCam = GetRenderingCam()
    self.cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true,2)
    return CameraControl
end
function CameraControl:setState(vehicle)
    self.freeCam = not self.freeCam
    if self.freeCam then 
        SetNuiFocus(false,false)
        CreateThread(function() 
			RenderScriptCams( 0, 1, 0, 0, 0)
			SetCamActive(self.gameplayCam, true)
			SetCamActive(self.cam, false)
			EnableGameplayCam(true)
            while self.freeCam do 
                if IsControlJustPressed(0,74) then
                    self.freeCam = false
                    SetNuiFocus(true,true)
                    SendNUIMessage({ action = "cameraState" })
                end
                Wait(1)
            end
			SetCamActive(self.cam, true)
			SetCamActive(self.gameplayCam, false)
			SetCamCoord(self.cam,GetGameplayCamCoords())
			SetCamRot(self.cam, GetGameplayCamRot(2), 2)
			SetCamRot(self.cam, GetGameplayCamRot(0), 0)
			SetCamRot(self.cam, GetGameplayCamRot(1), 1)
			SetCamFov(self.cam, GetGameplayCamFov())
			RenderScriptCams( 1, 1, 50, 0, 0)
        end)
    end
    return true
end
function CameraControl:Destroy()
    if IsCamActive(self.cam) then
		SetCamActive(self.cam, false)
	end
    SetCamCoord(self.cam,GetGameplayCamCoords())
	SetCamRot(self.cam, GetGameplayCamRot(2), 2)
	RenderScriptCams( 0, 1, 0, 0, 0)
	SetCamActive(self.gameplayCam, true)
	EnableGameplayCam(true)
    self.gameplayCam = nil 
    self.cam = nil
end

function CameraControl:PointCamAtBone(bone,ox,oy,oz)
	SetCamActive(self.cam, true)
	local veh = self.vehicle
	local b = GetEntityBoneIndexByName(veh, bone)
	if b and b > -1 then
		local bx,by,bz = table.unpack(GetWorldPositionOfEntityBone(veh, b))
		local ox2,oy2,oz2 = table.unpack(GetOffsetFromEntityGivenWorldCoords(veh, bx, by, bz))
		local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(veh, ox2 + tofloat(ox), oy2 + tofloat(oy), oz2 +tofloat(oz)))
		SetCamCoord(self.cam, x, y, z)
		PointCamAtCoord(self.cam,GetOffsetFromEntityInWorldCoords(veh, 0, oy2, oz2))
		RenderScriptCams( 1, 1, 1000, 0, 0)
	end
end

function CameraControl:MoveVehCam(pos,x,y,z)
	SetCamActive(self.cam, true)
	local veh = self.vehicle
	local d = GetModelDimensions(GetEntityModel(veh))
	local length,width,height = d.y*-2, d.x*-2, d.z*-2
	local ox,oy,oz
	if pos == 'front' then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, tofloat(x), (length/2)+ tofloat(y), tofloat(z)))
	elseif pos == "front-top" then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, tofloat(x), (length/2) + tofloat(y),(height) + tofloat(z)))
	elseif pos == "back" then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, tofloat(x), -(length/2) + tofloat(y),tofloat(z)))
	elseif pos == "back-top" then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, tofloat(x), -(length/2) + tofloat(y),(height/2) + tofloat(z)))
	elseif pos == "left" then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, -(width/2) + tofloat(x), tofloat(y), tofloat(z)))
	elseif pos == "right" then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, (width/2) + tofloat(x), tofloat(y), tofloat(z)))
	elseif pos == "middle" then
		ox,oy,oz= tunpack(GetOffsetFromEntityInWorldCoords(veh, tofloat(x), tofloat(y), (height/2) + tofloat(z)))
	end
	SetCamCoord(self.cam, ox, oy, oz)
	PointCamAtCoord(self.cam,GetOffsetFromEntityInWorldCoords(veh, 0, 0, tofloat(0)))
	RenderScriptCams( 1, 1, 1000, 0, 0)
end


function CameraControl:Set(c)
	if c == "Parachoque Dianteiro" or c == "Grelha" or c == "Arch Cover" then
		self:MoveVehCam('front',-0.6,1.5,0.4)
	elseif c == "Cores" or c == "cor-secundaria" or c == "decal" then
		self:MoveVehCam('middle',-2.6,2.5,1.4)
	elseif  c == "Parachoque Traseiro"  or c == "Escapamento" then
		self:MoveVehCam('back',-0.5,-1.5,0.2)
	elseif c == "Capô" then
		self:MoveVehCam('front-top',-0.5,1.3,1.0)
	elseif c == "Teto" then
		self:MoveVehCam('middle',-2.2,2,1.5)
	elseif c == "vidro" then
		self:MoveVehCam('middle',-2.0,2,0.5)
	elseif c == "Farol" or c == "Xenon" then
        SetVehicleLights(self.vehicle, 2)
		self:MoveVehCam('front',-0.6,1.3,0.6)
	elseif c == "Placa" then
		self:MoveVehCam('back',0,-1,0.2)
	elseif c == "Para-lama" then
		self:MoveVehCam('left',-1.8,-1.3,0.7)
	elseif c == "Saias" then
		self:MoveVehCam('left',-1.8,-1.3,0.7)
	elseif c == "Aerofólio" then
		self:MoveVehCam('back',0.5,-1.6,1.3)
	elseif c == "Rodas Traseira" then
		self:PointCamAtBone("wheel_lr",-1.4,0,0.3)
	elseif c == "Rodas Dianteira" or c == "Tipo de Roda" or  c == "wheel-colors" or c == "sport" or c == "muscle" or c == "lowrider"  or c == "highend" or c == "suv" or c == "offroad" or c == "tuner" then
		self:PointCamAtBone("wheel_lf",-1.4,0,0.3)
	elseif c == "Neon" or c == "neon-colors" or c == "Suspensão" then
		if not IsThisModelABike(GetEntityModel(self.vehicle)) then
			self:PointCamAtBone("neon_l",-2.0,2.0,0.4)
		end
	elseif c == "Janelas" or c == "Ornaments" or c == "Painel" or c == "Dial" or c == "Bancos" or c =="Roll cage" then
		self:MoveVehCam('back-top',0.0,4.0,0.7)
	elseif c == "doors" then
        -- if GetVehicleDoorAngleRatio(self.vehicle,1) == 0 then 
        --     SetVehicleDoorOpen(self.vehicle, 0, 0, 0)
        --     SetVehicleDoorOpen(self.vehicle, 1, 0, 0)
        -- else
        --     SetVehicleDoorShut(self.vehicle, 0, 0)
		-- 	SetVehicleDoorShut(self.vehicle, 1, 0)
		-- 	SetVehicleDoorShut(self.vehicle, 4, 0)
		-- 	SetVehicleDoorShut(self.vehicle, 5, 0)
        -- end
	end
end