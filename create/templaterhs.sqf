private ["_infantry",
		"_infSniper","_infNCO","_infSpecial","_infAuto","_infRegular","_infCrew","_infPilot","_infOfficer",
		"_vTruck","_vSupply","_vPatrol","_vAPC","_vIFV","_vMBT","_heli","_airplane","_artillery",
		"_gSmall","_gPatrol","_gGarrison","_gTeam","_gMissile","_gSquad",
		"_statics",
		"_cfgInf","_lrRadio","_flag","_vfs",
		"_weapons","_ammo","_launchers","_missiles","_mines","_items","_optics","_backpacks","_vests","_helmets",
		"_unlocked_weapons","_unlocked_magazines","_unlocked_rifles","_unlocked_items","_unlocked_backpacks","_unlocked_optics"];

/*
List of infantry classes. These will have individual skills and equipment mapped to them.
If you wish to add more soldiers beyond the available variables, you also need to add any new variables to the genInit.sqf and the genInitBASES.sqf
*/
sol_A_AA = ""; // assistant AA
sol_A_AR = "rhs_vdv_machinegunner_assistant"; // assistant autorifle
sol_A_AT = "rhs_vdv_strelok_rpg_assist"; // assistant AT
sol_AA = "rhs_vdv_aa"; // AA
sol_AR = "rhs_vdv_machinegunner"; // autorifle
sol_AT = "rhs_vdv_at"; // AT
sol_AMMO = ""; // ammo bearer
sol_GL = "rhs_vdv_grenadier"; // grenade launcher
sol_GL2 = "rhs_vdv_grenadier_rpg";
sol_LAT = "rhs_vdv_LAT"; // light AT
sol_LAT2 = "rhs_vdv_RShG2";
sol_MG = "rhs_vdv_arifleman";
sol_MK = "rhs_vdv_marksman"; // marksman
sol_SL = "rhs_vdv_sergeant"; // squad leader
sol_TL = "rhs_vdv_junior_sergeant"; // team leader
sol_TL2 = "rhs_vdv_efreitor";
sol_EXP = ""; // explosives
sol_R_L = "rhs_vdv_rifleman_lite"; // rifleman, light
sol_REP = ""; // repair
sol_UN = ""; // unarmed
sol_RFL = "rhs_vdv_rifleman"; // rifleman
sol_SN = "rhs_vdv_marksman_asval"; // sniper
sol_SP = "rhs_vdv_rifleman_asval"; // spotter
sol_MED = "rhs_vdv_medic"; // medic
sol_ENG = "rhs_vdv_engineer"; // engineer
sol_OFF = "rhs_vdv_officer"; // officer
sol_OFF2 = "rhs_vdv_officer_armored";

sol_CREW = "rhs_vdv_crew"; // crew
sol_CREW2 = "rhs_vdv_armoredcrew";
sol_CREW3 = "rhs_vdv_combatcrew";
sol_CREW4 = "rhs_vdv_crew_commander";
sol_DRV = "rhs_vdv_driver"; // driver
sol_DRV2 = "rhs_vdv_driver_armored";
sol_HCREW = ""; // helicopter crew
sol_HPIL = "rhs_pilot_transport_heli"; // helicopter pilot
sol_HPIL2 = "rhs_pilot_combat_heli";
sol_PIL = "rhs_pilot"; // pilot
sol_UAV = ""; // UAV controller

sol_SUP_AMG = ""; // assistant HMG
sol_SUP_AMTR = ""; // assistant mortar
sol_SUP_GMG = ""; // GMG gunner
sol_SUP_MG = ""; // HMG gunner
sol_SUP_MTR = ""; // mortar gunner

/*
============================================================================
This part is semi-optional. It might be more effort up front, but it'll be easier to make adjustments.
If you're impatient, skip to the next block (default: line 87)
*/

