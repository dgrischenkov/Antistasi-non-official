private ["_unit","_muerto","_killer"];

_unit = _this select 0;
_unit setVariable ["BLUFORSpawn",true,true];

_unit allowFleeing 0;
_unit setSkill 0.7;

if (sunOrMoon < 1) then
	{
	if (bluIR in primaryWeaponItems _unit) then {_unit action ["IRLaserOn", _unit]};
	};

_EHkilledIdx = _unit addEventHandler ["killed", {
	_muerto = _this select 0;
	_muerto setVariable ["BLUFORSpawn",nil,true];
	[_muerto] spawn postmortem;
	_nul = [0.25,0,getPos _muerto] remoteExec ["citySupportChange",2];
	//_nul = [-1,0] remoteExec ["prestige",2];
	//if (group _muerto == group player) then {arrayids = arrayids + [name _muerto]};
	}];

