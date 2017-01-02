if (!isServer and hasInterface) exitWith{""};

private ["_mrk"];


_site = _this select 0;

_position = getMarkerPos _site;

_tiempolim = 60;
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

_posDealer = _posbldg select 1;
_nombredest = [_site] call localizar;

_grpVul = createGroup side_blue;
_grpDealer = createGroup Civilian;
Nomad = _grpDealer createUnit ["C_man_hunter_1_F", _posDealer, [], 0, "FORM"];
Nomad removeWeaponGlobal (primaryWeapon Nomad);
Nomad setIdentity "Nomad";
Nomad disableAI "move";
Nomad setunitpos "up";

// dialog to indicate the need to be undercover
[[Nomad,"conversation"],"flagaction"] call BIS_fnc_MP;

posNomad = _site;
publicVariable "posNomad";

// reset the boolean for active military missions
server setVariable ["milActive", false, true];

_break = false;

_posTsk = (position _bldg) getPos [random 50, random 360];

_tsk = ["FND_M",[side_blue,civilian],[format ["A disgruntled AAF officer is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt officer",_site],_posDealer,"CREATED",5,true,true,"Find"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) || (not alive Nomad) || ({(side _x isEqualTo civilian) && (_x distance Nomad < 500)} count allPlayers > 0)};

{if (isPlayer _x) then {[petros,"hint","Do not alert any enemy patrols!"] remoteExec ["commsMP",_x]}} forEach ([600,0,Nomad,"BLUFORSpawn"] call distanceUnits);

_acc = false;
_contact = false;
_milActive = server getVariable "milActive";

// Nomad leaves once you have gotten a mission from him or the timer ran out
while {(dateToNumber date < _fechalimnum) && (alive Nomad) && (!_milActive)} do {
	scopeName "main";

	if (({(side _x == side_blue) && (_x distance Nomad < 200)} count allPlayers < 1) && ({(side _x isEqualTo civilian) && (_x distance Nomad < 200)} count allPlayers > 0)) then {

		while {({(side _x == side_blue) && (_x distance Nomad < 200)} count allPlayers < 1) && ({(side _x isEqualTo civilian) && (_x distance Nomad < 200)} count allPlayers > 0) && (dateToNumber date < _fechalimnum)} do {
			scopeName "loop1";
			if (!(_acc) && {(side _x isEqualTo civilian) && (_x distance Nomad < 5)} count allPlayers > 0) exitWith {
				_tsk = ["FND_M",[side_blue,civilian],[format ["A disgruntled AAF officer is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt officer",_site],_posDealer,"ASSIGNED",5,true,true,"Find"] call BIS_fnc_setTask;
				_acc = true;
				_contact = true;

				[[Nomad,"remove"],"flagaction"] call BIS_fnc_MP;
				[[Nomad,"misMil"],"flagaction"] call BIS_fnc_MP;
			};

			if (({(side _x isEqualTo civilian) && (_x distance Nomad < 20)} count allPlayers < 1) && (_acc)) exitWith {};
		};

	};

	if (({(side _x == side_blue) && (_x distance Nomad < 200)} count allPlayers > 0) || ({(side _x isEqualTo civilian) && (_x distance Nomad < 200)} count allPlayers < 1)) then {
		[[Nomad,"remove"],"flagaction"] call BIS_fnc_MP;
		[[Nomad,"conversation"],"flagaction"] call BIS_fnc_MP;
		_acc = false;
	};
	_milActive = server getVariable "milActive";
	sleep 5;
};


if ((_contact) && (alive Nomad) && (_milActive)) then {
	Nomad enableAI "ANIM";
	Nomad enableAI "MOVE";
	Nomad stop false;
	Nomad doMove getMarkerPos "resource_7";
	_tsk = ["FND_M",[side_blue,civilian],[format ["A disgruntled AAF officer is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt officer",_site],_posDealer,"SUCCEEDED",5,true,true,"Find"] call BIS_fnc_setTask;
	Nomad allowDamage false;
}
else {
	_tsk = ["FND_M",[side_blue,civilian],[format ["A disgruntled AAF officer is trying to leave Altis. His departure is scheduled for %2:%3. If you manage to get to him in time, you might be able to convince him to stay and support our case. Unfortunatly, we are unaware of his current location, but he was spotted near %1. Most likely, he'll have taken shelter in a building...",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt officer",_site],_posDealer,"FAILED",5,true,true,"Find"] call BIS_fnc_setTask;
	[[Nomad,"remove"],"flagaction"] call BIS_fnc_MP;
	[Nomad] joinSilent grpNull;
	[Nomad] joinSilent _grpVul;
	_break = true;
};

// waitUntil {sleep 10; (dateToNumber date > _fechalimnum) || (not alive Nomad) || (_break)};

server setVariable ["milActive", false, true];

_nul = [1200,_tsk] spawn borrarTask;
sleep 30;
// deleteMarker _mrk;
// waitUntil {sleep 1;(!([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits))};
deleteVehicle Nomad;
deleteGroup _grpDealer;
posNomad = nil;