// all classes sorted by role, used for pricing, etc
_infOfficer =	["rhs_vdv_officer","rhs_vdv_officer_armored"];
_infSniper = 	["rhs_vdv_marksman","rhs_vdv_marksman_asval","rhs_vdv_rifleman_asval"];
_infNCO = 		["rhs_vdv_sergeant","rhs_vdv_efreitor","rhs_vdv_junior_sergeant"];
_infSpecial = 	["rhs_vdv_aa","rhs_vdv_at","rhs_vdv_strelok_rpg_assist","rhs_vdv_medic","rhs_vdv_engineer","rhs_vdv_grenadier_rpg"];
_infAuto = 		["rhs_vdv_machinegunner","rhs_vdv_machinegunner_assistant","rhs_vdv_arifleman"];
_infRegular = 	["rhs_vdv_RShG2","rhs_vdv_grenadier","rhs_vdv_rifleman","rhs_vdv_rifleman_lite","rhs_vdv_LAT"];
_infCrew = 		["rhs_vdv_armoredcrew","rhs_vdv_combatcrew","rhs_vdv_crew","rhs_vdv_crew_commander","rhs_vdv_driver","rhs_vdv_driver_armored"];
_infPilot = 	["rhs_pilot_transport_heli","rhs_pilot_combat_heli"];

// all vehicles sorted by role
_vTruck = 		["rhs_gaz66o_vdv","rhs_gaz66_vdv","RHS_Ural_Open_VDV_01","RHS_Ural_VDV_01"];
_vSupply = 		["rhs_gaz66_ammo_vdv","RHS_Ural_Fuel_VDV_01","rhs_gaz66_repair_vdv","rhs_gaz66_ap2_vdv"];
_vPatrol = 		["rhs_tigr_m_vdv","RHS_Mi8mt_vvsc","rhs_gaz66o_vdv","rhs_gaz66_vdv","RHS_Ural_Open_VDV_01","RHS_Ural_VDV_01","rhs_btr60_vdv"];
_vAPC = 		["rhs_btr60_vdv","rhs_btr70_vdv","rhs_btr80_vdv"];
_vIFV = 		["rhs_bmd1","rhs_bmd1k","rhs_bmd1p","rhs_bmd1pk","rhs_bmd2","rhs_bmd2k","rhs_bmd2m",
				"rhs_bmp1_vdv","rhs_bmp1d_vdv","rhs_bmp1k_vdv","rhs_bmp1p_vdv","rhs_bmp2e_vdv","rhs_bmp2_vdv","rhs_bmp2d_vdv","rhs_bmp2k_vdv","rhs_brm1k_vdv"];
_vMBT =			["rhs_t72ba_tv","rhs_t72bb_tv","rhs_t72bc_tv","rhs_t72bd_tv"];
_heli = 		["rhs_ka60_c","RHS_Mi8AMT_vvsc","RHS_Mi8mt_vvsc","RHS_Mi8mt_Cargo_vvsc","RHS_Ka52_vvsc",
				"RHS_Mi24V_AT_vdv","RHS_Mi24V_vdv","RHS_Mi24V_FAB_vdv","RHS_Mi24V_UPK23_vdv","RHS_Mi8AMTSh_vvsc",
				"RHS_Mi24V_UPK23_vvs","RHS_Mi24V_FAB_vvs","RHS_Mi24V_vvs","RHS_Mi24V_AT_vvs","RHS_Mi8mt_vvsc","RHS_Mi8MTV3_vvsc"];
_airplane = 	["RHS_Su25SM_vvsc","RHS_Su25SM_CAS_vvsc","RHS_Su25SM_KH29_vvsc"];

_truckAA = 		"rhs_gaz66_zu23_msv";
_vehSPAA = 		"rhs_zsu234_aa";
// not_used = ["RHS_BM21_VDV_01","rhs_btr80a_vv","rhs_bmd4_vdv","rhs_bmd4m_vdv","rhs_bmd4ma_vdv","rhs_t80bk","rhs_t80bv","rhs_t80ue1","rhs_tigr_sts_vdv","rhs_tigr_vdv"];
// GREF: ["rhsgref_ins_uaz_dshkm","rhsgref_ins_uaz_ags","rhsgref_ins_uaz"]

