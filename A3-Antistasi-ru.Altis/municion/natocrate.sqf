//if (!isServer) exitWith {};

private ["_crate","_num","_magazines"];

_crate = _this select 0;
_NATOSupp = _this select 1;

_weapons = bluRifle + bluSNPR + bluLMG + bluSmallWpn;
_lmgs = [bluLMG select 1];
_lmgs pushBack (bluLMG select 2);

_lmgAmmo = [bluLMGAmmo select 0];
_lmgAmmo pushBack (bluLMGAmmo select 1);

_smAmmo = [bluSmallAmmo select 0];
_smAmmo pushBack (bluSmallAmmo select 1);

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

// uncomment this control structure to return to the old style of ammo drops, at least for NATO
/*
if !(hayUSAF) then {
	for "_i" from 0 to round (_NATOSupp/20) do {
		_cosa = armasNATO call BIS_Fnc_selectRandom;
		_num = 1+ (floor random 4);
		_crate addWeaponCargoGlobal [_cosa, _num];
		_magazines = getArray (configFile / "CfgWeapons" / _cosa / "magazines");
		_crate addMagazineCargoGlobal [_magazines select 0, _num * 3];
	};
	for "_i" from 0 to round (_NATOSupp/20) do {
		_cosa = itemsAAF call BIS_Fnc_selectRandom;
		_num = floor random 5;
		_crate addItemCargoGlobal [_cosa, _num];
	};

	for "_i" from 0 to round (_NATOSupp/20) do {
		_cosa = municionNATO call BIS_Fnc_selectRandom;
		_crate addMagazineCargoGlobal [_cosa, _NATOSupp];
	};

	for "_i" from 1 to round (_NATOSupp/33) do {
		_cosa = antitanqueAAF call BIS_Fnc_selectRandom;
		_crate addWeaponCargoGlobal [_cosa, 1];
		_magazines = getArray (configFile / "CfgWeapons" / _cosa / "magazines");
		_crate addMagazineCargoGlobal [_magazines select 0, 3];
	};

	for "_i" from 1 to round (_NATOSupp/33) do {
		_cosa = opticasAAF call BIS_Fnc_selectRandom;
		if !(_cosa in unlockedItems) then {
			_crate addItemCargoGlobal [_cosa, 1 + (floor random 2)];
		};
	};
}
else {

	*/
	// sniper rifle
	_crate addWeaponCargoGlobal [bluSNPR select 2, 1];
	_crate addMagazineCargoGlobal [bluSNPRAmmo select 3, (3+(floor random 4))];

	// sniper rifle
	_crate addWeaponCargoGlobal [selectRandom bluSNPR,1];
	_crate addMagazineCargoGlobal [selectRandom bluSNPRAmmo, (3+(floor random 4))];

	// shotgun/smg/sidearm
	_crate addWeaponCargoGlobal [selectRandom bluSmallWpn, 1];
	_crate addMagazineCargoGlobal [selectRandom bluSmallAmmo, (4+(floor random 2))];

	// AT launcher
	_crate addWeaponCargoGlobal [bluAT select 1, 2];

	// accessory
	_crate addItemCargoGlobal [selectRandom (bluAttachments + bluScopes), 1];

	if (_NATOSupp > 80) then {
		// sniper rifle
		_crate addWeaponCargoGlobal [bluSNPR select 0, 1];
		_crate addItemCargoGlobal [bluScopes select 0, 1];
		_crate addMagazineCargoGlobal [bluSNPRAmmo select 0, (1+(floor random 4))];
		_crate addMagazineCargoGlobal [bluSNPRAmmo select 1, (1+(floor random 2))];

		// rifle with 40mm
		_crate addWeaponCargoGlobal [selectRandom bluGL, 3];
		_crate addMagazineCargoGlobal [selectRandom bluRifleAmmo, 3*(3+(floor random 4))];
		_crate addMagazineCargoGlobal [blu40mm select 0, 3*(2+(floor random 4))];
		_crate addMagazineCargoGlobal [selectRandom blu40mm, 3*(1+(floor random 3))];

		// LMG
		_crate addWeaponCargoGlobal [bluLMG select 0, 1];
		_crate addMagazineCargoGlobal [selectRandom _lmgAmmo, (2+(floor random 3))];

		// LMG
		_crate addWeaponCargoGlobal [selectRandom _lmgs, 1];
		_crate addMagazineCargoGlobal [bluLMGAmmo select 2, (2+(floor random 3))];

		// shotgun/SMG
		_crate addWeaponCargoGlobal [bluSmallWpn select 0, 1];
		_crate addMagazineCargoGlobal [selectRandom _smAmmo, (4+(floor random 6))];

		// sidearm
		_crate addWeaponCargoGlobal [bluSmallWpn select 1, 1];
		_crate addMagazineCargoGlobal [bluSmallAmmo select 2, (6+(floor random 3))];

		// AT launcher
		_crate addWeaponCargoGlobal [bluAT select 0, 1];
		_crate addMagazineCargoGlobal [selectRandom bluATMissile, (3+(floor random 3))];

		// AA launcher
		_crate addWeaponCargoGlobal [bluAA select 0, 1];
		_crate addMagazineCargoGlobal [selectRandom bluAAMissile, (3+(floor random 3))];

		// scopes
		_crate addItemCargoGlobal [selectRandom bluScopes, 2];

		// attachment
		_crate addItemCargoGlobal [selectRandom bluAttachments, 4];
	}
	else {
		if (_NATOSupp > 60) then {
			// sniper rifle
			_crate addWeaponCargoGlobal [bluSNPR select 0, 1];
			_crate addMagazineCargoGlobal [bluSNPRAmmo select 1, (2+(floor random 4))];

			// rifle with 40mm
			_crate addWeaponCargoGlobal [selectRandom bluGL, 2];
			_crate addMagazineCargoGlobal [selectRandom bluRifleAmmo, 2*(3+(floor random 4))];
			_crate addMagazineCargoGlobal [blu40mm select 0, 2*(2+(floor random 4))];
			_crate addMagazineCargoGlobal [selectRandom blu40mm, 2*(1+(floor random 3))];

			// LMG
			_crate addWeaponCargoGlobal [bluLMG select 0, 1];
			_crate addMagazineCargoGlobal [selectRandom _lmgAmmo, (2+(floor random 3))];

			// shotgun/SMG
			_crate addWeaponCargoGlobal [bluSmallWpn select 0, 1];
			_crate addMagazineCargoGlobal [bluSmallAmmo select 1, (4+(floor random 2))];

			// AT launcher
			_crate addWeaponCargoGlobal [bluAT select 0, 1];
			_crate addMagazineCargoGlobal [selectRandom bluATMissile, (3+(floor random 3))];

			// scopes
			_crate addItemCargoGlobal [selectRandom bluScopes, 1];

			// attachment
			_crate addItemCargoGlobal [selectRandom bluAttachments, 3];
		}
		else {
			if (_NATOSupp > 30) then {
				// sniper rifle
				_crate addWeaponCargoGlobal [bluSNPR select 1, 1];
				_crate addItemCargoGlobal [bluScopes select 0, 1];
				_crate addMagazineCargoGlobal [bluSNPRAmmo select 2, (4+(floor random 3))];

				// rifle with 40mm
				_crate addWeaponCargoGlobal [selectRandom bluGL, 1];
				_crate addMagazineCargoGlobal [selectRandom bluRifleAmmo, 1*(3+(floor random 4))];
				_crate addMagazineCargoGlobal [selectRandom blu40mm, 1*(2+(floor random 3))];

				// LMG
				_crate addWeaponCargoGlobal [selectRandom _lmgs, 1];
				_crate addMagazineCargoGlobal [bluLMGAmmo select 2, (2+(floor random 3))];

				// sidearm
				_crate addWeaponCargoGlobal [bluSmallWpn select 1, 1];
				_crate addMagazineCargoGlobal [bluSmallAmmo select 2, (6+(floor random 3))];

				// AA launcher
				_crate addWeaponCargoGlobal [bluAA select 0, 1];
				_crate addMagazineCargoGlobal [selectRandom bluAAMissile, (3+(floor random 3))];

				// attachment
				_crate addItemCargoGlobal [selectRandom bluAttachments, 2];
			};
		};
	};

	if (_NATOSupp > 60) then {
		// rifle
		_crate addWeaponCargoGlobal [selectRandom bluRifle, 3];
		_crate addMagazineCargoGlobal [selectRandom bluRifleAmmo, 3*(3+(floor random 4))];

		// vest
		_crate addItemCargoGlobal [bluVest select 0, 2];
	}
	else {
		// rifle
		_crate addWeaponCargoGlobal [selectRandom bluRifle, 2];
		_crate addMagazineCargoGlobal [selectRandom bluRifleAmmo, 2*(3+(floor random 4))];

		// vest
		_crate addItemCargoGlobal [bluVest select 1, 2];
	};
//};

if (hayRHS) then {
	_crate addItemCargoGlobal ["Laserdesignator",1];
	_crate addItemCargoGlobal ["Laserbatteries",1];
};

_int = round (_NATOSupp/10);
if (hayTFAR) then {
	if (lrRadio in unlockedBackpacks) then {
		_crate addBackpackCargoGlobal [lrRadio, 2];
	}
	else {
		_crate addBackpackCargoGlobal [lrRadio, 1 + _int];
	};
};

if (hayACE) then {
	_crate addMagazineCargoGlobal ["ACE_HuntIR_M203", 3];
	//_crate addBackpackCargoGlobal ["ACE_HuntIR_Box",1];
	_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1];
};

if (_NATOSupp < 50) then {
	_crate addBackpackCargoGlobal ["B_Static_Designator_01_weapon_F",1];
	_crate addItemCargoGlobal ["B_UavTerminal",1];
}
else {
	_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F",1];
	_crate addItemCargoGlobal ["B_UavTerminal",1];
};