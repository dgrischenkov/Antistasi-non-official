
private ["_cuenta","_tonto","_tiempo","_punish"];
if (isDedicated) exitWith {};

if (!isMultiplayer) exitWith {};

_tonto = _this select 0;
_tiempo = _this select 1;

if (player!= _tonto) exitWith {};

_punish = _tonto getVariable ["punish",0];
_punish = _punish + _tiempo;

disableUserInput true;
player removeMagazines (primaryWeapon player);
removeAllItemsWithMagazines player;
player removeMagazines (secondaryWeapon player);
player removeWeaponGlobal (primaryWeapon player);
player removeWeaponGlobal (secondaryWeapon player);
player setPosASL [0,0,0];

hint localize "STR_PRISON_0";
sleep 5;
hint localize "STR_PRISON_1";
sleep 5;
hint localize "STR_PRISON_2";
sleep 5;
_cuenta = _punish;
while {_cuenta > 0} do
	{
	hint format [localize "STR_PRISON_3", _cuenta];
	sleep 1;
	_cuenta = _cuenta -1;
	};
hint localize "STR_PRISON_4";
disableUserInput false;
player setpos getMarkerPos "respawn_west";
player setVariable ["punish",_punish,true];
