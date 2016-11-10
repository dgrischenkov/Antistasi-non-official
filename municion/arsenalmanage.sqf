if (!isServer) exitWith {};
private ["_armas","_armasTrad","_addedWeapons","_lockedWeapon","_armasFinal","_precio","_arma","_armaTrad","_priceAdd","_updated","_magazines","_addedMagazines","_magazine","_magazinesFinal","_items","_addedItems","_item","_cuenta","_itemsFinal","_mochis","_mochisTrad","_addedMochis","_lockedMochi","_mochisFinal","_mochi","_mochiTrad","_armasConCosa","_armaConCosa"];

_updated = "";

_armas = weaponCargo caja;
_mochis = backpackCargo caja;
_magazines = magazineCargo caja;
_items = itemCargo caja;

_fabricas = count (fabricas - mrkAAF);

_addedMagazines = [];

{
_magazine = _x;
if (not(_magazine in unlockedMagazines)) then
	{
	if ({_x == _magazine} count _magazines >= (13 + (count unlockedMagazines)) - (2*_fabricas)) then
		{
		_addedMagazines pushBackUnique _magazine;
		unlockedMagazines pushBackUnique _magazine;
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _magazine >> "displayName")]
		};
	};
} forEach allMagazines - primaryMagazines;

//-BEGIN-// 1.5.5
// check primary magazines to account for unlock issues caused by Petros' death
_primeMags = [];
{
	_primeMags pushBackUnique (getArray (configFile / "CfgWeapons" / _x / "magazines") select 0);
} forEach unlockedWeapons;

{
	_magazine = _x;
	if !(_magazine in unlockedMagazines) then {
		if ({_x == _magazine} count _magazines >= (13 + (count unlockedMagazines)) - (2*_fabricas)) then {
			_addedMagazines pushBackUnique _magazine;
			unlockedMagazines pushBackUnique _magazine;
			_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _magazine >> "displayName")]
		};
	};
} forEach _primeMags;
//-END-//

_armasTrad = [];

{
_armaTrad = [_x] call BIS_fnc_baseWeapon;
_armasTrad pushBack _armaTrad;
} forEach _armas;

_addedWeapons = [];
{
_lockedWeapon = _x;

if ({_x == _lockedWeapon} count _armasTrad >= (12 + (count unlockedWeapons) - (2*_fabricas))) then
	{
	_desbloquear = false;
	//_magazines = getArray (configFile / "CfgWeapons" / _x / "magazines");
	_magazine = (getArray (configFile / "CfgWeapons" / _x / "magazines") select 0);
	if !(isNil "_magazine") then {
		if (_magazine in unlockedMagazines) then {
			_desbloquear = true;
		}
		else {
			if ({_x == _magazine} count _magazines >= (13 + (count unlockedMagazines)) - (2*_fabricas)) then {
				_desbloquear = true;
				_addedMagazines pushBackUnique _magazine;
				unlockedMagazines pushBackUnique _magazine;
				_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgMagazines" >> _magazine >> "displayName")]
			};
		};
		if (_desbloquear) then {
			_addedWeapons pushBackUnique _lockedWeapon;
			unlockedWeapons pushBackUnique _lockedWeapon;
			_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _lockedWeapon >> "displayName")];
		};
	};
};
} forEach lockedWeapons;

if (count _addedMagazines > 0) then
	{
	// XLA fixed arsenal
	if (hayXLA) then {
		[caja,_addedMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
	} else {
		[caja,_addedMagazines,true,false] call BIS_fnc_addVirtualMagazineCargo;
	};
	publicVariable "unlockedMagazines";
	};

_magazinesFinal = [];

for "_i" from 0 to (count _magazines) - 1 do
	{
	_magazine = _magazines select _i;
	if (not(_magazine in unlockedMagazines)) then
		{
		_magazinesFinal pushBack _magazine;
		};
	};

if (count _addedWeapons > 0) then
	{
	lockedWeapons = lockedWeapons - _addedWeapons;
	//lockedWeapons = lockedWeapons - _addedWeapons;//verificar si tiene que ser pública
	// XLA fixed arsenal
	if (hayXLA) then {
		[caja,_addedWeapons,true,false] call XLA_fnc_addVirtualWeaponCargo;
	} else {
		[caja,_addedWeapons,true,false] call BIS_fnc_addVirtualWeaponCargo;
	};
	//unlockedWeapons = unlockedWeapons + _addedWeapons;
	publicVariable "unlockedWeapons";
	[_addedWeapons] spawn weaponCheck;
	};

_armasFinal = [];
_armasConCosa = weaponsItems caja;

for "_i" from 0 to (count _armas) - 1 do
	{
	_arma = _armas select _i;
	_armaTrad = _armasTrad select _i;
	if (not(_armaTrad in unlockedWeapons)) then
		{
		_armasFinal pushBack _arma;
		}
	else
		{
		if (_arma != _armaTrad) then
			{
			_armaConCosa = _armasConCosa select _i;
			if ((_armaConCosa select 0) == _arma) then
				{
				{
				if (typeName _x != typeName []) then {_items pushBack _x};
				} forEach (_armaConCosa - [_arma]);
				};
			};
		};
	};

_mochisTrad = [];

{
_mochiTrad = _x call BIS_fnc_basicBackpack;
_mochisTrad pushBack _mochiTrad;
} forEach _mochis;

_addedMochis = [];
{
_lockedMochi = _x;
if ({_x == _lockedMochi} count _mochisTrad >= (5*(count unlockedBackpacks))) then
	{
	_addedMochis pushBackUnique _lockedMochi;
	_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgVehicles" >> _lockedMochi >> "displayName")];
	};
} forEach lockedMochis;

if (count _addedMochis > 0) then
	{
	lockedMochis = lockedMochis - _addedMochis;//verificar si tiene que ser pública
	// XLA fixed arsenal
	if (hayXLA) then {
		[caja,_addedMochis,true,false] call XLA_fnc_addVirtualBackpackCargo;
	} else {
		[caja,_addedMochis,true,false] call BIS_fnc_addVirtualBackpackCargo;
	};
	unlockedBackpacks = unlockedBackpacks + _addedMochis;
	//unlockedMochis = unlockedMochis + _addedMochis;
	publicVariable "unlockedBackpacks";
	};

_mochisFinal = [];

for "_i" from 0 to (count _mochis) - 1 do
	{
	_mochi = _mochis select _i;
	_mochiTrad = _mochisTrad select _i;
	if (not(_mochiTrad in unlockedBackpacks)) then
		{
		_mochisFinal pushBack _mochi;
		};
	};


_addedItems = [];

{
_item = _x;
if (not(_item in unlockedItems)) then
	{
	_cuenta = -63;
	if (_item in itemsAAF) then {_cuenta = -53};
	if ({_x == _item} count _items >= (_cuenta + (count unlockedItems) - _fabricas)) then
		{
		_addedItems pushBackUnique _item;
		unlockedItems pushBackUnique _item;
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> _item >> "displayName")];
		if (_item in opticasAAF) then {unlockedOptics pushBackUnique _item; publicVariable "unlockedOptics"};
		};
	};
} forEach allItems + ["bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","B_UavTerminal"] + bluItems - ["NVGoggles","Laserdesignator"];

