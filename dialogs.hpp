
class HQ_menu
{
	idd=100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = 101;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = $STR_UI_HQ_OPTIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_load: RscButton // L1
{
	idc = 104;
	text = $STR_UI_GRAB_FROM_POOL;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (isMultiPlayer) then {if (player == Stavros) then {nul=call stavrosSteal} else {hint ""Only Player Commander has access to this function""}} else {hint ""This function is MP only""};";
};
class HQ_button_savegame: RscButton // L2
{
	idc = 105;
	text = $STR_UI_MANAGE_GARRISONS;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul=CreateDialog ""garrison_menu""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_moveHQ: RscButton // L3
{
	idc = 106;
	text = $STR_UI_MOVE_HQ;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul = [] spawn moveHQ;} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_recruitUnit: RscButton // R1
{
	idc = 107;
	text = $STR_UI_MEMBERS_LIST;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (isMultiplayer) then {nul = [] call membersList} else {hint ""This function is MP only""}} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_recruitSquad: RscButton // R3
{
	idc = 108;
	text = $STR_UI_REBUILD_ASSETS;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "5.000 €";
	action = "closeDialog 0;if (player == Stavros) then {nul=[] spawn rebuildAssets} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_vehicle: RscButton // R2
{
	idc = 109;
	text = $STR_UI_SKILL_UPGRADE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "";
	action = "closeDialog 0;if (player == Stavros) then {nul = [] call FIAskillAdd} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_skill: RscButton // L4
{
	idc = 110;
	text = $STR_UI_GARAGE_ACCESS;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "";
	action = "closeDialog 0;nul = [false] spawn garage";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class unit_recruit
{
	idd= 100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = 101;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = $STR_UI_RECRUIT_OPTIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_rifleman: RscButton
{
	idc = 104;
	text = $STR_UI_REC_MILITARY;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_F""] spawn reinfPlayer";
};
class HQ_button_autorifleman: RscButton
{
	idc = 105;
	text = $STR_UI_REC_AUTORIFLEMAN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_AR_F""] spawn reinfPlayer";
};
class HQ_button_medic: RscButton
{
	idc = 126;
	text = $STR_UI_REC_MEDIC;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_medic_F""] spawn reinfPlayer";
};
class HQ_button_engineer: RscButton
{
	idc = 107;
	text = $STR_UI_REC_ENGINER;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_engineer_F""] spawn reinfPlayer";
};
class HQ_button_explosive: RscButton
{
	idc = 108;
	text = $STR_UI_REC_BOMBSP;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_exp_F""] spawn reinfPlayer";
};
class HQ_button_grenadier: RscButton
{
	idc = 109;
	text = $STR_UI_REC_GRENADIER;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_GL_F""] spawn reinfPlayer";
};
class HQ_button_marksman: RscButton
{
	idc = 110;
	text = $STR_UI_REC_MARKSMAN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_M_F""] spawn reinfPlayer";
};

class HQ_button_AT: RscButton
{
	idc = 111;
	text = $STR_UI_REC_AT;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_LAT_F""] spawn reinfPlayer";
};

class HQ_button_fpsplus: RscButton // L5
{
	idc = 112;
	text = $STR_UI_REC_AA;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_Soldier_AA_F""] spawn reinfPlayer";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class squad_recruit
{
	idd=100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = 101;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = $STR_UI_SQUAD_RECRUITMENT;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; _nul = createDialog ""radio_comm"";";
};
class HQ_button_infsquad: RscButton
{
	idc = 104;
	text = $STR_UI_REC_INF_SQUAD;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfSquad""] spawn addFIAsquadHC";
};
class HQ_button_infteam: RscButton
{
	idc = 105;
	text = $STR_UI_REC_INF_TEAM;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfTeam""] spawn addFIAsquadHC";
};
class HQ_button_ATteam: RscButton
{
	idc = 106;
	text = $STR_UI_REC_AT_TEAM;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfTeam_AT""] spawn addFIAsquadHC";
};
class HQ_button_sniperTeam: RscButton
{
	idc = 107;
	text = $STR_UI_REC_SNIPER_TEAM;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_SniperTeam_M""] spawn addFIAsquadHC";
};
class HQ_button_infsquadM: RscButton
{
	idc = 108;
	text = $STR_UI_REC_SENTRY;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfSentry""] spawn addFIAsquadHC";
};
class HQ_button_infteamM: RscButton
{
	idc = 109;
	text = $STR_UI_REC_AT_TRUCK;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""B_static_AT_F""] spawn addFIAsquadHC";
};
class HQ_button_ATteamM: RscButton
{
	idc = 110;
	text = $STR_UI_REC_AA_TRUCK;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""B_static_AA_F""] spawn addFIAsquadHC";
};

class HQ_button_mortar: RscButton
{
	idc = 111;
	text = $STR_UI_REC_MORTAR_TEAM;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""B_G_Mortar_01_F""] spawn addFIAsquadHC";
};

