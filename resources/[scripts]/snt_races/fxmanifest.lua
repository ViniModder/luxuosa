

fx_version "cerulean"
game "gta5"
author "AlbeJr <albe@snt.gg>"
description "Races system & interface for FiveM servers (w/ ranking)"
version "1.0.0"
ui_page "ui/ui.html"
files { "cfg.js", "ui/*", "ui/fonts/*", "ui/img/*", "ui/sounds/*" }
client_scripts { "s/c.lua", "s/t.lua" }
server_scripts { "@vrp/lib/utils.lua", "cfg.lua", "s/s.lua" }
