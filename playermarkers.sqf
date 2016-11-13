private ["_jugadores","_jugador","_mrk","_veh"];

while {true} do
	{
	waitUntil {sleep 0.5; (visibleMap or visibleGPS)};
	_jugadores = [];
	_marcadores = [];
	while {visibleMap or visibleGPS} do
		{
		{
		_jugador = _x getVariable ["owner",_x];
		if ((not(_jugador in _jugadores))) then
			{
			_jugadores pushBack _jugador;
			_mrk = createMarkerLocal [format ["%1",_jugador],position _jugador];
			_mrk setMarkerTypeLocal "mil_triangle";
			_mrk setMarkerColorLocal "ColorWhite";
			_mrk setMarkerTextLocal format ["%1",name _jugador];
			if (server getVariable ["hardMode", false]) then {_mrk setMarkerAlphaLocal 0};
			//_mrk setMarkerAlphaLocal 0; // <<-- hard mode
			_marcadores pushBack _mrk;
			};
		} forEach playableUnits;
		if (count _jugadores > 0) then
			{
			{
			_jugador = _x;
			_mrk = format ["%1",_jugador];
			if (vehicle _jugador == _jugador) then
				{
				if !(server getVariable ["hardMode", false]) then {_mrk setMarkerAlphaLocal 1};
				//_mrk setMarkerAlphaLocal 1; // <<-- normal mode
				_mrk setMarkerPosLocal position _jugador;
				_mrk setMarkerDirLocal getDir _jugador;
				if (_jugador getVariable ["inconsciente",false]) then
					{
					_mrk setMarkerTypeLocal "mil_join";
					if (server getVariable ["hardMode", false]) then {_mrk setMarkerAlphaLocal 1};
					//_mrk setMarkerAlphaLocal 1; // <<-- hard mode
					_mrk setMarkerTextLocal format ["%1 Injured",name _jugador];
					_mrk setMarkerColorLocal "ColorPink";
					}
				else
					{
					_mrk setMarkerTypeLocal "mil_triangle";
					if (server getVariable ["hardMode", false]) then {_mrk setMarkerAlphaLocal 0};
					//_mrk setMarkerAlphaLocal 0; // <<-- hard mode
					_mrk setMarkerTextLocal format ["%1",name _jugador];
					_mrk setMarkerColorLocal "ColorWhite";
					};
				}
			else
				{
				_veh = vehicle _jugador;
				if ((isNull driver _veh) or (driver _veh == _jugador)) then
					{
					if !(server getVariable ["hardMode", false]) then {_mrk setMarkerAlphaLocal 1};
					//_mrk setMarkerAlphaLocal 1; // <<-- normal mode
					_mrk setMarkerPosLocal position _veh;
					_mrk setMarkerDirLocal getDir _veh;
					_texto = format ["%1 (%2)/",name _jugador,getText(configFile>>"CfgVehicles">>typeOf _veh>>"DisplayName")];
					{
					if ((_x!=_jugador) and (vehicle _x == _veh)) then
						{
						_texto = format ["%1%2/",_texto,name _x];
						};
					} forEach playableUnits;
					_mrk setMarkerTextLocal _texto;
					}
				else
					{
					_mrk setMarkerAlphaLocal 0;
					};
				};
			} forEach _jugadores;
			};
		sleep 1;
		};
	{deleteMarkerLocal _x} forEach _marcadores;
	};
