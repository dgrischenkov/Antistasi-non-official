private ["_unit","_medico","_timeOut"];
_unit = _this select 0;
_medico = _this select 1;

_timeOut = time + 120;

_medico setVariable ["medic_to",_unit,true];
_unit setVariable ["medic_from",_medico,true];

[_medico,_unit] call cubrirConHumo;
_medico doMove getPosATL _unit;

while { (alive _unit) and (alive _medico) and (time < _timeOut) and
	(_unit getVariable ["inconsciente",false]) and
	((_unit getVariable "medic_from") == _medico) } do
{
	if (_unit distance _medico < 4) then
	{
		_medico action ["HealSoldier",_unit];
	};

	sleep 10;
};

_medico setVariable ["medic_to",nil,true];

if ((_unit getVariable "medic_from") == _medico) then
	{ _unit setVariable ["medic_from",objNull,true]; };