class HQ_button_engineers: RscButton
{
	idc = 112;
	text = $STR_UI_REC_ENGINERS;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [""delete""] spawn mineDialog;";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class buy_vehicle
{
	idd=100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = 101;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = $STR_UI_MILITARY_VEHICLE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""vehicle_option"";";
};
class HQ_button_quad: RscButton // L1
{
	idc = 104;
	text = $STR_UI_QUADBIKE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0; nul = [vfs select 3] call addFIAveh";
};
class HQ_button_offroad: RscButton // L2
{
	idc = 105;
	text = $STR_UI_OFFROAD;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 4] call addFIAveh;";
};
class HQ_button_truck: RscButton // L3
{
	idc = 106;
	text = $STR_UI_TRUCK;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 5] call addFIAveh;";
};
class HQ_button_Aoffroad: RscButton // R1
{
	idc = 107;
	text = $STR_UI_ARMED_OFFROAD;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 6] call addFIAveh;";
};
class HQ_button_MG: RscButton // R3
{
	idc = 108;
	text = $STR_UI_MG;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 7] call addFIAveh;";
};
class HQ_button_mortar: RscButton // R2
{
	idc = 109;
	text = $STR_UI_MORTAR;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 8] call addFIAveh;";
};
class HQ_button_AT: RscButton // L4
{
	idc = 110;
	text = $STR_UI_STATIC_AT;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 9] call addFIAveh;";
};

class HQ_button_AA: RscButton // R4
{
	idc = 111;
	text = $STR_UI_STATIC_AA;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 10] call addFIAveh;";
};

