if (!isServer and hasInterface) exitWith{""};

// mission stub, only for experiments
_sites = ciudades - mrkAAF;
if (count _sites == 0) exitWith{hint "You need the support of at least one city."};

_site = selectRandom _sites;
_position = getMarkerPos _site;

_tiempolim = floor random [30,60,90];;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_range = [_site] call sizeMarker;
_bldgs = nearestObjects [_position, ["house"], _range];
_posbldg = [];
_bldg = _bldgs select 0;
while {count _posbldg < 3} do
	{
	_bldg = _bldgs call BIS_Fnc_selectRandom;
	_posbldg = [_bldg] call BIS_fnc_buildingPositions;
	if (count _posbldg < 3) then {_bldgs = _bldgs - [_bldg]};
	};

_posDealer = selectRandom _posbldg;
_nombredest = [_site] call localizar;

_grpDealer = createGroup side_blue;
_dealer = _grpDealer createUnit ["C_Nikos_aged", _posDealer, [], 0, "FORM"];
_dealer setIdentity "Nomad";
_dealer disableAI "move";
_dealer setunitpos "up";

[[_dealer,"conversation"],"flagaction"] call BIS_fnc_MP;

_posTsk = (position _bldg) getPos [random 20, random 360];

_tsk = ["FND",[side_blue,civilian],[format ["A former associate of Petros' is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the Veteran",_site],_posTsk,"CREATED",5,true,true,"Find"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) || (not alive _dealer) || ({(side _x isEqualTo civilian) && (_x distance _dealer < 500)} count allPlayers > 0)};

{if (isPlayer _x) then {[petros,"hint","Do not alert any enemy patrols!"] remoteExec ["commsMP",_x]}} forEach ([600,0,_dealer,"BLUFORSpawn"] call distanceUnits);


_acc = false;
while {({(side _x == side_blue) && (_x distance _dealer < 500)} count allPlayers < 1) && ({(side _x isEqualTo civilian) && (_x distance _dealer < 500)} count allPlayers > 0) && (dateToNumber date < _fechalimnum)} do {
	if ({(side _x isEqualTo civilian) && (_x distance _dealer < 2)} count allPlayers > 0) then {
		_acc = true;
		_mrkDealer = createMarker [format ["Nomad%1", random 100], _posDealer];
		_mrkDealer setMarkerShape "ICON";
	};

	if (({(side _x isEqualTo civilian) && (_x distance _dealer < 200)} count allPlayers < 1) && (_acc)) exitWith {};
};


diag_log format ["left the loop, acc:%1", _acc];

if ((_acc) && ({(side _x isEqualTo civilian) && (_x distance _dealer < 200)} count allPlayers < 1)) then {
	_tsk = ["FND",[side_blue,civilian],[format ["A former associate of Petros' is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the Veteran",_site],_posDealer,"SUCCEEDED",5,true,true,"Find"] call BIS_fnc_setTask;
}
else {
	_tsk = ["FND",[side_blue,civilian],[format ["A former associate of Petros' is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the Veteran",_site],_posDealer,"FAILED",5,true,true,"Find"] call BIS_fnc_setTask;
};


_nul = [1200,_tsk] spawn borrarTask;
deleteMarker _mrkDealer;
waitUntil {sleep 1;(!([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits))};
deleteVehicle _dealer;
deleteGroup _grpDealer;
