﻿waitUntil {!isNull player};
waitUntil {player == player};
player removeweaponGlobal "itemmap";
player removeweaponGlobal "itemgps";
player addAction ["<t color='#aaccaa'>" + localize "STR_TUTORIAL_ACTION" + "</t>","howtoplay = 1","",-740,false,true,"",""];
if (isMultiplayer) then
	{
	[] execVM "briefing.sqf";
	if (!isServer) then
		{
		call compile preprocessFileLineNumbers "initVar.sqf";
		if (!hasInterface) then {call compile preprocessFileLineNumbers "roadsDB.sqf"};
		call compile preprocessFileLineNumbers "initFuncs.sqf";
		};
	};

_isJip = _this select 1;
private ["_colorWest", "_colorEast"];
_colorWest = west call BIS_fnc_sideColor;
_colorEast = east call BIS_fnc_sideColor;
{
_x set [3, 0.33]
} forEach [_colorWest, _colorEast];
_introShot =
	[
    position petros, // Target position
    "Altis Island", // SITREP text
    50, //  altitude
    50, //  radius
    90, //  degrees viewing angle
    0, // clockwise movement
    [
    	["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorWest, markerPos "insertMrk", 1, 1, 0, "Insertion Point", 0],
        ["\a3\ui_f\data\map\markers\nato\o_inf.paa", _colorEast, markerPos "towerBaseMrk", 1, 1, 0, "Radio Towers", 0]
    ]
    ] spawn BIS_fnc_establishingShot;

if (isMultiplayer) then {waitUntil {!isNil "initVar"}; diag_log format ["Antistasi MP Client. initVar is public. Version %1",antistasiVersion];};
_titulo = ["A3 - Antistasi","by Barbolani",antistasiVersion] spawn BIS_fnc_infoText;

if (isMultiplayer) then
	{
	player setVariable ["elegible",true,true];
	musicON = false;
	waitUntil {scriptdone _introshot};
	disableUserInput true;
	cutText ["Waiting for Players and Server Init","BLACK",0];
	diag_log "Antistasi MP Client. Waiting for serverInitDone";
	waitUntil {(!isNil "serverInitDone")};
	cutText ["Starting Mission","BLACK IN",0];
	diag_log "Antistasi MP Client. serverInitDone is public";
	diag_log format ["Antistasi MP Client: JIP?: %1",_isJip];
	caja addEventHandler ["ContainerOpened",
	    {
	    _jugador = _this select 1;
	    if (not([_jugador] call isMember)) then
	       {
	    	_jugador setPos position petros;
	        hint "You are not in the Member's List of this Server.\n\nAsk the Commander in order to be allowed to access the HQ Ammobox.\n\nIn the meantime you may use the other box to store equipment and share it with others.";
	        };
	    }
        ];
    player addEventHandler ["InventoryOpened",
	{
	_control = false;
	if !([_this select 0] call isMember) then
		{
		if ((_this select 1 == caja) or ((_this select 0) distance caja < 3)) then
			{
			_control = true;
			hint "You are not in the Member's List of this Server.\n\nAsk the Commander in order to be allowed to access the HQ Ammobox.\n\nIn the meantime you may use the other box to store equipment and share it with others.";
			};
		};
	_control
	}];
	player addEventHandler ["Fired",
		{
		_tipo = _this select 1;
		if ((_tipo == "Put") or (_tipo == "Throw")) then
			{
			if (player distance petros < 50) then
				{
				deleteVehicle (_this select 6);
				if (_tipo == "Put") then
					{
					if (player distance petros < 10) then {[player,60] spawn castigo};
					};
				};
			};
		}];
	}
else
	{
	stavros = player;
	grupo = group player;
	grupo setGroupId ["Stavros","GroupColor4"];
	player setIdentity "protagonista";
	player setUnitRank "COLONEL";
	player hcSetGroup [group player];
	waitUntil {(scriptdone _introshot) and (!isNil "serverInitDone")};
	_nul = addMissionEventHandler ["Loaded", {_nul = [] execVM "statistics.sqf";_nul = [] execVM "reinitY.sqf";}]
	};

disableUserInput false;
player addWeaponGlobal "itemmap";
player addWeaponGlobal "itemgps";
player setVariable ["owner",player,true];
player setVariable ["punish",0,true];
player setVariable ["dinero",100,true];
player setVariable ["BLUFORSpawn",true,true];
player setVariable ["rango",rank player,true];
if (player!=stavros) then {player setVariable ["score", 0,true]} else {player setVariable ["score", 25,true]};
rezagados = creategroup WEST;
(group player) enableAttack false;
if (!hayACE) then
	{
	[player] execVM "Revive\initRevive.sqf";
	tags = [] execVM "tags.sqf";
	if ((cadetMode) and (isMultiplayer)) then {_nul = [] execVM "playerMarkers.sqf"};
	}
else
	{
	if (hayACEhearing) then {player addItem "ACE_EarPlugs"};
	if (!hayACEMedical) then {[player] execVM "Revive\initRevive.sqf"} else {player setVariable ["inconsciente",false,true]};
	};
gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",teclas];
if (hayRHS) then {_nul = [player] execVM "Municion\RHSdress.sqf"};
//undercover = [] execVM "undercover.sqf";
player setvariable ["compromised",0];
player addEventHandler ["FIRED",
	{
	_player = _this select 0;
	if (captive _player) then
		{
		if ({((side _x== side_red) or (side _x== side_green)) and ((_x knowsAbout player > 1.4) || (_x distance player < 200))} count allUnits > 0) then
			{
			_player setCaptive false;
			if (vehicle _player != _player) then
				{
				{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",_x]}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)));
				};
			}
		else
			{
			_ciudad = [ciudades,_player] call BIS_fnc_nearestPosition;
			_size = [_ciudad] call sizeMarker;
			_datos = server getVariable _ciudad;
			if (random 100 < _datos select 2) then
				{
				if (_player distance getMarkerPos _ciudad < _size * 1.5) then
					{
					_player setCaptive false;
					if (vehicle _player != _player) then
						{
						{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",_x]}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)));
						};
					};
				};
			};
		}
	}
	];
player addEventHandler ["HandleHeal",
	{
	_player = _this select 0;
	if (captive _player) then
		{
		if ({((side _x== side_red) or (side _x== side_green)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
			{
			_player setCaptive false;
			}
		else
			{
			_ciudad = [ciudades,_player] call BIS_fnc_nearestPosition;
			_size = [_ciudad] call sizeMarker;
			_datos = server getVariable _ciudad;
			if (random 100 < _datos select 2) then
				{
				if (_player distance getMarkerPos _ciudad < _size * 1.5) then
					{
					_player setCaptive false;
					};
				};
			};
		}
	}
	];
player addEventHandler ["WeaponAssembled",
	{
	private ["_veh"];
	_veh = _this select 1;
	if (_veh isKindOf "StaticWeapon") then
		{
		if (not(_veh in staticsToSave)) then
			{
			staticsToSave pushBack _veh;
			publicVariable "staticsToSave";
			[_veh] spawn VEHinit;
			};
		}
	else
		{
		_veh addEventHandler ["Killed",{[_this select 0] remoteExec ["postmortem",2]}];
		};
	}];
player addEventHandler ["WeaponDisassembled",
		{
		_bag1 = _this select 1;
		_bag2 = _this select 2;
		//_bag1 = objectParent (_this select 1);
		//_bag2 = objectParent (_this select 2);
		[_bag1] spawn VEHinit;
		[_bag2] spawn VEHinit;
		}
	];

player addEventHandler ["GetInMan",
	{
	private ["_unit","_veh"];
	_unit = _this select 0;
	_veh = _this select 2;
	_exit = false;
	if (isMultiplayer) then
		{
		_owner = _veh getVariable "duenyo";
		if (!isNil "_owner") then
			{
			if (_owner isEqualType "") then
				{
				if ({getPlayerUID _x == _owner} count (units group player) == 0) then
					{
					hint "You cannot board other player vehicle if you are not in the same group";
					moveOut _unit;
					_exit = true;
					};
				};
			};
		};
	if (!_exit) then
		{
		if (((typeOf _veh) in arrayCivVeh) or ((typeOf _veh) == civHeli))  then
			{
			if (!(_veh in reportedVehs)) then
				{
				[] spawn undercover;
				};
			};
		if (_veh isKindOf "Truck_F") then {
			if ((not (_veh isKindOf "C_Van_01_fuel_F")) and (not (_veh isKindOf "I_Truck_02_fuel_F")) and (not (_veh isKindOf "B_G_Van_01_fuel_F"))) then {
				//if (_this select 1 == "driver") then {[_unit,"camion"] call flagaction};
				if (_this select 1 == "driver") then {
					_aid = player addAction ["Transfer Ammobox to Truck", "Municion\transfer.sqf",nil,0,false,true];
					player setVariable ["load_box",_aid];
				};

			};
		};
	};
}];

//player addEventHandler ["GetOutMan",{removeAllActions player; player setVariable ["SA_Tow_Actions_Loaded",false];}];
player addEventHandler ["GetOutMan",{
	if !(isNil {player getVariable "load_box"}) then {
		player removeAction (player getVariable "load_box");
		player setVariable ["load_box",nil];
	};
}];
if (isMultiplayer) then
	{
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
	["InitializeGroup", [player,WEST,true]] call BIS_fnc_dynamicGroups;
	personalGarage = [];
	if (!isNil "placementDone") then {_isJip = true};//workaround for BIS fail on JIP detection
	};
caja addEventHandler ["ContainerOpened",
	{
	_fabricas = count (fabricas - mrkAAF);
	hint format ["Arsenal Unlocking Requirements\n\n\nWeapons: %1\nBackpacks: %5\nMagazines/Usables: %2\nOptics: %3\nVests: %3\nOther Items: %4",(12 + (count unlockedWeapons) - (2*_fabricas)),(13 + (count unlockedMagazines)) - (2*_fabricas),(-63 + (count unlockedItems) - _fabricas),(-53 + (count unlockedItems) - _fabricas),5*(count unlockedBackpacks)];
	}
    ];


if (_isJip) then
	{
	waitUntil {scriptdone _introshot};
	_nul = [] execVM "modBlacklist.sqf";
	//player setVariable ["score",0,true];
	//player setVariable ["owner",player,true];
	player setVariable ["punish",0,true];
	player setUnitRank "PRIVATE";
	waitUntil {!isNil "posHQ"};
	player setPos posHQ;
	[true] execVM "reinitY.sqf";
	if (not([player] call isMember)) then
		{
		if (serverCommandAvailable "#logout") then
			{
			miembros pushBack (getPlayerUID player);
			publicVariable "miembros";
			hint "You are not in the member's list, but as you are Server Admin, you have been added up. Welcome!"
			}
		else
			{
			hint "Welcome Guest\n\nYou have joined this server as guest";
			//if ((count playableUnits == maxPlayers) and (({[_x] call isMember} count playableUnits) < count miembros) and (serverName in servidoresOficiales)) then {["serverFull",false,1,false,false] call BIS_fnc_endMission};
			};
		}
	else
		{
		hint format ["Welcome back %1", name player];
		if (serverName in servidoresOficiales) then
			{
			if ((count playableUnits == maxPlayers) and (({[_x] call isMember} count playableUnits) < count miembros)) then
				{
				{
				if (not([_x] call isMember)) exitWith {["serverFull",false,1,false,false] remoteExec ["BIS_fnc_endMission",_x]};
				} forEach playableUnits;
				};
			};
		if ({[_x] call isMember} count playableUnits == 1) then
			{
			[player] call stavrosInit;
			[] remoteExec ["assignStavros",2];
			};
		};
	{
	if (_x isKindOf "FlagCarrier") then
		{
		_marcador = [marcadores,getPos _x] call BIS_fnc_nearestPosition;
		if ((not(_marcador in colinas)) and (not(_marcador in controles))) then
			{
			if (_marcador in mrkAAF) then
				{
				_x addAction ["Take the Flag", {[[_this select 0, _this select 1],"mrkWIN"] call BIS_fnc_MP;},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
				}
			else
				{
				_x addAction ["Unit Recruitment", {nul=[] execVM "Dialogs\unit_recruit.sqf";;},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
				_x addAction ["Buy Vehicle", {nul = createDialog "vehicle_option";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
				_x addAction ["Personal Garage", {nul = [true] spawn garage},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
				};
			};
		};
	} forEach vehicles - [bandera,fuego,caja,cajaVeh];
	{
	if (typeOf _x == "b_g_survivor_F") then
		{
		if (!isPlayer (leader group _x)) then
			{
			_x addAction ["Order Refugee to follow me", "AI\liberaterefugee.sqf",nil,0,false,true];
			};
		};
	} forEach allUnits;
	if (petros == leader group petros) then
		{
		removeAllActions petros;
		petros addAction ["Mission Request", {nul=CreateDialog "mission_menu";},nil,0,false,true];
		}
	else
		{
		removeAllActions petros;
		petros addAction ["Build HQ here", {[] spawn buildHQ},nil,0,false,true];
		};

	if (isMultiplayer) then
		{
		_nul = [] execVM "Dialogs\initMenu.sqf";
		};
	diag_log "Antistasi MP Client. JIP client finished";
	}
else
	{
	if (isNil "placementDone") then
		{
		waitUntil {!isNil "stavros"};
		if (player == stavros) then
		    {
		    if (isMultiplayer) then
		    	{
		    	HC_comandante synchronizeObjectsAdd [player];
				player synchronizeObjectsAdd [HC_comandante];
		    	_nul = [] execVM "Dialogs\initMenu.sqf";
		    	diag_log "Antistasi MP Client. Client finished";
		    	}
		    else
		    	{
					miembros = [];
		    	};
		    };
		};
	};
waitUntil {scriptDone _titulo};

_texto = [];

if (hayTFAR) then
	{
	_texto = ["TFAR Detected\n\nAntistasi detects TFAR in the server config.\nAll players will start with TFAR default radios.\nDefault revive system will shut down radios while players are inconscious.\n\n"];
	};
if (hayACE) then
	{

	_texto = _texto + ["ACE 3 Detected\n\nAntistasi detects ACE modules in the server config.\nACE items added to arsenal, ammoboxes, and NATO drops. Default AI control is disabled\nIf ACE Medical is used, default revive system will be disabled.\nIf ACE Hearing is used, default earplugs will be disabled."];
	};
if (hayRHS) then
	{
	_texto = _texto + ["RHS-AFRF Detected\n\nAntistasi detects RHS - AFRF in the server config.\nAAF will be replaced with VDV, VMF will take the place of CSAT.\n\nRecruited AI will use AFRF gear."];
	};

if (hayUSAF) then
	{
	_texto = _texto + ["RHS-USAF Detected\n\nAntistasi detects RHS - USAF in the server config.\nNATO will be replaced with USAF."];
	};

if (hayTFAR or hayACE or hayRHS or hayUSAF) then
	{
	//hint format ["%1",_texto]
	[_texto] spawn
		{
		sleep 0.5;
		_texto = _this select 0;
		"Integrated Mods Detected" hintC _texto;
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
			0 = _this spawn {
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
				hintSilent "";
			};
			}];
		};
	};

statistics = [] execVM "statistics.sqf";
removeAllActions caja;

// XLA fixed arsenal
if (hayXLA) then {
	["AmmoboxInit",[caja,false,{true},"Arsenal",true]] call xla_fnc_arsenal;
	caja addAction ["Arsenal", {["Open",[false,caja,player,true]] call xla_fnc_arsenal;},[],6,true,false,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
} else {
	_action = caja addaction [localize "STR_A3_Arsenal",
	{
	_this call accionArsenal;
	},
	[],
	6,
	true,
	false,
	"",
	"
	_cargo = _target getvariable ['bis_addVirtualWeaponCargo_cargo',[[],[],[],[]]];
	if ({count _x > 0} count _cargo == 0) then
		{
		_target removeaction (_target getvariable ['bis_fnc_arsenal_action',-1]);
		_target setvariable ['bis_fnc_arsenal_action',nil];
		};
	_condition = _target getvariable ['bis_fnc_arsenal_condition',{true}];
	alive _target && {_target distance _this < 5} && {call _condition}
	"
	];
	caja setvariable ["bis_fnc_arsenal_action",_action];
};

caja addAction [localize "STR_UI_VEH_CARGO_TO_AMMOBOX", "[] call vaciar"];
caja addAction [localize "STR_MOVE_THIS_ASSET", "moveHQObject.sqf",nil,0,false,true,"","(_this == stavros)"];

_nul = [player] execVM "OrgPlayers\unitTraits.sqf";
_nul = [player] execVM "OrgPlayers\cleanGear.sqf";