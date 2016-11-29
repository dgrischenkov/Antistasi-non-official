private ["_unit","_unitSide","_distanceMin","_rangeConst","_medico","_medicTo","_medicIsBeazi","_medicoCurrent","_nearUnit","_nearUnitSide"];

_unit = _this select 0;
_unitSide = _this select 1;

_rangeConst = 150;

_distanceMin = _rangeConst;
_medico = objNull;
_medicoCurrent = _unit getVariable "medic_from";

{
	_nearUnit = _x select 4;
	_nearUnitSide = _x select 2;

	_medicIsBeazi = false;
	_medicTo = _nearUnit getVariable "medic_to";

	if (!isNil "_medicTo") then
	{
		if ( !isNull _medicTo ) then
		{
			if ( _medicTo != _unit ) then
			{
				_medicIsBeazi = true;
			};
		};
	};

	if (
		([_nearUnitSide, _unitSide] call BIS_fnc_sideIsFriendly) and
		(_nearUnit != _unit) and
		(_nearUnit != Petros) and
		!(_nearUnit getVariable ["inconsciente", false]) and
		!(_medicIsBeazi) and
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