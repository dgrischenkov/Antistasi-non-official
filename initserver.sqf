if (!isMultiplayer) exitWith {};
if (!(isNil "serverInitDone")) exitWith {};
diag_log "Antistasi MP Server init";
_nul = call compile preprocessFileLineNumbers "initVar.sqf";
initVar = true; publicVariable "initVar";
diag_log format ["Antistasi MP. InitVar done. Version: %1",antistasiVersion];
_nul = call compile preprocessFileLineNumbers "initFuncs.sqf";
diag_log "Antistasi MP Server. Funcs init finished";
_nul = call compile preprocessFileLineNumbers "initZones.sqf";
diag_log "Antistasi MP Server. Zones init finished";
_nul= call compile preprocessFileLineNumbers "initPetros.sqf";

["Initialize"] call BIS_fnc_dynamicGroups;//Exec on Server

waitUntil {(count playableUnits) > 0};
waitUntil {({(isPlayer _x) and (!isNull _x) and (_x == _x)} count allUnits) == (count playableUnits)};//ya estamos todos
_nul = [] execVM "modBlacklist.sqf";

stavros = objNull;
maxPlayers = playableSlotsNumber west;
if (serverName in servidoresOficiales) then
    {
    _nul = [] execVM "serverAutosave.sqf";
    }
else
    {
    if (isNil "comandante") then {comandante = (playableUnits select 0)};
    if (isNull comandante) then {comandante = (playableUnits select 0)};
    {
    if (_x!=comandante) then
        {
        //_x setVariable ["score", 0,true];
        }
    else
        {
        stavros = _x;
        publicVariable "stavros";
        _x setRank "CORPORAL";
        [_x,"CORPORAL"] remoteExec ["ranksMP"];
        //_x setVariable ["score", 25,true];
        };
    } forEach playableUnits;
    diag_log "Antistasi MP Server. Players are in";
    };
publicVariable "maxPlayers";

hcArray = [];

//{if (owner _x != owner server) then {hcArray pushBack _x}} forEach entities "HeadlessClient_F";

if (!isNil "HC1") then {hcArray pushBack HC1};
if (!isNil "HC2") then {hcArray pushBack HC2};
if (!isNil "HC3") then {hcArray pushBack HC3};

HCciviles = 2;
HCgarrisons = 2;
HCattack = 2;
if (count hcArray > 0) then
    {
    HCciviles = hcArray select 0;
    HCgarrisons = hcArray select 0;
    HCattack = hcArray select 0;
    diag_log "Antistasi MP Server. Headless Client 1 detected";
    if (count hcArray > 1) then
        {
        HCciviles = hcArray select 1;
        HCattack = hcArray select 1;
        diag_log "Antistasi MP Server. Headless Client 2 detected";
        if (count hcArray > 2) then
            {
            HCciviles = hcArray select 2;
            diag_log "Antistasi MP Server. Headless Client 3 detected";
            };
        };
    };

publicVariable "HCciviles";
publicVariable "HCgarrisons";
publicVariable "HCattack";
publicVariable "hcArray";
lockedWeapons = lockedWeapons - unlockedWeapons;
// XLA fixed arsenal
if (hayXLA) then {
    [caja,unlockedItems,true] call XLA_fnc_addVirtualItemCargo;
    [caja,unlockedMagazines,true] call XLA_fnc_addVirtualMagazineCargo;
    [caja,unlockedWeapons,true] call XLA_fnc_addVirtualWeaponCargo;
    [caja,unlockedBackpacks,true] call XLA_fnc_addVirtualBackpackCargo;
} else {
    [caja,unlockedItems,true] call BIS_fnc_addVirtualItemCargo;
    [caja,unlockedMagazines,true] call BIS_fnc_addVirtualMagazineCargo;
    [caja,unlockedWeapons,true] call BIS_fnc_addVirtualWeaponCargo;
    [caja,unlockedBackpacks,true] call BIS_fnc_addVirtualBackpackCargo;
};

diag_log "Antistasi MP Server. Arsenal config finished";
[[petros,"hint","Server Init Completed"],"commsMP"] call BIS_fnc_MP;

addMissionEventHandler ["HandleDisconnect",{[_this select 0] call onPlayerDisconnect;false}];

caja addEventHandler ["ContainerOpened",
    {
    _jugador = _this select 1;
    if (not([_jugador] call isMember)) then
        {
        _jugador setPos position petros;
        "You are not in the Member's List of this Server.\n\nAsk the Commander in order to be allowed to access the HQ Ammobox.\n\nIn the meantime you may use the other box to store equipment and share it with others." remoteExecCall ["hint", _jugador];
        };
    }
];

if (isServer) then { [] execVM "real_weather.sqf"; };

serverInitDone = true; publicVariable "serverInitDone";
diag_log "Antistasi MP Server. serverInitDone set to true.";