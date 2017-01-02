if (!isServer) exitWith {};

private ["_tipo","_posbase","_posibles","_sitios","_exists","_sitio","_pos","_ciudad"];

_tipo = _this select 0;

_posbase = getMarkerPos "respawn_west";
_posibles = [];
_sitios = [];
_exists = false;

_silencio = false;
if (count _this > 1) then {_silencio = true};

if (_tipo in misiones) exitWith {if (!_silencio) then {[[petros,"globalChat","I already gave you a mission of this type"],"commsMP"] call BIS_fnc_MP}};

if (_tipo == "DES") then
	{
	_sitios = antenas - mrkFIA;
	if (count _sitios > 0) then
		{
		for "_i" from 0 to ((count _sitios) - 1) do
			{
			_sitio = _sitios select _i;
			if (_sitio in marcadores) then {_pos = getMarkerPos _sitio} else {_pos = getPos _sitio};
			if (_pos distance _posbase < 4000) then
				{
				if (_sitio in marcadores) then
					{
					if (not(spawner getVariable _sitio)) then {_posibles = _posibles + [_sitio]};
					}
				else
					{
					_cercano = [marcadores, getPos _sitio] call BIS_fnc_nearestPosition;
					if (_cercano in mrkAAF) then {_posibles = _posibles + [_sitio]};
					};
				};
			};
		};
	if (count _posibles == 0) then
		{
		if (!_silencio) then
			{
			[[petros,"globalChat","I have no destroy missions for you. Move our HQ closer to the enemy or finish some other destroy missions in order to have better intel"],"commsMP"] call BIS_fnc_MP;
			[[petros,"hint","Destroy Missions require AAF bases, Radio Towers or airports closer than 4Km from your HQ."],"commsMP"] call BIS_fnc_MP;
			};
		}
	else
		{
		_sitio = _posibles call BIS_fnc_selectRandom;
		[_sitio] remoteExec ["DES_antena",HCgarrisons];
		};
	};
if (_tipo == "LOG") then
	{
	_sitios = puestos + ciudades - ["puesto_13"];
	if (random 100 < 20) then {_sitios = _sitios + bancos};
	_sitios = _sitios - mrkFIA;
	if (count _sitios > 0) then
		{
		for "_i" from 0 to ((count _sitios) - 1) do
			{
			_sitio = _sitios select _i;
			if (_sitio in marcadores) then
				{
				_pos = getMarkerPos _sitio;
				}
			else
				{
				_pos = getPos _sitio;
				};
			if (_pos distance _posbase < 4000) then {
				if (_sitio in ciudades) then {
					/*
					_datos = server getVariable _sitio;
					_prestigeOPFOR = _datos select 2;
					_prestigeBLUFOR = _datos select 3;
					if (_prestigeOPFOR + _prestigeBLUFOR < 90) then {
						_posibles pushBack _sitio;
					};
					*/
					_posibles pushBack _sitio;
				}
				else {
					if (_sitio in puestos) then {
						_nmbr = (count unlockedWeapons) + (count unlockedMagazines) + (count unlockedItems) + (count unlockedBackpacks);
						if (_nmbr < 125) then {_posibles = _posibles + [_sitio];};
					}
					else {
						_posibles = _posibles + [_sitio];
					};
				};
			};
			if (_sitio in bancos) then
				{
				_ciudad = [ciudades, _pos] call BIS_fnc_nearestPosition;
				if (_ciudad in mrkFIA) then {_posibles = _posibles - [_sitio]};
				};
			};
		};
	if (count _posibles == 0) then
		{
		if (!_silencio) then
			{
			[[petros,"globalChat","I have no logistics missions for you. Move our HQ closer to the enemy or finish some other logistics missions in order to have better intel"],"commsMP"] call BIS_fnc_MP;
			[[petros,"hint","Logistics Missions require AAF Outposts, Cities or Banks closer than 4Km from your HQ."],"commsMP"] call BIS_fnc_MP;
			};
		}
	else
		{
		_sitio = _posibles call BIS_fnc_selectRandom;

		if (_sitio in ciudades) then {
			if (random 10 < 5) then {
				[_sitio] remoteExec ["LOG_Suministros",HCgarrisons];
			}
			else {
				[_sitio] remoteExec ["LOG_Medical",HCgarrisons];
			};
		};
		if (_sitio in puestos) then {[_sitio] remoteExec ["LOG_Ammo",HCgarrisons]};

		if (_sitio in bancos) then {[_sitio] remoteExec ["LOG_Bank",HCgarrisons]};
		};
	};
