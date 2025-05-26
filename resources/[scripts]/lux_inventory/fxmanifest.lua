



fx_version   'bodacious'
-- use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'
--[[ Resource Information ]]--
name         'Inventory'
author       'foxzin'
--[[ Manifest ]]--
dependencies {
    '/server:5181',
    '/onesync',
    'vrp',
}
shared_scripts {
    '@vrp/lib/utils.lua',
    'config/shared.*.lua'
}
server_scripts {
	"@oxmysql/lib/MySQL.lua",
    "server/main.lua",
}
client_scripts {
    "client/main.lua",
    "client/utils/**",
    "client/modules/**"
}
ui_page 'web-side/index.html'
files {
    'web-side/**/**/**'
}
-- CREDITOS klebinho INVENTARIO ARRUMADO E 100%