


fx_version 'bodacious'
game 'gta5'

author 'Hawkzinho'
version '1.0.0'
lua54 ''

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/**/*'
}

shared_scripts {
    '@vrp/lib/utils.lua',
    'lib/**',
    'config.lua',
}

client_scripts {
	'@vrp/lib/utils.lua',
	'client_main.lua',
	'client/client.lua'
}

server_scripts {
	'@vrp/lib/utils.lua',
	'config.lua',
	'server_main.lua',
	'server/server.lua',
}