private ["_flag","_tipo"];

if (isDedicated) exitWith {};

_flag = _this select 0;
_tipo = _this select 1;

switch _tipo do
	{
	case "take": {removeAllActions _flag; _flag addAction ["Take the Flag", {[[_this select 0, _this select 1],"mrkWIN"] call BIS_fnc_MP;},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]};
	case "unit": {_flag addAction [localize "STR_UI_UNIT_RECRUITMENT", {nul=[] execVM "Dialogs\unit_recruit.sqf";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "vehicle": {_flag addAction [localize "STR_UI_BUY_VEHICLE", {nul = createDialog "vehicle_option";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "mission": {petros addAction [localize "STR_UI_MISSION_REQUEST", {nul=CreateDialog "mission_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "misCiv": {_flag addAction [localize "STR_UI_MISSION_REQUEST", {nul=CreateDialog "misCiv_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "misMil": {_flag addAction [localize "STR_UI_MISSION_REQUEST", {nul=CreateDialog "misMil_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "camion": {_flag addAction [localize "STR_UI_AMMOBOX_TO_TRUCK", "Municion\transfer.sqf",nil,0,false,true]};
	case "remove":
	{
	//removeAllActions _flag
	for "_i" from 0 to (_flag addAction ["",""]) do
		{
		_flag removeAction _i;
		};
	};
	case "refugiado": {_flag addAction [localize "STR_UI_ORDER_TO_FOLLOW", "AI\liberaterefugee.sqf",nil,0,false,true]};
	case "prisionero": {_flag addAction [localize "STR_UI_LIBERATE_POW", "AI\liberatePOW.sqf",nil,0,false,true]};
	case "interrogar": {_flag addAction [localize "STR_UI_INTERROGATE", "AI\interrogar.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]};
	case "capturar": {_flag addAction [localize "STR_UI_OFFIER_TO_JOIN", "AI\capturar.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]};
	case "buildHQ": {_flag addAction [localize "STR_UI_BUILD_HQ_HERE", {[] spawn buildHQ},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]};
	case "seaport": {_flag addAction [localize "STR_UI_BUY_BOAT", "REINF\buyBoat.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "steal": {_flag addAction [localize "STR_UI_STEAL_STATIC", "REINF\stealStatic.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "garage":
		{
		if (isMultiplayer) then
			{
			_flag addAction [localize "STR_UI_PERSONAL_GARAGE", {nul = [true] spawn garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]
			}
		else
			{
			_flag addAction [localize "STR_UI_FIA_GARAGE", {nul = [false] spawn garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]
			};
		};
	case "sell_gear": {_flag addAction [localize "STR_UI_SELL_GEAR", "Municion\bmCrate.sqf",nil,0,false,true]};
	case "heal_camp": {_flag addAction [localize "STR_UI_GRAB_SOME_CHOW", "heal.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "refuel": {_flag addAction [localize "STR_UI_REFUEL_VEH", "refuel.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "bm_mission": {_flag addAction [localize "STR_UI_WHAT_DO", {nul=CreateDialog "bm_mission_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "conversation": {_flag addAction [localize "STR_UI_TALK", "AI\conversation.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "buy_exp": {_flag addAction [localize "STR_UI_BUY", {nul=CreateDialog "exp_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	case "jam": {_flag addAction [localize "STR_UI_JAM_CSAT", "jamLRRAdio.sqf",nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];};
	};