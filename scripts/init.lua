Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

-- Locations
Tracker:AddLocations("locations/locations.json")
--Tracker:AddLocations("locations/locations_hints.json")

-- Layout
Tracker:AddLayouts("layouts/items.json")
--Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/wincon.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
