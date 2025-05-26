



fx_version "adamant"
game "gta5"
ui_page_preload 'yes'
ui_page "nui/index.html"
files {
	"nui/**",
}
shared_scripts { 
	"@vrp/lib/utils.lua",
	"lib/*.lua", 
	"config.lua" 
}
client_scripts {
	"@vrp/lib/utils.lua",
	"client/*",
} 
server_script {
	"@vrp/lib/utils.lua",
	"server/*",
}