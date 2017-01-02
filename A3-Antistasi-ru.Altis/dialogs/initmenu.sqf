switchCom = false;
publicVariable "switchCom";

miembros = [];
publicVariable "miembros";

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
