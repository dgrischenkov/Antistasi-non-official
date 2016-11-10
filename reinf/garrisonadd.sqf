private ["_hr","_resourcesFIA","_tipo","_coste","_marcador","_garrison","_posicion","_unit","_grupo","_veh","_pos","_salir"];

_hr = server getVariable "hr";

if (_hr < 1) exitWith {hint "You lack of HR to make a new recruitment"};

_resourcesFIA = server getVariable "resourcesFIA";

_tipo = _this select 0;

_coste = server getVariable _tipo;
_salir = false;

if (_tipo == "b_g_soldier_unarmed_f") then
	{
	_coste = _coste + (["B_G_Mortar_01_F"] call vehiclePrice);
	};

if (_coste > _resourcesFIA) exitWith {hint format ["You do not have enough money for this kind of unit (%1 € needed)",_coste]};

_marcador = [marcadores,posicionGarr] call BIS_fnc_nearestPosition;
_posicion = getMarkerPos _marcador;
_chequeo = false;
{
	if (((side _x == side_red) or (side _x == side_green)) and (_x distance _posicion < 500) and (not(captive _x))) then {_chequeo = true};
} forEach allUnits;

if (_chequeo) exitWith {Hint "You cannot Recruit Garrison Units with enemies near the zone"};
if (closeMarkersUpdating > 0) exitWith {hint format ["We are currently adding garrison units to this zone. HQ nearby zones require more time to add garrisons.\n\nPlease try again in %1 seconds.",closeMarkersUpdating]};
_nul = [-1,-_coste] remoteExec ["resourcesFIA",2];
_garrison = garrison getVariable [_marcador,[]];
_garrison = _garrison + [_tipo];
garrison setVariable [_marcador,_garrison,true];
[_marcador] call mrkUpdate;
hint format ["Soldier recruited.%1",[_marcador] call garrisonInfo];

if (spawner getVariable _marcador) then
	{
	closeMarkersUpdating = 10;
	_forzado = false;
	if (_marcador in forcedSpawn) then {forcedSpawn = forcedSpawn - [_marcador]; publicVariable "forcedSpawn"; _forzado = true};
	[_marcador] remoteExec ["tempMoveMrk",2];
	[_marcador,_forzado] spawn
		{
		private ["_marcador","_forzado"];
		_marcador = _this select 0;
		_forzado = _this select 1;
		while {closeMarkersUpdating > 1} do
			{
			sleep 1;
			closeMarkersUpdating = closeMarkersUpdating - 1;
			};
		waitUntil {getMarkerPos _marcador distance [0,0,0] > 10};
		closeMarkersUpdating = 0;
		};
	if (_forzado) then {forcedSpawn pushBackUnique _marcador; publicVariable "forcedSpawn"};

	/*
	_grupo = createGroup WEST;
	_unit = _grupo createUnit [_tipo, _posicion, [], 0, "NONE"];
	[_unit,_marcador] call FIAinitBASES;
	if (_tipo == "b_g_soldier_unarmed_f") then
		{
		_pos = _posicion findEmptyPosition [1,30,"I_G_Mortar_01_F"];
		_veh = "B_G_Mortar_01_F" createVehicle _pos;
		_nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";
		_unit moveInGunner _veh;
		[_veh] spawn VEHinit;
		}
	else
		{
		_size = [_marcador] call sizeMarker;
		if ({(_x distance _posicion < _size) and (isNull gunner _x)} count staticsToSave == 0) then
			{
			_nul = [leader _grupo, _marcador, "SAFE", "RANDOMA","SPAWNED", "NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
			}
		else
			{
			_nul = [leader _grupo, _marcador, "SAFE", "FORTIFY","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
			};
		};
	[_marcador,_unit,_tipo] spawn
		{
		private ["_marcador","_unit","_tipo","_garrison"];
		_marcador = _this select 0;
		_unit = _this select 1;
		_tipo = _this select 2;
		waitUntil {sleep 1; (not(spawner getVariable _marcador))};

		if (alive _unit) then
			{
			if (_tipo == "b_g_soldier_unarmed_f") then
				{
				_veh = vehicle _unit;
				if (!(_veh in staticsToSave)) then {deleteVehicle _veh};
				};
			deleteVehicle _unit;
			};
		};
	*/
	};

