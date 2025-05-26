local Cameras = {}
spawnCam = nil
function CreateSelectorCam()
	Cameras[#Cameras+1] = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 4892.087, -4916.548, 4.367, -15.0, 0.0, 0.0, 40.0, false, 0)  --x = 2160.0805664063, y = 2921.0305175781, z = -84.800132751465
	SetCamActive(Cameras[#Cameras], true)
	RenderScriptCams(true, true, 1000, true, true)
    return Cameras[#Cameras]
end

function CreateSpawnCam()
    Cameras[#Cameras+1] = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Config.SpawnPoints[1].coords + vec3(0.0,0.0,42.0), 110.0, 180.0, 180.06, 75.0, false, 0)
	SetCamActive(Cameras[#Cameras], true)
    spawnCam = Cameras[#Cameras]
	RenderScriptCams(true, false, 0, false, false)
    return Cameras[#Cameras]
end
function ChangeSpawnCam(camera,coords)
    SetCamCoord(camera,coords)
end

function InterpolateCam(cam1,cam2)
    SetCamActiveWithInterp(cam2, cam1, 3000, true, true)
end

function DeleteCameras(cameraId)
    if cameraId then 
        SetCamActive(cameraId, false)
        StopCamPointing(cameraId)
        RenderScriptCams(0, 0, 0, 0, 0, 0)
        return 
    end
    for k,v in ipairs(Cameras) do 
        SetCamActive(v, false)
        StopCamPointing(v)
        RenderScriptCams(0, 0, 0, 0, 0, 0)
    end
    Cameras = {}
end