class HQ_button_APC: RscButton // L5 -- M5
{
	idc = 112;
	text = $STR_UI_APC;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 11] call addFIAveh;";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class game_options
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_GAME_OPTIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_civplus: RscButton
{
	idc = -1;
	text = $STR_UI_CIV_CONFIG;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {closeDialog 0; nul = createDialog ""civ_config""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_civless: RscButton
{
	idc = -1;
	text = $STR_UI_RESIGN_COMM_CAREER;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0; if (isMultiplayer) then {execVM ""orgPlayers\commResign.sqf""} else {hint ""This feature is MP Only""};";
};
class HQ_button_music: RscButton
{
	idc = -1;
	text = $STR_UI_MUSIC_ON_OFF;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0; if (musicON) then {musicON = false; hint ""Music turned OFF"";} else {musicON = true; nul = execVM ""musica.sqf""; hint ""Music turned ON""};";
};
class HQ_button_garbageclean: RscButton
{
	idc = -1;
	text = $STR_UI_GARBAGE_CLEAN;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0;if (player == Stavros) then {[] remoteExec [""garbageCleaner"",2]} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_loadgame: RscButton
{
	idc = -1;
	text = $STR_UI_REINIT_UI_RADIO;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[] execVM ""reinitY.sqf"";statistics= [] execVM ""statistics.sqf"";";
};
class HQ_button_savegame: RscButton
{
	idc = -1;
	text = $STR_UI_PERSISTENT_SAVE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {[""statSave\saveLoop.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP} else {_nul = [] execVM ""statSave\saveLoop.sqf""; hint ""Personal Stats Saved""};";
};
class HQ_button_fpsplus: RscButton
{
	idc = -1;
	text = $STR_UI_FPS_LIMITER;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {closeDialog 0; nul = createDialog ""fps_limiter""} else {hint ""Only Player Commander has access to this function""};";
};

class HQ_button_AA: RscButton
{
	idc = -1;
	text = $STR_UI_SPAWN_DIST_CONFIG;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {closeDialog 0; nul = createDialog ""spawn_config""} else {hint ""Only Player Commander has access to this function""};";
};

class HQ_button_com_menu: RscButton
{
	idc = -1;
	text = $STR_UI_COMMANDER_MENU;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (server getVariable ""enableOptions"") then {if (player == Stavros) then {closeDialog 0; nul = createDialog ""com_menu_on""} else {hint ""Only Player Commander has access to this function""};} else {if (player == Stavros) then {closeDialog 0; nul = createDialog ""com_menu""} else {hint ""Only Player Commander has access to this function""}};";
};

class HQ_button_resync: RscButton
{
	idc = -1;
	text = $STR_UI_RESYNC_ARSENAL;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Use this if items disappeared from the virtual(!) arsenal.";
	action = "closeDialog 0;if (player == stavros) then {[""resyncArsenal.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP;};";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class build_menu
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	//h = 0.30 * safezoneH;
	h = 0.40 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_BUILDING_OPTIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	//h = 0.28 * safezoneH;
	h = 0.37 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_mortar: RscButton // L2
{
	idc = -1;
	text = $STR_UI_BUILD_MINEFIELD;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""minebuild_menu"";";
};
class HQ_button_cman: RscButton // R2
{
	idc = -1;
	text = $STR_UI_MANAGE_CAMPS;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Establish/Abandon Camps";
	action = "closeDialog 0;nul= createDialog ""camp_dialog"";";
};
class HQ_button_AT: RscButton // L1
{
	idc = -1;
	text = $STR_UI_OPOST_READBLOCK;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [""create""] spawn puestoDialog";
};
class HQ_button_AA: RscButton // R1
{
	idc = -1;
	text = $STR_UI_OPOST_READBLOCK_DELETE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [""delete""] spawn puestoDialog";
};
class HQ_button_lantern: RscButton // L3
{
	idc = -1;
	text = $STR_UI_HQ_FORTIFICATION;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul= createDialog ""HQ_fort_dialog"";";
};
	};
};

class mission_menu
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_AVAILABLE_MISSIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = $STR_UI_MILITARY_CONTACT; // L1
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""FND_M""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = $STR_UI_CIVILIAN_CONTACT; // L2
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""FND_C""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_DES: RscButton
{
	idc = -1;
	text = $STR_UI_EXPLOSIVES_DEALER; // L3
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""FND_E""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = $STR_UI_LOGISTICS_MISSION; // R1
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""LOG""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_RES: RscButton
{
	idc = -1;
	text = $STR_UI_RESCUE_MISSION; // R3
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""RES""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = $STR_UI_DESTROY_MISSION; // R2
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""DES""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_exit: RscButton
{
	idc = -1;
	text = "EXIT"; // R4
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class radio_comm
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_BATTLE_OPTIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = $STR_UI_FAST_TRAVEL;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (server getVariable ""enableFTold"") then {nul= createDialog ""fasttravel_dialog""} else {nul = [] execVM ""altFastTravel.sqf""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = $STR_UI_UNDERCOVER_ON;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [] spawn undercover";
};
class HQ_button_DES: RscButton
{
	idc = -1;
	text = $STR_UI_VEHICLE_MANAGER;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""vehicle_manager"";";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = $STR_UI_NATO_OPTIONS;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul=CreateDialog ""NATO_Options""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_RES: RscButton
{
	idc = -1;
	text = $STR_UI_BUILDING_OPTIONS;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul=CreateDialog ""build_menu""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = $STR_UI_RECRUIT_SQUAD;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul= [] execVM ""Dialogs\squad_recruit.sqf""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_fpsplus: RscButton
{
	idc = -1;
	text = $STR_UI_AI_MANAGMENT;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == leader group player) then {closeDialog 0;nul = createDialog ""AI_management""} else {hint ""Only group leaders may access to this option""};";
};

class HQ_button_AA: RscButton
{
	idc = -1;
	text = $STR_UI_PLAYER_AND_MONEY;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (isMultiPlayer) then {nul = createDialog ""player_money""} else {hint ""MP Only Menu""};";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class NATO_Options
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_ASK_NATO_FOR;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_AS: RscButton // L1
{
	idc = -1;
	text = $STR_UI_ATTACK_MISSION;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 20 points";
	action = "closeDialog 0;[""NATOCA""] execVM ""NatoDialog.sqf"";";
};
class HQ_button_CONV: RscButton // L2
{
	idc = -1;
	text = $STR_UI_ARMORED_COLUMN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 20 points";
	action = "closeDialog 0;[""NATOArmor""] execVM ""NatoDialog.sqf"";";
};
class HQ_button_Arty: RscButton // L3
{
	idc = -1;
	text = $STR_UI_ARTILLERY;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NATOArty""] execVM ""NatoDialog.sqf"";";
};
class HQ_button_RB: RscButton // L4
{
	idc = -1;
	text = $STR_UI_ROADBLOCK;
	x = 0.272481 * safezoneW + safezoneX;
//	x = 0.37749 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NATORoadblock""] execVM ""NatoDialog.sqf"";";
};

/*
class HQ_button_LOG: RscButton // R1
{
	idc = -1;
	text = "Artillery";
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NATOArty""] execVM ""NatoDialog.sqf"";";
};
*/
class HQ_button_LOG: RscButton // R1
{
	idc = -1;
	text = $STR_UI_NATO_UAV;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NATOUAV""] execVM ""NatoDialog.sqf"";";
};
class HQ_button_vehicle: RscButton // R2
{
	idc = -1;
	text = $STR_UI_AMMODROP;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 5 points";
	action = "closeDialog 0;[""NATOAmmo""] execVM ""NatoDialog.sqf"";";
};
class HQ_button_RES: RscButton // R3
{
	idc = -1;
	text = $STR_UI_CAS_SUPPORT;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NATOCAS""] execVM ""NatoDialog.sqf"";";
};

class HQ_button_BR: RscButton // R4
{
	idc = -1;
	text = $STR_UI_BOMB_RUN;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;_nul = createDialog ""carpet_bombing"";";
};

class HQ_button_QRF: RscButton // M5
{
	idc = -1;
	text = $STR_UI_NATO_QRF;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[""NATOQRF""] execVM ""NatoDialog.sqf"";";
};


////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class garrison_menu
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_GARRISON_MENU;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""HQ_menu"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_RECRUIT_GARRISON;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[""add""] spawn garrisonDialog";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_REMOVE_GARRISON;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[""rem""] spawn garrisonDialog";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class garrison_recruit
{
	idd=100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = 101;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = $STR_UI_GARRISON_REC_OPT;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""garrison_menu"";";
};
class HQ_button_rifleman: RscButton
{
	idc = 104;
	text = $STR_UI_GAR_MILI;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_F""] call garrisonAdd";
};
class HQ_button_autorifleman: RscButton
{
	idc = 105;
	text = $STR_UI_GAR_AUTORIFLE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_AR_F""] call garrisonAdd";
};
class HQ_button_medic: RscButton
{
	idc = 126;
	text = $STR_UI_GAR_MEDIC;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_medic_F""] call garrisonAdd";
};
class HQ_button_engineer: RscButton
{
	idc = 107;
	text = $STR_UI_GAR_SQUAD_LEADER;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_SL_F""] call garrisonAdd";
};
class HQ_button_explosive: RscButton
{
	idc = 108;
	text = $STR_UI_GAR_MOTAR;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""b_g_soldier_unarmed_f""] call garrisonAdd";
};
class HQ_button_grenadier: RscButton
{
	idc = 109;
	text = $STR_UI_GAR_GRENADIER;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_GL_F""] call garrisonAdd";
};
class HQ_button_marksman: RscButton
{
	idc = 110;
	text = $STR_UI_GAR_MARKSMAN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_M_F""] call garrisonAdd";
};

