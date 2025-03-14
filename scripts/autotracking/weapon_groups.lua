WEAPON_GROUP_TABLE = {
    stage_melee_weapons = {'speed_limit_sign', 'digital_pole', 'canyon_pole', 'lethal_pole', 'prison_branch', 'circus_pole', 'stop_sign', 'doom_pole', 'sky_pole', 'matrix_pole', 'ruins_branch', 'fleet_pole', 'iron_pole', 'gadget_pole', 'impact_pole', 'fortress_pole', 'lava_shovel', 'cosmic_pole', 'haunt_pole', 'last_pole'},
    environment_weapons = {'speed_limit_sign', 'digital_pole', 'canyon_pole', 'lethal_pole', 'prison_branch', 'circus_pole', 'stop_sign', 'doom_pole', 'sky_pole', 'matrix_pole', 'ruins_branch', 'fleet_pole', 'iron_pole', 'gadget_pole', 'impact_pole', 'fortress_pole', 'lava_shovel', 'cosmic_pole', 'haunt_pole', 'last_pole', 'cryptic_torch'},
    egg_pawn_weapons = {'egg_gun', 'egg_spear', 'egg_bazooka'},
    gun_launcher_weapons = {'rpg', '4_shot_rpg', '8_shot_rpg', 'bazooka', 'tank_cannon'},
    black_warrior_weapons = {'flash_shot', 'light_shot', 'heavy_shot', 'ring_shot', 'black_sword'},
    black_oak_weapons = {'black_sword', 'black_barrel', 'big_barrel', 'dark_hammer'},
    worm_weapons = {'worm_shooter', 'wide_worm_shooter', 'big_worm_shooter'},
    gun_solider_weapons = {'pistol', 'grenade_shooter', 'survival_knife', 'sub_machine_gun'},
    gun_mech_weapons = {'semi_automatic_rifle', 'laser_rifle', 'heavy_machine_gun', 'sub_machine_gun', 'gatling_gun'},
    laser_weapons = {'refractor', 'laser_rifle', 'splitter', 'ring_shot'},
    standard_melee_weapons = {'survival_knife', 'black_sword', 'dark_hammer'},
    all_melee_weapons = {'speed_limit_sign', 'digital_pole', 'canyon_pole', 'lethal_pole', 'prison_branch', 'circus_pole', 'stop_sign', 'doom_pole', 'sky_pole', 'matrix_pole', 'ruins_branch', 'fleet_pole', 'iron_pole', 'gadget_pole', 'impact_pole', 'fortress_pole', 'lava_shovel', 'cosmic_pole', 'haunt_pole', 'last_pole', 'cryptic_torch', 'survival_knife', 'black_sword', 'dark_hammer'},
}



function select_all_weapons_in_group(group_name)
    selected_group = WEAPON_GROUP_TABLE[group_name]
    for key, value in pairs(selected_group) do
        local obj = Tracker:FindObjectForCode(value .. "_weapon")
        obj.Active = true
    end
end