// pre-defined groups sorted by assignments
_gSmall = 		["rhs_group_rus_vdv_infantry_fireteam","rhs_group_rus_vdv_infantry_MANEUVER","rhs_group_rus_vdv_infantry_MANEUVER"];
_gPatrol = 		["rhs_group_rus_vdv_infantry_fireteam","rhs_group_rus_vdv_infantry_MANEUVER"];
_gGarrison = 	["rhs_group_rus_vdv_infantry_section_mg","rhs_group_rus_vdv_infantry_section_marksman","rhs_group_rus_vdv_infantry_section_AT","rhs_group_rus_vdv_infantry_section_AA",
				"rhs_group_rus_vdv_infantry_section_mg","rhs_group_rus_vdv_infantry_section_marksman"];
_gTeam = 		["rhs_group_rus_vdv_infantry_section_mg","rhs_group_rus_vdv_infantry_section_marksman","rhs_group_rus_vdv_infantry_section_AT","rhs_group_rus_vdv_infantry_section_AA"];
_gMissile = 	["rhs_group_rus_vdv_infantry_section_AT","rhs_group_rus_vdv_infantry_section_AA"];
_gAA = 			["rhs_group_rus_vdv_infantry_section_AA"];
_gAT = 			["rhs_group_rus_vdv_infantry_section_AT"];
_gSquad = 		["rhs_group_rus_vdv_infantry_squad","rhs_group_rus_vdv_infantry_squad_2mg","rhs_group_rus_vdv_infantry_squad_sniper","rhs_group_rus_vdv_infantry_squad_mg_sniper"];

// available statics
_statics =		["rhs_Igla_AA_pod_vdv","rhs_Kornet_9M133_2_vdv","RHS_AGS30_TriPod_VDV","rhs_KORD_VDV","rhs_KORD_high_VDV","RHS_NSV_TriPod_VDV","rhs_SPG9M_VDV",
				"RHS_ZU23_VDV","rhs_Metis_9k115_2_vdv","rhs_2b14_82mm_vdv","rhs_DSHKM_ins","rhs_KORD_high_VDV"];
// GREF: ["rhsgref_ins_DSHKM"]

// config paths for pre-defined groups
_cfgInf = 		(configfile >> "CfgGroups" >> "east" >> "rhs_faction_vdv" >> "rhs_group_rus_vdv_infantry");


// ---------- Equipment----------

// These lists define the ammo box spawn pools.
_weapons = [
	"rhs_weap_ak74m",
	"rhs_weap_ak74m_gp25",
	"rhs_weap_asval_grip",
	"rhs_weap_vss",
	"rhs_weap_svds",
	"rhs_weap_svdp_wd",
	"arifle_AKM_F",
//	"rhs_weap_vss",
//	"rhs_weap_ak74m_2mag",
//	"rhs_weap_ak74m_2mag_camo",
//	"rhs_weap_akm_gp25",
//	"rhs_weap_akms_gp25",
//	"rhs_weap_ak103",
//	"rhs_weap_ak103_gp25",
//	"rhs_weap_ak104",
//	"rhs_weap_ak105",
	"rhs_weap_pkm",
	"rhs_weap_pkp"
];

_ammo = [
	"rhs_30Rnd_545x39_AK",
	"rhs_45Rnd_545x39_AK",
	"rhs_VOG25",
	"rhs_30Rnd_762x39mm",
	"rhs_10Rnd_762x54mmR_7N1",
	"rhs_100Rnd_762x54mmR_green",
	"rhs_20rnd_9x39mm_SP5",
	"rhs_mag_rdg2_white",
	"rhs_mag_fakels",
	"rhs_GDM40",
	"30Rnd_762x39_Mag_Tracer_F",
	"rhs_10rnd_9x39mm_SP5",
	"rhs_20rnd_9x39mm_SP5",
	"rhs_20rnd_9x39mm_SP6"
];

_launchers = [
	"rhs_weap_rpg26",
	"rhs_weap_rshg2",
	"rhs_weap_rpg7",
	"rhs_weap_igla"
];

_missiles = [
	"rhs_rpg7_PG7VL_mag",
	"rhs_rpg7_OG7V_mag",
	"rhs_rpg7_TBG7V_mag",
	"rhs_rpg26_mag",
	"rhs_rshg2_mag",
	"rhs_mag_9k38_rocket"
];

