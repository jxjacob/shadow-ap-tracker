ScriptHost:LoadScript("scripts/autotracking/default_mappings.lua")

MISSION_MAPPING = {
    s100_0 = {35, "gun", true},
    s100_2 = {45, "alien", true},
    s201_0 = {5, "jewel", false},
    s201_2 = {60, "alien", true},
    s202_2 = {1, "tank", false},
    s300_0 = {5, "lantern", false},
    s300_2 = {2, "cream", false},
    s301_0 = {40, "gun", true},
    s301_2 = {5, "disc", false},
    s302_0 = {20, "gun", true},
    s400_0 = {5, "big", false},
    s400_2 = {20, "small", false},
    s401_0 = {60, "gun", true},
    s401_2 = {10, "researcher", false},
    s402_0 = {5, "ship", false},
    s402_2 = {5, "jewel", false},
    s403_0 = {30, "bomb", false},
    s403_2 = {4, "terminal", false},
    s404_2 = {50, "alien", true},
    s500_0 = {4, "defense", false},
    s501_0 = {1, "president", false},
    s501_2 = {35, "alien", true},
    s502_0 = {28, "gun", true},
    s502_2 = {1, "balloon", false},
    s503_0 = {6, "defense", false},
    s504_2 = {35, "chaos", true},
    s600_0 = {3, "computer", false},
    s601_0 = {50, "gun", true},
    s602_0 = {5, "lava", false},
    s604_0 = {4, "switch", false}
}

SAB_LOCK = false

STAGE_ACCESS_MAPPING = {}

STAGE_ACCESS_BOOLS = {
    s100 = false,
    s200 = false,
    s200 = false,
    s201 = false,
    s202 = false,
    s300 = false,
    s301 = false,
    s302 = false,
    s400 = false,
    s401 = false,
    s402 = false,
    s403 = false,
    s404 = false,
    s500 = false,
    s501 = false,
    s502 = false,
    s503 = false,
    s504 = false,
    s600 = false,
    s601 = false,
    s602 = false,
    s603 = false,
    s604 = false,
    s700 = false,
}

STAGE_EXCLUDED = {}

STAGE_REGION_MAPPING = {
    s202_2 = {"2", "true"},
    s300_0 = {"1", "w_torch"},
    s300_1 = {"2", "true"},
    s300_2 = {"2", "true"},
    s301_1 = {"2", "true"},
    s402_0 = {"true", "v_blackarmsturret"},
    s402_1 = {"5", "true"},
    s403_0 = {"1", "true"},
    s403_1 = {"1", "true"},
    s403_2 = {"1", "true"},
    s500_0 = {"1", "w_gun"},
    s501_0 = {"2", "true"},
    s502_2 = {"2", "true"},
    s503_1 = {"1", "true"},
    s604_2 = {"1", "true"},
    s210_1 = {"1", "true"},
    s310_1 = {"1", "true"},
    s410_1 = {"1", "true"},
    s411_1 = {"1", "true"},
    s412_1 = {"1", "true"},
    s510_1 = {"1", "true"},
    s511_1 = {"1", "true"},
    s610_1 = {"1", "true"},
    s611_1 = {"1", "true"},
    s612_1 = {"1", "true"},
    s613_1 = {"1", "true"},
    s614_1 = {"1", "true"},
    s615_1 = {"1", "true"},
    s616_1 = {"1", "true"},
    s617_1 = {"1", "true"},
    s618_1 = {"1", "true"}
}

-- table where the spoken name Mad Matrix gets converted into 403
-- why couldn't you have just given me the level code chaotix you jerk
STAGE_CODE_MAPPING = {
    Westopolis = 100,
    Digital_Circuit = 200,
    Glyphic_Canyon = 201,
    Lethal_Highway = 202,
    Cryptic_Castle = 300,
    Prison_Island = 301,
    Circus_Park = 302,
    Central_City = 400,
    The_Doom = 401,
    Sky_Troops = 402,
    Mad_Matrix = 403,
    Death_Ruins = 404,
    The_Ark = 500,
    Air_Fleet = 501,
    Iron_Jungle = 502,
    Space_Gadget = 503,
    Lost_Impact = 504,
    Gun_Fortress = 600,
    Black_Comet = 601,
    Lava_Shelter = 602,
    Cosmic_Fall = 603,
    Final_Haunt = 604
}


