private ["_tipo","_posicionTel","_cercano","_garrison","_coste","_hr","_size"];
_tipo = _this select 0;

if (_tipo == "add") then {hint "Select a zone to add garrisoned troops"} else {hint "Select a zone to remove it's Garrison"};

openMap true;
posicionTel = [];

onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_posicionTel = posicionTel;
posicionGarr = [];

_cercano = [marcadores,_posicionTel] call BIS_fnc_nearestPosition;
_posicion = getMarkerPos _cercano;

if (getMarkerPos _cercano distance _posicionTel > 40) exitWith {hint "You must click near a marked zone"; _nul=CreateDialog "garrison_menu";};

if (_cercano in mrkAAF) exitWith {hint "That zone does not belong to FIA"; _nul=CreateDialog "garrison_menu";};

if ((_cercano in puestosFIA) or (_cercano in ciudades)) exitWith {hint "You cannot manage garrisons on this kind of zone"; _nul=CreateDialog "garrison_menu"};

_garrison = garrison getVariable [_cercano,[]];

if (_tipo == "rem") then
	{
	if (count _garrison == 0) exitWith {hint "The place has no garrisoned troops to remove"; _nul=CreateDialog "garrison_menu";};
	_coste = 0;
	_hr = 0;
	if (spawner getVariable _cercano) then
		{
		if ({(alive _x) and (!captive _x) and ((side _x == side_green) or (side _x == side_red)) and (_x distance _posicion < 500)} count allUnits > 0) then
			{
			hint "You cannot remove garrisons while there are enemies nearby";
			_nul=CreateDialog "garrison_menu"
			}
		else
			{
			_size = [_cercano] call sizeMarker;
			{
			if ((side _x == side_blue) and (not(_x getVariable ["BLUFORSpawn",false])) and (_x distance _posicion < _size) and (_x != petros)) then
				{
				if (!alive _x) then
					{
					if (typeOf _x in soldadosFIA) then
						{
						if (typeOf _x == "b_g_soldier_unarmed_f") then {_coste = _coste - (["B_G_Mortar_01_F"] call vehiclePrice)};
						_hr = _hr - 1;
						_coste = _coste - (server getVariable (typeOf _x));
						};
					};
				if (typeOf (vehicle _x) == "B_G_Mortar_01_F") then {deleteVehicle vehicle _x};
				deleteVehicle _x;
				};
			} forEach allUnits;
			};
		};
	{
	if (_x == "b_g_soldier_unarmed_f") then {_coste = _coste + (["B_G_Mortar_01_F"] call vehiclePrice)};
	_hr = _hr + 1;
	_coste = _coste + (server getVariable _x);
	} forEach _garrison;
	[_hr,_coste] remoteExec ["resourcesFIA",2];
	garrison setVariable [_cercano,[],true];
	[_cercano] call mrkUpdate;
	hint format ["Garrison removed\n\nRecovered Money: %1 €\nRecovered HR: %2",_coste,_hr];
	_nul=CreateDialog "garrison_menu";
	}
else
	{
	if (spawner getVariable _cercano) then
		{
		if ({(alive _x) and (!captive _x) and ((side _x == side_green) or (side _x == side_red)) and (_x distance _posicion < 500)} count allUnits > 0) exitWith {hint "You cannot add soldiers to this garrison while there are enemies nearby"; _nul=CreateDialog "garrison_menu"};
		};
	posicionGarr = _posicionTel;
	publicVariable "posicionGarr";
	hint format ["Info%1",[_cercano] call garrisonInfo];
	closeDialog 0;
	_nul=CreateDialog "garrison_recruit";
	sleep 1;
	disableSerialization;

	_display = findDisplay 100;

	if (str (_display) != "no display") then
		{
		_ChildControl = _display displayCtrl 104;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_F"];
		_ChildControl = _display displayCtrl 105;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_AR_F"];
		_ChildControl = _display displayCtrl 126;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_medic_F"];
		_ChildControl = _display displayCtrl 107;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_SL_F"];
		_ChildControl = _display displayCtrl 108;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",(server getVariable "b_g_soldier_unarmed_f") + (["B_G_Mortar_01_F"] call vehiclePrice)];
		_ChildControl = _display displayCtrl 109;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_GL_F"];
		_ChildControl = _display displayCtrl 110;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_M_F"];
		_ChildControl = _display displayCtrl 111;
		_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_LAT_F"];
		};
	};