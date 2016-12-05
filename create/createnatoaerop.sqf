if (!isServer and hasInterface) exitWith{};

private ["_marcador","_vehiculos","_grupos","_soldados","_posicion","_pos","_size","_veh","_estaticas","_nVeh","_cuenta","_grupo","_unit","_buildings","_tipoveh","_ang","_soldadosFIA","_gruposFIA","_prestigio","_grupoMort"];

_marcador = _this select 0;

_vehiculos = [];
_grupos = [];
_soldados = [];
_soldadosFIA = [];
_gruposFIA = [];

_posicion = getMarkerPos (_marcador);
_pos = [];
_prestigio = (server getVariable "prestigeNATO")/100;

_size = [_marcador] call sizeMarker;
_estaticas = staticsToSave select {_x distance _posicion < _size};

_buildings = nearestObjects [_posicion, ["Land_LandMark_F"], _size / 2];

if (count _buildings > 1) then
	{
	_pos1 = getPos (_buildings select 0);
	_pos2 = getPos (_buildings select 1);
	_ang = [_pos1, _pos2] call BIS_fnc_DirTo;

	_pos = [_pos1, 5,_ang] call BIS_fnc_relPos;
	_grupo = createGroup side_blue;
	_grupos = _grupos + [_grupo];
	_cuenta = 0;
	while {(spawner getVariable _marcador) and (_cuenta < round (5*_prestigio))} do
		{
		_tipoveh = (planesNATO - bluCASFW) call BIS_fnc_selectRandom;
		_veh = createVehicle [_tipoveh, _pos, [],3, "NONE"];
		_veh setDir (_ang + 90);
		sleep 1;
		_vehiculos = _vehiculos + [_veh];
		_nul = [_veh] spawn NATOVEHinit;
		_pos = [_pos, 20,_ang] call BIS_fnc_relPos;
		_unit = _grupo createUnit [bluPilot, _posicion, [], 0, "NONE"];
		_cuenta = _cuenta + 1;
		};
	_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","NOFOLLOW","NOVEH"] execVM "scripts\UPSMON.sqf";
	{[_x] spawn NATOinit; _soldados = _soldados + [_x]} forEach units _grupo;
	};



_pos = [_posicion, 3,0] call BIS_fnc_relPos;
_veh = createVehicle [bluFlag, _pos, [],0, "CAN_COLLIDE"];
_veh allowDamage false;
[[_veh,"hq_managment"],"flagaction"] call BIS_fnc_MP;
[[_veh,"unit"],"flagaction"] call BIS_fnc_MP;
[[_veh,"vehicle"],"flagaction"] call BIS_fnc_MP;
[[_veh,"garage"],"flagaction"] call BIS_fnc_MP;
_vehiculos = _vehiculos + [_veh];

