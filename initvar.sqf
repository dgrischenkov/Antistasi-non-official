//Antistasi var settings
//If some setting can be modified it will be commented with a // after it.
//Make changes at your own risk!!
//You do not have enough balls to make any modification and after making a Bug report because something is wrong. You don't wanna be there. Believe me.
//Not commented lines cannot be changed.
//Don't touch them.
antistasiVersion = "v 1.5.5 -- modded";

servidoresOficiales = ["Antistasi Official EU","Antistasi Official EU - TEST"];//this is for author's fine tune the official servers. If I get you including your server in this variable, I will create a special variable for your server. Understand?

debug = false;//debug variable, not useful for everything..

cleantime = 3600;//time to delete dead bodies, vehicles etc..
distanciaSPWN = 1200;//initial spawn distance. Less than 1Km makes parked vehicles spawn in your nose while you approach.
musicON = true;
civPerc = 0.2;//initial % civ spawn rate
posHQ = getMarkerPos "respawn_west";
//minefieldMrk = [];
minimoFPS = 15;//initial FPS minimum.
//destroyedCities = [];
allowPlayerRecruit = true;
recruitCooldown = 0;
AAFpatrols = 0;//0
planesAAFcurrent = 0;
helisAAFcurrent = 0;
APCAAFcurrent = 0;
tanksAAFcurrent= 0;
savingClient = false;
incomeRep = false;
closeMarkersUpdating = 0;

arrayCivs = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_scientist_F","C_Orestes","C_Nikos","C_Nikos_aged"];//array of possible civs. Only euro types picked (this is Greece). Add any civ classnames you wish here
arrayCivVeh =["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F","C_Truck_02_transport_F","C_Truck_02_covered_F"];//possible civ vehicles. Add any mod classnames you wish here
gruposFIAmid = ["IRG_InfTeam","IRG_InfTeam_AA","IRG_InfTeam_AT"];
planesCSAT = ["O_Heli_Light_02_unarmed_F","O_Heli_Transport_04_bench_F","O_Heli_Attack_02_F","O_Plane_CAS_02_F","O_Heli_Light_02_F"];
planesNATO = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_01_camo_F","B_Plane_CAS_01_F","B_Heli_Transport_03_F"];
planesNATOTrans = ["B_Heli_Light_01_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F"];
vehNATO = ["B_APC_Tracked_01_rcws_F","B_APC_Tracked_01_CRV_F","B_APC_Tracked_01_AA_F","B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F","B_MRAP_01_F","B_MRAP_01_hmg_F","B_Truck_01_covered_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F"];//all vehicles from NATO. Add your mod vehicles here, but they will only spawn in bases or airports, and players wont be able to mount them.
listMilBld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F","Land_Cargo_HQ_V1_F","Land_Cargo_HQ_V2_F","Land_Cargo_HQ_V3_F","Land_Cargo_Patrol_V1_F","Land_Cargo_Patrol_V2_F","Land_Cargo_Patrol_V3_F","Land_HelipadSquare_F","Land_Cargo_Tower_V1_ruins_F","Land_Cargo_Tower_V2_ruins_F","Land_Cargo_Tower_V3_ruins_F"];
listbld = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"];
lamptypes = ["Lamps_Base_F", "PowerLines_base_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampHarbour_F","Land_LampShabby_F","Land_NavigLight","Land_runway_edgelight","Land_PowerPoleWooden_L_F"];
arrayids = ["Anthis","Costa","Dimitirou","Elias","Gekas","Kouris","Leventis","Markos","Nikas","Nicolo","Panas","Rosi","Samaras","Thanos","Vega"];
if (isMultiplayer) then {arrayids = arrayids + ["protagonista"]};

armasNATO = ["arifle_MX_F","arifle_MX_GL_F","arifle_MX_SW_F","srifle_EBR_F","srifle_LRR_F","srifle_DMR_03_F","srifle_DMR_02_F","MMG_02_sand_F","arifle_MXM_F","SMG_01_F"];//possible weapons that spawn in NATO ammoboxes
municionNATO = ["30Rnd_65x39_Caseless_mag","30Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_Caseless_mag","100Rnd_65x39_caseless_mag_Tracer","20Rnd_762x51_Mag","7Rnd_408_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","11Rnd_45ACP_Mag","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","1Rnd_Smoke_Grenade_shell","3Rnd_HE_Grenade_shell","HandGrenade","20Rnd_762x51_Mag","10Rnd_338_Mag","130Rnd_338_Mag"];//possible ammo that spawn in NATO ammoboxes
soldadosFIA = ["B_G_Soldier_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_TL_F","B_G_Soldier_A_F","B_G_Soldier_M_F","B_G_Soldier_LAT_F","B_G_Soldier_SL_F","B_G_officer_F","B_G_Sharpshooter_F"];
vehFIA = ["B_G_Quadbike_01_F","B_G_Offroad_01_armed_F","B_HMG_01_high_F","B_G_Offroad_01_F","B_G_Van_01_transport_F","B_G_Boat_Transport_01_F","B_G_Mortar_01_F","B_static_AT_F","B_static_AA_F","B_G_Offroad_01_repair_F"];

civUniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1","U_C_Commoner1_2","U_C_Commoner1_3","U_Rangemaster","U_NikosBody","U_C_Poor_1","U_C_Poor_2","U_C_WorkerCoveralls","U_C_Poor_shorts_1","U_C_Commoner_shorts","U_C_ShirtSurfer_shorts","U_C_TeeSurfer_shorts_1","U_C_TeeSurfer_shorts_2","Item_U_OrestesBody"];
//allMagazines = MantitanqueAAF + municionAAF + municionNATO;

//All weapons, MOD ones included, will be added to this arrays, but it's useless without integration, as if those weapons don't spawn, players won't be able to collect them, and after, unlock them in the arsenal.
allMagazines = [];
_cfgmagazines = configFile >> "cfgmagazines";
for "_i" from 0 to (count _cfgMagazines) -1 do
	{
	_magazine = _cfgMagazines select _i;
	if (isClass _magazine) then
		{
		_nombre = configName (_magazine);
		allMagazines pushBack _nombre;
		};
	};

arifles = [];
srifles = [];
mguns = [];
hguns = [];
mlaunchers = [];
rlaunchers = [];

hayRHS = false;
hayUSAF = false;

lockedWeapons = ["Rangefinder","Laserdesignator"];

_allPrimaryWeapons = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 1 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allHandGuns = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 2 } } )
" configClasses ( configFile >> "cfgWeapons" );

_allLaunchers = "
    ( getNumber ( _x >> ""scope"" ) isEqualTo 2
    &&
    { getText ( _x >> ""simulation"" ) isEqualTo ""Weapon""
    &&
    { getNumber ( _x >> ""type"" ) isEqualTo 4 } } )
" configClasses ( configFile >> "cfgWeapons" );

primaryMagazines = [];
{
_nombre = configName _x;
_nombre = [_nombre] call BIS_fnc_baseWeapon;
if (not(_nombre in lockedWeapons)) then
	{
	_magazines = getArray (configFile / "CfgWeapons" / _nombre / "magazines");
	primaryMagazines pushBackUnique (_magazines select 0);
	lockedWeapons pushBackUnique _nombre;
	_weapon = [_nombre] call BIS_fnc_itemType;
	_weaponType = _weapon select 1;
	switch (_weaponType) do
		{
		case "AssaultRifle": {arifles pushBack _nombre};
		case "MachineGun": {mguns pushBack _nombre};
		case "SniperRifle": {srifles pushBack _nombre};
		case "Handgun": {hguns pushBack _nombre};
		case "MissileLauncher": {mlaunchers pushBack _nombre};
		case "RocketLauncher": {rlaunchers pushBack _nombre};
		};

	};
} forEach _allPrimaryWeapons + _allHandGuns + _allLaunchers;

//rhs detection and integration
if ("rhs_weap_akms" in lockedWeapons) then {
	hayRHS = true;
};
if ("rhs_weap_m4a1_d" in lockedWeapons) then {
	hayUSAF = true;
};

//------------------ unit module ------------------//

// all statics, used to calculate defensive strength when spawning attacks -- templates add OPFOR statics
allStatMGs = 		["B_HMG_01_high_F"];
allStatATs = 		["B_static_AT_F"];
allStatAAs = 		["B_static_AA_F"];
allStatMortars = 	["B_G_Mortar_01_F"];

side_blue = west; // <<<<<< player side, always, at all times, no exceptions
side_green = independent;
side_red = east;

lrRadio = "";

vfs = [];

//------------------ prev. OPFOR/CSAT ------------------//
opAir = 			[]; // air force
opCASFW = 			""; // CAS, fixed-wing
opHeliTrans = 		[]; // (un-)armed transport helicopters
opHeliDismount = 	""; // helicopter that dismounts troops
opHeliFR = 			""; // helicopter that fastropes troops in
opGunship = 		""; // gunship
opUAVsmall = 		""; // small UAV (Darter, etc)

opCfgInf = 			(configfile >> "CfgGroups" >> "east" >> "OPF_F" >> "Infantry"); // cfg path for infantry

