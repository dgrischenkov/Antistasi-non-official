if (!isServer and hasInterface) exitWith{};

private ["_marcador"];

_marcador = _this select 0;
_source = _this select 1;

if (_source == "mil") then {
	server setVariable ["milActive", true, true];
};

_posicion = getMarkerPos _marcador;
_tiempolim = 90;//120
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_marcador] call localizar;

_tsk = ["CON",[side_blue,civilian],[format ["A CSAT %1 is disturbing our operations in the area. Take it out before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Clear the Outpost",_marcador],_posicion,"CREATED",5,true,true,"Target"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1; ((dateToNumber date > _fechalimnum) or (not(_marcador in mrkAAF)))};

if (dateToNumber date > _fechalimnum) then
	{
	_tsk = ["CON",[side_blue,civilian],[format ["A CSAT %1 is disturbing our operations in the area. Take it out before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Clear the Outpost",_marcador],_posicion,"FAILED",5,true,true,"Target"] call BIS_fnc_setTask;
	[5,0,_posicion] remoteExec ["citySupportChange",2];
	[-600] remoteExec ["timingCA",2];
	[-10,stavros] call playerScoreAdd;
	};

if (not(_marcador in mrkAAF)) then
	{
	sleep 10;
	_tsk = ["CON",[side_blue,civilian],[format ["A CSAT %1 is disturbing our operations in the area. Take it out before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Clear the Outpost",_marcador],_posicion,"SUCCEEDED",5,true,true,"Target"] call BIS_fnc_setTask;
	[0,200] remoteExec ["resourcesFIA",2];
	[-5,0,_posicion] remoteExec ["citySupportChange",2];
	[600] remoteExec ["timingCA",2];
	{if (isPlayer _x) then {[10,_x] call playerScoreAdd}} forEach ([500,0,_posicion,"BLUFORSpawn"] call distanceUnits);
	[10,stavros] call playerScoreAdd;
	};

if (_source == "mil") then {
	server setVariable ["milActive", false, true];
};

//sleep (600 + random 1200);

//_nul = [_tsk,true] call BIS_fnc_deleteTask;
_nul = [1200,_tsk] spawn borrarTask;