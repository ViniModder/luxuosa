



--[[ @likizao ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'
--[[ Resource Information ]]--
name         'Jobs FusionGroup'
author       'likizao'
--[[ Manifest ]]--
dependencies {
    '/server:5181',
    '/onesync',
    'vrp',
}
shared_scripts {
    '@vrp/lib/utils.lua',
    'lib/**',
    'shared/**'
}
server_scripts {
    -- "server/modules/**",
    "server/main.lua",
    "scripts/jobs/minerman/server.lua",
	"scripts/jobs/pescador/server.lua",
}
client_scripts {
    -- "client/modules/**",
    "client/main.lua",
    "scripts/jobs/minerman/client.lua",
	"scripts/jobs/pescador/client.lua",
}
files {
    -- 'stream/**'
}
