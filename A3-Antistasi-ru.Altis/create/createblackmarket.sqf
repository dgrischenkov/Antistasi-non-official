if (!isServer and hasInterface) exitWith {};

private ["_marcador","_posicion","_grupo","_campGroup","_rcrate"];

_objs = [];

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

_fp = "Land_Campfire_F" createVehicle [0,0,0];
_fp setpos _posicion;
_fp inflame true;

_wreck = "Land_Wreck_Ural_F" createVehicle [0,0,0];
_wreck setPos ([getPos _fp, 3, 270] call BIS_Fnc_relPos);

_tent = "Land_TentDome_F" createVehicle [0,0,0];
_tent setPos ([getPos _fp, 5, 135] call BIS_Fnc_relPos);
_tent setDir ([_fp, _tent] call BIS_fnc_dirTo);

_crate = blackMarketCrate createVehicle [0,0,0];
_crate setPos ([getPos _fp, 2, 210] call BIS_Fnc_relPos);
_crate setDir ([_fp, _crate] call BIS_fnc_dirTo);
_nul = [_crate] call emptyCrate;

// [[_crate, ["Sell Gear","Municion\bmCrate.sqf"]],"addAction",true,true] call BIS_fnc_MP;
[[_crate,"sell_gear"],"flagaction"] call BIS_fnc_MP;

_grupo = createGroup side_blue;
_unit = _grupo createUnit ["C_Nikos_aged", [0,0,0], [], 100, "FORM"] ;
_unit setPos ([getPos _fp, 3, 135] call BIS_Fnc_relPos);
_tent setDir ([_fp, _tent] call BIS_fnc_dirTo);
_unit disableAI "move";
_unit setunitpos "up";


// [[_unit, ["Beg for attention",{nul=CreateDialog "mission_menu";}]],"addAction",true,true] call BIS_fnc_MP;
// [[_unit,"bm_mission"],"flagaction"] call BIS_fnc_MP;

{[_x] spawn FIAinitBASES;} forEach units _grupo;

// waitUntil {sleep 5; (not(spawner getVariable _marcador)) or ({alive _x} count units _grupo == 0) or (not(_marcador in campsTony))};

waitUntil {sleep 5; (not(spawner getVariable _marcador)) or (not(_marcador in campsTony))};

if ({alive _x} count units _grupo == 0) then
	{
	campsTony = campsTony - [_marcador]; publicVariable "campsTony";
	marcadores = marcadores - [_marcador]; publicVariable "marcadores";
	deleteMarker _marcador;
	[["TaskFailed", ["", "Camp Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
	};

waitUntil {sleep 5; (not(spawner getVariable _marcador)) or (not(_marcador in campsTony))};

{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;

// credit to JBOY
/*

{
    if (str typeof _x find "Land_Campfire_" > -1) then {_x inflame false;};
} forEach nearestObjects [_posicion, [], 15];

{
    if ((str typeof _x find blackMarketCrate > -1
        or str typeof _x find "Land_Wreck_Ural_F" > -1
        or str typeof _x find "Land_TentDome_F" > -1
        or str typeof _x find "Land_Campfire_F" > -1))
		then {
        	_objs pushBack _x;
    };
} forEach nearestObjects [_posicion, [], 15];


{
    _x enableSimulation false;
    _x hideObjectGlobal  true;
 } foreach _objs;
*/

[_posicion, "campTony"] remoteExec ["despawnCamp"];