_mines = [
	"rhs_mine_tm62m_mag",
	"rhs_mine_pmn2_mag"
];

// If you want to be able to unlock items/optics, add them to these lists. They will also be added to the spawn pool.
_items = [
	"FirstAidKit",
	"MineDetector",
	"rhs_acc_pgs64",
	//"rhs_acc_dtk1",
	"rhs_acc_dtk",
	//"rhs_acc_dtk3",
	"rhs_pdu4",
	//"rhs_acc_dtk4long",
	"rhs_acc_dtk4short",
	"rhs_acc_2dpZenit",
	"rhs_acc_perst1ik",
	//"rhs_acc_dtk4screws",
	"rhs_acc_pbs1",
	"rhs_acc_pbs4",
	"rhs_acc_tgpa",
	//"rhs_1PN138",
	//"rhs_acc_ak5",
	"rhs_1PN138",
	"ItemGPS",
	"rhs_scarf",
	"rhs_pdu4"
];

// See above.
_optics = [
	//"rhs_acc_1p78",
	"rhs_acc_ekp1",
	//"rhs_acc_1pn93_base",
	//"rhs_acc_ekp1b",
	"rhs_acc_pso1m2",
	"rhs_acc_1p29",
	"rhs_acc_pkas",
	//"rhs_acc_1p63",
	//"rhs_acc_pso1m21",
	"rhs_acc_npz",
	"rhs_acc_pgo7v"
	//"rhs_acc_1pn93_2",
	//"rhs_acc_rakursPM"
];

// White lists for unlocking backpacks, etc. These will NOT spawn in ammo boxes.
_backpacks = [
	"rhs_assault_umbts",
	"rhs_assault_umbts_engineer",
	"rhs_assault_umbts_engineer_empty",
	"rhs_assault_umbts_medic",
	"rhs_rpg",
	"rhs_rpg_empty",
	"rhs_sidor",
	"rhs_sidorMG",
	"RHS_NSV_Gun_Bag",
	"RHS_NSV_Tripod_Bag",
	"RHS_DShkM_Gun_Bag",
	"RHS_DShkM_TripodHigh_Bag",
	"RHS_DShkM_TripodLow_Bag",
	"RHS_Kord_Gun_Bag",
	"RHS_Kord_Tripod_Bag",
	"RHS_Metis_Gun_Bag",
	"RHS_Metis_Tripod_Bag",
	"RHS_Kornet_Gun_Bag",
	"RHS_Kornet_Tripod_Bag",
	"RHS_AGS30_Gun_Bag",
	"RHS_AGS30_Tripod_Bag",
	"RHS_SPG9_Gun_Bag",
	"RHS_SPG9_Tripod_Bag",
	"RHS_Podnos_Gun_Bag",
	"RHS_Podnos_Bipod_Bag",
	"tf_mr3000_rhs",
	"B_Carryall_oli"
];