opGroup_Squad = 			""; // squad of infantry
opGroup_SpecOps = 		""; // spec opcs
opGroup_Sniper = 		""; // sniper team

opI_OFF = 		""; // officer/official
opI_PIL = 			""; // pilot
opI_OFF2 = 		""; // officer/traitor
opI_SL = 			""; // squad leader, urban camo
opI_RFL1 = 		""; // rifleman, urban camo



// Initialisation of units and gear
if (hayRHS) then {
	call compile preprocessFileLineNumbers "CREATE\templateRHS.sqf";
	call compile preprocessFileLineNumbers "CREATE\templateVMF.sqf";
}
else {
	call compile preprocessFileLineNumbers "CREATE\templateAAF.sqf";
	call compile preprocessFileLineNumbers "CREATE\templateOPFOR_CSAT.sqf";
};

if (hayUSAF) then {
	call compile preprocessFileLineNumbers "CREATE\templateUSAF.sqf";
}
else {
	call compile preprocessFileLineNumbers "CREATE\templateNATO.sqf";
};



// deprecated variables, used to maintain compatibility
gruposAAFsmall = infPatrol;
gruposAAFmid = infTeam;
vehAAFland = vehTrucks + vehPatrol + vehAPC + vehIFV + vehTank + vehSupply - [heli_default];
vehAAFAT = enemyMotorpool;
vehAAFnormal = vehTrucks + vehPatrol + vehSupply;
planesAAF = indAirForce;
armasAAF = genWeapons;
antitanqueAAF = genLaunchers;
MantitanqueAAF = genMissiles;
municionAAF = genAmmo;
minasAAF = genMines;
itemsAAF = genItems;
opticasAAF = genOptics;
soldadosAAF = infList_sniper + infList_NCO + infList_special + infList_auto + infList_regular + infList_crew + infList_pilots;
cascos = genHelmets;
vests = genVests;
lockedMochis = genBackpacks;
planesCSAT = opAir;
//------------------ /unit module ------------------//

injuredSounds =
[
	"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss",
	"a3\sounds_f\characters\human-sfx\Person1\P1_moan_19_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_20_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_21_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_22_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_23_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_24_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_25_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_26_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_27_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_28_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_29_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_30_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_31_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_32_words.wss","a3\sounds_f\characters\human-sfx\Person1\P1_moan_33_words.wss",
	"a3\sounds_f\characters\human-sfx\Person2\P2_moan_19_words.wss"
];

missionPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;

ladridos = ["Music\dog_bark01.wss", "Music\dog_bark02.wss", "Music\dog_bark03.wss", "Music\dog_bark04.wss", "Music\dog_bark05.wss","Music\dog_maul01.wss","Music\dog_yelp01.wss","Music\dog_yelp02.wss","Music\dog_yelp03.wss"];

if (!isServer and hasInterface) exitWith {};

AAFpatrols = 0;//0
skillAAF = 0;
maxSkillAAF = 3;
smallCAmrk = [];
smallCApos = [];

BMreqItems = []; // list of items to be gathered for BM missions
BMcurItems = []; // list of BM items already gathered

rCrateEnabled = false; publicVariable "rCrateEnabled";

server setVariable ["milActive", false, true];
server setVariable ["civActive", false, true];
server setVariable ["expActive", false, true];
server setVariable ["blockCSAT", false, true];
server setVariable ["jTime", 0, true];

server setVariable ["lockTransfer", false, true];


campsFIA = []; // list of current camps
campList = []; // camps and names
campNames = ["Camp Spaulding","Camp Wagstaff","Camp Firefly","Camp Loophole","Camp Quale","Camp Driftwood","Camp Flywheel","Camp Grunion","Camp Kornblow","Camp Chicolini","Camp Pinky",
			"Camp Fieramosca","Camp Bulldozer","Camp Bambino","Camp Pedersoli"]; // possible camp names
usedCN = []; // camp names currently in use
cName = ""; // custom camp name
cList = false; // using the new list?

expCrate = ""; // Devin's crate

server setVariable ["genLMGlocked",true,true];
server setVariable ["genGLlocked",true,true];
server setVariable ["genSNPRlocked",true,true];
server setVariable ["genATlocked",true,true];
server setVariable ["genAAlocked",true,true];

//Pricing values for soldiers, vehicles
if (!isServer) exitWith {};

