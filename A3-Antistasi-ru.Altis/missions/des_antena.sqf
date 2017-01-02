if (!isServer and hasInterface) exitWith{};

private ["_antena","_posicion","_tiempolim","_marcador","_nombredest","_mrkfin","_tsk"];

_antena = _this select 0;
_posicion = getPos _antena;

_tiempolim = 120;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;
_marcador = [marcadores,_posicion] call BIS_fnc_nearestPosition;
_nombredest = [_marcador] call localizar;

_mrkfin = createMarker [format ["DES%1", random 100], _posicion];
_mrkfin setMarkerShape "ICON";
//_mrkfin setMarkerType "hd_destroy";
//_mrkfin setMarkerColor "ColorRed";
//_mrkfin setMarkerText "Destroy Radio Tower";

_tsk = ["DES",[side_blue,civilian],[format ["We need to destroy or take a Radio Tower in %1. This will interrupt AAF Communications Nework. Do it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Destroy Radio Tower",_mrkfin],_posicion,"CREATED",5,true,true,"Destroy"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1;(dateToNumber date > _fechalimnum) or (not alive _antena) or (not(_marcador in mrkAAF))};

if (dateToNumber date > _fechalimnum) then
	{
	_tsk = ["DES",[side_blue,civilian],[format ["We need to destroy or take a Radio Tower in %1. This will interrupt AAF Communications Nework. Do it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Destroy Radio Tower",_mrkfin],_posicion,"FAILED",5,true,true,"Destroy"] call BIS_fnc_setTask;
	//[5,0,_posicion] remoteExec ["citySupportChange",2];
	[-10,stavros] call playerScoreAdd;
	};
if ((not alive _antena) or (not(_marcador in mrkAAF))) then
	{
	sleep 15;
	_tsk = ["DES",[side_blue,civilian],[format ["We need to destroy or take a Radio Tower in %1. This will interrupt AAF Communications Nework. Do it before %2:%3.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Destroy Radio Tower",_mrkfin],_posicion,"SUCCEEDED",5,true,true,"Destroy"] call BIS_fnc_setTask;
	//[-5,0,_posicion] remoteExec ["citySupportChange",2];
	[5,-5] remoteExec ["prestige",2];
	[600] remoteExec ["timingCA",2];
	{if (_x distance _posicion < 500) then {[10,_x] call playerScoreAdd}} forEach (allPlayers - hcArray);
	[5,stavros] call playerScoreAdd;
	};

deleteMarker _mrkfin;

_nul = [1200,_tsk] spawn borrarTask;
