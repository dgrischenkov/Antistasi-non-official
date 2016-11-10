
private ["_posHQ"];
_posHQ = getMarkerPos "respawn_west";

{if ((side _x == side_blue) and (_x distance _posHQ < 150)) then {_x setDamage 0}} forEach allUnits;

{if ((side _x == side_blue) and (_x distance _posHQ < 30)) then {_x setVariable ["compromised",0];}}forEach allPlayers - entities "HeadlessClient_F";


{
if (_x distance _posHQ < 150)
	then
	{
	 reportedVehs = reportedVehs - [_x];
	_x setDamage 0;
	//_x setVehicleAmmoDef 1;
	[_x,1] remoteExec ["setVehicleAmmoDef",_x];
	};
} forEach vehicles;

publicVariable "reportedVehs";

hint "All nearby units and vehicles have been healed or repaired. Near vehicles have been rearmed at full load, plates have been switched.";