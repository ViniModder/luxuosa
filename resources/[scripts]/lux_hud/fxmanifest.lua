
this_is_a_map "yes"

lua54 ''

fx_version "bodacious"
game "gta5"

ui_page "nui/index.html"

client_scripts{
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts{
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
    "nui/**/*",
	"nui/*"
}                                                                         