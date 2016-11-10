if (!isServer and hasInterface) exitWith{};

_posicion = _this select 0;
_NATOSupp = _this select 1;

private ["_crate","_chute","_humo"];

_mrkfin = createMarker ["AmmoSupp", _posicion];
_mrkfin setMarkerShape "ICON";
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + 60];
_fechalimnum = dateToNumber _fechalim;

_tsk = ["NATOAmmo",[side_blue,civilian],["Our Commander asked NATO for an ammunition supply drop. Command the transport with your HC module and bring it to the designated position. Go there and pick those weapons.","NATO Ammodrop",_mrkfin],_posicion,"CREATED",5,true,true,"rifle"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";
[-5,0] remoteExec ["prestige",2];

_aeropuertos = aeropuertos - mrkAAF + ["spawnNATO"];

_origen = [_aeropuertos,_posicion] call BIS_fnc_nearestPosition;
_orig = getMarkerPos _origen;
_vehiculos = [];

_helifn = [_orig, 0, selectRandom bluHeliDis, side_blue] call bis_fnc_spawnvehicle;
_heli = _helifn select 0;
_heliCrew = _helifn select 1;
_grupoHeli = _helifn select 2;
{[_x] spawn NATOinitCA} forEach _heliCrew;
[_heli] spawn NATOVEHinit;
_vehiculos = _vehiculos + [_heli];
_heli setPosATL [getPosATL _heli select 0, getPosATL _heli select 1, 1000];
_heli disableAI "TARGET";
_heli disableAI "AUTOTARGET";
_heli flyInHeight 200;
_grupoHeli setCombatMode "BLUE";

//_nul = [_heli,"NATO Air Transport"] spawn inmuneConvoy;
/*
_wp1 = group _heli addWaypoint [_posicion, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";

_wp3 = group _heli addWaypoint [_orig, 1];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";
//_wp3 setWaypointStatements ["true", "{deleteVehicle _x} forEach crew this; deleteVehicle this"];
*/
Stavros hcSetGroup [_grupoHeli];

waitUntil {sleep 2; (_heli distance _posicion < 300) or (!canMove _heli) or (dateToNumber date > _fechalimnum)};

stavros hcRemoveGroup _grupoHeli;

if (_heli distance _posicion < 300) then
	{
	_chute = createVehicle ["B_Parachute_02_F", [100, 100, 200], [], 0, 'FLY'];
    _chute setPos [getPosASL _heli select 0, getPosASL _heli select 1, (getPosASL _heli select 2) - 50];
    _crate = createVehicle ["B_supplyCrate_F", position _chute, [], 0, 'NONE'];
    _crate attachTo [_chute, [0, 0, -1.3]];
    _nul = [_crate,_NATOSupp] call NATOCrate;
     _vehiculos = _vehiculos + [_chute,_crate];
    _wp3 = _grupoHeli addWaypoint [_orig, 0];
	_wp3 setWaypointType "MOVE";
	_wp3 setWaypointSpeed "FULL";
    waitUntil {position _crate select 2 < 0.5 || isNull _chute};

    _tsk = ["NATOAmmo",[side_blue,civilian],["Our Commander asked NATO for an ammunition supply drop. Command the transport with your HC module and bring it to the designated position.Go there and pick those weapons.","NATO Ammodrop",_mrkfin],_posicion,"SUCCEEDED",5,true,true,"rifle"] call BIS_fnc_setTask;
	_humo = "SmokeShellYellow" createVehicle position _crate;
	_vehiculos = _vehiculos + [_humo];
	}
else
	{
	_tsk = ["NATOAmmo",[side_blue,civilian],["Our Commander asked NATO for an ammunition supply drop. Command the transport with your HC module and bring it to the designated position.Go there and pick those weapons.","NATO Ammodrop",_mrkfin],_posicion,"FAILED",5,true,true,"rifle"] call BIS_fnc_setTask;
	};

sleep 15;

deleteMarker _mrkFin;

//_nul = [_tsk,true] call BIS_fnc_deleteTask;
_nul = [0,_tsk] spawn borrarTask;
{
_soldado = _x;
waitUntil {sleep 1; {_x distance _soldado < distanciaSPWN} count (allPlayers - hcArray) == 0};
deleteVehicle _soldado;
} forEach _heliCrew;
deleteGroup _grupoHeli;
{_vehiculo = _x;
waitUntil {sleep 1; {_x distance _vehiculo < distanciaSPWN} count (allPlayers - hcArray) == 0};
deleteVehicle _vehiculo;
} forEach _vehiculos;