_nVeh = round ((_size/100)*_prestigio);
_cuenta = 0;
while {(spawner getVariable _marcador) and (_cuenta < _nVeh)} do
	{
	if (diag_fps > minimoFPS) then
		{
		_tipoVeh = vehNATO call BIS_fnc_selectRandom;
		_pos = [_posicion, 10, _size/2, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos;
		_veh = createVehicle [_tipoVeh, _pos, [], 0, "NONE"];
		_veh setDir random 360;
		_veh lock 3;
		_vehiculos = _vehiculos + [_veh];
		_nul = [_veh] spawn NATOVEHinit;
		sleep 1;
		};
	_cuenta = _cuenta + 1;
	};

{_nul = [_x] spawn cleanserVeh} forEach _vehiculos;

_tipoGrupo = selectRandom bluSquad;
_grupo = [_posicion, side_blue, (bluCfgInf >> _tipoGrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
_nul = [leader _grupo, _marcador, "SAFE", "RANDOMUP","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
_grupos = _grupos + [_grupo];
{[_x] spawn NATOinit; _soldados = _soldados + [_x]} forEach units _grupo;
_cuenta = 0;
while {(spawner getVariable _marcador) and (_cuenta < _nVeh)} do
	{
	if (diag_fps > minimoFPS) then
		{
		while {true} do
			{
			_pos = [_posicion, random _size,random 360] call BIS_fnc_relPos;
			if (!surfaceIsWater _pos) exitWith {};
			};
		_tipoGrupo = selectRandom bluSquad;
		_grupo = [_pos,side_blue, (bluCfgInf >> _tipoGrupo)] call BIS_Fnc_spawnGroup;
		sleep 1;
		if ((count _estaticas > 0) and (_cuenta == 0)) then
			{
			_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","FORTIFY","NOVEH","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
			}
		else
			{
			_nul = [leader _grupo, _marcador, "SAFE","SPAWNED", "RANDOM","NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
			};
		_grupos = _grupos + [_grupo];
		{[_x] spawn NATOinit; _soldados = _soldados + [_x]} forEach units _grupo;
		};
	_cuenta = _cuenta + 1;
	};

_garrison = garrison getVariable [_marcador,[]];
_tam = count _garrison;
_cuenta = 0;
_grupo = createGroup side_blue;
_gruposFIA = _gruposFIA + [_grupo];

if (("b_g_soldier_unarmed_f" in _garrison) or ({typeOf _x == "B_G_Mortar_01_F"} count _estaticas > 0)) then
	{
	_grupoMort = createGroup side_blue;
	};
_grupoEst = grpNull;
if (count _estaticas > 0) then
	{
	_grupoEst = createGroup side_blue;
	};

while {true} do
	{
	_pos = [_posicion, random _size,random 360] call BIS_fnc_relPos;
	if (!surfaceIsWater _pos) exitWith {};
	};

while {(spawner getVariable _marcador) and (_cuenta < _tam)} do
	{
	_tipo = _garrison select _cuenta;
	if (_tipo == "b_g_soldier_unarmed_f") then
		{
		_unit = _grupoMort createUnit [_tipo, _posicion, [], 0, "NONE"];
		_pos = _posicion findEmptyPosition [1,30,"I_G_Mortar_01_F"];
		_veh = "B_G_Mortar_01_F" createVehicle _pos;
		_vehiculos = _vehiculos + [_veh];
		_nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";
		_unit moveInGunner _veh;
		[_veh] spawn VEHinit;
		}
	else
		{
		if ((_tipo == "B_G_Soldier_F") and (count _estaticas > 0)) then
			{
			_estatica = _estaticas select 0;
			if (typeOf _estatica == "B_G_Mortar_01_F") then
				{
				_unit = _grupoMort createUnit [_tipo, _posicion, [], 0, "NONE"];
				_unit moveInGunner _estatica;
				_nul=[_estatica] execVM "scripts\UPSMON\MON_artillery_add.sqf";
				}
			else
				{
				_unit = _grupoEst createUnit [_tipo, _posicion, [], 0, "NONE"];
				_unit moveInGunner _estatica;
				};
			_estaticas = _estaticas - [_estatica];
			}
		else
			{
			_unit = _grupo createUnit [_tipo, _posicion, [], 0, "NONE"];
			if (_tipo == "B_G_Soldier_SL_F") then {_grupo selectLeader _unit};
			};
		};
	[_unit,_marcador] call FIAinitBASES;
	_soldadosFIA = _soldadosFIA + [_unit];
	_cuenta = _cuenta + 1;
	sleep 0.5;
	if (count units _grupo == 8) then
		{
		_grupo = createGroup side_blue;
		_gruposFIA = _gruposFIA + [_grupo];
		while {true} do
			{
			_pos = [_posicion, random _size,random 360] call BIS_fnc_relPos;
			if (!surfaceIsWater _pos) exitWith {};
			};
		};
	};

for "_i" from 0 to (count _gruposFIA) - 1 do
	{
	_grupo = _gruposFIA select _i;
	_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","RANDOM","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
	};

if ("b_g_soldier_unarmed_f" in _garrison) then
	{
	_gruposFIA = _gruposFIA + [_grupoMort];
	};

_periodista = objNull;
if ((random 100 < (((server getVariable "prestigeNATO") + (server getVariable "prestigeCSAT")))) and (spawner getVariable _marcador)) then
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

// experimental

waitUntil {sleep 1; (not (spawner getVariable _marcador)) or (({not(vehicle _x isKindOf "Air")} count ([_size,0,_posicion,"OPFORSpawn"] call distanceUnits)) > 3*(({alive _x} count _soldados) + count ([_size,0,_posicion,"BLUFORSpawn"] call distanceUnits)))};


if (spawner getVariable _marcador) then
	{
	if (_marcador != "FIA_HQ") then {[_marcador] remoteExec ["mrkLOOSE",2]};
	};

// /experimental

waitUntil {sleep 1; not (spawner getVariable _marcador)};


{
_soldado = _x;
if (alive _soldado) then
	{
	deleteVehicle _x
	};
} forEach _soldadosFIA;
if (!isNull _periodista) then {deleteVehicle _periodista};
{deleteGroup _x} forEach _gruposFIA;
{if (alive _x) then {deleteVehicle _x}} forEach _soldados;
{deleteGroup _x} forEach _grupos;
deleteGroup _grupoEst;
{if (!(_x in staticsToSave)) then {deleteVehicle _x}} forEach _vehiculos;


