if (!isServer) exitWith {};

private ["_tipo","_posbase","_posibles","_sitios","_exists","_sitio","_pos","_ciudad"];

_tipo = _this select 0;

_posbase = getMarkerPos "respawn_west";
_posibles = [];
_sitios = [];
_exists = false;

_excl = [posStranger];

_silencio = false;
if (count _this > 1) then {_silencio = true};

if (_tipo in misiones) exitWith {if (!_silencio) then {[[Stranger,"globalChat","I already gave you a mission of this type"],"commsMP"] call BIS_fnc_MP}};
if (server getVariable "civActive") exitWith {if (!_silencio) then {[[Nomad,"globalChat","How about you prove yourself first by doing what I told you to do..."],"commsMP"] call BIS_fnc_MP}};

if (_tipo == "AS") then {
	_sitios = ciudades - mrkFIA - _excl;
	if (count _sitios > 0) then {
		for "_i" from 0 to ((count _sitios) - 1) do {
			_sitio = _sitios select _i;
			_pos = getMarkerPos _sitio;
			if ((_pos distance _posbase < 4000) and (not(spawner getVariable _sitio))) then {_posibles = _posibles + [_sitio]};
		};
	};
	if (count _posibles == 0) then {
		if (!_silencio) then {
			[[Stranger,"globalChat","I have no assasination missions for you. Move our HQ closer to the enemy or finish some other assasination missions in order to have better intel"],"commsMP"] call BIS_fnc_MP;
			[[Stranger,"hint","Assasination Missions require AAF cities, Observation Posts or bases closer than 4Km from your HQ."],"commsMP"] call BIS_fnc_MP;
		};
	}
	else {
		_sitio = _posibles call BIS_fnc_selectRandom;
		[_sitio, "civ"] remoteExec ["AS_Traidor",HCgarrisons];
	};
};

if (_tipo == "CON") then {
	_sitios = power - mrkFIA - _excl;
	if (count _sitios > 0) then {
		for "_i" from 0 to ((count _sitios) - 1) do {
			_sitio = _sitios select _i;
			_pos = getMarkerPos _sitio;
			if ((_pos distance _posbase < 4000) and (_sitio in mrkAAF)) then {_posibles = _posibles + [_sitio]};
		};
	};
	if (count _posibles == 0) then {
		if (!_silencio) then {
			[[Stranger,"globalChat","I have no Conquest missions for you. Move our HQ closer to the enemy or finish some other conquest missions in order to have better intel."],"commsMP"] call BIS_fnc_MP;
			[[Stranger,"hint","Conquest Missions require AAF power plants closer than 4Km from your HQ."],"commsMP"] call BIS_fnc_MP;
		};
	}
	else {
		_sitio = _posibles call BIS_fnc_selectRandom;
		[_sitio, "civ"] remoteExec ["CON_Power",HCgarrisons];
	};
};


if (_tipo == "CONVOY") then {
	_tempSit = ciudades + bases;
	_sitios = _tempSit - mrkFIA - _excl;
	if (count _sitios > 0) then {
		for "_i" from 0 to ((count _sitios) - 1) do {
			_sitio = _sitios select _i;
			_pos = getMarkerPos _sitio;
			_base = [_sitio] call findBasesForConvoy;
			if ((_pos distance _posbase < 4000) and (_base !="")) then {
				_posibles = _posibles + [_sitio];
			};
		};
	};
	if (count _posibles == 0) then {
		if (!_silencio) then {
			[[Stranger,"globalChat","I have no Convoy missions for you. Move our HQ closer to the enemy or finish some other rescue missions in order to have better intel"],"commsMP"] call BIS_fnc_MP;
			[[Stranger,"hint","Convoy Missions require AAF Airports, Bases or Cities closer than 4Km from your HQ, and they must have an idle friendly base in their surroundings."],"commsMP"] call BIS_fnc_MP;
		};
	}
	else {
		_sitio = _posibles call BIS_fnc_selectRandom;
		_base = [_sitio] call findBasesForConvoy;
		[_sitio,_base,"civ"] remoteExec ["CONVOY",HCgarrisons];
	};
};


if ((count _posibles > 0) and (!_silencio)) then {[[Stranger,"globalChat","I have a mission for you"],"commsMP"] call BIS_fnc_MP;};