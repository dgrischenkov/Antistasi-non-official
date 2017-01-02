_pos = _this select 0;

{if ((side _x == side_blue) and (_x distance _pos < 20)) then {_x setDamage 0}} forEach allUnits;

hint "Your stomach stopped growling.\n\n Get back in the fight, soldier!";