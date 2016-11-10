if (!isServer and hasInterface) exitWith{};

private ["_pos","_marcador","_vehiculos","_grupos","_soldados","_posicion","_busy","_buildings","_pos1","_pos2","_grupo","_cuenta","_tipoVeh","_veh","_unit","_arrayVehAAF","_nVeh","_frontera","_size","_ang","_mrk","_tipogrupo","_bandera","_perro"];
_marcador = _this select 0;

_vehiculos = [];
_grupos = [];
_soldados = [];

_posicion = getMarkerPos (_marcador);
_pos = [];

_size = [_marcador] call sizeMarker;

_frontera = [_marcador] call isFrontline;
if ((spawner getVariable _marcador) and _frontera) then
	{
	_roads = _posicion nearRoads _size;
	if (count _roads != 0) then
		{
		_grupo = createGroup side_green;
		_grupos = _grupos + [_grupo];
		_dist = 0;
		_road = objNull;
		{if ((position _x) distance _posicion > _dist) then {_road = _x;_dist = position _x distance _posicion}} forEach _roads;
		_roadscon = roadsConnectedto _road;
		_roadcon = objNull;
		{if ((position _x) distance _posicion > _dist) then {_roadcon = _x}} forEach _roadscon;
		_dirveh = [_roadcon, _road] call BIS_fnc_DirTo;
		_pos = [getPos _road, 7, _dirveh + 270] call BIS_Fnc_relPos;
		_bunker = "Land_BagBunker_Small_F" createVehicle _pos;
		_vehiculos = _vehiculos + [_bunker];
		_bunker setDir _dirveh;
		_pos = getPosATL _bunker;
		_veh = statAT createVehicle _posicion;
		_vehiculos = _vehiculos + [_veh];
		_veh setPos _pos;
		_veh setDir _dirVeh + 180;
		_unit = _grupo createUnit [infGunner, _posicion, [], 0, "NONE"];
		[_unit] spawn genInitBASES;
		[_veh] spawn genVEHinit;
		_unit moveInGunner _veh;
		_soldados = _soldados + [_unit];
		};
	};