_vests = [
	"rhs_6b13",
	"rhs_6b13_flora",
	"rhs_6b13_emr",
	"rhs_6b13_6sh92",

	"rhs_6b23",
	"rhs_6b23_crew",
	"rhs_6b23_crewofficer",
	"rhs_vest_commander",
	"rhs_6b23_engineer",
	"rhs_6b23_medic",
	"rhs_6b23_rifleman",
	"rhs_6b23_sniper",
	"rhs_6b23_6sh92",
	"rhs_6b23_6sh92_vog",
	"rhs_6b23_6sh92_vog_headset",
	"rhs_6b23_6sh92_headset",
	"rhs_6b23_6sh92_headset_mapcase",
	"rhs_6b23_6sh92_radio",

	"rhs_6b23_digi",
	"rhs_6b23_digi_crew",
	"rhs_6b23_digi_crewofficer",
	"rhs_6b23_digi_engineer",
	"rhs_6b23_digi_medic",
	"rhs_6b23_digi_rifleman",
	"rhs_6b23_digi_sniper",
	"rhs_6b23_digi_6sh92",
	"rhs_6b23_digi_6sh92_vog",
	"rhs_6b23_digi_6sh92_vog_headset",
	"rhs_6b23_digi_6sh92_headset",
	"rhs_6b23_digi_6sh92_headset_mapcase",
	"rhs_6b23_digi_6sh92_radio",

	"rhs_6b23_ML",
	"rhs_6b23_ML_crew",
	"rhs_6b23_ML_crewofficer",
	"rhs_6b23_ML_engineer",
	"rhs_6b23_ML_medic",
	"rhs_6b23_ML_rifleman",
	"rhs_6b23_ML_sniper",
	"rhs_6b23_ML_6sh92",
	"rhs_6b23_ML_6sh92_vog",
	"rhs_6b23_ML_6sh92_vog_headset",
	"rhs_6b23_ML_6sh92_headset",
	"rhs_6b23_ML_6sh92_headset_mapcase",
	"rhs_6b23_ML_6sh92_radio",

	"rhs_6sh92",
	"rhs_6sh92_vog",
	"rhs_6sh92_vog_headset",
	"rhs_6sh92_headset",
	"rhs_6sh92_radio",
	"rhs_6sh92_digi",
	"rhs_6sh92_digi_vog",
	"rhs_6sh92_digi_vog_headset",
	"rhs_6sh92_digi_headset",
	"rhs_6sh92_digi_radio"
];

_helmets = [
	"rhs_6b26",
	"rhs_6b26_ess",
	"rhs_6b26_bala",
	"rhs_6b26_ess_bala",
	"rhs_6b26_green",
	"rhs_6b26_ess_green",
	"rhs_6b26_bala_green",
	"rhs_6b26_ess_bala_green",
	"rhs_6b27m",
	"rhs_6b27m_ess",
	"rhs_6b27m_bala",
	"rhs_6b27m_ess_bala",
	"rhs_6b27m_digi",
	"rhs_6b27m_digi_ess",
	"rhs_6b27m_digi_bala",
	"rhs_6b27m_digi_ess_bala",
	"rhs_6b27m_ml",
	"rhs_6b27m_ml_ess",
	"rhs_6b27m_ml_bala",
	"rhs_6b27m_ml_ess_bala",
	"rhs_6b27m_green",
	"rhs_6b27m_green_ess",
	"rhs_6b27m_green_bala",
	"rhs_6b27m_green_ess_bala",
	"rhs_6b28",
	"rhs_6b28_ess",
	"rhs_6b28_bala",
	"rhs_6b28_ess_bala",
	"rhs_6b28_flora",
	"rhs_6b28_flora_ess",
	"rhs_6b28_flora_ess_bala",
	"rhs_6b28_flora_bala",
	"rhs_6b28_green",
	"rhs_6b28_green_ess",
	"rhs_6b28_green_bala",
	"rhs_6b28_green_ess_bala",
	"rhs_beret_vdv1"
];



// ---------- Equipment unlocked from the beginning----------

_unlocked_weapons = 	[
	"Binocular",
	"rhs_weap_makarov_pm",
	"rhs_weap_aks74u"
];

_unlocked_magazines = 	[
	"rhs_mag_9x18_8_57N181S",
	"rhs_30Rnd_545x39_7N10_AK",
	"rhs_mag_rdg2_white",

	// rockets for discardable launchers, unlocking them would otherwise be a PITA
	"rhs_rpg26_mag"
	"rhs_rshg2_mag"
	"rhs_m136_hedp_mag"
];

// Standard rifles for AI soldiers are picked from this array. Add only rifles.
_unlocked_rifles = 		[
	"rhs_weap_aks74u"
];

