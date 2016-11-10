if (!isServer and hasInterface) exitWith {};
private ["_pos","_timeOut","_posbase","_posdestino","_soldados","_grupos","_vehiculos","_POWS","_tiempofin","_fechafin","_fechafinNum","_veh","_unit","_hvt"];
_destino = _this select 0;
_base = _this select 1;
_source = _this select 2;

if (count _this < 3) then {_source = "auto"};

_posbase = getMarkerPos _base;
_posdestino = getMarkerPos _destino;

_soldados = [];
_grupos = [];
_vehiculos = [];
_POWS = [];

_tipoVehEsc = "";
_tipoVehObj = "";
_tipogrupo = "";
_tiposConvoy = [];
_posHQ = getMarkerPos "respawn_west";

_tiempofin = 120;
_fechafin = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempofin];
_fechafinNum = dateToNumber _fechafin;

private ["_tsk","_grpPOW","_pos"];

if ((_destino in bases) or (_destino in aeropuertos)) then {_tiposConvoy = ["Municion","Armor","Prisoners","HVT"];};
if (_destino in ciudades) then
	{
	if (_destino in mrkAAF) then {_tiposConvoy = ["Money","Supplies","HVT"]} else {_tiposConvoy = ["Supplies"]}
	};

if (_source == "civ") then {
	if (_destino in bases) then {
		_tiposConvoy = ["Prisoners","HVT"];
	}
	else {
		_tiposConvoy = ["Money","Supplies"];
	};

	server setVariable ["civActive", true, true];
};
if (_source == "mil") then {_tiposConvoy = ["Municion","Armor","HVT"]; server setVariable ["milActive", true, true];};


_tipoConvoy = _tiposConvoy call BIS_Fnc_selectRandom;


//_tiempolim = round random 15;// tiempo para que salga el convoy, deberíamos poner un round random 15

// add a delay, depending on the number of places you control
_tiempolim = (round (5 - (count mrkFIA)/10)) + (round random 10);

