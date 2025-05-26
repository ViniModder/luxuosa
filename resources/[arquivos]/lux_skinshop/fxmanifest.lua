

fx_version "bodacious"
game "gta5"

ui_page "nui/build/index.html"

client_scripts {
    "@vrp/lib/utils.lua",
    "client-side/*"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server-side/*"
}

files { 
    "nui/build/*",
    "nui/build/**/*",
}  