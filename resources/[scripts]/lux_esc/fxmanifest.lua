

fx_version "bodacious"
game "gta5"

ui_page "ui/build/index.html"

shared_script {
  "@vrp/lib/utils.lua",
  "lib/tunnel.lua",
  "config.lua"
}

client_scripts {
  "@vrp/lib/utils.lua",
  "client.lua"
}

server_scripts {
  "@vrp/lib/utils.lua",
  "server.lua"
}

files {
  "ui/build/*",
  "ui/build/**/*",
  "ui/build/**/**/*"
}
