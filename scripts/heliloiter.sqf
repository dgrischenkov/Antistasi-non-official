_vehGroup = _this select 0;
_dest = _this select 1;
_orig = _this select 2;
_duration = _this select 3;

_wp99 = _vehGroup addWaypoint [_dest, 50];
_wp99 setWaypointType "LOITER";
_wp99 setWaypointLoiterType "CIRCLE";
_wp99 setWaypointLoiterRadius 300;
_wp99 setWaypointCombatMode "YELLOW";

sleep _duration;

_wp100 = _vehGroup addWaypoint [_orig, 50];
_wp100 setWaypointBehaviour "CARELESS";
_vehGroup setCurrentWaypoint _wp100;