 -----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_tattoos",cRP)
vSERVER = Tunnel.getInterface("vrp_tattoos")

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = nil
local atualShop = {}
local atualTattoo = {}
local old_custom
local oldTattoo = {}
local showSkinShop = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- TATOOSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local tattooShop = {
	["partsM"] = {
		["torso"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Airraces_Tattoo_000_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_001_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_002_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_004_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_005_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_006_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_007_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Bea_M_Back_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_Chest_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_Chest_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_Stom_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_Stom_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_000_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_001_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_003_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_005_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_006_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_008_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_010_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_011_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_013_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_017_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_018_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_019_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_021_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_023_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_026_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_029_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_030_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_031_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_032_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_034_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_039_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_041_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_043_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_050_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_052_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_058_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_059_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_060_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_M_Stomach_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_Chest_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_Chest_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_Back_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_000_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_002_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_003_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_005_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_008_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_009_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_010_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_011_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_015_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_016_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_019_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_020_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_021_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_022_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_024_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_026_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_027_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2018_Tat_000_M", ["part"] = "mpchristmas2018_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_005", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_006", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_009", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_011", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_013", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_015", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_016", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_017", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_018", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_019", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_028", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_000_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_001_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_009_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_010_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_012_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_013_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_014_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_017_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_018_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_019_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_020_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_022_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_028_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_029_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_023_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_024_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_025_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_026_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_027_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_028_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_029_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_030_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_033_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_035_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_036_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_037_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_038_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_039_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_000", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_002", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_006", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_011", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_012", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_013", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_024", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_025", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_029", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_030", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_031", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_032", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_033", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_035", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_041", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_046", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_047", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_000_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_001_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_002_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_009_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_010_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_011_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_LR_Tat_000_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_008_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_011_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_012_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_016_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_019_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_031_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_032_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_001_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_002_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_004_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_009_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_010_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_013_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_014_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_021_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_026_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_002_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_012_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_022_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_025_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_027_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_029_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_003_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_006_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_007_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_008_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_014_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_015_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_024_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_000_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_002_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_003_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_006_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_007_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_009_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_010_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_013_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_015_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_016_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_017_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_018_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_019_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_021_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_022_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_024_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_025_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_011_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_012_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_014_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_018_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_019_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_024_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_026_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_027_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_029_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_030_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_033_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_034_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_037_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_040_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_041_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_044_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_046_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_048_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_000_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_001_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_003_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_006_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_007_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_008_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_009_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_010_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_011_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_012_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_015_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_016_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_017_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_021_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_022_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_023_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_024_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_029_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_030_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_031_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_032_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_M_003", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_004", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_005", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_008", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_011", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_012", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_013", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_014", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_016", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_017", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_018", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_019", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_004", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_009", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_010", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_011", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_012", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_013", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_016", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_019", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_020", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_024", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_025", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_029", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_030", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_034", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_036", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_044", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_045", ["part"] = "multiplayer_overlays" }
			}
		},
		["head"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Bea_M_Head_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_Neck_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_Neck_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_009_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_038_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_051_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_M_Neck_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_Neck_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_Neck_002", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_Neck_003", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_007", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_024", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_025", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_029", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "mpHeist3_Tat_000_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_001_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_002_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_003_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_004_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_006_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_007_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_008_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_009_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_010_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_011_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_012_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_013_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_014_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_015_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_016_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_017_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_018_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_019_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_020_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_021_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_022_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_042_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_043_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_044_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_005", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_021", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_011_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_012_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_Tat_000_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_004_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_006_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_017_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_042_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "FM_Tat_Award_M_000", ["part"] = "multiplayer_overlays" }
			}
		},
		["leftarm"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Airraces_Tattoo_003_M", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Bea_M_LArm_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_LArm_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_012_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_016_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_020_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_024_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_025_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_035_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_045_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_053_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_055_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_M_LeftArm_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_LeftArm_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_001_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_004_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_007_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_013_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_025_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_029_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_000", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_010", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_012", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_020", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_021", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_004_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_008_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_015_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_016_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_025_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_027_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_040_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_041_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_003", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_007", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_015", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_016", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_026", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_027", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_028", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_034", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_037", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_039", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_043", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_048", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_004_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_008_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_LR_Tat_006_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_018_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_022_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_005_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_027_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_033_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_005_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_016_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_018_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_028_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_031_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_009_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_020_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_021_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_004_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_008_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_014_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_001_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_002_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_008_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_022_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_023_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_035_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_039_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_043_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_002_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_005_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_014_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_019_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_026_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_M_001", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_007", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_015", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_005", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_006", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_015", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_031", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_041", ["part"] = "multiplayer_overlays" }
			}
		},
		["rightarm"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Bea_M_RArm_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_M_RArm_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_007_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_014_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_033_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_042_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_046_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_047_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_049_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_054_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_M_RightArm_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_M_RightArm_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_006_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_012_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_014_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_017_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_018_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_023_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_028_M", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_003", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_004", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_008", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_022", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_023", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_026", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_027", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_002_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_021_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_024_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_034_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_001", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_004", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_008", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_010", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_014", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_017", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_018", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_020", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_022", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_023", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_036", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_044", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_045", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_LR_Tat_003_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_028_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_035_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_015_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_010_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_017_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_026_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_030_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_004_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_013_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_019_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_001_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_005_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_023_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_003_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_009_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_010_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_016_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_036_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_038_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_049_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_004_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_018_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_025_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_028_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_M_002", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_M_010", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_000", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_001", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_003", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_014", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_018", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_027", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_028", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_038", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_047", ["part"] = "multiplayer_overlays" }
			}
		},
		["leftleg"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Bea_M_Lleg_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_002_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_015_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_027_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_036_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_037_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_044_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_056_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_057_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_001", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_002", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_005_M", ["part"] = "mpgunrunning_overlays" }, 
				{ ["name"] = "MP_Gunrunning_Tattoo_007_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_011_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_023_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_032_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_009", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_019", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_040", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_LR_Tat_029_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_007_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_020_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_011_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_000_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_007_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_013_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_021_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_013_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_027_M", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_M_009", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_002", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_008", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_021", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_023", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_026", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_032", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_033", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_035", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_M_037", ["part"] = "multiplayer_overlays" }
			}
		},
		["rightleg"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Bea_M_Rleg_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_004_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_022_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_028_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_040_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_048_M", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Xmas2_M_Tat_014", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_006_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_026_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_030_M", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_031_M", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_038", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_M_Tat_042", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_LR_Tat_030_M", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_017_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_023_M", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_023_M", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_001_M", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_020_M", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_005_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_015_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_020_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_025_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_032_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_045_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_047_M", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "FM_Tat_M_043", ["part"] = "multiplayer_overlays" }
			}
		}
	},
	["partsF"] = {
		["torso"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Airraces_Tattoo_000_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_001_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_002_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_004_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_005_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_006_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Airraces_Tattoo_007_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Bea_F_Back_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Back_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Back_002", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Chest_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Chest_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Chest_002", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_RSide_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Should_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Should_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Stom_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Stom_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_Stom_002", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_000_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_001_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_003_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_005_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_006_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_008_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_010_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_011_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_013_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_017_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_018_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_019_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_021_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_023_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_026_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_029_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_030_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_031_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_032_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_034_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_039_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_041_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_043_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_050_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_052_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_058_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_059_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_060_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_F_Chest_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Chest_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Chest_002", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Stom_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Stom_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Stom_002", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Back_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Back_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_000_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_002_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_003_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_005_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_008_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_009_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_010_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_011_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_015_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_016_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_019_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_020_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_021_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_022_F", ["part"] = "mpchristmas2017_overlays" }, 
				{ ["name"] = "MP_Christmas2017_Tattoo_024_F", ["part"] = "mpchristmas2017_overlays" }, 
				{ ["name"] = "MP_Christmas2017_Tattoo_026_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_027_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2018_Tat_000_F", ["part"] = "mpchristmas2018_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_005", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_006", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_009", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_011", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_013", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_015", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_016", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_017", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_018", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_019", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_028", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_000_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_001_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_009_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_010_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_012_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_013_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_014_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_017_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_018_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_019_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_020_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_022_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_028_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_029_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_023_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_024_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_025_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_026_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_027_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_028_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_029_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_030_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_033_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_035_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_036_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_037_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_038_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_039_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_000", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_002", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_006", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_011", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_012", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_013", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_024", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_025", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_029", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_030", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_031", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_032", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_033", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_035", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_041", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_046", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_047", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_000_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_001_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_002_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_009_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_010_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_011_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_LR_Tat_000_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_008_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_011_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_012_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_016_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_019_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_031_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_032_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_001_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_002_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_004_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_009_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_010_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_013_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_014_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_021_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_026_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_002_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_012_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_022_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_025_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_027_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_029_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_003_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_006_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_007_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_008_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_014_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_015_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_024_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_000_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_002_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_003_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_006_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_007_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_009_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_010_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_013_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_015_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_016_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_017_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_018_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_019_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_021_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_022_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_024_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_025_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_011_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_012_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_014_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_018_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_019_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_024_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_026_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_027_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_029_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_030_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_033_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_034_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_037_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_040_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_041_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_044_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_046_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_048_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_000_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_001_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_003_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_006_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_007_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_008_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_009_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_010_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_011_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_012_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_015_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_016_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_017_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_021_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_022_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_023_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_024_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_029_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_030_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_031_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_032_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_F_003", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_004", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_005", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_008", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_011", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_012", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_013", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_014", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_016", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_017", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_018", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_019", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_004", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_009", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_010", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_011", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_012", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_013", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_016", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_019", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_020", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_024", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_025", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_029", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_030", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_034", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_036", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_044", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_045", ["part"] = "multiplayer_overlays" }
			}
		},
		["head"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Bea_F_Neck_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_009_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_038_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_051_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_F_Neck_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Buis_F_Neck_001", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_007", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_024", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_025", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_029", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_003_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_000_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_001_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_002_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_003_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_004_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_006_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_007_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_008_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_009_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_010_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_011_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_012_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_013_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_014_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_015_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_016_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_017_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_018_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_019_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_020_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_021_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_022_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_042_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_043_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_044_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_005", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_021", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_011_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_012_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_Tat_000_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_004_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_006_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_017_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_042_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "FM_Tat_Award_F_000", ["part"] = "multiplayer_overlays" }
			}
		},
		["leftarm"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Airraces_Tattoo_003_F", ["part"] = "mpairraces_overlays" },
				{ ["name"] = "MP_Bea_F_LArm_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Bea_F_LArm_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_012_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_016_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_020_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_024_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_025_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_035_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_045_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_053_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_055_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_F_LArm_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_001_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_004_F", ["part"] = "mpchristmas2017_overlays" }, 
				{ ["name"] = "MP_Christmas2017_Tattoo_007_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_013_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_025_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_029_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_000", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_010", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_012", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_020", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_021", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_004_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_008_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_015_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_016_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_025_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_027_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_040_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "mpHeist3_Tat_041_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_003", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_007", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_015", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_016", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_026", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_027", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_028", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_034", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_037", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_039", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_043", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_048", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_004_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_008_F", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_LR_Tat_006_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_018_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_022_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_005_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_027_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_033_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_005_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_016_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_018_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_028_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_031_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_009_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_020_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_021_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_004_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_008_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_014_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_001_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_002_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_008_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_022_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_023_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_035_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_039_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_043_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_002_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_005_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_014_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_019_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_026_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_F_001", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_007", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_015", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_005", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_006", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_015", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_031", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_041", ["part"] = "multiplayer_overlays" }
			}
		},
		["rightarm"] = {
			["tattoo"] = {
				{ ["name"] = "MP_Bea_F_RArm_001", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_007_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_014_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_033_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_042_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_046_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_047_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_049_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_054_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Buis_F_RArm_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_006_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_012_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_014_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_017_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_018_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_023_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Christmas2017_Tattoo_028_F", ["part"] = "mpchristmas2017_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_003", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_004", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_008", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_022", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_023", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_026", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_027", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_002_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_021_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_024_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_034_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_001", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_004", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_008", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_010", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_014", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_017", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_018", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_020", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_022", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_023", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_036", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_044", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_045", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_003_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_005_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_006_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_MP_ImportExport_Tat_007_M", ["part"] = "mpimportexport_overlays" },
				{ ["name"] = "MP_LR_Tat_003_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_028_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_035_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_015_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_010_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_017_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_026_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_030_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_004_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_013_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_LUXE_TAT_019_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_001_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_005_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_023_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_003_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_009_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_010_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_016_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_036_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_038_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_049_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_004_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_018_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_025_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_028_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_F_002", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_Award_F_010", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_001", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_003", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_014", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_018", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_027", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_028", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_038", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_047", ["part"] = "multiplayer_overlays" }
			}
		},
		["leftleg"] = { 
			["tattoo"] = {
				{ ["name"] = "MP_MP_Biker_Tat_002_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_015_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_027_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_036_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_037_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_044_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_056_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_057_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_001", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_002", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_005_F", ["part"] = "mpgunrunning_overlays" }, 
				{ ["name"] = "MP_Gunrunning_Tattoo_007_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_011_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_023_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "mpHeist3_Tat_032_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "MP_Buis_F_LLeg_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_009", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_019", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_040", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_LR_Tat_029_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_007_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_020_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_011_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_000_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_007_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_013_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_021_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_013_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "MP_Vinewood_Tat_027_F", ["part"] = "mpvinewood_overlays" },
				{ ["name"] = "FM_Tat_Award_F_009", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_002", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_008", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_021", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_023", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_026", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_032", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_033", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_035", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Tat_F_037", ["part"] = "multiplayer_overlays" }
			}
		},
		["rightleg"] = {
			["tattoo"] = {
				{ ["name"] = "MP_MP_Biker_Tat_004_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_022_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_028_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_040_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_MP_Biker_Tat_048_F", ["part"] = "mpbiker_overlays" },
				{ ["name"] = "MP_Xmas2_F_Tat_014", ["part"] = "mpchristmas2_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_006_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_026_f", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Tattoo_030_F", ["part"] = "mpgunrunning_overlays" },
				{ ["name"] = "MP_Bea_F_RLeg_000", ["part"] = "mpbeach_overlays" },
				{ ["name"] = "MP_Buis_F_RLeg_000", ["part"] = "mpbusiness_overlays" },
				{ ["name"] = "mpHeist3_Tat_031_F", ["part"] = "mpheist3_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_038", ["part"] = "mphipster_overlays" },
				{ ["name"] = "FM_Hip_F_Tat_042", ["part"] = "mphipster_overlays" },
				{ ["name"] = "MP_LR_Tat_030_F", ["part"] = "mplowrider2_overlays" },
				{ ["name"] = "MP_LR_Tat_017_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LR_Tat_023_F", ["part"] = "mplowrider_overlays" },
				{ ["name"] = "MP_LUXE_TAT_023_F", ["part"] = "mpluxe2_overlays" },
				{ ["name"] = "MP_LUXE_TAT_001_F", ["part"] = "mpluxe_overlays" },
				{ ["name"] = "MP_Smuggler_Tattoo_020_F", ["part"] = "mpsmuggler_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_005_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_015_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_020_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_025_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_032_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_045_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "MP_MP_Stunt_tat_047_F", ["part"] = "mpstunt_overlays" },
				{ ["name"] = "FM_Tat_F_043", ["part"] = "multiplayer_overlays" }
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARBERSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local barberShop = { 
	["partsM"] = {
		["hairs"] = { 
			["tattoo"] = {
				{ ["name"] = "FM_M_Hair_001_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_001_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_001_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_001_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_001_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_003_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_003_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_003_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_003_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_003_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_006_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_006_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_006_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_006_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_006_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_008_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_008_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_008_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_008_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_008_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_long_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_long_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_long_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_long_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_M_Hair_long_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_002", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_003", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_004", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_005", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_006", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_007", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_008", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_009", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_010", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_011", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_012", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_013", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_014", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_M_Hair_015", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBea_M_Hair_000", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBea_M_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBus_M_Hair_000", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBus_M_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGHip_M_Hair_000", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGHip_M_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGInd_M_Hair_000", ["part"] = "multiplayer_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_000_a", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_000_b", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_000_c", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_000_d", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_000_e", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_001_a", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_001_b", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_001_c", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_001_d", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_M_Hair_001_e", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Disc_M_Hair_001_a", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Disc_M_Hair_001_b", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Disc_M_Hair_001_c", ["part"] = "mpHipster_overlays" },
				{ ["name"] = "FM_Disc_M_Hair_001_d", ["part"] = "mpHipster_overlays" },
				{ ["name"] = "FM_Disc_M_Hair_001_e", ["part"] = "mpHipster_overlays" },
				{ ["name"] = "MP_Gunrunning_Hair_M_000_M", ["part"] = "mpGunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Hair_M_001_M", ["part"] = "mpGunrunning_overlays" },
				{ ["name"] = "FM_Hair_Fuzz", ["part"] = "mpBeach_overlays" },
				{ ["name"] = "MP_Biker_Hair_000_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_001_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_002_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_003_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_004_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_005_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_006_M", ["part"] = "mpBiker_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_000_a", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_000_b", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_000_c", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_000_d", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_000_e", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_001_a", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_001_b", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_001_c", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_001_d", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_M_Hair_001_e", ["part"] = "mpBusiness_overlays" },
				{ ["name"] = "Hair_014_Fix", ["part"] = "mpxmas_604490_overlays" },
				
			}
		}
	},
	["partsF"] = {
		["hairs"] = { 
			["tattoo"] = {
				{ ["name"] = "FM_F_Hair_003_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_003_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_003_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_003_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_003_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_005_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_005_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_005_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_005_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_005_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_006_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_006_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_006_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_006_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_006_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_013_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_013_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_013_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_013_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_013_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_014_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_014_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_014_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_014_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_014_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_long_a", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_long_b", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_long_c", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_long_d", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "FM_F_Hair_long_e", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_002", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_003", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_004", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_005", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_006", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_007", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_008", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_009", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_010", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_011", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_012", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_013", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_014", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NG_F_Hair_015", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBea_F_Hair_000", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBea_F_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBus_F_Hair_000", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGBus_F_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGHip_F_Hair_000", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGHip_F_Hair_001", ["part"] =  "multiplayer_overlays" },
				{ ["name"] = "NGInd_F_Hair_000", ["part"] =  "multiplayer_overlays" },

				{ ["name"] = "FM_Hip_F_Hair_000_a", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_F_Hair_000_b", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_F_Hair_000_c", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_F_Hair_000_d", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_Hip_F_Hair_000_e", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_017_a", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_017_b", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_017_c", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_017_d", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_017_e", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_020_a", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_020_b", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_020_c", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_020_d", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "FM_F_Hair_020_e", ["part"] =  "mpHipster_overlays" },
				{ ["name"] = "MP_Gunrunning_Hair_F_000_F", ["part"] =  "mpGunrunning_overlays" },
				{ ["name"] = "MP_Gunrunning_Hair_F_001_F", ["part"] =  "mpGunrunning_overlays" },
				{ ["name"] = "FM_Hair_Fuzz", ["part"] =  "mpBeach_overlays" },

				{ ["name"] = "MP_Biker_Hair_000_F", ["part"] =  "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_001_F", ["part"] =  "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_002_F", ["part"] =  "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_003_F", ["part"] =  "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_004_F", ["part"] =  "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_005_F", ["part"] =  "mpBiker_overlays" },
				{ ["name"] = "MP_Biker_Hair_006_F", ["part"] =  "mpBiker_overlays" },

				{ ["name"] = "FM_Bus_F_Hair_a", ["part"] =  "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_F_Hair_b", ["part"] =  "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_F_Hair_c", ["part"] =  "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_F_Hair_d", ["part"] =  "mpBusiness_overlays" },
				{ ["name"] = "FM_Bus_F_Hair_e", ["part"] =  "mpBusiness_overlays" },
				{ ["name"] = "Hair_014_Fix", ["part"] =  "mpxmas_604490_overlays" },

			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	SetNuiFocus(false,false)
end)

RegisterNetEvent("reloadTattos")
AddEventHandler("reloadTattos", function()
	ClearPedDecorations(PlayerPedId())
	for k,v in pairs(atualTattoo) do
		AddPedDecorationFromHashes(PlayerPedId(),GetHashKey(v[1]),GetHashKey(k))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETTATTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_tattoos:setTattoos")
AddEventHandler("vrp_tattoos:setTattoos",function(status)
	atualTattoo = status or {}

	for k,v in pairs(atualTattoo) do
		AddPedDecorationFromHashes(PlayerPedId(),GetHashKey(v[1]),GetHashKey(k))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENTATTOOSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function openTattooShop(hairs)
	setCameraCoords()
	SetNuiFocus(true,true)

	local ped = PlayerPedId()
	ClearAllPedProps(ped)

    if hairs then
        if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
            atualShop = barberShop["partsM"]
    
			SetPedComponentVariation(ped,1,-1,0,2)
			SetPedComponentVariation(ped,3,15,0,2)
			SetPedComponentVariation(ped,4,27,4,2)
			SetPedComponentVariation(ped,5,-1,0,2)
			SetPedComponentVariation(ped,6,42,0,2)
			SetPedComponentVariation(ped,7,-1,0,2)
			SetPedComponentVariation(ped,8,15,0,2)
			SetPedComponentVariation(ped,9,-1,0,2)
			SetPedComponentVariation(ped,10,-1,0,2)
			SetPedComponentVariation(ped,11,317,0,2)
        elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
            atualShop = barberShop["partsF"]
			SetPedComponentVariation(ped,1,0,0,2)
			SetPedComponentVariation(ped,3,15,0,2)
			SetPedComponentVariation(ped,4,3,0,2)
			SetPedComponentVariation(ped,5,-1,0,2)
			SetPedComponentVariation(ped,6,74,0,2)
			SetPedComponentVariation(ped,7,0,0,2)
			SetPedComponentVariation(ped,8,3,0,2)
			SetPedComponentVariation(ped,9,0,0,2)
			SetPedComponentVariation(ped,10,-1,0,2)
			SetPedComponentVariation(ped,11, 100,0,2)
        end
	    SendNUIMessage({ openNui = true, hairs = true, shop = atualShop, tattoo = atualTattoo })
	else
		if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			atualShop = tattooShop["partsM"]
			SetPedComponentVariation(ped,1,0,0,2)
			SetPedComponentVariation(ped,3,15,0,2)
			SetPedComponentVariation(ped,4,14,0,2)
			SetPedComponentVariation(ped,5,-1,0,2)
			SetPedComponentVariation(ped,6,5,0,2)
			SetPedComponentVariation(ped,7,0,0,2)
			SetPedComponentVariation(ped,8,15,0,2)
			SetPedComponentVariation(ped,9,-1,0,2)
			SetPedComponentVariation(ped,10,-1,0,2)
			SetPedComponentVariation(ped,11,15,0,2)
		elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
			atualShop = tattooShop["partsF"]
	
			SetPedComponentVariation(ped,1,-1,0,2)
			SetPedComponentVariation(ped,3,15,0,2)
			SetPedComponentVariation(ped,4,15,0,2)
			SetPedComponentVariation(ped,5,-1,0,2)
			SetPedComponentVariation(ped,6,18,0,2)
			SetPedComponentVariation(ped,7,2,5,2)
			SetPedComponentVariation(ped,8,3,0,2)
			SetPedComponentVariation(ped,9,-1,0,2)
			SetPedComponentVariation(ped,10,-1,0,2)
			SetPedComponentVariation(ped,11,15,3,2)
		end
		SendNUIMessage({ openNui = true, shop = atualShop, tattoo = atualTattoo })
    end

	oldTattoo = atualTattoo
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATETATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
function updateTattoo()
	local ped = PlayerPedId()
	ClearPedDecorations(ped)
	for k,v in pairs(atualTattoo) do
		AddPedDecorationFromHashes(PlayerPedId(),GetHashKey(v[1]),GetHashKey(k))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCAMERACOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
function setCameraCoords()
	if DoesCamExist(cam) then
		RenderScriptCams(false,true,250,1,0)
		DestroyCam(cam,false)
		cam = nil
	end

	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
	SetCamActive(cam,true)
	RenderScriptCams(true,true,500,true,true)
	pos = GetEntityCoords(PlayerPedId())
	camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,2.0,0.0)
	SetCamCoord(cam,camPos.x,camPos.y,camPos.z + 0.75)
	PointCamAtCoord(cam,pos.x,pos.y,pos.z + 0.15)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data,cb)
	RenderScriptCams(false,true,250,1,0)
	vSERVER.updateTattoo(atualTattoo)
	vRP.setCustomization(old_custom)
	--TriggerEvent("updateRoupas",old_custom)
	SetNuiFocus(false,false)
	DestroyCam(cam,false)
	cam = nil
	TriggerEvent("hudActived")

	vSERVER._setInstance(false)

	if not showSkinShop then 
		return
	end

	TriggerEvent('open:skinshop',true)
end)

RegisterNUICallback("closeNotSave",function(data,cb)
	RenderScriptCams(false,true,250,1,0)

	atualTattoo = oldTattoo
	updateTattoo()
	vRP.setCustomization(old_custom)
	--TriggerEvent("updateRoupas",old_custom)
	SetNuiFocus(false,false)
	DestroyCam(cam,false)
	cam = nil
	TriggerEvent("hudActived")
	
	vSERVER._setInstance(false)

	if not showSkinShop then 
		return
	end

	TriggerEvent('open:skinshop',true)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
-- X,Y,Z, HAIRS, SHOWBLIP
local coordsSystem = {
    {1321.35, -1653.11, 52.27, true, true},
    {1324.31,-1653.01,52.27,},
    {-1155.52, -1426.49, 4.95, true, true},
    {-1152.37,-1426.59,4.95,},
    {323.89, 179.61, 103.58, true, true},
    {322.64,182.25,103.58,},
    {-3168.98, 1076.97, 20.83, true, true},
    {-3171.56,1075.73,20.82,},
    {1864.16, 3747.86, 33.03, true, true},
    {-294.0, 6199.81, 31.49, true, true},
	{ -1661.01, 164.56, 61.81 },--PMERJ
	{564.78,-186.85,59.08},--mec rideout 
	{-1225.67,-1779.5,4.67},--SPAWN
	{-1220.76,-1768.74,4.67},--SPAWN
	
	

}

CreateThread(function()
	criarBlip()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			for k,v in pairs(coordsSystem) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 5 then
					timeDistance = 4
					DrawText3Ds(v[1],v[2],v[3],"~b~E~w~ - ESTUDIO")
					DrawMarker(1, vec3(v[1],v[2],v[3]) - vec3(0.0,0.0,1.95), 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 1.5001, 255, 255, 255, 140, 0, 0, 0, 0) 
					DrawMarker(23,v[1],v[2],v[3]-0.95,0,0,0,0,0,0,1.5,1.5,1.5,42,137,255,100,0,0,0,0)

					if distance <= 0.5 and IsControlJustPressed(1,38) then
                        if v[4] then 
                            TriggerEvent("hudDeactived")
                            old_custom = vRP.getCustomization(source)
                            openTattooShop(true)
						else
							TriggerEvent("hudDeactived")
							old_custom = vRP.getCustomization(source)
							openTattooShop()
                        end 

						showSkinShop = false
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)

RegisterNetEvent('open:tattoos_conexao_char')
AddEventHandler('open:tattoos_conexao_char',function(insertBucket,enableSkinShop)
	TriggerEvent("hudDeactived")
	old_custom = vRP.getCustomization(source)
	openTattooShop(false)

	vSERVER._setInstance(insertBucket)
	showSkinShop = enableSkinShop
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHANGETATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changeTattoo",function(data,cb)
	local newAtualTattoo = {}
	local tattooData = atualShop[data["type"]]["tattoo"][data["id"] + 1]

	for k,v in pairs(atualTattoo) do
		if k ~= tattooData["name"] then
			newAtualTattoo[k] = v
		end
	end

	if atualTattoo[tattooData["name"]] == nil then
		newAtualTattoo[tattooData["name"]] = { tattooData["part"] }
	end

	atualTattoo = newAtualTattoo
	updateTattoo()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARTATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("clearTattoo",function(data,cb)
	atualTattoo = {}
	ClearPedDecorations(PlayerPedId())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotate",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "left" then
		SetEntityHeading(ped,heading + 10)
	elseif data == "right" then
		SetEntityHeading(ped,heading - 10)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDSUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("handsup",function(data,cb)
    local ped = PlayerPedId()
    if IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) then
        vRP.stopAnim()
    else
        vRP.playAnim(true,{"random@mugging3","handsup_standing_base"},true)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/450
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIP
-----------------------------------------------------------------------------------------------------------------------------------------
function criarBlip()
    for k,v in pairs(coordsSystem) do 
		if v[5] then
			blip = AddBlipForCoord(v[1],v[2],v[3])
			SetBlipSprite(blip, 75)
			SetBlipColour(blip, 4)
			SetBlipScale(blip, 0.5)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Tatto Shop')
			EndTextCommandSetBlipName(blip)
		end
    end
end