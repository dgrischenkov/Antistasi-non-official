_vehicle = _this select 0;
_tempGroup = _this select 1;
_soldiers = _this select 2;
_origin = _this select 3;

_gSize = _vehicle emptyPositions "cargo";
for "_i" from 1 to _gSize do {
	_soldier = _tempGroup createUnit [(infList_sniper + infList_special + infList_auto + infList_regular + infList_regular) call BIS_fnc_selectRandom, _origin, [],0, "NONE"];

					[_soldier] spawn genInit;
					_soldier assignAsCargo _vehicle;
					_soldier moveInCargo _vehicle;
					_soldiers pushBack _soldier;
					};
				_tempGroup selectLeader (units _tempGroup select 1);

[_vehicle, _tempGroup, _soldiers]