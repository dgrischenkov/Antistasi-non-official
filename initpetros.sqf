removeHeadgear petros;
removeGoggles petros;
petros setSkill 1;
petros setVariable ["inconsciente",false,true];
petros setVariable ["respawning",false];

petros addEventHandler ["HandleDamage",
        {
        private ["_unit","_part","_dam","_injurer"];
        _part = _this select 1;
        _dam = _this select 2;
        _injurer = _this select 3;

        if (isPlayer _injurer) then
            {
            [_injurer,60] remoteExec ["castigo",_injurer];
            _dam = 0;
            };
        if ((isNull _injurer) or (_injurer == petros)) then {_dam = 0};
        if (_part == "") then
            {
            if (_dam > 0.95) then
                {
                if (!(petros getVariable "inconsciente")) then
                    {
                    _dam = 0.9;
                    [petros, _part, _injurer] spawn inconsciente;
                    }
                else
                    {
                    petros removeAllEventHandlers "HandleDamage";
                    };
                };
            };
        _dam
        }];

petros addMPEventHandler ["mpkilled",
    {
    removeAllActions petros;
    _killer = _this select 1;
    if (isServer) then
        {
        if ((side _killer == side_red) or (side _killer == side_green)) then
             {
            _nul = [] spawn
                {
                garrison setVariable ["FIA_HQ",[],true];
                for "_i" from 0 to round random 3 do {
                    if (count unlockedWeapons > 4) then {
                        _cosa = selectRandom unlockedWeapons;
                        diag_log format ["weapon: %1", _cosa];
                        unlockedWeapons = unlockedWeapons - [_cosa];
                        lockedWeapons = lockedWeapons + [_cosa];
                        if (_cosa in unlockedRifles) then {unlockedRifles = unlockedRifles - [_cosa]};
                        _mag = (getArray (configFile / "CfgWeapons" / _cosa / "magazines") select 0);
                        if (!isNil "_mag") then {unlockedMagazines = unlockedMagazines - [_mag]; diag_log format ["weapon/mag: %1", _mag];};
                    };
                 };
                publicVariable "unlockedWeapons";

                for "_i" from 0 to round random 8 do {
                    _cosa = selectRandom unlockedMagazines;
                    if !(isNil "_cosa") then {
                        diag_log format ["mag: %1", _cosa];
                        unlockedMagazines = unlockedMagazines - [_cosa];
                    };
                };
                publicVariable "unlockedMagazines";

                for "_i" from 0 to round random 5 do {
                    _cosa = selectRandom (unlockedItems - ["ItemMap","ItemWatch","ItemCompass","FirstAidKit","Medikit","ToolKit","ItemRadio"]);
                    diag_log format ["item: %1", _cosa];
                    unlockedItems = unlockedItems - [_cosa];
                    if (_cosa in unlockedOptics) then {unlockedOptics = unlockedOptics - [_cosa]; publicVariable "unlockedOptics"};
                };
                publicVariable "unlockedItems";

                clearMagazineCargoGlobal caja;
                clearWeaponCargoGlobal caja;
                clearItemCargoGlobal caja;
                clearBackpackCargoGlobal caja;

                [] call resyncArsenal;

                waitUntil {sleep 6; isPlayer stavros};
                [] remoteExec ["placementSelection",stavros];
               };
            }
        else
            {
            _viejo = petros;
            grupoPetros = createGroup side_blue;
            publicVariable "grupoPetros";
            petros = grupoPetros createUnit ["B_G_officer_F", position _viejo, [], 0, "NONE"];
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
        };
   }];
