if (!isServer) exitWith {};

_crate = _this select 0;

_weaponsCargo = [];
_ammoCargo= [];
_itemCargo = [];

_weaponsCargo = weaponsItemsCargo _crate;
_ammoCargo = magazineCargo _crate;
_itemCargo = itemCargo _crate;

_weapons = [];

_containers = [];

_containers = everyContainer _crate;

_priceWeapon = 100;
_priceAmmo = 10;
_priceItem = 5;

if ((count _weaponsCargo < 1) && (count _ammoCargo < 1) && (count _itemCargo < 1)) exitWith {hint "Message from Tony: \n If you try to cheat me again, the Matron of Mayhem will come for you."};

if (count _containers > 0) then {
	for "_i" from 0 to (count _containers) - 1 do {
		_subAmmo = magazineCargo ((_containers select _i) select 1);
		if (!isNil "_subAmmo") then {_ammoCargo = _ammoCargo + _subAmmo} else {diag_log format ["Error from %1",magazineCargo (_containers select _i)]};
		_itemCargo = _itemCargo + (itemCargo ((_containers select _i) select 1));
		_weaponsCargo = _weaponsCargo + weaponsItemsCargo ((_containers select _i) select 1);
	};
};

if (!isNil "_weaponsCargo") then {
	if (count _weaponsCargo > 0) then {
		{
			_weapons pushBack ([(_x select 0)] call BIS_fnc_baseWeapon);
			for "_i" from 1 to (count _x) - 1 do {
				_cosa = _x select _i;
				if (typeName _cosa == typeName "") then {
					if (_cosa != "") then {_itemCargo pushBack _cosa};
				};
			};
		} forEach _weaponsCargo;
	};
};

_weaponsList = [];
_weaponsListNumbers = [];

{
	_curWeapon = _x;
	if ((not(_curWeapon in _weaponsList)) and (not(_curWeapon in unlockedWeapons))) then {
		_weaponsList pushBack _curWeapon;
		_weaponsListNumbers pushBack ({_x == _curWeapon} count _weapons);
	};
} forEach _weapons;



_ammoList = [];
_ammoListNumbers = [];


if (isNil "_ammoCargo") then {
	diag_log format ["Error en transmisión de munición. Tenía esto: %1 y estos contenedores: %2, el origen era un %3", magazineCargo _crate, everyContainer _crate,typeOf _crate];
}
else {
	{
		_curAmmo = _x;
		if ((not(_curAmmo in _ammoList)) and (not(_curAmmo in unlockedMagazines))) then {
			_ammoList pushBack _curAmmo;
			_ammoListNumbers pushBack ({_x == _curAmmo} count _ammoCargo);
		};
	} forEach  _ammoCargo;
};



_itemList = [];
_itemListNumbers = [];

{
	_curItem = _x;
	if ((not(_curItem in _itemList)) and (not(_curItem in unlockedItems))) then
		{
		_itemList pushBack _curItem;
		_itemListNumbers pushBack ({_x == _curItem} count _itemCargo);
	};
} forEach _itemCargo;


_totalRevenue = 0;

_weaponsRevenue = 0;
for [{_i=0}, {_i<count _weaponsList}, {_i=_i+1}] do {
	_weaponsRevenue = _weaponsRevenue + ((_weaponsListNumbers select _i) * _priceWeapon);
};

_ammoRevenue = 0;
for [{_i=0}, {_i<count _ammoList}, {_i=_i+1}] do {
	_ammoRevenue = _ammoRevenue + ((_ammoListNumbers select _i) * _priceAmmo);
};

_itemRevenue = 0;
for [{_i=0}, {_i<count _itemList}, {_i=_i+1}] do {
	_itemRevenue = _itemRevenue + ((_itemListNumbers select _i) * _priceItem);
};

diag_log format ["Weapons: %1; Ammo: %2; Items: $3", _weaponsRevenue,_ammoRevenue,_itemRevenue];
_totalRevenue = _weaponsRevenue + _ammoRevenue + _itemRevenue;

[0,_totalRevenue] remoteExec ["resourcesFIA",2];
hint "There is value to this. I will pay a fair price.";

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;