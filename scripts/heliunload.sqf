_vehGroup = _this select 0;
_dest = _this select 1;
_orig = _this select 2;
_duration = _this select 3;
_infGroup = _this select 4;
_mrk = _this select 5;

_wp100 = _vehGroup addWaypoint [_dest, 0];
_wp100 setWaypointBehaviour "CARELESS";
_wp100 setWaypointSpeed "FULL";
_wp100 setWaypointType "TR UNLOAD";
_wp101 = _infGroup addWaypoint [_dest, 0];
_wp101 setWaypointType "GETOUT";
_wp101 synchronizeWaypoint [_wp100];
_wp102 = _vehGroup addWaypoint [_orig, 50];
_wp102 setWaypointSpeed "FULL";
_wp102 setWaypointBehaviour "CARELESS";

waitUntil {sleep 5; ((units _infGroup select 0) distance _dest < 10)};
diag_log format ["point reached: %1", _infGroup];

sleep 60;
_vehGroup setCurrentWaypoint _wp102;

_infGroup setFormation "WEDGE";
_infGroup setCombatMode "YELLOW";
_infGroup setBehaviour "AWARE";
_infGroup setSpeedMode "NORMAL";

_nul = [leader _infGroup, _mrk, "AWARE", "SPAWNED","NOVEH", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";

_duration = _duration - 120;
sleep _duration ;

_wp201 = _infGroup addWaypoint [_orig, 50];
_wp201 setWaypointCombatMode "GREEN";