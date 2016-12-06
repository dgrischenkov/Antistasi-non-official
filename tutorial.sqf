if ( isNil "howtoplay" ) then { howtoplay = 0; };

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
			localize "STR_TUTO_TITLE0",
			localize "STR_TUTO_TITLE1",
			localize "STR_TUTO_TITLE2",
			localize "STR_TUTO_TITLE3",
			localize "STR_TUTO_TITLE4",
			localize "STR_TUTO_TITLE5",
			localize "STR_TUTO_TITLE6"
		];

		{
			lbAdd [513, _x];
		} foreach _tutorial_titles;

		lbSetCurSel [513, 0];

		disableSerialization;

		_tutorial_pages = [
			"STR_TUTO_HELLOW_TEXT",
			"STR_TUTO_TEXT0",
			"STR_TUTO_TEXT1",
			"STR_TUTO_TEXT2",
			"STR_TUTO_TEXT3",
			"STR_TUTO_TEXT4",
			"STR_TUTO_TEXT5",
			"STR_TUTO_TEXT6"
		];

		_tutorial_height = [0.9, 2.8, 0.5, 0.7, 2.5, 1.0, 1.8, 0.8];

		_old_page = -1;

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
