if (!isServer) exitWith {};

_type = _this select 0;

_posbase = getMarkerPos (campsTony select 0);

_posibles = [];
_sitios = [];

_dealer = "";

{
	if ((typeOf _x == "C_Nikos_aged") && !(_x in allPlayers)) then {_dealer = _x};
} forEach nearestObjects [_posbase, [], 5];

diag_log format ["Dealer: %1", _dealer];



_silencio = false;
// if (count _this > 1) then {_silencio = true};


if (_type in misiones) exitWith {if (!_silencio) then {[[_dealer,"globalChat","I already gave you a mission of this type"],"commsMP"] call BIS_fnc_MP}};

if (_type == "REC") then {
	_sitios = colinas - mrkFIA;
	if (count _sitios > 0) then {
		for "_i" from 0 to ((count _sitios) - 1) do {
			_sitio = _sitios select _i;
			_pos = getMarkerPos _sitio;
			if ((_pos distance _posbase < 8000) and (not(spawner getVariable _sitio))) then {_posibles pushBack [_sitio]};
		};
	};

	if (count _posibles == 0) then {
		if (!_silencio) then {
			[[_dealer,"globalChat","I have no recovery missions for you right now."],"commsMP"] call BIS_fnc_MP;
			[[_dealer,"hint","Recovery Missions require mountains less than 8km from the black market camp."],"commsMP"] call BIS_fnc_MP;
		};
	}
	else {
		_sitio = _posibles call BIS_fnc_selectRandom;
		diag_log format ["Location: %1", _sitio];
		[_sitio, _dealer] remoteExec ["REC_Truck",HCgarrisons];
	};
};

if (_type == "ACQ") then {
	_sitios = colinas - mrkFIA;
	if (count _sitios > 0) then
		{
		for "_i" from 0 to ((count _sitios) - 1) do
			{
			_sitio = _sitios select _i;
			_pos = getMarkerPos _sitio;
			if ((_pos distance _posbase < 8000) and (not(spawner getVariable _sitio))) then {_posibles pushBack [_sitio]};
			};
		};
	if (count _posibles == 0) then
		{
		if (!_silencio) then
			{
			[[_dealer,"globalChat","I have no recovery missions for you right now."],"commsMP"] call BIS_fnc_MP;
			[[_dealer,"hint","Recovery Missions require mountains less than 8km from the black market camp."],"commsMP"] call BIS_fnc_MP;
			};
		}
	else
		{
		_sitio = _posibles call BIS_fnc_selectRandom;
		diag_log format ["Location: %1", _sitio];
		[_sitio, _dealer] remoteExec ["REC_Truck",HCgarrisons];
		};
	};





if ((count _posibles > 0) and (!_silencio)) then {[[_dealer,"globalChat","I have a mission for you"],"commsMP"] call BIS_fnc_MP;}

