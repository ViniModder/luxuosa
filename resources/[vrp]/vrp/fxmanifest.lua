thn_loaderInstalled "yes"
client_script "thunder_anticheat.lua"




fx_version 'adamant'
game 'gta5'
-- LUXUOSA GROUP
ui_page "web-side/index.html"
server_scripts {
	"lib/utils.lua",
	"@lux_inventory/config/shared.items.lua",
	"base.lua",
	"modules/*"
}
client_scripts {
	"lib/utils.lua",
	"client-side/*"
}
files {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"lib/Tools.lua",
	"web-side/*",
	"loading/*",
}
loadscreen "loading/darkside.html"                            