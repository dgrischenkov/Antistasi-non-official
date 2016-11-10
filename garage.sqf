private ["_pool","_vehInGarage","_chequeo"];

_pool = true;
if (_this select 0) then {_pool = false};
if (_pool and (not([player] call isMember))) exitWith {hint "You cannot access the Garage as you are guest in this server"};
if (player != player getVariable "owner") exitWith {hint "You cannot access the Garage while you are controlling AI"};
_chequeo = false;
{
	if (((side _x == side_red) or (side _x == side_green)) and (_x distance player < 500) and (not(captive _x))) then {_chequeo = true};
} forEach allUnits;

if (_chequeo) exitWith {Hint "You cannot manage the Garage with enemies nearby"};
vehInGarageShow = [];
if (_pool) then {vehInGarageShow = vehInGarage} else {vehInGarageShow = personalGarage};

if (count vehInGarageShow == 0) exitWith {hintC "The Garage is empty"};
garagePos = [];
garagePos = position player findEmptyPosition [5,45,"B_MBT_01_TUSK_F"];
if (count garagePos == 0) exitWith {hintC "Couldn't find a safe position to spawn the vehicle, or the area is too crowded to spawn it safely"};

cuentaGarage = 0;

//garageVeh = (vehInGarage select cuentaGarage) createVehicle garagePos;
garageVeh = createVehicle [(vehInGarageShow select cuentaGarage), garagePos, [], 0, "NONE"];
garageVeh allowDamage false;
garageVeh enableSimulationGlobal false;
/*
cam = "camera" camcreate garagePos;
cam cameraeffect ["internal","back"];
cam campreparefocus [-1,-1];
cam campreparefov 0.35;
cam camcommitprepared 0;
cameraEffectEnableHUD true;
showcinemaborder false;
*/

Cam = "camera" camCreate (player modelToWorld [0,0,4]);
Cam camSetTarget garagePos;
Cam cameraEffect ["internal", "BACK"];
//Cam camCommand "Manual On";
Cam camCommit 0;

["<t size='0.6'>Garage Keys.<t size='0.5'><br/>A-D Navigate<br/>SPACE to Select<br/>ENTER to Exit",0,0,5,0,0,4] spawn bis_fnc_dynamicText;

garageKeys = (findDisplay 46) displayAddEventHandler ["KeyDown",
		{
		_handled = false;
		_salir = false;
		_cambio = false;
		_comprado = false;
		["<t size='0.6'>Garage Keys.<t size='0.5'><br/>A-D Navigate<br/>SPACE to Select<br/>ENTER to Exit",0,0,5,0,0,4] spawn bis_fnc_dynamicText;
		if (_this select 1 == 57) then
			{
			_salir = true;
			_comprado = true;
			};
		if (_this select 1 == 28) then
			{
			_salir = true;
			deleteVehicle garageVeh;
			};
		if (_this select 1 == 32) then
			{
			if (cuentaGarage + 1 > (count vehInGarageShow) - 1) then {cuentaGarage = 0} else {cuentaGarage = cuentaGarage + 1};
			_cambio = true;
			//["",0,0,0.34,0,0,4] spawn bis_fnc_dynamicText;
			};
		if (_this select 1 == 30) then
			{
			if (cuentaGarage - 1 < 0) then {cuentaGarage = (count vehInGarageShow) - 1} else {cuentaGarage = cuentaGarage - 1};
			_cambio = true;
			//["",0,0,0.34,0,0,4] spawn bis_fnc_dynamicText;
			};
		if (_cambio) then
			{
			deleteVehicle garageVeh;
			_tipo = vehInGarageShow select cuentaGarage;
			if (isNil "_tipo") then {_salir = true};
			if (typeName _tipo != typeName "") then {_salir = true};
			if (!_salir) then
				{
				garageVeh = createVehicle [_tipo, garagePos, [], 0, "NONE"];
				garageVeh allowDamage false;
				garageVeh enableSimulationGlobal false;
				};
			};
		if (_salir) then
			{
			Cam camSetPos position player;
			Cam camCommit 1;
			Cam cameraEffect ["terminate", "BACK"];
			camDestroy Cam;
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", garageKeys];
			if (!_comprado) then
				{
				["",0,0,5,0,0,4] spawn bis_fnc_dynamicText;
				}
			else
				{
				[garageVeh] spawn VEHinit;
				["<t size='0.6'>Vehicle retrieved from Garage",0,0,3,0,0,4] spawn bis_fnc_dynamicText;
				_pool = false;
				if (vehInGarageShow isEqualTo vehInGarage) then {_pool = true};
				_newArr = [];
				_found = false;
				if (_pool) then
					{
					{
					if ((_x != (vehInGarageShow select cuentaGarage)) or (_found)) then {_newArr pushBack _x} else {_found = true};
					} forEach vehInGarage;
					vehInGarage = _newArr;
					publicVariable "vehInGarage";
					}
				else
					{
					{
					if ((_x != (vehInGarageShow select cuentaGarage)) or (_found)) then {_newArr pushBack _x} else {_found = true};
					} forEach personalGarage;
					personalGarage = _newArr;
					["personalGarage",_newArr] call fn_SaveStat;
					garageVeh setVariable ["duenyo",getPlayerUID player,true];
					};
				if (garageVeh isKindOf "StaticWeapon") then {staticsToSave = staticsToSave + [garageVeh]; publicVariable "staticsToSave"};
				clearMagazineCargoGlobal garageVeh;
				clearWeaponCargoGlobal garageVeh;
				clearItemCargoGlobal garageVeh;
				clearBackpackCargoGlobal garageVeh;
				garageVeh allowDamage true;
				garageVeh enableSimulationGlobal true;
				};
			};
		_handled;
		}];

