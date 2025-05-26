
fx_version "adamant"
game "gta5"

server_scripts {
   "@vrp/lib/utils.lua",
   "src/server/main.lua"
}

client_scripts {
   "@vrp/lib/utils.lua",
   "src/client/main.lua"
}

files {
   "src/public/**",
   "config/*.lua"
}

ui_page "src/public/index.html"

client_script "@rebla_anticheat/src/shared/modules/lib.lua" -- para remover esta lib de todos os scripts utilize "reblaac uninstall" no console do servidor