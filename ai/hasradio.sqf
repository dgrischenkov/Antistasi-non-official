private ["_unit"];

_unit = _this select 0;

_result = false;

if (hayTFAR) then {
	{
		if (toLower _x find "tf_anprc152" >= 0) then {
			_result = true;
		};
	} forEach assignedItems _unit;
}
else {
	if ("ItemRadio" in assignedItems _unit) then {_result = true};
};
_result