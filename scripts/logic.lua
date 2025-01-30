MISSION_MAPPING = {
    wo_1 = {35, "gun", true},
    wo_0 = {45, "alien", true},
    gc_1 = {5, "jewel", false},
    gc_0 = {60, "alien", true},
    lh_0 = {1, "tank", false},
    cc_1 = {5, "lantern", false},
    cc_0 = {2, "cream", false},
    pi_1 = {40, "gun", true},
    pi_0 = {5, "disc", false},
    cp_1 = {20, "gun", true},
    ci_1 = {5, "big", false},
    ci_0 = {20, "small", false},
    td_1 = {60, "gun", true},
    td_0 = {10, "researcher", false},
    st_1 = {5, "ship", false},
    st_0 = {5, "jewel", false},
    mm_1 = {30, "bomb", false},
    mm_0 = {4, "terminal", false},
    dr_0 = {50, "alien", true},
    ta_1 = {4, "defense", false},
    af_1 = {1, "president", false},
    af_0 = {35, "alien", true},
    ij_1 = {28, "gun", true},
    ij_0 = {1, "balloon", false},
    sg_1 = {6, "defense", false},
    li_0 = {35, "chaos", true},
    gf_1 = {3, "computer", false},
    bc_1 = {50, "gun", true},
    ls_1 = {5, "lava", false},
    fh_1 = {4, "switch", false}
}

STAGE_ACCESS_MAPPING = {
    wo = {"true"},
    dc = {"wo_1"},
    gc = {"wo_3"},
    lh = {"wo_0"},
    cc = {"dc_3", "gc_1"},
    pi = {"gc_3"},
    cp = {"gc_0", "lh_0"},
    ci = {"cc_1"},
    td = {"cc_3", "pi_1"},
    st = {"pi_3"},
    mm = {"pi_0", "cp_3"},
    dr = {"cp_3"},
    ta = {"ci_1", "td_0"},
    af = {"td_3", "st_1"},
    ij = {"st_3"},
    sg = {"st_0", "mm_3"},
    li = {"mm_0", "dr_0"},
    gf = {"ta_1", "af_1"},
    bc = {"af_3", "ij_1"},
    ls = {"ij_3"},
    cf = {"ij_0", "sg_3"},
    fh = {"sg_3"}
}

-- this table sucks
STAGE_REGION_MAPPING = {
    wo_0 = {"true", "true"},
    wo_1 = {"true", "true"},
    wo_3 = {"true", "true"},
    dc_3 = {"true", "true"},
    gc_0 = {"true", "true"},
    gc_1 = {"true", "true"},
    gc_3 = {"true", "true"},
    lh_0 = {"true", "w_gun"},
    cc_1 = {"1", "w_torch"},
    cc_3 = {"2", "true"},
    pi_1 = {"true", "true"},
    pi_0 = {"true", "true"},
    pi_3 = {"2", "true"},
    cp_3 = {"true", "true"},
    ci_1 = {"true", "true"},
    td_0 = {"true", "true"},
    td_3 = {"true", "true"},
    st_0 = {"true", "v_blackarmsturret"},
    st_3 = {"5", "true"},
    st_1 = {"true", "true"},
    mm_0 = {"1", "true"},
    mm_1 = {"1", "true"},
    mm_3 = {"1", "true"},
    dr_0 = {"true", "true"},
    ta_1 = {"1", "w_gun"},
    af_1 = {"true", "w_gun"},
    af_3 = {"true", "true"},
    ij_1 = {"true", "true"},
    ij_3 = {"true", "true"},
    ij_0 = {"true", "w_gun"},
    sg_3 = {"1", "true"},
}