{server setVariable [_x,50,true]} forEach ["B_G_Soldier_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f"];
{server setVariable [_x,100,true]} forEach ["B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_TL_F","B_G_Soldier_A_F"];
{server setVariable [_x,150,true]} forEach ["B_G_Soldier_M_F","B_G_Soldier_LAT_F","B_G_Soldier_SL_F","B_G_officer_F","B_G_Sharpshooter_F"];
{server setVariable [_x,500,true]} forEach ["B_Soldier_AA_F"];
{server setVariable [_x,100,true]} forEach ["I_crew_F","O_crew_F","C_man_1"];
{server setVariable [_x,100,true]} forEach infList_regular;
{server setVariable [_x,150,true]} forEach infList_auto;
{server setVariable [_x,150,true]} forEach infList_crew;
{server setVariable [_x,150,true]} forEach infList_pilots;
{server setVariable [_x,200,true]} forEach infList_special;
{server setVariable [_x,200,true]} forEach infList_NCO;
{server setVariable [_x,200,true]} forEach infList_sniper;

server setVariable ["C_Offroad_01_F",300,true];//200
server setVariable ["C_Van_01_transport_F",600,true];//600
server setVariable ["C_Heli_Light_01_civil_F",12000,true];//12000
server setVariable ["B_G_Quadbike_01_F",50,true];//50
server setVariable ["B_G_Offroad_01_F",200,true];//200
server setVariable ["B_G_Van_01_transport_F",450,true];//300
server setVariable ["B_G_Offroad_01_armed_F",700,true];//700
{server setVariable [_x,400,true]} forEach ["B_HMG_01_high_F","B_G_Boat_Transport_01_F","B_G_Offroad_01_repair_F"];//400
{server setVariable [_x,800,true]} forEach ["B_G_Mortar_01_F","B_static_AT_F","B_static_AA_F"];//800

server setVariable [vfs select 0,300,true];
server setVariable [vfs select 1,600,true];//600
server setVariable [vfs select 2,6000,true];//12000
server setVariable [vfs select 3,50,true];//50
server setVariable [vfs select 4,200,true];//200
server setVariable [vfs select 5,450,true];//300
server setVariable [vfs select 6,700,true];//700
server setVariable [vfs select 7,400,true];//700
server setVariable [vfs select 8,800,true];
server setVariable [vfs select 9,800,true];
server setVariable [vfs select 10,800,true];
server setVariable [vfs select 11,4000,true];

if (hayRHS) then {
	server setVariable [vfs select 2,6000,true];
	server setVariable [vfs select 11,5000,true];
	server setVariable [vfs select 12,600,true];
	server setVariable [vehTruckAA, 800, true];
};

server setVariable ["hr",8,true];//initial HR value
server setVariable ["resourcesFIA",1000,true];//Initial FIA money pool value
server setVariable ["resourcesAAF",0,true];//Initial AAF resources
server setVariable ["skillFIA",0,true];//Initial skill level for FIA soldiers
server setVariable ["prestigeNATO",5,true];//Initial Prestige NATO
server setVariable ["prestigeCSAT",5,true];//Initial Prestige CSAT

server setVariable ["enableOptions",false,true];
server setVariable ["enableBM",false,true];
server setVariable ["enableFTold",false,true]; // extended fast travel mode
server setVariable ["enableMemAcc",false,true]; // simplified arsenal access

server setVariable ["easyMode",true,true]; // higher income
server setVariable ["hardMode",false,true];

staticsToSave = []; publicVariable "staticsToSave";
prestigeOPFOR = 50;//Initial % support for AAF on each city
if (not cadetMode) then {prestigeOPFOR = 75};//if you play on vet, this is the number
prestigeBLUFOR = 0;//Initial % FIA support on each city
planesAAFmax = 0;
helisAAFmax = 0;
APCAAFmax = 0;
tanksAAFmax = 0;
cuentaCA = 600;//600
lastIncome = 0;
prestigeIsChanging = false;
cityIsSupportChanging = false;
resourcesIsChanging = false;
savingServer = false;
misiones = [];
revelar = false;

garageIsUsed = false;
vehInGarage = [];
destroyedBuildings = []; publicVariable "destroyedBuildings";
reportedVehs = [];
hayXLA = false;
hayTFAR = false;
hayACE = false;
hayACEhearing = false;
hayACEMedical = false;
//TFAR detection and config.
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then
    {
    hayTFAR = true;
    unlockedItems = unlockedItems + ["tf_anprc152", "ItemRadio"];//making this items Arsenal available.
    tf_no_auto_long_range_radio = true; publicVariable "tf_no_auto_long_range_radio";//set to false and players will start with LR radio, uncomment the last line of so.
	//tf_give_personal_radio_to_regular_soldier = false;
	tf_west_radio_code = "";publicVariable "tf_west_radio_code";//to make enemy vehicles usable as LR radio
	tf_east_radio_code = tf_west_radio_code; publicVariable "tf_east_radio_code"; //to make enemy vehicles usable as LR radio
	tf_guer_radio_code = tf_west_radio_code; publicVariable "tf_guer_radio_code";//to make enemy vehicles usable as LR radio
	tf_same_sw_frequencies_for_side = true; publicVariable "tf_same_sw_frequencies_for_side";
	tf_same_lr_frequencies_for_side = true; publicVariable "tf_same_lr_frequencies_for_side";
    //unlockedBackpacks pushBack "tf_rt1523g_sage";//uncomment this if you are adding LR radios for players
    };
