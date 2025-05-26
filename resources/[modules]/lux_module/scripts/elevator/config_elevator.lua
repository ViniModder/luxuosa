elevatorConfig = {}

elevatorConfig.elevators = {
    locs = {
        { coords = vec3(-447.04,198.26,75.28),  perm = nil, locais = "Hospital" },---menos 1
        { coords = vec3(-485.9,209.71,83.71), perm = nil, locais = "Hospital" },--1 andar 
        { coords = vec3(-485.74,209.49,87.72), perm = nil, locais = "Hospital" },--2 andar
        { coords = vec3(-481.17,209.25,94.41), perm = nil, locais = "Hospital" },--HELIPONTO
        --
        { coords = vec3(-68.54,-800.67,44.23),  perm = nil, locais = "HELIPONTO" },---okk
        { coords = vec3(-76.54,-827.22,326.08),   perm = nil, locais = "HELIPONTO" },--ok
        --
        { coords = vec3(380.44, -15.17, 83.0),     perm = nil, locais = "BRATVA" },
        { coords = vec3(414.95, -15.33, 99.65),    perm = nil, locais = "BRATVA" },
        --
        { coords = vec3(-304.83,-721.06,28.02),     perm = nil, locais = "COBERTURA" },
        { coords = vec3(-288.51,-722.33,125.46),    perm = nil, locais = "COBERTURA" },
         --
        { coords = vec3(-856.74,-2144.79,101.99),     perm = nil, locais = "Mansão Rooftop" },------------ok--ok
        { coords = vec3(-833.74,-2094.54,9.92),    perm = nil, locais = "Mansão Rooftop" },
         --
        { coords = vec3(-2416.9,3259.68,33.18),     perm = nil, locais = "EB" },
        { coords = vec3(-2416.45,3259.38,37.69),    perm = nil, locais = "EB" },
        { coords = vec3(-2416.39,3259.71,42.23),    perm = nil, locais = "EB" },--ELEVADOR 01
        { coords = vec3(-2439.71,3272.87,33.18),     perm = nil, locais = "EB" },--1
        { coords = vec3(-2439.41,3272.7,37.69),    perm = nil, locais = "EB" },--2
        { coords = vec3(-2439.36,3272.67,42.23),    perm = nil, locais = "EB" },--ELEVADOR 02
         ----
        { coords = vec3(-1096.37,-850.11,4.89),     perm = nil, locais = "CIVIL" },--menos 2
        { coords = vec3( -1096.52,-849.92,10.28),    perm = nil, locais = "CIVIL" },--menos 2
        { coords = vec3(-1096.66,-849.85,13.68),    perm = nil, locais = "CIVIL" },--menos 3
        { coords = vec3(-1096.44,-850.1,19.01),     perm = nil, locais = "CIVIL" },--1
        { coords = vec3(-1096.36,-850.12,23.03),    perm = nil, locais = "CIVIL" },--2
        { coords = vec3(-1096.16,-850.65,26.82),    perm = nil, locais = "CIVIL" },--3
        { coords = vec3(-1096.47,-850.08,30.75),     perm = nil, locais = "CIVIL" },--4
        { coords = vec3( -1096.47,-850.1,34.36),    perm = nil, locais = "CIVIL" },---5
        { coords = vec3(-1096.45,-850.04,38.23),    perm = nil, locais = "CIVIL" },--6
        { coords = vec3(-221.16,1582.73,342.83),    perm = nil, locais = "BOPE" },--6
        { coords = vec3(-229.66,1554.48,358.65),    perm = nil, locais = "BOPE" },--6
    },

    andares = {
        ["Hospital"] = {
            { coords = vec3(-447.04,198.26,75.28),  h = 104.89, botao = '-1' },-----editar
            { coords = vec3(-485.9,209.71,83.71), h = 107.72, botao = '1°' },
            { coords = vec3(-485.74,209.49,87.72), h = 107.72, botao = '2°' },
            { coords = vec3(-481.17,209.25,94.41), h = 107.72, botao = 'H' },
        },
        ["BOPE"] = {
            { coords = vec3(-221.6,1582.0,342.83),  h = 104.89, botao = '1' },-----
            { coords = vec3(-229.66,1554.48,358.65), h = 107.72, botao = 'H' },------HELIPNTO 
        },
        ['HELIPONTO'] = {
            { coords = vec3(-68.54,-800.67,44.23), h = 116.23, botao = 'T' },---heli prredio--ok
            { coords = vec3(-76.54,-827.22,326.08),  h = 209.77, botao = 'H' }
        },
        ['BRATVA'] = {
            { coords = vec3(380.44, -15.17, 83.0), h = 34.02, botao = '-1' },
            { coords = vec3(414.95, -15.33, 99.65), h = 243.78, botao = 'T' }
        },
        ['COBERTURA'] = {
            { coords = vec3(-304.83,-721.06,28.02), h = 34.02, botao = '-1' },
            { coords = vec3(-288.51,-722.33,125.46), h = 243.78, botao = 'T' }
        },
        ['Mansão Rooftop'] = {
            { coords = vec3(-856.74,-2144.79,101.99), h = 34.02, botao = 'C' },--------------okok
            { coords = vec3(-833.74,-2094.54,9.92), h = 243.78, botao = 'T' }
        },
        ['EB'] = {
            { coords = vec3(-2417.05,3259.85,33.18), h = 34.02, botao = '1' },
            { coords = vec3(-2416.45,3259.38,37.69), h = 243.78, botao = '2' },
            { coords = vec3(-2416.39,3259.71,42.23), h = 243.78, botao = 'H' },--ELEVADOR-01
            { coords = vec3(-2439.71,3272.87,33.18), h = 34.02, botao = '1' },--1
            { coords = vec3(-2439.41,3272.7,37.69), h = 243.78, botao = '2' },--2
            { coords = vec3(-2439.36,3272.67,42.23), h = 243.78, botao = 'H' }--ELEVADOR-02
        },
        ['CIVIL'] = {
            { coords = vec3(-1096.37,-850.11,4.89), h = 31.310, botao = '-1°' },---menos 1
            { coords = vec3( -1096.52,-849.92,10.28), h = 243.78, botao = '-2°' },
            { coords = vec3(-1096.66,-849.85,13.68), h = 243.78, botao = '-3°' },
            { coords = vec3(-1096.44,-850.1,19.01), h = 243.78, botao = '1°' },
            { coords = vec3(-1096.36,-850.12,23.03), h = 243.78, botao = '2°' },------
            { coords = vec3(-1096.16,-850.65,26.82), h = 243.78, botao = '3°' },-----
            { coords = vec3(-1096.47,-850.08,30.75), h = 243.78, botao = '4°' },--
            { coords = vec3(-1096.47,-850.1,34.36), h = 243.78, botao = '5°' },
            { coords = vec3(-1096.45,-850.04,38.23), h = 243.78, botao = '6°' }--
        },
    }
}
