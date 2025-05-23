-- use this file to map the AP item ids to your items
-- first value is the code of the target item and the second is the item type (currently only "toggle", "progressive" and "toggle" but feel free to expand for your needs!)
-- here are the SM items as an example = https://github.com/Cyb3RGER/sm_ap_tracker/blob/main/scripts/autotracking/item_mapping.lua
ITEM_MAPPING = {
    [1743800011] = {"white_emerald", "toggle"},
    [1743800012] = {"cyan_emerald", "toggle"},
    [1743800013] = {"red_emerald", "toggle"},
    [1743800014] = {"green_emerald", "toggle"},
    [1743800015] = {"blue_emerald", "toggle"},
    [1743800016] = {"purple_emerald", "toggle"},
    [1743800017] = {"yellow_emerald", "toggle"},
    [1743800100] = {"100_stage", "toggle"},
    [1743800101] = {"200_stage", "toggle"},
    [1743800102] = {"201_stage", "toggle"},
    [1743800103] = {"202_stage", "toggle"},
    [1743800104] = {"300_stage", "toggle"},
    [1743800105] = {"301_stage", "toggle"},
    [1743800106] = {"302_stage", "toggle"},
    [1743800107] = {"400_stage", "toggle"},
    [1743800108] = {"401_stage", "toggle"},
    [1743800109] = {"402_stage", "toggle"},
    [1743800110] = {"403_stage", "toggle"},
    [1743800111] = {"404_stage", "toggle"},
    [1743800112] = {"500_stage", "toggle"},
    [1743800113] = {"501_stage", "toggle"},
    [1743800114] = {"502_stage", "toggle"},
    [1743800115] = {"503_stage", "toggle"},
    [1743800116] = {"504_stage", "toggle"},
    [1743800117] = {"600_stage", "toggle"},
    [1743800118] = {"601_stage", "toggle"},
    [1743800119] = {"602_stage", "toggle"},
    [1743800120] = {"603_stage", "toggle"},
    [1743800121] = {"604_stage", "toggle"},
    [1743800122] = {"700_stage", "toggle"},
    [1743800123] = {"210_stage", "toggle"},
    [1743800124] = {"310_stage", "toggle"},
    [1743800125] = {"410_stage", "toggle"},
    [1743800126] = {"411_stage", "toggle"},
    [1743800127] = {"412_stage", "toggle"},
    [1743800128] = {"510_stage", "toggle"},
    [1743800129] = {"511_stage", "toggle"},
    [1743800130] = {"610_stage", "toggle"},
    [1743800131] = {"611_stage", "toggle"},
    [1743800132] = {"612_stage", "toggle"},
    [1743800133] = {"613_stage", "toggle"},
    [1743800134] = {"614_stage", "toggle"},
    [1743800135] = {"615_stage", "toggle"},
    [1743800136] = {"616_stage", "toggle"},
    [1743800137] = {"617_stage", "toggle"},
    [1743800138] = {"618_stage", "toggle"},
    [1743801000] = {"100_gun", "consumable"},
    [1743801001] = {"100_alien", "consumable"},
    [1743801002] = {"201_alien", "consumable"},
    [1743801003] = {"201_jewel", "consumable"},
    [1743801004] = {"202_tank", "toggle"},
    [1743801005] = {"300_lantern", "consumable"},
    [1743801006] = {"300_cream", "consumable"},
    [1743801007] = {"301_gun", "consumable"},
    [1743801008] = {"301_disc", "consumable"},
    [1743801009] = {"302_gun", "consumable"},
    [1743801010] = {"400_big", "consumable"},
    [1743801011] = {"400_small", "consumable"},
    [1743801012] = {"401_gun", "consumable"},
    [1743801013] = {"401_researcher", "consumable"},
    [1743801014] = {"402_ship", "consumable"},
    [1743801015] = {"402_jewel", "consumable"},
    [1743801016] = {"403_bomb", "consumable"},
    [1743801017] = {"403_terminal", "consumable"},
    [1743801018] = {"404_alien", "consumable"},
    [1743801019] = {"500_defense", "consumable"},
    [1743801020] = {"501_president", "toggle"},
    [1743801021] = {"501_alien", "consumable"},
    [1743801022] = {"502_gun", "consumable"},
    [1743801023] = {"502_balloon", "toggle"},
    [1743801024] = {"503_defense", "consumable"},
    [1743801025] = {"504_chaos", "consumable"},
    [1743801026] = {"600_computer", "consumable"},
    [1743801027] = {"601_gun", "consumable"},
    [1743801028] = {"602_lava", "consumable"},
    [1743801029] = {"604_switch", "consumable"},
    [1743805000] = {"token_hero", "consumable"},
    [1743805001] = {"token_dark", "consumable"},
    [1743805002] = {"token_neutral", "consumable"},
    [1743805003] = {"token_final", "consumable"},
    [1743805004] = {"token_objective", "consumable"},
    [1743805005] = {"token_boss", "consumable"},
    [1743805006] = {"token_final_boss", "consumable"},
    [1743802000] = {"pistol_weapon", "toggle"},
    [1743802001] = {"sub_machine_gun_weapon", "toggle"},
    [1743802002] = {"semi_automatic_rifle_weapon", "toggle"},
    [1743802003] = {"heavy_machine_gun_weapon", "toggle"},
    [1743802004] = {"gatling_gun_weapon", "toggle"},
    [1743802005] = {"egg_gun_weapon", "toggle"},
    [1743802006] = {"light_shot_weapon", "toggle"},
    [1743802007] = {"flash_shot_weapon", "toggle"},
    [1743802008] = {"ring_shot_weapon", "toggle"},
    [1743802009] = {"heavy_shot_weapon", "toggle"},
    [1743802010] = {"grenade_launcher_weapon", "toggle"},
    [1743802011] = {"bazooka_weapon", "toggle"},
    [1743802012] = {"tank_cannon_weapon", "toggle"},
    [1743802013] = {"black_barrel_weapon", "toggle"},
    [1743802014] = {"big_barrel_weapon", "toggle"},
    [1743802015] = {"egg_bazooka_weapon", "toggle"},
    [1743802016] = {"rpg_weapon", "toggle"},
    [1743802017] = {"4_shot_rpg_weapon", "toggle"},
    [1743802018] = {"8_shot_rpg_weapon", "toggle"},
    [1743802019] = {"worm_shooter_weapon", "toggle"},
    [1743802020] = {"wide_worm_shooter_weapon", "toggle"},
    [1743802021] = {"big_worm_shooter_weapon", "toggle"},
    [1743802022] = {"vacuum_pod_weapon", "toggle"},
    [1743802023] = {"laser_rifle_weapon", "toggle"},
    [1743802024] = {"splitter_weapon", "toggle"},
    [1743802025] = {"refractor_weapon", "toggle"},
    [1743802026] = {"survival_knife_weapon", "toggle"},
    [1743802027] = {"black_sword_weapon", "toggle"},
    [1743802028] = {"dark_hammer_weapon", "toggle"},
    [1743802029] = {"egg_spear_weapon", "toggle"},
    [1743802030] = {"speed_limit_sign_weapon", "toggle"},
    [1743802031] = {"digital_pole_weapon", "toggle"},
    [1743802032] = {"canyon_pole_weapon", "toggle"},
    [1743802033] = {"lethal_pole_weapon", "toggle"},
    [1743802034] = {"cryptic_torch_weapon", "toggle"},
    [1743802035] = {"prison_branch_weapon", "toggle"},
    [1743802036] = {"circus_pole_weapon", "toggle"},
    [1743802037] = {"stop_sign_weapon", "toggle"},
    [1743802038] = {"doom_pole_weapon", "toggle"},
    [1743802039] = {"sky_pole_weapon", "toggle"},
    [1743802040] = {"matrix_pole_weapon", "toggle"},
    [1743802041] = {"ruins_branch_weapon", "toggle"},
    [1743802042] = {"fleet_pole_weapon", "toggle"},
    [1743802043] = {"iron_pole_weapon", "toggle"},
    [1743802044] = {"gadget_pole_weapon", "toggle"},
    [1743802045] = {"impact_pole_weapon", "toggle"},
    [1743802046] = {"fortress_pole_weapon", "toggle"},
    [1743802047] = {"lava_shovel_weapon", "toggle"},
    [1743802048] = {"cosmic_pole_weapon", "toggle"},
    [1743802049] = {"haunt_pole_weapon", "toggle"},
    [1743802050] = {"last_pole_weapon", "toggle"},
    [1743802051] = {"samurai_blade_weapon", "toggle"},
    [1743802052] = {"satellite_gun_weapon", "toggle"},
    [1743802053] = {"egg_vacuum_weapon", "toggle"},
    [1743802054] = {"omochao_gun_weapon", "toggle"},
    [1743802055] = {"heal_cannon_weapon", "toggle"},
    [1743802056] = {"shadow_rifle_weapon", "toggle"},
    [1743802500] = {"standard_car_vehicle", "toggle"},
    [1743802501] = {"convertible_vehicle", "toggle"},
    [1743802502] = {"armored_car_vehicle", "toggle"},
    [1743802503] = {"gun_motorcycle_vehicle", "toggle"},
    [1743802504] = {"gun_jumper_vehicle", "toggle"},
    [1743802505] = {"gun_cannon_vehicle", "toggle"},
    [1743802506] = {"air_saucer_vehicle", "toggle"},
    [1743802507] = {"black_hawk_vehicle", "toggle"},
    [1743802508] = {"black_volt_vehicle", "toggle"},
    [1743802509] = {"gun_turret_vehicle", "toggle"},
    [1743802510] = {"black_turret_vehicle", "toggle"},
    [1743802511] = {"gun_lift_vehicle", "toggle"},
    [1743800150] = {"100_warp", "toggle"},
    [1743800151] = {"200_warp", "toggle"},
    [1743800152] = {"201_warp", "toggle"},
    [1743800153] = {"202_warp", "toggle"},
    [1743800154] = {"300_warp", "toggle"},
    [1743800155] = {"301_warp", "toggle"},
    [1743800156] = {"302_warp", "toggle"},
    [1743800157] = {"400_warp", "toggle"},
    [1743800158] = {"401_warp", "toggle"},
    [1743800159] = {"402_warp", "toggle"},
    [1743800160] = {"403_warp", "toggle"},
    [1743800161] = {"404_warp", "toggle"},
    [1743800162] = {"500_warp", "toggle"},
    [1743800163] = {"501_warp", "toggle"},
    [1743800164] = {"502_warp", "toggle"},
    [1743800165] = {"503_warp", "toggle"},
    [1743800166] = {"504_warp", "toggle"},
    [1743800167] = {"600_warp", "toggle"},
    [1743800168] = {"601_warp", "toggle"},
    [1743800169] = {"602_warp", "toggle"},
    [1743800170] = {"603_warp", "toggle"},
    [1743800171] = {"604_warp", "toggle"},
    [1743800172] = {"700_warp", "toggle"},
    [1743800173] = {"210_warp", "toggle"},
    [1743800174] = {"310_warp", "toggle"},
    [1743800175] = {"410_warp", "toggle"},
    [1743800176] = {"411_warp", "toggle"},
    [1743800177] = {"412_warp", "toggle"},
    [1743800178] = {"510_warp", "toggle"},
    [1743800179] = {"511_warp", "toggle"},
    [1743800180] = {"610_warp", "toggle"},
    [1743800181] = {"611_warp", "toggle"},
    [1743800182] = {"612_warp", "toggle"},
    [1743800183] = {"613_warp", "toggle"},
    [1743800184] = {"614_warp", "toggle"},
    [1743800185] = {"615_warp", "toggle"},
    [1743800186] = {"616_warp", "toggle"},
    [1743800187] = {"617_warp", "toggle"},
    [1743800188] = {"618_warp", "toggle"},
    [1743802600] = {"shadow_rifle_0_weapon", "toggle"},
    [1743802601] = {"shadow_rifle_1_weapon", "toggle"},
    [1743802602] = {"shadow_rifle_2_weapon", "toggle"},
    [1743802603] = {"shadow_rifle_3_weapon", "toggle"},
    [1743802604] = {"shadow_rifle_4_weapon", "toggle"},
    [1743802057] = {"stage_melee_weapons", "toggle"},
    [1743802058] = {"environment_weapons", "toggle"},
    [1743802059] = {"egg_pawn_weapons", "toggle"},
    [1743802060] = {"gun_launcher_weapons", "toggle"},
    [1743802061] = {"black_warrior_weapons", "toggle"},
    [1743802062] = {"black_oak_weapons", "toggle"},
    [1743802063] = {"worm_weapons", "toggle"},
    [1743802064] = {"gun_solider_weapons", "toggle"},
    [1743802065] = {"gun_mech_weapons", "toggle"},
    [1743802066] = {"laser_weapons", "toggle"},
    [1743802067] = {"standard_melee_weapons", "toggle"},
    [1743802068] = {"all_melee_weapons", "toggle"},


}
