private ["_unit","_muerto","_killer","_skill","_caja"];

_unit = _this select 0;

_unit setVariable ["OPFORSpawn",true,true];

_unit addEventHandler ["HandleDamage",handleDamageAAF];

_unit addEventHandler ["killed",AAFKilledEH];

if (sunOrMoon < 1) then
	{
	if (opIR in primaryWeaponItems _unit) then {_unit action ["IRLaserOn", _unit]};
	};