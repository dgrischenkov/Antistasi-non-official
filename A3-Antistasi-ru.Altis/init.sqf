//Arma 3 - Antistasi by Barbolani
//Do whatever you want with this code, but credit me for the thousand hours spent making this.
enableSaving [ false, false ];
if (isServer and (isNil "serverInitDone")) then {skipTime random 24};

if (!isMultiPlayer) then
    {
    [] execVM "briefing.sqf";
    {if ((side _x == west) and (_x != comandante) and (_x != Petros) and (_x != server) and (_x!=garrison) and (_x != carreteras)) then {_grupete = group _x; deleteVehicle _x; deleteGroup _grupete}} forEach allUnits;
    _nul = [] execVM "musica.sqf";
    diag_log "Starting Antistasi SP";
    call compile preprocessFileLineNumbers "initVar.sqf";//this is the file where you can modify a few things.
    diag_log format ["Antistasi SP. InitVar done. Version: %1",antistasiVersion];
    call compile preprocessFileLineNumbers "initFuncs.sqf";
    diag_log "Antistasi SP. Funcs init finished";
    call compile preprocessFileLineNumbers "initZones.sqf";//this is the file where you can transport Antistasi to another island
    diag_log "Antistasi SP. Zones init finished";
    call compile preprocessFileLineNumbers "initPetros.sqf";
    lockedWeapons = lockedWeapons - unlockedWeapons;

    // XLA fixed arsenal
    if (hayXLA) then {
        [caja,unlockedItems,true,false] call XLA_fnc_addVirtualItemCargo;
        [caja,unlockedMagazines,true,false] call XLA_fnc_addVirtualMagazineCargo;
        [caja,unlockedWeapons,true,false] call XLA_fnc_addVirtualWeaponCargo;
        [caja,unlockedBackpacks,true,false] call XLA_fnc_addVirtualBackpackCargo;
    } else {
        [caja,unlockedItems,true,false] call BIS_fnc_addVirtualItemCargo;
        [caja,unlockedMagazines,true,false] call BIS_fnc_addVirtualMagazineCargo;
        [caja,unlockedWeapons,true,false] call BIS_fnc_addVirtualWeaponCargo;
        [caja,unlockedBackpacks,true,false] call BIS_fnc_addVirtualBackpackCargo;
    };

    HCciviles = 2;
    HCgarrisons = 2;
    HCattack = 2;
    hcArray = [HC1,HC2,HC3];
    serverInitDone = true;
    diag_log "Antistasi SP. serverInitDone is true. Arsenal loaded";
    _nul = [] execVM "modBlacklist.sqf";
    };

waitUntil {(!isNil "saveFuncsLoaded") and (!isNil "serverInitDone")};

if(isServer) then
    {
    _serverHasID = profileNameSpace getVariable ["ss_ServerID",nil];
    if(isNil "_serverHasID") then
        {
        _serverID = str(round((random(100000)) + random 10000));
        profileNameSpace setVariable ["SS_ServerID",_serverID];
        };
    serverID = profileNameSpace getVariable "ss_ServerID";
    publicVariable "serverID";

    waitUntil {!isNil "serverID"};
    if (serverName in servidoresOficiales) then
        {
        ["miembros"] call fn_LoadStat;
        {
        if (([_x] call isMember) and (isNull stavros)) then
            {
            stavros = _x;
            _x setRank "LIEUTENANT";
            [_x,"LIEUTENANT"] remoteExec ["ranksMP"];
            //_x setVariable ["score", 25,true];
            };
        } forEach playableUnits;
        publicVariable "stavros";
        if (isNull stavros) then
            {
            _nul = [] execVM "statSave\loadAccount.sqf"; switchCom = true; publicVariable "switchCom";
            diag_log "Antistasi MP Server. Players are in, no members";
            }
        else
            {
            diag_log "Antistasi MP Server. Players are in, member detected";
            };
        }
    else
        {
        waitUntil {!isNil "stavros"};
        waitUntil {isPlayer stavros};
        };
    fpsCheck = [] execVM "fpsCheck.sqf";
    _nul = [caja] call cajaAAF;
    [unlockedWeapons] spawn weaponCheck;
    waitUntil {!(isNil "placementDone")};
    distancias = [] spawn distancias3;
    resourcecheck = [] execVM "resourcecheck.sqf";
    if (serverName in servidoresOficiales) then {
        _nul = [] call mList;
    };
};

[] execVM "Scripts\fn_advancedTowingInit.sqf";

[] execVM "Dialogs\welcome.sqf";

[] execVM "tutorial.sqf";

[0.1] execVM "snow.sqf";

[] execVM "real_weather.sqf";
