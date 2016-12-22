private ["_vTruck","_vSupply","_vPatrol","_vAPC","_vIFV","_vMBT","_heli","_airplane",
		"_gSmall","_gPatrol","_gGarrison","_gTeam","_gMissile","_gSquad",
		"_statics","_statics_bags",
		"_infOfficer","_infSniper","_infNCO","_infSpecial","_infAuto","_infRegular","_infCrew","_infPilot",
		"_cfgInf","_flag","_lrRadio","_vfs",
		"_weapons","_ammo","_launchers","_missiles","_mines","_items","_optics","_backpacks","_vests","_helmets",
		"_unlocked_weapons","_unlocked_magazines","_unlocked_rifles","_unlocked_items","_unlocked_backpacks","_unlocked_optics"];

// all infantry classes

sol_A_AA = "I_Soldier_AAA_F";
sol_A_AR = "I_Soldier_AAR_F";
sol_A_AT = "I_Soldier_AAT_F";
sol_AA = "I_Soldier_AA_F";
sol_AR = "I_Soldier_AR_F";
sol_AT = "I_Soldier_AT_F";
sol_AMMO = "I_Soldier_A_F";
sol_GL = "I_Soldier_GL_F";
sol_GL2 = "I_Soldier_GL_F"; // extra
sol_LAT = "I_Soldier_LAT_F";
sol_LAT2 = "I_Soldier_LAT_F"; // extra
sol_MG = "I_Soldier_AR_F"; // extra
sol_MK = "I_Soldier_M_F";
sol_SL = "I_Soldier_SL_F";
sol_TL = "I_Soldier_TL_F";
sol_TL2 = "I_Soldier_TL_F"; // extra
sol_EXP = "I_Soldier_exp_F";
sol_R_L = "I_Soldier_lite_F";
sol_REP = "I_Soldier_repair_F";
sol_UN = "I_Soldier_unarmed_F";
sol_RFL = "I_soldier_F";
sol_SN = "I_Sniper_F";
sol_SP = "I_Spotter_F";
sol_MED = "I_medic_F";
sol_ENG = "I_engineer_F";
sol_OFF = "I_officer_F";
sol_OFF2 = "I_officer_F"; // extra

sol_CREW = "I_crew_F";
sol_CREW2 = "I_crew_F"; // extra
sol_CREW3 = "I_crew_F"; // extra
sol_CREW4 = "I_crew_F"; // extra
sol_DRV = "I_crew_F"; // extra
sol_DRV2 = "I_crew_F"; // extra
sol_HCREW = "I_helicrew_F";
sol_HPIL = "I_helipilot_F";
sol_HPIL2 = "I_helipilot_F"; // extra
sol_PIL = "I_pilot_F";
sol_UAV = "I_soldier_UAV_F";

sol_SUP_AMG = "I_support_AMG_F";
sol_SUP_AMTR = "I_support_AMort_F";
sol_SUP_GMG = "I_support_GMG_F";
sol_SUP_MG = "I_support_MG_F";
sol_SUP_MTR = "I_support_Mort_F";


// all classes sorted by role, used for pricing, etc
_infOfficer = 	["I_officer_F"];
_infSniper = 	["I_Soldier_M_F","I_Sniper_F","I_Spotter_F"];
_infNCO = 		["I_Soldier_SL_F","I_Soldier_TL_F"];
_infSpecial = 	["I_Soldier_AAA_F","I_Soldier_AAT_F","I_Soldier_AA_F","I_Soldier_AT_F","I_Soldier_exp_F","I_Soldier_repair_F","I_engineer_F","I_medic_F"];
_infAuto = 		["I_Soldier_AAR_F","I_Soldier_AR_F"];
_infRegular = 	["I_Soldier_A_F","I_Soldier_GL_F","I_Soldier_LAT_F","I_Soldier_lite_F","I_soldier_F"];
_infCrew = 		["I_crew_F","I_helicrew_F","I_soldier_UAV_F","I_support_AMG_F","I_support_AMort_F","I_support_GMG_F","I_support_MG_F","I_support_Mort_F"];
_infPilot = 	["I_helipilot_F","I_pilot_F"];

