if (!isServer) exitWith{};

debugperf = false;

private ["_tiempo","_marcadores","_mrkAAF","_mrkFIA","_marcador","_posicionMRK"];

_tiempo = time;

while {true} do {
//sleep 0.01;
if (time - _tiempo >= 0.5) then {sleep 0.1} else {sleep 0.5 - (time - _tiempo)};
if (debugperf) then {hint format ["Tiempo transcurrido: %1 para %2 marcadores", time - _tiempo, count marcadores]};
_tiempo = time;
_marcadores = marcadores;
_mrkAAF = mrkAAF;
_mrkFIA = mrkFIA;

_puestos = puestos - puestosAA;
_colinas = colinas - colinasAA;

waitUntil {!isNil "stavros"};

_amigos = [];
_enemigos = [];
{
if (_x getVariable ["BLUFORSpawn",false]) then
	{
	_amigos pushBack _x;
	if (isPlayer _x) then
		{
		if (!isNull (getConnectedUAV _x)) then
			{
			_amigos pushBack (getConnectedUAV _x);
			};
		};
	}
else
	{
	if (_x getVariable ["OPFORSpawn",false]) then
		{
		_enemigos pushBack _x;
		};
	}
} forEach allUnits;

{
_marcador = _x;

_posicionMRK = getMarkerPos (_marcador);

if (_marcador in _mrkAAF) then
	{
	//if !(spawner getVariable _marcador) then
	if !(spawner getVariable _marcador) then
		{
		if ((({(_x distance _posicionMRK < distanciaSPWN)} count _amigos > 0) or (_marcador in forcedSpawn))) then {
			//cercanos pushBack _marcador;
			//publicVariable "cercanos";
			spawner setVariable [_marcador,true,true];
			call {
				if (_marcador in _colinas) exitWith {[_marcador] remoteExec ["createWatchpost",HCGarrisons]};
				if (_marcador in colinasAA) exitWith {[_marcador] remoteExec ["createAAsite",HCGarrisons]};
				if (_marcador in ciudades) exitWith {[_marcador] remoteExec ["createCIV",HCciviles]; [_marcador] remoteExec ["createCity",HCGarrisons]};
				if (_marcador in power) exitWith {[_marcador] remoteExec ["createPower",HCGarrisons]};
				if (_marcador in bases) exitWith {[_marcador] remoteExec ["createBase",HCGarrisons]};
				if (_marcador in controles) exitWith {[_marcador] remoteExec ["createRoadblock",HCGarrisons]};
				if (_marcador in aeropuertos) exitWith {[_marcador] remoteExec ["createAirbase",HCGarrisons]};
				if ((_marcador in recursos) or (_marcador in fabricas)) exitWith {[_marcador] remoteExec ["createResources",HCGarrisons]};
				if ((_marcador in _puestos) or (_marcador in puertos)) exitWith {[_marcador] remoteExec ["createOutpost",HCGarrisons]};
				if (_marcador in puestosAA) exitWith {[_marcador] remoteExec ["createOutpostAA",HCGarrisons]};
				};
			};
		}
	else
		{
		if (({_x distance _posicionMRK < distanciaSPWN} count _amigos == 0) and (not(_marcador in forcedSpawn))) then
			{
			//cercanos = cercanos - [_marcador];
			//publicVariable "cercanos";
			spawner setVariable [_marcador,false,true];
			};
		};
	}
else
	{
	if !(spawner getVariable _marcador) then
		{
		if ((({_x distance _posicionMRK < distanciaSPWN} count _enemigos > 0) or ({((_x getVariable ["owner",objNull]) == _x) and (_x distance _posicionMRK < distanciaSPWN)} count _amigos > 0) or (_marcador in forcedSpawn))) then
			{
			spawner setVariable [_marcador,true,true];
			if (_marcador in ciudades) then
				{
				if (({((_x getVariable ["owner",objNull]) == _x) and (_x distance _posicionMRK < distanciaSPWN)} count _amigos > 0) or (_marcador in forcedSpawn)) then {[_marcador] remoteExec ["createCIV",HCciviles]};
				[_marcador] remoteExec ["createCity",HCGarrisons]
				}
			else
				{
				if ((_marcador in recursos) or (_marcador in fabricas)) then {[_marcador] remoteExec ["createFIArecursos",HCGarrisons];} else {
				if ((_marcador in power) or (_marcador == "FIA_HQ")) then {[_marcador] remoteExec ["createFIApower",HCGarrisons];} else {
				if (_marcador in aeropuertos) then {[_marcador] remoteExec ["createNATOaerop",HCGarrisons];} else {
				if (_marcador in bases) then {[_marcador] remoteExec ["createNATObases",HCGarrisons];} else {
				if (_marcador in puestosFIA) then {[_marcador] remoteExec ["createFIApuestos2",HCGarrisons];} else {
				if ((_marcador in puestos) or (_marcador in puertos)) then {[_marcador] remoteExec ["createFIApuestos",HCGarrisons];} else {
				if (_marcador in campsFIA) then {[_marcador] remoteExec ["createCampFIA",HCGarrisons];} else {
				if (_marcador in campsTony) then {[_marcador] remoteExec ["createBlackMarket",HCGarrisons];} else {
				if (_marcador in puestosNATO) then {[_marcador] remoteExec ["createNATOpuesto",HCGarrisons];};
				};
				};};
				};};};};};};
				};
		}
	else
		{
		//if ((({_x distance _posicionMRK < distanciaSPWN} count enemigos == 0) and ({(isPlayer _x) and (_x distance _posicionMRK < distanciaSPWN)} count _amigos == 0)) and (not(_marcador in forcedSpawn)) and (spawner getVariable _marcador)) then
		if ((({_x distance _posicionMRK < distanciaSPWN} count _enemigos == 0) and ({((_x getVariable ["owner",objNull]) == _x) and (_x distance _posicionMRK < distanciaSPWN)} count _amigos == 0)) and (not(_marcador in forcedSpawn))) then
			{
			spawner setVariable [_marcador,false,true];
			};
		};
	};
} forEach _marcadores;

};