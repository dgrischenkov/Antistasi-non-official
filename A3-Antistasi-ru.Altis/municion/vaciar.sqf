private ["_camiones","_camion","_armas","_municion","_items","_mochis","_contenedores","_todo"];

_camion = objNull;

if (count _this > 0) then
	{
	_camion = _this select 0;
	if (_camion isKindOf "StaticWeapon") then {_camion = objNull};
	}
else
	{
	_camiones = nearestObjects [caja, ["LandVehicle"], 20];
	_camiones = _camiones select {not (_x isKindOf "StaticWeapon")};
	_camiones = _camiones - [caja];
	if (count _camiones < 1) then {_camion = cajaVeh} else {_camion = _camiones select 0};
	};

if (isNull _camion) exitWith {};


if (server getVariable "lockTransfer") exitWith {
	if (isMultiplayer) then {
		{if (_x distance caja < 20) then {
			[petros,"hint","Currently unloading another ammobox. Please wait a few seconds."] remoteExec ["commsMP",_x];
		};
		} forEach playableUnits;
	}
	else {
		hint "Unloading ammobox..."
	};
};


_armas = weaponCargo _camion;
_municion = magazineCargo _camion;
_items = itemCargo _camion;
_mochis = backpackCargo _camion;

_todo = _armas + _municion + _items + _mochis;

if (count _todo < 1) exitWith
	{
	if (count _this == 0) then {hint "Closest vehicle cargo is empty"};
	if (count _this == 2) then {deleteVehicle _camion};
	};

server setVariable ["lockTransfer", true, true];
if (isMultiplayer) then {{if (_x distance caja < 20) then {[petros,"hint","Unloading ammobox..."] remoteExec ["commsMP",_x]}} forEach playableUnits} else {hint "Unloading ammobox..."};
if (count _this == 2) then {[_camion,caja,true] remoteExec ["munitionTransfer",2]} else {[_camion,caja] remoteExec ["munitionTransfer",2]};
_nul = [] spawn suspendTransfer;