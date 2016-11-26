private ["_unit","_part","_dam","_damAccum","_injurer","_message"];

_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_injurer = _this select 3;

if (!alive _unit and !isPlayer _unit) exitWith
	{ _unit removeAllEventHandlers "HandleDamage"; 1 };

if (_dam > 0.95) then
{
	_damAccum = _unit getVariable ["damAccum", 0];
	_damAccum = _damAccum + _dam;
	_unit setVariable ["damAccum",_damAccum,true];

	_dam = 0.95;

	if (_unit getVariable ["inconsciente", false]) then
		{ _unit setVariable ["finishedoff",_injurer,true]; }
	else
	{
		_unit setVariable ["inconsciente",true,true];
		[_unit, _part, _injurer] spawn inconsciente;
	};
};

_dam