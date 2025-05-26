Citizen.CreateThread(function()
    prepare("snt_races/downloadData","SELECT * FROM snt_races_data")
    prepare("snt_races/purgeData","DELETE FROM snt_races_data WHERE user_id = @user_id AND data_type = @data_type AND race_name = @race_name")
    prepare("snt_races/insertData","INSERT INTO snt_races_data(user_id,race_name,data_type,data_value) VALUES (@user_id,@race_name,@data_type,@data_value)")
end)

vars = {}
vars.races_cooldown = {}
vars.racing_players = {}
vars.races_wins_cache = {}
vars.races_loses_cache = {}
vars.races_times_cache = {}
vars.updater_cache = {}
vars.updater_cache.wins = {}
vars.updater_cache.loses = {}

function _download_stats()
    for _,__ in pairs(explosive_races) do
        vars.races_wins_cache[__.name] = {}
        vars.races_loses_cache[__.name] = {}
        vars.races_times_cache[__.name] = {}
        vars.updater_cache.wins[__.name] = {}
        vars.updater_cache.loses[__.name] = {}
    end
    local q = query("snt_races/downloadData")
    for _,__ in pairs(q) do
        if vars.races_wins_cache[__.race_name] then
            if __.data_type == 0 then
                if vars.updater_cache.loses[__.race_name] then
                    vars.updater_cache.loses[__.race_name][__.user_id] = __.data_value
                    if not vars.races_loses_cache[__.race_name][1] then
                        vars.races_loses_cache[__.race_name][1] = {get_char_name_by_user_id(__.user_id),__.data_value}
                    else
                        if __.data_value > vars.races_loses_cache[__.race_name][1][2] then
                            vars.races_loses_cache[__.race_name][2] = vars.races_loses_cache[__.race_name][1]
                            vars.races_loses_cache[__.race_name][1] = {get_char_name_by_user_id(__.user_id),__.data_value}
                        else
                            if not vars.races_loses_cache[__.race_name][2] then
                                vars.races_loses_cache[__.race_name][2] = {get_char_name_by_user_id(__.user_id),__.data_value}
                            else
                                if __.data_value > vars.races_loses_cache[__.race_name][2][2] then
                                    vars.races_loses_cache[__.race_name][3] = vars.races_loses_cache[__.race_name][2]
                                    vars.races_loses_cache[__.race_name][2] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                else
                                    if not vars.races_loses_cache[__.race_name][3] then
                                        vars.races_loses_cache[__.race_name][3] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                    else
                                        if __.data_value > vars.races_loses_cache[__.race_name][3][2] then
                                            vars.races_loses_cache[__.race_name][3] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            elseif __.data_type == 1 then
                vars.updater_cache.wins[__.race_name][__.user_id] = __.data_value
                if not vars.races_wins_cache[__.race_name][1] then
                    vars.races_wins_cache[__.race_name][1] = {get_char_name_by_user_id(__.user_id),__.data_value}
                else
                    if __.data_value > vars.races_wins_cache[__.race_name][1][2] then
                        vars.races_wins_cache[__.race_name][2] = vars.races_wins_cache[__.race_name][1]
                        vars.races_wins_cache[__.race_name][1] = {get_char_name_by_user_id(__.user_id),__.data_value}
                    else
                        if not vars.races_wins_cache[__.race_name][2] then
                            vars.races_wins_cache[__.race_name][2] = {get_char_name_by_user_id(__.user_id),__.data_value}
                        else
                            if __.data_value > vars.races_wins_cache[__.race_name][2][2] then
                                vars.races_wins_cache[__.race_name][3] = vars.races_wins_cache[__.race_name][2]
                                vars.races_wins_cache[__.race_name][2] = {get_char_name_by_user_id(__.user_id),__.data_value}
                            else
                                if not vars.races_wins_cache[__.race_name][3] then
                                    vars.races_wins_cache[__.race_name][3] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                else
                                    if __.data_value > vars.races_wins_cache[__.race_name][3][2] then
                                        vars.races_wins_cache[__.race_name][3] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                    end
                                end
                            end
                        end
                    end
                end
            elseif __.data_type == 2 then
                if not vars.races_times_cache[__.race_name][1] then
                    vars.races_times_cache[__.race_name][1] = {get_char_name_by_user_id(__.user_id),__.data_value}
                else
                    if __.data_value > vars.races_times_cache[__.race_name][1][2] then
                        vars.races_times_cache[__.race_name][2] = vars.races_times_cache[__.race_name][1]
                        vars.races_times_cache[__.race_name][1] = {get_char_name_by_user_id(__.user_id),__.data_value}
                    else
                        if not vars.races_times_cache[__.race_name][2] then
                            vars.races_times_cache[__.race_name][2] = {get_char_name_by_user_id(__.user_id),__.data_value}
                        else
                            if __.data_value > vars.races_times_cache[__.race_name][2][2] then
                                vars.races_times_cache[__.race_name][3] = vars.races_times_cache[__.race_name][2]
                                vars.races_times_cache[__.race_name][2] = {get_char_name_by_user_id(__.user_id),__.data_value}
                            else
                                if not vars.races_times_cache[__.race_name][3] then
                                    vars.races_times_cache[__.race_name][3] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                else
                                    if __.data_value > vars.races_times_cache[__.race_name][3][2] then
                                        vars.races_times_cache[__.race_name][3] = {get_char_name_by_user_id(__.user_id),__.data_value}
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    vars.s_loaded = true
end

