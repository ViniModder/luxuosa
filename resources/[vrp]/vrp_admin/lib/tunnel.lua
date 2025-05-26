Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Resource = GetCurrentResourceName()

if IsDuplicityVersion() then
    vRP = Proxy.getInterface("vRP")
    vRPclient = Tunnel.getInterface("vRP")

    RegisterTunnel = {}
    Tunnel.bindInterface(Resource, RegisterTunnel)
    Tools = module("vrp","lib/Tools")
    vTunnel = Tunnel.getInterface(Resource)
    arena = Tunnel.getInterface("mirtin_arena")
    garage = Proxy.getInterface("lux_garages")
else
    vRP = Proxy.getInterface("vRP")

    RegisterTunnel = {}
    Tunnel.bindInterface(Resource, RegisterTunnel)

    vTunnel = Tunnel.getInterface(Resource)
end