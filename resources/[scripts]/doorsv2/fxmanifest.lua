
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts {"@vrp/lib/utils.lua", "config.lua"}

client_scripts {
    "doors_client.lua"
}

server_scripts {
    "doors_server.lua"
}