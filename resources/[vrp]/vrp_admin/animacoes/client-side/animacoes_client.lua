
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface('vrp_animacoes_', src)
vSERVER = Tunnel.getInterface('vrp_animacoes_')
-----------------------------------------------------------------------------------------------------------------------------------------
-- 60309 hand ESQUERDA
-- 28422 hand DIREITA
-- 50 NÃO REPETE
-- 49 REPETE
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_min = 5.0
local fov_max = 70.0
local binoculos = false
local camera = false
local fov = (fov_max+fov_min)*0.5
-----------------------------------------------------------------------------------------------------------------------------------------
local animacoes = {
	{ nome = "radio2" , prop = "prop_boombox_01" , flag = 50 , hand = 57005 , pos1 = 0.30 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa" , prop = "prop_ld_case_01" , flag = 50 , hand = 57005 , pos1 = 0.16 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa2" , prop = "prop_ld_case_01_s" , flag = 50 , hand = 57005 , pos1 = 0.16 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa3" , prop = "prop_security_case_01" , flag = 50 , hand = 57005 , pos1 = 0.16 , pos2 = 0 , pos3 = -0.01 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "bolsa4" , prop = "w_am_case" , flag = 50 , hand = 57005 , pos1 = 0.08 , pos2 = 0 , pos3 = 0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "caixa2" , prop = "prop_tool_box_04" , flag = 50 , hand = 57005 , pos1 = 0.45 , pos2 = 0 , pos3 = 0.05 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "lixo" , prop = "prop_cs_rub_binbag_01" , flag = 50 , hand = 57005 , pos1 = 0.11 , pos2 = 0 , pos3 = 0.0 , pos4 = 0 , pos5 = 260.0 , pos6 = 60.0 },
	{ nome = "mic" , prop = "prop_microphone_02" , flag = 50 , hand = 60309 , pos1 = 0.08 , pos2 = 0.03 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "mic2" , prop = "p_ing_microphonel_01" , flag = 50 , hand = 60309 , pos1 = 0.08 , pos2 = 0.03 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "mic3" , dict = "missfra1" , anim = "mcs2_crew_idle_m_boom" , prop = "prop_v_bmike_01" , flag = 50 , hand = 28422 },
	{ nome = "buque" , prop = "prop_snow_flower_02" , flag = 50 , hand = 60309 , pos1 = 0.0 , pos2 = 0.0 , pos3 = 0.0 , pos4 = 300.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "rosa" , prop = "prop_single_rose" , flag = 50 , hand = 60309 , pos1 = 0.055 , pos2 = 0.05 , pos3 = 0.0 , pos4 = 240.0 , pos5 = 0.0 , pos6 = 0.0 },
	{ nome = "prebeber" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_fib_coffee" , flag = 49 , hand = 28422 },
	{ nome = "prebeber" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_fib_coffee" , flag = 49 , hand = 28422 },
	{ nome = "prebeber2" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_ld_flow_bottle" , flag = 49 , hand = 28422 },
	{ nome = "prebeber3" , dict = "amb@code_human_wander_drinking@beer@male@base" , anim = "static" , prop = "prop_cs_bs_cup" , flag = 49 , hand = 28422 },
	{ nome = "verificar" , dict = "amb@medic@standing@tendtodead@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "mexer" , dict = "amb@prop_human_parking_meter@female@idle_a" , anim = "idle_a_female" , andar = true , loop = true },
	{ nome = "cuidar" , dict = "mini@cpr@char_a@cpr_str" , anim = "cpr_pumpchest" , andar = true , loop = true },
	{ nome = "cuidar2" , dict = "mini@cpr@char_a@cpr_str" , anim = "cpr_kol" , andar = true , loop = true },
	{ nome = "cuidar3" , dict = "mini@cpr@char_a@cpr_str" , anim = "cpr_kol_idle" , andar = true , loop = true },
	{ nome = "do" , dict = "rcmbarry" , anim = "idle_d" , andar = false , loop = true },
	{ nome = "alongar2" , dict = "mini@triathlon" , anim = "idle_e" , andar = false , loop = true },
	{ nome = "meleca" , dict = "anim@mp_player_intuppernose_pick" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "bora" , dict = "missfam4" , anim = "say_hurry_up_a_trevor" , andar = true , loop = false },
	{ nome = "limpar" , dict = "missfbi3_camcrew" , anim = "final_loop_guy" , andar = true , loop = false },
	{ nome = "galinha" , dict = "random@peyote@chicken" , anim = "wakeup" , andar = true , loop = true },
	{ nome = "amem" , dict = "rcmepsilonism8" , anim = "worship_base" , andar = true , loop = true },
	{ nome = "nervoso" , dict = "rcmme_tracey1" , anim = "nervous_loop" , andar = true , loop = true },
	{ nome = "morrer" , dict = "misslamar1dead_body" , anim = "dead_idle" , andar = false , loop = true },
	{ nome = "rebolar" , dict = "switch@trevor@mocks_lapdance" , anim = "001443_01_trvs_28_idle_stripper" , andar = false , loop = true },
	{ nome = "ajoelhar" , dict = "amb@medic@standing@kneel@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sinalizar" , dict = "amb@world_human_car_park_attendant@male@base" , anim = "base" , prop = "prop_parking_wand_01" , flag = 49 , hand = 28422 },
	{ nome = "placa" , dict = "amb@world_human_bum_freeway@male@base" , anim = "base" , prop = "prop_beggers_sign_01" , flag = 49 , hand = 28422 },
	{ nome = "placa2" , dict = "amb@world_human_bum_freeway@male@base" , anim = "base" , prop = "prop_beggers_sign_03" , flag = 49 , hand = 28422 },
	{ nome = "placa3" , dict = "amb@world_human_bum_freeway@male@base" , anim = "base" , prop = "prop_beggers_sign_04" , flag = 49 , hand = 28422 },
	{ nome = "abanar" , dict = "timetable@amanda@facemask@base" , anim = "base" , andar = true , loop = true },
	{ nome = "cocada" , dict = "mp_player_int_upperarse_pick" , anim = "mp_player_int_arse_pick" , andar = true , loop = true },
	{ nome = "cocada2" , dict = "mp_player_int_uppergrab_crotch" , anim = "mp_player_int_grab_crotch" , andar = true , loop = true },
	{ nome = "lero" , dict = "anim@mp_player_intselfiejazz_hands" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "dj2" , dict = "anim@mp_player_intupperair_synth" , anim = "idle_a_fp" , andar = false , loop = true },
	{ nome = "beijo" , dict = "anim@mp_player_intselfieblow_kiss" , anim = "exit" , andar = true , loop = false },
	{ nome = "malicia" , dict = "anim@mp_player_intupperdock" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "ligar" , dict = "cellphone@" , anim = "cellphone_call_in" , prop = "prop_amb_phone" , flag = 50 , hand = 28422 },
	{ nome = "radio" , dict = "cellphone@" , anim = "cellphone_call_in" , prop = "prop_cs_hand_radio" , flag = 50 , hand = 28422 },
	{ nome = "cafe" , dict = "amb@world_human_aa_coffee@base" , anim = "base" , prop = "prop_fib_coffee" , flag = 50 , hand = 28422 },
	{ nome = "cafe2" , dict = "amb@world_human_aa_coffee@idle_a" , anim = "idle_a" , prop = "prop_fib_coffee" , flag = 49 , hand = 28422 },
	{ nome = "batata" , dict = "amb@world_human_aa_coffee@idle_a" , anim = "idle_a" , prop = "mah_batata" , flag = 49 , hand = 28422 },--teste 
	{ nome = "caixa" , dict = "anim@heists@box_carry@" , anim = "idle" , prop = "hei_prop_heist_box" , flag = 50 , hand = 28422 },
	{ nome = "chuva" , dict = "amb@world_human_drinking@coffee@male@base" , anim = "base" , prop = "p_amb_brolly_01" , flag = 50 , hand = 28422 },
	{ nome = "chuva2" , dict = "amb@world_human_drinking@coffee@male@base" , anim = "base" , prop = "p_amb_brolly_01_s" , flag = 50 , hand = 28422 },
	{ nome = "comer" , dict = "amb@code_human_wander_eating_donut@male@idle_a" , anim = "idle_c" , prop = "prop_cs_burger_01" , flag = 49 , hand = 28422 },
	{ nome = "comer2" , dict = "amb@code_human_wander_eating_donut@male@idle_a" , anim = "idle_c" , prop = "prop_cs_hotdog_01" , flag = 49 , hand = 28422 },
	{ nome = "comer3" , dict = "amb@code_human_wander_eating_donut@male@idle_a" , anim = "idle_c" , prop = "prop_amb_donut" , flag = 49 , hand = 28422 },
	{ nome = "beber" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "p_cs_bottle_01" , flag = 49 , hand = 28422 },
	{ nome = "beber2" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_energy_drink" , flag = 49 , hand = 28422 },
	{ nome = "beber3" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_amb_beer_bottle" , flag = 49 , hand = 28422 },
	{ nome = "beber4" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "p_whiskey_notop" , flag = 49 , hand = 28422 },
	{ nome = "beber5" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_beer_logopen" , flag = 49 , hand = 28422 },
	{ nome = "beber6" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_beer_blr" , flag = 49 , hand = 28422 },
	{ nome = "beber7" , dict = "amb@world_human_drinking@beer@male@idle_a" , anim = "idle_a" , prop = "prop_ld_flow_bottle" , flag = 49 , hand = 28422 },
	{ nome = "digitar" , dict = "anim@heists@prison_heistig1_p1_guard_checks_bus" , anim = "loop" , andar = false , loop = true },
	{ nome = "continencia" , dict = "mp_player_int_uppersalute" , anim = "mp_player_int_salute" , andar = true , loop = true },
	{ nome = "atm" , dict = "amb@prop_human_atm@male@idle_a" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "no" , dict = "mp_player_int_upper_nod" , anim = "mp_player_int_nod_no" , andar = true , loop = true },
	{ nome = "abracocintura" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_chad" , andar = false , loop = true },
    { nome = "abracocintura2" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_chad" , andar = true , loop = true },
    { nome = "abracoombro" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_girl" , andar = false , loop = true },
    { nome = "abracoombro2" , dict = "misscarsteal2chad_goodbye" , anim = "chad_armsaround_girl" , andar = true , loop = true },
	{ nome = "palmas" , dict = "anim@mp_player_intcelebrationfemale@slow_clap" , anim = "slow_clap" , andar = true , loop = false },
	{ nome = "palmas2" , dict = "amb@world_human_cheering@male_b" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas3" , dict = "amb@world_human_cheering@male_d" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas4" , dict = "amb@world_human_cheering@male_e" , anim = "base" , andar = true , loop = true },
	{ nome = "palmas5" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "angry_clap_a_player_a" , andar = false , loop = true },
	{ nome = "palmas6" , dict = "anim@mp_player_intupperslow_clap" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "postura" , dict = "anim@heists@prison_heiststation@cop_reactions" , anim = "cop_a_idle" , andar = true , loop = true },
	{ nome = "postura2" , dict = "amb@world_human_cop_idles@female@base" , anim = "base" , andar = true , loop = true },
	{ nome = "varrer" , dict = "amb@world_human_janitor@male@idle_a" , anim = "idle_a" , prop = "prop_tool_broom" , flag = 49 , hand = 28422 },
	{ nome = "musica" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_el_guitar_01" , flag = 49 , hand = 60309 },
	{ nome = "musica2" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_el_guitar_02" , flag = 49 , hand = 60309 },
	{ nome = "musica3" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_el_guitar_03" , flag = 49 , hand = 60309 },
	{ nome = "musica4" , dict = "amb@world_human_musician@guitar@male@base" , anim = "base" , prop = "prop_acc_guitar_01" , flag = 49 , hand = 60309 },
	{ nome = "camera" , dict = "amb@world_human_paparazzi@male@base" , anim = "base" , prop = "prop_pap_camera_01" , flag = 49 , hand = 28422 },
	{ nome = "camera2" , dict = "missfinale_c2mcs_1" , anim = "fin_c2_mcs_1_camman" , prop = "prop_v_cam_01" , flag = 49 , hand = 28422 },
	{ nome = "prancheta" , dict = "amb@world_human_clipboard@male@base" , anim = "base" , prop = "p_amb_clipboard_01" , flag = 50 , hand = 60309 },
	{ nome = "mapa" , dict = "amb@world_human_clipboard@male@base" , anim = "base" , prop = "prop_tourist_map_01" , flag = 50 , hand = 60309 },
	{ nome = "anotar" , dict = "amb@medic@standing@timeofdeath@base" , anim = "base" , prop = "prop_notepad_01" , flag = 49 , hand = 60309 },
	{ nome = "peace" , dict = "mp_player_int_upperpeace_sign" , anim = "mp_player_int_peace_sign" , andar = true , loop = true },
	{ nome = "deitar" , dict = "amb@world_human_sunbathe@female@back@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar2" , dict = "amb@world_human_sunbathe@female@front@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar3" , dict = "amb@world_human_sunbathe@male@back@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar4" , dict = "amb@world_human_sunbathe@male@front@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "deitar5" , dict = "mini@cpr@char_b@cpr_str" , anim = "cpr_kol_idle" , andar = false , loop = true },
	{ nome = "deitar6" , dict = "switch@trevor@scares_tramp" , anim = "trev_scares_tramp_idle_tramp" , andar = false , loop = true },
	{ nome = "deitar7" , dict = "switch@trevor@annoys_sunbathers" , anim = "trev_annoys_sunbathers_loop_girl" , andar = false , loop = true },		
	{ nome = "deitar8" , dict = "switch@trevor@annoys_sunbathers" , anim = "trev_annoys_sunbathers_loop_guy" , andar = false , loop = true },
	{ nome = "debrucar" , dict = "amb@prop_human_bum_shopping_cart@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "dancar" , dict = "rcmnigel1bnmt_1b" , anim = "dance_loop_tyler" , andar = false , loop = true },
	{ nome = "dancar2" , dict = "mp_safehouse" , anim = "lap_dance_girl" , andar = false , loop = true },
	{ nome = "dancar3" , dict = "misschinese2_crystalmazemcs1_cs" , anim = "dance_loop_tao" , andar = false , loop = true },
	{ nome = "dancar4" , dict = "mini@strip_club@private_dance@part1" , anim = "priv_dance_p1" , andar = false , loop = true },
	{ nome = "dancar5" , dict = "mini@strip_club@private_dance@part2" , anim = "priv_dance_p2" , andar = false , loop = true },
	{ nome = "dancar6" , dict = "mini@strip_club@private_dance@part3" , anim = "priv_dance_p3" , andar = false , loop = true },
	{ nome = "dancar7" , dict = "special_ped@mountain_dancer@monologue_2@monologue_2a" , anim = "mnt_dnc_angel" , andar = false , loop = true },
	{ nome = "dancar8" , dict = "special_ped@mountain_dancer@monologue_3@monologue_3a" , anim = "mnt_dnc_buttwag" , andar = false , loop = true },
	{ nome = "dancar9" , dict = "missfbi3_sniping" , anim = "dance_m_default" , andar = false , loop = true },
	{ nome = "dancar10" , dict = "anim@amb@nightclub@dancers@black_madonna_entourage@" , anim = "hi_dance_facedj_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar11" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar12" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar13" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar14" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar15" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar16" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar17" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar18" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar19" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar20" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar21" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar22" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar23" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar24" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar25" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar26" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar27" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar28" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar29" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar30" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar31" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar32" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar33" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar34" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_09_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar35" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar36" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar37" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar38" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar39" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar40" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar41" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar42" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar43" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar44" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar45" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar46" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar47" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar48" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar49" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar50" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar51" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar52" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar53" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar54" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar55" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar56" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar57" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar58" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_11_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar59" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar60" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar61" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar62" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar63" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar64" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar65" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar66" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar67" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar68" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar69" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar70" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar71" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar72" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar73" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar74" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar75" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar76" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar77" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar78" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar79" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar80" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar81" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar82" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_13_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar83" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar84" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar85" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar86" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar87" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar88" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar89" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar90" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar91" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar92" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar93" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar94" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar95" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar96" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar97" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar98" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar99" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar100" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar101" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar102" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar103" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar104" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar105" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar106" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_15_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar107" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar108" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar109" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar110" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar111" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar112" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar113" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar114" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar115" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar116" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar117" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar118" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar119" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar120" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar121" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar122" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar123" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar124" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar125" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar126" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar127" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar128" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar129" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar130" , dict = "anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity" , anim = "hi_dance_facedj_17_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar131" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar132" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar133" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar134" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar135" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar136" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar137" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar138" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar139" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar140" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar141" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar142" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar143" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar144" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar145" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar146" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar147" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar148" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar149" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar150" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar151" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar152" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar153" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar154" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_09_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar155" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar156" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar157" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar158" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar159" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar160" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar161" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar162" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar163" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar164" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar165" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar166" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_11_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar167" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar168" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar169" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar170" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar171" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar172" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar173" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar174" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar175" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar176" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar177" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar178" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_13_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar179" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar180" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar181" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar182" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar183" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar184" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar185" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar186" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar187" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar188" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar189" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar190" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar191" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar192" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar193" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar194" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar195" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar196" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar197" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar198" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar199" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar200" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar201" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar202" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_15_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar203" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar204" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^2" , andar = false , loop = true },
	{ nome = "dancar205" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^3" , andar = false , loop = true },
	{ nome = "dancar206" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^4" , andar = false , loop = true },
	{ nome = "dancar207" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^5" , andar = false , loop = true },
	{ nome = "dancar208" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_female^6" , andar = false , loop = true },
	{ nome = "dancar209" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^1" , andar = false , loop = true },
	{ nome = "dancar210" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^2" , andar = false , loop = true },
	{ nome = "dancar211" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^3" , andar = false , loop = true },
	{ nome = "dancar212" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^4" , andar = false , loop = true },
	{ nome = "dancar213" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^5" , andar = false , loop = true },
	{ nome = "dancar214" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v1_male^6" , andar = false , loop = true },
	{ nome = "dancar215" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^1" , andar = false , loop = true },
	{ nome = "dancar216" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^2" , andar = false , loop = true },
	{ nome = "dancar217" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^3" , andar = false , loop = true },
	{ nome = "dancar218" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^4" , andar = false , loop = true },
	{ nome = "dancar219" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^5" , andar = false , loop = true },
	{ nome = "dancar220" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_female^6" , andar = false , loop = true },
	{ nome = "dancar221" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^1" , andar = false , loop = true },
	{ nome = "dancar222" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^2" , andar = false , loop = true },
	{ nome = "dancar223" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^3" , andar = false , loop = true },
	{ nome = "dancar224" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^4" , andar = false , loop = true },
	{ nome = "dancar225" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar226" , dict = "anim@amb@nightclub@dancers@crowddance_groups@hi_intensity" , anim = "hi_dance_crowd_17_v2_male^6" , andar = false , loop = true },
	{ nome = "dancar227" , dict = "anim@amb@nightclub@lazlow@hi_podium@" , anim = "danceidle_hi_11_buttwiggle_b_laz" , andar = false , loop = true },
	{ nome = "dancar228" , dict = "timetable@tracy@ig_5@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "dancar229" , dict = "anim@mp_player_intupperfind_the_fish" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "dancar230" , dict = "anim@amb@nightclub@dancers@podium_dancers@" , anim = "hi_dance_facedj_17_v2_male^5" , andar = false , loop = true },
	{ nome = "dancar231" , dict = "anim@amb@nightclub@dancers@solomun_entourage@" , anim = "mi_dance_facedj_17_v1_female^1" , andar = false , loop = true },
	{ nome = "dancar232" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar233" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar234" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar235" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar236" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar237" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar238" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar239" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar240" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar241" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar242" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar243" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar244" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar245" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar246" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar247" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar248" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar249" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar250" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar251" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar252" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar253" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar254" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar255" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar256" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar257" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar258" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar259" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar260" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar261" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar262" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar263" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar264" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar265" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar266" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar267" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar268" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar269" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar270" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar271" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar272" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar273" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar274" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar275" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar276" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar277" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar278" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar279" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar280" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar281" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar282" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar283" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar284" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar285" , dict = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar286" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar287" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar288" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar289" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar290" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar291" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar292" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar293" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar294" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar295" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar296" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar297" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar298" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar299" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar300" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar301" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar302" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar303" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar304" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar305" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar306" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar307" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar308" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar309" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar310" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar311" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar312" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar313" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar314" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar315" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar316" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar317" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar318" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar319" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar320" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar321" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar322" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar323" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar324" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar325" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar326" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar327" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar328" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar329" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar330" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar331" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar332" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar333" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar334" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar335" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar336" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar337" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar338" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar339" , dict = "anim@amb@nightclub@mini@dance@dance_solo@male@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar340" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center" , andar = false , loop = true },
	{ nome = "dancar341" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center_down" , andar = false , loop = true },
	{ nome = "dancar342" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_center_up" , andar = false , loop = true },
	{ nome = "dancar343" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left" , andar = false , loop = true },
	{ nome = "dancar344" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left_down" , andar = false , loop = true },
	{ nome = "dancar345" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_left_up" , andar = false , loop = true },
	{ nome = "dancar346" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right" , andar = false , loop = true },
	{ nome = "dancar347" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right_down" , andar = false , loop = true },
	{ nome = "dancar348" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "high_right_up" , andar = false , loop = true },
	{ nome = "dancar349" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center" , andar = false , loop = true },
	{ nome = "dancar350" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center_down" , andar = false , loop = true },
	{ nome = "dancar351" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_center_up" , andar = false , loop = true },
	{ nome = "dancar352" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left" , andar = false , loop = true },
	{ nome = "dancar353" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left_down" , andar = false , loop = true },
	{ nome = "dancar354" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_left_up" , andar = false , loop = true },
	{ nome = "dancar355" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right" , andar = false , loop = true },
	{ nome = "dancar356" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right_down" , andar = false , loop = true },
	{ nome = "dancar357" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "low_right_up" , andar = false , loop = true },
	{ nome = "dancar358" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center" , andar = false , loop = true },
	{ nome = "dancar359" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center_down" , andar = false , loop = true },
	{ nome = "dancar360" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_center_up" , andar = false , loop = true },
	{ nome = "dancar361" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left" , andar = false , loop = true },
	{ nome = "dancar362" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left_down" , andar = false , loop = true },
	{ nome = "dancar363" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_left_up" , andar = false , loop = true },
	{ nome = "dancar364" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right" , andar = false , loop = true },
	{ nome = "dancar365" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right_down" , andar = false , loop = true },
	{ nome = "dancar366" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_a@" , anim = "med_right_up" , andar = false , loop = true },
	{ nome = "dancar367" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center" , andar = false , loop = true },	
	{ nome = "dancar368" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center_down" , andar = false , loop = true },	
	{ nome = "dancar369" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_center_up" , andar = false , loop = true },	
	{ nome = "dancar370" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left" , andar = false , loop = true },	
	{ nome = "dancar371" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left_down" , andar = false , loop = true },	
	{ nome = "dancar372" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_left_up" , andar = false , loop = true },	
	{ nome = "dancar373" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right" , andar = false , loop = true },	
	{ nome = "dancar374" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right_down" , andar = false , loop = true },	
	{ nome = "dancar375" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "high_right_up" , andar = false , loop = true },	
	{ nome = "dancar376" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center" , andar = false , loop = true },	
	{ nome = "dancar377" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center_down" , andar = false , loop = true },	
	{ nome = "dancar378" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_center_up" , andar = false , loop = true },	
	{ nome = "dancar379" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left" , andar = false , loop = true },	
	{ nome = "dancar380" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left_down" , andar = false , loop = true },	
	{ nome = "dancar381" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_left_up" , andar = false , loop = true },	
	{ nome = "dancar382" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right" , andar = false , loop = true },	
	{ nome = "dancar383" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right_down" , andar = false , loop = true },	
	{ nome = "dancar384" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "low_right_up" , andar = false , loop = true },	
	{ nome = "dancar385" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center" , andar = false , loop = true },	
	{ nome = "dancar386" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center_down" , andar = false , loop = true },	
	{ nome = "dancar387" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_center_up" , andar = false , loop = true },	
	{ nome = "dancar388" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left" , andar = false , loop = true },	
	{ nome = "dancar389" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left_down" , andar = false , loop = true },	
	{ nome = "dancar390" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_left_up" , andar = false , loop = true },	
	{ nome = "dancar391" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right" , andar = false , loop = true },	
	{ nome = "dancar392" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right_down" , andar = false , loop = true },	
	{ nome = "dancar393" , dict = "anim@amb@casino@mini@dance@dance_solo@female@var_b@" , anim = "med_right_up" , andar = false , loop = true },
	
	{ nome = "sexy1", dict = "littlespoon@sexy001" , anim = "sexy001" , andar = false , loop = true },
	{ nome = "sexy2", dict = "littlespoon@sexy002" , anim = "sexy002" , andar = false , loop = true },
	{ nome = "sexy3", dict = "littlespoon@sexy003" , anim = "sexy003" , andar = false , loop = true },
	{ nome = "sexy4", dict = "littlespoon@sexy004" , anim = "sexy004" , andar = false , loop = true },
	{ nome = "sexy5", dict = "littlespoon@sexy005" , anim = "sexy005" , andar = false , loop = true },
	{ nome = "sexy6", dict = "littlespoon@sexy006" , anim = "sexy006" , andar = false , loop = true },
	{ nome = "sexy7", dict = "littlespoon@sexy007" , anim = "sexy007" , andar = false , loop = true },
	{ nome = "sexy8", dict = "littlespoon@sexy008" , anim = "sexy008" , andar = false , loop = true },
	{ nome = "sexy9", dict = "littlespoon@sexy009" , anim = "sexy009" , andar = false , loop = true },
	{ nome = "sexy10", dict = "littlespoon@sexy010" , anim = "sexy010" , andar = false , loop = true },
	{ nome = "sexy11", dict = "littlespoon@sexy011" , anim = "sexy011" , andar = false , loop = true },
	{ nome = "sexy12", dict = "littlespoon@sexy012" , anim = "sexy012" , andar = false , loop = true },

	{ nome = "sexo" , dict = "rcmpaparazzo_2" , anim = "shag_loop_poppy" , andar = false , loop = true },
	{ nome = "sexo2" , dict = "rcmpaparazzo_2" , anim = "shag_loop_a" , andar = false , loop = true },
	{ nome = "sexo3" , dict = "anim@mp_player_intcelebrationfemale@air_shagging" , anim = "air_shagging" , andar = false , loop = true },
	{ nome = "sexo4" , dict = "oddjobs@towing" , anim = "m_blow_job_loop" , andar = false , loop = true , carros = true },
	{ nome = "sexo5" , dict = "oddjobs@towing" , anim = "f_blow_job_loop" , andar = false , loop = true , carros = true },
	{ nome = "sexo6" , dict = "mini@prostitutes@sexlow_veh" , anim = "low_car_sex_loop_female" , andar = false , loop = true , carros = true },
	{ nome = "sentar" , dict = "timetable@ron@ron_ig_2_alt1" , anim = "ig_2_alt1_base" , andar = false , loop = true },
	{ nome = "sentar2" , dict = "amb@world_human_picnic@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar3" , dict = "anim@heists@fleeca_bank@ig_7_jetski_owner" , anim = "owner_idle" , andar = false , loop = true },
	{ nome = "sentar4" , dict = "amb@world_human_stupor@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar5" , dict = "amb@world_human_picnic@female@base" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar6" , dict = "anim@amb@nightclub@lazlow@lo_alone@" , anim = "lowalone_base_laz" , andar = false , loop = true },
	{ nome = "sentar7" , dict = "anim@amb@business@bgen@bgen_no_work@" , anim = "sit_phone_phoneputdown_idle_nowork" , andar = false , loop = true },
	{ nome = "sentar8" , dict = "rcm_barry3" , anim = "barry_3_sit_loop" , andar = false , loop = true },
	{ nome = "sentar9" , dict = "amb@world_human_picnic@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar10" , dict = "amb@world_human_picnic@female@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar11" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "idle_a_jimmy" , andar = false , loop = true },
	{ nome = "sentar12" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_jimmy" , andar = false , loop = true },
	{ nome = "sentar13" , dict = "amb@world_human_stupor@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "sentar14" , dict = "timetable@tracy@ig_14@" , anim = "ig_14_base_tracy" , andar = false , loop = true },
	{ nome = "sentar15" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_loop_ped_b" , andar = false , loop = true },
	{ nome = "sentar16" , dict = "anim@heists@ornate_bank@hostages@ped_e@" , anim = "flinch_loop" , andar = false , loop = true },
	{ nome = "sentar17" , dict = "timetable@ron@ig_5_p3" , anim = "ig_5_p3_base" , andar = false , loop = true },
	{ nome = "sentar18" , dict = "timetable@reunited@ig_10" , anim = "base_amanda" , andar = false , loop = true },
	{ nome = "sentar19" , dict = "timetable@ron@ig_3_couch" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar20" , dict = "timetable@jimmy@mics3_ig_15@" , anim = "mics3_15_base_tracy" , andar = false , loop = true },
	{ nome = "sentar21" , dict = "timetable@maid@couch@" , anim = "base" , andar = false , loop = true },
	{ nome = "sentar22" , dict = "timetable@ron@ron_ig_2_alt1" , anim = "ig_2_alt1_base" , andar = false , loop = true },
	{ nome = "beijar" , dict = "mp_ped_interaction" , anim = "kisses_guy_a" , andar = false , loop = false },
	{ nome = "striper" , dict = "mini@strip_club@idles@stripper" , anim = "stripper_idle_02" , andar = false , loop = true },
	{ nome = "escutar" , dict = "mini@safe_cracking" , anim = "idle_base" , andar = false , loop = true },
	{ nome = "alongar" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_e" , andar = false , loop = true },
	{ nome = "dj" , dict = "anim@mp_player_intupperdj" , anim = "idle_a", andar = true , loop = true },
	{ nome = "rock" , dict = "anim@mp_player_intcelebrationmale@air_guitar" , anim = "air_guitar" , andar = false , loop = true },
	{ nome = "rock2" , dict = "mp_player_introck" , anim = "mp_player_int_rock" , andar = false , loop = false },
	{ nome = "abracar" , dict = "mp_ped_interaction" , anim = "hugs_guy_a" , andar = false , loop = false },
	{ nome = "abracar2" , dict = "mp_ped_interaction" , anim = "kisses_guy_b" , andar = false , loop = false },
	{ nome = "peitos" , dict = "mini@strip_club@backroom@" , anim = "stripper_b_backroom_idle_b" , andar = false , loop = false },
	{ nome = "espernear" , dict = "missfam4leadinoutmcs2" , anim = "tracy_loop" , andar = false , loop = true },
	{ nome = "arrumar" , dict = "anim@amb@business@coc@coc_packing_hi@" , anim = "full_cycle_v1_pressoperator" , andar = false , loop = true },
	{ nome = "bebado" , dict = "missfam5_blackout" , anim = "pass_out" , andar = false , loop = false },
	{ nome = "bebado2" , dict = "missheist_agency3astumble_getup" , anim = "stumble_getup" , andar = false , loop = false },
	{ nome = "bebado3" , dict = "missfam5_blackout" , anim = "vomit" , andar = false , loop = false },
	{ nome = "bebado4" , dict = "random@drunk_driver_1" , anim = "drunk_fall_over" , andar = false , loop = false },
	{ nome = "yoga" , dict = "missfam5_yoga" , anim = "f_yogapose_a" , andar = false , loop = true },
	{ nome = "yoga2" , dict = "amb@world_human_yoga@male@base" , anim = "base_a" , andar = false , loop = true },
	{ nome = "abdominal" , dict = "amb@world_human_sit_ups@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "bixa" , anim = "WORLD_HUMAN_PROSTITUTE_LOW_CLASS" },
	{ nome = "britadeira" , dict = "amb@world_human_const_drill@male@drill@base" , anim = "base" , prop = "prop_tool_jackham" , flag = 15 , hand = 28422 },
	{ nome = "cerveja" , anim = "WORLD_HUMAN_PARTYING" },
	{ nome = "churrasco" , anim = "PROP_HUMAN_BBQ" },
	{ nome = "consertar" , anim = "WORLD_HUMAN_WELDING" },
	{ nome = "dormir" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_react_die_loop_ped_a" , andar = false , loop = true },
	{ nome = "dormir2" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_react_die_loop_ped_e" , andar = false , loop = true },
	{ nome = "dormir3" , dict = "anim@heists@ornate_bank@hostages@hit" , anim = "hit_react_die_loop_ped_h" , andar = false , loop = true },
	{ nome = "dormir4" , dict = "mp_sleep" , anim = "sleep_loop" , andar = false , loop = true },
	{ nome = "encostar" , dict = "amb@lo_res_idles@" , anim = "world_human_lean_male_foot_up_lo_res_base" , andar = false , loop = true },
	{ nome = "encostar2" , dict = "bs_2a_mcs_10-0" , anim = "hc_gunman_dual-0" , andar = false , loop = true },
	{ nome = "encostar3" , dict = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , andar = false , loop = true },
	{ nome = "encostar4" , dict = "anim@amb@casino@out_of_money@ped_female@02b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar5" , dict = "anim@amb@casino@hangout@ped_male@stand@03b@base" , anim = "base" , andar = true , loop = true },
	{ nome = "encostar6" , dict = "anim@amb@casino@hangout@ped_female@stand@02b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar7" , dict = "anim@amb@casino@hangout@ped_female@stand@02a@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar8" , dict = "anim@amb@casino@hangout@ped_female@stand@01b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "encostar9" , dict = "anim@amb@clubhouse@bar@bartender@" , anim = "base_bartender" , andar = false , loop = true },
	{ nome = "encostar10" , dict = "missclothing" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "encostar11" , dict = "misscarstealfinale" , anim = "packer_idle_1_trevor" , andar = false , loop = true },
	{ nome = "encostar12" , dict = "missarmenian1leadinoutarm_1_ig_14_leadinout" , anim = "leadin_loop" , andar = false , loop = true },
	{ nome = "estatua" , dict = "amb@world_human_statue@base" , anim = "base" , andar = false , loop = true },
	{ nome = "flexao" , dict = "amb@world_human_push_ups@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "fumar" , anim = "WORLD_HUMAN_SMOKING" },
	{ nome = "fumar2" , anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS" },
	{ nome = "fumar3" , anim = "WORLD_HUMAN_AA_SMOKE" },
	{ nome = "fumar4" , anim = "WORLD_HUMAN_SMOKING_POT" },
	{ nome = "malhar" , dict = "amb@world_human_muscle_free_weights@male@barbell@base" , anim = "base" , prop = "prop_curl_bar_01" , flag = 49 , hand = 28422 },
	{ nome = "malhar2" , dict = "amb@prop_human_muscle_chin_ups@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "martelo" , dict = "amb@world_human_hammering@male@base" , anim = "base" , prop = "prop_tool_hammer" , flag = 49 , hand = 28422 },
	{ nome = "pescar" , dict = "amb@world_human_stand_fishing@base" , anim = "base" , prop = "prop_fishing_rod_01" , flag = 49 , hand = 60309 },
	{ nome = "pescar2" , dict = "amb@world_human_stand_fishing@idle_a" , anim = "idle_c" , prop = "prop_fishing_rod_01" , flag = 49 , hand = 60309 },
	{ nome = "plantar" , dict = "amb@world_human_gardener_plant@female@base" , anim = "base_female" , andar = false , loop = true },
	{ nome = "plantar2" , dict = "amb@world_human_gardener_plant@female@idle_a" , anim = "idle_a_female" , andar = false , loop = true },
	{ nome = "procurar" , dict = "amb@world_human_bum_wash@male@high@base" , anim = "base" , andar = false , loop = true },
	{ nome = "soprador" , dict = "amb@code_human_wander_gardener_leaf_blower@base" , anim = "static" , prop = "prop_leaf_blower_01" , flag = 49 , hand = 28422 },
	{ nome = "soprador2" , dict = "amb@code_human_wander_gardener_leaf_blower@idle_a" , anim = "idle_a" , prop = "prop_leaf_blower_01" , flag = 49 , hand = 28422 },
	{ nome = "soprador3" , dict = "amb@code_human_wander_gardener_leaf_blower@idle_a" , anim = "idle_b" , prop = "prop_leaf_blower_01" , flag = 49 , hand = 28422 },
	{ nome = "tragar" , anim = "WORLD_HUMAN_DRUG_DEALER" },
	{ nome = "trotar" , dict = "amb@world_human_jog_standing@male@fitidle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "esquentar" , anim = "WORLD_HUMAN_STAND_FIRE" },
	{ nome = "selfie" , dict = "cellphone@self" , anim = "selfie_in_from_text" , prop = "prop_amb_phone" , flag = 50 , hand = 28422 },
	{ nome = "selfie2" , dict = "cellphone@" , anim = "cellphone_text_read_base_cover_low" , prop = "prop_amb_phone" , flag = 50 , hand = 28422 },
	{ nome = "mecanico" , dict = "amb@world_human_vehicle_mechanic@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "mecanico2" , dict = "mini@repair" , anim = "fixing_a_player" , andar = false , loop = true },
	{ nome = "mecanico3" , dict = "mini@repair" , anim = "fixing_a_ped" , andar = false , loop = true },
	{ nome = "pullover" , dict = "misscarsteal3pullover" , anim = "pull_over_right" , andar = false , loop = false },
	{ nome = "airguitar" , dict = "anim@mp_player_intcelebrationfemale@air_guitar" , anim = "air_guitar" , andar = false , loop = true },
	{ nome = "airsynth" , dict = "anim@mp_player_intcelebrationfemale@air_synth" , anim = "air_synth" , andar = false , loop = true },
	{ nome = "puto" , dict = "misscarsteal4@actor" , anim = "actor_berating_loop" , andar = true , loop = true },
	{ nome = "puto2" , dict = "oddjobs@assassinate@vice@hooker" , anim = "argue_a" , andar = true , loop = true },
	{ nome = "puto3" , dict = "mini@triathlon" , anim = "want_some_of_this" , andar = false , loop = false },
	{ nome = "unhas" , dict = "anim@amb@clubhouse@bar@drink@idle_a" , anim = "idle_a_bartender" , andar = true , loop = true },
	{ nome = "mandarbeijo" , dict = "anim@mp_player_intcelebrationfemale@blow_kiss" , anim = "blow_kiss" , andar = false , loop = false },
	{ nome = "mandarbeijo2" , dict = "anim@mp_player_intselfieblow_kiss" , anim = "exit" , andar = false , loop = false },
	{ nome = "bale" , dict = "anim@mp_player_intcelebrationpaired@f_f_sarcastic" , anim = "sarcastic_left" , andar = false , loop = true },
	{ nome = "bonzao" , dict = "misscommon@response" , anim = "bring_it_on" , andar = false , loop = false },
	{ nome = "cruzarbraco" , dict = "anim@amb@nightclub@peds@" , anim = "rcmme_amanda1_stand_loop_cop" , andar = true , loop = true },
	{ nome = "cruzarbraco2" , dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "wtf" , dict = "anim@mp_player_intcelebrationfemale@face_palm" , anim = "face_palm" , andar = true , loop = false },
	{ nome = "wtf2" , dict = "random@car_thief@agitated@idle_a" , anim = "agitated_idle_a" , andar = true , loop = false },
	{ nome = "wtf3" , dict = "missminuteman_1ig_2" , anim = "tasered_2" , andar = true , loop = false },
	{ nome = "wtf4" , dict = "anim@mp_player_intupperface_palm" , anim = "idle_a" , andar = true , loop = false },
	{ nome = "suicidio" , dict = "mp_suicide" , anim = "pistol" , andar = false , loop = false },
	{ nome = "suicidio2" , dict = "mp_suicide" , anim = "pill" , andar = false , loop = false },
	{ nome = "lutar" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_c" , andar = false , loop = false },
	{ nome = "lutar2" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_e" , andar = false , loop = false },
	{ nome = "dedo" , dict = "anim@mp_player_intcelebrationfemale@finger" , anim = "finger" , andar = true , loop = false },
	{ nome = "dedo2" , dict = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_a_1st" , andar = false , loop = false },
	{ nome = "dedo3" , dict = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_c_1st" , andar = true , loop = false },
	{ nome = "mochila" , dict = "move_m@hiking" , anim = "idle" , andar = true , loop = true },
	{ nome = "inspect" , dict = "random@train_tracks" , anim = "idle_e" , andar = false , loop = false },
	{ nome = "exercicios" , dict = "timetable@reunited@ig_2" , anim = "jimmy_getknocked" , andar = true , loop = true },
	{ nome = "escorar" , dict = "timetable@mime@01_gc" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "escorar2" , dict = "misscarstealfinale" , anim = "packer_idle_1_trevor" , andar = false , loop = true },
	{ nome = "escorar3" , dict = "misscarstealfinalecar_5_ig_1" , anim = "waitloop_lamar" , andar = false , loop = true },
	{ nome = "escorar4" , dict = "rcmjosh2" , anim = "josh_2_intp1_base" , andar = false , loop = true },
	{ nome = "meditar" , dict = "rcmcollect_paperleadinout@" , anim = "meditiate_idle" , andar = false , loop = true },
	{ nome = "meditar2" , dict = "rcmepsilonism3" , anim = "ep_3_rcm_marnie_meditating" , andar = false , loop = true },
	{ nome = "meditar3" , dict = "rcmepsilonism3" , anim = "base_loop" , andar = false , loop = true },
	{ nome = "meleca2" , dict = "anim@mp_player_intcelebrationfemale@nose_pick" , anim = "nose_pick" , andar = false , loop = false },
	{ nome = "cortaessa" , dict = "gestures@m@standing@casual" , anim = "gesture_no_way" , andar = false , loop = false },
	{ nome = "meleca3" , dict = "move_p_m_two_idles@generic" , anim = "fidget_sniff_fingers" , andar = true , loop = false },
	{ nome = "bebado5" , dict = "misscarsteal4@actor" , anim = "stumble" , andar = false , loop = false },
	{ nome = "joia" , dict = "anim@mp_player_intincarthumbs_uplow@ds@" , anim = "enter" , andar = false , loop = false },
	{ nome = "joia2" , dict = "anim@mp_player_intselfiethumbs_up" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "yeah" , dict = "anim@mp_player_intupperair_shagging" , anim = "idle_a" , andar = false , loop = false },
	{ nome = "tablet" , dict = "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a" , anim = "idle_b" , prop = "prop_cs_tablet" , flag = 49 , hand = 60309 },
	{ nome = "inspec" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_b" , andar = false , loop = true },
	{ nome = "inspec2" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_c" , andar = false , loop = false },
	{ nome = "inspec3" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_d" , andar = false , loop = false },
	{ nome = "inspec4" , dict = "anim@deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_e" , andar = false , loop = false },
	{ nome = "inspec5" , dict = "mp_deathmatch_intros@1hmale" , anim = "intro_male_1h_a_michael" , andar = false , loop = false },
	{ nome = "inspec6" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_a" , andar = false , loop = false },
	{ nome = "inspec7" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_b" , andar = false , loop = false },
	{ nome = "inspec8" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_c" , andar = false , loop = false },
	{ nome = "inspec9" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_d" , andar = false , loop = false },
	{ nome = "inspec10" , dict = "mp_deathmatch_intros@melee@1h" , anim = "intro_male_melee_1h_e" , andar = false , loop = false },
	{ nome = "inspec11" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_a" , andar = false , loop = false },
	{ nome = "inspec12" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_b" , andar = false , loop = false },
	{ nome = "inspec13" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_c" , andar = false , loop = false },
	{ nome = "inspec14" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_d" , andar = false , loop = false },
	{ nome = "inspec15" , dict = "mp_deathmatch_intros@melee@2h" , anim = "intro_male_melee_2h_e" , andar = false , loop = false },
	{ nome = "inspec16" , dict = "anim@deathmatch_intros@1hmale" , anim = "intro_male_1h_d_michael" , andar = true , loop = false },
	{ nome = "swat" , dict = "swat" , anim = "come" , andar = true , loop = false },
	{ nome = "swat2" , dict = "swat" , anim = "freeze" , andar = true , loop = false },
	{ nome = "swat3" , dict = "swat" , anim = "go_fwd" , andar = true , loop = false },
	{ nome = "swat4" , dict = "swat" , anim = "rally_point" , andar = true , loop = false },
	{ nome = "swat5" , dict = "swat" , anim = "understood" , andar = true , loop = false },
	{ nome = "swat6" , dict = "swat" , anim = "you_back" , andar = true , loop = false },
	{ nome = "swat7" , dict = "swat" , anim = "you_fwd" , andar = true , loop = false },
	{ nome = "swat8" , dict = "swat" , anim = "you_left" , andar = true , loop = false },
	{ nome = "swat9" , dict = "swat" , anim = "you_right" , andar = true , loop = false },
	{ nome = "casalm" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedontknowwhy_trevor" , andar = false , loop = true },
    { nome = "casalf" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedontknowwhy_patricia" , andar = false , loop = true },
    { nome = "casalm2" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedesertissobeautiful_trevor" , andar = false , loop = true },
    { nome = "casalf2" , dict = "timetable@trevor@ig_1" , anim = "ig_1_thedesertissobeautiful_patricia" , andar = false , loop = true },
	{ nome = "poledance" , dict = "mini@strip_club@pole_dance@pole_dance1" , anim = "pd_dance_01" , andar = false , loop = true },
	{ nome = "poledance2" , dict = "mini@strip_club@pole_dance@pole_dance2" , anim = "pd_dance_02" , andar = false , loop = true },
	{ nome = "poledance3" , dict = "mini@strip_club@pole_dance@pole_dance3" , anim = "pd_dance_03" , andar = false , loop = true },
	{ nome = "assobiar" , dict = "taxi_hail" , anim = "hail_taxi" , andar = false , loop = false },
	{ nome = "carona" , dict = "random@hitch_lift" , anim = "idle_f" , andar = true , loop = false },
	{ nome = "estatua2" , dict = "fra_0_int-1" , anim = "cs_lamardavis_dual-1" , andar = false , loop = true },
	{ nome = "estatua3" , dict = "club_intro2-0" , anim = "csb_englishdave_dual-0" , andar = false , loop = true },
	{ nome = "dormir5" , dict = "missarmenian2" , anim = "drunk_loop" , andar = false , loop = true },
	{ nome = "colher" , dict = "creatures@rottweiler@tricks@" , anim = "petting_franklin" , andar = false , loop = false },
	{ nome = "rastejar" , dict = "move_injured_ground" , anim = "front_loop" , andar = false , loop = true },
	{ nome = "pirueta" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "cap_a_player_a" , andar = false , loop = false },
	{ nome = "pirueta2" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "flip_a_player_a" , andar = false , loop = false },
	{ nome = "fodase" , dict = "anim@arena@celeb@podium@no_prop@" , anim = "flip_off_a_1st" , andar = false , loop = false },
	{ nome = "taco" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim = "slugger_a_player_a" , andar = false , loop = false },
	{ nome = "onda" , dict = "anim@mp_player_intupperfind_the_fish" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "alongar3" , dict = "mini@triathlon" , anim = "idle_f" , andar = false , loop = true },
	{ nome = "alongar4" , dict = "mini@triathlon" , anim = "idle_d" , andar = false , loop = true },
	{ nome = "alongar5" , dict = "rcmfanatic1maryann_stretchidle_b" , anim = "idle_e" , andar = false , loop = true },
	{ nome = "lutar3" , dict = "rcmextreme2" , anim = "loop_punching" , andar = true , loop = true },
	{ nome = "heroi" , dict = "rcmbarry" , anim = "base" , andar = true , loop = true },
	{ nome = "boboalegre" , dict = "rcm_barry2" , anim = "clown_idle_0" , andar = false , loop = false },
	{ nome = "boboalegre2" , dict = "rcm_barry2" , anim = "clown_idle_1" , andar = false , loop = false },
	{ nome = "boboalegre3" , dict = "rcm_barry2" , anim = "clown_idle_2" , andar = false , loop = false },
	{ nome = "boboalegre4" , dict = "rcm_barry2" , anim = "clown_idle_3" , andar = false , loop = false },
	{ nome = "boboalegre4" , dict = "rcm_barry2" , anim = "clown_idle_6" , andar = false , loop = false },
	{ nome = "meditar4" , dict = "timetable@amanda@ig_4" , anim = "ig_4_base" , andar = false , loop = true },
	{ nome = "passaro" , dict = "random@peyote@bird" , anim = "wakeup" , andar = false , loop = false },
	{ nome = "cachorro" , dict = "random@peyote@dog" , anim = "wakeup" , andar = false , loop = false },
	{ nome = "karate" , dict = "anim@mp_player_intcelebrationfemale@karate_chops" , anim = "karate_chops" , andar = false , loop = false },
	{ nome = "karate2" , dict = "anim@mp_player_intcelebrationmale@karate_chops" , anim = "karate_chops" , andar = false , loop = false },
	{ nome = "ameacar" , dict = "anim@mp_player_intcelebrationmale@cut_throat" , anim = "cut_throat" , andar = false , loop = false },
	{ nome = "ameacar2" , dict = "anim@mp_player_intcelebrationfemale@cut_throat" , anim = "cut_throat" , andar = false , loop = false },
	{ nome = "boxe" , dict = "anim@mp_player_intcelebrationmale@shadow_boxing" , anim = "shadow_boxing" , andar = false , loop = false },
	{ nome = "boxe2" , dict = "anim@mp_player_intcelebrationfemale@shadow_boxing" , anim = "shadow_boxing" , andar = false , loop = false },
    { nome = "mamamia" , dict = "anim@mp_player_intcelebrationmale@finger_kiss" , anim = "finger_kiss" , andar = true , loop = false },
    { nome = "louco" , dict = "anim@mp_player_intincaryou_locobodhi@ds@" , anim = "idle_a" , andar = true , loop = true },
    { nome = "xiu" , dict = "anim@mp_player_intincarshushbodhi@ds@" , anim = "idle_a_fp" , andar = true , loop = true },
    { nome = "cruzar" , dict = "amb@world_human_cop_idles@female@idle_b" , anim = "idle_e" , andar = true , loop = true },
	{ nome = "cruzar2" , dict = "anim@amb@casino@hangout@ped_male@stand@02b@idles" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "cruzar3" , dict = "amb@world_human_hang_out_street@male_c@idle_a" , anim = "idle_b" , andar = true , loop = true },
	{ nome = "cruzar4" , dict = "random@street_race" , anim = "_car_b_lookout" , andar = true , loop = true },
	{ nome = "cruzar5" , dict = "random@shop_gunstore" , anim = "_idle" , andar = true , loop = true },
	{ nome = "cruzar6" , dict = "move_m@hiking" , anim = "idle" , andar = true , loop = true },
	{ nome = "cruzar7" , dict = "anim@amb@casino@valet_scenario@pose_d@" , anim = "base_a_m_y_vinewood_01" , andar = true , loop = true },
	{ nome = "cruzar8" , dict = "anim@amb@casino@shop@ped_female@01a@base" , anim = "base" , andar = true , loop = true },
	{ nome = "cruzar9" , dict = "anim@amb@casino@valet_scenario@pose_c@" , anim = "shuffle_feet_a_m_y_vinewood_01" , andar = true , loop = true },
	{ nome = "cruzar10" , dict = "anim@amb@casino@hangout@ped_male@stand@03a@idles_convo" , anim = "idle_a" , andar = true , loop = true },
	{ nome = "fera" , dict = "anim@mp_fm_event@intro" , anim = "beast_transform" , andar = true , loop = false },
	{ nome = "foto" , dict = "amb@lo_res_idles@" , anim ="world_human_lean_male_hands_together_lo_res_base" , andar = false , loop = true },
	{ nome = "foto1" , dict = "amb@code_human_cross_road@female@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto2" , dict = "amb@code_human_in_car_mp_actions@tit_squeeze@bodhi@rps@base" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto3" , dict = "amb@world_human_hang_out_street@female_arm_side@enter" , anim ="enter" , andar = false , loop = true },
	{ nome = "foto4" , dict = "amb@world_human_hang_out_street@female_arm_side@idle_a" , anim ="idle_b" , andar = false , loop = true },
	{ nome = "foto5" , dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a" , anim ="idle_b" , andar = false , loop = true },
	{ nome = "foto6" , dict = "friends@" , anim ="pickupwait" , andar = false , loop = true },
	{ nome = "foto7" , dict = "mini@hookers_sp" , anim ="idle_reject_loop_a" , andar = false , loop = true },
	{ nome = "foto8" , dict = "misscarsteal2" , anim ="sweep_high" , andar = false , loop = true },
	{ nome = "foto9" , dict = "missheist_agency3aig_23" , anim ="urinal_base" , andar = false , loop = true },
	{ nome = "foto10" , dict = "misstrevor2ron_basic_moves" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto11" , dict = "oddjobs@basejump@" , anim ="ped_a_loop" , andar = false , loop = true },
	{ nome = "foto12" , dict = "rcmjosh1" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto13" , dict = "switch@franklin@plays_w_dog" , anim ="001916_01_fras_v2_9_plays_w_dog_idle" , andar = false , loop = true },
	{ nome = "foto14" , dict = "timetable@amanda@ig_9" , anim ="ig_9_base_amanda" , andar = false , loop = true },
	{ nome = "foto15" , dict = "misscommon@response" , anim ="bring_it_on" , andar = false , loop = true },
	{ nome = "foto16" , dict = "cover@first_person@move@base@core" , anim ="low_idle_l_facecover" , andar = false , loop = true },
	{ nome = "foto17" , dict = "cover@weapon@core" , anim ="idle_turn_stop" , andar = false , loop = true },
	{ nome = "foto18" , dict = "anim@amb@casino@hangout@ped_female@stand@02b@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto19" , dict = "anim@amb@casino@hangout@ped_male@stand@01a@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto20" , dict = "anim@amb@casino@out_of_money@ped_male@01b@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto21" , dict = "anim@amb@casino@shop@ped_female@01a@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto22" , dict = "anim@mp_corona_idles@female_c@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto23" , dict = "anim@random@shop_clothes@watches" , anim ="base" , andar = false , loop = true },
	{ nome = "foto24" , dict = "iaa_int-11" , anim ="csb_avon_dual-11" , andar = false , loop = true },
	{ nome = "foto25" , dict = "mini@strip_club@lap_dance@ld_girl_a_approach" , anim ="ld_girl_a_approach_f" , andar = false , loop = true },
    { nome = "foto26" , dict = "amb@code_human_in_car_mp_actions@rock@bodhi@rps@base" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto27" , dict = "mini@hookers_spcrackhead" , anim ="idle_reject_loop_c" , andar = false , loop = true },
	{ nome = "foto28" , dict = "anim@mp_player_intupperfinger" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto29" , dict = "switch@franklin@lamar_tagging_wall" , anim ="lamar_tagging_wall_loop_franklin" , andar = false , loop = true },
	{ nome = "foto30" , dict = "mp_move@prostitute@m@cokehead" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto31" , dict = "anim@amb@casino@valet_scenario@pose_c@" , anim ="base_a_m_y_vinewood_01" , andar = false , loop = true },
	{ nome = "foto32" , dict = "anim@amb@casino@valet_scenario@pose_d@" , anim ="look_ahead_l_a_m_y_vinewood_01" , andar = false , loop = true },
	{ nome = "foto33" , dict = "anim@special_peds@casino@beth@wheel@" , anim ="action10_beth" , andar = false , loop = true },
	{ nome = "foto34" , dict = "anim@special_peds@casino@beth@wheel@" , anim ="action2_beth" , andar = false , loop = true },
	{ nome = "foto35" , dict = "anim@mp_player_intcelebrationfemale@v_sign" , anim ="v_sign" , andar = false , loop = true },
	{ nome = "foto36" , dict = "mini@strip_club@idles@stripper" , anim ="stripper_idle_03" , andar = false , loop = true },
	{ nome = "foto37" , dict = "mini@strip_club@idles@stripper" , anim ="stripper_idle_04" , andar = false , loop = true },
	{ nome = "foto38" , dict = "anim_heist@arcade@fortune@female@" , anim ="reaction_pondering" , andar = false , loop = true },
	{ nome = "foto39" , dict = "anim@mp_player_intcelebrationfemale@peace" , anim ="peace" , andar = false , loop = true },
	{ nome = "foto40" , dict = "missfbi3_party_d" , anim ="stand_talk_loop_b_female" , andar = false , loop = true },
	{ nome = "foto41" , dict = "armenian_1_int-44" , anim ="a_m_y_musclbeac_01^1_dual-44" , andar = false , loop = true },
	{ nome = "foto42" , dict = "mp_clothing@female@trousers" , anim ="try_trousers_positive_a" , andar = false , loop = true },
	{ nome = "foto43" , dict = "silj_ext-19" , anim ="mp_m_freemode_01^3_dual-19" , andar = false , loop = true },
	{ nome = "foto44" , dict = "sdrm_mcs_2-0" , anim ="ig_bestmen^1-0" , andar = false , loop = true },
	{ nome = "foto45" , dict = "anim_heist@arcade_combined@" , anim ="ped_female@_stand@_02a@_idles_convo_idle_c" , andar = false , loop = true },
	{ nome = "foto46" , dict = "anim@arena@celeb@flat@solo@no_props@" , anim ="thumbs_down_a_player_a" , andar = false , loop = true },
	{ nome = "foto47" , dict = "guard_reactions" , anim ="1hand_aiming_cycle" , andar = false , loop = true },
	{ nome = "foto48" , dict = "anim@move_f@waitress" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto49" , dict = "anim_heist@arcade_combined@" , anim ="ped_female@_stand_withdrink@_01b@_base_base" , andar = false , loop = true },
	{ nome = "foto50" , dict = "amb@lo_res_idles@" , anim ="world_human_security_shine_torch_lo_res_base" , andar = false , loop = true },
	{ nome = "foto51" , dict = "rcmjosh2" , anim ="stand_lean_back_beckon_a" , andar = false , loop = true },
    { nome = "foto52" , dict = "rcmjosh2" , anim ="stand_lean_back_beckon_b" , andar = false , loop = true },
	{ nome = "foto53" , dict = "pro_mcs_7_concat-1" , anim ="cs_priest_dual-1" , andar = false , loop = true },
	{ nome = "foto54" , dict = "clothingshirt" , anim ="try_shirt_base" , andar = false , loop = true },
	{ nome = "foto55" , dict = "special_ped@pamela@trevor_1@trevor_1a" , anim ="pamela_convo_trevor_im_trying_to_get_noticed_0" , andar = false , loop = true },
    { nome = "foto56" , dict = "special_ped@impotent_rage@intro" , anim ="idle_intro" , andar = false , loop = true },
	{ nome = "foto57" , dict = "random@escape_paparazzi@standing@" , anim ="idle" , andar = false , loop = true },
	{ nome = "foto58" , dict = "pro_mcs_7_concat-8" , anim ="player_two_dual-8" , andar = false , loop = true },
	{ nome = "foto59" , dict = "anim@heists@ornate_bank@thermal_charge" , anim ="cover_eyes_loop" , andar = false , loop = true },
	{ nome = "foto60" , dict = "low_fun_int-7" , anim ="cs_lamardavis_dual-7" , andar = false , loop = true },
    { nome = "foto61" , dict = "tale_intro-12" , anim ="a_f_y_genhot_01^2_dual-12" , andar = false , loop = true },
	{ nome = "foto62" , dict = "amb@code_human_police_investigate@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto63" , dict = "anim@mp_player_intincarpeacebodhi@ds@" , anim ="enter" , andar = false , loop = true },
	{ nome = "foto64" , dict = "anim@mp_corona_idles@female_c@idle_a" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto65" , dict = "anim@miss@low@fin@vagos@" , anim ="idle_ped07" , andar = false , loop = true },
	{ nome = "foto66" , dict = "oddjobs@assassinate@multi@" , anim ="idle_a_pros" , andar = false , loop = true },
	{ nome = "foto67" , dict = "timetable@jimmy@ig_5@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto68" , dict = "rcmnigel1bnmt_1b" , anim ="base_tyler" , andar = false , loop = true },
	{ nome = "foto69" , dict = "mp_fm_intro_cut" , anim ="world_human_standing_male_01_idle_03" , andar = false , loop = true },
	{ nome = "foto70" , dict = "mic_4_int-0" , anim ="a_f_y_bevhills_04-0" , andar = false , loop = true },
	{ nome = "foto71" , dict = "mic_4_int-0" , anim ="cs_milton_dual-0" , andar = false , loop = true },
	{ nome = "foto72" , dict = "cellphone@self@franklin@" , anim ="west_coast" , andar = false , loop = true },
	{ nome = "foto73" , dict = "anim@random@shop_clothes@watches" , anim ="idle_d" , andar = false , loop = true },
	{ nome = "foto74" , dict = "amb@world_human_muscle_flex@arms_in_front@idle_a" , anim ="idle_b" , andar = false , loop = true },
	{ nome = "foto75" , dict = "amb@world_human_prostitute@crackhooker@idle_a" , anim ="idle_c" , andar = false , loop = true },
	{ nome = "foto76" , dict = "amb@world_human_prostitute@hooker@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto77" , dict = "anim@mp_player_intupperfinger" , anim ="idle_a" , andar = false , loop = true },
	{ nome = "foto78" , dict = "anim@mp_player_intcelebrationmale@blow_kiss" , anim ="blow_kiss" , andar = false , loop = true },
	{ nome = "foto79" , dict = "anim@mp_player_intcelebrationmale@knuckle_crunch" , anim ="knuckle_crunch" , andar = false , loop = true },
	{ nome = "foto80" , dict = "anim@mp_player_intupperthumbs_up" , anim ="idle_a_fp" , andar = false , loop = true },
	{ nome = "foto81" , dict = "switch@michael@prostitute" , anim ="exit_hooker" , andar = false , loop = true },
	{ nome = "foto82" , dict = "mp_player_int_upperbro_love" , anim ="mp_player_int_bro_love_fp" , andar = false , loop = true },
	{ nome = "foto83" , dict = "hs3_arc_int-9" , anim ="csb_georginacheng_dual-9" , andar = false , loop = true },
	{ nome = "foto84" , dict = "armenian_1_int-0" , anim ="a_f_y_beach_01_dual-0" , andar = false , loop = true },
	{ nome = "foto85" , dict = "armenian_1_int-0" , anim ="a_f_y_hipster_02^2-0" , andar = false , loop = true },
	{ nome = "foto86" , dict = "armenian_1_int-0" , anim ="a_f_y_tourist_01^2-0" , andar = false , loop = true },
	{ nome = "foto87" , dict = "armenian_1_int-0" , anim ="a_m_y_beach_03-0" , andar = false , loop = true },
	{ nome = "foto88" , dict = "special_ped@pamela@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto89" , dict = "mp_fm_intro_cut" , anim ="world_human_standing_male_01_idle_01" , andar = false , loop = true },
	{ nome = "foto90" , dict = "amb@world_human_leaning@female@smoke@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto91" , dict = "amb@world_human_leaning@female@wall@back@hand_up@base" , anim ="base" , andar = false , loop = true },
	{ nome = "foto92" , dict = "amb@code_human_cross_road@female@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto93" , dict = "anim@heists@heist_corona@single_team" , anim = "single_team_intro_boss" , andar = false , loop = true },
	{ nome = "foto94" , dict = "amb@incar@male@smoking@idle_a" , anim = "idle_b" , andar = false , loop = true },
	{ nome = "foto95" , anim = "idle_a" , dict  = "anim@amb@casino@hangout@ped_male@stand@02b@idles" , andar = false , loop = true },
	{ nome = "foto96" , anim = "rub_neck_a_m_y_vinewood_01" , dict  = "anim@amb@casino@valet_scenario@pose_c@" , andar = false , loop = true },
	{ nome = "foto97" , dict = "anim@mp_player_intuppershush" , anim = "idle_a_fp" , andar = false , loop = true },
	{ nome = "foto98" , anim = "_car_a_flirt_girl" , dict  = "random@street_race" , andar = false , loop = true },
	{ nome = "foto99" , dict = "misshair_shop@barbers" , anim = "keeper_base" , andar = false , loop = true },
	{ nome = "foto100" , dict = "cellphone@self@franklin@" , anim = "chest_bump" , andar = false , loop = true },
    { nome = "foto101" , dict = "amb@world_human_leaning@male@wall@back@foot_up@aggro_react" , anim = "aggro_react_forward_enter", andar = false , loop = true },
    { nome = "foto102" , dict = "martin_1_int-0" , anim = "cs_patricia_dual-0" , andar = false , loop = true },
    { nome = "foto103" , dict = "mini@strip_club@lap_dance_2g@ld_2g_decline" , anim = "ld_2g_decline_h_s2" , andar = false , loop = true },
    { nome = "foto104" , anim = "stripper_idle_03" , dict  = "mini@strip_club@idles@stripper" , andar = false , loop = true },
    { nome = "foto105" , dict = "amb@world_human_binoculars@male@base" , anim ="base" , andar = false , loop = true },
    { nome = "foto106" , dict = "amb@world_human_tourist_mobile@male@base" , anim ="base" , andar = false , loop = true },
    { nome = "foto107" , dict = "anim@amb@board_room@whiteboard@" , anim ="read_03_amy_skater_01" , andar = false , loop = true },
    { nome = "foto108" , dict = "anim@heists@team_respawn@variations@variation_b_rot" , anim ="respawn_b_ped_c" , andar = false , loop = true },
	{ nome = "foto109" , anim = "idle_d" , dict  = "anim@amb@casino@hangout@ped_female@stand@01a@idles" , andar = false , loop = true },
	{ nome = "foto110" , dict = "amb@world_human_stand_guard@male@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "foto111" , dict = "amb@world_human_tourist_mobile@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto112" , dict = "switch@michael@pharmacy" , anim = "mics1_ig_11_loop" , andar = false , loop = true },
	{ nome = "foto113" , dict = "weapons@first_person@aim_idle@p_m_one@unarmed@fidgets@c" , anim = "fidget_low_loop" , andar = false , loop = true },
	{ nome = "foto114" , dict = "armenian_1_int-0" , anim = "player_one_dual-0" , andar = false , loop = true },
	{ nome = "foto115" , dict = "amb@world_human_bum_wash@male@low@idle_a" , anim = "idle_a" , andar = false , loop = true },
	{ nome = "foto116" , dict = "anim@amb@casino@hangout@ped_male@stand_withdrink@01b@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto117" , dict = "anim@move_m@trash_rc" , anim = "aim_high_loop" , andar = false , loop = true },
	{ nome = "foto118" , dict = "martin_1_int-10" , anim = "cs_patricia_dual-10" , andar = false , loop = true },
	{ nome = "foto119" , dict = "club_open-30" , anim = "ig_djsolmanager_dual-30" , andar = false , loop = true },
	{ nome = "foto120" , dict= "anim_heist@arcade_combined@" , anim = "ped_female@_stand@_02a@_idles_convo_idle_d" , andar = false , loop = true },
	{ nome = "foto121" , dict= "amb@code_human_police_investigate@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto122" , dict= "amb@world_human_golf_player@male@base" , anim = "base" , andar = false , loop = true },
	{ nome = "foto123" , dict= "rcmnigel1a" , anim = "base" , andar = false , loop = true },
	{ nome = "foto124" , dict= "timetable@ron@ig_1" , anim = "ig_1_base" , andar = false , loop = true },
	{ nome = "foto125" , dict= "anim@amb@code_human_in_car_idles@arm@generic@ds@idle_j" , anim = "idle_lowdoor" , andar = false , loop = true },
	{ nome = "foto126" , dict= "club_open-0" , anim = "cs_lazlow_2_dual-0" , andar = false , loop = true },
	{ nome = "foto127" , dict= "armenian_1_int-33" , anim = "a_m_y_runner_01-33" , andar = false , loop = true },
	{ nome = "foto128" , dict= "armenian_1_int-33" , anim = "ig_lamardavis_dual-33" , andar = false , loop = true },
	{ nome = "foto129" , dict= "armenian_1_int-3" , anim = "a_f_y_fitness_02^5-3" , andar = false , loop = true },
	{ nome = "render" , dict = "random@mugging3", anim = "handsup_standing_base", andar = true, loop = true },
	{ nome = "render2" , dict = "random@arrests@busted", anim = "idle_a", andar = true, loop = true },
	{ nome = "aqc" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_a" , andar = false , loop = false },
	{ nome = "aqc2" , dict = "anim@deathmatch_intros@unarmed" , anim = "intro_male_unarmed_d" , andar = false , loop = false },

	--##ANIMAÇÃO PM--##
	["fuzil"] = { dict = "bunk_int-0", anim = "mp_m_weapwork_01^1_dual-0", andar = true, loop = true },
    ["fuzil2"] = { dict = "missheistdocks2a", anim = "idle_guard", andar = true, loop = true },
    ["fuzil3"] = { dict = "weapons@rifle@", anim = "wall_block", andar = true, loop = true },
    ["fuzil4"] = { dict = "move_ballistic_2h", anim = "idle", andar = true, loop = true },
    ["fuzil5"] = { dict = "move_fat_2h", anim = "idle", andar = true, loop = true },
    ["fuzil6"] = { dict = "move_superfat_2h", anim = "idle", andar = true, loop = true },
    ["fuzil7"] = { dict = "move_stealth@p_m_one@2h@idle@a", anim = "idle", andar = true, loop = true },
    ["fuzil8"] = { dict = "move_weapon@rifle@generic", anim = "idle", andar = true, loop = true },
    ["fuzil9"] = { dict = "anim@weapons@rifle@lo@dbshot", anim = "aim_med_loop", andar = true, loop = true },
    ["fuzil10"] = { dict = "cover@idles@2h@low@_a", anim = "idle_l_corner", andar = false, loop = true },
    ["fuzil11"] = { dict = "cover@idles@2h@low@_a", anim = "idle_r_corner", andar = false, loop = true },
    ["fuzil12"] = { dict = "cover@move@base@2h", anim = "high_idle_l_peek", andar = true, loop = true },
    ["fuzil13"] = { dict = "cover@move@base@2h", anim = "high_idle_r_peek", andar = true, loop = true },
    ["fuzil14"] = { dict = "missfbi5ig_12", anim = "inlift_loop_dave", andar = true, loop = true },
	["pistola"] = { dict = "random@arrests", anim = "cop_gunaimed_door_open_idle", andar = true, loop = true },
    ["pistola2"] = { dict = "move_weapon@pistol@copa", anim = "idle", andar = true, loop = true },
    ["pistola3"] = { dict = "move_weapon@pistol@copc", anim = "idle", andar = true, loop = true },
    ["pistola4"] = { dict = "move_weapon@pistol@copd", anim = "idle", andar = true, loop = true },
    ["pistola5"] = { dict = "move_weapon@pistol@cope", anim = "idle", andar = true, loop = true },
    ["pistola6"] = { dict = "cover@weapon@core", anim = "idle", andar = false, loop = true },
    ["pistola7"] = { dict = "cover@idles@1h@low@_a", anim = "idle_l_corner", andar = false, loop = true },
    ["pistola8"] = { dict = "cover@idles@1h@low@_a", anim = "idle_r_corner", andar = false, loop = true },
    ["pistola9"] = { dict = "cover@move@base@1h", anim = "high_idle_l", andar = true, loop = true },
    ["arma1"] = { dict = "anim@male@holding_weapon_2", anim = "holding_weapon_2_clip", andar = true, loop = true },
    ["arma2"] = { dict = "anim@male@holding_weapon_4", anim = "holding_weapon_4_clip", andar = true, loop = true },
    ["arma3"] = { dict = "anim@male@holding_weapon_kneel", anim = "anim@male@holding_weapon_kneel_clip", andar = true, loop = true },
    ["arma4"] = { dict = "anim@male@holding_weapon_nvg", anim = "holding_weapon_nvg_clip", andar = true, loop = true },
    ["arma5"] = { dict = "anim@male@holding_weapon_nvg_2", anim = "holding_weapon_nvg_2_clip", andar = true, loop = true },
    ["arma6"] = { dict = "anim@male@hug_weapon", anim = "hug_weapon_clip", andar = true, loop = true },
    ["arma7"] = { dict = "anim@male@hug_weapon_2", anim = "hug_weapon_2_clip", andar = true, loop = true },
    ["arma8"] = { dict = "anim@male@pose_weapon", anim = "pose_weapon_clip", andar = true, loop = true },
    ["arma9"] = { dict = "anim@cop_pose_idle", anim = "lidar_gun_pose", andar = true, loop = true },
    ["arma10"] = { dict = "anim@gun_pose_00", anim = "viola_pose", andar = true, loop = true },
    ["arma11"] = { dict = "anim@gun_pose_01", anim = "gun_pose_01", andar = true, loop = true },
    ["arma12"] = { dict = "anim@gun_pose_02", anim = "cocking pistol", andar = true, loop = true },


	{ nome = 'tiktok' , dict = 'anim@amb@nightclub@mini@dance@dance_solo@female@var_b@' , anim = 'low_left_up' , andar = false , loop = true },    
    { nome = 'tiktok2' , dict = 'anim@amb@nightclub@mini@dance@dance_paired@dance_f@' , anim = 'ped_a_dance_idle' , andar = false , loop = true },    
    { nome = 'tiktok3' , dict = 'anim@amb@nightclub@mini@dance@dance_paired@dance_f@' , anim = 'ped_b_dance_idle' , andar = false , loop = true },    
    { nome = 'tiktok4' , dict = 'anim@amb@nightclub@mini@dance@dance_paired@dance_h@' , anim = 'ped_a_dance_idle' , andar = false , loop = true },    
    { nome = 'tiktok5' , dict = 'anim@amb@nightclub@mini@dance@dance_paired@dance_h@' , anim = 'ped_b_dance_idle' , andar = false , loop = true },    
    { nome = 'tiktok6' , dict = 'anim@amb@nightclub@mini@dance@dance_paired@dance_j@' , anim = 'ped_a_dance_idle' , andar = false , loop = true },    
    { nome = 'tiktok7' , dict = 'anim@amb@nightclub@mini@dance@dance_paired@dance_m@' , anim = 'ped_a_dance_idle' , andar = false , loop = true },    
    { nome = 'tiktok8' , dict = 'anim@amb@nightclub_island@dancers@club@' , anim = 'hi_idle_a_f02' , andar = false , loop = true },    
    { nome = 'tiktok9' , dict = 'anim@amb@nightclub_island@dancers@club@' , anim = 'mi_idle_b_f02' , andar = false , loop = true },    
    { nome = 'tiktok10' , dict = 'anim@mp_player_intcelebrationfemale@crowd_invitation' , anim = 'crowd_invitation' , andar = false , loop = true },    
    { nome = 'tiktok11' , dict = 'anim@mp_player_intcelebrationfemale@driver' , anim = 'driver' , andar = false , loop = true },    
    { nome = 'tiktok12' , dict = 'anim@mp_player_intcelebrationfemale@shooting' , anim = 'shooting' , andar = false , loop = true },    
    { nome = 'tiktok13' , dict = 'anim@mp_player_intcelebrationmale@shooting' , anim = 'shooting' , andar = false , loop = true },    
    { nome = 'tiktok14' , dict = 'anim@mp_player_intcelebrationmale@suck_it' , anim = 'suck_it' , andar = false , loop = true },    
    { nome = 'tiktok15' , dict = 'anim@mp_player_intuppercrowd_invitation' , anim = 'idle_a' , andar = false , loop = true },    
    { nome = 'tiktok16' , dict = 'anim@mp_player_intuppershooting' , anim = 'idle_a' , andar = false , loop = true },    
    { nome = 'tiktok17' , dict = 'anim@mp_player_intuppersuck_it' , anim = 'idle_a' , andar = false , loop = true },
	{ nome = "tiktok18" , dict = "custom@downward_fortnite" , anim = "Downward_fortnite" , andar = false , loop = true },
	{ nome = "tiktok19" , dict = "custom@pullup" , anim = "pullup" , andar = false , loop = true },
	{ nome = "tiktok20" , dict = "custom@rollie" , anim = "rollie" , andar = false , loop = true },
	{ nome = "tiktok21" , dict = "custom@wanna_see_me" , anim = "wanna_see_me" , andar = false , loop = true },
	{ nome = "tiktok22" , dict = "custom@billybounce" , anim = "billybounce" , andar = false , loop = true },
	{ nome = "tiktok23" , dict = "custom@bellydance" , anim = "bellydance" , andar = false , loop = true },
	{ nome = "tiktok24" , dict = "custom@hiphop_slide" , anim = "hiphop_slide" , andar = false , loop = true },
	{ nome = "tiktok25" , dict = "custom@hiphop1" , anim = "hiphop1" , andar = false , loop = true },
	{ nome = "tiktok26" , dict = "custom@hiphop2" , anim = "hiphop2" , andar = false , loop = true },
	{ nome = "tiktok27" , dict = "custom@hiphop3" , anim = "hiphop3" , andar = false , loop = true },
	{ nome = "tiktok28" , dict = "custom@hiphop90s" , anim = "hiphop90s" , andar = false , loop = true },
	{ nome = "tiktok29" , dict = "custom@dragonballz" , anim = "dragonballz" , andar = false , loop = true },
	{ nome = "tiktok30" , dict = "custom@hiphop_pumpup" , anim = "hiphop_pumpup" , andar = false , loop = true },
	{ nome = "tiktok31" , dict = "custom@salsatime" , anim = "salsatime" , andar = false , loop = true },
	{ nome = "tiktok32" , dict = "custom@samba" , anim = "samba" , andar = false , loop = true },
	{ nome = "tiktok33" , dict = "custom@shockdance" , anim = "shockdance" , andar = false , loop = true },
	{ nome = "tiktok34" , dict = "custom@specialdance" , anim = "specialdance" , andar = false , loop = true },
	{ nome = "tiktok35" , dict = "custom@dancemoves" , anim = "dancemoves" , andar = false , loop = true },
	{ nome = "tiktok36" , dict = "custom@disco_dance" , anim = "disco_dance" , andar = false , loop = true },
	{ nome = "tiktok37" , dict = "custom@electroshuffle_original" , anim = "electroshuffle_original" , andar = false , loop = true },
	{ nome = "tiktok38" , dict = "custom@electroshuffle" , anim = "electroshuffle" , andar = false , loop = true },
	{ nome = "tiktok39" , dict = "custom@robotdance_fortnite" , anim = "robotdance_fortnite" , andar = false , loop = true },
	{ nome = "tiktok40" , dict = "custom@frightfunk" , anim = "frightfunk" , andar = false , loop = true },
	{ nome = "tiktok41" , dict = "custom@in_da_party" , anim = "in_da_party" , andar = false , loop = true },
	{ nome = "tiktok42" , dict = "custom@smooth_moves" , anim = "smooth_moves" , andar = false , loop = true },
	{ nome = "tiktok43" , dict = "custom@footwork" , anim = "footwork" , andar = false , loop = true },
	{ nome = "tiktok44" , dict = "custom@headspin" , anim = "headspin" , andar = false , loop = true },
	{ nome = "tiktok45" , dict = "custom@hiphop_yeah" , anim = "hiphop_yeah" , andar = false , loop = true },
	{ nome = "tiktok46" , dict = "custom@toetwist" , anim = "toetwist" , andar = false , loop = true },
	{ nome = "tiktok47" , dict = "custom@crossbounce" , anim = "crossbounce" , andar = false , loop = true },
	{ nome = "tiktok48" , dict = "custom@dont_start" , anim = "dont_start" , andar = false , loop = true },
	{ nome = "tiktok49" , dict = "custom@floss" , anim = "floss" , andar = false , loop = true },
	{ nome = "tiktok50" , dict = "custom@orangejustice" , anim = "orangejustice" , andar = false , loop = true },
	{ nome = "tiktok51" , dict = "custom@renegade" , anim = "renegade" , andar = false , loop = true },
	{ nome = "tiktok52" , dict = "custom@rickroll" , anim = "rickroll" , andar = false , loop = true },
	{ nome = "tiktok53" , dict = "custom@savage" , anim = "savage" , andar = false , loop = true },
	{ nome = "tiktok54" , dict = "custom@sayso" , anim = "sayso" , andar = false , loop = true },
	{ nome = "tiktok55" , dict = "custom@take_l" , anim = "take_l" , andar = false , loop = true },
	{ nome = "tiktok56" , dict = "custom@toosie_slide" , anim = "toosie_slide" , andar = false , loop = true },
	{ nome = "tiktok57" , dict = "custom@around_the_clock" , anim = "around_the_clock" , andar = false , loop = true },
	{ nome = "tiktok58" , dict = "custom@fresh_fortnite" , anim = "fresh_fortnite" , andar = false , loop = true },
	{ nome = "tiktok59" , dict = "custom@gylphic" , anim = "gylphic" , andar = false , loop = true },
	{ nome = "tiktok60" , dict = "custom@gloss" , anim = "gloss" , andar = false , loop = true },
	{ nome = "tiktok61" , dict = "custom@last_forever" , anim = "last_forever" , andar = false , loop = true },
	{ nome = "tiktok62" , dict = "custom@introducing" , anim = "introducing" , andar = false , loop = true },
	{ nome = "tiktok63" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "sing_a_song_1" , andar = false , loop = true },
	{ nome = "tiktok64" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "sing_a_song_2" , andar = false , loop = true },
	{ nome = "tiktok65" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "sing_a_song_3" , andar = false , loop = true },
	{ nome = "tiktok66" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "sing_a_song_4" , andar = false , loop = true },
	{ nome = "tiktok67" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "sing_a_song_5" , andar = false , loop = true },
	{ nome = "tiktok68" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "up_beat_1" , andar = false , loop = true },
	{ nome = "tiktok69" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "up_beat_2" , andar = false , loop = true },
	{ nome = "tiktok70" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "up_beat_3" , andar = false , loop = true },
	{ nome = "tiktok71" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "up_beat_4" , andar = false , loop = true },
	{ nome = "tiktok72" , dict = "jazzrockabillybluesetc_singer@anim" , anim = "up_beat_5" , andar = false , loop = true },
	{ nome = "tiktok73" , dict= "divined@tdances@new" , anim = "dtdance2" , andar =false , loop = true },
	{ nome = "tiktok74" , dict= "divined@tdances@new" , anim = "dtdance3" , andar =false , loop = true },
	{ nome = "tiktok75" , dict= "divined@tdances@new" , anim = "dtdance12" , andar =false , loop = true },
	{ nome = "tiktok76" , dict= "divined@tdances@new" , anim = "dtdance13" , andar =false , loop = true },
	{ nome = "tiktok77" , dict= "divined@tdances@new" , anim = "dtdance1" , andar =false , loop = true },
	{ nome = "tiktok78" , dict= "divined@tdances@new" , anim = "dtdance20" , andar =false , loop = true },
	{ nome = "tiktok79" , dict= "divined@tdances@new" , anim = "dtdance21" , andar =false , loop = true },
	{ nome = "tiktok80" , dict= "divined@tdances@new" , anim = "dtdance22" , andar =false , loop = true },
	{ nome = "tiktok81" , dict= "divined@fndances@new" , anim = "dbdance2" , andar =false , loop = true },
	{ nome = "tiktok82" , dict= "divined@fndances@new" , anim = "dbdance3" , andar =false , loop = true },
	{ nome = "tiktok83" , dict= "behere@danceanimation" , anim = "behere_clip" , andar = false , loop = true },
	{ nome = "tiktok84" , dict= "divined@fndances@new" , anim = "dbdance12" , andar =false , loop = true },
	{ nome = "tiktok85" , dict= "divined@fndances@new" , anim = "dbdance13" , andar =false , loop = true },
	{ nome = "tiktok86" , dict= "divined@fndances@new" , anim = "dbdance1" , andar =false , loop = true },
	{ nome = "tiktok87" , dict= "divined@fndances@new" , anim = "dbdance20" , andar =false , loop = true },
	{ nome = "tiktok88" , dict= "divined@fndances@new" , anim = "dbdance21" , andar =false , loop = true },
	{ nome = "tiktok89" , dict= "divined@dancesv2@new" , anim = "divdance1" , andar =false , loop = true },
	{ nome = "tiktok90" , dict= "divined@dancesv2@new" , anim = "divdance2" , andar =false , loop = true },
	{ nome = "tiktok91" , dict= "divined@dancesv2@new" , anim = "divdance3" , andar =false , loop = true },
	{ nome = "tiktok92" , dict= "comrade@danceanimation" , anim = "comrade_clip" , andar = false , loop = true },
	{ nome = "tiktok93" , dict= "divined@dancesv2@new" , anim = "divdance12" , andar =false , loop = true },
	{ nome = "tiktok94" , dict= "divined@dancesv2@new" , anim = "divdance13" , andar =false , loop = true },
	{ nome = "tiktok95" , dict= "divined@dancesv2@new" , anim = "divdance1" , andar =false , loop = true },
	{ nome = "tiktok96" , dict= "divined@pack@new" , anim = "dpack_1" , andar =false , loop = true },
	{ nome = "tiktok97" , dict= "divined@pack@new" , anim = "dpack_2" , andar =false , loop = true },
	{ nome = "tiktok98" , dict= "divined@pack@new" , anim = "dpack_3" , andar =false , loop = true },
	{ nome = "tiktok99" , dict= "jumpinglow@danceanimation" , anim = "jumpinglow_clip" , andar = false , loop = true },
	{ nome = "tiktok100" , dict= "divined@pack@new" , anim = "dpack_12" , andar =false , loop = true },
	{ nome = "tiktok101" , dict= "divined@pack@new" , anim = "dpack_13" , andar =false , loop = true },
	{ nome = "tiktok102" , dict= "divined@pack@new" , anim = "dpack_1" , andar =false , loop = true },
	{ nome = "tiktok103" , dict= "div@gdances@test" , anim = "zombiewalk" , andar =false , loop = true },
	{ nome = "tiktok104" , dict= "div@gdances@test" , anim = "spinny" , andar =false , loop = true },
	{ nome = "tiktok105" , dict= "div@gdances@test" , anim = "skeldance" , andar =false , loop = true },
	{ nome = "tiktok106" , dict= "div@gdances@test" , anim = "ashton" , andar =false , loop = true },
	{ nome = "tiktok107" , dict= "div@gdances@test" , anim = "charleston" , andar =false , loop = true },
	{ nome = "tiktok108" , dict= "div@gdances@test" , anim = "doggystrut" , andar =false , loop = true },
	{ nome = "tiktok109" , dict= "div@gdances@test" , anim = "dreamfeet" , andar =false , loop = true },
	{ nome = "tiktok110" , dict= "div@gdances@test" , anim = "eerie" , andar =false , loop = true },
	{ nome = "tiktok111" , dict= "div@gdances@test" , anim = "fancyfeet" , andar =false , loop = true },
	{ nome = "tiktok112" , dict= "div@gdances@test" , anim = "festivus" , andar =false , loop = true },
	{ nome = "tiktok113" , dict= "div@gdances@test" , anim = "flamingo" , andar =false , loop = true },
	{ nome = "tiktok114" , dict= "div@gdances@test" , anim = "fresh" , andar =false , loop = true },
	{ nome = "tiktok115" , dict= "div@gdances@test" , anim = "getgriddy" , andar =false , loop = true },
	{ nome = "tiktok116" , dict= "div@gdances@test" , anim = "handstand" , andar =false , loop = true },
	{ nome = "tiktok117" , dict= "div@gdances@test" , anim = "imsmooth" , andar =false , loop = true },
	{ nome = "tiktok118" , dict= "div@gdances@test" , anim = "keepdance" , andar =false , loop = true },
	{ nome = "tiktok119" , dict= "div@gdances@test" , anim = "montecarlo" , andar =false , loop = true },
	{ nome = "tiktok120" , dict= "div@gdances@test" , anim = "octopus" , andar =false , loop = true },
	{ nome = "tiktok121" , dict= "div@gdances@test" , anim = "pointydance" , andar =false , loop = true },
	{ nome = "tiktok122" , dict= "div@gdances@test" , anim = "ridingdance" , andar =false , loop = true },
	{ nome = "tiktok123" , dict= "divined@dances@new" , anim = "ddance1" , andar =false , loop = true },
	{ nome = "tiktok124" , dict= "divined@dances@new" , anim = "ddance2" , andar =false , loop = true },
	{ nome = "tiktok125" , dict= "divined@dances@new" , anim = "ddance3" , andar =false , loop = true },
	{ nome = "tiktok126" , dict= "custom@bellydance2" , anim = "bellydance2" , andar = false , loop = true },
	{ nome = "tiktok127" , dict= "divined@dances@new" , anim = "ddance12" , andar =false , loop = true },
	{ nome = "tiktok128" , dict= "divined@dances@new" , anim = "ddance13" , andar =false , loop = true },
	{ nome = "tiktok129" , dict= "export@breakdance" , anim = "breakdance" , andar =false , loop = true },
	{ nome = "tiktok130" , dict= "custom@salsa" , anim = "salsa" , andar =false , loop = true },
	{ nome = "tiktok131" , dict= "custom@maraschino" , anim = "maraschino" , andar =false , loop = true },
	{ nome = "tiktok132" , dict= "custom@makarena" , anim = "makarena" , andar =false , loop = true },
	{ nome = "tiktok133" , dict= "custom@gangnamstyle" , anim = "gangnamstyle" , andar =false , loop = true },
	{ nome = "tiktok134" , dict= "custom@armwave" , anim = "armwave" , andar =false , loop = true },
	{ nome = "tiktok135" , dict= "custom@armswirl" , anim = "armswirl" , andar =false , loop = true },
	{ nome = "tiktok136" , dict = "custom@hitit" , anim = "hitit" , andar = false , loop = true },
    { nome = "tiktok137" , dict= "divined@drpack@new" , anim = "woowalkinx" , andar =false , loop = true },
	{ nome = "tiktok138" , dict= "divined@drpack@new" , anim = "bloodwalk" , andar =false , loop = true },
	{ nome = "tiktok139" , dict= "divined@drpack@new" , anim = "cripwalk3" , andar =false , loop = true },
	{ nome = "tiktok140" , dict= "divined@drpack@new" , anim = "shootit" , andar =false , loop = true },
	{ nome = "tiktok141" , dict= "divined@drpack@new" , anim = "millyrocks" , andar =false , loop = true },
	{ nome = "tiktok142" , dict= "divined@drpack@new" , anim = "shmoney" , andar =false , loop = true },
	{ nome = "tiktok143" , dict= "divined@drpack@new" , anim = "dougie" , andar =false , loop = true },
	{ nome = "tiktok144" , dict= "divined@drpack@new" , anim = "haiphuthon" , andar =false , loop = true },
	{ nome = "tiktok145" , dict= "divined@drpack@new" , anim = "curvette" , andar =false , loop = true },
	{ nome = "tiktok146" , dict= "divined@drpack@new" , anim = "tokyochall" , andar =false , loop = true },
	{ nome = "tiktok147" , dict= "divined@drpack@new" , anim = "thotiana" , andar =false , loop = true },
	{ nome = "tiktok148" , dict= "divined@drpack@new" , anim = "moodswings" , andar =false , loop = true },
	{ nome = "tiktok149" , dict= "divined@drpack@new" , anim = "whatyouknowboutlove" , andar =false , loop = true },
	{ nome = "tiktok150" , dict= "ninjastyle@dance" , anim = "ninja_clip" , andar = false , loop = true },
	{ nome = "tiktok151" , dict= "controllercrew@dance" , anim = "controllercrew_clip" , andar = false , loop = true },
	{ nome = "tiktok152" , dict= "tally@danceanimation" , anim = "tally_clip" , andar = false , loop = true },
	{ nome = "tiktok153" , dict= "springy@dance" , anim = "springy_clip" , andar = false , loop = true },
	{ nome = "tiktok154" , dict= "pullup@dance" , anim = "pullup_clip" , andar = false , loop = true },
	{ nome = "tiktok155" , dict= "outwest@dance" , anim = "outwest_clip" , andar = false , loop = true },
	{ nome = "tiktok156" , dict= "kpop@dance" , anim = "kpop_clip" , andar = false , loop = true },
	{ nome = "tiktok157" , dict= "indigo@dance" , anim = "indigo_clip" , andar = false , loop = true },
	{ nome = "tiktok158" , dict= "gomufasa@dance" , anim = "gomufasa_clip" , andar = false , loop = true },
	{ nome = "tiktok159" , dict= "dynamite@dance" , anim = "dynamite_clip" , andar = false , loop = true },
	{ nome = "tiktok158" , dict= "dinamites@dance" , anim = "dinamites_clip" , andar = false , loop = true },
	{ nome = "tiktok159" , dict= "dancecustom1@danceanimation" , anim = "dancecustom1_clip" , andar = false , loop = true },
	{ nome = "tiktok160" , dict= "dancecustom2@danceanimation" , anim = "dancecustom2_clip" , andar = false , loop = true },
	{ nome = "tiktok161" , dict= "dancecustom3@danceanimation" , anim = "dancecustom3_clip" , andar = false , loop = true },
	{ nome = "tiktok162" , dict = "poseanimada" , anim = "poseanimada_clip" , andar = false , loop = true },
	{ nome = "tiktok163" , dict= "tonal@danceanimation" , anim = "tonal_clip" , andar = false , loop = true },
	{ nome = "tiktok164" , dict= "sexydance@danceanimations" , anim = "sexydance" , andar = false , loop = true },
	{ nome = "tiktok165" , dict= "ondaonda@danceanimation" , anim = "onda_clip" , andar = false , loop = true },
	{ nome = "tiktok166" , dict= "layers@danceanimation" , anim = "layers_clip" , andar = false , loop = true },
	{ nome = "tiktok167" , dict= "dancing_wave_part_one@anim" , anim = "wave_dance_1" , andar = false , loop = true },
	{ nome = "tiktok168" , dict= "dancing_wave_part_one@anim" , anim = "wave_dance_2" , andar = false , loop = true },
	{ nome = "tiktok169" , dict= "dancing_wave_part_one@anim" , anim = "wave_dance_3" , andar = false , loop = true },
	{ nome = "tiktok170" , dict= "dancing_wave_part_one@anim" , anim = "wave_dance_4" , andar = false , loop = true },
	{ nome = "tiktok171" , dict= "dancing_wave_part_one@anim" , anim = "tutankhamun_dance_1" , andar = false , loop = true },
	{ nome = "tiktok172" , dict= "dancing_wave_part_one@anim" , anim = "tutankhamun_dance_2" , andar = false , loop = true },
	{ nome = "tiktok173" , dict= "dancing_wave_part_one@anim" , anim = "snake_dance_1" , andar = false , loop = true },
	{ nome = "tiktok174" , dict= "dancing_wave_part_one@anim" , anim = "slide_dance_2" , andar = false , loop = true },
	{ nome = "tiktok175" , dict= "dancing_wave_part_one@anim" , anim = "robot_dance" , andar = false , loop = true },
	{ nome = "tiktok176" , dict= "dancing_wave_part_one@anim" , anim = "locking_dance" , andar = false , loop = true },
	{ nome = "tiktok177" , dict= "dancing_wave_part_one@anim" , anim = "headspin" , andar = false , loop = true },
	{ nome = "tiktok178" , dict= "dancing_wave_part_one@anim" , anim = "flaire_dance" , andar = false , loop = true },
	{ nome = "tiktok179" , dict= "dancing_wave_part_one@anim" , anim = "crowd_girl_dance" , andar = false , loop = true },
	{ nome = "tiktok180" , dict= "dancing_wave_part_one@anim" , anim = "uprock_dance_1" , andar = false , loop = true },
	{ nome = "tiktok181" , dict= "dancing_wave_part_one@anim" , anim = "slide_dance" , andar = false , loop = true },
	
	{ nome = "livro" , dict = "cellphone@" , anim = "cellphone_text_read_base" , andar = true , loop = true , extra = function()
		vRP._CarregarObjeto("","","prop_novel_01",49,6286,0.15,0.03,-0.065,0.0,180.0,90.0)
	end },
	{ nome = "urso" , dict = "impexp_int-0" , anim = "mp_m_waremech_01_dual-0" , andar = true , loop = true , extra = function()
		vRP._CarregarObjeto("","","v_ilev_mr_rasberryclean",49,24817,-0.20,0.46,-0.016,-180.0,-90.0,0.0)
	end },
	{ nome = "dinheiro" , dict = "anim@mp_player_intupperraining_cash" , anim = "idle_a" , andar = true , loop = true , extra = function()
		vRP._CarregarObjeto("","","prop_anim_cash_pile_01",49,60309,0.0,0.0,0.0,180.0,0.0,70.0)
	end },
	{ nome = "parachoque" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
	end },
	{ nome = "porta" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_door_01",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "porta2" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_door_02",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "porta3" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
		vRP._CarregarObjeto("","","prop_car_door_03",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "porta4" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_door_04",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "banco" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
		vRP._CarregarObjeto("","","prop_car_seat",49,28422,0.0,-0.2,-0.14,0.0,0.0,0.0)
	end },
	{ nome = "pneu" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_wheel_tyre",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "pneu2" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_wheel_03",49,28422,0.0,-0.1,-0.15,0.0,0.0,0.0)
	end },
	{ nome = "bateria" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_battery_01",49,28422,0.0,-0.1,-0.10,0.0,0.0,0.0)
	end },
	{ nome = "motor" , dict = "anim@heists@box_carry@" , anim = "idle" , andar = true , loop = true , extra = function()
		--TriggerServerEvent("carregarobjeto","imp_prop_impexp_front_bumper_02a",49,28422,0.0,0.1,0.05,0.0,0.0,0.0)
        vRP._CarregarObjeto("","","prop_car_engine_01",49,28422,0.0,-0.1,-0.10,0.0,0.0,0.0)
	end },
	{ nome = "binoculos" , dict = "amb@world_human_binoculars@male@enter" , anim = "enter" , prop = "prop_binoc_01" , flag = 50 , hand = 28422 , extra = function()
		binoculos = true
	end },
	{ nome = "pano2" , dict = "timetable@maid@cleaning_surface@base" , anim = "base" , prop = "prop_rag_01" , flag = 49 , hand = 28422 , extra = function()
		local vehicle = vRP.getNearestVehicle(7)
		if IsEntityAVehicle(vehicle) then
			TriggerEvent("progress",15,"limpando")
			SetTimeout(15000,function()
				TriggerServerEvent("tryclean",VehToNet(vehicle))
			end)
		end
	end },
	{ nome = "camera2" , dict = "missfinale_c2mcs_1" , anim = "fin_c2_mcs_1_camman" , prop = "prop_v_cam_01" , flag = 49 , hand = 28422 , extra = function() 
        camera = true
    end },
	{ nome = "pano" , dict = "timetable@maid@cleaning_window@base" , anim = "base" , prop = "prop_rag_01" , flag = 49 , hand = 28422 , extra = function()
		local vehicle = vRP.getNearestVehicle(7)
		if IsEntityAVehicle(vehicle) then
			TriggerEvent("progress",15,"limpando")
			SetTimeout(15000,function()
				TriggerServerEvent("tryclean",VehToNet(vehicle))
			end)
		end
	end },	
	{ nome = "mijar" , dict = "misscarsteal2peeing" , anim = "peeing_intro" , andar = false , loop = false , extra = function()
		-- local ped = PlayerPedId()
		-- SetTimeout(4000,function()
		-- --	TriggerServerEvent("trySyncParticle","peeing",PedToNet(ped))
		-- 	Wait(4500)
		-- --	TriggerServerEvent("tryStopParticle",PedToNet(ped))
		-- end)
	end },
	{ nome = "cagar" , dict = "missfbi3ig_0" , anim = "shit_loop_trev" , andar = false , loop = false , extra = function()
	-- 	local ped = PlayerPedId()
	-- --	TriggerServerEvent("trySyncParticle","poo",PedToNet(ped))
	-- 	SetTimeout(15000,function()
	-- 	--	TriggerServerEvent("tryStopParticle",PedToNet(ped))
	-- 	end)
	end	},
	{ nome = "bong" , dict = "anim@safehouse@bong" , anim = "bong_stage1" , prop = "prop_bong_01" , flag = 50 , hand = 60309 , extra = function() 
		if not IsPedInAnyVehicle(PlayerPedId()) then
			TriggerEvent('cancelando',true)
			TriggerEvent("progress",9,"fumando")
			TriggerEvent("vrp_sound:source",'bong',0.5)
			SetTimeout(8700,function()
				vRP._DeletarObjeto()
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE',0.5)
			end)
			SetTimeout(9000,function()
				vRP.loadAnimSet("MOVE_M@DRUNK@VERYDRUNK")
				SetTimecycleModifier("REDMIST_blend")
				ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE",1.0)
				StartScreenEffect("DMT_flight",30000,false)
				Wait(30000)
				TriggerEvent('cancelando',false)
				SetTimecycleModifier("")
				SetTransitionTimecycleModifier("")
				StopGameplayCamShaking()
				ResetPedMovementClipset(PlayerPedId())
			end)
		end
	end }
}

local inEmote = false
RegisterNetEvent('emotes')
AddEventHandler('emotes',function(nome)
	local ped = PlayerPedId()
	vRP.DeletarObjeto()
	DeleteObject()
	
	if GetEntityHealth(ped) > 105 then
		inEmote = false
		for _,emote in pairs(animacoes) do
			if not IsPedInAnyVehicle(ped) and not emote.carros then
				if nome == emote.nome then
					if emote.extra then emote.extra() end
					if emote.pos1 then
						vRP.CarregarObjeto("","",emote.prop,emote.flag,emote.hand,emote.pos1,emote.pos2,emote.pos3,emote.pos4,emote.pos5,emote.pos6)
					elseif emote.prop then
						vRP.CarregarObjeto(emote.dict,emote.anim,emote.prop,emote.flag,emote.hand)
					elseif emote.dict then
						vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
					else
						vRP._playAnim(false,{task=emote.anim},false)
					end
				end

				inEmote = true
			else
				if IsPedInAnyVehicle(ped) and emote.carros then
					local vehicle = GetVehiclePedIsIn(ped,false)
					if nome == emote.nome then
						if (GetPedInVehicleSeat(vehicle,-1) == ped or GetPedInVehicleSeat(vehicle,1) == ped) and emote.nome == "sexo4" then
							vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
						elseif (GetPedInVehicleSeat(vehicle,0) == ped or GetPedInVehicleSeat(vehicle,2) == ped) and (emote.nome == "sexo5" or emote.nome == "sexo6") then
							vRP._playAnim(emote.andar,{{emote.dict,emote.anim}},emote.loop)
						end
					end

					inEmote = true
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			if inEmote then
				inEmote = false
				vRP.DeletarObjeto()
			end
		end
		Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BINOCULOS E CAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
       local time = 1000

        if binoculos then
			time = 5
            local scaleform = RequestScaleformMovie("BINOCULARS")
            while not HasScaleformMovieLoaded(scaleform) do
                Wait(10)
            end
 
            local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
            AttachCamToEntity(cam,PlayerPedId(),0.0,0.0,1.0,true)
            SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()))
            SetCamFov(cam,fov)
            RenderScriptCams(true,false,0,1,0)
 
            while binoculos and true do
                Wait(1)
                BlockWeaponWheelThisFrame()
                local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                CheckInputRotation(cam,zoomvalue)
                HandleZoom(cam)
                DrawScaleformMovieFullscreen(scaleform,255,255,255,255)
            end
 
            fov = (fov_max+fov_min)*0.5
            RenderScriptCams(false,false,0,1,0)
            SetScaleformMovieAsNoLongerNeeded(scaleform)
            DestroyCam(cam,false)
            SetNightvision(false)
            SetSeethrough(false)
        end

		if camera then
			time = 5
			if IsControlJustPressed(0,38) then
				local scaleform = RequestScaleformMovie("breaking_news")
				local scaleform2 = RequestScaleformMovie("security_camera")
				while not HasScaleformMovieLoaded(scaleform) do
					Wait(10)
				end
				while not HasScaleformMovieLoaded(scaleform2) do
					Wait(10)
				end

				local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
				AttachCamToEntity(cam,PlayerPedId(),0.0,0.0,1.0,true)
				SetCamRot(cam,0.0,0.0,GetEntityHeading(PlayerPedId()))
				SetCamFov(cam,fov)
				RenderScriptCams(true,false,0,1,0)

				while camera and true do
					Wait(1)
					BlockWeaponWheelThisFrame()
					local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
					CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					DrawScaleformMovieFullscreen(scaleform,255,255,255,255)
					DrawScaleformMovieFullscreen(scaleform2,255,255,255,255)
					if IsControlJustPressed(0,38) then
						camera = false
					end
				end

				fov = (fov_max+fov_min)*0.5
				RenderScriptCams(false,false,0,1,0)
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				SetScaleformMovieAsNoLongerNeeded(scaleform2)
				DestroyCam(cam,false)
				SetNightvision(false)
				SetSeethrough(false)
			end
		end

		Wait(time)
    end
end)
 
RegisterNetEvent('binoculos')
AddEventHandler('binoculos',function()
    if IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_binoculars@male@enter","enter",3) then
        binoculos = true
        camera = true
    else
        binoculos = false
        camera = false
    end
end)
 
function CheckInputRotation(cam,zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0,220)
    local rightAxisY = GetDisabledControlNormal(0,221)
    local rotation = GetCamRot(cam,2)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        new_z = rotation.z+rightAxisX*-1.0*(8.0)*(zoomvalue+0.1)
        new_x = math.max(math.min(20.0,rotation.x+rightAxisY*-1.0*(8.0)*(zoomvalue+0.1)),-89.5)
        SetCamRot(cam,new_x,0.0,new_z,2)
    end
end
 
function HandleZoom(cam)
    if IsControlJustPressed(0,241) then
        fov = math.max(fov-10.0,fov_min)
    end
 
    if IsControlJustPressed(0,242) then
        fov = math.min(fov+10.0,fov_max)
    end
 
    local current_fov = GetCamFov(cam)
    if math.abs(fov-current_fov) < 0.1 then
        fov = current_fov
    end
    SetCamFov(cam,current_fov+(fov-current_fov)*0.05)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CANCELAR EMOTES
-----------------------------------------------------------------------------------------------------------------------------------------
local isF6Enabled = true

RegisterKeyMapping("clear", "Limpar Emotes", "keyboard", "F6")
RegisterCommand("clear", function(source, args)
    if vTunnel.checkCommands() then
        if isF6Enabled then
            if not IsPedJumping(GetPlayerPed(-1)) then
                cancelEmote()
                FreezeEntityPosition(GetPlayerPed(-1), false)
                vRP.DeletarObjeto()
                isF6Enabled = false
                SetTimeout(5000, function()
                    isF6Enabled = true
                end)
            end
        end
    end
end)

RegisterNetEvent('Nikito:Emotes')
AddEventHandler('Nikito:Emotes',function()
	cancelEmote()
end)

function cancelEmote()
	inEmote = false
	ClearPedTasks(GetPlayerPed(-1))
	FreezeEntityPosition(GetPlayerPed(-1), false)
	vRP.DeletarObjeto()
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- ESTILOS DE ANDAR
-----------------------------------------------------------------------------------------------------------------------------------------
local animSet = {
	["homem"] = { "move_m@confident" },
	["mulher"] = { "move_f@heels@c" },
	["depressivo"] = { "move_m@depressed@a" },
	["depressiva"] = { "move_f@depressed@a" },
	["empresario"] = { "move_m@business@a" },
	["determinado"] = { "move_m@brave@a" },
	["descontraido"] = { "move_m@casual@a" },
	["farto"] = { "move_m@fat@a" },
	["estiloso"] = { "move_m@hipster@a" },
	["ferido"] = { "move_m@injured" },
	["nervoso"] = { "move_m@hurry@a" },
	["desleixado"] = { "move_m@hobo@a" },
	["infeliz"] = { "move_m@sad@a" },
	["musculoso"] = { "move_m@muscle@a" },
	["desligado"] = { "move_m@shadyped@a" },
	["fadiga"] = { "move_m@buzzed" },
	["apressado"] = { "move_m@hurry_butch@a" },
	["descolado"] = { "move_m@money" },
	["piriguete"] = { "move_f@maneater" },
	["petulante"] = { "move_f@sassy" },
	["arrogante"] = { "move_f@arrogant@a" },
	["bebado"] = { "move_m@drunk@slightlydrunk" },
	["bebado2"] = { "move_m@drunk@verydrunk" },
	["bebado3"] = { "move_m@drunk@moderatedrunk" },
	["irritado"] = { "move_m@fire" },
	["intimidado"] = { "move_m@intimidation@cop@unarmed" },
	["poderosa"] = { "move_f@handbag" },
	["chateado"] = { "move_f@injured" },
	["estilosa"] = { "move_f@posh@" },
	["sensual"] = { "move_f@sexy@a" }
}

RegisterCommand("a",function(source,args)
	local anim = args[1]
	if animSet[anim] then
		vRP.loadAnimSet(animSet[anim][1])
	else
		TriggerEvent("Notify","negado","Essa animação não existe.", 5000)
	end
end)


RegisterNetEvent('cmg2_animations:syncTargetSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncTargetSCRIPTFODIDO', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
	 		Wait(10)
	 	end
	 	if spin == nil then spin = 180.0 end
	 	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	 	if controlFlag == nil then controlFlag = 0 end
	 	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	 end)

 RegisterNetEvent('cmg2_animations:syncMeSCRIPTFODIDO')
 AddEventHandler('cmg2_animations:syncMeSCRIPTFODIDO', function(animationLib, animation,length,controlFlag,animFlag)
 	local playerPed = GetPlayerPed(-1)
 	RequestAnimDict(animationLib)

 	while not HasAnimDictLoaded(animationLib) do
 		Wait(10)
 	end
 	Wait(500)
 	if controlFlag == nil then controlFlag = 0 end
 	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
 	Wait(length)
 end)
 RegisterNetEvent('cmg2_animations:cl_stopSCRIPTFODIDO')
 AddEventHandler('cmg2_animations:cl_stopSCRIPTFODIDO', function()
 	carryingBackInProgress = false
 	ClearPedSecondaryTask(GetPlayerPed(-1))
 	DetachEntity(GetPlayerPed(-1), true, false)
 end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CAVALINHO
-----------------------------------------------------------------------------------------------------------------------------------------
local piggyBackInProgress = false
RegisterCommand("cavalinho",function(source, args)
	local closestPlayer = GetClosestPlayer(3)
	   if vTunnel.checkItem() then
		   if GetEntityHealth(PlayerPedId()) > 105 then
			   if not piggyBackInProgress then
				   if closestPlayer ~= nil then
					   piggyBackInProgress = true
					   local player = PlayerPedId()	
					   lib = 'anim@arena@celeb@flat@paired@no_props@'
					   anim1 = 'piggyback_c_player_a'
					   anim2 = 'piggyback_c_player_b'
					   distans = -0.07
					   distans2 = 0.0
					   height = 0.45
					   spin = 0.0		
					   length = 100000
					   controlFlagMe = 49
					   controlFlagTarget = 33
					   animFlagTarget = 1
					   print(closestPlayer)
					   target = GetPlayerServerId(closestPlayer)
				   
					   TriggerServerEvent('cmg2_animations:syncSCRIPTFODIDO_2', closestPlayer, lib, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
				   end
			   else
				   if closestPlayer ~= nil then
					   piggyBackInProgress = false
					   ClearPedSecondaryTask(GetPlayerPed(-1))
					   DetachEntity(GetPlayerPed(-1), true, false)
					   local closestPlayer = GetClosestPlayer(3)
					   target = GetPlayerServerId(closestPlayer)
					   TriggerServerEvent("cmg2_animations:stopSCRIPTFODIDO",target)
				   end
			   end
	   else
		   TriggerEvent("Notify","negado","Você não possui cordas!, 5000")
	   end
   end
end)

RegisterNetEvent('cmg2_animations:syncTargetSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncTargetSCRIPTFODIDO', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
   local playerPed = GetPlayerPed(-1)
   local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
   piggyBackInProgress = true
   RequestAnimDict(animationLib)
   while not HasAnimDictLoaded(animationLib) do
	   Wait(10)
   end
   if spin == nil then spin = 180.0 end
   AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
   if controlFlag == nil then controlFlag = 0 end
   TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMeSCRIPTFODIDO')
AddEventHandler('cmg2_animations:syncMeSCRIPTFODIDO', function(animationLib, animation,length,controlFlag,animFlag)
   local playerPed = GetPlayerPed(-1)
   RequestAnimDict(animationLib)
   while not HasAnimDictLoaded(animationLib) do
	   Wait(10)
   end
   Wait(500)
   if controlFlag == nil then controlFlag = 0 end
   TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
   Wait(length)
end)
RegisterNetEvent('cmg2_animations:cl_stopSCRIPTFODIDO')
AddEventHandler('cmg2_animations:cl_stopSCRIPTFODIDO', function()
   piggyBackInProgress = false
   ClearPedSecondaryTask(GetPlayerPed(-1))
   DetachEntity(GetPlayerPed(-1), true, false)
end)
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- REFEM
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- local hostageAllowedWeapons = {
-- 	"WEAPON_COMBATPISTOL",
-- 	"WEAPON_REVOLVER_MK2",
-- 	"WEAPON_REVOLVER",
-- 	"WEAPON_PISTOL_MK2",
-- 	"WEAPON_PISTOL50",
-- 	"WEAPON_PISTOL",
-- 	"WEAPON_SNSPISTOL",
-- 	"WEAPON_SNSPISTOL_MK2",
-- 	"WEAPON_HEAVYPISTOL"
-- }

-- local holdingHostageInProgress = false

-- RegisterCommand("refem",function()
-- 	takeHostage()
-- end)

-- function takeHostage()
-- 	ClearPedSecondaryTask(GetPlayerPed(-1))
-- 	DetachEntity(GetPlayerPed(-1), true, false)
-- 	for i=1, #hostageAllowedWeapons do
-- 		if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(hostageAllowedWeapons[i]), false) then
-- 			if GetAmmoInPedWeapon(GetPlayerPed(-1), GetHashKey(hostageAllowedWeapons[i])) > 0 then
-- 				canTakeHostage = true 
-- 				foundWeapon = GetHashKey(hostageAllowedWeapons[i])
-- 				break
-- 			end 		
-- 		end
-- 	end

-- 	if not canTakeHostage then 
-- 		print("Precisa de arma")	
-- 		drawNativeNotification("Você precisa de uma pistola com munição para fazer um refém à mão armada!")
-- 	end
-- 	local closestPlayer = GetClosestPlayer(2)
-- 	if not holdingHostageInProgress and canTakeHostage then	
-- 		if closestPlayer ~= nil then	
-- 			local player = PlayerPedId()	
-- 			lib = 'anim@gangops@hostage@'
-- 			anim1 = 'perp_idle'
-- 			lib2 = 'anim@gangops@hostage@'
-- 			anim2 = 'victim_idle'
-- 			distans = 0.11 --Higher = closer to camera
-- 			distans2 = -0.24 --higher = left
-- 			height = 0.0
-- 			spin = 0.0		
-- 			length = 100000
-- 			controlFlagMe = 49
-- 			controlFlagTarget = 49
-- 			animFlagTarget = 50
-- 			attachFlag = true 
			
-- 			target = GetPlayerServerId(closestPlayer)
		
-- 			SetCurrentPedWeapon(GetPlayerPed(-1), foundWeapon, true)
-- 			holdingHostageInProgress = true
-- 			holdingHostage = true 
-- 			TriggerServerEvent('cmg3_animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,attachFlag)
-- 		end 
-- 	end
-- 	canTakeHostage = false 
-- end 

-- RegisterNetEvent('cmg3_animations:syncTarget')
-- AddEventHandler('cmg3_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag,animFlagTarget,attach)
-- 	local playerPed = GetPlayerPed(-1)
-- 	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
-- 	if holdingHostageInProgress then 
-- 		holdingHostageInProgress = false 
-- 	else 
-- 		holdingHostageInProgress = true
-- 	end
-- 	beingHeldHostage = true 
-- 	RequestAnimDict(animationLib)

-- 	while not HasAnimDictLoaded(animationLib) do
-- 		Wait(10)
-- 	end
-- 	if spin == nil then spin = 180.0 end
-- 	if attach then 
-- 		AttachEntityToEntity(GetPlayerPed(-1), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
-- 	end
	
-- 	if controlFlag == nil then controlFlag = 0 end
	
-- 	if animation2 == "victim_fail" then 
-- 		SetEntityHealth(GetPlayerPed(-1),0)
-- 		DetachEntity(GetPlayerPed(-1), true, false)
-- 		TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
-- 		beingHeldHostage = false 
-- 		holdingHostageInProgress = false 
-- 	elseif animation2 == "shoved_back" then 
-- 		holdingHostageInProgress = false 
-- 		DetachEntity(GetPlayerPed(-1), true, false)
-- 		TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
-- 		beingHeldHostage = false 
-- 	else
-- 		TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)	
-- 	end
-- end)

-- RegisterNetEvent('cmg3_animations:syncMe')
-- AddEventHandler('cmg3_animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
-- 	local playerPed = GetPlayerPed(-1)
-- 	ClearPedSecondaryTask(GetPlayerPed(-1))
-- 	RequestAnimDict(animationLib)
-- 	while not HasAnimDictLoaded(animationLib) do
-- 		Wait(10)
-- 	end
-- 	if controlFlag == nil then controlFlag = 0 end
-- 	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
-- 	if animation == "perp_fail" then 
-- 		SetPedShootsAtCoord(GetPlayerPed(-1), 0.0, 0.0, 0.0, 0)
-- 		holdingHostageInProgress = false 
-- 	end
-- 	if animation == "shove_var_a" then 
-- 		Wait(900)
-- 		ClearPedSecondaryTask(GetPlayerPed(-1))
-- 		holdingHostageInProgress = false 
-- 	end
-- end)

-- RegisterNetEvent('cmg3_animations:cl_stop')
-- AddEventHandler('cmg3_animations:cl_stop', function()
-- 	holdingHostageInProgress = false
-- 	beingHeldHostage = false 
-- 	holdingHostage = false 
-- 	ClearPedSecondaryTask(GetPlayerPed(-1))
-- 	DetachEntity(GetPlayerPed(-1), true, false)
-- end)


-- CreateThread(function()
-- 	while true do 
-- 		local time = 1000
-- 		if holdingHostage then
-- 			time = 0
-- 			if IsEntityDead(GetPlayerPed(-1)) then
-- 				--print("release this mofo")			
-- 				holdingHostage = false
-- 				holdingHostageInProgress = false 
-- 				local closestPlayer = GetClosestPlayer(2)
-- 				target = GetPlayerServerId(closestPlayer)
-- 				TriggerServerEvent("cmg3_animations:stop",target)
-- 				Wait(100)
-- 				releaseHostage()
-- 			end 
-- 			DisableControlAction(0,24,true) -- disable attack
-- 			DisableControlAction(0,25,true) -- disable aim
-- 			DisableControlAction(0,47,true) -- disable weapon
-- 			DisableControlAction(0,58,true) -- disable weapon
-- 			DisablePlayerFiring(GetPlayerPed(-1),true)
-- 			local playerCoords = GetEntityCoords(GetPlayerPed(-1))
-- 			DrawText3D(playerCoords.x,playerCoords.y,playerCoords.z,"Pressione [Q] para soltar, [E] para matar")
-- 			if IsDisabledControlJustPressed(0,44) then --release	
-- 				holdingHostage = false
-- 				holdingHostageInProgress = false 
-- 				local closestPlayer = GetClosestPlayer(2)
-- 				target = GetPlayerServerId(closestPlayer)
-- 				TriggerServerEvent("cmg3_animations:stop",target)
-- 				Wait(100)
-- 				releaseHostage()
-- 			elseif IsDisabledControlJustPressed(0,51) then --kill 
-- 				holdingHostage = false
-- 				holdingHostageInProgress = false 		
-- 				local closestPlayer = GetClosestPlayer(2)
-- 				target = GetPlayerServerId(closestPlayer)
-- 				TriggerServerEvent("cmg3_animations:stop",target)				
-- 				killHostage()
-- 			end
-- 		end
-- 		if beingHeldHostage then 
-- 			DisableControlAction(0,21,true) -- disable sprint
-- 			DisableControlAction(0,24,true) -- disable attack
-- 			DisableControlAction(0,25,true) -- disable aim
-- 			DisableControlAction(0,47,true) -- disable weapon
-- 			DisableControlAction(0,58,true) -- disable weapon
-- 			DisableControlAction(0,263,true) -- disable melee
-- 			DisableControlAction(0,264,true) -- disable melee
-- 			DisableControlAction(0,257,true) -- disable melee
-- 			DisableControlAction(0,140,true) -- disable melee
-- 			DisableControlAction(0,141,true) -- disable melee
-- 			DisableControlAction(0,142,true) -- disable melee
-- 			DisableControlAction(0,143,true) -- disable melee
-- 			DisableControlAction(0,75,true) -- disable exit vehicle
-- 			DisableControlAction(27,75,true) -- disable exit vehicle  
-- 			DisableControlAction(0,22,true) -- disable jump
-- 			DisableControlAction(0,32,true) -- disable move up
-- 			DisableControlAction(0,268,true)
-- 			DisableControlAction(0,33,true) -- disable move down
-- 			DisableControlAction(0,269,true)
-- 			DisableControlAction(0,34,true) -- disable move left
-- 			DisableControlAction(0,270,true)
-- 			DisableControlAction(0,35,true) -- disable move right
-- 			DisableControlAction(0,271,true)
-- 		end

-- 		Wait(time)
-- 	end
-- end)

-- function releaseHostage()
-- 	local player = PlayerPedId()	
-- 	lib = 'reaction@shove'
-- 	anim1 = 'shove_var_a'
-- 	lib2 = 'reaction@shove'
-- 	anim2 = 'shoved_back'
-- 	distans = 0.11 --Higher = closer to camera
-- 	distans2 = -0.24 --higher = left
-- 	height = 0.0
-- 	spin = 0.0		
-- 	length = 100000
-- 	controlFlagMe = 120
-- 	controlFlagTarget = 0
-- 	animFlagTarget = 1
-- 	attachFlag = false
-- 	local closestPlayer = GetClosestPlayer(2)
-- 	target = GetPlayerServerId(closestPlayer)
-- 	if closestPlayer ~= nil then
-- 		TriggerServerEvent('cmg3_animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,attachFlag)
-- 	end
-- end 

-- function killHostage()
-- 	local player = PlayerPedId()	
-- 	lib = 'anim@gangops@hostage@'
-- 	anim1 = 'perp_fail'
-- 	lib2 = 'anim@gangops@hostage@'
-- 	anim2 = 'victim_fail'
-- 	distans = 0.11 --Higher = closer to camera
-- 	distans2 = -0.24 --higher = left
-- 	height = 0.0
-- 	spin = 0.0		
-- 	length = 0.2
-- 	controlFlagMe = 168
-- 	controlFlagTarget = 0
-- 	animFlagTarget = 1
-- 	attachFlag = false
-- 	local closestPlayer = GetClosestPlayer(2)
-- 	target = GetPlayerServerId(closestPlayer)
-- 	if closestPlayer ~= nil then
-- 		--print("triggering cmg3_animations:sync")
-- 		TriggerServerEvent('cmg3_animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget,attachFlag)
-- 	end	
-- end 


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -- FUNCTIONS
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function GetPlayers()
    local players = {}
    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end
function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)
    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
 
    if onScreen then
        SetTextScale(0.19, 0.19)
        SetTextFont(0)
        SetTextProportional(1)
        -- SetTextScale(0.0, 0.55)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