function has_weapon_type(weapon)
    if Tracker:ProviderCountForCode("weaponsanity_enabled") == 0 then
        return true
    end 
    
    if weapon == "torch" and Tracker:ProviderCountForCode("cryptic_torch_weapon") > 0 then
        return true
    elseif weapon == "vacuum" and (Tracker:ProviderCountForCode("vacuum_pod_weapon") > 0 or Tracker:ProviderCountForCode("egg_vacuum_weapon") > 0) then
        return true
    elseif weapon == "gun" then
        -- this is so shit and is probably wrong lmao
        return Tracker:ProviderCountForCode("sub_machine_gun_weapon") > 0 or Tracker:ProviderCountForCode("semi_automatic_rifle_weapon") > 0 or Tracker:ProviderCountForCode("heavy_machine_gun_weapon") > 0 or Tracker:ProviderCountForCode("gatling_gun_weapon") > 0 or Tracker:ProviderCountForCode("egg_gun_weapon") > 0 or Tracker:ProviderCountForCode("laser_rifle_weapon") > 0 or Tracker:ProviderCountForCode("refractor_weapon") > 0 or Tracker:ProviderCountForCode("omochao_gun_weapon") > 0 or Tracker:ProviderCountForCode("shadow_rifle_weapon") > 0 or Tracker:ProviderCountForCode("pistol_weapon") > 0 or Tracker:ProviderCountForCode("light_shot_weapon") > 0 or Tracker:ProviderCountForCode("flash_shot_weapon") > 0 or Tracker:ProviderCountForCode("ring_shot_weapon") > 0 or Tracker:ProviderCountForCode("heavy_shot_weapon") > 0 or Tracker:ProviderCountForCode("splitter_weapon") > 0 
    elseif weapon == "longrangegun" then
        return Tracker:ProviderCountForCode("sub_machine_gun_weapon") > 0 or Tracker:ProviderCountForCode("semi_automatic_rifle_weapon") > 0 or Tracker:ProviderCountForCode("heavy_machine_gun_weapon") > 0 or Tracker:ProviderCountForCode("gatling_gun_weapon") > 0 or Tracker:ProviderCountForCode("egg_gun_weapon") > 0 or Tracker:ProviderCountForCode("laser_rifle_weapon") > 0 or Tracker:ProviderCountForCode("refractor_weapon") > 0 or Tracker:ProviderCountForCode("omochao_gun_weapon") > 0 or Tracker:ProviderCountForCode("shadow_rifle_weapon") > 0
    end

    return false
end

function has_vehicle(vehicle)
    if Tracker:ProviderCountForCode("vehiclesanity_enabled") == 0 then
        return true
    end 

    if vehicle == "blackhawk" and Tracker:ProviderCountForCode("black_hawk_vehicle") > 0 then
        return true
    elseif vehicle == "blackvolt" and Tracker:ProviderCountForCode("black_volt_vehicle") > 0 then
        return true
    elseif vehicle == "blackarmsturret" and Tracker:ProviderCountForCode("black_turret_vehicle") > 0 then
        return true
    elseif vehicle == "car" and Tracker:ProviderCountForCode("standard_car_vehicle") > 0 then
        return true
    elseif vehicle == "gunjumper" and Tracker:ProviderCountForCode("gun_jumper_vehicle") > 0 then
        return true
    elseif vehicle == "gunlift" and Tracker:ProviderCountForCode("gun_lift_vehicle") > 0 then
        return true
    elseif vehicle == "saucer" and Tracker:ProviderCountForCode("air_saucer_vehicle") > 0 then
        return true
    elseif vehicle == "gunturret" and Tracker:ProviderCountForCode("gun_turret_vehicle") > 0 then
        return true
    end

    return false
end

function story_region_available(level_code)
    local lcode = string.sub(level_code, 1,2)
    local acodes = STAGE_REGION_MAPPING[level_code]
    local rbool = false
    local wbool = false

    for key, value in pairs(acodes) do
        if key == 1 then
            if value == "true" then 
                rbool = true
            else
                rbool = region_accessible(lcode, tonumber(value))
            end
        else 
            if value == "true" then 
                wbool = true
            else
                local wtype = string.sub(value, 1,1)
                local wname = string.sub(value, 3,-1)
                if wtype == "w" then
                    wbool = has_weapon_type(wname)
                else
                    wbool = has_vehicle(wname)
                end
            end
        end

    end
    return (rbool and wbool)
end

function weapon_access(level_code, region_code, weapon_code)
    if Tracker:ProviderCountForCode("weaponsanity_hold_all") == 1 then
        return stage_available(level_code, "0") and region_accessible(level_code, region_code)
    elseif Tracker:ProviderCountForCode("weaponsanity_hold_unlocked") == 1 then
        return stage_available(level_code, "0") and (Tracker:ProviderCountForCode(weapon_code .. "_weapon") == 1) and region_accessible(level_code, region_code)
    end
    -- the code shouldnt be here but haha anyways
    return false
end

