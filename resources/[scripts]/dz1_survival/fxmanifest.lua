fx_version "bodacious"
game "gta5"
lua54 'yes'

shared_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
}

client_scripts {
	"src/client.lua",
	"src/cutscene.lua",
	'weapons/*.meta',
}

server_scripts { 
	"src/server.lua"
}

ui_page "nui/index.html"

files {
	"nui/*.css",
	"nui/*.js",
	"nui/*.*",
	"nui/index.html"
}

escrow_ignore {
    "config.lua"
}

data_file 'WEAPONINFO_FILE_PATCH' 'weapons/*.meta'  
dependency '/assetpacks'