if (!isServer) exitWith{};

private ["_unit","_AAVeh","_truck","_crate"];

_marcador = _this select 0;

_vehiculos = [];
_grupos = [];
_soldados = [];
_grupo = createGroup side_green;
_grupoCSAT = createGroup side_green;
//_grupoCSAT = createGroup side_red;
_av = false;
_stcs = [];
_gns = [];
_veh = "";

_posicion = getMarkerPos (_marcador);


_cmpInfo = [_marcador] call cmpMTN;
_posCmp = _cmpInfo select 0;
_cmp = _cmpInfo select 1;

0 = [_posCmp, 0, _cmp] call BIS_fnc_ObjectsMapper;

if (hayRHS) then {_veh = vehSPAA} else {_veh = opSPAA};

{
	if (str typeof _x find _veh > -1) then {_AAVeh = _x; _vehiculos = _vehiculos + [_x]; _av = true;};
	//if (str typeof _x find vehSPAA > -1) then {_AAVeh = _x; _vehiculos = _vehiculos + [_x]; _av = true;};
	if (str typeof _x find opTruck > -1) then {_truck = _x; _vehiculos = _vehiculos + [_x];};
	if (str typeof _x find statMG > -1
	    or str typeof _x find statAT > -1
	    or str typeof _x find statAA > -1
	    or str typeof _x find statAA2 > -1
	    or str typeof _x find statMGlow > -1
	    or str typeof _x find statMGtower > -1) then {_stcs pushBack _x;};
	if (str typeof _x find statMortar > -1) then {_stcs pushBack _x; _nul = [_x] execVM "scripts\UPSMON\MON_artillery_add.sqf";};
	if (str typeof _x find "Box_East_WpsLaunch_F" > -1) then {_crate = _x; _vehiculos = _vehiculos + [_x];};
	if (str typeof _x find opFlag > -1) then {_vehiculos = _vehiculos + [_x];};
	} forEach nearestObjects [_posCmp, [], 80];

if (_av) then {
	_unit = _grupoCSAT createUnit [opI_CREW, _posicion, [], 0, "NONE"];
	_unit moveInGunner _AAVeh;
	_unit = _grupoCSAT createUnit [opI_CREW, _posicion, [], 0, "NONE"];
	_unit moveInCommander _AAVeh;
	_AAVeh lock 2;
};

{
	_vehiculos = _vehiculos + [_x];
	_unit = _grupoCSAT createUnit [opI_CREW, _posicion, [], 0, "NONE"];
	_unit moveInGunner _x;
	_gns pushBack _unit;
	if (str typeof _x find statAA > -1) then {
		_unit = _grupoCSAT createUnit [opI_CREW, _posicion, [], 0, "NONE"];
		_unit moveInCommander _x;
		_gns pushBack _unit;
	};
} forEach _stcs;

_mrkfin = createMarkerLocal [format ["specops%1", random 100],_posCmp];
_mrkfin setMarkerShapeLocal "RECTANGLE";
_mrkfin setMarkerSizeLocal [500,500];
_mrkfin setMarkerTypeLocal "hd_warning";
_mrkfin setMarkerColorLocal "ColorRed";
_mrkfin setMarkerBrushLocal "DiagGrid";

_nul = [leader _grupoCSAT, _mrkfin, "AWARE", "SPAWNED","NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";

_uav = createVehicle [opUAVsmall, _posCmp, [], 0, "FLY"];
createVehicleCrew _uav;

_grupoUAV = group (crew _uav select 1);
_nul = [leader _grupoUAV, _mrkfin, "SAFE", "SPAWNED","NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";

{_nul = [_x] spawn genVEHinit} forEach _vehiculos;

{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupoCSAT;
_grupos = _grupos + [_grupoCSAT];

_tipogrupo = infTeamATAA call BIS_fnc_selectRandom;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","NOFOLLOW","NOVEH2"] execVM "scripts\UPSMON.sqf";
_grupos = _grupos + [_grupo];
{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;

_tipogrupo = infAA call BIS_fnc_selectRandom;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","NOFOLLOW","NOVEH2"] execVM "scripts\UPSMON.sqf";
_grupos = _grupos + [_grupo];
{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;

_tipogrupo = infTeam call BIS_fnc_selectRandom;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","NOFOLLOW","NOVEH2"] execVM "scripts\UPSMON.sqf";
_grupos = _grupos + [_grupo];
{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;

_maxSol = count _soldados;


if (_av) then {
	//waitUntil {sleep 1; (not (spawner getVariable _marcador)) or ((({alive _x} count _soldados < (_maxSol / 3)) or ({fleeing _x} count _soldados == {alive _x} count _soldados)) && (not alive _AAVeh))};
	waitUntil {sleep 1; (not (spawner getVariable _marcador)) or ((({alive _x} count _soldados < (_maxSol / 3)) || ({fleeing _x} count _soldados == {alive _x} count _soldados)) && (not alive _AAVeh) && ({alive _x} count _gns == 0))};


	if ((({alive _x} count _soldados < (_maxSol / 3)) or ({fleeing _x} count _soldados == {alive _x} count _soldados)) && (not alive _AAVeh) && ({alive _x} count _gns == 0)) then {
		_nul = [-5,0,_posicion] remoteExec ["citySupportChange",2];
		_nul = [0,-20] remoteExec ["prestige",2];
		[["TaskSucceeded", ["", "Outpost Cleansed"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		_mrk = format ["Dum%1",_marcador];
		deleteMarker _mrk;
		mrkAAF = mrkAAF - [_marcador];
		mrkFIA = mrkFIA + [_marcador];
		publicVariable "mrkAAF";
		publicVariable "mrkFIA";
		[_posicion] remoteExec ["patrolCA",HCattack];
	};
}
else {
	//waitUntil {sleep 1; (not (spawner getVariable _marcador))  or ({alive _x} count _soldados < (_maxSol / 3)) or ({fleeing _x} count _soldados == {alive _x} count _soldados)};
	waitUntil {sleep 1; (not (spawner getVariable _marcador)) or ((({alive _x} count _soldados < (_maxSol / 3)) || ({fleeing _x} count _soldados == {alive _x} count _soldados)) && ({alive _x} count _gns == 0))};

	if (({alive _x} count _soldados < (_maxSol / 3)) or ({fleeing _x} count _soldados == {alive _x} count _soldados)) then {
		_nul = [-5,0,_posicion] remoteExec ["citySupportChange",2];
		_nul = [0,-10] remoteExec ["prestige",2];
		[["TaskSucceeded", ["", "Outpost Cleansed"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		_mrk = format ["Dum%1",_marcador];
		deleteMarker _mrk;
		mrkAAF = mrkAAF - [_marcador];
		mrkFIA = mrkFIA + [_marcador];
		publicVariable "mrkAAF";
		publicVariable "mrkFIA";
		[_posicion] remoteExec ["patrolCA",HCattack];
	};
};

waitUntil {sleep 1; not (spawner getVariable _marcador)};

{if (alive _x) then {deleteVehicle _x}} forEach _soldados;
{deleteGroup _x} forEach _grupos;
{deleteVehicle _x} forEach units _grupoUAV;
deleteVehicle _uav;
deleteGroup _grupoUAV;
{if (!([distanciaSPWN-100,1,_x,"BLUFORSpawn"] call distanceUnits)) then {deleteVehicle _x}} forEach _vehiculos;

[_posCmp, "cmpMTN"] remoteExec ["clean_cmp"];