_mrk = createMarkerLocal [format ["%1patrolarea", random 100], _posicion];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [(distanciaSPWN/2),(distanciaSPWN/2)];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_ang = markerDir _marcador;
_mrk setMarkerDirLocal _ang;
if (!debug) then {_mrk setMarkerAlphaLocal 0};
_cuenta = 0;
while {(spawner getVariable _marcador) and (_cuenta < 4)} do
	{
	while {true} do
		{
		_pos = [_posicion, 150 + (random 350) ,random 360] call BIS_fnc_relPos;
		if (!surfaceIsWater _pos) exitWith {};
		};
	_tipogrupo = infPatrol call BIS_fnc_selectRandom;
	_grupo = [_pos, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
	sleep 1;
	if ((random 10 < 2.5) and (_tipogrupo != "HAF_SniperTeam")) then
		{
		_perro = _grupo createUnit ["Fin_random_F",_pos,[],0,"FORM"];
		[_perro] spawn guardDog;
		};
	_nul = [leader _grupo, _mrk, "SAFE","SPAWNED", "NOVEH2"] execVM "scripts\UPSMON.sqf";
	_grupos = _grupos + [_grupo];
	{[_x] spawn genInitBASES; _soldados pushBack _x} forEach units _grupo;
	_cuenta = _cuenta +1;
	};

_busy = if (dateToNumber date > server getVariable _marcador) then {false} else {true};

if (!_busy) then
	{
	_buildings = nearestObjects [_posicion, ["Land_LandMark_F"], _size / 2];
	if (count _buildings > 1) then
		{
		_pos1 = getPos (_buildings select 0);
		_pos2 = getPos (_buildings select 1);
		_ang = [_pos1, _pos2] call BIS_fnc_DirTo;

		_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
		_grupo = createGroup side_green;
		_grupos = _grupos + [_grupo];
		_cuenta = 0;
		while {(spawner getVariable _marcador) and (_cuenta < 5)} do
			{
			_tipoveh = planesAAF call BIS_fnc_selectRandom;
			_veh = createVehicle [_tipoveh, _pos, [],3, "NONE"];
			_veh setDir (_ang + 90);
			sleep 1;
			_vehiculos = _vehiculos + [_veh];
			_nul = [_veh] spawn genVEHinit;
			_pos = [_pos, 20,_ang] call BIS_fnc_relPos;
			_unit = _grupo createUnit [infPilot, _posicion, [], 0, "NONE"];
			[_unit] spawn genInitBASES;
			_cuenta = _cuenta + 1;
			};

		_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","NOFOLLOW","NOVEH"] execVM "scripts\UPSMON.sqf";
		{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;
		};
	};

_bandera = createVehicle [cFlag, _posicion, [],0, "CAN_COLLIDE"];
_bandera allowDamage false;
[[_bandera,"take"],"flagaction"] call BIS_fnc_MP;
_vehiculos = _vehiculos + [_bandera];
_veh = "I_supplyCrate_F" createVehicle _posicion;
_nul = [_veh] call cajaAAF;
_vehiculos = _vehiculos + [_veh];

_arrayVeh = vehPatrol + vehSupply + vehAAFAT - [heli_default];
_tipoVeh = "";
_nVeh = round (_size/60);
_cuenta = 0;
while {(spawner getVariable _marcador) and (_cuenta < _nVeh)} do
	{
	if (diag_fps > minimoFPS) then
		{
		_tipoVeh = _arrayVeh call BIS_fnc_selectRandom;
		_pos = [_posicion, 10, _size/2, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos;
		_veh = createVehicle [_tipoVeh, _pos, [], 0, "NONE"];
		_veh setDir random 360;
		_vehiculos = _vehiculos + [_veh];
		_nul = [_veh] spawn genVEHinit;
		};
	sleep 1;
	_cuenta = _cuenta + 1;
	};

_tipogrupo = infSquad call BIS_fnc_selectRandom;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
if (hayRHS) then {_grupo = [_grupo, _posicion] call expandGroup};
_nul = [leader _grupo, _marcador, "SAFE", "RANDOMUP","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
_grupos = _grupos + [_grupo];
{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;
_cuenta = 0;

if (_frontera) then {_nveh = _nveh * 2};

while {(spawner getVariable _marcador) and (_cuenta < _nveh)} do
	{
	if (diag_fps > minimoFPS) then
		{
		while {true} do
			{
			_pos = [_posicion, random _size,random 360] call BIS_fnc_relPos;
			if (!surfaceIsWater _pos) exitWith {};
			};
		_tipogrupo = infSquad call BIS_fnc_selectRandom;
		_grupo = [_pos, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
		if (hayRHS) then {_grupo = [_grupo, _posicion] call expandGroup};
		if (random 10 < 2.5) then
			{
			_perro = _grupo createUnit ["Fin_random_F",_pos,[],0,"FORM"];
			[_perro] spawn guardDog;
			};
		sleep 1;
		_nul = [leader _grupo, _marcador, "SAFE","SPAWNED", "RANDOM","NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
		_grupos = _grupos + [_grupo];
		{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;
		};
	_cuenta = _cuenta + 1;
	sleep 1;
	};

_grupo = createGroup civilian;
_grupos pushBack _grupo;
_perro = _grupo createUnit ["Fin_random_F",_posicion,[],0,"FORM"];
[_perro] spawn guardDog;
_soldados pushBack _perro;

_periodista = objNull;
if ((random 100 < (((server getVariable "prestigeNATO") + (server getVariable "prestigeCSAT"))/10)) and (spawner getVariable _marcador)) then
	{
	_pos = [];
	_grupo = createGroup civilian;
	while {true} do
		{
		_pos = [_posicion, round (random _size), random 360] call BIS_Fnc_relPos;
		if (!surfaceIsWater _pos) exitWith {};
		};
	_periodista = _grupo createUnit ["C_journalist_F", _pos, [],0, "NONE"];
	_nul = [_periodista] spawn CIVinit;
	_grupos pushBack _grupo;
	_nul = [_periodista, _marcador, "SAFE", "SPAWNED","NOFOLLOW", "NOVEH2","NOSHARE","DoRelax"] execVM "scripts\UPSMON.sqf";
	};

waitUntil {sleep 1; (not (spawner getVariable _marcador)) or (({(not(vehicle _x isKindOf "Air"))} count ([_size,0,_posicion,"BLUFORSpawn"] call distanceUnits)) > 3*({(alive _x) and (!(captive _x)) and (_x distance _posicion < _size)} count _soldados))};

if ((spawner getVariable _marcador) and (not(_marcador in mrkFIA))) then
	{
	[_bandera] remoteExec ["mrkWIN",2];
	};

waitUntil {sleep 1; not (spawner getVariable _marcador)};

deleteMarker _mrk;
{if (alive _x) then {deleteVehicle _x}} forEach _soldados;
if (!isNull _periodista) then {deleteVehicle _periodista};
{deleteGroup _x} forEach _grupos;
{if (!([distanciaSPWN-_size,1,_x,"BLUFORSpawn"] call distanceUnits)) then {deleteVehicle _x}} forEach _vehiculos;


