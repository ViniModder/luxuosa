




fx_version 'adamant'
game 'gta5'

shared_scripts {
    '@vrp/lib/utils.lua',
    'lib/**',
    'config.lua',
}

server_scripts {
    'server/*.lua',
}  

client_scripts {
    'client/*.lua',
}   

ui_page 'web/build/index.html'

files {
	'web/build/**/*',
    'web/build/*',
}        