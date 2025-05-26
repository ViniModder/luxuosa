config = {
  salvarAttachsDb = false, -- SALVAR OS ATTACHS APLICADOS NO BANCO DE DADOS
  perderAttachsAoMorrer = false,
}

blips = {
  --{ x = 461.41, y = -983.05, z = 30.69, perms = { "admin.perm" }, pagarPelaModificacao = false, usarItens = false }
}

comandos = {
  { comando = "ati", perms = { "admin.permissao", "perm.vips" } },
  -- { comando = "ati", perms = { }, pagarPelaModificacao = true, usarItens = true },
  -- { comando = "ats", perms = { }, pagarPelaModificacao = true, usarItens = false }
}

priceAttachs = {
  mira = 0,
  cano = 0,
  grip = 0,
  lanterna = 0,
  carregador = 0,
  municao = 0,
  textura = 0,
  textura_slide = 0,
  cor = 0,
}

attachsDefault = {
  ["mira"] = { text = "MIRA", price = 1000, imgCategoria = "http://189.127.165.210/attaches/mira.png" },-----------------------ok
  ["cano"] = { text = "CANO", price = 2000, imgCategoria = "http://189.127.165.210/attaches/supressor.png" },------------------ok
  ["grip"] = { text = "GRIP", price = 3000, imgCategoria = "http://189.127.165.210/attaches/gripvertical.png" },------------------ok
  ["lanterna"] = { text = "LANTERNA", price = 4000, imgCategoria = "http://189.127.165.210/attaches/lanterna.png" },-----------------ok
  ["carregador"] = { text = "CARREGADOR", price = 5000, imgCategoria = "http://189.127.165.210/attaches/mag.png" },
  ["municao"] = { text = "MUNIÇÃO", price = 6000, imgCategoria = "http://189.127.165.210/attaches/tracante.png" },---
  ["cor"] = { text = "COR DA ARMA", price = 1000, imgCategoria = "http://189.127.165.210/attaches/lata.png" },---------------------------ok
  ["textura"] = { text = "TEXTURA DA ARMA", price = 3500, imgCategoria = "http://189.127.165.210/attaches/lata.png" },----------------------ok
  ["textura_slide"] = { text = "TEXTURA DO SLIDE", price = 2000, imgCategoria = "http://189.127.165.210/attaches/.png" },
  ["stcok"] = { text = "STCOK", price = 2000, imgCategoria = "http://189.127.165.210/attaches/.png" },

}