class HQ_button_AT: RscButton
{
	idc = 111;
	text = $STR_UI_GAR_AT;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_LAT_F""] call garrisonAdd";
};

class HQ_button_AA: RscButton // L5
{
	idc = 112;
	text = $STR_UI_GAR_AA;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_Soldier_AA_F""] call garrisonAdd";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class fps_limiter
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_FPS_LIMITER;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""game_options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_ONE_PLUS_FPS;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {[[1],""fpsChange""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_ONE_MINUS_FPS;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {[[-1],""fpsChange""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class spawn_config
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_SPAWN_DISTANCE_CONFIG;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""game_options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_PLUS_SPAWN_DIST;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (distanciaSPWN < 2500) then {distanciaSPWN = distanciaSPWN + 100; if (distanciaSPWN > 2500) then {distanciaSPWN = 2500};publicVariable ""distanciaSPWN"";}; hint format [""Spawn Distance Set to %1 meters. Be careful, this may affect game performance"",distanciaSPWN]} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_MINUS_SPAWN_DIST;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (distanciaSPWN > 1000) then {distanciaSPWN = distanciaSPWN - 100; if (distanciaSPWN < 1000) then {distanciaSPWN = 1000};publicVariable ""distanciaSPWN"";}; hint format [""Spawn Distance Set to %1 meters"",distanciaSPWN]} else {hint ""Only Player Commander has access to this function""};";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class civ_config
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_CIV_PRESENCE_CONFIG;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""game_options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_PLUS_CIV_SPAWN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (civPerc < 1) then {civPerc = civPerc + 0.01; if (civPerc > 1) then {civPerc = 1}; publicVariable ""civPerc"";}; hint format [""Civilian Percentage Set to %1 percent"",civPerc * 100]} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_MINUS_CIV_SPAWN;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (civPerc > 0) then {civPerc = civPerc - 0.01; if (civPerc < 0) then {civPerc = 0};publicVariable ""civPerc"";}; hint format [""Civilian Percentage Set to %1 percent"",civPerc * 100]} else {hint ""Only Player Commander has access to this function""};";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class squad_manager
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_HC_SQUAD_OPT;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_mortar: RscButton
{
	idc = -1;
	text = $STR_UI_SQUAD_ADD_VEHICLE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[] call addSquadVeh;";
};
class HQ_button_MG: RscButton
{
	idc = -1;
	text = $STR_UI_SQUAD_VEH_STATS;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[""stats""] call vehStats;";
};
class HQ_button_AT: RscButton
{
	idc = -1;
	text = $STR_UI_MOUNT_DISMOUNT;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[""mount""] call vehStats";
};
class HQ_button_AA: RscButton
{
	idc = -1;
	text = $STR_UI_STATIC_AUTOTARGET;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [] spawn staticAutoT";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class veh_query
{
	idd=100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = 101;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = $STR_UI_ADD_VEH_TO_SQUAD;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;vehQuery = nil; if (player == Stavros) then {nul= [] execVM ""Dialogs\squad_recruit.sqf""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gsquad: RscButton
{
	idc = 104;
	text = $STR_UI_YES;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; vehQuery = true";
};
class HQ_button_Gstatic: RscButton
{
	idc = 105;
	text = $STR_UI_NO;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; vehQuery = nil";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class player_money
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_PLAYER_AND_MONEY;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_mortar: RscButton
{
	idc = -1;
	text = $STR_UI_ADD_SERVER_MEMBER;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (isMultiplayer) then {closeDialog 0;nul = [""add""] call memberAdd;} else {hint ""This function is MP only""};";
};
class HQ_button_MG: RscButton
{
	idc = -1;
	text = $STR_UI_REMOVE_SERVER_MEMBER;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (isMultiplayer) then {closeDialog 0;nul = [""remove""] call memberAdd;} else {hint ""This function is MP only""};";
};
class HQ_button_AT: RscButton
{
	idc = -1;
	text = $STR_UI_DONATE_TO_PLAYER;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[true] call donateMoney;";
};
class HQ_button_AA: RscButton
{
	idc = -1;
	text = $STR_UI_DONATE_TO_FIA;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[] call donateMoney;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class vehicle_manager
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_VEH_MANAGER;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_GARAGE_SELL_VEH;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = createDialog ""garage_sell"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_VEH_SQUADS;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if (player == Stavros) then {nul = createDialog ""squad_manager""} else {hint ""Only Player Commander has access to this function""};";
};

class HQ_button_Gunlock: RscButton
{
	idc = -1;
	text = $STR_UI_UNLOCK_VEHICLE;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if !(isMultiplayer) then {hint ""It's unlocked already.""} else {if (player != stavros) then {nul = [false] call unlockVehicle} else {nul = [true] call unlockVehicle};};";
};

/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads";
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [] call removeGarrison";
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class garage_sell
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_SELL_OR_GARAGE_VEHICLE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""vehicle_manager"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_GARAGE_VEHICLE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player != stavros) then {nul = [false] call garageVehicle} else {if (isMultiplayer) then {_nul = createDialog ""garage_check""} else {nul = [true] call garageVehicle}};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_SELL_VEHICLE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if (player == stavros) then {nul = [] call sellVehicle} else {hint ""Only the Commander can sell vehicles""};";
};

/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads";
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [] call removeGarrison";
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class garage_check
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_PERSONAL_OR_FIA_GARAGE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""garage_sell"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_PERSONAL_GARAGE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [false] call garageVehicle;";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_FIA_GARAGE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; nul = [true] call garageVehicle;";
};


/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads";
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [] call removeGarrison";
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class vehicle_option
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_BUY_VEHICLE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_CIV_VEH;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul=[] execVM ""Dialogs\buy_vehicle_civ.sqf"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_MIL_VEH;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; nul=[] execVM ""Dialogs\buy_vehicle.sqf"";";
};
/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads";
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [] call removeGarrison";
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class civ_vehicle
{
	idd=100;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_BUY_CIV_VEH;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""vehicle_option"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = 104;
	text = $STR_UI_BUY_OFFROAD;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 0] call addFIAveh;";
};
class HQ_button_Gstatic: RscButton
{
	idc = 105;
	text = $STR_UI_BUY_TRUCK;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 1] call addFIAveh;";
};
class HQ_button_Gremove: RscButton
{
	idc = 106;
	text = $STR_UI_BUY_HELICOPTER;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 2] call addFIAveh;";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class carpet_bombing
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_CARPER_BOMBONG_STRIKE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""NATO_Options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_HE_BOMBS;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""HE""] spawn NATObomb;";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_CARPET_BOMBING;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""CARPET""] spawn NATObomb;";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = $STR_UI_NAPALM_BOMB;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NAPALM""] spawn NATObomb;";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class tu_madre
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_CARPER_BOMBONG_STRIKE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_back: RscListBox
{
	idc = -1;
	//text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1.2)";
	colorText[] = {1,1,1,1}; // Text and frame color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	colorSelect[] = {1,1,1,1}; // Text selection color
	colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
	colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)
	pictureColor[] = {1,1,1,1}; // Picture color
	pictureColorSelect[] = {1,1,1,1}; // Selected picture color
	pictureColorDisabled[] = {0,1,0,1}; // Disabled picture color


	//action = "closeDialog 0; nul = createDialog ""NATO_Options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_HE_BOMBS;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""HE""] spawn NATObomb;";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_CARPET_BOMBING;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""CARPET""] spawn NATObomb;";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = $STR_UI_NAPALM_BOMB;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 10 points";
	action = "closeDialog 0;[""NAPALM""] spawn NATObomb;";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class AI_management
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_AI_MANAGMENT;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;nul = createDialog ""radio_comm"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_TEMP_AI_CONTROL;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if ((count groupselectedUnits player > 0) and (count hcSelected player > 0)) exitWith {hint ""You must select from HC or Squad Bars, not both""}; if (count groupselectedUnits player == 1) then {nul = [groupselectedUnits player] execVM ""REINF\controlunit.sqf""}; if (count hcSelected player == 1) then {nul = [hcSelected player] execVM ""REINF\controlHCsquad.sqf"";};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_AUTO_REARM;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if (count groupselectedUnits player == 0) then {nul = (units group player) spawn rearmCall} else {nul = (groupselectedUnits player) spawn rearmCall};";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = $STR_UI_AUTO_HEAL;
	//x = 0.37749 * safezoneW + safezoneX;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (autoHeal) then {autoHeal = false; hint ""Auto Healing disabled"";} else {autoHeal = true; hint ""Auto Heal enabled""; nul = [] spawn autoHealFnc}";
};
class dismiss_units: RscButton
{
	idc = -1;
	text = $STR_UI_DISMISS_UNITS_SQUADS;
	//x = 0.37749 * safezoneW + safezoneX;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (count groupselectedUnits player > 0) then {nul = [groupselectedUnits player] execVM ""REINF\dismissPlayerGroup.sqf""} else {if (count (hcSelected player) > 0) then {nul = [hcSelected player] execVM ""REINF\dismissSquad.sqf""}}; if ((count groupselectedUnits player == 0) and (count hcSelected player == 0)) then {hint ""No units or squads selected""}";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class rounds_number
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_SELECT_NO_ROUND_TO_BE_FIRED;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = "1";
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 1;";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = "2";
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 2";
};
class HQ_button_DES: RscButton
{
	idc = -1;
	text = "3";
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; rondas = 3";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = "5";
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 5";
};
class HQ_button_RES: RscButton
{
	idc = -1;
	text = "7";
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 7";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = "6";
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 6";
};
class HQ_button_fpsplus: RscButton
{
	idc = -1;
	text = "4";
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; rondas = 4";
};

