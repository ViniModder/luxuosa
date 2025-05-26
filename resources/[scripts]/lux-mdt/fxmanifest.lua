



lua54 'yes'
fx_version "bodacious"
game "gta5"
author 'sjr01'
ui_page_preload "yes"
ui_page "web/index.html"
client_scripts {
    "@vrp/lib/utils.lua",
    "client/*"
}
server_scripts {
    "@vrp/lib/utils.lua",
    "server/*",
}
files {
    'web/**/**/*',
    'web/*.html',
}