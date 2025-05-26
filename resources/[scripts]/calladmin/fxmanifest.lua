


fx_version "bodacious"
game "gta5"

author 'DeadShot#0101'

lua54 'yes'

files {
	'web/build/index.html',
	'web/build/*',
	'web/build/**/*',
	'web/build/assets/*.svg',
	'web/build/assets/*.webp',
	'web/build/assets/*.js',
	'web/build/assets/*.css',
}

ui_page 'web/build/index.html'

client_scripts {
	"@vrp/lib/Utils.lua",
	'client/*.lua'
}

server_scripts {
	"@vrp/lib/Utils.lua",
	'server/*.lua'
}
              