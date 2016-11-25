private ["_unit","_part","_dam","_injurer","_message","_timeOfDead"];

_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_injurer = _this select 3;

if (_dam > 0.95) then
{
	_dam = 0.95;

	if (_unit getVariable ["inconsciente", false]) then
	{
		_unit setVariable ["finishedoff",_injurer,true];
	}
	else
	{
		if ( vehicle _unit != _unit ) then
		{
			if ( isNull _injurer ) then { _message = localize "STR_RESPAWN_INCONSCIENTE_FELL_OF_BURNED"; }
			else
			{
				if (isPlayer _injurer)
				then { _message = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_PLAYER", name _injurer]; }
				else { _message = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_BOT", name _injurer]; };
			};
			[ ( localize "STR_RESPAWN_HANDLEDAMAGE_IN_VEH" ) + " " + _message,0,0,10,0,0,4] spawn bis_fnc_dynamicText;

			_unit setVariable ["timeOfDead",time,true];
			_dam = 1;
		}
		else
		{
			if ( vehicle _injurer == _injurer ) then
			{
				_timeOfDead = _unit getVariable "timeOfDead";
				if (!isNil "_timeOfDead") then
				{
					if ( (_timeOfDead + 5) < time) then
					{
						_unit setVariable ["inconsciente",true,true];
						[_unit, _part, _injurer] spawn inconsciente;
					};
				};
			};
		};
	};
};

_dam