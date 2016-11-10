if (!isServer) exitWith{};

private ["_unit"];

_marcador = _this select 0;

_vehiculos = [];
_grupos = [];
_soldados = [];
_grupo = createGroup side_green;


_posicion = getMarkerPos (_marcador);

_veh = createVehicle ["Land_BagBunker_Tower_F", _posicion, [],0, "NONE"];
_veh setVectorUp (surfacenormal (getPosATL _veh));
//_veh setVectorDirAndUp [[0, 0, 1],[0, 1, 0]];
_vehiculos = _vehiculos + [_veh];
_veh setDir (markerDir _marcador);
_veh = createVehicle [cFlag, _posicion, [],0, "NONE"];
_vehiculos = _vehiculos + [_veh];
_veh = createVehicle ["I_supplyCrate_F", _posicion, [],0, "NONE"];
_vehiculos = _vehiculos + [_veh];
_nul = [_veh] call cajaAAF;
_pos = _posicion findEmptyPosition [5,50,"I_Truck_02_covered_F"];
_veh = createVehicle [selectRandom vehTrucks, _pos, [], 0, "NONE"];
_veh setDir random 360;
_vehiculos = _vehiculos + [_veh];
sleep 1;

_pos = [_posicion] call mortarPos;
_veh = statMortar createVehicle _pos;
_nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";
_unit = _grupo createUnit [infGunner, _posicion, [], 0, "NONE"];
[_unit] spawn genInitBASES;
_unit moveInGunner _veh;
_soldados = _soldados + [_unit];
_vehiculos = _vehiculos + [_veh];
_grupos = _grupos + [_grupo];
sleep 1;

{_nul = [_x] spawn cleanserVeh} forEach _vehiculos;


_tipogrupo = infTeamATAA call BIS_fnc_selectRandom;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","NOFOLLOW","NOVEH2"] execVM "scripts\UPSMON.sqf";
_grupos = _grupos + [_grupo];
{[_x] spawn genInitBASES; _soldados = _soldados + [_x]} forEach units _grupo;


waitUntil {sleep 1; (not (spawner getVariable _marcador))  or ({alive _x} count _soldados == 0) or ({fleeing _x} count _soldados == {alive _x} count _soldados)};

if (({alive _x} count _soldados == 0) or ({fleeing _x} count _soldados == {alive _x} count _soldados)) then
	{
	_nul = [-5,0,_posicion] remoteExec ["citySupportChange",2];
	[["TaskSucceeded", ["", "Outpost Cleansed"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
	_mrk = format ["Dum%1",_marcador];
	deleteMarker _mrk;
	mrkAAF = mrkAAF - [_marcador];
	mrkFIA = mrkFIA + [_marcador];
	publicVariable "mrkAAF";
	publicVariable "mrkFIA";
	//[_marcador] spawn patrolCA;
	[_posicion] remoteExec ["patrolCA",HCattack];
	};

waitUntil {sleep 1; not (spawner getVariable _marcador)};

{if (alive _x) then {deleteVehicle _x}} forEach _soldados;
{deleteGroup _x} forEach _grupos;
{if (!([distanciaSPWN-100,1,_x,"BLUFORSpawn"] call distanceUnits)) then {deleteVehicle _x}} forEach _vehiculos;