_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_nombredest = [_destino] call localizar;
_nombreOrig = [_base] call localizar;
[_base,30] call addTimeForIdle;
if (_tipoConvoy == "Municion") then
	{
	_tsk = ["CONVOY",[side_blue,civilian],[format ["A convoy from %1 is about to depart at %2:%3. It will provide ammunition to %4. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Ammo Convoy",_destino],_posdestino,"CREATED",5,true,true,"rearm"] call BIS_fnc_setTask;
	_tipoVehObj = vehAmmo;
	};

if (_tipoConvoy == "Armor") then
	{
	_tsk = ["CONVOY",[side_blue,civilian],[format ["A convoy from %1 is about to depart at %2:%3. It will reinforce %4 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Armored Convoy",_destino],_posdestino,"CREATED",5,true,true,"Destroy"] call BIS_fnc_setTask;
	_armor = "";
	{if (_x in vehTank) exitWith {_armor = _x};} forEach vehAAFAT;
	if (_armor != "") then {_tipoVehObj = selectRandom vehTank;} else { _tipoVehObj = selectRandom vehIFV;};
	};

if (_tipoConvoy == "Prisoners") then
	{
	_tsk = ["CONVOY",[side_blue,civilian],[format ["A group os POW's is being transported from %1 to %4, and it's about to depart at %2:%3. They are awaiting for execution. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Prisoner Convoy",_destino],_posdestino,"CREATED",5,true,true,"run"] call BIS_fnc_setTask;
	_tipoVehObj = enemyMotorpoolDef;
	};

if (_tipoConvoy == "Money") then
	{
	_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck plenty of money is being moved from %1 to %4, and it's about to depart at %2:%3. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Money Convoy",_destino],_posdestino,"CREATED",5,true,true,"move"] call BIS_fnc_setTask;
	_tipoVehObj = "C_Van_01_box_F";
	};

if (_tipoConvoy == "Supplies") then
	{
	_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck with medical supplies destination %4 it's about to depart at %2:%3 from %1. Steal that truck bring it to %4 and let people in there know it is FIA who's giving those supplies.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Supply Convoy",_destino],_posdestino,"CREATED",5,true,true,"heal"] call BIS_fnc_setTask;
	_tipoVehObj = "C_Van_01_box_F";
	};

if (_tipoConvoy == "HVT") then {
	_tsk = ["CONVOY",[side_blue,civilian],[format ["A high-value target will travel from %1 to %4. His departure is scheduled for %2:%3. Seize the opportunity and take him out!",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF HVT Convoy",_destino],_posdestino,"CREATED",5,true,true,"Destroy"] call BIS_fnc_setTask;
	_tipoVehObj = selectRandom standardMRAP;
};

misiones pushBack _tsk; publicVariable "misiones";

sleep (_tiempolim * 60);

_tam = 10;
_roads = [];

while {true} do
	{
	_roads = _posbase nearRoads _tam;
	if (count _roads > 0) exitWith {};
	_tam = _tam + 10;
	};

_road = _roads select 0;

_grupo = createGroup side_green;
_grupos = _grupos + [_grupo];

_vehicle=[position _road, 0,selectRandom vehLead, _grupo] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
[_veh] spawn genVEHinit;
[_veh,"AAF Convoy Lead"] spawn inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] spawn genInit} forEach _vehCrew;
_grupoVeh = _vehicle select 2;
_soldados = _soldados + _vehCrew;
_grupos = _grupos + [_grupoVeh];
_vehiculos = _vehiculos + [_veh];

_wp0 = _grupo addWaypoint [_posdestino, 0];
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_wp0 setWaypointSpeed "LIMITED";
_wp0 setWaypointFormation "COLUMN";

_cuenta = 1;
if ([_destino] call isFrontline) then {_cuenta = (round random 2) + 1};

//experimental
_pV = 0;

_tempMP = [];
if (hayRHS) then {
	for "_j" from 1 to 4 do {
		if (count (vehAAFAT - vehIFV) < count vehAAFAT) then {_tempMP pushBack selectRandom (vehIFV)};
	};
}
else {
	_tempMP = vehIFV;
};

_vehAAFAT = vehAAFAT;
if (count (_vehAAFAT - vehIFV) < count _vehAAFAT) then {_vehAAFAT = _vehAAFAT - vehIFV; _vehAAFAT = _vehAAFAT + _tempMP};

if (_tipoConvoy == "HVT") then {
	_pv = round random 1;
	_timeOut = 0;
	_pos = (position _road) findEmptyPosition [0,100,_tipovehObj];
	while {_timeOut < 60} do
		{
		if (count _pos > 0) exitWith {};
		_timeOut = _timeOut + 1;
		_pos = (position _road) findEmptyPosition [0,100,_tipovehObj];
		sleep 1;
		};
	if (count _pos == 0) then {_pos = position _road};
	_vehicle=[_pos, 0,_tipoVehObj, _grupo] call bis_fnc_spawnvehicle;
	_vehObj2 = _vehicle select 0;
	[_vehObj2] spawn genVEHinit;
	[_vehObj2,"AAF Convoy Objective"] spawn inmuneConvoy;
	_vehCrew = _vehicle select 1;
	_hvtGroup = createGroup side_green;
	if (_pv == 1) then {
		_hvt = _hvtGroup createUnit [sol_OFF, _posbase, [],0, "NONE"];
		[_hvt] spawn genInit;
		_hvt assignAsCargo _vehObj2;
		_hvt moveInCargo _vehObj2;
		_grupos = _grupos + [_hvtGroup];
		_soldados pushBack _hvt;
	};
	{[_x] spawn genInit} forEach _vehCrew;
	_grupoVeh = _vehicle select 2;
	_soldados = _soldados + _vehCrew;
	_grupos = _grupos + [_grupoVeh];
	_vehiculos = _vehiculos + [_vehObj2];
}
else {
	for "_i" from 1 to _cuenta do {
		sleep 15;
		if (count _vehAAFAT > 1) then
			{
			_vehAAFAT = _vehAAFAT - [enemyMotorpoolDef];
			_tipoVehEsc = _vehAAFAT call BIS_fnc_selectRandom;
			}
		else
			{
			_tipoVehEsc = enemyMotorpoolDef;
			};

		_b = bases + aeropuertos;
		_c = mrkFIA arrayIntersect _b;
		_t = _vehAAFAT arrayIntersect vehTank;
		if ((count _c > 2) && (count _t > 0) && (_i == _cuenta)) then {_tipoVehEsc = selectRandom vehTank};

		_timeOut = 0;
		_pos = (position _road) findEmptyPosition [0,100,_tipovehEsc];
		while {_timeOut < 60} do
			{
			if (count _pos > 0) exitWith {};
			_timeOut = _timeOut + 1;
			_pos = (position _road) findEmptyPosition [0,100,_tipovehEsc];
			sleep 1;
			};
		if (count _pos == 0) then {_pos = position _road};
		_vehicle=[_pos, 0,_tipoVehEsc, _grupo] call bis_fnc_spawnvehicle;
		_veh = _vehicle select 0;
		[_veh] spawn genVEHinit;
		[_veh,"AAF Convoy Escort"] spawn inmuneConvoy;
		_vehCrew = _vehicle select 1;
		{[_x] spawn genInit} forEach _vehCrew;
		_grupoVeh = _vehicle select 2;
		_soldados = _soldados + _vehCrew;
		_grupos = _grupos + [_grupoVeh];
		_vehiculos = _vehiculos + [_veh];

		if !(_tipoVehEsc in vehTank) then
			{
			if (_tipoVehEsc in vehIFV) then {_tipogrupo = infTeam call BIS_fnc_selectRandom} else {_tipogrupo = infSquad call BIS_fnc_selectRandom};
			_grupoEsc = [_posbase, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
			{[_x] spawn genInit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados = _soldados + [_x];[_x] join _grupo} forEach units _grupoEsc;
			deleteGroup _grupoEsc;
			if (_tipoVehEsc != enemyMotorpoolDef) then
				{
				[_veh] spawn smokeCover;
				};
			};
	};
};
//experimental

sleep 15;

_timeOut = 0;
_pos = (position _road) findEmptyPosition [0,100,_tipovehObj];
while {_timeOut < 60} do
	{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = (position _road) findEmptyPosition [0,100,_tipovehObj];
	sleep 1;
	};
if (count _pos == 0) then {_pos = position _road};
_vehicle=[_pos, 0,_tipoVehObj, _grupo] call bis_fnc_spawnvehicle;
_vehObj = _vehicle select 0;
[_vehObj] spawn genVEHinit;
[_vehObj,"AAF Convoy Objective"] spawn inmuneConvoy;
_vehCrew = _vehicle select 1;
_hvtGroup = createGroup side_green;
if (_pv == 0) then {
	_hvt = _hvtGroup createUnit [sol_OFF, _posbase, [],0, "NONE"];
	[_hvt] spawn genInit;
	_hvt assignAsCargo _vehObj;
	_hvt moveInCargo _vehObj;
	_grupos = _grupos + [_hvtGroup];
	_soldados pushBack _hvt;
};
{[_x] spawn genInit} forEach _vehCrew;
_grupoVeh = _vehicle select 2;
_soldados = _soldados + _vehCrew;
_grupos = _grupos + [_grupoVeh];
_vehiculos = _vehiculos + [_vehObj];

if (_tipoConvoy == "Armor") then {_vehObj lock 3};
if (_tipoConvoy == "Prisoners") then
	{
	_grpPOW = createGroup side_blue;
	_grupos = _grupos + [_grpPOW];
	for "_i" from 1 to (1+ round (random 11)) do
		{
		_unit = _grpPOW createUnit ["b_g_survivor_F", _posbase, [], 0, "NONE"];
		_unit setCaptive true;
		_unit disableAI "MOVE";
		_unit setBehaviour "CARELESS";
		_unit allowFleeing 0;
		_unit assignAsCargo _vehObj;
		_unit moveInCargo [_vehObj, _i + 3];
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		[[_unit,"refugiado"],"flagaction"] call BIS_fnc_MP;
		sleep 1;
		_POWS = _POWS + [_unit];
		};
	};
if ((_tipoConvoy == "Money") or (_tipoConvoy == "Supplies")) then {reportedVehs pushBack _vehObj; publicVariable "reportedVehs"};

sleep 15;

if (count vehAAFAT > 1) then
	{
	_vehAAFAT = vehAAFAT - [enemyMotorpoolDef];
	_tipoVehEsc = _vehAAFAT call BIS_fnc_selectRandom;
	}
else
	{
	_tipoVehEsc = enemyMotorpoolDef;
	};

_timeOut = 0;
_pos = (position _road) findEmptyPosition [0,100,_tipovehEsc];
while {_timeOut < 60} do
	{
	if (count _pos > 0) exitWith {};
	_timeOut = _timeOut + 1;
	_pos = (position _road) findEmptyPosition [0,100,_tipovehEsc];
	sleep 1;
	};
if (count _pos == 0) then {_pos = position _road};
_vehicle=[_pos, 0,_tipoVehEsc, _grupo] call bis_fnc_spawnvehicle;
_veh = _vehicle select 0;
[_veh] spawn genVEHinit;
[_veh,"AAF Convoy Escort"] spawn inmuneConvoy;
_vehCrew = _vehicle select 1;
{[_x] spawn genInit} forEach _vehCrew;
_grupoVeh = _vehicle select 2;
_soldados = _soldados + _vehCrew;
_grupos = _grupos + [_grupoVeh];
_vehiculos = _vehiculos + [_veh];

if !(_tipoVehEsc in vehTank) then
	{
	if (_tipoVehEsc in vehIFV) then {_tipogrupo = infTeam call BIS_fnc_selectRandom} else {_tipogrupo = infSquad call BIS_fnc_selectRandom};
	_grupoEsc = [_posbase, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
	{[_x] spawn genInit;_x assignAsCargo _veh;_x moveInCargo _veh; _soldados = _soldados + [_x];[_x] join _grupo} forEach units _grupoEsc;
	deleteGroup _grupoEsc;
	if (_tipoVehEsc != enemyMotorpoolDef) then
		{
		[_veh] spawn smokeCover;
		};
	};

//experimental
if (_tipoConvoy == "HVT") then {
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_hvt distance _posdestino < 100) or (not alive _hvt)};
	if ((_hvt distance _posdestino < 100) or (dateToNumber date > _fechafinNum)) then
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A high-value target will travel from %1 to %4. His departure is scheduled for %2:%3. Seize the opportunity and take him out!",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF HVT Convoy",_destino],_posdestino,"FAILED",5,true,true,"Destroy"] call BIS_fnc_setTask;
		[-1200] remoteExec ["timingCA",2];
		[-10,stavros] call playerScoreAdd;
		}
	else
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A high-value target will travel from %1 to %4. His departure is scheduled for %2:%3. Seize the opportunity and take him out!",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF HVT Convoy",_destino],_posdestino,"SUCCEEDED",5,true,true,"Destroy"] call BIS_fnc_setTask;
		[10,0] remoteExec ["prestige",2];
		[0,5,_posdestino] remoteExec ["citySupportChange",2];
		[1800] remoteExec ["timingCA",2];
		{if (isPlayer _x) then {[10,_x] call playerScoreAdd}} forEach ([500,0,_hvt,"BLUFORSpawn"] call distanceUnits);
		[5,stavros] call playerScoreAdd;
		[position _hvt] spawn patrolCA;
		};
};


