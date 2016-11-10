
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = "FIA HQ Options - Commander Only"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_load: RscButton // L1
{
	idc = 104;
	text = "Grab 100 € from Pool"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (isMultiPlayer) then {if (player == Stavros) then {nul=call stavrosSteal} else {hint ""Only Player Commander has access to this function""}} else {hint ""This function is MP only""};";
};
class HQ_button_savegame: RscButton // L2
{
	idc = 105;
	text = "Manage Garrisons"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul=CreateDialog ""garrison_menu""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_moveHQ: RscButton // L3
{
	idc = 106;
	text = "Move HQ to another Zone"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul = [] spawn moveHQ;} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_recruitUnit: RscButton // R1
{
	idc = 107;
	text = "Ingame Member's List"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (isMultiplayer) then {nul = [] call membersList} else {hint ""This function is MP only""}} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_recruitSquad: RscButton // R3
{
	idc = 108;
	text = "Rebuild Assets"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	tooltip = "Cost: 5.000 €";
	action = "closeDialog 0;if (player == Stavros) then {nul=[] spawn rebuildAssets} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_vehicle: RscButton // R2
{
	idc = 109;
	text = "Train FIA - Skill Upgrade"; //--- ToDo: Localize;
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
	text = "Garage Access"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = "Recruitment Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_rifleman: RscButton
{
	idc = 104;
	text = "Recruit Militiaman"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_F""] spawn reinfPlayer";
};
class HQ_button_autorifleman: RscButton
{
	idc = 105;
	text = "Recruit Autorifleman"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_AR_F""] spawn reinfPlayer";
};
class HQ_button_medic: RscButton
{
	idc = 126;
	text = "Recruit Medic"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_medic_F""] spawn reinfPlayer";
};
class HQ_button_engineer: RscButton
{
	idc = 107;
	text = "Recruit Engineer"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_engineer_F""] spawn reinfPlayer";
};
class HQ_button_explosive: RscButton
{
	idc = 108;
	text = "Recruit Bomb Specialist"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_exp_F""] spawn reinfPlayer";
};
class HQ_button_grenadier: RscButton
{
	idc = 109;
	text = "Recruit Grenadier"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_GL_F""] spawn reinfPlayer";
};
class HQ_button_marksman: RscButton
{
	idc = 110;
	text = "Recruit Marksman"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_M_F""] spawn reinfPlayer";
};

class HQ_button_AT: RscButton
{
	idc = 111;
	text = "Recruit AT"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_LAT_F""] spawn reinfPlayer";
};

class HQ_button_fpsplus: RscButton // L5
{
	idc = 112;
	text = "Recruit AA"; //--- ToDo: Localize;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""Soldier_AA""] spawn reinfPlayer";
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = "Squad Recruitment Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; _nul = createDialog ""radio_comm"";";
};
class HQ_button_infsquad: RscButton
{
	idc = 104;
	text = "Recruit Inf. Squad"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfSquad""] spawn addFIAsquadHC";
};
class HQ_button_infteam: RscButton
{
	idc = 105;
	text = "Recruit Inf. Team"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfTeam""] spawn addFIAsquadHC";
};
class HQ_button_ATteam: RscButton
{
	idc = 106;
	text = "Recruit AT Team"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfTeam_AT""] spawn addFIAsquadHC";
};
class HQ_button_sniperTeam: RscButton
{
	idc = 107;
	text = "Recruit Sniper Team"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_SniperTeam_M""] spawn addFIAsquadHC";
};
class HQ_button_infsquadM: RscButton
{
	idc = 108;
	text = "Recruit Sentry"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""IRG_InfSentry""] spawn addFIAsquadHC";
};
class HQ_button_infteamM: RscButton
{
	idc = 109;
	text = "Recruit AT Truck"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""B_static_AT_F""] spawn addFIAsquadHC";
};
class HQ_button_ATteamM: RscButton
{
	idc = 110;
	text = "Recruit AA Truck"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""B_static_AA_F""] spawn addFIAsquadHC";
};

class HQ_button_mortar: RscButton
{
	idc = 111;
	text = "Recruit Mortar Team"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [""B_G_Mortar_01_F""] spawn addFIAsquadHC";
};

