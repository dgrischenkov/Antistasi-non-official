private ["_unit","_medico","_timeOut"];
_unit = _this select 0;
_medico = _this select 1;

_timeOut = time + 120;

[_medico,_unit] call cubrirConHumo;

while { (alive _unit) and (alive _medico) and (time < _timeOut) and (_unit getVariable ["inconsciente",false]) } do
{
	_medico doMove getPosATL _unit;

	if (_unit distance _medico < 3) then
	{
		_medico action ["HealSoldier",_unit];
	};

	sleep 10;
};
