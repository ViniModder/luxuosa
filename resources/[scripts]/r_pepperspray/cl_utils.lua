/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/firefighter-scba-system
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Compatibility init ]]

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface(GetCurrentResourceName())

if Config.ESX then
    ESX = nil

    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif Config.QB then
    QBdata = {}

    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
        QBdata = exports['qb-core']:GetCoreObject().Functions.GetPlayerData()
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
        QBdata.job = JobInfo
    end)
elseif Config.AcePermission.enabled then
    TriggerServerEvent('ryt:acePermission', Config.AcePermission.permission)
end

RegisterNetEvent('ryt:returnAcePermission')
AddEventHandler('ryt:returnAcePermission', function()
    allowAce = true
end)

-- [[ Functions ]]

-- Compare the player's job with the one in the script configuration (only if ESX or QB is enabled)
function verifyJobPlayer(pepperSpray, type)
    if vSERVER.checkPermission() then
        return true
    end
    return false
end

function Hint(message)
    AddTextEntry('r_pepperspray', message)
    BeginTextCommandDisplayHelp('r_pepperspray')
    EndTextCommandDisplayHelp(0, 0, 0, -1)
end

-- [[ Command ]]

-- Command to take a pepper spray
for command,_ in pairs(Config.PepperSpray) do
    RegisterCommand(command, function(_, Args)
        if verifyJobPlayer(command, true) then
            if GetSelectedPedWeapon(GetPlayerPed(-1)) == Config.PepperSpray[command].weapon then
                RemoveWeaponFromPed(GetPlayerPed(-1), Config.PepperSpray[command].weapon)
            else
                GiveWeaponToPed(GetPlayerPed(-1), Config.PepperSpray[command].weapon, 0, false, false)
                SetCurrentPedWeapon(GetPlayerPed(-1), Config.PepperSpray[command].weapon, true)
            end
        end
    end, false)
end

-- Command to take a decontamination spray
RegisterCommand(Config.Decontamination.command, function(_, Args)
    if verifyJobPlayer(command, false) then
        if GetSelectedPedWeapon(GetPlayerPed(-1)) == Config.Decontamination.weapon then
            RemoveWeaponFromPed(GetPlayerPed(-1), Config.Decontamination.weapon)
        else
            GiveWeaponToPed(GetPlayerPed(-1), Config.Decontamination.weapon, 0, false, false)
            SetCurrentPedWeapon(GetPlayerPed(-1), Config.Decontamination.weapon, true)
        end
    end
end, false)