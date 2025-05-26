cfg = {
  debug = true,
  blacklist = 0,
  CommandChamados = "chamarpolicia",
  CommandOpen = 'mdt',
  
  webhook = {
    leaveorg = 'https://discord.com/api/webhooks/1264536176228962324/Sd-PCpoc_VwpU7T-pUqmxwttFgWBNVaDfwyQtpVg36olQgH7uj3rTwLPRgkeusYkf4_x',--mdt okk
    invite = 'https://discord.com/api/webhooks/1264536176228962324/Sd-PCpoc_VwpU7T-pUqmxwttFgWBNVaDfwyQtpVg36olQgH7uj3rTwLPRgkeusYkf4_x',---
    demote = 'https://discord.com/api/webhooks/1264536176228962324/Sd-PCpoc_VwpU7T-pUqmxwttFgWBNVaDfwyQtpVg36olQgH7uj3rTwLPRgkeusYkf4_x',---
    multar = 'https://discord.com/api/webhooks/1298452894881939506/3vLt87iA_DGNrjZ0ycx0wgzLFnGbZfWJB9tN4zapJUj3tQ0KbnVpqaaTXEC-o9GBF-yd',-----okkkkkkkkkk
    prender = 'https://discord.com/api/webhooks/1298457584273063946/dXb_cDZXGxnQUfOm_KgQGHRotvlA4IJxGXeuMvQ5Eq9FUCBfJcrOC7NbJhOSAqMBky3L',-----nao fucionou nao 
  },
  
  BlipChamado = {126,2,0.6},
  CodesBlip = {  --blip/color
      ['QTH'] = {229,57,0.8},
      ['QTI'] = {8,1,0.8},
      ['QRR'] = {229,2,0.8},
      ['QRT'] = {229,2,0.8}
  },
  
  langs = {
    isBlackList = function(source,dia,mes,hora,minutos) return TriggerClientEvent("Notify",source, "negado","Atenção: Você so podera entrar em organização no dia "..dia.."/"..mes.." as "..hora..":"..minutos..".", 5000) end,
      haveBlackList = function(source,dia,mes,hora,minutos) return TriggerClientEvent("Notify",source, "negado","Este jogador está proibido de entrar em qualquer organização até dia "..dia.."/"..mes.." as "..hora..":"..minutos..".", 5000) end,
  },
  
  Groups = {
    ['Policia'] = {
      ['ComandoPMERJ'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "CoronelPMERJ" }, ----- grupos que ele pode convidar ( tem que ter a baixo)
          { "TenenteCoronelPMERJ" },
          { "MajorPMERJ" },
          { "CapitaoPMERJ" },
          { "PrimeiroTenentePMERJ" },
          { "SegundoTenentePMERJ" },
          { "SubTenentePMERJ" },
          { "PrimeiroSargentoPMERJ" },
          { "SegundoSargentoPMERJ" },
          { "TerceiroSargentoPMERJ" },
          { "CaboPMERJ" },
          { "SoldadoPMERJ" },
          { "AlunoPMERJ" }
        },
      },
      ['TenenteCoronelPMERJ'] = {
        Config = {
          isAdmin =false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['MajorPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['CapitaoPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['PrimeiroTenentePMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SegundoTenentePMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SubTenentePMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['PrimeiroSargentoPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SegundoSargentoPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['TerceiroSargentoPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['CaboPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SoldadoPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['AlunoPMERJ'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
    },
    ['Execito'] = {
      ['Coronel'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "Coronel" }, ----- grupos que ele pode convidar ( tem que ter a baixo)
          { "TenenteCoronel" },
          { "Major" },
          { "Capitao" },
          { "PrimeiroTenente" },
          { "SegundoTenente" },
          { "SubTenente" },
          { "PrimeiroSargento" },
          { "SegundoSargento" },
          { "TerceiroSargento" },
          { "Cabo" },
          { "Soldado" },
        },
      },
      ['TenenteCoronel'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Major'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Capitao'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['PrimeiroTenente'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SegundoTenente'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SubTenente'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['PrimeiroSargento'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SegundoSargento'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['TerceiroSargento'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Cabo'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Soldado'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
    },
    ['Federal'] = {
      ['CoronelFederal'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "CoronelFederal" }, ----- grupos que ele pode convidar ( tem que ter a baixo)
          { "MajorFederal" },
          { "CapitaoFederal" },
          { "TenenteFederal" },
          { "SargentoFederal" },
          { "CaboFederal" },
          { "SoldadoFederal" },
          { "RecrutaFederal" },
        },
      },
      ['MajorFederal'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['CapitaoFederal'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['TenenteFederal'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SargentoFederal'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SoldadoFederal'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['RecrutaFederal'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
    },
    ['Civil'] = {
      ['DelegadoGeral'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "DelegadoGeral" }, ----- grupos que ele pode convidar ( tem que ter a baixo)
          { "ComandanteCore" },
          { "SubComandanteCore" },
          { "Delegado" },
          { "Core" },
          { "Perito" },
          { "Escrivao" },
          { "Investigador" },
          { "Agente" },
          { "Recruta" },
        },
      },
      ['ComandanteCore'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SubComandanteCore'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Core'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Perito'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Escrivao'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Investigador'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Agente'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['Recruta'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
    },

    ['Bope'] = {
      ['CoronelBope'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "CoronelBope" }, ----- grupos que ele pode convidar ( tem que ter a baixo)
          { "TenenteCoronelBope" },
          { "MajorBope" },
          { "CapitaoBope" },
          { "PrimeiroTenenteBope" },
          { "SegundoTenenteBope" },
          { "AspiranteBope" },
          { "PrimeiroSargentoBope" },
          { "SegundoSargentoBope" },
          { "TerceiroSargentoBope" },
          { "CaboBope" },
        },
      },
      ['TenenteCoronelBope'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "TenenteCoronelBope" },
          { "MajorBope" },
          { "CapitaoBope" },
          { "PrimeiroTenenteBope" },
          { "SegundoTenenteBope" },
          { "AspiranteBope" },
          { "PrimeiroSargentoBope" },
          { "SegundoSargentoBope" },
          { "TerceiroSargentoBope" },
          { "CaboBope" },
        },
      },
      ['MajorBope'] = {
        Config = {
          isAdmin = true --- se é lider ou nao
        },
        Recrute = {
          { "MajorBope" },
          { "CapitaoBope" },
          { "PrimeiroTenenteBope" },
          { "SegundoTenenteBope" },
          { "AspiranteBope" },
          { "PrimeiroSargentoBope" },
          { "SegundoSargentoBope" },
          { "TerceiroSargentoBope" },
          { "CaboBope" },
        },
      },
      ['CapitaoBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['PrimeiroTenenteBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SegundoTenenteBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['AspiranteBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['PrimeiroSargentoBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['SegundoSargentoBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['TerceiroSargentoBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
      ['CaboBope'] = {
        Config = {
          isAdmin = false --- se é lider ou nao
        },
        Recrute = {},
      },
    }
  }
}