// all vehicles sorted by role
_vTruck = 		["I_Truck_02_covered_F","I_Truck_02_transport_F"];
_vSupply = 		["I_Truck_02_fuel_F","I_Truck_02_medical_F","I_Truck_02_ammo_F"];
_vPatrol = 		["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_light_03_unarmed_F"];
_vAPC = 		["I_APC_Wheeled_03_cannon_F"];
_vIFV = 		["I_APC_tracked_03_cannon_F"];
_vMBT =			["I_MBT_03_cannon_F"];
_heli = 		["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_F"];
_airplane = 	["I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F"];

// pre-defined groups sorted by assignments
_gSmall = 		["HAF_InfSentry"];
_gPatrol = 		["HAF_InfSentry","HAF_InfSentry","HAF_InfSentry","HAF_SniperTeam"];
_gGarrison = 	["HAF_InfTeam_AA","HAF_InfTeam_AT","HAF_InfTeam","HAF_InfTeam","HAF_InfTeam"];
_gTeam = 		["HAF_InfTeam_AA","HAF_InfTeam_AT","HAF_InfTeam"];
_gMissile = 	["HAF_InfTeam_AA","HAF_InfTeam_AT"];
_gAA = 			["HAF_InfTeam_AA"];
_gAT = 			["HAF_InfTeam_AT"];
_gSquad = 		["HAF_InfSquad","HAF_InfSquad_Weapons"];

// available statics
_statics =				["I_HMG_01_high_F","I_Mortar_01_F","I_static_AA_F","I_static_AT_F"];

/*
 _statics_bags = 		["B_Static_Designator_01_weapon_F","B_UAV_01_backpack_F","I_AA_01_weapon_F","B_AA_01_weapon_F","B_AT_01_weapon_F","I_HMG_01_high_weapon_F","I_HMG_01_support_F",
						"I_Mortar_01_support_F","B_Mortar_01_support_F","I_HMG_01_support_high_F","B_HMG_01_support_high_F","I_Mortar_01_weapon_F","B_Mortar_01_weapon_F"];
*/

// config paths for pre-defined groups
_cfgInf = 				(configfile >> "CfgGroups" >> "Indep" >> "IND_F" >> "Infantry");


// ---------- equipment available for friendly AI----------

// will spawn in ammo boxes
_weapons = [
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F",
	"srifle_GM6_F",
	"LMG_Mk200_F",
	"Binocular",
	"launch_NLAW_F",
	"srifle_DMR_06_olive_F",
	"srifle_EBR_F"
];

_ammo = [
	"200Rnd_65x39_cased_Box",
	"30Rnd_556x45_Stanag",
	"5Rnd_127x108_Mag",
	"5Rnd_127x108_APDS_Mag",
	"NLAW_F",
	"1Rnd_HE_Grenade_shell",
	"UGL_FlareWhite_F",
	"UGL_FlareGreen_F",
	"1Rnd_Smoke_Grenade_shell",
	"3Rnd_HE_Grenade_shell",
	"HandGrenade",
	"20Rnd_762x51_Mag",
	"9Rnd_45ACP_Mag",
	"30Rnd_9x21_Mag",
	"SmokeShell",
	"Laserbatteries"
];

_launchers = [
	"launch_I_Titan_F",
	"launch_I_Titan_short_F"
];

_missiles = [
	"Titan_AT",
	 "Titan_AP",
	 "Titan_AA"
];

_mines = [
	"SLAMDirectionalMine_Wire_Mag",
	"SatchelCharge_Remote_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"ATMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag"
];

_items = [
	"FirstAidKit",
	"Medikit",
	"MineDetector",
	"NVGoggles",
	"ToolKit",
	"muzzle_snds_H",
	"muzzle_snds_L",
	"muzzle_snds_M",
	"muzzle_snds_B",
	"muzzle_snds_H_MG",
	"muzzle_snds_acp",
	"bipod_03_F_oli",
	"muzzle_snds_338_green",
	"muzzle_snds_93mmg_tan",
	"acc_flashlight",
	"Rangefinder",
	"Laserdesignator",
	"ItemGPS",
	"ItemRadio",
	"acc_pointer_IR"
];

