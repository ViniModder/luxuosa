cfg = {}

cfg.comandoVerificarPortePolicia = "verporte"
cfg.comandoVerPorte = "porte"
cfg.comandoLiberarPorte = "darporte"
cfg.comandoRemoverPorte = "remporte"

cfg.permissaoVerPorte = { "perm.policia" }
cfg.permissaoLiberarRemoverPorte = { "perm.policia" }

cfg.precoProvaTeorica = 1500000
cfg.precoProvaPratica = 3000000

cfg.armaTestePratico = "WEAPON_COMBATPISTOL"

cfg.itemLaudoProvaTeorica = { gerarLaudo = true, item = "laudo" }
cfg.itemLaudoProvaPratica = { gerarLaudo = true, item = "laudo" }

--link id blips https://wiki.gtanet.work/index.php?title=Blips
cfg.localBlipTesteTeorico = {
    x =  9.07, y =  -1104.71, z = 29.8,
    blipNoMapa = { geralBlip = true, title = "Teste Teórico Porte", colour = 1, id = 313, scale = 0.45 }
}  		

cfg.localBlipTestePratico = {
    x = 18.36, y = -1109.94, z = 29.79,
    blipNoMapa = { geralBlip = true, title = "Teste Prático Porte", colour = 1, id = 313, scale = 0.45 }
}

cfg.configuracaoTestePratico = { 
    quantidadeAcertosParaPassar = 8, -- Máximo 10
    cordenadaDeTiro = { x = 13.611126899719, y = -1097.2608642578, z = 29.834735870361, h = 340.15747070313 },
    cordenadaAlvos = { 
        {x = 19.31, y = -1069.66, z = 29.84}, {x = 22.15, y = -1070.59, z = 29.84},
        {x = 25.04, y = -1071.73, z = 29.84},
        {x = 13.340914726257, y = -1089.0189208984, z = 29.845031738281},
        {x = 16.22508430481, y = -1089.9288330078, z = 29.845054626465},
        {x = 19.011026382446, y = -1091.0222167969, z = 29.845048904419},
        {x = 23.917650222778, y = -1083.1088867188, z = 29.845048904419},
        {x = 21.239490509033, y = -1082.1401367188, z = 29.845048904419},
        {x = 18.379222869873, y = -1081.1363525391, z = 29.845048904419},
        {x = 16.544593811035, y = -1080.4211425781, z = 29.845052719116},
        {x = 14.653549194336, y = -1079.7932128906, z = 29.845052719116},
        {x = 14.295181274414, y = -1089.3125, z = 29.844982147217},
        {x = 17.158149719238, y = -1090.3665771484, z = 29.845052719116},
        {x = 24.80193901062, y = -1071.7053222656, z = 29.845052719116},
        {x = 21.277896881104, y = -1070.3050537109, z = 29.845048904419},
        {x = 22.188034057617, y = -1070.66796875, z = 29.845052719116},
        {x = 23.14471244812, y = -1071.095703125, z = 29.845052719116}
    }
}