class HQ_button_AA: RscButton
{
	idc = -1;
	text = "8";
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 8";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class strike_type
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_SELECT_TYPE_OF_STRIKE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_SINGLE_POINT_STRIKE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;tipoArty = ""NORMAL"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_BARRAGE_STRIKE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; tipoArty = ""BARRAGE"";";
};
/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads";
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [] call removeGarrison";
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class mbt_type
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_SELECT_TYPE_AMMO_FOR_THE_STRIKE;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_STRIKE_HE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;tipoMuni = ""32Rnd_155mm_Mo_shells"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_LASER_GUIDED;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; tipoMuni = ""2Rnd_155mm_Mo_LG"";";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = $STR_UI_STRIKE_SMOKE;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; tipoMuni = ""6Rnd_155mm_Mo_smoke"";";
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};
class mortar_type
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_SELECT_MOTAR_AMMO;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_STRIKE_HE;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;tipoMuni = ""8Rnd_82mm_Mo_shells"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_STRIKE_SMOKE;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; tipoMuni = ""8Rnd_82mm_Mo_Smoke_white"";";
};
/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads";
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [] call removeGarrison";
};
*/
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class minebuild_menu
{
	idd=-1;
	movingenable=false;

	class controls
	{
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Alber, v1.063, #Ledyti)
////////////////////////////////////////////////////////
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_BUILD_MINEFIELD;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""build_menu"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_APERS_MINES;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[""APERSMine""] spawn mineDialog";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_AT_MINES;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [""ATMine""] spawn mineDialog";
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
	};
};