------------------------------------------------------------------------

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

function shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end


function string_split(inputstr, sep)
    -- if sep is null, set it as space
    if sep == nil then
       sep = '%s'
    end
    -- define an array
    local t={}
    -- split string based on sep   
    for str in string.gmatch(inputstr, '([^'..sep..']+)') 
    do
       -- insert the substring in table
       table.insert(t, str)
    end
    -- return the array
    return t
end


function has_value(t, val)
    for i, v in ipairs(t) do
        if v == val then
            return true
        end
    end
    return false
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end
  

-----------------------------------

function resetAccessibleRegions()
    if SAB_LOCK == true then
        print("could not reset SAB due to lock")
        return
    end
    for key, value in pairs(STAGE_ACCESS_BOOLS) do
        -- reset
        STAGE_ACCESS_BOOLS[key] = false
    end
end

function chooseTables()
    if Tracker:ProviderCountForCode("custom_stage_mapping") == 1 then
        print("THIS IS CUSTOM MAPPING")
        STAGE_ACCESS_MAPPING = SLOT_DATA["STAGE_ACCESS_MAPPING"]
    else
        print("THIS IS VANILLA MAPPING")
        STAGE_ACCESS_MAPPING = DEFAULT_STAGE_ACCESS_MAPPING
    end

    -- print(dump_table(STAGE_ACCESS_MAPPING))
    -- print("----------------------------------------------------------")

    if Tracker:ProviderCountForCode("custom_stage_exclusion") == 1 then
        print("THIS IS CUSTOM EXCLUSION")
        STAGE_EXCLUDED = SLOT_DATA["STAGE_EXCLUDED"]
    else
        print("THIS IS VANILLA EXCLUSION")
        STAGE_EXCLUDED = DEFAULT_STAGE_EXCLUDED
    end

    -- print(dump_table(STAGE_EXCLUDED))

end

function parse_story_shuffle(inputtext)
    -- print(dump_table(STAGE_ACCESS_MAPPING))

    -- copy?
    local localSAM = shallowcopy(DEFAULT_STAGE_ACCESS_MAPPING)
    for key, value in pairs(localSAM) do
        -- wipe data
        localSAM[key] = {}
    end

    -- print("\n\n\n")
    -- split input based on / (these are the connectors for each level)
    local connectors = string_split(inputtext, "/")
    for _, v in ipairs(connectors) do 
        -- from there, split on &
        local params = string_split(v, "&")
        -- 1 = source level
        -- 2 = dest level
        -- 3 = mission
        -- 4 = boss intermission

        if params[1] == "-1" then
            -- if [1] == -1. set [2] to true in STAGE_ACCESS_MAPPING
            table.insert(localSAM["s"..params[2]], "true")
        elseif params[4] ~= "-1" then
            -- else if [4] != -1, set the following in SAM
                -- [4]'s source is [1]_[3]
                table.insert(localSAM["s"..params[4]], (params[1] .. "_" .. params[3]))
                -- a -1 here means its an end boss and doesnt count
                if params[2] ~= "-1" then
                    -- [2]'s source is [1]_[3]&[4]
                    table.insert(localSAM["s"..params[2]], (params[1] .. "_" .. params[3] .. "&" .. params[4]))
                end
        else
            -- else, set [2]'s source is [1]_[3]
            table.insert(localSAM["s"..params[2]], (params[1] .. "_" .. params[3]))
        end
    end

    return localSAM
end

function set_excluded_stages(inputtable)
    -- copy?
    local localSE = shallowcopy(DEFAULT_STAGE_EXCLUDED)
    for _, v in ipairs(inputtable) do
        localSE["s"..STAGE_CODE_MAPPING[v:gsub(" ", "_")]] = true
    end
    return localSE
end

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
    local lcode = string.sub(level_code, 1,3)
    if (STAGE_REGION_MAPPING["s"..level_code] == nil) then
        return true
    end
    local acodes = STAGE_REGION_MAPPING["s"..level_code]
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

-- for map visibility
function stage_visible(level_code)
    return (STAGE_EXCLUDED["s"..level_code] == false)
end

