ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/weapon_groups.lua")
ScriptHost:LoadScript("scripts/logic.lua")

CUR_INDEX = -1
SLOT_DATA = nil

function has_value (t, val)
    for i, v in ipairs(t) do
        if v == val then return 1 end
    end
    return 0
end

function dump_table(o, depth)
    if depth == nil then
        depth = 0
    end
    if type(o) == 'table' then
        local tabs = ('\t'):rep(depth)
        local tabs2 = ('\t'):rep(depth + 1)
        local s = '{\n'
        for k, v in pairs(o) do
            if type(k) ~= 'number' then
                k = '"' .. k .. '"'
            end
            s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
        end
        return s .. tabs .. '}'
    else
        return tostring(o)
    end
end

function onClear(slot_data)
    SLOT_DATA = slot_data
    CUR_INDEX = -1

    for _, v in pairs(ITEM_MAPPING) do
        if v[1] then
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    if obj.Active then
                        obj.CurrentStage = 0
                    else
                        obj.Active = true
                    end
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                end
            end
        end
    end


    for k, v in pairs(LOCATION_MAPPING) do
        local loc_list = LOCATION_MAPPING[k]
        for i, loc in ipairs(loc_list) do
            local obj = Tracker:FindObjectForCode(loc)
            if obj then
                if loc:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                    obj.Active = false
                end
            end
        end
    end

    print(dump_table(slot_data))
    
    -- sanities
    if slot_data['objective_sanity'] then
        local objsanity = Tracker:FindObjectForCode("objectivesanity_enabled")
        objsanity.Active = (slot_data['objective_sanity'])
    end

    if slot_data['objective_enemy_sanity'] then
        local objsanity = Tracker:FindObjectForCode("enemy_objectivesanity_enabled")
        objsanity.Active = (slot_data['objective_enemy_sanity'])
    end

    if slot_data['checkpoint_sanity'] then
        local checksanity = Tracker:FindObjectForCode("checkpointsanity_enabled")
        checksanity.Active = (slot_data['checkpoint_sanity'])
    end

    if slot_data['key_sanity'] then
        local keysanity = Tracker:FindObjectForCode("keysanity_enabled")
        keysanity.Active = (slot_data['key_sanity'])
    end

    if slot_data['character_sanity'] then
        local charsanity = Tracker:FindObjectForCode("charactersanity_enabled")
        charsanity.Active = (slot_data['character_sanity'])
    end

    if slot_data['weapon_sanity_unlock'] then
        local weapsanity = Tracker:FindObjectForCode("weaponsanity_enabled")
        weapsanity.Active = (slot_data['weapon_sanity_unlock'])
    end

    if slot_data['weapon_sanity_hold'] then
        local weaponholdsanity = Tracker:FindObjectForCode("weaponsanity_hold_enabled")
        weaponholdsanity.CurrentStage = (slot_data['weapon_sanity_hold'])
    end

    -- logic
    if slot_data['story_mode_available'] then
        local stagemode = 0
        if slot_data['story_mode_available'] == true then
            stagemode = 1
            if slot_data['select_mode_available'] == true then
                stagemode = 2
            end
        end
        local levelprog = Tracker:FindObjectForCode("level_progression")
        levelprog.CurrentStage = (stagemode)
    end

    if slot_data['include_last_way_shuffle'] then
        local inclw = Tracker:FindObjectForCode("shuffle_last_way")
        inclw.Active = (slot_data['include_last_way_shuffle'])
    end

    if slot_data['logic_level'] then
        Tracker:FindObjectForCode("logic_difficulty").CurrentStage = (slot_data['logic_level'])
    else
        Tracker:FindObjectForCode("logic_difficulty").CurrentStage = 1
    end

    if slot_data['boss_logic_level'] then
        Tracker:FindObjectForCode("boss_difficulty").CurrentStage = (slot_data['boss_logic_level'])
    else
        Tracker:FindObjectForCode("boss_difficulty").CurrentStage = 1
    end

    if slot_data['craft_logic_level'] then
        Tracker:FindObjectForCode("craft_difficulty").CurrentStage = (slot_data['craft_logic_level'])
    else
        Tracker:FindObjectForCode("craft_difficulty").CurrentStage = 1
    end

    if slot_data['vehicle_logic'] then
        local objsanity = Tracker:FindObjectForCode("vehiclesanity_enabled")
        objsanity.Active = (slot_data['vehicle_logic'])
    end

    -- if slot_data['shuffled_story_mode'] then
    --     parse_story_shuffle(slot_data['shuffled_story_mode'])
    -- end


    -- objective percentages
    if slot_data['objective_percentage'] then
        local obj_perc = Tracker:FindObjectForCode("objective_percentage")
        obj_perc.AcquiredCount = (slot_data['objective_percentage'])
    end

    if slot_data['objective_enemy_percentage'] then
        local obj_enemy_perc = Tracker:FindObjectForCode("objective_enemy_percentage")
        obj_enemy_perc.AcquiredCount = (slot_data['objective_enemy_percentage'])
    end

    if slot_data['objective_completion_percentage'] then
        local obj_item_perc = Tracker:FindObjectForCode("objective_completion_percentage")
        obj_item_perc.AcquiredCount = (slot_data['objective_completion_percentage'])
    end

    if slot_data['objective_completion_enemy_percentage'] then
        local obj_item_enemy_perc = Tracker:FindObjectForCode("objective_completion_enemy_percentage")
        obj_item_enemy_perc.AcquiredCount = (slot_data['objective_completion_enemy_percentage'])
    end

    if slot_data['objective_frequency'] then
        local obj_item_enemy_perc = Tracker:FindObjectForCode("objective_frequency")
        obj_item_enemy_perc.AcquiredCount = (slot_data['objective_frequency'])
    end

    if slot_data['enemy_objective_frequency'] then
        local obj_item_enemy_perc = Tracker:FindObjectForCode("objective_enemy_frequency")
        obj_item_enemy_perc.AcquiredCount = (slot_data['enemy_objective_frequency'])
    end

    -- wincon
    if slot_data['requires_emeralds'] then
        local require_emeralds = Tracker:FindObjectForCode("goal_emeralds")
        require_emeralds.Active = (slot_data['requires_emeralds'])
    end

    if slot_data['required_mission_tokens'] then
        local req_token_mission = Tracker:FindObjectForCode("goal_missions")
        req_token_mission.AcquiredCount = (slot_data['required_mission_tokens'])
    end

    if slot_data['required_objective_tokens'] then
        local req_token_objective = Tracker:FindObjectForCode("goal_objective_missions")
        req_token_objective.AcquiredCount = (slot_data['required_objective_tokens'])
    end

    if slot_data['required_hero_tokens'] then
        local req_token_hero = Tracker:FindObjectForCode("goal_hero_missions")
        req_token_hero.AcquiredCount = (slot_data['required_hero_tokens'])
    end

    if slot_data['required_dark_tokens'] then
        local req_token_dark = Tracker:FindObjectForCode("goal_dark_missions")
        req_token_dark.AcquiredCount = (slot_data['required_dark_tokens'])
    end

    if slot_data['required_final_tokens'] then
        local req_token_final = Tracker:FindObjectForCode("goal_final_missions")
        req_token_final.AcquiredCount = (slot_data['required_final_tokens'])
    end

    if slot_data['required_boss_tokens'] then
        local req_token_final = Tracker:FindObjectForCode("goal_boss_missions")
        req_token_final.AcquiredCount = (slot_data['required_boss_tokens'])
    end

    if slot_data['required_final_boss_tokens'] then
        local req_token_final = Tracker:FindObjectForCode("goal_final_boss_missions")
        req_token_final.AcquiredCount = (slot_data['required_final_boss_tokens'])
    end



end

function onItem(index, item_id, item_name, player_number)
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v or not v[1] then
        --print(string.format("onItem: could not find item mapping for id %s", item_id))
        return
    end
    -- function for weapon groups to toggle all weapons of its group
    if (string.sub(v[1],-8,-1) == "_weapons") then
        select_all_weapons_in_group(v[1])
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    else
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

function onLocation(location_id, location_name)
    local loc_list = LOCATION_MAPPING[location_id]
    --print(string.format("onLocation: debug for %s %s",location_id, location_name))

    for i, loc in ipairs(loc_list) do
        if not loc then
            return
        end
        local obj = Tracker:FindObjectForCode(loc)
        if obj then
            if loc:sub(1, 1) == "@" then
                obj.AvailableChestCount = obj.AvailableChestCount - 1
            else
                obj.Active = true
            end
        else
            print(string.format("onLocation: could not find location for code %s %s %s", loc, location_id, location_name))
        end
    end
end



Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