class fasttravel_dialog // 340
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class HQ_box: BOX
		{
			idc = -1;
			text = "";
			x = 0.244979 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.445038 * safezoneW;
			h = 0.20 * safezoneH;
		};
		class HQ_frame: RscFrame
		{
			idc = -1;
			text = $STR_UI_FAST_TRAVEL;
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = $STR_UI_BACK;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
		};

		class btn_ft_old: RscButton
		{
			idc = -1;
			text = $STR_UI_FAST_TRAVEL_OLD;
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = $STR_UI_TRAVEL_TO_ALL_ZONE;
			action = "closeDialog 0;nul = [] execVM ""fastTravelRadio.sqf"";";
		};
		class btn_ft_new: RscButton
		{
			idc = -1;
			text = $STR_UI_FAST_TRAVEL_NEW;
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = $STR_UI_TRAVEL_ONLY_TO_CAMP;
			action = "closeDialog 0;nul = [] execVM ""altFastTravel.sqf"";";
		};
	};
};

class camp_dialog // 350
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class HQ_box: BOX
		{
			idc = -1;
			text = "";
			x = 0.244979 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.445038 * safezoneW;
			h = 0.30 * safezoneH;
		};
		class HQ_frame: RscFrame
		{
			idc = -1;
			text = $STR_UI_CAMP_MANAGMENT;
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = $STR_UI_BACK;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
		};
		class btn_camp_build: RscButton
		{
			idc = -1;
			text = $STR_UI_ESTABLISH_CAMP;
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Price: 800 Euros";
			action = "closeDialog 0; [""create""] spawn ftravelDialog";
		};
		class btn_camp_delete: RscButton
		{
			idc = -1;
			text = $STR_UI_DELETE_CAMP;
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0; [""delete""] spawn ftravelDialog";
		};
		class HQ_button_Gremove: RscButton
		{
			idc = -1;
			text = $STR_UI_RENAME_CAMP;
			x = 0.37749 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0; [""rename""] spawn ftravelDialog";
		};
	};
};

class com_menu // 360
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class HQ_box: BOX
		{
			idc = -1;
			text = "";
			x = 0.244979 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.445038 * safezoneW;
			h = 0.30 * safezoneH;
		};
		class HQ_frame: RscFrame
		{
			idc = -1;
			text = $STR_UI_COMM_MENU;
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = $STR_UI_BACK;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""game_options"";";
		};
		class btn_toggle_ft: RscButton
		{
			idc = -1;
			text = $STR_UI_FT_ON_OFF;
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = $STR_UI_TOOGLE_OLD;
			action = "if (server getVariable ""enableFTold"") then {server setVariable [""enableFTold"",false,true]; [[petros,""hint"",""Fast Travel limited to camps and HQ""],""commsMP""] call BIS_fnc_MP;} else {server setVariable [""enableFTold"",true,true]; [[petros,""hint"",""Extended Fast Travel system enabled""],""commsMP""] call BIS_fnc_MP;};";
		};
		class btn_toggle_arsenal: RscButton
		{
			idc = -1;
			text = $STR_UI_ARSENAL_ACCESS;
			//x = 0.37749 * safezoneW + safezoneX;
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Simplified: members are exempt from gear-removal upon accessing the arsenal.";
			action = "if (server getVariable ""enableMemAcc"") then {server setVariable [""enableMemAcc"",false,true]; [[petros,""hint"",""Arsenal access set to default.""],""commsMP""] call BIS_fnc_MP;} else {server setVariable [""enableMemAcc"",true,true]; [[petros,""hint"",""Members now get to keep their gear.""],""commsMP""] call BIS_fnc_MP;};";
		};
		class btn_easy_mode: RscButton
		{
			idc = -1;
			text = $STR_UI_TOOGLE_INCRASE;
			x = 0.37749 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "if (server getVariable ""easyMode"") then {server setVariable [""easyMode"",false,true]; [[petros,""hint"",""Easy Mode disabled.""],""commsMP""] call BIS_fnc_MP;} else {server setVariable [""easyMode"",true,true]; [[petros,""hint"",""FIA income permanently increased.""],""commsMP""] call BIS_fnc_MP;};";
		};
	};
};

