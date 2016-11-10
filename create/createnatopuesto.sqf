if (!isServer and hasInterface) exitWith {};

private ["_marcador","_posicion","_escarretera","_tam","_road","_veh","_grupo","_unit","_roadcon"];

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

_NATOSupp = server getVariable "prestigeNATO";

_grupo = createGroup side_blue;


_tam = 1;

while {true} do {
	_road = _posicion nearRoads _tam;
	if (count _road > 0) exitWith {};
	_tam = _tam + 5;
};

_roadcon = roadsConnectedto (_road select 0);
_dirveh = [_road select 0, _roadcon select 0] call BIS_fnc_DirTo;

if (hayUSAF) then {
	0 = [getpos (_road select 0), _dirveh, call (compile (preprocessFileLineNumbers "Compositions\cmpUSAF_RB.sqf"))] call BIS_fnc_ObjectsMapper;
}
else {
	0 = [getpos (_road select 0), _dirveh, call (compile (preprocessFileLineNumbers "Compositions\cmpNATO_RB.sqf"))] call BIS_fnc_ObjectsMapper;
};


_vehArray = [];
_turretArray = [];
_tempPos = [];
{
	 if (str typeof _x find (bluAPC select 0) > -1) then {_vehArray pushBack _x;};
	 if (str typeof _x find (bluStatHMG select 0) > -1) then {_turretArray pushBack _x;};
	 if (str typeof _x find (bluStatAA select 0) > -1) then {_turretArray pushBack _x;};
	 if (str typeof _x find "Land_Camping_Light_F" > -1) then {_tempPos = _x;};
} forEach nearestObjects [_road select 0, [], 18];

_veh = _vehArray select 0;
_HMG = _turretArray select 0;
_AA1 = _turretArray select 1;
_AA2 = _turretArray select 2;

if (_NATOSupp < 50) then {
	_AA1 enableSimulation false;
    _AA1 hideObjectGlobal true;

	if !(hayUSAF) then {
   		_AA2 enableSimulation false;
    	_AA2 hideObjectGlobal true;
	};
}
else {
	_unit = _grupo createUnit [bluCrew, _posicion, [], 0, "NONE"];
	_unit moveInGunner _AA1;

	if !(hayUSAF) then {
		_unit = _grupo createUnit [bluCrew, _posicion, [], 0, "NONE"];
		_unit moveInGunner _AA2;
	};
};

sleep 1;

_veh lock 3;

_nul = [_veh] spawn NATOVEHinit;
_veh allowCrewInImmobile true;
sleep 1;

_tipoGrupo = selectRandom bluATTeam;
_grupoInf = [getpos _tempPos, side_blue, (bluCfgInf >> _tipoGrupo)] call BIS_Fnc_spawnGroup;

_infdir = _dirveh + 180;
if (_infdir >= 360) then {_infdir = _infdir - 360};
_grupoInf setFormDir _infdir;

diag_log format ["direction: %1; infdir: %2", _dirveh, _infdir];

_unit = _grupo createUnit [bluCrew, _posicion, [], 0, "NONE"];
_unit moveInGunner _HMG;
_unit = _grupo createUnit [bluCrew, _posicion, [], 0, "NONE"];
_unit moveInGunner _veh;
_unit = _grupo createUnit [bluCrew, _posicion, [], 0, "NONE"];
_unit moveInCommander _veh;

{[_x] spawn NATOinitCA} forEach units _grupo;
{[_x] spawn NATOinitCA} forEach units _grupoInf;


waitUntil {sleep 1; (not(spawner getVariable _marcador)) or (({alive _x} count units _grupo == 0) && ({alive _x} count units _grupoInf == 0)) or (not(_marcador in puestosNATO))};

if ({alive _x} count units _grupo == 0) then {
	puestosNATO = puestosNATO - [_marcador]; publicVariable "puestosNATO";
	marcadores = marcadores - [_marcador]; publicVariable "marcadores";
	_nul = [5,-5,_posicion] remoteExec ["citySupportChange",2];
	deleteMarker _marcador;
	[["TaskFailed", ["", "Roadblock Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
};

waitUntil {sleep 1; (not(spawner getVariable _marcador)) or (not(_marcador in puestosNATO))};

deleteVehicle _veh;
{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;

{deleteVehicle _x} forEach units _grupoInf;
deleteGroup _grupoInf;

[_road select 0, "NATORB"] remoteExec ["clean_cmp"];
