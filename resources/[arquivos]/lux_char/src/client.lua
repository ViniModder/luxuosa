local Tunnel 	= module("vrp", "lib/Tunnel")
local Proxy  	= module("vrp", "lib/Proxy")
vRP          	= Proxy.getInterface("vRP")
vRPs          	= Tunnel.getInterface("vRP")
Client         	= {}
Remote         	= Tunnel.getInterface(GetCurrentResourceName())
Tunnel.bindInterface(GetCurrentResourceName(), Client)

local _SetEntityVisible = SetEntityVisible
SetEntityVisible = function(...)
	local args = {...}
	return _SetEntityVisible(...)
end

currentCharacterMode = {fathersID =0,mothersID =0,skinColor =0,shapeMix  =0.5,eyesColor =0,eyebrowsHeight  = 0,eyebrowsWidth   = 0,noseWidth =0,noseHeight = 0,noseLength = 0,noseBridge = 0,noseTip   =0,noseShift =0,cheekboneHeight = 0,cheekboneWidth  = 0,cheeksWidth     = 0,lips =0,jawWidth  =0,jawHeight =0,chinLength = 0,chinPosition    = 0,chinWidth =0,chinShape =0,neckWidth =0,hairModel =9,firstHairColor  = 0,secondHairColor = 0,eyebrowsModel   = 0,eyebrowsColor   = 0,beardModel = -1,beardColor = 0,chestsModel = -1,chestsColor = 0,blushModel = -1,blushColor = 0,lipstickModel   = -1,lipstickColor   = 0,blemishesModel  = -1,ageingModel     = -1,complexionModel = -1,sundamageModel  = -1,frecklesModel   = -1,makeupModel     = -1}

function setDefaultTable()
	currentCharacterMode = {fathersID =0,mothersID =0,skinColor =0,shapeMix  =0.5,eyesColor =0,eyebrowsHeight  = 0,eyebrowsWidth   = 0,noseWidth =0,noseHeight = 0,noseLength = 0,noseBridge = 0,noseTip   =0,noseShift =0,cheekboneHeight = 0,cheekboneWidth  = 0,cheeksWidth     = 0,lips =0,jawWidth  =0,jawHeight =0,chinLength = 0,chinPosition    = 0,chinWidth =0,chinShape =0,neckWidth =0,hairModel =9,firstHairColor  = 0,secondHairColor = 0,eyebrowsModel   = 0,eyebrowsColor   = 0,beardModel = -1,beardColor = 0,chestsModel = -1,chestsColor = 0,blushModel = -1,blushColor = 0,lipstickModel   = -1,lipstickColor   = 0,blemishesModel  = -1,ageingModel     = -1,complexionModel = -1,sundamageModel  = -1,frecklesModel   = -1,makeupModel     = -1}
end

