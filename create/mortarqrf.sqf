if (!isServer and hasInterface) exitWith {};

private ["_marcador","_esMarcador","_exit","_radio","_base","_aeropuerto","_posDestino","_soldados","_vehiculos","_grupos","_roads","_posorigen",
		"_tam","_tipoVeh","_vehicle","_veh","_vehCrew","_grupoVeh","_landPos","_tipoGrupo","_grupo","_soldado","_threatEval","_pos","_timeOut",
		"_heli","_plane","_armor","_ifv"];

_marcador = _this select 0;
_inWaves = false;
_base = "";
_aeropuerto = "";

diag_log format ["marker: %1", _marcador];

if (count _this > 1) then
	{
	_base = _this select 1;
	if (_base in aeropuertos) then {_aeropuerto = _base; _base = ""};
	_inWaves = true;
	};

if ((!_inWaves) and (diag_fps < minimoFPS)) exitWith {};

_esMarcador = false;
_exit = false;
if (typeName _marcador == typeName "") then
	{
	_esMarcador = true;
	diag_log "type is nada";
	if (!_inWaves) then {if (_marcador in smallCAmrk) then {_exit = true}};
	}
else
	{
	_cercano = [smallCApos,_marcador] call BIS_fnc_nearestPosition;
	diag_log format ["cercana: %1", _cercano];
	if (_cercano distance _marcador < (distanciaSPWN/2)) then
		{
		diag_log "exit";
		_exit = true;
		}
	else
		{
		if (count smallCAmrk > 0) then
			{
			_cercano = [smallCAmrk,_marcador] call BIS_fnc_nearestPosition;
			diag_log format ["cercano camrk: %1", _cercano];
			if (getMarkerPos _cercano distance _marcador < (distanciaSPWN/2)) then {_exit = true};
			};
		};
	};

diag_log format ["exit: %1", _exit];

if (_exit) exitWith {};

_radio = true;
if (!_inWaves) then {_radio = [_marcador] call radioCheck};

if (!_radio) exitWith {};

if (!_inWaves) then
	{
	_base = [_marcador] call findBasesForCA;
	if (_base == "") then {_aeropuerto = [_marcador] call findAirportsForCA};
	};

_hayCSAT = true;


_posDestino = _this select 0;
if (_esMarcador) then
	{
	_posDestino = getMarkerPos _marcador;
	};

_threatEval = [_posDestino] call AAthreatEval;
diag_log format ["threat: %1", _threatEval];

if (_esMarcador) then
	{
	smallCAmrk pushBackUnique _marcador; publicVariable "smallCAmrk";
	}
else
	{
	smallCApos pushBack _marcador;
	};

if (debug) then {hint format ["Nos contraatacan desde %1 o desde el aeropuerto %2 hacia %3", _base, _aeropuerto,_marcador]; sleep 5};

_soldados = [];
_vehiculos = [];
_grupos = [];
_roads = [];

