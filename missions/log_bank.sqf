//el sitio de la caja es el 21
if (!isServer and hasInterface) exitWith {};

_banco = _this select 0;

_posicion = getPos _banco;
_marcador = [ciudades,_posicion] call BIS_fnc_nearestPosition;
_posbase = getMarkerPos "respawn_west";

_tiempolim = 120;
_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _tiempolim];
_fechalimnum = dateToNumber _fechalim;

_ciudad = [ciudades, _posicion] call BIS_fnc_nearestPosition;
_mrkfin = createMarker [format ["LOG%1", random 100], _posicion];
_nombredest = [_ciudad] call localizar;
_mrkfin setMarkerShape "ICON";
//_mrkfin setMarkerType "hd_destroy";
//_mrkfin setMarkerColor "ColorBlue";
//_mrkfin setMarkerText "Bank";

_pos = (getMarkerPos "respawn_west") findEmptyPosition [1,50,"C_Van_01_box_F"];

_camion = "C_Van_01_box_F" createVehicle _pos;
{_x reveal _camion} forEach (allPlayers - hcArray);
[_camion] spawn vehInit;
_camion setVariable ["destino",_nombredest,true];
_camion addEventHandler ["GetIn",
	{
	if (_this select 1 == "driver") then
		{
		_texto = format ["Bring this truck to %1 Bank and park it in the main entrance",(_this select 0) getVariable "destino"];
		_texto remoteExecCall ["hint",_this select 2];
		};
	}];

[_camion,"Mission Vehicle"] spawn inmuneConvoy;

_tsk = ["LOG",[side_blue,civilian],[format ["We know AAF is guarding a big amount of money in the bank of %1. Take this truck and go there before %2:%3, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Bank Robbery",_mrkfin],_posicion,"CREATED",5,true,true,"Interact"] call BIS_fnc_setTask;
misiones pushBack _tsk; publicVariable "misiones";
_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _posicion];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [30,30];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

_tipogrupo = selectRandom infSquad;
_grupo = [_posicion, side_green, (cfgInf >> _tipogrupo)] call BIS_Fnc_spawnGroup;
sleep 1;
_nul = [leader _grupo, _mrk, "SAFE","SPAWNED", "NOVEH2", "FORTIFY"] execVM "scripts\UPSMON.sqf";
{[_x] spawn genInitBASES} forEach units _grupo;

_posicion = _banco buildingPos 1;

waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (!alive _camion) or (_camion distance _posicion < 7)};

if ((dateToNumber date > _fechalimnum) or (!alive _camion)) then
	{
	_tsk = ["LOG",[side_blue,civilian],[format ["We know AAF is guarding a big amount of money in the bank of %1. Take this truck and go there before %2:%3, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Bank Robbery",_mrkfin],_posicion,"FAILED",5,true,true,"Interact"] call BIS_fnc_setTask;
	_resourcesAAF = server getVariable "resourcesAAF";
	_resourcesAAF = _resourcesAAF + 5000;
	server setVariable ["resourcesAAF",_resourcesAAF,true];
	[-1800] remoteExec ["timingCA",2];
	[-10,stavros] call playerScoreAdd;
	}
else
	{
	_cuenta = 120;//120
	[_posicion] remoteExec ["patrolCA",HCattack];
	[10,-20,_marcador] remoteExec ["citySupportChange",2];
	{_amigo = _x;
	if (_amigo distance _camion < 300) then
		{
		if ((captive _amigo) and (isPlayer _amigo)) then {[player,false] remoteExec ["setCaptive",_amigo]};
		{if (side _x == side_green) then {_x reveal [_amigo,4]};
		} forEach allUnits;
		};
	} forEach ([distanciaSPWN,0,_posicion,"BLUFORSpawn"] call distanceUnits);
	while {(_cuenta > 0) or (_camion distance _posicion < 7) and (alive _camion) and (dateToNumber date < _fechalimnum)} do
		{
		while {(_cuenta > 0) and (_camion distance _posicion < 7) and (alive _camion)} do
			{
			_formato = format ["%1", _cuenta];
			{if (isPlayer _x) then {[petros,"countdown",_formato] remoteExec ["commsMP",_x]}} forEach ([80,0,_camion,"BLUFORSpawn"] call distanceUnits);
			sleep 1;
			_cuenta = _cuenta - 1;
			};
		if (_cuenta > 0) then
			{
			_cuenta = 120;//120
			if (_camion distance _posicion > 6) then {[[petros,"hint","Don't get the truck far from the bank or count will restart"],"commsMP"] call BIS_fnc_MP};
			waitUntil {sleep 1; (!alive _camion) or (_camion distance _posicion < 7) or (dateToNumber date < _fechalimnum)};
			}
		else
			{
			if (alive _camion) then
				{
				{if (isPlayer _x) then {[petros,"hint","Drive the Truck back to base to finish this mission"] remoteExec ["commsMP",_x]}} forEach ([80,0,_camion,"BLUFORSpawn"] call distanceUnits);
				};
			//waitUntil {sleep 1; (!alive _camion) or (_camion distance _posicion > 7) or (dateToNumber date < _fechalimnum)};
			};
		};
	};


waitUntil {sleep 1; (dateToNumber date > _fechalimnum) or (!alive _camion) or (_camion distance _posbase < 50)};
if ((_camion distance _posbase < 50) and (dateToNumber date < _fechalimnum)) then
	{
	_tsk = ["LOG",[side_blue,civilian],[format ["We know AAF is guarding a big amount of money in the bank of %1. Take this truck and go there before %2:%3, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Bank Robbery",_mrkfin],_posicion,"SUCCEEDED",5,true,true,"Interact"] call BIS_fnc_setTask;
	[0,5000] remoteExec ["resourcesFIA",2];
	[-20,0] remoteExec ["prestige",2];
	[1800] remoteExec ["timingCA",2];
	{if (_x distance _camion < 500) then {[10,_x] call playerScoreAdd}} forEach (allPlayers - hcArray);
	[5,stavros] call playerScoreAdd;
	};
if (!alive _camion) then
	{
	_tsk = ["LOG",[side_blue,civilian],[format ["We know AAF is guarding a big amount of money in the bank of %1. Take this truck and go there before %2:%3, hold the truck close to tha bank's main entrance for 2 minutes and the money will be transferred to the truck. Bring it back to HQ and the money will be ours.",_nombredest,numberToDate [2035,_fechalimnum] select 3,numberToDate [2035,_fechalimnum] select 4],"Bank Robbery",_mrkfin],_posicion,"FAILED",5,true,true,"Interact"] call BIS_fnc_setTask;
	[1800] remoteExec ["timingCA",2];
	[-10,stavros] call playerScoreAdd;
	};

waitUntil {sleep 1; speed _camion == 0};

[_camion] call vaciar;
deleteVehicle _camion;

_nul = [1200,_tsk] spawn borrarTask;

waitUntil {sleep 1; !([distanciaSPWN,1,_posicion,"BLUFORSpawn"] call distanceUnits)};

{deleteVehicle _x} forEach units _grupo;
deleteGroup _grupo;

//sleep (600 + random 1200);
//_nul = [_tsk,true] call BIS_fnc_deleteTask;
deleteMarker _mrk;
deleteMarker _mrkfin;


