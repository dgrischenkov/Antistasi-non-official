
_resourcesFIA = server getVariable "resourcesFIA";

if (_resourcesFIA < 5000) exitWith {hint localize "STR_UI_CANT_REBUILD_NO_MONEY"};

_destroyedCities = destroyedCities - ciudades;

openMap true;
posicionTel = [];
hint localize "STR_UI_CLICK_FOR_REBUILD";

onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_posicionTel = posicionTel;

_sitio = [marcadores,_posicionTel] call BIS_fnc_nearestPosition;

if (getMarkerPos _sitio distance _posicionTel > 50) exitWith {hint localize "STR_UI_MUST_CLICK_NEAR_MARKER"};

if (not(_sitio in _destroyedCities)) exitWith {hint localize "STR_UI_CANT_REBUILD_THAT"};

_nombre = [_sitio] call localizar;

hint format [localize "STR_UI_REBUILDED"];

[0,10,_posicionTel] remoteExec ["citySupportChange",2];
[5,0] remoteExec ["prestige",2];
destroyedCities = destroyedCities - [_sitio];
publicVariable "destroyedCities";
if (_sitio in power) then {[_sitio] call powerReorg};
[0,-5000] remoteExec ["resourcesFIA",2];