if (player != stavros) exitWith {hint "Only Player Commander is allowed to move HQ assets"};

_cosa = _this select 0;
_jugador = _this select 1;
_id = _this select 2;

_cosa removeAction _id;
_cosa attachTo [_jugador,[0,2,1]];
//_jugador addAction ["Drop Here", {{detach _x} forEach attachedObjects player; removeAllActions player},nil,0,false,true,"",""];
_action = _jugador addAction ["Drop Here", {{detach _x} forEach attachedObjects player;},nil,0,false,true,"",""];
_jugador setVariable ["drop_HQ",_action];

waitUntil {sleep 1; (count attachedObjects _jugador == 0) or (vehicle _jugador != _jugador) or (_jugador distance petros > 30) or (!alive _jugador) or (!isPlayer _jugador)};

{detach _x} forEach attachedObjects _jugador;
_jugador removeAction (_jugador getVariable "drop_HQ");
_jugador setVariable ["drop_HQ",nil];

//removeAllActions _jugador;
/*
for "_i" from 0 to (_jugador addAction ["",""]) do
	{
	_jugador removeAction _i;
	};
*/
_cosa addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == stavros)"];

_cosa setPosATL [getPosATL _cosa select 0,getPosATL _cosa select 1,0];

if (vehicle _jugador != _jugador) exitWith {hint "You cannot move HQ assets while in a vehicle"};

if  (_jugador distance petros > 30) exitWith {hint "You cannot move HQ assets far from 30mts distance to Petros position"};