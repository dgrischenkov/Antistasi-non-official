private ["_unit","_unitSide","_distanceMin","_rangeConst","_medico","_nearUnit","_nearUnitSide","_inconsciente"];

_unit = _this select 0;
_unitSide = _this select 1;

_rangeConst = 150;

_distanceMin = _rangeConst;
_medico = objNull;

{
	_nearUnit = _x select 4;
	_nearUnitSide = _x select 2;

	_inconsciente = _nearUnit getVariable "inconsciente";
	if (isNil "_inconsciente") then { _inconsciente = false; };

	if ( (_nearUnitSide == _unitSide) and (_nearUnit != Petros) and !(_inconsciente) and !(isPlayer _nearUnit) ) then
	{
		if ( ("Medikit" in (items _nearUnit)) or ("FirstAidKit" in (items _nearUnit)) ) then
		{
			if ( (_nearUnit distance _unit) < _distanceMin ) then
			{
				_distanceMin = _nearUnit distance _unit;
				_medico = _nearUnit;
			};
		};
	};
} forEach (_unit nearTargets _rangeConst);

if (!isNull _medico) then
{
	[_unit,_medico] spawn ayudar;
};

_medico