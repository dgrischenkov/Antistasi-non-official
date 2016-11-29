private ["_unit","_unitSide","_distanceMin","_rangeConst","_medico","_medicTo","_medicoCurrent","_nearUnit","_nearUnitSide","_inconsciente"];

_unit = _this select 0;
_unitSide = _this select 1;

_rangeConst = 150;

_distanceMin = _rangeConst;
_medico = objNull;

_medicoCurrent = _unit getVariable "medic_from";
if (!isNil "_medicoCurrent") then
{
	_distanceMin = _medicoCurrent distance _unit;
	_medico = _medicoCurrent;
};

{
	_nearUnit = _x select 4;
	_nearUnitSide = _x select 2;

	_inconsciente = _nearUnit getVariable "inconsciente";
	if (isNil "_inconsciente") then { _inconsciente = false; } else { _inconsciente = true; };

	_medicTo = _nearUnit getVariable "medic_to";
	if (isNil "_medicTo") then { _medicTo = false; } else { _medicTo = true; };

	if (
		([_nearUnitSide, _unitSide] call BIS_fnc_sideIsFriendly) and
		(_nearUnit != _unit) and
		(_nearUnit != Petros) and
		!(_inconsciente) and
		!(_medicTo) and
		!(isPlayer _nearUnit) and
		(alive _nearUnit) and
		(("Medikit" in (items _nearUnit)) or ("FirstAidKit" in (items _nearUnit))) and
		((_nearUnit distance _unit) < _distanceMin ) ) then
	{
		_distanceMin = _nearUnit distance _unit;
		_medico = _nearUnit;
	};
} forEach (_unit nearTargets _rangeConst);

if (!isNil "_medicoCurrent") then
{
	if (_medico == _medicoCurrent) exitWith { _medico };
};

if (!isNull _medico) then
{
	[_unit,_medico] spawn ayudar;
};

_medico