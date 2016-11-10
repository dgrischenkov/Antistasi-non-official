_t = _this select 0;

private ["_item","_pos"];

_objs = [];

if (_t == "delete") exitWith {
	{
    	if ((  str typeof _x find "Land_Camping_Light_F" > -1
        	or str typeof _x find "CamoNet_BLUFOR_open_F" > -1))
		then {
        	_objs pushBack _x;
   		};
	} forEach nearestObjects [getPos fuego, [], 40];

	{
		_x enableSimulation false;
   		_x hideObjectGlobal true;
	} foreach _objs;
};

_pos = [getPos fuego, 10, floor(random 361)] call BIS_Fnc_relPos;

if (_t == "lantern") then {
	_item = "Land_Camping_Light_F";
	_pos = [getPos fuego, 2, floor(random 361)] call BIS_Fnc_relPos;
};

if (_t == "net") then {
	_item = "CamoNet_BLUFOR_open_F";
};

_ci = _item createVehicle [0,0,0];
_ci setpos _pos;
_ci addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == stavros)"];

// for later: large: CamoNet_BLUFOR_big_F -- small: CamoNet_BLUFOR_F