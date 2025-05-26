

fx_version "bodacious"
game "gta5"
lua54 ''
ui_page "scripts/index.html"
client_scripts {
	"@vrp/lib/utils.lua",
	"client_main.lua",
	"scripts/identity/client_identity.lua",
	"scripts/notify/client_notify.lua",
	"scripts/progressbar/client_progressbar.lua",
	"scripts/shortcut/client_shortcut.lua",
	"scripts/elevator/client_elevator.lua",
    "scripts/elevator/config_elevator.lua",
	"scripts/radio/client_radio.lua",
}
server_scripts {
	"@vrp/lib/utils.lua",
	"scripts/radio/server_radio.lua",
	"scripts/identity/server_identity.lua",
	"scripts/elevator/server_elevator.lua",
	"scripts/elevator/config_elevator.lua"
}
files {
	"scripts/index.html",
	"scripts/main.js",
	"scripts/scripts.js",
	"scripts/global.css",
	"scripts/**/nui/**/*",
	"scripts/**/nui/*",
    "scripts/fonts/*",
	"scripts/nuiSounds/*",
}