


fx_version "bodacious"
game "gta5"
ui_page "web/build/index.html"
shared_scripts { 
	"@vrp/lib/utils.lua",
	"lib/*.lua", 
	"config.lua" 
}
client_scripts{
	"@vrp/lib/utils.lua",
	"client.lua"
}
server_scripts{
	"@vrp/lib/utils.lua",
	"server.lua"
}
files {
    "web/build/**/*",
    "web/build/*",
}