_unlocked_items = 		[
	"ItemMap",
	"ItemWatch",
	"ItemCompass",
	"ItemRadio",
	"FirstAidKit",
	"Medikit",
	"ToolKit",
	"rhs_acc_pgs64_74u", // << AKS-74UN muzzle attachment
	"rhs_acc_dtk", // << default AK74 muzzle attachment
	"U_BG_Guerilla1_1",
	"U_BG_Guerilla2_1",
	"U_BG_Guerilla2_2",
	"U_BG_Guerilla2_3",
	"U_BG_Guerilla3_1",
	"U_BG_Guerilla3_2",
	"U_BG_leader",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"H_Booniehat_grn",
	"H_Booniehat_dirty",
	"H_Cap_oli",
	"H_Cap_blk",
	"H_MilCap_rucamo",
	"H_MilCap_gry",
	"H_BandMask_blk",
	"H_Bandanna_khk",
	"H_Bandanna_gry",
	"H_Bandanna_camo",
	"H_Shemag_khk",
	"H_Shemag_tan",
	"H_Shemag_olive",
	"H_ShemagOpen_tan",
	"H_Beret_grn",
	"H_Beret_grn_SF",
	"H_Watchcap_camo",
	"H_TurbanO_blk",
	"H_Hat_camo",
	"H_Hat_tan",
	"H_Beret_blk",
	"H_Beret_red",
	"H_Beret_02",
	"H_Watchcap_khk",
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli",
	"G_Bandanna_beast",
	"G_Tactical_Black",
	"G_Aviator",
	"G_Shades_Black",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_tricolour",
	"U_C_Poor_1",
	"U_Rangemaster",
	"U_NikosBody",
	"U_IG_Guerilla3_2",
	"U_OG_Guerilla2_1",
	"U_IG_Guerilla1_1",
	"U_I_G_Story_Protagonist_F",
	"U_I_G_resistanceLeader_F",
	"U_C_Poloshirt_blue",
	"U_C_Poloshirt_burgundy",
	"U_C_Poloshirt_stripped",
	"U_C_Poloshirt_tricolour",
	"U_C_Poloshirt_salmon",
	"U_C_Poloshirt_redwhite",
	"U_C_Commoner1_1",
	"U_C_Commoner1_2",
	"U_C_Commoner1_3",
	"U_Rangemaster",
	"U_NikosBody",
	"U_C_Poor_1",
	"U_C_Poor_2",
	"U_C_WorkerCoveralls",
	"U_C_Poor_shorts_1",
	"U_C_Commoner_shorts",
	"U_C_ShirtSurfer_shorts",
	"U_C_TeeSurfer_shorts_1",
	"U_C_TeeSurfer_shorts_2",
	"U_BG_Guerrilla_6_1",
	"U_B_survival_uniform",
	"U_OrestesBody",
	"rhs_vest_pistol_holster",
	"rhs_scarf"
];

_unlocked_backpacks = 	[
	"rhs_assault_umbts"
];

_unlocked_optics = 		[];

// The flag to be used for VDV troops.
_flag = 	"rhs_Flag_vdv_F";

// Affiliation/side: west/east/independent
_side = 	independent;

// Faction-specific long range radio, used for TFAR.
_lrRadio = 	"tf_mr3000_rhs";

/*
These are the vehicles and statics that you can buy at HQ. Currently, the array requires a strict(!) order.
0-2: civilian vehicles
3-12: military vehicles and statics
*/
_vfs = [
	"C_Offroad_01_F",
	"C_Van_01_transport_F",
	"RHS_Mi8amt_civilian",
	"B_G_Quadbike_01_F",
	"rhs_uaz_open_MSV_01",
	"rhs_gaz66o_msv",
	"B_G_Offroad_01_armed_F",
	"rhs_DSHKM_ins",
	"rhs_2b14_82mm_msv",
	"rhs_Metis_9k115_2_vdv",
	"RHS_ZU23_VDV",
	"rhs_bmd1_chdkz",
	"rhs_gaz66_r142_vdv"
];

_civHeli = "RHS_Mi8amt_civilian";

/*
============================================================================
Everything below this line must be filled out, no exceptions. Mind the types: most are arrays, but some are strings!

All the gear you just provided must be mapped onto the variables used in initVar.sqf, which is what this segement does.

Why two sets of variables, you ask? Why not just ignore everything above the line and map them directly?
Well, If you provide the entire roster above, it makes a lot easier to adjust the spawn tables -- you only need to copy-paste your desired changes,
no need to descend into the depths of config files, EDEN, or online databases.

But hey, your call.
*/

