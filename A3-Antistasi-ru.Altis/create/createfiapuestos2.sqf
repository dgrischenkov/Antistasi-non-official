if (!isServer and hasInterface) exitWith {};

private ["_marcador","_posicion","_escarretera","_tam","_road","_veh","_grupo","_unit","_roadcon","_mortero","_vehicles"];

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

_vehicles = [];

_escarretera = false;
if (isOnRoad _posicion) then {_escarretera = true};

if (_escarretera) then
	{
	_tam = 1;

	while {true} do
		{
		_road = _posicion nearRoads _tam;
		if (count _road > 0) exitWith {};
		_tam = _tam + 5;
		};

	_roadcon = roadsConnectedto (_road select 0);
	_dirveh = [_road select 0, _roadcon select 0] call BIS_fnc_DirTo;

/*
	if (hayRHS) then {
		_vehicle=[getpos (_road select 0), 0,"rhs_gaz66o_msv", side_blue] call bis_fnc_spawnvehicle;
		_veh = _vehicle select 0;
		_vehicles pushBack _veh;
		{_veh deleteVehicleCrew _x} forEach crew _veh;
		_grupo = _vehicle select 2;
		_veh setDir _dirveh + 90;
		_veh lock 3;
		_pos = getpos (_road select 0) findEmptyPosition [1,30,statMGtower];
		_mortero = statMGtower createVehicle _pos;
		_vehicles pushBack _mortero;
		_mortero attachTo [_veh,[0,-0.5,1.2]];
		_mortero setDir (getDir _veh + 180);
		_nul = [_veh] spawn VEHinit;
		sleep 1;
		_grupo = [_posicion, side_blue, (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> "IRG_InfTeam_AT")] call BIS_Fnc_spawnGroup;
		_unit = _grupo createUnit ["B_G_Soldier_F", _posicion, [], 0, "NONE"];
		_unit moveInGunner _mortero;
	}
	else {
		*/
		_veh = "B_G_Offroad_01_armed_F" createVehicle getPos (_road select 0);
		_vehicles pushBack _veh;
		_veh setDir _dirveh + 90;
		_veh lock 3;
		_nul = [_veh] spawn VEHinit;
		sleep 1;
		_grupo = [_posicion, side_blue, (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> "IRG_InfTeam_AT")] call BIS_Fnc_spawnGroup;
		_unit = _grupo createUnit ["B_G_Soldier_F", _posicion, [], 0, "NONE"];
		_unit moveInGunner _veh;



	}
else
	{
	_grupo = [_posicion, side_blue, (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> "IRG_SniperTeam_M")] call BIS_Fnc_spawnGroup;
	_grupo setBehaviour "STEALTH";
	_grupo setCombatMode "GREEN";
	};

{[_x] spawn FIAinitBASES;} forEach units _grupo;

waitUntil {sleep 1; (not(spawner getVariable _marcador)) or ({alive _x} count units _grupo == 0) or (not(_marcador in puestosFIA))};

if ({alive _x} count units _grupo == 0) then
	{
	puestosFIA = puestosFIA - [_marcador]; publicVariable "puestosFIA";
	mrkFIA = mrkFIA - [_marcador]; publicVariable "mrkFIA";
	marcadores = marcadores - [_marcador]; publicVariable "marcadores";
	_nul = [5,-5,_posicion] remoteExec ["citySupportChange",2];
	deleteMarker _marcador;
	if (_escarretera) then
		{
		[["TaskFailed", ["", "Roadblock Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		}
	else
		{
		[["TaskFailed", ["", "Watchpost Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		};
	};

waitUntil {sleep 1; (not(spawner getVariable _marcador)) or (not(_marcador in puestosFIA))};

if (_escarretera) then {
	{deleteVehicle _x;} forEach _vehicles;
};
{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;