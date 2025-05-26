Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Tools = module("vrp","lib/Tools")
Resource = GetCurrentResourceName()
SERVER = IsDuplicityVersion()

if SERVER then
    vRP = Proxy.getInterface("vRP")
    vRPclient = Tunnel.getInterface("vRP")

    RegisterTunnel = {}
    Tunnel.bindInterface(Resource, RegisterTunnel)

    vTunnel = Tunnel.getInterface(Resource)
else
    vRP = Proxy.getInterface("vRP")

    RegisterTunnel = {}
    Tunnel.bindInterface(Resource, RegisterTunnel)

    vTunnel = Tunnel.getInterface(Resource)
end