if (!isServer and hasInterface) exitWith{};

private ["_pos","_camion","_camionCreado","_grupo","_grupo1","_mrk"];

_marcador = (_this select 0) select 0;
diag_log format ["Location for truck: %1", _marcador];
_posCamp = getMarkerPos (campsTony select 0);
diag_log format ["Location Tony: %1", getMarkerPos (campsTony select 0)];
_posicion = getMarkerPos _marcador;

_tiempolim = 240;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call localizar;

_tsk = ["REC",[side_blue,civilian],[format ["One of our shipments was confiscated and is currently being held at %1. Go there and steal it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Steal Weapons Shipment",_marcador],_posicion,"CREATED",5,true,true,"rearm"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";
_camionCreado = false;

waitUntil {sleep 1;(dateToNumber date > _fechalimnum) or (spawner getVariable _marcador)};

if (spawner getVariable _marcador) then {
	sleep 10;
	_size = [_marcador] call sizeMarker;
	while {true} do {
		_pos = _posicion findEmptyPosition [10,_size, vehAmmo];
		if (count _pos > 0) exitWith {};
		_size = _size + 20
	};
	_camion = vehAmmo createVehicle _pos;
	_camionCreado = true;
	[_camion] call cajaAAF;

	_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _pos];
	_mrk setMarkerShapeLocal "RECTANGLE";
	_mrk setMarkerSizeLocal [20,20];
	_mrk setMarkerTypeLocal "hd_warning";
	_mrk setMarkerColorLocal "ColorRed";
	_mrk setMarkerBrushLocal "DiagGrid";
	if (!debug) then {_mrk setMarkerAlphaLocal 0};

	_tipogrupo = selectRandom infGarrisonSmall;
	_grupo = [_pos, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
	sleep 1;
	if (random 10 < 33) then {
		_perro = _grupo createUnit ["Fin_random_F",_posicion,[],0,"FORM"];
		[_perro] spawn guardDog;
	};

	_nul = [leader _grupo, _mrk, "SAFE","SPAWNED", "NOVEH2"] execVM "scripts\UPSMON.sqf";

	_grupo1 = [_pos, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
	sleep 1;
	_nul = [leader _grupo1, _mrk, "SAFE","SPAWNED", "NOVEH2"] execVM "scripts\UPSMON.sqf";

	{[_x] spawn genInitBASES} forEach units _grupo;
	{[_x] spawn genInitBASES} forEach units _grupo1;

	waitUntil {sleep 1; (not alive _camion) or (dateToNumber date > _fechalimnum) or ({_x getVariable ["BLUFORSpawn",false]} count crew _camion > 0)};

	if ((dateToNumber date > _fechalimnum) || (not alive _camion)) then {
		_tsk = ["REC",[side_blue,civilian],[format ["One of our shipments was confiscated and is currently being held at %1. Go there and steal it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Steal Weapons Shipment",_marcador],_posicion,"FAILED",5,true,true,"rearm"] call BIS_fnc_setTask;
		[-1200] remoteExec ["timingCA",2];
		[-10,stavros] call playerScoreAdd;
	};
	if (({_x getVariable ["BLUFORSpawn",false]} count crew _camion > 0) && (_camion distance _posCamp < 50)) then {
		_tsk = ["REC",[side_blue,civilian],[format ["One of our shipments was confiscated and is currently being held at %1. Go there and steal it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Steal Weapons Shipment",_marcador],_posicion,"SUCCEEDED",5,true,true,"rearm"] call BIS_fnc_setTask;
		[0,300] remoteExec ["resourcesFIA",2];
		[1200] remoteExec ["timingCA",2];
		{if (_x distance _camion < 500) then {[10,_x] call playerScoreAdd}} forEach (allPlayers - hcArray);
		[5,stavros] call playerScoreAdd;
	};
}
else {
	_tsk = ["REC",[side_blue,civilian],[format ["One of our shipments was confiscated and is currently being held at %1. Go there and steal it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Steal Weapons Shipment",_marcador],_posicion,"FAILED",5,true,true,"rearm"] call BIS_fnc_setTask;
	[-1200] remoteExec ["timingCA",2];
	[-10,stavros] call playerScoreAdd;
};

_nul = [1200,_tsk] spawn borrarTask;
if (_camionCreado) then {
	{deleteVehicle _x} forEach units _grupo;
	deleteGroup _grupo;
	{deleteVehicle _x} forEach units _grupo1;
	deleteGroup _grupo1;
	deleteMarker _mrk;
	waitUntil {sleep 1; not ([300,1,_camion,"BLUFORSpawn"] call distanceUnits)};
	deleteVehicle _camion;
};