if (_tipoConvoy == "Municion") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive _vehObj) or (driver _vehObj getVariable ["BLUFORSpawn",false])};
	if ((_vehObj distance _posdestino < 100) or (dateToNumber date >_fechafinNum)) then
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A convoy from %1 is about to depart at %2:%3. It will provide ammunition to %4. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Ammo Convoy",_destino],_posdestino,"FAILED",5,true,true,"rearm"] call BIS_fnc_setTask;
		[-1200] remoteExec ["timingCA",2];
		[-10,stavros] call playerScoreAdd;
		clearMagazineCargoGlobal _vehObj;
		clearWeaponCargoGlobal _vehObj;
		clearItemCargoGlobal _vehObj;
		clearBackpackCargoGlobal _vehObj;
		}
	else
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A convoy from %1 is about to depart at %2:%3. It will provide ammunition to %4. Try to intercept it. Steal or destroy that truck before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Ammo Convoy",_destino],_posdestino,"SUCCEEDED",5,true,true,"rearm"] call BIS_fnc_setTask;
		[0,300] remoteExec ["resourcesFIA",2];
		[1800] remoteExec ["timingCA",2];
		{if (isPlayer _x) then {[10,_x] call playerScoreAdd}} forEach ([500,0,_vehObj,"BLUFORSpawn"] call distanceUnits);
		[5,stavros] call playerScoreAdd;
		[position _vehObj] spawn patrolCA;
		};
	};

