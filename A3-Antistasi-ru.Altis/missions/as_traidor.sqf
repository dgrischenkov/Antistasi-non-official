if (!isServer and hasInterface) exitWith{};

_marcador = _this select 0;
_source = _this select 1;

if (_source == "civ") then {
	server setVariable ["civActive", true, true];
};

_posicion = getMarkerPos _marcador;

_tiempolim = 60;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_tam = [_marcador] call sizeMarker;
_casas = nearestObjects [_posicion, ["house"], _tam];
_poscasa = [];
_casa = _casas select 0;
while {count _poscasa < 3} do
	{
	_casa = _casas call BIS_Fnc_selectRandom;
	_poscasa = [_casa] call BIS_fnc_buildingPositions;
	if (count _poscasa < 3) then {_casas = _casas - [_casa]};
	};

_max = (count _poscasa) - 1;
_rnd = floor random _max;
_postraidor = _poscasa select _rnd;
_posSol1 = _poscasa select (_rnd + 1);
_posSol2 = (_casa buildingExit 0);

_nombredest = [_marcador] call localizar;

_grptraidor = createGroup side_red;

_arraybases = bases - mrkFIA;
_base = [_arraybases, _posicion] call BIS_Fnc_nearestPosition;
_posBase = getMarkerPos _base;

_traidor = _grptraidor createUnit [opI_OFF2, _postraidor, [], 0, "NONE"];
_traidor allowDamage false;
_sol1 = _grptraidor createUnit [opI_SL, _posSol1, [], 0, "NONE"];
_sol2 = _grptraidor createUnit [opI_RFL1, _posSol2, [], 0, "NONE"];
_grptraidor selectLeader _traidor;

_posTsk = (position _casa) getPos [random 100, random 360];

_tsk = ["AS",[side_blue,civilian],[format ["A traitor has scheduled a meeting with CSAT in %1. Kill him before he provides enough intel to give us trouble. Do this before %2:%3. We don't where exactly this meeting will happen. You will recognise the building by the nearby Offroad and CSAT presence.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Traitor",_marcador],_posTsk,"CREATED",5,true,true,"Kill"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";

{_nul = [_x] spawn CSATinit; _x allowFleeing 0} forEach units _grptraidor;
_posVeh = [];
_dirVeh = 0;
_roads = [];
_radius = 20;
while {count _roads == 0} do
	{
	_roads = (getPos _casa) nearRoads _radius;
	_radius = _radius + 10;
	};

_road = _roads select 0;
_roadcon = roadsConnectedto _road;
_posroad = getPos _road;
_posrel = getPos (_roadcon select 0);
_dirveh = [_posroad,_posrel] call BIS_fnc_DirTo;
_posVeh = [_posroad, 3, _dirveh + 90] call BIS_Fnc_relPos;

_veh = opMRAPu createVehicle _posVeh;
_veh allowDamage false;
_veh setDir _dirVeh;
sleep 15;
_veh allowDamage true;
_traidor allowDamage true;
_nul = [_veh] spawn genVEHinit;
{_x disableAI "MOVE"; _x setUnitPos "UP"} forEach units _grptraidor;

_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], getPos _casa];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [50,50];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

_tipogrupo = selectRandom infSquad;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
if (random 10 < 2.5) then
	{
	_perro = _grupo createUnit ["Fin_random_F",_posicion,[],0,"FORM"];
	[_perro] spawn guardDog;
	};
_nul = [leader _grupo, _mrk, "SAFE","SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";
{[_x] spawn genInitBASES} forEach units _grupo;

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (not alive _traidor) or ({_traidor knowsAbout _x > 1.4} count ([500,0,_traidor,"BLUFORSpawn"] call distanceUnits) > 0)};

