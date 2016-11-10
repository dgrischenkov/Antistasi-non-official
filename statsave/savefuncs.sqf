fn_SaveStat =
{
	_varName = _this select 0;
	_varValue = _this select 1;
	if (!isNil "_varValue") then
		{
		profileNameSpace setVariable [_varName + serverID,_varValue];
		if (isDedicated) then {saveProfileNamespace};
		};
};

fn_LoadStat =
{
	_varName = _this select 0;
	_varValue = profileNameSpace getVariable (_varName + serverID);
	if(isNil "_varValue") exitWith {};
	[_varName,_varValue] call fn_SetStat;
};

//===========================================================================
//ADD VARIABLES TO THIS ARRAY THAT NEED SPECIAL SCRIPTING TO LOAD
/*specialVarLoads =
[
	"weaponsPlayer",
	"magazinesPlayer",
	"backpackPlayer",
	"mrkAAF",
	"mrkFIA",
	"prestigeNATO","prestigeCSAT", "hr","planesAAFcurrent","helisAAFcurrent","APCAAFcurrent","tanksAAFcurrent","armas","items","mochis","municion","fecha", "WitemsPlayer","prestigeOPFOR","prestigeBLUFOR","resourcesAAF","resourcesFIA","skillFIA"];
*/
specialVarLoads =
["puestosFIA","minas","mineFieldMrk","estaticas","cuentaCA","antenas","mrkAAF","mrkFIA","prestigeNATO","prestigeCSAT","posHQ", "hr","planesAAFcurrent","helisAAFcurrent","APCAAFcurrent","tanksAAFcurrent","armas","items","mochis","municion","fecha", "prestigeOPFOR","prestigeBLUFOR","resourcesAAF","resourcesFIA","skillFIA","skillAAF","distanciaSPWN","civPerc","minimoFPS","destroyedCities","garrison","tasks","gogglesPlayer","vestPlayer","outfit","hat","scorePlayer","rankPlayer","smallCAmrk","dinero","miembros","unlockedWeapons","unlockedItems","unlockedMagazines","unlockedBackpacks","vehInGarage","destroyedBuildings","personalGarage","idleBases","campsFIA","campsTony","enableFTold","enableMemAcc","campList"];
//THIS FUNCTIONS HANDLES HOW STATS ARE LOADED
fn_SetStat =
{
	_varName = _this select 0;
	_varValue = _this select 1;
	if(isNil '_varValue') exitWith {};
	if(_varName in specialVarLoads) then
	{
		//if(_varName == 'cuentaCA') then {cuentaCA = _varValue; publicVariable "cuentaCA";};
		if(_varName == 'cuentaCA') then {
			if (_varValue < 2700) then {cuentaCA = 2700} else {cuentaCA = _varValue};
			publicVariable "cuentaCA";
		};
		if(_varName == 'miembros') then {miembros = _varValue; publicVariable "miembros";};
		if(_varName == 'smallCAmrk') then {smallCAmrk = _varValue};
		if(_varName == 'mrkAAF') then {mrkAAF = _varValue;};
		if(_varName == 'mrkFIA') then {mrkFIA = _varValue;};
		if(_varName == 'gogglesPlayer') then {removeGoggles player; player addGoggles _varValue;};
		if(_varName == 'dinero') then {player setVariable ["dinero",_varValue,true];};
		if(_varName == 'vestPlayer') then {removeVest player; player addVest _varValue;};
		if(_varName == 'outfit') then {removeUniform player; player forceAddUniform _varValue;};
		if(_varName == 'hat') then {removeHeadGear player; player addHeadGear _varValue;};
		if(_varName == 'scorePlayer') then {player setVariable ["score",_varValue,true];};
		if(_varName == 'rankPlayer') then {player setRank _varValue; player setVariable ["rango",_varValue,true]};
		if(_varName == 'personalGarage') then {personalGarage = _varValue};
		/*if(_varName == 'weaponsPlayer') then {if(count _varValue > 0) then {removeAllWeapons player; {player addWeapon _x} forEach _varValue;};};
		if(_varName == 'magazinesPlayer') then {if(count _varValue > 0) then {{player removeMagazine _x} forEach (magazines player); {player addMagazine _x} forEach _varValue; reload player};};
		if(_varName == 'backpackPlayer') then {player addBackpack _varValue;};
		if(_varName == 'WitemsPlayer') then {removeAllPrimaryWeaponItems player; {player addPrimaryWeaponItem _x} forEach  _varValue;};
		*/
		if(_varName == 'unlockedWeapons') then
			{
			unlockedWeapons = _varvalue;
			lockedWeapons = lockedWeapons - unlockedWeapons;
			// XLA fixed arsenal
			if (hayXLA) then {
				[caja,unlockedWeapons,true] call XLA_fnc_addVirtualWeaponCargo;
			} else {
				[caja,unlockedWeapons,true] call BIS_fnc_addVirtualWeaponCargo;
			};
			publicVariable "unlockedWeapons";
			};
		if(_varName == 'unlockedBackpacks') then
			{
			unlockedBackpacks = _varvalue;
			lockedMochis = lockedMochis - unlockedBackpacks;
			// XLA fixed arsenal
			if (hayXLA) then {
				[caja,unlockedBackpacks,true] call XLA_fnc_addVirtualBackpackCargo;
			} else {
				[caja,unlockedBackpacks,true] call BIS_fnc_addVirtualBackpackCargo;
			};
			publicVariable "unlockedBackpacks";
			};
		if(_varName == 'unlockedItems') then
			{
			unlockedItems = _varValue;
			publicVariable "unlockedItems";
			// XLA fixed arsenal
			if (hayXLA) then {
				[caja,unlockedItems,true] call XLA_fnc_addVirtualItemCargo;
			} else {
				[caja,unlockedItems,true] call BIS_fnc_addVirtualItemCargo;
			};
			{
			if (_x in unlockedItems) then {unlockedOptics pushBack _x};
			} forEach opticasAAF;
			publicVariable "unlockedOptics";
			};
		if(_varName == 'unlockedMagazines') then
			{
			unlockedMagazines = _varValue;
			// XLA fixed arsenal
			if (hayXLA) then {
				[caja,unlockedMagazines,true] call XLA_fnc_addVirtualMagazineCargo;
			} else {
				[caja,unlockedMagazines,true] call BIS_fnc_addVirtualMagazineCargo;
			};
			publicVariable "unlockedMagazines";
			};
		if(_varName == 'prestigeNATO') then {server setVariable ["prestigeNATO",_varValue,true]};
		if(_varName == 'prestigeCSAT') then {server setVariable ["prestigeCSAT",_varValue,true]};
		if(_varName == 'hr') then {server setVariable ["HR",_varValue,true]};
		if(_varName == 'planesAAFcurrent') then
			{
			planesAAFcurrent = _varValue;
			if (planesAAFcurrent < 0) then {planesAAFcurrent = 0};
			publicVariable "planesAAFcurrent";
			if ((planesAAFcurrent > 0) and (count planesAAF < 2)) then {planesAAF = planesAAF + planes; publicVariable "planesAAF"}
			};
		if(_varName == 'helisAAFcurrent') then
			{
			helisAAFcurrent = _varValue;
			if (helisAAFcurrent < 0) then {helisAAFcurrent = 0};
			publicVariable "helisAAFcurrent";
			if (helisAAFcurrent > 0) then {
				planesAAF = planesAAF - heli_armed;
				planesAAF = planesAAF + heli_armed;
				publicVariable "planesAAF";
				};
			// if ((helisAAFcurrent > 0) and (_heli != "")) then {planesAAF = planesAAF + (selectRandom heli_armed); publicVariable "planesAAF"};
			};
		if(_varName == 'APCAAFcurrent') then
			{
			APCAAFcurrent = _varValue;
			if (APCAAFcurrent < 0) then {APCAAFcurrent = 0};
			publicVariable "APCAAFcurrent";
			if (APCAAFcurrent > 0) then {
				vehAAFAT = vehAAFAT -  vehAPC - vehIFV;
				vehAAFAT = vehAAFAT +  vehAPC + vehIFV;
				publicVariable "vehAAFAT";
				};
			};
		if(_varName == 'tanksAAFcurrent') then
			{
			tanksAAFcurrent = _varValue;
			if (tanksAAFcurrent < 0) then {tanksAAFcurrent = 0};
			publicVariable "tanksAAFcurrent";
			if (tanksAAFcurrent > 0) then {
				vehAAFAT = vehAAFAT - vehTank;
				vehAAFAT = vehAAFAT +  vehTank;
				publicVariable "vehAAFAT"
				};
			};
		if(_varName == 'fecha') then {setDate _varValue; forceWeatherChange};
		if(_varName == 'resourcesAAF') then {server setVariable ["resourcesAAF",_varValue,true]};
		if(_varName == 'resourcesFIA') then {server setVariable ["resourcesFIA",_varValue,true]};
		if(_varName == 'destroyedCities') then {destroyedCities = _varValue; publicVariable "destroyedCities"};
		if(_varName == 'destroyedBuildings') then
			{
			for "_i" from 0 to (count _varValue) - 1 do
				{
				_posBuild = _varValue select _i;
				if (typeName _posBuild == "ARRAY") then
					{
					_buildings = [];
					_dist = 5;
					while {count _buildings == 0} do
						{
						_buildings = nearestObjects [_posBuild, listMilBld, _dist];
						_dist = _dist + 5;
						};
					//stavros sidechat format ["%1",_buildings];
					if (count _buildings > 0) then
						{
						_milBuild = _buildings select 0;
						_milBuild setDamage 1;
						};
					destroyedBuildings = destroyedBuildings + [_posBuild];
					};
				};
			};
		if(_varName == 'skillFIA') then
			{
			server setVariable ["skillFIA",_varValue,true];
			{
			_coste = server getVariable _x;
			for "_i" from 1 to _varValue do
				{
				_coste = round (_coste + (_coste * (_i/280)));
				};
			server setVariable [_x,_coste,true];
			} forEach soldadosFIA;
			};
		if(_varName == 'skillAAF') then
			{
			skillAAF = _varvalue;
			{
			_coste = server getVariable _x;
			for "_i" from 1 to skillAAF do
				{
				_coste = round (_coste + (_coste * (_i/280)));
				};
			server setVariable [_x,_coste,true];
			} forEach soldadosAAF;
			publicVariable "skillAAF";
			};
		if(_varName == 'distanciaSPWN') then {distanciaSPWN = _varValue; publicVariable "distanciaSPWN"};
		if(_varName == 'civPerc') then {civPerc = _varValue; publicVariable "civPerc"};
		if(_varName == 'minimoFPS') then {minimoFPS=_varValue; publicVariable "minimoFPS"};
		if(_varName == 'vehInGarage') then {vehInGarage=_varValue; publicVariable "vehInGarage"};
		/*
		if(_varName == 'mineFieldMrk') then
			{
			{
			_mrk = createMarker [format ["Minefield%1", random 1000], _x];
			_mrk setMarkerShape "ELLIPSE";
			_mrk setMarkerSize [100,100];
			_mrk setMarkerType "hd_warning";
			_mrk setMarkerColor "ColorRed";
			_mrk setMarkerBrush "DiagGrid";
			mineFieldMrk pushBack _mrk;
			} forEach _varvalue;
			};
		*/
		if(_varName == 'minas') then
			{
			for "_i" from 0 to (count _varvalue) - 1 do
				{
				_tipoMina = _varvalue select _i select 0;
				switch _tipoMina do
					{
					case "APERSMine_Range_Ammo": {_tipoMina = "APERSMine"};
					case "ATMine_Range_Ammo": {_tipoMina = "ATMine"};
					case "APERSBoundingMine_Range_Ammo": {_tipoMina = "APERSBoundingMine"};
					case "SLAMDirectionalMine_Wire_Ammo": {_tipoMina = "SLAMDirectionalMine"};
					case "APERSTripMine_Wire_Ammo": {_tipoMina = "APERSTripMine"};
					case "ClaymoreDirectionalMine_Remote_Ammo": {_tipoMina = "Claymore_F"};
					};
				/*
				if (_tipoMina == "APERSMine_Range_Ammo") then {_tipoMina = "APERSMine"};
				if (_tipoMina == "ATMine_Range_Ammo") then {_tipoMina = "ATMine"};
				if (_tipoMina == "APERSBoundingMine_Range_Ammo") then {_tipoMina = "APERSBoundingMine"};
				if (_tipoMina == "SLAMDirectionalMine_Wire_Ammo") then {_tipoMina = "SLAMDirectionalMine"};
				APERSTripMine_Wire_Ammo APERSTripMine
				ClaymoreDirectionalMine_Remote_Ammo "Claymore_F"
				*/
				_posMina = _varvalue select _i select 1;
				_mina = createMine [_tipoMina, _posMina, [], 0];
				_detectada = _varvalue select _i select 2;
				if (_detectada) then {side_blue revealMine _mina};
				if (count (_varvalue select _i) > 3) then//borrar esto en febrero
					{
					_dirMina = _varvalue select _i select 3;
					_mina setDir _dirMina;
					};
				};
			};
		if(_varName == 'garrison') then
			{
			_marcadores = mrkFIA - puestosFIA - controles - ciudades;
			_garrison = _varvalue;
			for "_i" from 0 to (count _marcadores - 1) do
				{
				garrison setVariable [_marcadores select _i,_garrison select _i,true];
				};
			};
		if(_varName == 'puestosFIA') then
			{
			{
			_mrk = createMarker [format ["FIApost%1", random 1000], _x];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "loc_bunker";
			_mrk setMarkerColor "ColorYellow";
			if (isOnRoad _x) then {_mrk setMarkerText "FIA Roadblock"} else {_mrk setMarkerText "FIA Watchpost"};
			spawner setVariable [_mrk,false,true];
			puestosFIA pushBack _mrk;
			} forEach _varvalue;
			//mrkFIA = mrkFIA + puestosFIA;
			};
/*
		if(_varName == 'campsFIA') then
			{
			{
			_mrk = createMarker [format ["FIACamp%1", random 1000], _x];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "loc_bunker";
			_mrk setMarkerColor "ColorOrange";
			_nameOptions = campNames - usedCN;
			_txt = selectRandom _nameOptions;
			_mrk setMarkerText _txt;
			usedCN pushBack _txt;
			spawner setVariable [_mrk,false,true];
			campsFIA pushBack _mrk;
			} forEach _varvalue;
			};

		if (_varName == 'campList') then
			{
			{
			_mrk = createMarker [format ["FIACamp%1", random 1000], (_x select 0)];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "loc_bunker";
			_mrk setMarkerColor "ColorOrange";
			_txt = _x select 1;
			_mrk setMarkerText _txt;
			usedCN pushBackUnique _txt;
			spawner setVariable [_mrk,false,true];
			campList pushBack [[_mrk, _txt]];
			} forEach _varvalue;
			};
*/
		if ((_varName == 'campList') || (_varName == 'campsFIA')) then {
			if (_varName == 'campList') then {
				if (count _varvalue != 0) then {
					cList = true;

					{
						_mrk = createMarker [format ["FIACamp%1", random 1000], (_x select 0)];
						_mrk setMarkerShape "ICON";
						_mrk setMarkerType "loc_bunker";
						_mrk setMarkerColor "ColorOrange";
						_txt = _x select 1;
						_mrk setMarkerText _txt;
						usedCN pushBackUnique _txt;
						spawner setVariable [_mrk,false,true];
						campList pushBack [_mrk, _txt];
						campsFIA pushBack _mrk;
					} forEach _varvalue;
				};
			}
			else {
				if !(cList) then {
					{
						_mrk = createMarker [format ["FIACamp%1", random 1000], _x];
						_mrk setMarkerShape "ICON";
						_mrk setMarkerType "loc_bunker";
						_mrk setMarkerColor "ColorOrange";
						_nameOptions = campNames - usedCN;
						_txt = selectRandom _nameOptions;
						_mrk setMarkerText _txt;
						usedCN pushBack _txt;
						spawner setVariable [_mrk,false,true];
						campsFIA pushBack _mrk;
					} forEach _varvalue;
				};
			};
		};

		if(_varName == 'campsTony') then
			{
			{
			_mrk = createMarker [format ["TonysCamp%1", random 1000], _x];
			_mrk setMarkerShape "ICON";
			_mrk setMarkerType "loc_bunker";
			_mrk setMarkerColor "ColorOrange";
			_mrk setMarkerText "Tony";
			spawner setVariable [_mrk,false,true];
			campsTony pushBack _mrk;
			} forEach _varvalue;
			};

		if(_varName == 'enableFTold') then {server setVariable ["enableFTold",_varValue,true]};
		if(_varName == 'enableMemAcc') then {server setVariable ["enableMemAcc",_varValue,true]};


		if(_varName == 'antenas') then
			{
			antenasmuertas = _varvalue;
			for "_i" from 0 to (count _varvalue - 1) do
			    {
			    _posAnt = _varvalue select _i;
			    _mrk = [mrkAntenas, _posAnt] call BIS_fnc_nearestPosition;
			    _antena = [antenas,_mrk] call BIS_fnc_nearestPosition;
			    antenas = antenas - [_antena];
			    _antena removeAllEventHandlers "Killed";
			    sleep 1;
			    _antena setDamage 1;
			    deleteMarker _mrk;
			    };
			antenasmuertas = _varvalue;
			publicVariable "antenas";
			};
		if(_varName == 'armas') then
			{
			clearWeaponCargoGlobal caja;
			{caja addWeaponCargoGlobal [_x,1]} forEach _varValue;
			};
		if(_varName == 'municion') then
			{
			clearMagazineCargoGlobal caja;
			{caja addMagazineCargoGlobal [_x,1]} forEach _varValue;
			};
		if(_varName == 'items') then
			{
			clearItemCargoGlobal caja;
			{caja addItemCargoGlobal [_x,1]} forEach _varValue;
			};
		if(_varName == 'mochis') then
			{
			clearBackpackCargoGlobal caja;
			{caja addBackpackCargoGlobal [_x,1]} forEach _varValue;
			};
		if(_varname == 'prestigeOPFOR') then
			{
			for "_i" from 0 to (count ciudades) - 1 do
				{
				_ciudad = ciudades select _i;
				_datos = server getVariable _ciudad;
				_numCiv = _datos select 0;
				_numVeh = _datos select 1;
				_prestigeOPFOR = _varvalue select _i;
				_prestigeBLUFOR = _datos select 3;
				_datos = [_numCiv,_numVeh,_prestigeOPFOR,_prestigeBLUFOR];
				server setVariable [_ciudad,_datos,true];
				};
			};
		if(_varname == 'prestigeBLUFOR') then
			{
			for "_i" from 0 to (count ciudades) - 1 do
				{
				_ciudad = ciudades select _i;
				_datos = server getVariable _ciudad;
				_numCiv = _datos select 0;
				_numVeh = _datos select 1;
				_prestigeOPFOR = _datos select 2;
				_prestigeBLUFOR = _varvalue select _i;
				_datos = [_numCiv,_numVeh,_prestigeOPFOR,_prestigeBLUFOR];
				server setVariable [_ciudad,_datos,true];
				};
			};
		if(_varname == 'idleBases') then
			{
			{
			server setVariable [(_x select 0),(_x select 1),true];
			} forEach _varValue;
			};
		if(_varName == 'posHQ') then
			{
			{if (getMarkerPos _x distance _varvalue < 1000) then
				{
				mrkAAF = mrkAAF - [_x];
				mrkFIA = mrkFIA + [_x];
				};
			} forEach controles;
			"respawn_west" setMarkerPos _varValue;
			petros setPos _varvalue;
			[] spawn buildHQ;
			};
		if(_varname == 'estaticas') then
			{
			for "_i" from 0 to (count _varvalue) - 1 do
				{
				_tipoVeh = _varvalue select _i select 0;
				_posVeh = _varvalue select _i select 1;
				_dirVeh = _varvalue select _i select 2;

				//experimental
				_veh = _tipoVeh createVehicle _posVeh;
				///experimental

				//_veh = createVehicle [_tipoVeh,_posVeh,[],0,"NONE"];
				_veh setDir _dirVeh;
				//if (_veh isKindOf "StaticWeapon") then
				if (_tipoVeh in (allStatMGs + allStatATs + allStatAAs + allStatMortars)) then
					{
					staticsToSave pushBack _veh;
					};
				[_veh] spawn VEHinit;
				};
			publicVariable "staticsToSave";
			};
		if(_varname == 'tasks') then
			{
			{
			if (_x == "AtaqueAAF") then
				{
				[] call ataqueAAF;
				}
			else
				{
				if (_x == "DEF_HQ") then
					{
					[] spawn ataqueHQ;
					}
				else
					{
					[_x,true] call missionRequest;
					};
				};
			} forEach _varvalue;
			};
	}
	else
	{
		call compile format ["%1 = %2",_varName,_varValue];
	};
};

//==================================================================================================================================================================================================
saveFuncsLoaded = true;