private ["_unit","_part","_dam","_injurer"];
_unit = _this select 0;
_part = _this select 1;
_dam = _this select 2;
_source = _this select 3;
_proj = _this select 4;

//faltará todos los checks de petros, y de castigo, en stavros init habrá que esperar a que no esté inconsciente, también los checks de owner

/*
if ((captive _source) || (side _source == side_blue)) then {
	[_source,false] remoteExec ["setCaptive",_source];
	reportedVehs pushBackUnique (vehicle _source);
	publicVariable "reportedVehs";
};
*/

if (_part == "") then
	{
	if (_dam > 0.6) then {[_unit,_unit] spawn cubrirConHumo};
	}
else
	{
	if (_dam > 0.95) then
		{
		if (_part == "head") then
			{
			removeHeadgear _unit;
			/*
			if (headgear _unit in cascos) then
				{

				//_dam = 0;
				};
			*/
			};
		_dam = 0.9;
		};
	};
//stavros sidechat format ["Final Daño_ %1. Parte %2",_dam,_part];
_dam