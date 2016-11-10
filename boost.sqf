if (!isServer) exitWith{};

scriptName "boost";

server setVariable ["hr",20,true];
server setVariable ["resourcesFIA",10000,true];
server setVariable ["prestigeNATO",30,true];

if !(hayRHS) then {
	unlockedWeapons pushBack "arifle_TRG21_F";
	unlockedWeapons pushBack "launch_NLAW_F";

	unlockedMagazines pushBack "30Rnd_556x45_Stanag";
	unlockedMagazines pushBack "NLAW_F";
	unlockedMagazines pushBack "HandGrenade";

	unlockedItems pushBack "ItemGPS";
	unlockedItems pushBack "ItemRadio";
	unlockedItems pushBack "optic_Arco";
	unlockedItems pushBack "V_Chestrig_oli";
	unlockedItems pushBack "H_HelmetIA";

	unlockedOptics pushBack "optic_Arco";
}
else {
	unlockedWeapons pushBack "rhs_weap_ak74m_camo";
	unlockedWeapons pushBack "rhs_weap_rpg26";

	unlockedMagazines pushBack "rhs_30Rnd_545x39_AK";
	unlockedMagazines pushBack "rhs_rpg26_mag";
	unlockedMagazines pushBack "rhs_mag_rgd5";

	unlockedItems pushBack "ItemGPS";
	unlockedItems pushBack "ItemRadio";
	unlockedItems pushBack "rhs_acc_1p29";
	unlockedItems pushBack "rhs_6b23_digi_rifleman";
	unlockedItems pushBack "rhs_6b28_ess_bala";

	unlockedOptics pushBack "rhs_acc_1p29";
};

publicVariable "unlockedWeapons";
publicVariable "unlockedMagazines";
publicVariable "unlockedItems";
publicVariable "unlockedOptics";

if (hayXLA) then {
	[caja,unlockedWeapons,true,false] call XLA_fnc_addVirtualWeaponCargo;
	[caja,unlockedMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
	[caja,unlockedItems,true,false] call XLA_fnc_addVirtualItemCargo;
} else {
	[caja,unlockedWeapons,true,false] call BIS_fnc_addVirtualWeaponCargo;
	[caja,unlockedMagazines,true,false] call BIS_fnc_addVirtualMagazineCargo;
	[caja,unlockedItems,true,false] call BIS_fnc_addVirtualItemCargo;
};

[unlockedWeapons] call weaponCheck;