_optics = [
	"optic_DMS",
	"optic_LRPS",
	"optic_tws",
	"optic_tws_mg",
	"optic_NVS",
	"optic_Nightstalker",
	"optic_MRCO",
	"optic_SOS",
	"optic_Hamr",
	"optic_Arco",
	"optic_KHS_old",
	"optic_Holosight",
	"optic_ACO_grn",
	"optic_Aco_smg",
	"optic_ACO_grn_smg",
	"optic_Holosight_smg"
];

// will NOT spawn in ammo boxes
_backpacks = [
	"B_AssaultPack_khk",
	"B_AssaultPack_dgtl",
	"B_AssaultPack_rgr",
	"B_AssaultPack_sgg",
	"B_AssaultPack_blk",
	"B_AssaultPack_cbr",
	"B_AssaultPack_mcamo",
	"B_Kitbag_mcamo",
	"B_Kitbag_sgg",
	"B_Kitbag_cbr",
	"B_Bergen_sgg",
	"B_Bergen_mcamo",
	"B_Bergen_rgr",
	"B_Bergen_blk",
	"B_FieldPack_oli",
	"B_FieldPack_blk",
	"B_FieldPack_ocamo",
	"B_FieldPack_oucamo",
	"B_FieldPack_cbr",
	"B_Carryall_ocamo",
	"B_Carryall_mcamo",
	"B_Carryall_oli",
	"B_Carryall_khk",
	"B_Carryall_cbr",
	"B_OutdoorPack_blk",
	"B_OutdoorPack_tan",
	"B_OutdoorPack_blu",
	"B_HuntingBackpack",
	"B_Static_Designator_01_weapon_F",
	"B_UAV_01_backpack_F",
	"I_AA_01_weapon_F",
	"B_AA_01_weapon_F",
	"B_AT_01_weapon_F",
	"I_HMG_01_high_weapon_F",
	"I_Mortar_01_support_F",
	"B_Mortar_01_support_F",
	"I_HMG_01_support_high_F",
	"B_HMG_01_support_high_F",
	"I_Mortar_01_weapon_F",
	"B_Mortar_01_weapon_F",
	"B_HMG_01_support_F",
	"I_HMG_01_support_F",
	"tf_rt1523g_green"
];

_vests = [
	"V_HarnessO_brn",
	"V_HarnessO_gry",
	"V_HarnessOGL_brn",
	"V_HarnessOGL_gry",
	"V_HarnessOSpec_brn",
	"V_HarnessOSpec_gry",
	"V_PlateCarrier1_blk",
	"V_PlateCarrier1_rgr",
	"V_PlateCarrier2_rgr",
	"V_PlateCarrier3_rgr",
	"V_PlateCarrier3_rgr",
	"V_PlateCarrierIA1_dgtl",
	"V_TacVest_brn",
	"V_PlateCarrierIA2_dgtl",
	"V_PlateCarrierIAGL_dgtl",
	"V_PlateCarrierSpec_rgr",
	"V_TacVest_blk",
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_TacVest_oli",
	"V_TacVestCamo_khk",
	"V_TacVestIR_blk",
	"V_RebreatherIA",
	"G_I_Diving",
	"V_PlateCarrierIAGL_oli",
	"V_Chestrig_oli"
];