function stage_available(level_code, isRecursive)
    if Tracker:ProviderCountForCode("level_progression_select") == 1 then
        -- if the progression is select-based, then return its code
        return (Tracker:ProviderCountForCode(level_code .. "_stage") == 1)
    elseif Tracker:ProviderCountForCode("level_progression_both") == 1 and isRecursive == "0" then
        -- if the progression is both, return true if level accessible that way, otherwise move on the recursive loop
        if Tracker:ProviderCountForCode(level_code .. "_stage") == 1 then
            return true
        end
    end

    local stagedata = STAGE_ACCESS_MAPPING[level_code]

    local canReachStage = false
    for key, value in pairs(stagedata) do
        -- the westopolis code; always available in story mode
        if value == "true" then
            return true
        end
        if canReachStage == true then
            break
        end

        local lcode = string.sub(value, 1,2)
        local lmission = string.sub(value, 4,4)

        local stupidboss = true
        if lcode == "ij" then
            stupidboss = has_vehicle("gunturret")
        end

        if lmission == "3" then
            canReachStage = stage_available(lcode, "1") and story_region_available(value) and stupidboss
        else
            canReachStage = stage_available(lcode, "1") and objective_clearable(lcode, lmission) and story_region_available(value) and stupidboss
        end
    end

    return canReachStage
end


function objective_clearable(level_code, alightment)
    local lookup_id = level_code .. "_" .. alightment
    local mission_item = tostring(level_code .. "_" .. MISSION_MAPPING[lookup_id][2])
    local mission_item_count = Tracker:ProviderCountForCode(mission_item)
    if MISSION_MAPPING[lookup_id][3] == true then
        return mission_item_count >= math.floor(tonumber(MISSION_MAPPING[lookup_id][1])*Tracker:ProviderCountForCode("objective_completion_enemy_percentage")/100)
    elseif MISSION_MAPPING[lookup_id][1] == 1 then
        return mission_item_count == 1
    else
        return mission_item_count >= math.floor(tonumber(MISSION_MAPPING[lookup_id][1])*Tracker:ProviderCountForCode("objective_completion_percentage")/100)
    end
end

function objective_visible(level_code, alightment, rank)
    local lookup_id = level_code .. "_" .. alightment
    local mission_item = tostring(level_code .. "_" .. MISSION_MAPPING[lookup_id][2])
    if MISSION_MAPPING[lookup_id][3] == true then
        return tonumber(rank) <= math.floor(tonumber(MISSION_MAPPING[lookup_id][1])*Tracker:ProviderCountForCode("objective_enemy_percentage")/100)
    else
        return tonumber(rank) <= math.ceil(tonumber(MISSION_MAPPING[lookup_id][1])*Tracker:ProviderCountForCode("objective_percentage")/100)
    end
end

