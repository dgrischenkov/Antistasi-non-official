howtoplay = 1; publicVariable "howtoplay";
show_howtoplay = 1; publicVariable "show_howtoplay";

[] spawn
{
	while { true } do {

		waitUntil { sleep 0.5; howtoplay == 1 };
		waitUntil { !dialog };
		sleep 0.1;

		createDialog "TutorialDialog";

		ctrlSetText [500, localize "STR_TUTO_TITLE"];
		ctrlSetText [512, localize "STR_CLOSE"];

		_tutorial_titles = [
			localize "STR_TUTO_HELLOW_TITLE",
			localize "STR_TUTO_START_TITLE",
			localize "STR_TUTO_HQ_TITLE",
			localize "STR_TUTO_TELEPORT_TITLE",
			localize "STR_TUTO_MONEY_TITLE",
			localize "STR_TUTO_GARRISON_TITLE",
			localize "STR_TUTO_CAPTURE_TITLE",
			localize "STR_TUTO_UNDERCOVER_TITLE",
			localize "STR_TUTO_SQUAD_TITLE",
			localize "STR_TUTO_NATOCSAT_TITLE",
			localize "STR_TUTO_NEWS_TITLE",
			localize "STR_TUTO_FUTURE_TITLE"
		];

		{
			lbAdd [513, _x];
		} foreach _tutorial_titles;

		lbSetCurSel [513, 0];

		disableSerialization;

		_tutorial_pages = [
			"STR_TUTO_HELLOW_TEXT",
			"STR_TUTO_START_TEXT",
			"STR_TUTO_HQ_TEXT",
			"STR_TUTO_TELEPORT_TEXT",
			"STR_TUTO_MONEY_TEXT",
			"STR_TUTO_GARRISON_TEXT",
			"STR_TUTO_CAPTURE_TEXT",
			"STR_TUTO_UNDERCOVER_TEXT",
			"STR_TUTO_SQUAD_TEXT",
			"STR_TUTO_NATOCSAT_TEXT",
			"STR_TUTO_NEWS_TEXT",
			"STR_TUTO_FUTURE_TEXT"
		];

		_tutorial_height = [0.9, 0.8, 0.8, 1.5, 1.3, 2.5, 0.8, 0.1, 0.1, 0.1, 0.1, 0.1];

		_old_page = -1;

		_ctrlCheckBox = ((findDisplay 5353) displayCtrl (516));
		_ctrlCheckBox ctrlSetChecked ( show_howtoplay == 1 );

		while { howtoplay == 1 && alive player && dialog } do {
			_current_page = lbCurSel 513;
			if ( _current_page != _old_page ) then {
				_ctrlText = ((findDisplay 5353) displayCtrl (515));
				_ctrlText ctrlSetStructuredText parseText localize (_tutorial_pages select _current_page);
				_ctrlText ctrlSetPosition [0, 0, 0.65, (_tutorial_height select _current_page)];
				_ctrlText ctrlCommit 0;
				_old_page = _current_page;
			};
			sleep 0.1;
		};

		if ( dialog ) then { closeDialog 0 };
		howtoplay = 0;
	};
};