if (_hayCSAT) then
	{
	_posorigen = getMarkerPos "spawnCSAT";
	_posorigen set [2,300];
	for "_i" from 1 to 3 do
		{
		_tipoVeh = "";
		if (_i == 3) then
			{
			_tipoVeh = selectRandom opHeliTrans;
			}
		else
			{
			if (_threatEval > 10) then {_tipoVeh = selectRandom (planesCSAT - opHeliTrans)} else {_tipoVeh = selectRandom planesCSAT};
			};
		_timeOut = 0;
		_pos = _posorigen findEmptyPosition [0,100,_tipoveh];
		while {_timeOut < 60} do
			{
			if (count _pos > 0) exitWith {};
			_timeOut = _timeOut + 1;
			_pos = _posorigen findEmptyPosition [0,100,_tipoveh];
			sleep 1;
			};
		if (count _pos == 0) then {_pos = _posorigen};
		_vehicle=[_pos, 0, _tipoveh, side_red] call bis_fnc_spawnvehicle;
		_heli = _vehicle select 0;
		_heliCrew = _vehicle select 1;
		_grupoheli = _vehicle select 2;
		_soldados = _soldados + _heliCrew;
		_grupos = _grupos + [_grupoheli];
		_vehiculos = _vehiculos + [_heli];
		[_heli] spawn CSATVEHinit;
		if (not(_tipoveh in opHeliTrans)) then
			{
			{[_x] spawn CSATinit} forEach _heliCrew;
			_wp1 = _grupoheli addWaypoint [_posdestino, 0];
			_wp1 setWaypointType "SAD";
			[_heli,"CSAT Air Attack"] spawn inmuneConvoy;
			}
		else
			{
			{_x setBehaviour "CARELESS";} forEach units _grupoheli;
			_grupo = [_posorigen, side_red, opGroup_Squad] call BIS_Fnc_spawnGroup;
			{_x assignAsCargo _heli; _x moveInCargo _heli; _soldados = _soldados + [_x]; [_x] spawn CSATinit} forEach units _grupo;
			//[_mrkDestino,_grupo] spawn attackDrill;
			_grupos = _grupos + [_grupo];
			[_heli,"CSAT Air Transport"] spawn inmuneConvoy;
			if ((_marcador in bases) or (_marcador in aeropuertos) or (random 10 < _threatEval)) then
				{
				[_heli,_grupo,_marcador,_threatEval] spawn airdrop;
				}
			else
				{
				if ((random 100 < 50) or (_tipoVeh == opHeliDismount)) then
					{
					{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} foreach units _grupoheli;
					_landpos = [];
					_landpos = [_posdestino, 300, 500, 10, 0, 0.3, 0] call BIS_Fnc_findSafePos;
					_landPos set [2, 0];
					_pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
					_vehiculos = _vehiculos + [_pad];
					_wp0 = _grupoheli addWaypoint [_landpos, 0];
					_wp0 setWaypointType "TR UNLOAD";
					_wp0 setWaypointStatements ["true", "(vehicle this) land 'GET OUT';[vehicle this] call smokeCoverAuto"];
					[_grupoheli,0] setWaypointBehaviour "CARELESS";
					_wp3 = _grupo addWaypoint [_landpos, 0];
					_wp3 setWaypointType "GETOUT";
					_wp0 synchronizeWaypoint [_wp3];
					_wp4 = _grupo addWaypoint [_posdestino, 1];
					_wp4 setWaypointType "SAD";
					_wp2 = _grupoheli addWaypoint [_posorigen, 1];
					_wp2 setWaypointType "MOVE";
					_wp2 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew this; deleteVehicle this"];
					[_grupoheli,1] setWaypointBehaviour "AWARE";
					}
				else
					{[_heli,_grupo,_posdestino,_posorigen,_grupoheli] spawn fastropeCSAT;}
				};
			};
		sleep 15;
		};
	};

if (_esMarcador) then
	{
	_solMax = round ((count _soldados)/3);
	_tiempo = time + 3600;

	waitUntil {sleep 5; (({not (captive _x)} count _soldados) < ({captive _x} count _soldados)) or ({alive _x} count _soldados < _solMax) or (_marcador in mrkAAF) or (time > _tiempo)};

	smallCAmrk = smallCAmrk - [_marcador]; publicVariable "smallCAmrk";

	waitUntil {sleep 1; not (spawner getVariable _marcador)};
	}
else
	{
	waitUntil {sleep 1; !([distanciaSPWN,1,_posDestino,"BLUFORSpawn"] call distanceUnits)};
	smallCApos = smallCApos - [_marcador];
	};

{
waitUntil {sleep 1; !([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits)};
deleteVehicle _x;
} forEach _soldados;
{deleteGroup _x} forEach _grupos;
{
if (!([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits)) then {deleteVehicle _x};
} forEach _vehiculos;
