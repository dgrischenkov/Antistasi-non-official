private ["_marcadores","_unitsInVehicle","_mrk","_veh","_unitsInVehicleTmp","_text"];

while {true} do
{
	waitUntil {sleep 0.5; (visibleMap or visibleGPS)};

	while {visibleMap or visibleGPS} do
	{
		_unitsInVehicle = [];
		_marcadores = [];

		{
			if (vehicle _x == _x) then
			{
				_mrk = createMarkerLocal [format ["%1",_x],position _x];
				_mrk setMarkerDirLocal getDir _x;

				if (_x getVariable ["inconsciente",false]) then
				{
					_mrk setMarkerTypeLocal "mil_join";
					_mrk setMarkerColorLocal "ColorPink";
				}
				else
				{
					_mrk setMarkerTypeLocal "mil_triangle";
					_mrk setMarkerColorLocal "ColorYellow";
				};

				_mrk setMarkerTextLocal format ["%1",name _x];
				_marcadores pushBack _mrk;
			} else { _unitsInVehicle pushback _x; };
		} forEach playableUnits;

		{
			if (!(_x in playableUnits)) then
			{
				if (vehicle _x == _x) then
				{
					_mrk = createMarkerLocal [format ["%1",_x],position _x];

					if (_x getVariable ["inconsciente",false]) then
					{
						_mrk setMarkerTypeLocal "mil_dot";
						_mrk setMarkerColorLocal "ColorPink";
					}
					else
					{
						_mrk setMarkerTypeLocal "mil_dot";
						_mrk setMarkerColorLocal "ColorOrange";
					};

					_mrk setMarkerTextLocal format ["%1",name _x];
					_marcadores pushBack _mrk;
				} else { _unitsInVehicle pushback _x; };
			};
		} forEach (units group player);

		while { (count _unitsInVehicle) != 0 } do
		{
			_unitsInVehicleTmp = _unitsInVehicle;
			_unitsInVehicle = [];
			_veh = vehicle (_unitsInVehicleTmp select 0);
			_text = "";

			{
				if (vehicle _x == _veh)
				then { _text = _text + name _x + " | " }
				else { _unitsInVehicle pushback _x; };
			} forEach _unitsInVehicleTmp;

			_mrk = createMarkerLocal [format ["%1",_veh],position _veh];
			_mrk setMarkerDirLocal getDir _veh;
			_mrk setMarkerTypeLocal "mil_arrow2";
			_mrk setMarkerColorLocal "ColorYellow";
			_mrk setMarkerTextLocal format[ "[%1]", _text ];
			_marcadores pushBack _mrk;
		};

		sleep 5;

		{deleteMarkerLocal _x} forEach _marcadores;
	};
};
