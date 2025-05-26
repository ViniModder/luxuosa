Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Tools = module("vrp","lib/Tools")
Resource = GetCurrentResourceName()
SERVER = IsDuplicityVersion()

if SERVER then
    vRP = Proxy.getInterface("vRP")
    vRPclient = Tunnel.getInterface("vRP")

    CreateTunnel = {}
    Tunnel.bindInterface(Resource, CreateTunnel)

    Execute = Tunnel.getInterface(Resource)
else
    vRP = Proxy.getInterface("vRP")

    CreateTunnel = {}
    Tunnel.bindInterface(Resource, CreateTunnel)

    Execute = Tunnel.getInterface(Resource)
end