class com_menu_on // 370
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class HQ_box: BOX
		{
			idc = -1;
			text = "";
			x = 0.244979 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.445038 * safezoneW;
			h = 0.30 * safezoneH;
		};
		class HQ_frame: RscFrame
		{
			idc = -1;
			text = $STR_UI_COMM_MENU;
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = $STR_UI_BACK;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""game_options"";";
		};
		class btn_toggle_ft_x: RscButton
		{
			idc = -1;
			text = $STR_UI_FT_ON_OFF;
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = $STR_UI_TOOGLE_OLD;
			action = "if (server getVariable ""enableFTold"") then {server setVariable [""enableFTold"",false,true]; ctrlSetText [371,""Enable Fast Travel""]; hint ""Fast Travel restricted to camps and HQ"";} else {server setVariable [""enableFTold"",true,true]; ctrlSetText [371,""Disable Fast Travel""]; hint ""Old Fast Travel system enabled"";};";
		};
		class btn_toggle_arsenal_x: RscButton
		{
			idc = -1;
			text = $STR_UI_ARSENAL_ACCESS;
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Simplified: members are exempt from gear-removal upon accessing the arsenal.";
			action = "if (server getVariable ""enableMemAcc"") then {server setVariable [""enableMemAcc"",false,true]; hint ""Regular version active"";} else {server setVariable [""enableMemAcc"",true,true]; hint ""Simplified version active"";};";
		};
		class btn_toggle_bm: RscButton
		{
			idc = -1;
			text = "BM On/Off";
			x = 0.37749 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Toggle the Black Market on/off";
			action = "if (server getVariable ""enableBM"") then {server setVariable [""enableBM"",false,true]; hint ""Black Market disabled"";} else {server setVariable [""enableBM"",true,true]; hint ""Black Market enabled"";};";
		};
	};
};

class bm_mission_menu // 380
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class HQ_box: BOX
		{
			idc = -1;
			text = "";
			x = 0.244979 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.445038 * safezoneW;
			h = 0.20 * safezoneH;
		};
		class HQ_frame: RscFrame
		{
			idc = -1;
			text = $STR_UI_AVAILABLE_MISSIONS;
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = $STR_UI_BACK;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0";
		};
		class btn_bm_REC: RscButton
		{
			idc = -1;
			text = "Recover Shipment";
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""REC""],""bm_missions""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
		};
		class btn_bm_ACQ: RscButton
		{
			idc = -1;
			text = "Acquire Gear";
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""ACQ""],""bm_missions""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
		};
	};
};

class misCiv_menu // 400
{
	idd=-1;
	movingenable=false;

	class controls
	{
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_AVAILABLE_MISSIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_ASSASIN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""AS""],""misReqCiv""] call BIS_fnc_MP} else {hint ""Stranger does not trust you.""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_CONVOY;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CONVOY""],""misReqCiv""] call BIS_fnc_MP} else {hint ""Stranger does not trust you.""};";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_CONQUEST;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CON""],""misReqCiv""] call BIS_fnc_MP} else {hint ""Stranger does not trust you.""};";
};
	};
};

class misMil_menu // 410
{
	idd=-1;
	movingenable=false;

	class controls
	{
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_AVAILABLE_MISSIONS;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_ASSASIN;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""AS""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_CONVOY;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CONVOY""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_CONQUEST;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CON""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = $STR_UI_MISSION_DESTROY;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""DES""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
	};
};

class rCamp_Dialog // 420
{
    idd = 1;
    movingEnable = 1;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['rCamp', _this select 0];";
    duration = 25;
    fadein = 0;
    fadeout = 0;

    class controlsBackground {
        class RscPicture_1200: RscPicture
        {
            idc = 1200;
            text = "";
            x = 0.425 * safezoneW + safezoneX;
            y = 0.46 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.08 * safezoneH;
        };
    };

    class controls
    {
        class RscEdit_1400: RscEdit
        {
            idc = 1400;
            x = 0.435 * safezoneW + safezoneX;
            y = 0.47 * safezoneH + safezoneY;
            w = 0.13 * safezoneW;
            h = 0.03 * safezoneH;
            text = "";
            colorText[] =   {0,0,0,1};
            sizeEx = 0.05;
        };
        class SaveButton: RscButton
        {
            idc = 1600;
            text = "Save";
            x = 0.52 * safezoneW + safezoneX;
            y = 0.51 * safezoneH + safezoneY;
            w = 0.04 * safezoneW;
            h = 0.02 * safezoneH;
            action = "closeDialog 0; cName = ctrlText ((uiNamespace getVariable ""rCamp"") displayCtrl 1400);";
        };

    };
};

