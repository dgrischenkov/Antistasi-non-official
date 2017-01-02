if (!isServer and hasInterface) exitWith {};

_crate = _this select 0;


clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;