// vehicles
vehTrucks = 		_vTruck; // trucks that spawn at outposts, etc
vehPatrol =			_vPatrol; // vehicles used for road patrols;
vehAPC = 			_vAPC; // APCs
vehIFV = 			_vIFV; // IFVs
vehTank = 			_vMBT; // MBTs
vehSupply = 		_vSupply; // supply vehicles (ammo, fuel, med)
vehAmmo = 			"rhs_gaz66_ammo_vdv"; // ammo truck, for special missions
vehLead = 			["rhs_tigr_sts_3camo_vdv"]; // lead vehicle for convoys, preferably armed MRAP/car
standardMRAP = 		["rhs_tigr_vdv","rhs_uaz_vdv"]; // default transport MRAP/car
vehTruckBox = 		["rhs_gaz66_repair_vdv"]; // repair truck or at least a prop
vehTruckAA = 		_truckAA;
vehFIA pushback vehTruckAA;
vehSPAA = 			_vehSPAA;

// air force
heli_unarmed = 		["RHS_Mi8MTV3_vdv","RHS_Mi8mt_vdv","RHS_Mi8MTV3_FAB_vdv","RHS_Mi8MTV3_UPK23_vdv","rhs_ka60_c"]; // (un-)armed transport helicopters
heli_armed = 		["RHS_Mi24V_UPK23_vvsc","RHS_Mi24P_CAS_vvsc","RHS_Mi24P_AT_vvsc","RHS_Mi8AMTSh_UPK23_vvsc"]; // // armed helicopters
planes = 			_airplane; // attack planes
heli_default = 		"RHS_Mi8mt_vvsc";
indUAV_large = 		"I_UAV_02_F"; // large UAV, unarmed


// ---------- initial motorpool/airforce ----------
enemyMotorpoolDef = "RHS_Ural_VDV_01"; // fallback vehicle in case of an empty motorpool -- NOT AN ARRAY!
enemyMotorpool = 	["RHS_Ural_VDV_01"]; // starting/current motorpool
indAirForce = 		["RHS_Mi8mt_vvsc"]; // starting/current airforce



// infantry classes
infList_sniper = 	_infSniper;
infList_NCO = 		_infNCO;
infList_special = 	_infSpecial;
infList_auto = 		_infAuto;
infList_regular = 	_infRegular;
infList_crew = 		_infCrew;
infList_pilots = 	_infPilot;
infList_officers = 	_infOfficer;

// config path for infantry groups
cfgInf = 			_cfgInf;

// standard group arrays, used for spawning groups
infPatrol = 		_gPatrol; // 2-3 guys, incl sniper teams
infGarrisonSmall = 	_gSmall; // 2-3 guys, to guard towns
infTeamATAA =		_gMissile; // missile teams, 4+ guys, for roadblocks and watchposts
infTeam = 			_gGarrison; // teams, 4+ guys
infSquad = 			_gSquad; // squads, 8+ guys, for outposts, etc
infAA =				_gAA;
infAT =				_gAT;

// standard roles for static gunner, crew and unarmed helicopter pilot -- NOT ARRAYS
infGunner =			"rhs_vdv_rifleman";
infCrew = 			"rhs_vdv_crew";
infPilot = 			"rhs_pilot_transport_heli";

// statics to be used -- NOT ARRAYS
statMG = 			"rhs_DSHKM_ins";
statAT = 			"rhs_Kornet_9M133_2_vdv"; // alternatives: rhs_Kornet_9M133_2_vdv, rhs_SPG9M_VDV, rhs_Metis_9k115_2_vdv
statAA = 			"RHS_ZU23_VDV"; // alternatively: "rhs_Igla_AA_pod_vdv"
statAA2 = 			"rhs_Igla_AA_pod_vdv";
statMortar = 		"rhs_2b14_82mm_vdv";

statMGlow = 		"RHS_NSV_TriPod_VDV";
statMGtower = 		"rhs_KORD_high_VDV";

// lists of statics to determine the defensive capabilities at HQ
allStatMGs = 		allStatMGs + [statMG];
allStatATs = 		allStatATs + [statAT];
allStatAAs = 		allStatAAs + [statAA];
allStatMortars = 	allStatMortars + [statMortar];

