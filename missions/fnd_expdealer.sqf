if (!isServer and hasInterface) exitWith{""};
_site = _this select 0;

private ["_mrk","_posCmp","_p1","_p2","_dirveh"];

server setVariable ["expActive", true, true];

_nombredest = [_site] call localizar;
_posSite = getMarkerPos _site;

_roads = carreteras getVariable _site;
_roads = _roads call BIS_fnc_arrayShuffle;

for [{_i=0},{_i<=count _roads},{_i=_i+1}] do {
	if (((_roads select _i) distance _posSite >150) && ((_roads select _i) distance _posSite <300)) exitWith {_p1 = (_roads select _i);};
};

if (typeName _p1 != "ARRAY") exitWith {diag_log "no road found"};
_road = (_p1 nearRoads 5) select 0;
if (!isNil "_road") then {
	_roadcon = roadsConnectedto (_road);
	_p2 = getPos (_roadcon select 0);
	_dirveh = [_p1,_p2] call BIS_fnc_DirTo;
	_posCmp = [_p1, 5, _dirveh + 90] call BIS_Fnc_relPos;
};

_tiempolim = 60;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

// Devin, as known from JA2 -- bow down to the masters at Sir-Tech!
_grupo = createGroup Civilian;
_devin = _grupo createUnit ["C_Nikos", [0,0,0], [], 100, "FORM"] ;
_devin setPos _posCmp;
_devin setDir ([_posCmp,_p1] call BIS_fnc_DirTo);
_devin removeWeaponGlobal (primaryWeapon _devin);
_devin setIdentity "Devin";
_devin disableAI "move";
_devin setunitpos "up";

0 = [_posCmp, ([_posCmp,_p1] call BIS_fnc_DirTo), call (compile (preprocessFileLineNumbers "Compositions\cmpExp.sqf"))] call BIS_fnc_ObjectsMapper;

{
	if (str typeof _x find "Land_PlasticCase_01_medium_F" > -1) then {expCrate = _x; _nul = [expCrate] call emptyCrate;};
	if (str typeof _x find "Box_Syndicate_Wps_F" > -1) then { _nul = [_x] call emptyCrate;};
	if (str typeof _x find "Box_IED_Exp_F" > -1) then { _nul = [_x] call emptyCrate;};
} forEach nearestObjects [_posCmp, [], 10];

_tsk = ["FND_E",[side_blue,civilian],[format ["Demolitions expert Devin Connell has been spotted near %1. He's scheduled for a flight to Metavira or Arulco at %2:%3, so you better hurry up if you wish to acquire some of his fine products.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the demolition expert",_site],_posCmp,"CREATED",5,true,true,"Find"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) || (not alive _devin) || ({(side _x isEqualTo side_blue) && (_x distance _devin < 200)} count allPlayers > 0)};

{if (isPlayer _x) then {[petros,"hint","Don't ask Devin about the Holy Handgrenade of Antioch. Just don't."] remoteExec ["commsMP",_x]}} forEach ([200,0,_devin,"BLUFORSpawn"] call distanceUnits);

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) || (not alive _devin) || ({(side _x isEqualTo side_blue) && (_x distance _devin < 10)} count allPlayers > 0)};

if ({((side _x isEqualTo side_blue) || (side _x isEqualTo civilian)) && (_x distance _devin < 10)} count allPlayers > 0) then {
	_tsk = ["FND_E",[side_blue,civilian],[format ["Demolitions expert Devin Connell has been spotted near %1. He's scheduled for a flight to Metavira or Arulco at %2:%3, so you better hurry up if you wish to acquire some of his fine products.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the demolition expert",_site],_posCmp,"SUCCEEDED",5,true,true,"Find"] call BIS_fnc_setTask;
	[[_devin,"buy_exp"],"flagaction"] call BIS_fnc_MP;
	_mrk = createMarker [format ["Exp%1", random 1000], _posCmp];
	_mrk setMarkerShape "ICON";
	_mrk setMarkerType "flag_Croatia";

	line1 = ["Devin", "Top of the day to ya. Haven't made yer acquaintance."];
    [[line1],"DIRECT",0.15] execVM "createConv.sqf";
}
else {
	_tsk = ["FND_E",[side_blue,civilian],[format ["Demolitions expert Devin Connell has been spotted near %1. He's scheduled for a flight to Metavira or Arulco at %2:%3, so you better hurry up if you wish to acquire some of his fine products.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Find the demolition expert",_site],_posCmp,"FAILED",5,true,true,"Find"] call BIS_fnc_setTask;
};

waitUntil {sleep 10; (dateToNumber date > _fechalimnum) || !(alive _devin)};

diag_log format ["Devin's alive? %1", (alive _devin)];

if (alive _devin) then {
	_devin enableAI "ANIM";
	_devin enableAI "MOVE";
	_devin stop false;
	_devin doMove getMarkerPos "resource_7";
}
else {
	[[_devin,"remove"],"flagaction"] call BIS_fnc_MP;
};

server setVariable ["expActive", false, true];

_nul = [1200,_tsk] spawn borrarTask;
sleep 30;
if !(isNil _mrk) then {deleteMarker _mrk};
deleteVehicle _devin;
deleteGroup _grupo;
[_posCmp, "exp"] remoteExec ["despawnCamp"];