_helmets = [
	"H_HelmetB",
	"H_HelmetB_camo",
	"H_HelmetB_paint",
	"H_HelmetB_light",
	"H_HelmetB_plain_mcamo",
	"H_HelmetB_plain_blk",
	"H_HelmetSpecB",
	"H_HelmetSpecB_paint1",
	"H_HelmetSpecB_paint2",
	"H_HelmetSpecB_blk",
	"H_HelmetIA",
	"H_HelmetIA_net",
	"H_HelmetIA_camo",
	"H_HelmetB_grass",
	"H_HelmetB_snakeskin",
	"H_HelmetB_desert",
	"H_HelmetB_black",
	"H_HelmetB_sand",
	"H_HelmetB_sand",
	"H_HelmetCrew_O",
	"H_HelmetCrew_I",
	"H_PilotHelmetFighter_B",
	"H_PilotHelmetFighter_O",
	"H_PilotHelmetFighter_I",
	"H_PilotHelmetHeli_B",
	"H_PilotHelmetHeli_O",
	"H_PilotHelmetHeli_I",
	"H_CrewHelmetHeli_B",
	"H_CrewHelmetHeli_O",
	"H_CrewHelmetHeli_I",
	"H_HelmetO_ocamo",
	"H_HelmetLeaderO_ocamo",
	"H_HelmetB_light_grass",
	"H_HelmetB_light_snakeskin",
	"H_HelmetB_light_desert",
	"H_HelmetB_light_black",
	"H_HelmetB_light_sand",
	"H_HelmetO_oucamo",
	"H_HelmetLeaderO_oucamo",
	"H_HelmetSpecO_ocamo",
	"H_HelmetSpecO_blk",
	"H_HelmetSpecO_blk"
];

// ----------------------------------------------------

// equipment unlocked from the beginning
_unlocked_weapons = [
	"hgun_PDW2000_F",
	"hgun_ACPC2_F",
	"Binocular"
];

_unlocked_magazines = [
	"9Rnd_45ACP_Mag",
	"30Rnd_9x21_Mag"
];

//standard rifles for AI are picked from this array. Add only rifles.
_unlocked_rifles = [
	"hgun_PDW2000_F"
];

_unlocked_items = [
	"ItemMap",
	"ItemWatch",
	"ItemCompass",
	"FirstAidKit",
	"Medikit",
	"ToolKit",
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
	"V_BandollierB_oli"
];

_unlocked_backpacks = [
	"B_TacticalPack_blk"
];

_unlocked_optics = [];

// the flag
_flag = "Flag_AAF_F";

// affiliation
_side = independent;

// long range radio
_lrRadio = "tf_rt1523g_green";

/*
These are the vehicles and statics that you can buy at HQ. Currently, the array requires a strict(!) order.
0-2: civilian vehicles
3-10: military vehicles and statics
*/
_vfs = 	[
	"C_Offroad_01_F",
	"C_Van_01_transport_F",
	"C_Heli_Light_01_civil_F",
	"B_G_Quadbike_01_F",
	"B_G_Offroad_01_F",
	"B_G_Van_01_transport_F",
	"B_G_Offroad_01_armed_F",
	"B_HMG_01_high_F",
	"B_G_Mortar_01_F",
	"B_static_AT_F",
	"B_static_AA_F",
	"B_T_MRAP_01_hmg_F",
	"C_SUV_01_F",
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Van_01_fuel_F",
	"C_Offroad_02_unarmed_F",
	"B_T_LSV_01_armed_F",
	"B_T_APC_Wheeled_01_cannon_F",
	"B_T_APC_Tracked_01_rcws_F"
];

_civHeli = "C_Heli_Light_01_civil_F";


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
vehAmmo = 			"I_Truck_02_ammo_F"; // ammo truck, for special missions
vehLead = 			["I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"]; // lead vehicle for convoys, preferably armed MRAP/car
standardMRAP = 		["I_MRAP_03_F"]; // default transport MRAP/car
vehTruckBox = 		["I_Truck_02_box_F"]; // repair truck or at least a prop

vehTruckAA = 		"";
vehSPAA = 			"";

// airforce
heli_unarmed = 	["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"]; // (un-)armed transport helicopters
heli_armed = 	["I_Heli_light_03_F"]; // armed helicopters
planes = 		_airplane; // attack planes
heli_default = 	"I_Heli_light_03_unarmed_F"; // default helicopter -- NOT AN ARRAY!
indUAV_large = 	"I_UAV_02_F"; // large UAV, unarmed

// initial motorpool/airforce
enemyMotorpoolDef = "I_Truck_02_covered_F"; // fallback vehicle in case of an empty motorpool -- NOT AN ARRAY!
enemyMotorpool = 	["I_Truck_02_covered_F"]; // starting/current motorpool
indAirForce = 		["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"]; // starting/current airforce