if (_tipoConvoy == "Armor") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive _vehObj) or (driver _vehObj getVariable ["BLUFORSpawn",false])};
	if ((_vehObj distance _posdestino < 100) or (dateToNumber date > _fechafinNum)) then
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A convoy from %1 is about to depart at %2:%3. It will reinforce %4 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Armored Convoy",_destino],_posdestino,"FAILED",5,true,true,"Destroy"] call BIS_fnc_setTask;
		tanksAAFcurrent = tanksAAFcurrent + 1;
		server setVariable [_destino,dateToNumber date,true];
		[-1200] remoteExec ["timingCA",2];
		[-10,stavros] call playerScoreAdd;
		}
	else
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A convoy from %1 is about to depart at %2:%3. It will reinforce %4 with armored vehicles. Try to intercept it. Steal or destroy that thing before it reaches it's destination.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Armored Convoy",_destino],_posdestino,"SUCCEEDED",5,true,true,"Destroy"] call BIS_fnc_setTask;
		[5,0] remoteExec ["prestige",2];
		[0,5,_posdestino] remoteExec ["citySupportChange",2];
		[2700] remoteExec ["timingCA",2];
		{if (isPlayer _x) then {[10,_x] call playerScoreAdd}} forEach ([500,0,_vehObj,"BLUFORSpawn"] call distanceUnits);
		[5,stavros] call playerScoreAdd;
		[position _vehObj] spawn patrolCA;
		};
	};

