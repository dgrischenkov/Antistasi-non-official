private ["_posicionTel","_marcador","_marcadores"];

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload",
	{
	0 = _this spawn
		{
		_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
		hintSilent "";
		};
	}];

_marcadores = mrkAAF;

_posicionTel = [3615.0,10280.0,0];

if (true) then
	{
	if (isNil "placementDone") then
		{
		{
		if (getMarkerPos _x distance _posicionTel < 1000) then
			{
			mrkAAF = mrkAAF - [_x];
			mrkFIA = mrkFIA + [_x];
			};
		} forEach controles;
		publicVariable "mrkAAF";
		publicVariable "mrkFIA";
		petros setPos _posicionTel;
		}
	else
		{
		_viejo = petros;
		grupoPetros = createGroup side_blue;
		publicVariable "grupoPetros";
        petros = grupoPetros createUnit ["B_G_officer_F", _posicionTel, [], 0, "NONE"];
        grupoPetros setGroupId ["Petros","GroupColor4"];
        petros setIdentity "amiguete";
        petros setName "Petros";
        petros disableAI "MOVE";
        petros disableAI "AUTOTARGET";
        if (group _viejo == grupoPetros) then {[[Petros,"mission"],"flagaction"] call BIS_fnc_MP;} else {[[Petros,"buildHQ"],"flagaction"] call BIS_fnc_MP;};
        _nul= call compile preprocessFileLineNumbers "initPetros.sqf";
        deleteVehicle _viejo;
        publicVariable "petros";
		};
	"respawn_west" setMarkerPos _posicionTel;
	"respawn_west" setMarkerAlpha 1;
	if (isMultiplayer) then {hint "Please wait while moving HQ Assets to selected position";sleep 5};
	_pos = [_posicionTel, 3, getDir petros] call BIS_Fnc_relPos;
	fuego setPos _pos;
	_rnd = getdir Petros;
	if (isMultiplayer) then {sleep 5};
	_pos = [getPos fuego, 3, _rnd] call BIS_Fnc_relPos;
	caja setPos _pos;
	_rnd = _rnd + 45;
	_pos = [getPos fuego, 3, _rnd] call BIS_Fnc_relPos;
	mapa setPos _pos;
	mapa setDir ([fuego, mapa] call BIS_fnc_dirTo);
	_rnd = _rnd + 45;
	_pos = [getPos fuego, 3, _rnd] call BIS_Fnc_relPos;
	bandera setPos _pos;
	_rnd = _rnd + 45;
	_pos = [getPos fuego, 3, _rnd] call BIS_Fnc_relPos;
	cajaVeh setPos _pos;
	if (isNil "placementDone") then {if (isMultiplayer) then {{_x setPos getPos petros} forEach playableUnits} else {stavros setPos (getMarkerPos "respawn_west")}} else {stavros allowDamage true};
	if (isMultiplayer) then
		{
		caja hideObjectGlobal false;
		cajaVeh hideObjectGlobal false;
		mapa hideObjectGlobal false;
		fuego hideObjectGlobal false;
		bandera hideObjectGlobal false;
		}
	else
		{
		caja hideObject false;
		cajaVeh hideObject false;
		mapa hideObject false;
		fuego hideObject false;
		bandera hideObject false;
		};
	openmap [false,false];
	};
"FIA_HQ" setMarkerPos (getMarkerPos "respawn_west");
posHQ = getMarkerPos "respawn_west"; publicVariable "posHQ";
if (isNil "placementDone") then {placementDone = true; publicVariable "placementDone"};