//ACE detection and ACE item availability in Arsenal
if (!isNil "ace_common_settingFeedbackIcons") then
	{
	unlockedItems = unlockedItems + ["ACE_EarPlugs","ACE_RangeCard","ACE_Clacker","ACE_M26_Clacker","ACE_DeadManSwitch","ACE_DefusalKit","ACE_MapTools","ACE_Flashlight_MX991","ACE_Sandbag_empty","ACE_wirecutter","ACE_SpraypaintBlue","ACE_SpraypaintGreen","ACE_SpraypaintRed","ACE_SpraypaintBlack"];
	itemsAAF = itemsAAF + ["ACE_Kestrel4500","ACE_ATragMX"];
	armasNATO = armasNATO + ["ACE_M84"];
	hayACE = true;
	if (isClass (configFile >> "CfgSounds" >> "ACE_EarRinging_Weak")) then
		{
		hayACEhearing = true;
		};
	if (isClass (ConfigFile >> "CfgSounds" >> "ACE_heartbeat_fast_3")) then
		{
		if (ace_medical_level != 0) then
			{
			hayACEMedical = true;
			unlockedItems = unlockedItems + ["ACE_atropine","ACE_fieldDressing","ACE_quikclot","ACE_bloodIV_250","ACE_epinephrine","ACE_morphine","ACE_personalAidKit","ACE_plasmaIV_250","ACE_salineIV_250","ACE_tourniquet","ACE_elasticBandage","ACE_packingBandage"];
			};
		};
	};

/*
if (!isNil "ace_medical_level") then
    {
    unlockedItems = unlockedItems + ["ACE_EarPlugs","ACE_RangeCard","ACE_Clacker","ACE_M26_Clacker","ACE_DeadManSwitch","ACE_DefusalKit","ACE_MapTools","ACE_Flashlight_MX991","ACE_Sandbag_empty","ACE_wirecutter","ACE_SpraypaintBlue","ACE_SpraypaintGreen","ACE_SpraypaintRed","ACE_SpraypaintBlack"];
    itemsAAF = itemsAAF + ["ACE_Kestrel4500","ACE_ATragMX"];
    armasNATO = armasNATO + ["ACE_M84"];
    hayACE = true;
    if (ace_medical_level != 0) then
    	{
    	unlockedItems = unlockedItems + ["ACE_atropine","ACE_fieldDressing","ACE_quikclot","ACE_bloodIV_250","ACE_epinephrine","ACE_morphine","ACE_personalAidKit","ACE_plasmaIV_250","ACE_salineIV_250","ACE_tourniquet","ACE_elasticBandage","ACE_packingBandage"];
    	};
   };

*/

if !(isnil "XLA_fnc_addVirtualItemCargo") then {
	hayXLA = true;
};

allItems = itemsAAF + opticasAAF + vests + cascos;

vehInGarage = vehInGarage + ["C_Van_01_transport_F","C_Offroad_01_F","C_Offroad_01_F","B_G_Quadbike_01_F","B_G_Quadbike_01_F","B_G_Quadbike_01_F"];
if (hayRHS) then {vehInGarage = vehInGarage + ["rhs_gaz66_r142_vdv"]};

if (worldName == "Altis") then
	{
	{server setVariable [_x select 0,_x select 1]} forEach [["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];
	call compile preprocessFileLineNumbers "roadsDB.sqf";
	};

publicVariable "unlockedWeapons";
publicVariable "unlockedRifles";
publicVariable "unlockedItems";
publicVariable "unlockedOptics";
publicVariable "unlockedBackpacks";
publicVariable "unlockedMagazines";
publicVariable "miembros";
publicVariable "garageIsUsed";
publicVariable "vehInGarage";
publicVariable "reportedVehs";
publicVariable "hayACE";
publicVariable "hayTFAR";
publicVariable "hayXLA";
publicVariable "hayACEhearing";
publicVariable "hayACEMedical";
publicVariable "skillAAF";
publicVariable "misiones";
publicVariable "revelar";

if (isMultiplayer) then {[[petros,"hint","Variables Init Completed"],"commsMP"] call BIS_fnc_MP;};