class HQ_button_engineers: RscButton
{
	idc = 112;
	text = "Recruit Engineers"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = "Purchase Military Vehicle"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""vehicle_option"";";
};
class HQ_button_quad: RscButton // L1
{
	idc = 104;
	text = "Buy Quadbike"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0; nul = [vfs select 3] call addFIAveh";
};
class HQ_button_offroad: RscButton // L2
{
	idc = 105;
	text = "Buy Offroad/UAZ"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 4] call addFIAveh;";
};
class HQ_button_truck: RscButton // L3
{
	idc = 106;
	text = "Buy Truck"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 5] call addFIAveh;";
};
class HQ_button_Aoffroad: RscButton // R1
{
	idc = 107;
	text = "Buy Armed Offroad"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 6] call addFIAveh;";
};
class HQ_button_MG: RscButton // R3
{
	idc = 108;
	text = "Buy MG"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 7] call addFIAveh;";
};
class HQ_button_mortar: RscButton // R2
{
	idc = 109;
	text = "Buy Mortar"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 8] call addFIAveh;";
};
class HQ_button_AT: RscButton // L4
{
	idc = 110;
	text = "Buy Static AT"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 9] call addFIAveh;";
};

class HQ_button_AA: RscButton // R4
{
	idc = 111;
	text = "Buy Static AA"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 10] call addFIAveh;";
};