// infantry classes, to allow for class-specific skill adjustments and pricing
infList_sniper = 	_infSniper;
infList_NCO = 		_infNCO;
infList_special = 	_infSpecial;
infList_auto = 		_infAuto;
infList_regular = 	_infRegular;
infList_crew = 		_infCrew;
infList_pilots = 	_infPilot;
infList_officers = 	_infOfficer;

// config paths for infantry groups
cfgInf = 			_cfgInf;

// standard group arrays, used for spawning groups
infPatrol = 		_gPatrol;
infGarrisonSmall = 	_gSmall;
infTeamATAA =		_gMissile;
infTeam = 			_gGarrison;
infSquad = 			_gSquad;
infAA =				_gAA;
infAT =				_gAT;

// standard roles for static gunner and unarmed helicopter pilot
infGunner =			"I_support_MG_F";
infCrew = 			"I_crew_F";
infPilot = 			"I_helipilot_F";

// statics to be used
statMG = 			"I_HMG_01_high_F";
statAT = 			"I_static_AT_F";
statAA = 			"I_static_AA_F";
statAA2 = 			"I_static_AA_F";
statMortar = 		"I_Mortar_01_F";

statMGlow = 		"I_HMG_01_F";
statMGtower = 		"I_HMG_01_high_F";

allStatMGs = 		allStatMGs + [statMG];
allStatATs = 		allStatATs + [statAT];
allStatAAs = 		allStatAAs + [statAA];
allStatMortars = 	allStatMortars + [statMortar];

/*genStaticBag = 		_statics_bags;*/

// backpacks of dismantled statics -- 0: weapon, 1: tripod/support
statMGBackpacks = 		["I_HMG_01_high_weapon_F","I_HMG_01_support_high_F"];
statATBackpacks = 		["I_AT_01_weapon_F","I_HMG_01_support_F"];
statAABackpacks = 		["I_AA_01_weapon_F","I_HMG_01_support_F"];
statMortarBackpacks = 	["I_Mortar_01_weapon_F","I_Mortar_01_support_F"];
statMGlowBackpacks = 	["I_HMG_01_F","I_HMG_01_support_F"];
statMGtowerBackpacks = 	["I_HMG_01_high_weapon_F","I_HMG_01_support_high_F"];

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
genAALaunchers = ["launch_I_Titan_F"];
genATLaunchers = ["launch_I_Titan_short_F","launch_NLAW_F"];

AAmissile = 	"Titan_AA";

// default rifles
genLMGs = 		["LMG_Mk200_F","LMG_Zafir_F","arifle_MX_SW_F"]; publicVariable "genLMGs";
genGL = 		["arifle_Katiba_GL_F","arifle_MX_GL_F","arifle_Mk20_GL_F","arifle_TRG21_GL_F"]; publicVariable "genGL";
genSNPR = 		["srifle_DMR_01_F","srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","arifle_MXM_F","srifle_DMR_06_olive_F"]; publicVariable "genSNPR";

// standard rifles for your troops to be equipped with
baseRifles = 	_unlocked_rifles;

// NVGs
indNVG = 			"NVGoggles_INDEP";
indFL = 			"acc_flashlight";
indLaser = 			"acc_pointer_IR";

atMine = 			"ATMine_Range_Mag";
apMine = 			"APERSMine_Range_Mag";

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
side_green =		_side;

// add long range radio (TFAR)
lrRadio = 			_lrRadio;

// add buyable vehicles/statics
vfs =				_vfs;

// define the civilian helicopter that allows you to go undercover
civHeli = 			_civHeli;

// define the ammo crate to be spawned at camps
//campCrate = 		"Box_IND_AmmoOrd_F";
campCrate = 		"Box_NATO_Equip_F";

// define the black market crate
blackMarketCrate = 	"Box_NATO_WpsSpecial_F";

// define the reward crate
rewardCrate = 	"Box_FIA_Wps_F";

// all the items camps are made of, to avoid object duplication within the HQ perimeter
campItems = ["Land_TentA_F","Land_FoodContainer_01_F","Land_Campfire_F",campCrate,"Land_Wreck_Ural_F","Land_TentDome_F",blackMarketCrate];