function boss_visible(level_code)
    if (tablelength(STAGE_ACCESS_MAPPING) == 0) then
        chooseTables()
    end
    if (Tracker:ProviderCountForCode("custom_stage_mapping") == 0) then
        -- take first of SAM
        local hoststage = STAGE_ACCESS_MAPPING["s"..level_code][1]
        -- chop off the alignment number
        local hostcode = string.sub(hoststage, 1,3)
        -- return if that number is in excluded_stages
        return (STAGE_EXCLUDED["s"..hostcode] == false)
    end
    return (#STAGE_ACCESS_MAPPING["s"..level_code] ~= 0)
end

function stage_available(level_code, isRecursive, previouslySearched)
    previouslySearched = previouslySearched or {}
    if (tablelength(STAGE_ACCESS_MAPPING) == 0) then
        chooseTables()
    end
    if Tracker:ProviderCountForCode("level_progression_select") == 1 then
        -- if the progression is select-based, then return its code
        return (Tracker:ProviderCountForCode(level_code .. "_stage") == 1)
    elseif Tracker:ProviderCountForCode("level_progression_both") == 1 and isRecursive == "0" then
        -- if the progression is both, return true if level accessible that way, otherwise move on the recursive loop
        if Tracker:ProviderCountForCode(level_code .. "_stage") == 1 then
            return true
        end
    end

    -- if code is lw and NOT shuffle_last_way return CanReachDevilDoom
    if (level_code == "700" and Tracker:ProviderCountForCode("shuffle_last_way") == 0) then
        return CanReachDevilDoom()
    end

    -- if we're playing with secret_story, just rely on the _warp access and skip the recursive BS
    if Tracker:ProviderCountForCode("secret_story_progression") == 1 then
        return (Tracker:ProviderCountForCode(level_code .. "_warp") == 1)
    end

    if (STAGE_EXCLUDED["s"..level_code] == true) then
        return false
    end

    SAB_LOCK = true
    local stagedata = STAGE_ACCESS_MAPPING["s"..level_code]

    if STAGE_ACCESS_BOOLS["s"..level_code] == true then
        return true
    end
    if has_value(previouslySearched, level_code) == true then
        return false
    end
    if has_value(previouslySearched, level_code) == false then
        table.insert(previouslySearched, level_code)
    end
    local canReachStage = false
    for key, value in pairs(stagedata) do repeat
        -- the westopolis code; always available in story mode
        if value == "true" then
            STAGE_ACCESS_BOOLS["s"..level_code] = true
            return true
        end
        if canReachStage == true then
            print(value.." is in SAB, returning true")
            break
        end
        
        local splitcode = string_split(value, "&")
        
        local lcode = string.sub(splitcode[1], 1,3)
        local lmission = string.sub(splitcode[1], 5,5)
        
        --print("attempting prev "..lcode)
        if (Tracker:ProviderCountForCode("custom_stage_mapping") == 1) then
            if has_value(previouslySearched, lcode) == true then
                do break end
            else
                table.insert(previouslySearched, lcode)
            end
        end

        local bosschain = true
        if #splitcode == 2 then
            bosschain = story_region_available(splitcode[2].."_1")
        end

        if lmission == "1" then
            canReachStage = stage_available(lcode, "1", previouslySearched) and story_region_available(lcode.."_"..lmission) and bosschain
        else
            canReachStage = stage_available(lcode, "1", previouslySearched) and objective_clearable(lcode, lmission) and story_region_available(lcode.."_"..lmission) and bosschain
        end
    until true end

    SAB_LOCK = false
    if STAGE_ACCESS_BOOLS["s"..level_code] == false and canReachStage == true then
        print("setting SAB for "..level_code)
    end
    STAGE_ACCESS_BOOLS["s"..level_code] = canReachStage
    return canReachStage
end


function objective_clearable(level_code, alightment)
    local lookup_id = "s".. level_code .. "_" .. alightment
    if (MISSION_MAPPING[lookup_id] == nil) then
        return true
    end
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

function freq_calc(rank, freq, final)
    if freq == 1 or tonumber(rank) == final then
        return true
    end
    return rank % freq == 0
end

function objective_visible(level_code, alightment, rank)
    local lookup_id = "s".. level_code .. "_" .. alightment
    local mission_item = tostring(level_code .. "_" .. MISSION_MAPPING[lookup_id][2])
    if MISSION_MAPPING[lookup_id][3] == true then
        local freq = math.floor(100/tonumber(Tracker:ProviderCountForCode("objective_enemy_frequency")))
        local finalcheck = math.floor(tonumber(MISSION_MAPPING[lookup_id][1])*Tracker:ProviderCountForCode("objective_enemy_percentage")/100)
        return (tonumber(rank) <= finalcheck and freq_calc(rank, freq, finalcheck))
    else
        local freq = math.floor(100/tonumber(Tracker:ProviderCountForCode("objective_frequency")))
        local finalcheck = math.ceil(tonumber(MISSION_MAPPING[lookup_id][1])*Tracker:ProviderCountForCode("objective_percentage")/100)
        return (tonumber(rank) <= finalcheck and freq_calc(rank, freq, finalcheck))
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
    if level_code == "100" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "200" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "201" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "202" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        elseif region_num == 2 then
            -- fake region for Craft logic. if easy, it requires shadow_rifle, else needs A Gun
            if (Tracker:ProviderCountForCode("craft_difficulty_easy") == 1) then
                return Tracker:ProviderCountForCode("shadow_rifle_weapon") == 1
            else 
                return has_weapon_type("gun")
            end
        end
    elseif level_code == "300" then
        if region_num == 1 then
            -- torch
            return has_weapon_type("torch")
        elseif region_num == 2 then
            -- black hawk
            return has_vehicle("blackhawk") and region_accessible("300", 1)
        elseif region_num == 3 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("300", 2)
        end
    elseif level_code == "301" then
        if region_num == 1 then
            -- air saucer
            return has_vehicle("saucer")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("301", 1)
        end
    elseif level_code == "302" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "400" then
        if region_num == 1 then
            -- car (easy only)
            if (Tracker:ProviderCountForCode("logic_difficulty_easy") == 1) then
                return has_vehicle("car")
            else 
                return true
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("400", 1)
        end
    elseif level_code == "401" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "402" then
        if region_num == 1 then
            -- gunjumper (easy only)
            if (Tracker:ProviderCountForCode("logic_difficulty_easy") == 1) then
                return has_vehicle("gunjumper")
            else 
                return true
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("402", 1)
        elseif region_num == 3 then
            -- blackvolt from region 2
            return has_vehicle("blackvolt") and region_accessible("402", 2)
        elseif region_num == 4 then
            -- blackhawk from region 1
            return has_vehicle("blackhawk") and region_accessible("402", 1)
        elseif region_num == 5 then
            -- from region 3 or 4
            return region_accessible("402", 3) or region_accessible("402", 4)
        end
    elseif level_code == "403" then
        if region_num == 1 then
            -- longrangegun (normal and below)
            if (Tracker:ProviderCountForCode("logic_difficulty_hard") == 1) then
                return true
            else 
                return has_weapon_type("longrangegun")
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("403", 1)
        end
    elseif level_code == "404" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "500" then
        if region_num == 1 then
            -- blackvolt
            return has_vehicle("blackvolt")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("500", 1)
        end
    elseif level_code == "501" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        elseif region_num == 2 then
            -- fake region for Craft logic. if easy, it requires shadow_rifle, else needs A Gun
            if (Tracker:ProviderCountForCode("craft_difficulty_easy") == 1) then
                return Tracker:ProviderCountForCode("shadow_rifle_weapon") == 1
            else 
                return has_weapon_type("gun")
            end
        end
    elseif level_code == "502" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        elseif region_num == 2 then
            -- fake region for Craft logic. if easy, it requires shadow_rifle, else needs A Gun
            if (Tracker:ProviderCountForCode("craft_difficulty_easy") == 1) then
                return Tracker:ProviderCountForCode("shadow_rifle_weapon") == 1
            else 
                return has_weapon_type("gun")
            end
        end
    elseif level_code == "503" then
        if region_num == 1 then
            -- air sacuer (normal and below)
            if (Tracker:ProviderCountForCode("logic_difficulty_hard") == 1) then
                return true
            else 
                return has_vehicle("saucer")
            end
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("503", 1)
        end
    elseif level_code == "504" then
        if region_num == 1 then
            -- gunlift
            return has_vehicle("gunlift")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("504", 1)
        end
    elseif level_code == "600" then
        -- NOTE: there is supposed to be a region before the door for either a Long-Range-Gun available in GF or a turret. I am choosing to ignore this until someone notices
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "601" then
        if region_num == 1 then
            -- air saucer
            return has_vehicle("saucer")
        elseif region_num == 2 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true and region_accessible("601", 1)
        end
    elseif level_code == "602" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        end
    elseif level_code == "603" then
        if region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it
            return true
        elseif region_num == 2 then
            -- gunjumper from region 0
            return has_vehicle("gunjumper")
        elseif region_num == 3 then
            -- from region 1 or 2
            return region_accessible("603", 1) or region_accessible("603", 2)
        end
    elseif level_code == "604" then
        if region_num == 1 then
            -- vacuum (normal and below)
            if (Tracker:ProviderCountForCode("logic_difficulty_hard") == 1) then
                return true
            else 
                return has_weapon_type("vacuum")
            end
        elseif region_num == 2 then
            -- blackvolt
            return has_vehicle("blackvolt") and region_accessible("604", 1)
        elseif region_num == 1 then
            -- keydoor. if keys are put into pool, change this to account for it FROM REGION 1
            return true and region_accessible("604", 1)
        end
    elseif level_code == "700" then
        if region_num == 1 then
            -- post-blackvolt
            return has_vehicle("blackvolt")
        end
        -- shockingly, theres no keydoor in last way despite having keys
    elseif level_code == "511" then
        if region_num == 1 then
            -- a fake region for the gun requirement for IJ Breaker
            return has_vehicle("gunturret")
        end
    elseif level_code == "210" or level_code == "310" or level_code == "410" or level_code == "411" or level_code == "412" or level_code == "510" or level_code == "610" or level_code == "611" or level_code == "612" or level_code == "613" or level_code == "614" or level_code == "615" or level_code == "616" or level_code == "617" or level_code == "618" then
        if region_num == 1 then
            -- a fake region for the gun requirement for easy bosses
            if (Tracker:ProviderCountForCode("boss_difficulty_easy") == 1) then
                -- this is so incredibly wrong i can't believe i'm actually using it
                return has_weapon_type("gun")
            else 
                return true
            end
        end
    end

    -- shouldt end up here but just in case
    print("INVALID CODE FOR " .. level_code .. " - " .. region_num)
    return false

end

function CanReachDevilDoom()
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
    local required_boss_tokens = Tracker:ProviderCountForCode("goal_boss_missions")
    local required_final_boss_tokens = Tracker:ProviderCountForCode("goal_final_boss_missions")

    local current_mission_tokens = Tracker:ProviderCountForCode("token_neutral")
    local current_hero_tokens = Tracker:ProviderCountForCode("token_hero")
    local current_dark_tokens = Tracker:ProviderCountForCode("token_dark")
    local current_objective_tokens = Tracker:ProviderCountForCode("token_objective")
    local current_final_tokens = Tracker:ProviderCountForCode("token_final")
    local current_boss_tokens = Tracker:ProviderCountForCode("token_boss")
    local current_final_boss_tokens = Tracker:ProviderCountForCode("token_final_boss")


    local emerald_check = true
    local entrance_check = true

    if STAGE_ACCESS_MAPPING["s710"] ~= {} then
        entrance_check = stage_available("710", "0")
    end

    if required_emeralds > 0 then
        if emerald_1 > 0 and emerald_2 > 0 and emerald_3 > 0 and emerald_4 > 0 and emerald_5 > 0 and emerald_6 > 0 and emerald_7 > 0 then
			emerald_check = true
		else
            emerald_check = false
        end
    end

    if emerald_check and current_mission_tokens >= required_mission_tokens and current_hero_tokens >= required_hero_tokens and current_dark_tokens >= required_dark_tokens and current_final_tokens >= required_final_tokens and current_objective_tokens >= required_objective_tokens
    and current_boss_tokens >= required_boss_tokens
    and current_final_boss_tokens >= required_final_boss_tokens then
        return true
    end

    return false

end

ScriptHost:AddWatchForCode("regionalterting", "RegionAltering", resetAccessibleRegions)
ScriptHost:AddWatchForCode("tablechoosing", "TableChoosing", chooseTables)