if (_tipoConvoy == "Prisoners") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive driver _vehObj) or (driver _vehObj getVariable ["BLUFORSpawn",false]) or ({alive _x} count _POWs == 0)};
	if ((_vehObj distance _posdestino < 100) or ({alive _x} count _POWs == 0) or (dateToNumber date > _fechafinNum)) then
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A group os POW's is being transported from %1 to %4, and it's about to depart at %2:%3. They are awaiting for execution. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Prisoner Convoy",_destino],_posdestino,"FAILED",5,true,true,"run"] call BIS_fnc_setTask;
		{_x setCaptive false} forEach _POWs;
		_cuenta = 2 * (count _POWs);
		[_cuenta,0] remoteExec ["prestige",2];
		[-10,stavros] call playerScoreAdd;
		};
	if ((not alive driver _vehObj) or (driver _vehObj getVariable ["BLUFORSpawn",false])) then
		{
		[position _vehObj] spawn patrolCA;
		{_x setCaptive false; _x enableAI "MOVE"; [_x] orderGetin false;} forEach _POWs;
		waitUntil {sleep 2; ({alive _x} count _POWs == 0) or ({(alive _x) and (_x distance _posHQ < 50)} count _POWs > 0) or (dateToNumber date > _fechafinNum)};
		if (({alive _x} count _POWs == 0) or (dateToNumber date > _fechafinNum)) then
			{
			_tsk = ["CONVOY",[side_blue,civilian],[format ["A group os POW's is being transported from %1 to %4, and it's about to depart at %2:%3. They are awaiting for execution. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Prisoner Convoy",_destino],_posdestino,"FAILED",5,true,true,"run"] call BIS_fnc_setTask;
			_cuenta = 2 * (count _POWs);
			[_cuenta,0] remoteExec ["prestige",2];
			//[0,- _cuenta, _posdestino] remoteExec ["citySupportChange",2];
			[-10,stavros] call playerScoreAdd;
			}
		else
			{
			_tsk = ["CONVOY",[side_blue,civilian],[format ["A group os POW's is being transported from %1 to %4, and it's about to depart at %2:%3. They are awaiting for execution. Try to intercept it. Kill or capture the truck driver to make them join you and bring them to HQ. Alive if possible.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Prisoner Convoy",_destino],_posdestino,"SUCCEEDED",5,true,true,"run"] call BIS_fnc_setTask;
			_cuenta = {(alive _x) and (_x distance _posHQ < 150)} count _POWs;
			_hr = _cuenta;
			_resourcesFIA = 300 * _cuenta;
			[_hr,_resourcesFIA] remoteExec ["resourcesFIA",2];
			[0,10,_posbase] remoteExec ["citySupportChange",2];
			[2*_cuenta,0] remoteExec ["prestige",2];
			{[_x] join _grppow; [_x] orderGetin false} forEach _POWs;
			{[_cuenta,_x] call playerScoreAdd} forEach (allPlayers - hcArray);
			[round (_cuenta/2),stavros] call playerScoreAdd;
			};
		};
	};

if (_tipoConvoy == "Money") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive _vehObj) or (driver _vehObj getVariable ["BLUFORSpawn",false])};
	if ((dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive _vehObj)) then
		{
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck plenty of money is being moved from %1 to %4, and it's about to depart at %2:%3. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Money Convoy",_destino],_posdestino,"FAILED",5,true,true,"move"] call BIS_fnc_setTask;
		if ((dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100)) then
			{
			_resourcesAAF = server getVariable "resourcesAAF";
			_resourcesAAF = _resourcesAAF + 5000;
			server setVariable ["resourcesAAF",_resourcesAAF,true];
			[-1200] remoteExec ["timingCA",2];
			[-10,stavros] call playerScoreAdd;
			}
		else
			{
			[position _vehObj] spawn patrolCA;
			_resourcesAAF = server getVariable "resourcesAAF";
			_resourcesAAF = _resourcesAAF - 5000;
			server setVariable ["resourcesAAF",_resourcesAAF,true];
			[2700] remoteExec ["timingCA",2];
			};
		};
	if (driver _vehObj getVariable ["BLUFORSpawn",false]) then
		{
		[position _vehObj] spawn patrolCA;
		waitUntil {sleep 2; (_vehObj distance _posHQ < 50) or (not alive _vehObj) or (dateToNumber date > _fechafinNum)};
		if ((not alive _vehObj) or (dateToNumber date > _fechafinNum)) then
			{
			_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck plenty of money is being moved from %1 to %4, and it's about to depart at %2:%3. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Money Convoy",_destino],_posdestino,"FAILED",5,true,true,"move"] call BIS_fnc_setTask;
			_resourcesAAF = server getVariable "resourcesAAF";
			_resourcesAAF = _resourcesAAF - 5000;
			server setVariable ["resourcesAAF",_resourcesAAF,true];
			[1800] remoteExec ["timingCA",2];
			};
		if (_vehObj distance _posHQ < 50) then
			{
			_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck plenty of money is being moved from %1 to %4, and it's about to depart at %2:%3. Steal that truck and bring it to HQ. Those funds will be very welcome.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Money Convoy",_destino],_posdestino,"SUCCEEDED",5,true,true,"move"] call BIS_fnc_setTask;
			_resourcesAAF = server getVariable "resourcesAAF";
			_resourcesAAF = _resourcesAAF - 5000;
			server setVariable ["resourcesAAF",_resourcesAAF,true];
			[10,-20,_destino] remoteExec ["citySupportChange",2];
			[-20,0] remoteExec ["prestige",2];
			[0,5000] remoteExec ["resourcesFIA",2];
			[-1200] remoteExec ["timingCA",2];
			{if (_x distance _vehObj < 500) then {[10,_x] call playerScoreAdd}} forEach (allPlayers - hcArray);
			[5,stavros] call playerScoreAdd;
			waitUntil {sleep 1; speed _vehObj < 1};
			[_vehObj] call vaciar;
			deleteVehicle _vehObj;
			};
		};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
	};

