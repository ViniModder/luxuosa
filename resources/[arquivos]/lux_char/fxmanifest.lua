


fx_version "bodacious"
game "gta5"

ui_page "nui/build/index.html"

shared_scripts {"@vrp/lib/utils.lua","config/*.lua"}

client_scripts {
	"src/client.lua",
	"src/modules/camera.lua",
	"src/modules/creation.lua",
	"src/modules/spawn.lua",
	"src/modules/selector.lua",
	"src/modules/antistopper.lua",
}

server_scripts {
	"src/server.lua",
}

files {
	"nui/build/*",
	"nui/build/**/*",
}      