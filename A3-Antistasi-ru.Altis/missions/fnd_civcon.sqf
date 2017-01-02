if (!isServer and hasInterface) exitWith{};

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

_posDealer = _posbldg select 0;
_nombredest = [_site] call localizar;

_grpVul = createGroup side_blue;
_grpDealer = createGroup Civilian;
Stranger = _grpDealer createUnit ["C_man_w_worker_F", _posDealer, [], 0, "FORM"];
Stranger setIdentity "Stranger";
Stranger disableAI "move";
Stranger setunitpos "up";

// dialog to indicate the need to be undercover
[[Stranger,"conversation"],"flagaction"] call BIS_fnc_MP;

posStranger = _site;
publicVariable posStranger;

// reset the boolean for active civilian missions
server setVariable ["civActive", false, true];
_civActive = server getVariable "civActive";

_break = false;
_acc = false;
_contact = false;


_posTsk = (position _bldg) getPos [random 50, random 360];

_tsk = ["FND_C",[side_blue,civilian],[format ["A local official reportedly conntected to Brick Top spread the word that he's looking for some muscle. As it happens, the jobs he's offering undermine AAF control in this AO, so it might be worth talking to him. He'll be near %1 until %2:%3. Keep it low key, don't spook the fella.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt politician",_site],_posDealer,"CREATED",5,true,true,"Find"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) || (not alive Stranger) || ({(side _x isEqualTo civilian) && (_x distance Stranger < 500)} count allPlayers > 0)};

{if (isPlayer _x) then {[petros,"hint","Do not alert any enemy patrols!"] remoteExec ["commsMP",_x]}} forEach ([600,0,Stranger,"BLUFORSpawn"] call distanceUnits);

// Stranger leaves once you have gotten a mission from him or the timer ran out
while {(dateToNumber date < _fechalimnum) && (alive Stranger) && (!_civActive)} do {
	scopeName "main";

	if (({(side _x == side_blue) && (_x distance Stranger < 200)} count allPlayers < 1) && ({(side _x isEqualTo civilian) && (_x distance Stranger < 200)} count allPlayers > 0)) then {

		while {({(side _x == side_blue) && (_x distance Stranger < 200)} count allPlayers < 1) && ({(side _x isEqualTo civilian) && (_x distance Stranger < 200)} count allPlayers > 0) && (dateToNumber date < _fechalimnum)} do {
			scopeName "loop1";
			if (!(_acc) && {(side _x isEqualTo civilian) && (_x distance Stranger < 5)} count allPlayers > 0) exitWith {
				_tsk = ["FND_C",[side_blue,civilian],[format ["A local official reportedly conntected to Brick Top spread the word that he's looking for some muscle. As it happens, the jobs he's offering undermine AAF control in this AO, so it might be worth talking to him. He'll be near %1 until %2:%3. Keep it low key, don't spook the fella.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt politician",_site],_posDealer,"ASSIGNED",5,true,true,"Find"] call BIS_fnc_setTask;
				_acc = true;
				_contact = true;

				[[Stranger,"remove"],"flagaction"] call BIS_fnc_MP;
				[[Stranger,"misCiv"],"flagaction"] call BIS_fnc_MP;
			};

			if (({(side _x isEqualTo civilian) && (_x distance Stranger < 20)} count allPlayers < 1) && (_acc)) exitWith {};
		};

	};

	if (({(side _x == side_blue) && (_x distance Stranger < 200)} count allPlayers > 0) || ({(side _x isEqualTo civilian) && (_x distance Stranger < 200)} count allPlayers < 1)) then {
		[[Stranger,"remove"],"flagaction"] call BIS_fnc_MP;
		[[Stranger,"conversation"],"flagaction"] call BIS_fnc_MP;
		_acc = false;
	};
	_civActive = server getVariable "civActive";
	sleep 5;
};


if ((_contact) && (alive Stranger) && (_civActive)) then {
	Stranger enableAI "ANIM";
	Stranger enableAI "MOVE";
	Stranger stop false;
	Stranger doMove getMarkerPos "resource_7";
	_tsk = ["FND_C",[side_blue,civilian],[format ["A local official reportedly conntected to Brick Top spread the word that he's looking for some muscle. As it happens, the jobs he's offering undermine AAF control in this AO, so it might be worth talking to him. He'll be near %1 until %2:%3. Keep it low key, don't spook the fella.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt politician",_site],_posDealer,"SUCCEEDED",5,true,true,"Find"] call BIS_fnc_setTask;
		Stranger allowDamage false;
}
else {
	_tsk = ["FND_C",[side_blue,civilian],[format ["A local official reportedly conntected to Brick Top spread the word that he's looking for some muscle. As it happens, the jobs he's offering undermine AAF control in this AO, so it might be worth talking to him. He'll be near %1 until %2:%3. Keep it low key, don't spook the fella.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Contact the corrupt politician",_site],_posDealer,"FAILED",5,true,true,"Find"] call BIS_fnc_setTask;
	[[Stranger,"remove"],"flagaction"] call BIS_fnc_MP;
	[Stranger] joinSilent grpNull;
	[Stranger] joinSilent _grpVul;
	_break = true;
};

// waitUntil {sleep 10; (dateToNumber date > _fechalimnum) || (not alive Stranger) || (_break)};

server setVariable ["civActive", false, true];

_nul = [1200,_tsk] spawn borrarTask;
sleep 30;
// deleteMarker _mrk;
// waitUntil {sleep 1;(!([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits))};
deleteVehicle Stranger;
deleteGroup _grpDealer;
posStranger = nil;