if (_tipo == "RES") then
	{
	_sitios = ciudades + bases + puestos - mrkFIA;
	if (count _this > 2) then {_sitios = ciudades - mrkFIA};

	if (count _sitios > 0) then
		{
		for "_i" from 0 to ((count _sitios) - 1) do
			{
			_sitio = _sitios select _i;
			_pos = getMarkerPos _sitio;
			if (_sitio in ciudades) then {if (_pos distance _posbase < 4000) then {_posibles pushBack _sitio}} else {if ((_pos distance _posbase < 4000) and (not(spawner getVariable _sitio))) then {_posibles = _posibles + [_sitio]}};
			};
		};
	if (count _posibles == 0) then
		{
		if (!_silencio) then
			{
			[[petros,"globalChat","I have no rescue missions for you. Move our HQ closer to the enemy or finish some other rescue missions in order to have better intel"],"commsMP"] call BIS_fnc_MP;
			[[petros,"hint","Rescue Missions require AAF Cities or Bases closer than 4Km from your HQ."],"commsMP"] call BIS_fnc_MP;
			};
		}
	else
		{
		_sitio = _posibles call BIS_fnc_selectRandom;
		if (_sitio in ciudades) then {[_sitio] remoteExec ["RES_Refugiados",HCgarrisons]} else {[_sitio] remoteExec ["RES_Prisioneros",HCgarrisons]};
		};
	};

if (_tipo == "FND_M") then {
	_sitios = ciudades - mrkFIA;
	if (count _sitios > 0) then
		{
		for "_i" from 0 to ((count _sitios) - 1) do
			{
			_sitio = _sitios select _i;
			if (_sitio in marcadores) then
				{
				_pos = getMarkerPos _sitio;
				}
			else
				{
				_pos = getPos _sitio;
				};
			if (_pos distance _posbase < 4000) then
				{
					_posibles pushBack _sitio;
				};
			};
		};
	if (count _posibles == 0) then
		{
		if (!_silencio) then
			{
			[[petros,"globalChat","I have no contact missions right now."],"commsMP"] call BIS_fnc_MP;
			};
		}
	else
		{
		_sitio = _posibles call BIS_fnc_selectRandom;
		[_sitio] remoteExec ["FND_MilCon",HCgarrisons];
		};
	};

if (_tipo == "FND_C") then {
	_sitios = ciudades - mrkFIA;
	if (count _sitios > 0) then {
		for "_i" from 0 to ((count _sitios) - 1) do {
			_sitio = _sitios select _i;
			if (_sitio in marcadores) then {
				_pos = getMarkerPos _sitio;
			}
			else {
				_pos = getPos _sitio;
			};
			if (_pos distance _posbase < 4000) then {
					_posibles pushBack _sitio;
			};
		};
	};
	if (count _posibles == 0) then {
		if (!_silencio) then {
			[[petros,"globalChat","I have no contact missions right now."],"commsMP"] call BIS_fnc_MP;
		};
	}
	else {
		_sitio = _posibles call BIS_fnc_selectRandom;

		[_sitio] remoteExec ["FND_CivCon",HCgarrisons];
	};
};

if (_tipo == "FND_E") then {
	_sitios = ciudades;
	if (count _sitios > 0) then {
		for "_i" from 0 to ((count _sitios) - 1) do {
			_sitio = _sitios select _i;
			if (_sitio in marcadores) then {
				_pos = getMarkerPos _sitio;
			}
			else {
				_pos = getPos _sitio;
			};
			if (_pos distance _posbase < 4000) then {
					_posibles pushBack _sitio;
			};
		};
	};
	if (count _posibles == 0) then {
		if (!_silencio) then {
			[[petros,"globalChat","I have no contact missions right now."],"commsMP"] call BIS_fnc_MP;
		};
	}
	else {
		_sitio = _posibles call BIS_fnc_selectRandom;

		[_sitio] remoteExec ["FND_ExpDealer",HCgarrisons];
	};
};


if ((count _posibles > 0) and (!_silencio)) then {[[petros,"globalChat","I have a mission for you"],"commsMP"] call BIS_fnc_MP;}

