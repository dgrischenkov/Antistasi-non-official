if (!isServer and hasInterface) exitWith{};

_marcador = _this select 0;
_source = _this select 1;

if (_source == "mil") then {
	server setVariable ["milActive", true, true];
};

_posicion = getMarkerPos _marcador;

_tiempolim = 30;//120
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call localizar;
_tsk = ["AS",[side_blue,civilian],[format ["A CSAT officer is inspecting %1. Go there and kill him before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Officer",_marcador],_posicion,"CREATED",5,true,true,"Kill"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";
_grp = createGroup side_red;

_oficial = _grp createUnit [opI_OFF, _posicion, [], 0, "NONE"];
_piloto = _grp createUnit [opI_PIL, _posicion, [], 0, "NONE"];

_grp selectLeader _oficial;
sleep 1;
_nul = [leader _grp, _marcador, "SAFE", "SPAWNED", "NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";

{_nul = [_x] spawn CSATinit; _x allowFleeing 0} forEach units _grp;

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (not alive _oficial)};

if (not alive _oficial) then
	{
	_tsk = ["AS",[side_blue,civilian],[format ["A CSAT officer is inspecting a %1. Go there and kill him before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Officer",_marcador],_posicion,"SUCCEEDED",5,true,true,"Kill"] call BIS_fnc_setTask;
	//[3,0] remoteExec ["prestige",2];
	[0,300] remoteExec ["resourcesFIA",2];
	//[-5,10,_posicion] remoteExec ["citySupportChange",2];
	[1800] remoteExec ["timingCA",2];
	{if (isPlayer _x) then {[10,_x] call playerScoreAdd}} forEach ([500,0,_posicion,"BLUFORSpawn"] call distanceUnits);
	[5,stavros] call playerScoreAdd;
	[_marcador,30] call addTimeForIdle;
	}
else
	{
	_tsk = ["AS",[side_blue,civilian],[format ["A CSAT officer is inspecting a %1. Go there and kill him before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Officer",_marcador],_posicion,"FAILED",5,true,true,"Kill"] call BIS_fnc_setTask;
	[-600] remoteExec ["timingCA",2];
	[-10,stavros] call playerScoreAdd;
	[_marcador,-30] call addTimeForIdle;
	};

if (_source == "mil") then {
	server setVariable ["milActive", false, true];
};

{deleteVehicle _x} forEach units _grp;
deleteGroup _grp;

//sleep (600 + random 1200);
//_nul = [_tsk,true] call BIS_fnc_deleteTask;
_nul = [1200,_tsk] spawn borrarTask;


