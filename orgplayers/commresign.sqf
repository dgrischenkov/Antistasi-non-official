_jugador = player getVariable ["owner",player];

if (_jugador getVariable ["elegible",true]) then
	{
	_jugador setVariable ["elegible",false,true];
	if (_jugador == stavros) then
		{
		hint "You resign of being Commander. Other will take the command if there is someone suitable for it.";
		sleep 3;
		[] remoteExec ["assignStavros",2];
		}
	else
		{
		hint localize "STR_DECIDED_COMM";
		};
	}
else
	{
	hint localize "STR_ELEGIBLE_COMM";
	_jugador setVariable ["elegible",true,true];
	};