function _store_stats(u,rn,d,dv)
    if d == 0 or d == 1 then
        if d == 1 then
            if vars.updater_cache.wins[rn][u] then
                dv = dv + vars.updater_cache.wins[rn][u]
                execute("snt_races/purgeData",{ user_id = u, race_name = rn, data_type = d})
            end
            execute("snt_races/insertData",{ user_id = u, race_name = rn, data_type = d, data_value = dv })
            vars.updater_cache.wins[rn][u] = dv
        else
            if vars.updater_cache.loses[rn][u] then
                dv = dv + vars.updater_cache.loses[rn][u]
                execute("snt_races/purgeData",{ user_id = u, race_name = rn, data_type = d})
            end
            execute("snt_races/insertData",{ user_id = u, race_name = rn, data_type = d, data_value = dv })
            vars.updater_cache.loses[rn][u] = dv
        end
    end
    if d == 2 then
        execute("snt_races/insertData",{ user_id = u, race_name = rn, data_type = d, data_value = dv })
    end
end

Citizen.CreateThread(function()
    _download_stats()
    while true do
        Citizen.Wait(60000)
        for u,_ in pairs(vars.races_cooldown) do
            if (_ - 1) <= 0 then
                vars.races_cooldown[u] = nil
            else
                vars.races_cooldown[u] = (_ - 1)
            end
        end
    end
end)

RegisterServerEvent("snt_races/srequest/get_config")
AddEventHandler("snt_races/srequest/get_config",function()
    local s = source
    TriggerClientEvent("snt_races/sresponse/get_config",s,{ races_explosion = races_explosion, race_explosion_after_time = race_explosion_after_time, explosive_races_start_point = explosive_races_start_point })
end)

RegisterServerEvent("snt_races/srequest/get_races_info")
AddEventHandler("snt_races/srequest/get_races_info",function()
    local s = source
    local u = get_user_id_by_source(s)
    if not can_race(u) then
        return false
    end
    local t = {}
    for _,__ in pairs(explosive_races) do
        local rtl = {} for i = 0,3 do if vars.races_loses_cache[__.name][i] then rtl[i] = vars.races_loses_cache[__.name][i] end end
        local rtw = {} for i = 0,3 do if vars.races_wins_cache[__.name][i] then rtw[i] = vars.races_wins_cache[__.name][i] end end
        local rtt = {} for i = 0,3 do if vars.races_times_cache[__.name][i] then rtt[i] = vars.races_times_cache[__.name][i] end end
        table.insert(t,{  

            name = __.name,
            desc = __.desc,
            time = __.time,
            prize = __.prize,
            top_times = rtt,
            top_winners = rtw,
            top_losers = rtl,
        })
    end
    TriggerClientEvent("snt_races/sresponse/get_races_info",s,t)
end)

RegisterNetEvent("snt_races/srequest/start_race")
AddEventHandler("snt_races/srequest/start_race",function(rn)
    local s = source
    local user_id = vRP.getUserId(source)
    local u = get_user_id_by_source(s)
    if vars.races_cooldown[u] then
        if tonumber(vars.races_cooldown[u]) > 0 then
            notify_function(s,"error",lang.wait_cooldown)
            return
        end
    end
    local r = nil
    for _,__ in pairs(explosive_races) do
        if __.name == rn then
            r = _
        end
    end
    if r then
        if explosive_races[r].needed ~= nil then
            if remove_race_ticket(user_id) then
                vars.racing_players[u] = r
                vars.races_cooldown[u] = races_cooldown
                notify_function(s,"success",lang.race_started:gsub("{RACE_ID}",r))
                notify_police_start()
                TriggerClientEvent("snt_races/sresponse/start_race",s,explosive_races[r].points,explosive_races[r].time)
            end
            return
        end
        vars.racing_players[u] = r
        vars.races_cooldown[u] = races_cooldown
        notify_function(s,"success",lang.race_started:gsub("{RACE_ID}",r))
        notify_police_start()
        TriggerClientEvent("snt_races/sresponse/start_race",s,explosive_races[r].points,explosive_races[r].time)
    end
end)

RegisterServerEvent("snt_races/stats/finished_racing")
AddEventHandler("snt_races/stats/finished_racing",function(f,rt)
    local s = source
    local u = get_user_id_by_source(s)
    if f then
      
        if vars.racing_players[u] then
            
            local i = explosive_races[vars.racing_players[u]]

            pay_race_prize(u,i.prize)
            _store_stats(u,i.name,1,1)
            if rt then
                _store_stats(u,i.name,2,rt)
            end
        end
    else
        
        if vars.racing_players[u] then
            local i = explosive_races[vars.racing_players[u]]
            _store_stats(u,i.name,0,1)
        end
    end
    _download_stats()
end)

function format_currency(f)
    while true do  
        f,n = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1.%2') 
        if ( n ==0 ) then
            break
        end
    end
    return f
end

RegisterServerEvent("snt_races/rpolice/create_racer_blip")
AddEventHandler("snt_races/rpolice/create_racer_blip",function(x,y,z)
    create_racer_blip_to_police(x,y,z)
end)



