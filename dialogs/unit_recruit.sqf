private ["_display","_childControl"];
_nul = createDialog "unit_recruit";

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
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_engineer_F"];
	_ChildControl = _display displayCtrl 108;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_exp_F"];
	_ChildControl = _display displayCtrl 109;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_GL_F"];
	_ChildControl = _display displayCtrl 110;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_M_F"];
	_ChildControl = _display displayCtrl 111;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "B_G_Soldier_LAT_F"];
	_ChildControl = _display displayCtrl 112;
	_ChildControl  ctrlSetTooltip format ["Cost: %1 €",server getVariable "Soldier_AA"];
};