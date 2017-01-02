private ["_camion","_objetos","_todo","_proceder","_caja","_armas","_municion","_items","_mochis","_contenedores","_cuenta","_exists"];

_camion = vehicle player;
_objetos = [];
_todo = [];
_proceder = false;
_active = false;
_counter = 0;

if (!isNil {driver _camion getVariable "load_box"}) then {
	driver _camion removeAction (driver _camion getVariable "load_box");
	driver _camion setVariable ["load_box",nil,true];
};

//[[driver _camion,"remove"],"flagaction"] call BIS_fnc_MP;

_objetos = nearestObjects [_camion, ["ReammoBox_F","Land_PlasticCase_01_medium_F"], 20];

if (count _objetos == 0) exitWith {};
_caja = _objetos select 0;

if ((_caja == caja) and (player!=stavros)) exitWith {hint "Only the Commander can transfer this ammobox content to any truck"; [[_camion,"camion"],"flagaction"] call BIS_fnc_MP;};


_armas = weaponCargo _caja;
_municion = magazineCargo _caja;
_items = itemCargo _caja;
_mochis = [];
/*
if (count weaponsItemsCargo _camion > 0) then
	{
	{
	_armas pushBack ([(_x select 0)] call BIS_fnc_baseWeapon);
	for "_i" from 1 to (count _x) - 1 do
		{
		_cosa = _x select _i;
		if (typeName _cosa == typeName "") then
			{
			if (_cosa != "") then {_items pushBack _cosa};
			}
		else
			{
			if (typeName (_cosa select 0) == typeName []) then {_municion pushBack (_cosa select 0)};
			}
		};
	} forEach weaponsItemsCargo _caja;
	};

if (count backpackCargo _caja > 0) then
	{
	{
	_mochis pushBack (_x call BIS_fnc_basicBackpack);
	} forEach backpackCargo _caja;
	};
_contenedores = everyContainer _caja;
if (count _contenedores > 0) then
	{
	for "_i" from 0 to (count _contenedores - 1) do
		{
		_armas = _armas + weaponCargo ((_contenedores select _i) select 1);
		_municion = _municion + magazineCargo ((_contenedores select _i) select 1);
		_items = _items + itemCargo ((_contenedores select _i) select 1);
		};
	};
*/
_todo = _armas + _municion + _items + _mochis;
_cuenta = count _todo;

if (_cuenta < 1) then
	{
	hint "Closest Ammobox is empty";
	_proceder = true;
	};

if (_cuenta > 0) then
	{
	if (_caja == caja) then
		{
		if ("DEF_HQ" in misiones) then {_cuenta = round (_cuenta / 10)} else {_cuenta = round (_cuenta / 100)};
		}
	else
		{
		_cuenta = round (_cuenta / 5);
		};
	if (_cuenta < 1) then {_cuenta = 1};
	_cuenta = _cuenta * 10;
	while {(_camion == vehicle player) and (speed _camion == 0) and (_cuenta > _counter)} do
		{
		if !(_active) then {
			[round ((_cuenta - _counter) / 10),false] remoteExec ["pBarMP",player];
			_active = true;
		};

			_counter = _counter + 1;
  			sleep 0.1;
		//hint format ["Truck loading. \n\nTime remaining: %1 secs", _cuenta];
		//_cuenta = _cuenta -1;
		//sleep 1;
		if !(_cuenta > _counter) then
			{
			[_caja,_camion] remoteExec ["munitionTransfer",2];
			_proceder = true;
			};
		if ((_camion != vehicle player) or (speed _camion != 0)) then
				{
				hint "Transfer cancelled due to movement of Truck or Player";
				_proceder = true;
				};
		};
	};
	[0,true] remoteExec ["pBarMP",player];

//if (_proceder) then {[[driver _camion,"camion"],"flagaction"] call BIS_fnc_MP;};

if (_proceder) then {
	_aid = driver _camion addAction ["Transfer Ammobox to Truck", "Municion\transfer.sqf",nil,0,false,true];
	driver _camion setVariable ["load_box",_aid,true];
};