class exp_menu // 430
{
	idd=-1;
	movingenable=false;

	class controls
	{
class HQ_box: BOX
{
	idc = -1;
	text = "";
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = $STR_UI_BUYEXPLOSIVES;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = $STR_UI_BACK;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;
	h = 0.05 * safezoneH;
	action = "closeDialog 0;";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = $STR_UI_SOME_CHARGES;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Spend 300 Euros on a small bag of things that go boom.";
	//action = "closeDialog 0;if (player == Stavros) then {[[expCrate, 0, ""expLight"", 300],""buyGear""] call BIS_fnc_MP;} else {[[expCrate, 1, ""expLight"", 300],""buyGear""] call BIS_fnc_MP;};";
	//action = "closeDialog 0; [expCrate, ""expLight"", 300] call buyGear;";
	action = "closeDialog 0;if (player == Stavros) then {[[expCrate, ""expLight"", 300],""buyGear""] call BIS_fnc_MP;}";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = $STR_UI_SOME_MINES;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Spend 300 Euros on a small bag of things that make big badaboom.";
	action = "closeDialog 0;if (player == Stavros) then {[[expCrate, ""expHeavy"", 300],""buyGear""] call BIS_fnc_MP;}";
	//action = "closeDialog 0; [expCrate, ""expHeavy"", 300] call buyGear;";
};
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = $STR_UI_MANY_CHARGES;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Spend 800 Euros on a large bag of things that go boom.";
	action = "closeDialog 0;if (player == Stavros) then {[[expCrate, ""expLight"", 800],""buyGear""] call BIS_fnc_MP;}";
	//action = "closeDialog 0; [expCrate, ""expLight"", 800] call buyGear;";
};
class dismiss_units: RscButton
{
	idc = -1;
	text = $STR_UI_MANY_MINES;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Spend 800 Euros on a large bag of things that make big badaboom.";
	action = "closeDialog 0;if (player == Stavros) then {[[expCrate, ""expHeavy"", 800],""buyGear""] call BIS_fnc_MP;}";
	//action = "closeDialog 0; [expCrate, ""expHeavy"", 800] call buyGear;";
};
	};
};

class HQ_fort_dialog // 440
{
	idd=-1;
	movingenable=false;

	class controls
	{
		class HQ_box: BOX
		{
			idc = -1;
			text = "";
			x = 0.244979 * safezoneW + safezoneX;
			y = 0.223941 * safezoneH + safezoneY;
			w = 0.445038 * safezoneW;
			h = 0.30 * safezoneH;
		};
		class HQ_frame: RscFrame
		{
			idc = -1;
			text = $STR_UI_HQ_FORTIFICATION;
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = $STR_UI_BACK;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
		};
		class btn_hq_camo: RscButton
		{
			idc = -1;
			text = $STR_UI_CAMO_NET;
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0;[""net""] call HQ_adds;";
			//action = "closeDialog 0;[""net""] remoteExec [""HQ_adds"",2];";

		};
		class btn_hq_lantern: RscButton
		{
			idc = -1;
			text = $STR_UI_LANTERN;
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			//action = "closeDialog 0;[""lantern""] remoteExec [""HQ_adds"",2];";
			action = "closeDialog 0;[""lantern""] call HQ_adds;";
		};
		class btn_hq_delete: RscButton
		{
			idc = -1;
			text = $STR_UI_DELETE_ALL;
			x = 0.37749 * safezoneW + safezoneX;
			y = 0.415981 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0;[""delete""] remoteExec [""HQ_adds"",2];";
			//action = "closeDialog 0;[""delete""] call HQ_adds;";
		};
	};
};


class RscTitles {

	class Default {
       idd = -1;
       fadein = 0;
       fadeout = 0;
       duration = 0;
	};
    class H8erHUD {
        idd = 745;
        movingEnable =  0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration     =  10e10;
        fadein       =  0;
        fadeout      =  0;
        name = "H8erHUD";
		onLoad = "with uiNameSpace do { H8erHUD = _this select 0 }";
		class controls {
		    class structuredText {
                access = 0;
                type = 13;
                idc = 1001;
                style = 0x00;
                lineSpacing = 1;
				x = 0.103165 * safezoneW + safezoneX;
				y = 0.007996 * safezoneH + safezoneY;//0.757996
				w = 0.778208 * safezoneW;
				h = 0.0660106 * safezoneH;
                size = 0.055;//0.020
                colorBackground[] = {0,0,0,0};
                colorText[] = {0.34,0.33,0.33,0};//{1,1,1,1}
                text = "";
                font = "PuristaSemiBold";
					class Attributes {
						font = "PuristaSemiBold";
						color = "#C1C0BB";//"#FFFFFF";
						align = "CENTER";
						valign = "top";
						shadow = true;
						shadowColor = "#000000";
						underline = false;
						size = "4";//4
					};
            };
		};
	};
};