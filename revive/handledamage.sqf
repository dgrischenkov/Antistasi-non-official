private ["_unit","_part","_dam","_injurer"];

_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_injurer = _this select 3;

if (_dam > 0.95) then
{
	if (_unit getVariable ["inconsciente", false]) then
	{
		if (isPlayer _unit) then
		{
			_dam = 0;
			[_unit] spawn respawn;
			if (isPlayer _injurer) then { if (_injurer != _unit) then {[_injurer,60] remoteExec ["castigo",_injurer]}; };
		}
		else
		{
			_unit removeAllEventHandlers "HandleDamage";
		};
	}
	else
	{
		_dam = 0.9;
		if ( _part != "" ) then { removeHeadgear _unit; };
		[_unit] spawn inconsciente;
	};
};

_dam