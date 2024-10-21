MISSION_MAPPING = {
    wo_1 = {35, "gun"},
    wo_0 = {45, "alien"},
    cc_1 = {5, "lantern"},
    cc_0 = {2, "cream"},
}

function objective_clearable(level_code, alightment)
    local lookup_id = level_code .. "_" .. alightment
    local mission_item = tostring(level_code .. "_" .. MISSION_MAPPING[lookup_id][2])
    local mission_item_count = Tracker:ProviderCountForCode(mission_item)
    local o_i_p = Tracker:ProviderCountForCode("objective_item_percentage")
    return (mission_item_count/tonumber(MISSION_MAPPING[lookup_id][1]))*100 >= o_i_p
end