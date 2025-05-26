Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")
Tools = module("vrp","lib/Tools")
Resource = GetCurrentResourceName()
SERVER = IsDuplicityVersion()

if SERVER then
    vRP = Proxy.getInterface("vRP")
    vRPclient = Tunnel.getInterface("vRP")

    src = {}
    Tunnel.bindInterface(Resource, src)

    vCLIENT = Tunnel.getInterface(Resource)
else
    vRP = Proxy.getInterface("vRP")

    src = {}
    Tunnel.bindInterface(Resource, src)

    vSERVER = Tunnel.getInterface(Resource)
end