class HQ_button_APC: RscButton // L5 -- M5
{
	idc = 112;
	text = "Buy APC"; //--- ToDo: Localize;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (hayRHS) then {if (player == Stavros) then {closeDialog 0;nul = [vfs select 11] call addFIAveh;} else {hint ""Only Player Commander has access to this function""};}else {hint ""RHS exclusive for now""};";
};
/*
class HQ_button_CTRUCK: RscButton // R5
{
	idc = 113;
	text = "Buy C2 Truck"; //--- ToDo: Localize;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (hayRHS) then {if (player == Stavros) then {closeDialog 0;nul = [vfs select 12] call addFIAveh;} else {hint ""Only Player Commander has access to this function""};}else {hint ""RHS/TFAR exclusive for now""};";
};
*/

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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Game Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_civplus: RscButton
{
	idc = -1;
	text = "Civ Config"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {closeDialog 0; nul = createDialog ""civ_config""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_civless: RscButton
{
	idc = -1;
	text = "Resign Comm.Career"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0; if (isMultiplayer) then {execVM ""orgPlayers\commResign.sqf""} else {hint ""This feature is MP Only""};";
};
class HQ_button_music: RscButton
{
	idc = -1;
	text = "Music ON/OFF"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0; if (musicON) then {musicON = false; hint ""Music turned OFF"";} else {musicON = true; nul = execVM ""musica.sqf""; hint ""Music turned ON""};";
};
class HQ_button_garbageclean: RscButton
{
	idc = -1;
	text = "Garbage Clean"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closedialog 0;if (player == Stavros) then {[] remoteExec [""garbageCleaner"",2]} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_loadgame: RscButton
{
	idc = -1;
	text = "Reinit UI \ Radio"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[] execVM ""reinitY.sqf"";statistics= [] execVM ""statistics.sqf"";";
};
class HQ_button_savegame: RscButton
{
	idc = -1;
	text = "Persistent Save"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {[""statSave\saveLoop.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP} else {_nul = [] execVM ""statSave\saveLoop.sqf""; hint ""Personal Stats Saved""};";
};
class HQ_button_fpsplus: RscButton
{
	idc = -1;
	text = "FPS Limiter"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {closeDialog 0; nul = createDialog ""fps_limiter""} else {hint ""Only Player Commander has access to this function""};";
};

class HQ_button_AA: RscButton
{
	idc = -1;
	text = "Spawn Dist. Config"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {closeDialog 0; nul = createDialog ""spawn_config""} else {hint ""Only Player Commander has access to this function""};";
};

class HQ_button_com_menu: RscButton
{
	idc = -1;
	text = "Commander Menu"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.710047 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (server getVariable ""enableOptions"") then {if (player == Stavros) then {closeDialog 0; nul = createDialog ""com_menu_on""} else {hint ""Only Player Commander has access to this function""};} else {if (player == Stavros) then {closeDialog 0; nul = createDialog ""com_menu""} else {hint ""Only Player Commander has access to this function""}};";
};

class HQ_button_resync: RscButton
{
	idc = -1;
	text = "Resync Arsenal"; //--- ToDo: Localize;
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


class first_load
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Load previous session?"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "YES"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) and (isNil ""placementDone"")) then {[""statSave\loadAccount.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP; placementDone = true; publicVariable ""placementDone""} else {nul = [] execVM ""statSave\loadAccount.sqf"";};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "NO"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == stavros) then {_nul = createDialog ""boost_menu"";}";
};
/*
class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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

class init_menu
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Enable Switch Commander?"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "YES"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "switchCom = true; publicVariable ""switchCom""; hint ""Switch Commander Enabled\n\nGame will auto assign Commander position to the highest ranked player"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "NO"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "switchCom = false; publicVariable ""switchCom""; hint ""Switch Commander Disabled\n\nGame will only assign Commander position upon Commander disconnection"";";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Done"; //--- ToDo: Localize;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (!isNil ""switchCom"") then {closedialog 0; nul = [] execVM ""Dialogs\membersMenu.sqf"";} else {hint ""Select an option first""};";
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	//h = 0.30 * safezoneH;
	h = 0.40 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Building Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	//h = 0.28 * safezoneH;
	h = 0.37 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_mortar: RscButton // L2
{
	idc = -1;
	text = "Build Minefield"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""minebuild_menu"";";
};
class HQ_button_cman: RscButton // R2
{
	idc = -1;
	text = "Manage Camps"; //--- ToDo: Localize;
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
	text = "O.Post - Roadblock"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [""create""] spawn puestoDialog";
};
class HQ_button_AA: RscButton // R1
{
	idc = -1;
	text = "O.Post-Roadblock Delete"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; [""delete""] spawn puestoDialog";
};
class HQ_button_lantern: RscButton // L3
{
	idc = -1;
	text = "HQ Fortifications"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Available Missions"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = "Military Contact"; // L1
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""FND_M""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = "Civilian Contact"; // L2
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""FND_C""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_DES: RscButton
{
	idc = -1;
	text = "Explosives Dealer"; // L3
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""FND_E""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = "Logistics Mission"; // R1
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""LOG""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_RES: RscButton
{
	idc = -1;
	text = "Rescue Mission"; // R3
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if ((player == Stavros) or (not(isPlayer Stavros))) then {[[""RES""],""missionrequest""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = "Destroy Mission"; // R2
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Battle Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = "Fast Travel"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (server getVariable ""enableFTold"") then {nul= createDialog ""fasttravel_dialog""} else {nul = [] execVM ""altFastTravel.sqf""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = "Undercover ON"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [] spawn undercover";
};
class HQ_button_DES: RscButton
{
	idc = -1;
	text = "Vehicle Manager"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""vehicle_manager"";";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = "NATO Options"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul=CreateDialog ""NATO_Options""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_RES: RscButton
{
	idc = -1;
	text = "Building Options"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul=CreateDialog ""build_menu""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = "Recruit Squad"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player == Stavros) then {nul= [] execVM ""Dialogs\squad_recruit.sqf""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_fpsplus: RscButton
{
	idc = -1;
	text = "AI Management"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == leader group player) then {closeDialog 0;nul = createDialog ""AI_management""} else {hint ""Only group leaders may access to this option""};";
};

class HQ_button_AA: RscButton
{
	idc = -1;
	text = "Player and Money"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.590125 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Ask NATO for"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.560125 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_AS: RscButton // L1
{
	idc = -1;
	text = "Attack Mission"; //--- ToDo: Localize;
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
	text = "Armored Column"; //--- ToDo: Localize;
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
	text = "Artillery"; //--- ToDo: Localize;
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
	text = "Roadblock"; //--- ToDo: Localize;
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
	text = "Artillery"; //--- ToDo: Localize;
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
	text = "NATO UAV"; //--- ToDo: Localize;
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
	text = "Ammodrop"; //--- ToDo: Localize;
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
	text = "CAS Support"; //--- ToDo: Localize;
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
	text = "Bomb Run"; //--- ToDo: Localize;
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
	text = "NATO QRF"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Garrison Menu"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""HQ_menu"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Recruit Garrison"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[""add""] spawn garrisonDialog";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Remove Garrison"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = "Garrison Recruitment Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""garrison_menu"";";
};
class HQ_button_rifleman: RscButton
{
	idc = 104;
	text = "Recruit Militiaman"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_F""] call garrisonAdd";
};
class HQ_button_autorifleman: RscButton
{
	idc = 105;
	text = "Recruit Autorifleman"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_AR_F""] call garrisonAdd";
};
class HQ_button_medic: RscButton
{
	idc = 126;
	text = "Recruit Medic"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_medic_F""] call garrisonAdd";
};
class HQ_button_engineer: RscButton
{
	idc = 107;
	text = "Recruit Squad Leader"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_SL_F""] call garrisonAdd";
};
class HQ_button_explosive: RscButton
{
	idc = 108;
	text = "Recruit Mortar"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""b_g_soldier_unarmed_f""] call garrisonAdd";
};
class HQ_button_grenadier: RscButton
{
	idc = 109;
	text = "Recruit Grenadier"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_GL_F""] call garrisonAdd";
};
class HQ_button_marksman: RscButton
{
	idc = 110;
	text = "Recruit Marksman"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_M_F""] call garrisonAdd";
};

class HQ_button_AT: RscButton
{
	idc = 111;
	text = "Recruit AT"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "nul = [""B_G_Soldier_LAT_F""] call garrisonAdd";
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "FPS Limiter"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""game_options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "+1 FPS Limit"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {[[1],""fpsChange""] call BIS_fnc_MP} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "-1 FPS Limit"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Spawn Distance Config"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""game_options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "+100 Spawn Dist."; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (distanciaSPWN < 2500) then {distanciaSPWN = distanciaSPWN + 100; if (distanciaSPWN > 2500) then {distanciaSPWN = 2500};publicVariable ""distanciaSPWN"";}; hint format [""Spawn Distance Set to %1 meters. Be careful, this may affect game performance"",distanciaSPWN]} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "-100 Spawn Dist."; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Civ Presence Config"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""game_options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "+1% Civ Spawn."; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (player == Stavros) then {if (civPerc < 1) then {civPerc = civPerc + 0.01; if (civPerc > 1) then {civPerc = 1}; publicVariable ""civPerc"";}; hint format [""Civilian Percentage Set to %1 percent"",civPerc * 100]} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "-1% Civ Spawn."; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "HC Squad Options"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_mortar: RscButton
{
	idc = -1;
	text = "Squad Add Vehicle"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[] call addSquadVeh;";
};
class HQ_button_MG: RscButton
{
	idc = -1;
	text = "Squad Vehicle Stats"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[""stats""] call vehStats;";
};
class HQ_button_AT: RscButton
{
	idc = -1;
	text = "Mount / Dismount"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[""mount""] call vehStats";
};
class HQ_button_AA: RscButton
{
	idc = -1;
	text = "Static Autotarget"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = 102;
	text = "Add Vehicle to Squad?"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = 103;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;vehQuery = nil; if (player == Stavros) then {nul= [] execVM ""Dialogs\squad_recruit.sqf""} else {hint ""Only Player Commander has access to this function""};";
};
class HQ_button_Gsquad: RscButton
{
	idc = 104;
	text = "YES"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; vehQuery = true";
};
class HQ_button_Gstatic: RscButton
{
	idc = 105;
	text = "NO"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Player and Money Interaction"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_mortar: RscButton
{
	idc = -1;
	text = "Add Server Member"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (isMultiplayer) then {closeDialog 0;nul = [""add""] call memberAdd;} else {hint ""This function is MP only""};";
};
class HQ_button_MG: RscButton
{
	idc = -1;
	text = "Remove Server Member"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (isMultiplayer) then {closeDialog 0;nul = [""remove""] call memberAdd;} else {hint ""This function is MP only""};";
};
class HQ_button_AT: RscButton
{
	idc = -1;
	text = "Donate 100 € to player"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "[true] call donateMoney;";
};
class HQ_button_AA: RscButton
{
	idc = -1;
	text = "Donate 100 € to FIA"; //--- ToDo: Localize;
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
class members_menu
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Enable Server Membership?"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "YES"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "miembros = []; {miembros pushBack (getPlayerUID _x)} forEach playableUnits; publicVariable ""miembros""; hint ""Server Membership Enabled.\n\nAll the present players have been added to the Member's List.\n\nNon-members cannot use the HQ Ammobox and cannot be commanders, even with Switch Commander enabled.\n\nIf you load a session with this feature disabled, it will change to disabled.\n\nUse this option for Open Server Environments"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "NO"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "miembros = []; publicVariable ""miembros""; hint ""Server Membership Disabled.\n\nAnyone can use the HQ Ammobox and become Commander (if Switch Commander is enabled).\n\nIf you load a session with this feature enabled, it will become enabled.\n\nUse this option for Private Server environments."";";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Done"; //--- ToDo: Localize;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "if (!isNil ""miembros"") then {closedialog 0; nul = [] execVM ""Dialogs\firstLoad.sqf"";} else {hint ""Select an option first""};";
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Vehicle Manager"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Garage\Sell Vehicle"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = createDialog ""garage_sell"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Vehicles and Squads"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if (player == Stavros) then {nul = createDialog ""squad_manager""} else {hint ""Only Player Commander has access to this function""};";
};

class HQ_button_Gunlock: RscButton
{
	idc = -1;
	text = "Unlock Vehicle"; //--- ToDo: Localize;
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
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Sell or Garage Vehicle"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""vehicle_manager"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Garage Vehicle"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (player != stavros) then {nul = [false] call garageVehicle} else {if (isMultiplayer) then {_nul = createDialog ""garage_check""} else {nul = [true] call garageVehicle}};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Sell Vehicle"; //--- ToDo: Localize;
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
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Personal or FIA Garage?"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""garage_sell"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Personal Garage"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [false] call garageVehicle;";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "FIA Garage"; //--- ToDo: Localize;
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
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Buy Vehicle"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Civilian Vehicle"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul=[] execVM ""Dialogs\buy_vehicle_civ.sqf"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Military Vehicle"; //--- ToDo: Localize;
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
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Buy Civilian Vehicle"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""vehicle_option"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = 104;
	text = "Offroad"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 0] call addFIAveh;";
};
class HQ_button_Gstatic: RscButton
{
	idc = 105;
	text = "Truck"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;nul = [vfs select 1] call addFIAveh;";
};
class HQ_button_Gremove: RscButton
{
	idc = 106;
	text = "Helicopter"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Carpet Bombing Strike"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0; nul = createDialog ""NATO_Options"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "HE Bombs"; //--- ToDo: Localize;
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
	text = "Carpet Bombing"; //--- ToDo: Localize;
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
	text = "NAPALM Bomb"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Carpet Bombing Strike"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_back: RscListBox
{
	idc = -1;
	//text = "Back"; //--- ToDo: Localize;
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
	text = "HE Bombs"; //--- ToDo: Localize;
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
	text = "Carpet Bombing"; //--- ToDo: Localize;
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
	text = "NAPALM Bomb"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "AI Management"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;nul = createDialog ""radio_comm"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Temp. AI Control"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if ((count groupselectedUnits player > 0) and (count hcSelected player > 0)) exitWith {hint ""You must select from HC or Squad Bars, not both""}; if (count groupselectedUnits player == 1) then {nul = [groupselectedUnits player] execVM ""REINF\controlunit.sqf""}; if (count hcSelected player == 1) then {nul = [hcSelected player] execVM ""REINF\controlHCsquad.sqf"";};";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Auto Rearm"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; if (count groupselectedUnits player == 0) then {nul = (units group player) spawn rearmCall} else {nul = (groupselectedUnits player) spawn rearmCall};";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Auto Heal"; //--- ToDo: Localize;
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
	text = "Dismiss Units/Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.492103 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Select No. Rounds to be fired"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.462103 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = "1"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 1;";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = "2"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 2";
};
class HQ_button_DES: RscButton
{
	idc = -1;
	text = "3"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; rondas = 3";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = "5"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 5";
};
class HQ_button_RES: RscButton
{
	idc = -1;
	text = "7"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.514003 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 7";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = "6"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;rondas = 6";
};
class HQ_button_fpsplus: RscButton
{
	idc = -1;
	text = "4"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.612025 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; rondas = 4";
};

class HQ_button_AA: RscButton
{
	idc = -1;
	text = "8"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Select type of strike"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Single Point Strike"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;tipoArty = ""NORMAL"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Barrage Strike"; //--- ToDo: Localize;
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
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Select type ammo for the strike"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "HE"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;tipoMuni = ""32Rnd_155mm_Mo_shells"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Laser Guided"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0; tipoMuni = ""2Rnd_155mm_Mo_LG"";";
};

class HQ_button_Gremove: RscButton
{
	idc = -1;
	text = "Smoke"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Select Mortar Ammo"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "HE"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;tipoMuni = ""8Rnd_82mm_Mo_shells"";";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "Smoke"; //--- ToDo: Localize;
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
	text = "Remove Garrison Squads"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.20 * safezoneH;//30
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Build Minefield"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.18 * safezoneH;//28
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0;_nul = createDialog ""build_menu"";";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "APERS Mines"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;[""APERSMine""] spawn mineDialog";
};
class HQ_button_Gstatic: RscButton
{
	idc = -1;
	text = "AT Mines"; //--- ToDo: Localize;
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
			text = "Fast Travel";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = "Back"; //--- ToDo: Localize;
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
		};

		class btn_ft_old: RscButton
		{
			idc = -1;
			text = "Fast Travel (old)";
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Targets: all FIA-controlled zones";
			action = "closeDialog 0;nul = [] execVM ""fastTravelRadio.sqf"";";
		};
		class btn_ft_new: RscButton
		{
			idc = -1;
			text = "Fast Travel (new)";
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Only FIA camps and HQ";
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
			text = "Camp Management";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = "Back";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
		};
		class btn_camp_build: RscButton
		{
			idc = -1;
			text = "Establish Camp";
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
			text = "Delete Camp";
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			action = "closeDialog 0; [""delete""] spawn ftravelDialog";
		};
		class HQ_button_Gremove: RscButton
		{
			idc = -1;
			text = "Rename Camp";
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
			text = "Commander Menu";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = "Back";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""game_options"";";
		};
		class btn_toggle_ft: RscButton
		{
			idc = -1;
			text = "FT On/Off";
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Toggle the old Fast Travel system on/off";
			action = "if (server getVariable ""enableFTold"") then {server setVariable [""enableFTold"",false,true]; [[petros,""hint"",""Fast Travel limited to camps and HQ""],""commsMP""] call BIS_fnc_MP;} else {server setVariable [""enableFTold"",true,true]; [[petros,""hint"",""Extended Fast Travel system enabled""],""commsMP""] call BIS_fnc_MP;};";
		};
		class btn_toggle_arsenal: RscButton
		{
			idc = -1;
			text = "Arsenal Access On/Off";
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
			text = "Toggle Increased Income";
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
			text = "Commander Menu";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = "Back";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""game_options"";";
		};
		class btn_toggle_ft_x: RscButton
		{
			idc = -1;
			text = "FT On/Off";
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Toggle the old Fast Travel system on/off";
			action = "if (server getVariable ""enableFTold"") then {server setVariable [""enableFTold"",false,true]; ctrlSetText [371,""Enable Fast Travel""]; hint ""Fast Travel restricted to camps and HQ"";} else {server setVariable [""enableFTold"",true,true]; ctrlSetText [371,""Disable Fast Travel""]; hint ""Old Fast Travel system enabled"";};";
		};
		class btn_toggle_arsenal_x: RscButton
		{
			idc = -1;
			text = "Arsenal Access On/Off";
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
			text = "Available Missions";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = "Back";
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

class boost_menu // 390
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
			text = "Is the start too hard for you?";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.18 * safezoneH;
		};
		class HQ_button_Gsquad: RscButton
		{
			idc = -1;
			text = "YES";
			x = 0.272481 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "You'll get some resources, and basic gear will be unlocked";
			action = "closeDialog 0;if (player == stavros) then {[""boost.sqf"",""BIS_fnc_execVM""] call BIS_fnc_MP;};if ((player == stavros) and (isNil ""placementDone"")) then {_nul = [] spawn placementselection};";
		};
		class HQ_button_Gstatic: RscButton
		{
			idc = -1;
			text = "NO";
			x = 0.482498 * safezoneW + safezoneX;
			y = 0.317959 * safezoneH + safezoneY;
			w = 0.175015 * safezoneW;
			h = 0.0560125 * safezoneH;
			tooltip = "Pea shooters, iron sights and plain clothes it is";
			action = "closeDialog 0;if ((player == stavros) and (isNil ""placementDone"")) then {_nul = [] spawn placementselection};";
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Available Missions"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = "Assassination Mission"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""AS""],""misReqCiv""] call BIS_fnc_MP} else {hint ""Stranger does not trust you.""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = "Convoy Ambush"; //--- ToDo: Localize;
	x = 0.37749 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CONVOY""],""misReqCiv""] call BIS_fnc_MP} else {hint ""Stranger does not trust you.""};";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = "Conquest Missions"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Available Missions"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;//0.175015
	h = 0.05 * safezoneH;
	action = "closeDialog 0";
};
class HQ_button_AS: RscButton
{
	idc = -1;
	text = "Assassination Mission"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""AS""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
class HQ_button_CONV: RscButton
{
	idc = -1;
	text = "Convoy Ambush"; //--- ToDo: Localize;
	x = 0.272481 * safezoneW + safezoneX;
	y = 0.415981 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CONVOY""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
class HQ_button_LOG: RscButton
{
	idc = -1;
	text = "Conquest Missions"; //--- ToDo: Localize;
	x = 0.482498 * safezoneW + safezoneX;
	y = 0.317959 * safezoneH + safezoneY;
	w = 0.175015 * safezoneW;
	h = 0.0560125 * safezoneH;
	action = "closeDialog 0;if (((getPlayerUID player) in miembros) || (player == Stavros)) then {[[""CON""],""misReqMil""] call BIS_fnc_MP} else {hint ""Nomad does not trust you.""};";
};
class HQ_button_vehicle: RscButton
{
	idc = -1;
	text = "Destroy Missions"; //--- ToDo: Localize;
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
	text = ""; //--- ToDo: Localize;
	x = 0.244979 * safezoneW + safezoneX;
	y = 0.223941 * safezoneH + safezoneY;
	w = 0.445038 * safezoneW;
	h = 0.30 * safezoneH;
};
class HQ_frame: RscFrame
{
	idc = -1;
	text = "Buy Explosives"; //--- ToDo: Localize;
	x = 0.254979 * safezoneW + safezoneX;
	y = 0.233941 * safezoneH + safezoneY;
	w = 0.425038 * safezoneW;
	h = 0.28 * safezoneH;
};
class HQ_button_back: RscButton
{
	idc = -1;
	text = "Back"; //--- ToDo: Localize;
	x = 0.61 * safezoneW + safezoneX;
	y = 0.251941 * safezoneH + safezoneY;
	w = 0.06 * safezoneW;
	h = 0.05 * safezoneH;
	action = "closeDialog 0;";
};
class HQ_button_Gsquad: RscButton
{
	idc = -1;
	text = "Some Charges"; //--- ToDo: Localize;
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
	text = "Some Mines"; //--- ToDo: Localize;
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
	text = "Many Charges"; //--- ToDo: Localize;
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
	text = "Many Mines"; //--- ToDo: Localize;
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
			text = "HQ Fortifications";
			x = 0.254979 * safezoneW + safezoneX;
			y = 0.233941 * safezoneH + safezoneY;
			w = 0.425038 * safezoneW;
			h = 0.28 * safezoneH;
		};
		class HQ_button_back: RscButton
		{
			idc = -1;
			text = "Back";
			x = 0.61 * safezoneW + safezoneX;
			y = 0.251941 * safezoneH + safezoneY;
			w = 0.06 * safezoneW;
			h = 0.05 * safezoneH;
			action = "closeDialog 0;_nul = createDialog ""radio_comm"";";
		};
		class btn_hq_camo: RscButton
		{
			idc = -1;
			text = "Camo Net";
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
			text = "Lantern";
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
			text = "Delete All";
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