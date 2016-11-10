if (!isServer and hasInterface) exitWith {};

private ["_roads"];

_posicionTel = _this select 0;

_prestigio = server getVariable "prestigeNATO";
_base = bases - mrkAAF + ["spawnNATO"];

_origen = [_base,stavros] call BIS_fnc_nearestPosition;
_orig = getMarkerPos _origen;

[-10,0] remoteExec ["prestige",2];


_tiempolim = 30 max _prestigio;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombreorig = [_origen] call localizar;


_texto = "NATO Roadblock";
_tipogrupo = selectRandom bluATTeam;
_tipoVeh = bluAPC select 0;


_mrk = createMarker [format ["NATOPost%1", random 1000], _posicionTel];
_mrk setMarkerShape "ICON";


_tsk = ["NATORoadblock",[side_blue,civilian],["NATO is dispatching a team to establish a Roadblock. Send and cover the team until reaches its destination.","NATO Roadblock Deployment",_mrk],_posicionTel,"CREATED",5,true,true,"Move"] call BIS_fnc_setTask;
misiones pushBackUnique _tsk; publicVariable "misiones";
_grupo = [_orig, side_blue, (bluCfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
_grupo setGroupId ["Watch"];

_tam = 10;
while {true} do
	{
	_roads = _orig nearRoads _tam;
	if (count _roads < 1) then {_tam = _tam + 10};
	if (count _roads > 0) exitWith {};
	};
_road = _roads select 0;
_pos = position _road findEmptyPosition [1,30,"B_APC_Wheeled_01_cannon_F"];
_camion = _tipoVeh createVehicle _pos;
_grupo addVehicle _camion;

{
	_x assignAsCargo _camion;
	_x moveInCargo _camion;
} forEach units _grupo;

{[_x] call NATOinitCA} forEach units _grupo;
leader _grupo setBehaviour "SAFE";

Stavros hcSetGroup [_grupo];

waitUntil {sleep 1; ({alive _x} count units _grupo == 0) or ({(alive _x) and (_x distance _posicionTel < 10)} count units _grupo > 0) or (dateToNumber date > _fechalimnum)};

if ({(alive _x) and (_x distance _posicionTel < 10)} count units _grupo > 0) then {
	if (isPlayer leader _grupo) then {
		_owner = (leader _grupo) getVariable ["owner",leader _grupo];
		(leader _grupo) remoteExec ["removeAllActions",leader _grupo];
		_owner remoteExec ["selectPlayer",leader _grupo];
		(leader _grupo) setVariable ["owner",_owner,true];
		{[_x] joinsilent group _owner} forEach units group _owner;
		[group _owner, _owner] remoteExec ["selectLeader", _owner];
		"" remoteExec ["hint",_owner];
		waitUntil {!(isPlayer leader _grupo)};
	};

	stavros hcRemoveGroup _grupo;
	{deleteVehicle _x} forEach units _grupo;
	deleteVehicle _camion;
	deleteGroup _grupo;
	sleep 1;

	puestosNATO = puestosNATO + [_mrk]; publicVariable "puestosNATO";
	marcadores = marcadores + [_mrk]; publicVariable "marcadores";
	spawner setVariable [_mrk,false,true];
	_tsk = ["NATORoadblock",[side_blue,civilian],[format ["NATO successfully deployed a roadblock, They will hold their position until %1:%2.",numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"NATO Roadblock Deployment",_mrk],_posicionTel,"SUCCEEDED",5,true,true,"Move"] call BIS_fnc_setTask;

	_mrk setMarkerType "flag_Spain";
	//_mrk setMarkerColor "ColorBlue";
	_mrk setMarkerText _texto;


	waitUntil {sleep 60; (dateToNumber date > _fechalimnum)};

	puestosNATO = puestosNATO - [_mrk]; publicVariable "puestosNATO";
	marcadores = marcadores - [_mrk]; publicVariable "marcadores";
	deleteMarker _mrk;
	sleep 15;
	_nul = [0,_tsk] spawn borrarTask;
}
else {
	_tsk = ["NATORoadblock",[side_blue,civilian],["NATO is dispatching a team to establish an Observation Post or Roadblock. Send and cover the team until reaches it's destination.","NATO Roadblock Deployment",_mrk],_posicionTel,"FAILED",5,true,true,"Move"] call BIS_fnc_setTask;
	sleep 3;
	deleteMarker _mrk;

	stavros hcRemoveGroup _grupo;
	{deleteVehicle _x} forEach units _grupo;
	deleteVehicle _camion;
	deleteGroup _grupo;

	sleep 15;

	_nul = [0,_tsk] spawn borrarTask;
};