if (not("NVGoggles" in unlockedItems)) then
	{
	if ({(_x == "NVGoggles") or (_x == "NVGoggles_OPFOR") or (_x == "NVGoggles_INDEP") or (_x == indNVG)} count itemCargo caja >= (-53 + (count unlockedItems) - _fabricas)) then
		{
		_addedItems = _addedItems + ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP"];
		unlockedItems = unlockedItems + ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP",indNVG];
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> "NVGoggles" >> "displayName")];
		};
	};

if (not("Laserdesignator" in unlockedItems)) then
	{
	if ({(_x == "Laserdesignator") or (_x == "Laserdesignator_02") or (_x == "Laserdesignator_03")} count itemCargo caja >= (-53 + (count unlockedItems) - _fabricas)) then
		{
		_addedItems pushBack "Laserdesignator";
		unlockedItems pushBack "Laserdesignator";
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> "Laserdesignator" >> "displayName")];
		};
	};

if (not("Rangefinder" in unlockedItems)) then
	{
	if ({(_x == "Rangefinder")} count weaponCargo caja >= (-53 + (count unlockedItems) - _fabricas)) then
		{
		_addedItems pushBack "Rangefinder";
		unlockedItems pushBack "Rangefinder";
		_updated = format ["%1%2<br/>",_updated,getText (configFile >> "CfgWeapons" >> "Rangefinder" >> "displayName")];
		};
	};

if (count _addedItems >0) then
	{
	// XLA fixed arsenal
	if (hayXLA) then {
		[caja,_addedItems,true,false] call XLA_fnc_addVirtualItemCargo;
	} else {
		[caja,_addedItems,true,false] call BIS_fnc_addVirtualItemCargo;
	};
	//unlockedItems = unlockedItems + _addedItems;
	publicVariable "unlockedItems";
	};

_itemsFinal = [];

for "_i" from 0 to (count _items) - 1 do
	{
	_item = _items select _i;
	if (not(_item in unlockedItems)) then
		{
		if ((_item == "NVGoggles_OPFOR") or (_item == "NVGoggles_INDEP")) then
			{
			if (not("NVGoggles" in unlockedItems)) then
				{
				_itemsFinal pushBack _item;
				};
			}
		else
			{
			if ((_item == "Laserdesignator_02") or (_item == "Laserdesignator_03")) then
				{
				if (not("Laserdesignator" in unlockedItems)) then
					{
					_itemsFinal pushBack _item;
					};
				}
			else
				{
				// experimental: if item not unlocked and not TFAR radio, add to ammo box
				if !(toLower _item find "tf_anprc152" >= 0) then {_itemsFinal pushBack _item};
				};
			};
		};
	};

//[0,_precio] remoteExec ["resourcesFIA",2];

if (count _armas != count _armasFinal) then
	{
	clearWeaponCargoGlobal caja;
	{caja addWeaponCargoGlobal [_x,1]} forEach _armasFinal;
	unlockedRifles = unlockedweapons -  hguns -  mlaunchers - rlaunchers - ["Binocular","Laserdesignator","Rangefinder"] - srifles - mguns; publicVariable "unlockedRifles";
	};
if (count _mochis != count _mochisFinal) then
	{
	clearBackpackCargoGlobal caja;
	{caja addBackpackCargoGlobal [_x,1]} forEach _mochisFinal;
	};
if (count _magazines != count _magazinesFinal) then
	{
	clearMagazineCargoGlobal caja;
	{caja addMagazineCargoGlobal [_x,1]} forEach _magazinesFinal;
	};
if (count _items != count _itemsFinal) then
	{
	clearItemCargoGlobal caja;
	{caja addItemCargoGlobal [_x,1]} forEach _itemsFinal;
	};

_updated