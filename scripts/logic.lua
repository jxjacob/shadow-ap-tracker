MISSION_MAPPING = {
    wo_1 = {35, "gun"},
    wo_0 = {45, "alien"},
    gc_1 = {5, "jewel"},
    gc_0 = {60, "alien"},
    lh_0 = {1, "tank"},
    cc_1 = {5, "lantern"},
    cc_0 = {2, "cream"},
    pi_1 = {40, "gun"},
    pi_0 = {5, "disc"},
    cp_1 = {20, "gun"},
    ci_1 = {5, "big"},
    ci_0 = {20, "small"},
    td_1 = {60, "gun"},
    td_0 = {10, "researcher"},
    st_1 = {5, "ship"},
    st_0 = {5, "jewel"},
    mm_1 = {30, "bomb"},
    mm_0 = {4, "terminal"},
    dr_0 = {50, "alien"},
    ta_1 = {4, "defense"},
    af_1 = {1, "president"},
    af_0 = {35, "alien"},
    ij_1 = {28, "gun"},
    ij_0 = {1, "balloon"},
    sg_1 = {6, "defense"},
    li_0 = {35, "chaos"},
    gf_1 = {3, "computer"},
    bc_1 = {50, "gun"},
    ls_1 = {5, "lava"},
    fh_1 = {4, "switch"}
}

function objective_clearable(level_code, alightment)
    local lookup_id = level_code .. "_" .. alightment
    local mission_item = tostring(level_code .. "_" .. MISSION_MAPPING[lookup_id][2])
    local mission_item_count = Tracker:ProviderCountForCode(mission_item)
    local o_i_p = Tracker:ProviderCountForCode("objective_item_percentage")
    return (mission_item_count/tonumber(MISSION_MAPPING[lookup_id][1]))*100 >= o_i_p
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