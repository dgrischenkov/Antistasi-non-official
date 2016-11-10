if (!isServer and hasInterface) exitWith {};

/*
0: position of the composition
1: type of the composition
*/

_pos = _this select 0;
_type = _this select 1;
_objs = [];

if (_type == "cmpOP") exitWith {
	{
	 if (  str typeof _x find "Land_HBarrier_3_F" > -1
     	or str typeof _x find "Land_HBarrier_5_F" > -1)
		then {
        	_objs pushBack _x;
   		};
	} forEach nearestObjects [_pos, [], 80];

	{
		_x enableSimulation false;
	    _x hideObjectGlobal true;
	} foreach _objs;
};

if (_type == "NATORB") exitWith {
	{
		 if (  str typeof _x find "Land_CncBarrier_F" > -1
	     	or str typeof _x find "Land_BagBunker_Tower_F" > -1
	        or str typeof _x find "RoadBarrier_F" > -1)
			then {
	        	_objs pushBack _x;
	   		};
	} forEach nearestObjects [_pos, [], 15];

	{
		_x enableSimulation false;
	    _x hideObjectGlobal true;
	} foreach _objs;
};

if (_type == "cmpMTN") exitWith {
	{
		 if (  str typeof _x find "Land_HBarrier" > -1
	     	or str typeof _x find "Land_BagFence" > -1

	     	or str typeof _x find "GroundWeaponHolder" > -1
	     	or str typeof _x find "Land_Razorwire" > -1


	        or str typeof _x find "CamoNet_OPFOR_open_F" > -1)
			then {
	        	_objs pushBack _x;
	   		};
	} forEach nearestObjects [_pos, [], 80];

	{
		_x enableSimulation false;
	    _x hideObjectGlobal true;
	} foreach _objs;
};