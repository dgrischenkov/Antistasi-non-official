if (!isServer and hasInterface) exitWith {};

private ["_prestigio","_marcador","_posicion","_tiempolim","_fechalim","_fechalimnum","_nombredest","_tsk","_soldados","_vehiculos","_grupo","_tipoVeh","_cuenta","_size"];

_prestigio = server getVariable "prestigeNATO";

_marcador = _this select 0;
_posicion = getMarkerPos _marcador;

[-10,0] remoteExec ["prestige",2];

_tiempolim = _prestigio;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call localizar;

_tsk = ["NATOArty",[west,civilian],[format ["We have NATO Artillery support from %1. They will be under our command until %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"NATO Arty",_marcador],_posicion,"CREATED",5,true,true,"target"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

_size = [_marcador] call sizeMarker;
_soldados = [];
_vehiculos = [];
_grupo = createGroup WEST;
_tipoVeh = selectRandom bluStatMortar;
_grupo setVariable ["esNATO",true,true];
_cuenta = 1;
if (_prestigio < 33) then
	{
	_cuenta = 4;
	}
else
	{
	if (_prestigio < 66) then {_tipoVeh = selectRandom bluArty} else {_cuenta = 2; _tipoVeh = selectRandom bluMLRS};
	};
for "_i" from 1 to _cuenta do
	{
	_pos = _posicion findEmptyPosition [1,_size,_tipoVeh];
	_veh = _tipoVeh createVehicle _pos;
	_unit = _grupo createUnit [bluGunner, _posicion, [], 0, "NONE"];
	_unit moveInGunner _veh;
	_soldados = _soldados + [_unit];
	sleep 1;
	_vehiculos = _vehiculos + [_veh];
	[_veh] spawn NATOvehInit;
	};
//artyFIA synchronizeObjectsAdd [leader _grupo];
//(leader _grupo) synchronizeObjectsAdd [artyFIA];
{[_x] spawn NATOinitCA} forEach _soldados;
_grupo setGroupId ["N.Arty"];
Stavros hcSetGroup [_grupo];
//{[_x] spawn unlimitedAmmo} forEach _vehiculos;

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or ({alive _x} count _vehiculos == 0)};

if ({alive _x} count _vehiculos == 0) then
	{
	[-5,0] remoteExec ["prestige",2];

	_tsk = ["NATOArty",[west,civilian],[format ["We have NATO Artillery support from %1. They will be under our command until %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"NATO Arty",_marcador],_posicion,"FAILED",5,true,true,"target"] call BIS_fnc_setTask;
	};

//_nul = [_tsk,true] call BIS_fnc_deleteTask;
_nul = [0,_tsk] spawn borrarTask;

{deleteVehicle _x} forEach _soldados;
{deleteVehicle _x} forEach _vehiculos;
deleteGroup _grupo;