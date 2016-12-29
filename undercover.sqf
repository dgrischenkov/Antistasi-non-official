if (player != player getVariable ["owner",player]) exitWith {hint localize "STR_UNDERCOVER_WHILE_AI"};
if (captive player) exitWith {hint localize "STR_UNDERCOVER_ALREADY"};

private ["_compromised","_cambiar","_bases","_arrayCivVeh","_player","_size","_base"];

_cambiar = "";
_bases = bases + puestos + controles;
_locs = (bases + aeropuertos + puestos + colinas) arrayIntersect mrkAAF;
_arrayCivVeh = arrayCivVeh + [civHeli];
//_AAsites = colinasAA arrayIntersect mrkAAF;
_compromised = player getVariable "compromised";

if (vehicle player != player) then
	{
	if (not(typeOf(vehicle player) in _arrayCivVeh)) then
		{
		hint localize "STR_UNDERCOVER_NOT_CIV_VEH";
		_cambiar = "Init"
		};
	if (vehicle player in reportedVehs) then
		{
		hint localize "STR_UNDERCOVER_SPOTED_VEH";
		_cambiar = "Init";
		};
	}
else
	{
	if ((primaryWeapon player != "") or (secondaryWeapon player != "") or (handgunWeapon player != "") or (vest player != "") or (headgear player in cascos) or (hmd player != "") or (not(uniform player in civUniforms))) then
		{
		hint localize "STR_UNDERCOVER_CANT_LOOT";
		_cambiar = "Init";
		};
	if (dateToNumber date < _compromised) then
		{
		hint localize "STR_UNDERCOVER_3_MIN";
		_cambiar = "Init";
		};
	};

if (_cambiar != "") exitWith {};

if ({((side _x== side_red) or (side _x== side_green)) and ((_x knowsAbout player > 1.4) or (_x distance player < 350))} count allUnits > 0) exitWith
	{
	hint localize "STR_UNDERCOVER_SPOTED";
	if (vehicle player != player) then
		{
		{
		if ((isPlayer _x) and (captive _x)) then {[_x,false] remoteExec ["setCaptive",_x]; reportedVehs pushBackUnique (vehicle player); publicVariable "reportedVehs"}
		} forEach ((crew (vehicle player)) + (assignedCargo (vehicle player)) - [player]);
		};
	};

_base = [_bases,player] call BIS_fnc_nearestPosition;
_size = [_base] call sizeMarker;
if ((player distance getMarkerPos _base < _size*2) and (_base in mrkAAF)) exitWith {hint localize "STR_UNDERCOVER_NEAR_BASE"};

["Undercover ON",0,0,4,0,0,4] spawn bis_fnc_dynamicText;

player setCaptive true;

_player = player getVariable ["owner",player];

/*
if (_player == leader group _player) then
	{
	{if (!isplayer _x) then {[_x] spawn undercoverAI}} forEach units group _player;
	};
*/
while {_cambiar == ""} do
	{
	sleep 1;
	if (!captive player) then
		{
		_cambiar = "Reported";
		}
	else
		{
		_veh = vehicle _player;
		_tipo = typeOf _veh;
		if (_veh != _player) then
			{
			if (not(_tipo in _arrayCivVeh)) then
				{
				_cambiar = "VNoCivil"
				}
			else
				{
				if (_veh in reportedVehs) then
					{
					_cambiar = "VCompromised"
					}
				else
					{
					if (_tipo != civHeli) then
						{
						if !(isOnRoad position _veh) then
							{
							if (count (_veh nearRoads 50) == 0) then
								{
								if ({((side _x== side_red) or (side _x== side_green)) and ((_x knowsAbout player > 1.4) or (_x distance player < 350))} count allUnits > 0) then {_cambiar = "Carretera"};
								};
							};
						if (hayACE) then
							{
			  				if (((position player nearObjects ["DemoCharge_Remote_Ammo", 5]) select 0) mineDetectedBy side_green) then
								{
								_cambiar = "SpotBombTruck";
								};
							if (((position player nearObjects ["SatchelCharge_Remote_Ammo", 5]) select 0) mineDetectedBy side_green) then
								{
								_cambiar = "SpotBombTruck";
								};
							};
						};
						/*
						else {
							_aa = [_AAsites, _veh] call BIS_fnc_nearestPosition;
							diag_log format ["location: %1", _aa];
							if (_veh distance getMarkerPos _aa < 300) then {_cambiar = "AA"};
						};
						*/
					};
				}
			}
		else
			{
			if ((primaryWeapon player != "") or (secondaryWeapon player != "") or (handgunWeapon player != "") or (vest player != "") or (headgear player in cascos) or (hmd player != "") or (not(uniform player in civUniforms))) then
				{
				if ({((side _x== side_red) or (side _x== side_green)) and ((_x knowsAbout player > 1.4) or (_x distance player < 350))} count allUnits > 0) then {_cambiar = "Vestido2"} else {_cambiar = "Vestido"};
				};
			if (dateToNumber date < _compromised) then
				{
				_cambiar = "Compromised";
				};
			};
		if (_cambiar == "") then {
			if (_tipo != civHeli) then {
				_base = [_bases,_player] call BIS_fnc_nearestPosition;
				_size = [_base] call sizeMarker;
					if ((_player distance getMarkerPos _base < _size*2) and (_base in mrkAAF)) then {
						_cambiar = "Distancia";
					};
			}
			else {
				_loc = [_locs,_player] call BIS_fnc_nearestPosition;
				if (_player distance2d getMarkerPos _loc < 300) then {
						_cambiar = "Distancia";
				};
			};

		};
	};
};

if (captive _player) then {_player setCaptive false};

["Undercover OFF",0,0,4,0,0,4] spawn bis_fnc_dynamicText;
switch _cambiar do
	{
	case "Reported":
		{
		hint localize "STR_UNDERCOVER_REPORTED";
		//_compromised = _player getVariable "compromised";
		if (vehicle _player != _player) then
			{
			//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
			reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
			}
		else
			{
			_player setVariable ["compromised",(dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 3])];
			};
		};
	case "VNoCivil": {hint localize "STR_UNDERCOVER_ENTER_TO_NON_CIV_VEH"};
	case "VCompromised": {hint localize "STR_UNDERCOVER_ENTER_TO_REPORTED_VEH"};
	case "SpotBombTruck":
		{
		hint localize "STR_UNDERCOVER_EXPLOSIVE_IN_VEH";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	case "Carretera":
		{
		hint localize "STR_UNDERCOVER_FAR_FROM_ROAD";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	case "AA": {
		hint localize "STR_UNDERCOVER_SPOTED_FROM_AIR";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
	};
	case "Vestido": {hint localize "STR_UNDERCOVER_CANT_LOOT"};
	case "Vestido2":
		{
		hint localize "STR_UNDERCOVER_CANT_LOOT";
		_player setVariable ["compromised",dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 3]];
		};
	case "Compromised": {hint localize "STR_UNDERCOVER_LEFT_VEH"};
	case "Distancia":
		{
		hint localize "STR_UNDERCOVER_NEAR_ENEMY_FACILITY";
		//_compromised = _player getVariable "compromised";
		if (vehicle _player != _player) then
			{
			//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
			reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
			}
		else
			{
			_player setVariable ["compromised",(dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 3])];
			};
		};
	};
