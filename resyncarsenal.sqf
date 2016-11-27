if (!isServer) exitWith {};

scriptName "resyncArsenal";

publicVariable "unlockedWeapons";
publicVariable "unlockedMagazines";
publicVariable "unlockedItems";
publicVariable "unlockedBackpacks";

// XLA fixed arsenal
if (hayXLA) then {
	_weapons = caja call XLA_fnc_getVirtualWeaponCargo;
	_magazines = caja call XLA_fnc_getVirtualMagazineCargo;
	_items = caja call XLA_fnc_getVirtualItemCargo;
	_backpacks = caja call XLA_fnc_getVirtualBackpackCargo;

	[caja,_weapons,true] call XLA_fnc_removeVirtualWeaponCargo;
	[caja,_magazines,true] call XLA_fnc_removeVirtualMagazineCargo;
	[caja,_items,true] call XLA_fnc_removeVirtualItemCargo;
	[caja,_backpacks,true] call XLA_fnc_removeVirtualBackpackCargo;

	[caja,unlockedWeapons,true,false] call XLA_fnc_addVirtualWeaponCargo;
	[caja,unlockedMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
	[caja,unlockedItems,true,false] call XLA_fnc_addVirtualItemCargo;
	[caja,unlockedBackpacks,true,false] call XLA_fnc_addVirtualBackpackCargo;
} else {
	// _weapons = caja call BIS_fnc_getVirtualWeaponCargo;
	// _magazines = caja call BIS_fnc_getVirtualMagazineCargo;
	// _items = caja call BIS_fnc_getVirtualItemCargo;
	// _backpacks = caja call BIS_fnc_getVirtualBackpackCargo;

	// [caja,_weapons,true] call BIS_fnc_removeVirtualWeaponCargo;
	// [caja,_magazines,true] call BIS_fnc_removeVirtualMagazineCargo;
	// [caja,_items,true] call BIS_fnc_removeVirtualItemCargo;
	// [caja,_backpacks,true] call BIS_fnc_removeVirtualBackpackCargo;

	// [caja,unlockedWeapons,true,false] call BIS_fnc_addVirtualWeaponCargo;
	// [caja,unlockedMagazines,true,false] call BIS_fnc_addVirtualMagazineCargo;
	// [caja,unlockedItems,true,false] call BIS_fnc_addVirtualItemCargo;
	// [caja,unlockedBackpacks,true,false] call BIS_fnc_addVirtualBackpackCargo;
};

[unlockedWeapons] spawn weaponCheck;

_updated = [] call arsenalManage;

[[petros,"hint","Arsenal synchronized"],"commsMP"] call BIS_fnc_MP;