function region_accessible(level_code, region_num)
    if Tracker:ProviderCountForCode("weaponsanity_enabled") == 0 and Tracker:ProviderCountForCode("vehiclesanity_enabled") == 0 then
        -- if BOTH are disabled then you dont even need to check for the logic, since its always true
        return true
    end

    region_num = tonumber(region_num)

    -- for calls for region 0 (weapons, mostly)
    if region_num == 0 then
        return true
    end

    -- god i hate this function
    if level_code == "wo" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "dc" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "gc" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "lh" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "cc" then
        if region_num == 1 then
            -- torch
            return has_weapon_type("torch")
        elseif region_num == 2 then
            -- black hawk
            return has_vehicle("blackhawk") and region_accessible("cc", 1)
        elseif region_num == 3 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("cc", 2)
        end
    elseif level_code == "pi" then
        if region_num == 1 then
            -- air saucer
            return has_vehicle("saucer")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("pi", 1)
        end
    elseif level_code == "cp" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "ci" then
        if region_num == 1 then
            -- car (easy only)
            if (Tracker:ProviderCountForCode("logic_difficulty_easy") == 1) then
                return has_vehicle("car")
            else 
                return true
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("ci", 1)
        end
    elseif level_code == "td" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "st" then
        if region_num == 1 then
            -- gunjumper (easy only)
            if (Tracker:ProviderCountForCode("logic_difficulty_easy") == 1) then
                return has_vehicle("gunjumper")
            else 
                return true
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("st", 1)
        elseif region_num == 3 then
            -- blackvolt from region 2
            return has_vehicle("blackvolt") and region_accessible("st", 2)
        elseif region_num == 4 then
            -- blackhawk from region 1
            return has_vehicle("blackhawk") and region_accessible("st", 1)
        elseif region_num == 5 then
            -- from region 3 or 4
            return region_accessible("st", 3) or region_accessible("st", 4)
        end
    elseif level_code == "mm" then
        if region_num == 1 then
            -- longrangegun (normal and below)
            if (Tracker:ProviderCountForCode("logic_difficulty_hard") == 1) then
                return true
            else 
                return has_weapon_type("longrangegun")
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("mm", 1)
        end
    elseif level_code == "dr" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "ta" then
        if region_num == 1 then
            -- blackvolt
            return has_vehicle("blackvolt")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("ta", 1)
        end
    elseif level_code == "af" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "ij" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "sg" then
        if region_num == 1 then
            -- air sacuer (normal and below)
            if (Tracker:ProviderCountForCode("logic_difficulty_hard") == 1) then
                return true
            else 
                return has_vehicle("saucer")
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("sg", 1)
        end
    elseif level_code == "li" then
        if region_num == 1 then
            -- gunlift
            return has_vehicle("gunlift")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("li", 1)
        end
    elseif level_code == "gf" then
        -- NOTE: there is supposed to be a region before the door for either a Long-Range-Gun available in GF or a turret. I am choosing to ignore this until someone notices
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "bc" then
        if region_num == 1 then
            -- air saucer
            return has_vehicle("saucer")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("bc", 1)
        end
    elseif level_code == "ls" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "cf" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        elseif region_num == 2 then
            -- gunjumper from region 0
            return has_vehicle("gunjumper")
        elseif region_num == 3 then
            -- from region 1 or 2
            return region_accessible("cf", 1) or region_accessible("cf", 2)
        end
    elseif level_code == "fh" then
        if region_num == 1 then
            -- vacuum (normal and below)
            if (Tracker:ProviderCountForCode("logic_difficulty_hard") == 1) then
                return true
            else 
                return has_weapon_type("vacuum")
            end
        elseif region_num == 2 then
            -- blackvolt
            return has_vehicle("blackvolt") and region_accessible("fh", 1)
        elseif region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it FROM REGION 1
            return true and region_accessible("fh", 1)
        end
    end

    -- shouldt end up here but just in case
    print("INVALID CODE FOR " .. level_code .. " - " .. region_num)
    return false

end

function CanReachLast()
    local required_emeralds = Tracker:ProviderCountForCode("goal_emeralds")

    local emerald_1 = Tracker:ProviderCountForCode("white_emerald")
	local emerald_2 = Tracker:ProviderCountForCode("red_emerald")
	local emerald_3 = Tracker:ProviderCountForCode("blue_emerald")
	local emerald_4 = Tracker:ProviderCountForCode("cyan_emerald")
	local emerald_5 = Tracker:ProviderCountForCode("yellow_emerald")
	local emerald_6 = Tracker:ProviderCountForCode("purple_emerald")
	local emerald_7 = Tracker:ProviderCountForCode("green_emerald")


    local required_mission_tokens = Tracker:ProviderCountForCode("goal_missions")
    local required_hero_tokens = Tracker:ProviderCountForCode("goal_hero_missions")
    local required_dark_tokens = Tracker:ProviderCountForCode("goal_dark_missions")
    local required_objective_tokens = Tracker:ProviderCountForCode("goal_objective_missions")
    local required_final_tokens = Tracker:ProviderCountForCode("goal_final_missions")

    local current_mission_tokens = Tracker:ProviderCountForCode("token_neutral")
    local current_hero_tokens = Tracker:ProviderCountForCode("token_hero")
    local current_dark_tokens = Tracker:ProviderCountForCode("token_dark")
    local current_objective_tokens = Tracker:ProviderCountForCode("token_objective")
    local current_final_tokens = Tracker:ProviderCountForCode("token_final")


    local emerald_check = true
    
    if required_emeralds > 0 then
        if emerald_1 > 0 and emerald_2 > 0 and emerald_3 > 0 and emerald_4 > 0 and emerald_5 > 0 and emerald_6 > 0 and emerald_7 > 0 then
			emerald_check = true
		else
            emerald_check = false
        end
    end

    if emerald_check and current_mission_tokens >= required_mission_tokens and current_hero_tokens >= required_hero_tokens and current_dark_tokens >= required_dark_tokens and current_final_tokens >= required_final_tokens and current_objective_tokens >= required_objective_tokens then
        return true
    end

    return false

end