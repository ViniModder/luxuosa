CreateThread(function()
    LoadInterior(GetInteriorAtCoords(440.84,-983.14,30.69))
    for _,ipl in pairs(allIpls) do
        loadInt(ipl.coords,ipl.interiorsProps)
    end
end)

function loadInt(coordsTable,table)
    for _,coords in pairs(coordsTable) do
        local interiorID = GetInteriorAtCoords(coords[1],coords[2],coords[3])
        LoadInterior(interiorID)
        for _,propName in pairs(table) do
            Citizen.Wait(10)
            EnableInteriorProp(interiorID,propName)
        end
        RefreshInterior(interiorID)
    end
end

allIpls = {
    {
        interiorsProps = {
            "swap_clean_apt",
            "layer_debra_pic",
            "layer_whiskey",
            "swap_sofa_A"
        },
        coords = {{ -1150.7,-1520.7,10.6 }}
    },
    {
        interiorsProps = {
            "csr_beforeMission",
            "csr_inMission"
        },
        coords = {{ -47.1,-1115.3,26.5 }}
    },
    {
        interiorsProps = {
            "V_Michael_bed_tidy",
            "V_Michael_M_items",
            "V_Michael_D_items",
            "V_Michael_S_items",
            "V_Michael_L_Items"
        },
        coords = {{ -802.3,175.0,72.8 }}
    },
    {
        interiorsProps = {
            "coke_stash1",
            "coke_stash2",
            "coke_stash3",
            "decorative_02",
            "furnishings_02",
            "walls_01",
            "mural_02",
            "gun_locker",
            "mod_booth"
        },
        coords = {{ 994.7432, -123.19, 73.06125 }} -- Motoclub
    },
    {
        interiorsProps = {
            "chair01",
            "equipment_basic",
            "interior_upgrade",
            "security_low",
            "set_up"
        },
        coords = {{ 1163.8,-3195.7,-39.0 }} -- EscritÃ³rio
    },
    {
        interiorsProps = {
            "Int01_ba_clubname_01",
            "Int01_ba_Style03",
            "Int01_ba_style03_podium",
            "Int01_ba_equipment_setup",
            "Int01_ba_equipment_upgrade",
            "Int01_ba_security_upgrade",
            "Int01_ba_dj04",
            "DJ_01_Lights_01",
            "DJ_02_Lights_01",
            "DJ_03_Lights_01",
            "DJ_04_Lights_01",
            "Int01_ba_bar_content",
            "Int01_ba_booze_03",
            "Int01_ba_trophy01",
            "Int01_ba_Clutter",
            "Int01_ba_deliverytruck",
            "Int01_ba_dry_ice",
            "light_rigs_off",
            "Int01_ba_lightgrid_01",
            "Int01_ba_trad_lights",
            "Int01_ba_trophy04",
            "Int01_ba_trophy05",
            "Int01_ba_trophy07",
            "Int01_ba_trophy08",
            "Int01_ba_trophy09",
            "Int01_ba_trophy10",
            "Int01_ba_trophy11",
            "Int01_ba_booze_01",
            "Int01_ba_booze_02",
            "Int01_ba_booze_03",
            "int01_ba_lights_screen",
            "Int01_ba_bar_content"
        },
        coords = {{ 455.042877, 186.9544, 89.29362 }} -- Galaxy
    }
}