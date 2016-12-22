private ["_display","_childControl"];
_nul = createDialog "civ_vehicle";

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 0] call vehiclePrice];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 1] call vehiclePrice];
	_ChildControl = _display displayCtrl 106;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 2] call vehiclePrice];
	_ChildControl = _display displayCtrl 107;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 12] call vehiclePrice];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 13] call vehiclePrice];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 14] call vehiclePrice];
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 15] call vehiclePrice];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format [localize "STR_COST",[vfs select 16] call vehiclePrice];
};