if ({_traidor knowsAbout _x > 1.4} count ([500,0,_traidor,"BLUFORSpawn"] call distanceUnits) > 0) then
	{
	//hint "You have been discovered. The traitor is fleeing to the nearest base. Go and kill him!";
	_tsk = ["AS",[side_blue,civilian],[format ["A traitor has scheduled a meeting with CSAT in %1. Kill him before he provides enough intel to give us trouble. Do this before %2:%3. We don't where exactly this meeting will happen. You will recognise the building by the nearby Offroad and CSAT presence.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Traitor",_marcador],_traidor,"CREATED",5,true,true,"Kill"] call BIS_fnc_setTask;
	{_x enableAI "MOVE"} forEach units _grptraidor;
	_traidor assignAsDriver _veh;
	[_traidor] orderGetin true;
	_wp0 = _grptraidor addWaypoint [_posVeh, 0];
	_wp0 setWaypointType "GETIN";
	_wp1 = _grptraidor addWaypoint [_posBase,1];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "CARELESS";
	_wp1 setWaypointSpeed "FULL";
	};

waitUntil  {sleep 1; (dateToNumber date > _fechalimnum) or (not alive _traidor) or (_traidor distance _posBase < 20)};

if (not alive _traidor) then
	{
	_tsk = ["AS",[side_blue,civilian],[format ["A traitor has scheduled a meeting with CSAT in %1. Kill him before he provides enough intel to give us trouble. Do this before %2:%3. We don't where exactly this meeting will happen. You will recognise the building by the nearby Offroad and CSAT presence.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Traitor",_marcador],_traidor,"SUCCEEDED",5,true,true,"Kill"] call BIS_fnc_setTask;
	[0,3] remoteExec ["prestige",2];
	[0,300] remoteExec ["resourcesFIA",2];
	//[-5,0,_marcador] remoteExec ["citySupportChange",2];
	{
	if (!isPlayer _x) then
		{
		_skill = skill _x;
		_skill = _skill + 0.1;
		_x setSkill _skill;
		}
	else
		{
		[10,_x] call playerScoreAdd;
		};
	} forEach ([_tam,0,_posicion,"BLUFORSpawn"] call distanceUnits);
	[5,stavros] call playerScoreAdd;

	}
else
	{
	_tsk = ["AS",[side_blue,civilian],[format ["A traitor has scheduled a meeting with CSAT in %1. Kill him before he provides enough intel to give us trouble. Do this before %2:%3. We don't where exactly this meeting will happen. You will recognise the building by the nearby Offroad and CSAT presence.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Kill the Traitor",_marcador],_traidor,"FAILED",5,true,true,"Kill"] call BIS_fnc_setTask;
	[-10,stavros] call playerScoreAdd;
	if (dateToNumber date > _fechalimnum) then
		{
		_hrT = server getVariable "hr";
		_resourcesFIAT = server getVariable "resourcesFIA";
		[-1*(round(_hrT/3)),-1*(round(_resourcesFIAT/3))] remoteExec ["resourcesFIA",2];
		}
	else
		{
		if (isPlayer Stavros) then
			{
			if (!("DEF_HQ" in misiones)) then
				{
				[] remoteExec ["ataqueHQ",HCattack];
				};
			}
		else
			{
			_minasFIA = allmines - (detectedMines side_red);
			if (count _minasFIA > 0) then
				{
				{if (random 100 < 30) then {side_red revealMine _x;}} forEach _minasFIA;
				};
			};
		};
	};

_nul = [1200,_tsk] spawn borrarTask;

if (_source == "civ") then {
	server setVariable ["civActive", false, true];
};

waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"BLUFORSpawn"] call distanceUnits)};

{
waitUntil {sleep 1; !([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits)};
deleteVehicle _x
} forEach units _grptraidor;
deleteGroup _grptraidor;

{
waitUntil {sleep 1; !([distanciaSPWN,1,_x,"BLUFORSpawn"] call distanceUnits)};
deleteVehicle _x
} forEach units _grupo;
deleteGroup _grupo;

waitUntil {sleep 1; !([distanciaSPWN,1,_veh,"BLUFORSpawn"] call distanceUnits)};
deleteVehicle _veh;
