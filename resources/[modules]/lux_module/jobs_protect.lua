local IS_SERVER 	= IsDuplicityVersion()
local FusionProtect = module("lib/Protect")

if IS_SERVER then
    _G.bindInterface = Tunnel.bindInterface
    function Tunnel.bindInterface(tunnel_name, tbl)
        if (debug.traceback()):find("/scripts/jobs") then
            print("^1[RevoadaProtect/Jobs]^7  Registrando ^2"..tunnel_name.."^7")
            tbl = setmetatable(tbl, {
                __newindex = function(t,k,v)
                    FusionProtect.CreateEvent(tunnel_name..":"..k, v)
                    rawset(t,k,v)
                end
            })
            return
        else
            return _G.bindInterface(tunnel_name, tbl)
        end
    end
else
    _G.getInterface = Tunnel.getInterface
    function Tunnel.getInterface(tunnel_name)
        if (debug.traceback()):find("/scripts/jobs") then
            return setmetatable({}, {
                __index = function(t, k)
                    return function(...)
                        return FusionProtect[tunnel_name..":"..k](...)
                    end
                end
            })
        else
            return _G.getInterface(tunnel_name)
        end
    end
end