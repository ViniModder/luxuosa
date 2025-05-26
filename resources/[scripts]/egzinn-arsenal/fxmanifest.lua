

fx_version 'bodacious'
game 'gta5'
ui_page 'client/nui/ui.html'
ui_page_preload 'yes'
client_scripts {
	'@vrp/lib/utils.lua',
	'client/client.lua'
}
server_scripts {
	'@vrp/lib/utils.lua',
	'server/server.lua'
}
files {
	"client/nui/images/*.png",
	'client/nui/ui.html',
    'client/nui/ui.css'
}