if (_tipoConvoy == "Supplies") then
	{
	waitUntil {sleep 1; (dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (not alive _vehObj) or (driver _vehObj getVariable ["BLUFORSpawn",false])};
	if (not alive _vehObj) then
		{
		[position _vehObj] spawn patrolCA;
		_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck with medical supplies destination %4 it's about to depart at %2:%3 from %1. Steal that truck bring it to %4 and let people in there know it is FIA who's giving those supplies.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Supply Convoy",_destino],_posdestino,"FAILED",5,true,true,"heal"] call BIS_fnc_setTask;
		[-5,0] remoteExec ["prestige",2];
		[-10,stavros] call playerScoreAdd;
		};
	if ((dateToNumber date > _fechafinNum) or (_vehObj distance _posdestino < 100) or (driver _vehObj getVariable ["BLUFORSpawn",false])) then
		{
		if (driver _vehObj getVariable ["BLUFORSpawn",false]) then
			{
			[position _vehObj] spawn patrolCA;
			waitUntil {sleep 1; (_vehObj distance _posdestino < 100) or (not alive _vehObj) or (dateToNumber date > _fechafinNum)};
			if (_vehObj distance _posdestino < 100) then
				{
				_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck with medical supplies destination %4 it's about to depart at %2:%3 from %1. Steal that truck bring it to %4 and let people in there know it is FIA who's giving those supplies.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Supply Convoy",_destino],_posdestino,"SUCCEEDED",5,true,true,"heal"] call BIS_fnc_setTask;
				[5,0] remoteExec ["prestige",2];
				[0,15,_destino] remoteExec ["citySupportChange",2];
				{if (_x distance _vehObj < 500) then {[10,_x] call playerScoreAdd}} forEach (allPlayers - hcArray);
				[5,stavros] call playerScoreAdd;
				}
			else
				{
				_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck with medical supplies destination %4 it's about to depart at %2:%3 from %1. Steal that truck bring it to %4 and let people in there know it is FIA who's giving those supplies.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Supply Convoy",_destino],_posdestino,"FAILED",5,true,true,"heal"] call BIS_fnc_setTask;
				[5,-10,_destino] remoteExec ["citySupportChange",2];
				[-5,0] remoteExec ["prestige",2];
				[-10,stavros] call playerScoreAdd;
				};
			}
		else
			{
			_tsk = ["CONVOY",[side_blue,civilian],[format ["A truck with medical supplies destination %4 it's about to depart at %2:%3 from %1. Steal that truck bring it to %4 and let people in there know it is FIA who's giving those supplies.",_nombreorig,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4,_nombredest],"AAF Supply Convoy",_destino],_posdestino,"FAILED",5,true,true,"heal"] call BIS_fnc_setTask;
			[2,0] remoteExec ["prestige",2];
			[15,0,_destino] remoteExec ["citySupportChange",2];
			[-10,stavros] call playerScoreAdd;
			};
		};
	reportedVehs = reportedVehs - [_vehObj];
	publicVariable "reportedVehs";
	};

_wp0 = _grupo addWaypoint [_posbase, 0];
_wp0 setWaypointType "MOVE";
_wp0 setWaypointBehaviour "SAFE";
_wp0 setWaypointSpeed "LIMITED";
_wp0 setWaypointFormation "COLUMN";

if (_tipoConvoy == "Prisoners") then
	{
	{
	deleteVehicle _x;
	} forEach _POWs;
	};

if (_source == "mil") then {
	server setVariable ["milActive", false, true];
};

if (_source == "civ") then {
	server setVariable ["civActive", false, true];
};

_nul = [600,_tsk] spawn borrarTask;
{
waitUntil {sleep 1; (!([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits))};
deleteVehicle _x;
} forEach _soldados;
{
if (!([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits)) then {deleteVehicle _x}
} forEach _vehiculos;

{deleteGroup _x} forEach _grupos;




