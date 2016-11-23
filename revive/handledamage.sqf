private ["_unit","_part","_dam","_injurer"];

_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_injurer = _this select 3;

if (_dam > 0.95) then
{
	_dam = 0.95;

	if (_unit getVariable ["inconsciente", false]) then
	{
		_unit setVariable ["finishedoff",true,true];
	}
	else
	{
		_unit setVariable ["inconsciente",true,true];
		[_unit, _part, _injurer] spawn inconsciente;
	};
};

_dam