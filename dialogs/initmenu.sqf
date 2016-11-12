switchCom = false;
publicVariable "switchCom";

miembros = [];
// miembros pushBack (getPlayerUID _x)} forEach playableUnits;
publicVariable "miembros";

_bypass = false;

if ((player == Stavros) and (isNil "placementDone")) then
{
	["statSave\loadAccount.sqf","BIS_fnc_execVM"] call BIS_fnc_MP;
	["boost.sqf","BIS_fnc_execVM"] call BIS_fnc_MP;
	placementDone = true;
	publicVariable "placementDone";
}
else
{
	nul = [] execVM "statSave\loadAccount.sqf";
};

if (count _this > 0) then {_bypass = true};

/*
if ((!dialog) and (!visibleMap) and (isNil "statsLoaded") and (player == stavros) and (!_bypass) and (isNil "placementDone")) then
{
	_nul = [] spawn placementSelection;
};
*/
