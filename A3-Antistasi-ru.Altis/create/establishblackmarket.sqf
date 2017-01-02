if (!isServer) exitWith {};

private ["_tipo","_coste","_grupo","_unit","_tam","_roads","_road","_pos","_camion","_texto","_mrk","_hr","_unidades","_formato"];

_type = _this select 0;
_position = _this select 1;

if (_type == "delete") exitWith {
	_mrk = [campsTony,_position] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _mrk;
	hint format ["Deleting %1",markerText _mrk];
	_coste = 0;
	_hr = 0;
	_tipogrupo = "IRG_SniperTeam_M";
	_formato = (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> _tipogrupo);
	_unidades = [_formato] call groupComposition;
	{_coste = _coste + (server getVariable _x); _hr = _hr +1} forEach _unidades;
	[_hr,_coste] remoteExec ["resourcesFIA",2];
	deleteMarker _mrk;
	campsTony = campsTony - [_mrk]; publicVariable "campsTony";
	marcadores = marcadores - [_mrk]; publicVariable "marcadores";
	};

_texto = "Tony";
_tipogrupo = "IRG_SniperTeam_M";
_tipoVeh = "B_G_Quadbike_01_F";

_mrk = createMarker [format ["TonysCamp%1", random 1000], _position];
_mrk setMarkerShape "ICON";

_fechalim = [date select 0, date select 1, date select 2, date select 3, (date select 4) + 60];
_fechalimnum = dateToNumber _fechalim;

_tsk = ["campsTony",[side_blue,civilian],["We are sending a team to establish a camp for the arms trader. Send and cover the team until reaches it's destination.","Camp Setup",_mrk],_position,"CREATED",5,true,true,"Move"] call BIS_fnc_setTask;
misiones pushBackUnique _tsk; publicVariable "misiones";
_grupo = [getMarkerPos "respawn_west", side_blue, (configfile >> "CfgGroups" >> "West" >> "Guerilla" >> "Infantry" >> _tipogrupo)] call BIS_Fnc_spawnGroup;
_grupo setGroupId ["Watch"];

_tam = 10;
while {true} do
	{
	_roads = getMarkerPos "respawn_west" nearRoads _tam;
	if (count _roads < 1) then {_tam = _tam + 10};
	if (count _roads > 0) exitWith {};
	};
_road = _roads select 0;
_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
_camion = _tipoVeh createVehicle _pos;
_nul = [_grupo] spawn dismountFIA;
_grupo addVehicle _camion;
{[_x] call FIAinit} forEach units _grupo;
leader _grupo setBehaviour "SAFE";
Stavros hcSetGroup [_grupo];

waitUntil {sleep 1; ({alive _x} count units _grupo == 0) or ({(alive _x) and (_x distance _position < 10)} count units _grupo > 0) or (dateToNumber date > _fechalimnum)};

if ({(alive _x) and (_x distance _position < 10)} count units _grupo > 0) then
	{
	if (isPlayer leader _grupo) then
		{
		_owner = (leader _grupo) getVariable ["owner",leader _grupo];
		(leader _grupo) remoteExec ["removeAllActions",leader _grupo];
		_owner remoteExec ["selectPlayer",leader _grupo];
		(leader _grupo) setVariable ["owner",_owner,true];
		{[_x] joinsilent group _owner} forEach units group _owner;
		[group _owner, _owner] remoteExec ["selectLeader", _owner];
		"" remoteExec ["hint",_owner];
		waitUntil {!(isPlayer leader _grupo)};
		};
	campsTony = campsTony + [_mrk]; publicVariable "campsTony";
	marcadores = marcadores + [_mrk]; publicVariable "marcadores";
	spawner setVariable [_mrk,false,true];
	_tsk = ["campsTony",[side_blue,civilian],["We are sending a team to establish a camp for the arms trader. Send and cover the team until reaches it's destination..","Camp Setup",_mrk],_position,"SUCCEEDED",5,true,true,"Move"] call BIS_fnc_setTask;
	_mrk setMarkerType "loc_bunker";
	_mrk setMarkerColor "ColorOrange";
	_mrk setMarkerText _texto;
	}
else
	{
	_tsk = ["campsTony",[side_blue,civilian],["We are sending a team to establish a camp for the arms trader. Send and cover the team until reaches it's destination.","Camp Setup",_mrk],_position,"FAILED",5,true,true,"Move"] call BIS_fnc_setTask;
	sleep 3;
	deleteMarker _mrk;
	};

stavros hcRemoveGroup _grupo;
{deleteVehicle _x} forEach units _grupo;
deleteVehicle _camion;
deleteGroup _grupo;
sleep 15;

_nul = [0,_tsk] spawn borrarTask;











