if (!isServer and hasInterface) exitWith{};

private ["_marcador","_vehiculos","_grupos","_soldados","_posicion","_pos","_size","_veh","_estaticas","_garrison","_tam","_cuenta","_grupo","_grupoMort","_tipo","_unit","_civs"];

_marcador = _this select 0;

_posicion = getMarkerPos _marcador;
_size = [_marcador] call sizeMarker;

_civs = [];
_soldados = [];
_grupos = [];
_vehiculos = [];

_veh = createVehicle ["Flag_FIA_F", _posicion, [],0, "CAN_COLLIDE"];
_veh allowDamage false;
_vehiculos = _vehiculos + [_veh];
[[_veh,"unit"],"flagaction"] call BIS_fnc_MP;
[[_veh,"vehicle"],"flagaction"] call BIS_fnc_MP;
[[_veh,"garage"],"flagaction"] call BIS_fnc_MP;
_estaticas = staticsToSave select {_x distance _posicion < _size};

if (not (_marcador in destroyedCities)) then
	{
	if ((daytime > 8) and (daytime < 18)) then
		{
		//_tipociv = "";
		_grupo = createGroup civilian;
		_grupos = _grupos + [_grupo];
		for "_i" from 1 to 8 do
			{
			//_tipociv = arrayCivs call BIS_Fnc_selectRandom;
			_civ = _grupo createUnit ["C_man_w_worker_F", _posicion, [],0, "NONE"];
			_nul = [_civ] spawn CIVinit;
			_civs = _civs + [_civ];
			sleep 0.5;
			};
		_nul = [_marcador,_civs] spawn destroyCheck;
		_nul = [leader _grupo, _marcador, "SAFE", "NOVEH2","SPAWNED","NOFOLLOW", "NOSHARE","DoRelax","NOVEH2"] execVM "scripts\UPSMON.sqf";
		};
	};

_garrison = garrison getVariable [_marcador,[]];
_tam = count _garrison;
_cuenta = 0;
_grupo = createGroup side_blue;
_grupos = _grupos + [_grupo];

if (("b_g_soldier_unarmed_f" in _garrison) or ({typeOf _x == "B_G_Mortar_01_F"} count _estaticas > 0)) then
	{
	_grupoMort = createGroup side_blue;
	};
_grupoEst = grpNull;
if (count _estaticas > 0) then
	{
	_grupoEst = createGroup side_blue;
	};

while {(spawner getVariable _marcador) and (_cuenta < _tam)} do
	{
	_tipo = _garrison select _cuenta;
	if (_tipo == "b_g_soldier_unarmed_f") then
		{
		_unit = _grupoMort createUnit [_tipo, _posicion, [], 0, "NONE"];
		_pos = [_posicion] call mortarPos;
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
	_soldados = _soldados + [_unit];
	_cuenta = _cuenta + 1;
	sleep 0.5;
	if (count units _grupo == 8) then
		{
		_grupo = createGroup side_blue;
		_grupos = _grupos + [_grupo];
		};
	};

for "_i" from 0 to (count _grupos) - 1 do
	{
	_grupo = _grupos select _i;
	if (_i == 0) then
		{
		_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","RANDOMUP","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
		}
	else
		{
		_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","RANDOM","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
		};
	};

if ("b_g_soldier_unarmed_f" in _garrison) then
	{
	_grupos = _grupos + [_grupoMort];
	};

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

waitUntil {sleep 1; (not (spawner getVariable _marcador)) or (({not(vehicle _x isKindOf "Air")} count ([_size,0,_posicion,"OPFORSpawn"] call distanceUnits)) > 3*(({alive _x} count _soldados) + count ([_size,0,_posicion,"BLUFORSpawn"] call distanceUnits)))};
if (spawner getVariable _marcador) then
	{
	[_marcador] remoteExec ["mrkLOOSE",2];
	};

waitUntil {sleep 1; not (spawner getVariable _marcador)};

{
_soldado = _x;
if (alive _soldado) then
	{
	deleteVehicle _x
	};
} forEach _soldados;
if (!isNull _periodista) then {deleteVehicle _periodista};
{deleteGroup _x} forEach _grupos;
deleteGroup _grupoEst;
{deleteVehicle _x} forEach _civs;
{if (!(_x in staticsToSave)) then {deleteVehicle _x}} forEach _vehiculos;