vehFIA pushback statMG;
vehFIA pushback statAT;
vehFIA pushback statAA;
vehFIA pushback statMortar;

// backpacks of dismantled statics -- 0: weapon, 1: tripod/support
statMGBackpacks = 		["RHS_DShkM_Gun_Bag","RHS_DShkM_TripodHigh_Bag"];
statATBackpacks = 		["RHS_Kornet_Gun_Bag","RHS_Kornet_Tripod_Bag"]; // alt: ["RHS_Kornet_Gun_Bag","RHS_Kornet_Tripod_Bag"], ["RHS_Metis_Gun_Bag","RHS_Metis_Tripod_Bag"], ["RHS_SPG9_Gun_Bag","RHS_SPG9_Tripod_Bag"]
statAABackpacks = 		[]; // The Igla pod cannot be dismantled. Any alternatives?
statMortarBackpacks = 	["RHS_Podnos_Gun_Bag","RHS_Podnos_Bipod_Bag"];
statMGlowBackpacks = 	["RHS_NSV_Gun_Bag","RHS_NSV_Tripod_Bag"];
statMGtowerBackpacks = 	["RHS_Kord_Gun_Bag","RHS_Kord_Tripod_Bag"];

// gear
genWeapons = 	_weapons;
genAmmo = 		_ammo;
genLaunchers = 	_launchers;
genMissiles = 	_missiles;
genMines = 		_mines;
genItems = 		_items;
genOptics = 	_optics;
genBackpacks = 	_backpacks;
genVests = 		_vests;
genHelmets = 	_helmets;

// default launchers
genAALaunchers = ["rhs_weap_igla"];
genATLaunchers = ["rhs_weap_rpg26","rhs_weap_rpg7"];

AAmissile = 	"rhs_mag_9k38_rocket";

// default rifles
genLMGs = 		["rhs_weap_pkp","rhs_weap_pkm"]; publicVariable "genLMGs";
genGL = 		["rhs_weap_akm_gp25","rhs_weap_akms_gp25","rhs_weap_ak103_gp25","rhs_weap_ak74m_gp25"]; publicVariable "genGL";
genSNPR = 		["rhs_weap_vss","rhs_weap_svds","rhs_weap_svdp_wd","srifle_GM6_F","rhs_weap_svdp"]; publicVariable "genSNPR";

// standard rifles for your troops to be equipped with
baseRifles = 	_unlocked_rifles;

// NVGs, flashlights, laser
indNVG = 		"rhs_1PN138";
indFL = 		"rhs_acc_2dpZenit";
indLaser = 		"rhs_acc_perst1ik";

atMine = 		"rhs_mine_tm62m_mag";
apMine = 		"rhs_mine_pmn2_mag";

// equipment unlocked from the get-go
unlockedWeapons = 	_unlocked_weapons;
unlockedRifles = 	_unlocked_rifles;
unlockedMagazines = _unlocked_magazines;
unlockedItems = 	_unlocked_items;
unlockedBackpacks = _unlocked_backpacks;
unlockedOptics = 	_unlocked_optics;

basicGear = unlockedWeapons + unlockedMagazines + unlockedItems + unlockedBackpacks;

// the flag
cFlag = 			_flag;

// affiliation
side_green = 		_side;

// add long range radio (TFAR)
lrRadio = 			_lrRadio;

// add buyable vehicles/statics
vfs = 				_vfs;

// define the civilian helicopter that allows you to go undercover
civHeli = 			_civHeli;

// define the ammo crate to be spawned at camps
//campCrate = 		"rhs_3Ya40_1_single";
campCrate = 		"Box_NATO_Equip_F";

// define the black market crate
blackMarketCrate = 	"rhs_gear_crate";

// define the reward crate
rewardCrate = 	"Box_FIA_Wps_F";


// all the items camps are made of, to avoid object duplication within the HQ perimeter
campItems = ["Land_TentA_F","Land_FoodContainer_01_F","Land_Campfire_F",campCrate,"Land_Wreck_Ural_F","Land_TentDome_F",blackMarketCrate];
