Config = Config or {}

Config.firstSpawn = vec3(-402.63,1205.71,325.96) -- Alterar no modules/creation.lua
Config.GiveMoney = "50000" -- VALOR AQUI ESTÁ R$ 100.000,00

Config.Servers = {
    {
        image = "http://189.127.165.210/spawna/logo.png",
        discordUrl = "https://discord.gg/cMedUkA3h3"
    },
}

Config.Bonus = {
    {
        car = "double",---moto 
        name = "double"
    },
   
}

Config.SpawnPoints = {
   
    {
        name = "PIER",-----SPAW--ok
        id = 'pier',
        coords = vec3(-1599.58,-1043.49,13.01),
        image = "http://189.127.165.210/spawna/pier.png",
    },    
    {
        name = "praca",-----SPAW--ok
        id = 'praca',
        coords = vec3(198.14,-969.79,29.54),
        image = "http://189.127.165.210/spawna/prac.png",
    },  
    {
        name = "CRISTO",-----SPAW--PALETO Ok
        id = 'cristo',
        coords = vec3(-472.23,983.28,413.02),
        image = "http://189.127.165.210/spawna/crist.png",
    }, 
    
    {
        name = "hospital",-----SPAW--PALETO ok
        id = 'hospital',
        coords = vec3(-503.98,237.92,83.02),
        image = "http://189.127.165.210/spawna/hospital.png",
    },      
}

Config.Clothes = {
    Male = {
        [1] = {-1,0,2},
        [2] = {34,0,0},
        [3] = {34,0,2},
        [4] = {98,0,2},
        [5] = {0,0,2},
        [6] = {195,3,2},
        [7] = {0,0,2},
        [8] = {15,0,2},
        [9] = {-1,0,2},
        [10] = {-1,0,2},
        [11] = {324,0,2},
        [0] = {33,0,0},
        ["p2"] = {-1,0},
        ["p6"] = {-1,0},
        ["p7"] = {-1,0},
        ["p0"] = {-1,0},
        ["p1"] = {-1,0},
        
    }, 




    Female = {
        [1] = {-1,0,2},
        [2] = {4,0,0},
        [3] = {0,0,0},
        [4] = {78,0,2},
        [5] = {0,0,0},
        [6] = {202,6,2},
        [7] = {0,0,0},
        [8] = {0,0,0},
        [9] = {0,0,0},
        [10] = {0,0,0},
        [11] = {430,0,2},
        [0] = {0,0,0},
        ["p2"] = {-1,0},
        ["p6"] = {-1,0},
        ["p7"] = {0,0},
        ["p0"] = {-1,0},
        ["p1"] = {-1,0},
        
        
    }
}