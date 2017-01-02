_g = _this select 0;
_p = _this select 1;

_soldier = _g createUnit [sol_MK, _p, [],0, "NONE"];
_soldier = _g createUnit [sol_MED, _p, [],0, "NONE"];
_soldier = _g createUnit [sol_ENG, _p, [],0, "NONE"];
_soldier = _g createUnit [sol_LAT2, _p, [],0, "NONE"];

_g selectLeader (units _g select 1);

_g