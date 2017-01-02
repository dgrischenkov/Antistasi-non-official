#define FontM             "PuristaMedium"
#define FontB             "PuristaBold"

#define COLOR_GREEN { 0.2, 0.23, 0.2, 0.5 }
#define COLOR_BRIGHTGREEN { 0.2, 1.0, 0.2, 1 }
#define COLOR_LIGHTGRAY_ALPHA { 0.8, 0.8, 0.8, 0.5 }
#define COLOR_LIGHTGRAY { 0.8, 0.8, 0.8, 1 }
#define COLOR_RED { 1, 0, 0, 1 }
#define COLOR_WHITE { 1, 1, 1, 1 }

#define COLOR_TEXT "#aaaaaa"

class TutorialDialog {
	idd = 5353;
	controlsBackground[] = { BGRect };
	objects[] = { };
	controls[] = { Header, TutorialList, CloseButton, TutoControlGroup, CheckBoxShow };

	class UselessStuff {
		type = CT_STATIC;
		style = ST_SINGLE;
		font = FontM;
		colorText[] = { 0, 0, 0, 0 };
		colorBackground[] = {0, 0, 0, 0};
		sizeEx = 0.035;
		text = "";
	};

	class BGRect : UselessStuff {
		idc = -1;
		colorBackground[] = { 0.04, 0.1, 0.08, 0.9 };
		x = 0.0; y = 0.0; w = 1; h = 1;
	};

	class Header : UselessStuff {
	    idc = 500;
		colorText[] = {1, 1, 0.8, 1};
		shadow = 2;
		shadowColor = '#aa0000';
		sizeEx = 0.044;
		font = FontB;
		x = 0.02; y = 0; w = 1; h = 0.1;
	};

	class StdScrollBar {
		color[] = COLOR_LIGHTGRAY_ALPHA;
		thumb = "/A3/ui_f/data/gui/cfg/scrollbar/thumb_ca.paa";
		arrowEmpty = "/A3/ui_f/data/gui/cfg/scrollbar/arrowEmpty_ca.paa";
		arrowFull = "/A3/ui_f/data/gui/cfg/scrollbar/arrowFull_ca.paa";
		border = "/A3/ui_f/data/gui/cfg/scrollbar/border_ca.paa";
		width = 0.02;
	};

	class StdListBox : UselessStuff {
		idc = -1;
		type = CT_LISTBOX;
	    rowHeight = 0.018 * 1.25;
		color[] = COLOR_LIGHTGRAY;
		colorText[] = COLOR_WHITE;
		colorScrollbar[] = COLOR_BRIGHTGREEN;
		colorSelect[] = COLOR_BRIGHTGREEN;
		colorSelectBackground[] = COLOR_LIGHTGRAY;
		colorDisabled[] = COLOR_GREEN;
		colorBackground[] = COLOR_GREEN;
		soundSelect[] = {"/a3/Ui_f/data/Sound/CfgIngameUI/hintExpand", 0.09, 1};

		maxHistoryDelay = 1.0;

		class ListScrollBar : StdScrollBar {};
	};

	class TutorialList : StdListBox {
		idc = 513;
		x = 0.02;
		y = 0.1;
		w = 0.28;
		h = 0.8;
		shadow = 2;
		onLBSelChanged="";
	};

	class StdButton : UselessStuff {
		idc = -1;
		type = CT_BUTTON;

		colorDisabled[] = { 0, 0, 0, 1 };
		colorBackgroundDisabled[] = { 0, 0, 0, 1 };
		colorShadow[] = { 0, 0, 0, 1 };
		colorBorder[] = { 0, 0, 0, 1 };
		offsetX = 0;
		offsetY = 0;
		offsetPressedX = 0;
		offsetPressedY = 0;
		borderSize = 0;

		colorText[] = { 0.5, 0.75, 0.5, 1 };
		colorBackground[] = { 0.4, 0.44, 0.4, 0.5 };
		colorBackgroundActive[] = { 0.6, 0.66, 0.4, 0.5 };
		colorFocused[] = { 0.6, 0.66, 0.4, 0.5 };

		soundPush[] = {"/a3/Ui_f/data/Sound/CfgIngameUI/hintExpand", 1, 1};
		soundEnter[] = { "", 0, 1 };
		soundClick[] = { "", 0, 1 };
		soundEscape[] = { "", 0, 1 };
		action = "";
		shadow = 1;
		w = 0.18;
		h = 0.039;
	};

	class CloseButton : StdButton {
		idc = 512;
		x = 0.80;
		y = 0.93;
		action = "howtoplay = 0;";
	};

	class CheckBoxShow : StdButton {
		idc = 516;
		type = CT_CHECKBOXES;

		x = 0.02;
		  y = 0.93;
		w = 0.75;
		h = 0.04;

		colorText[] = { 0.5, 0.5, 0.5, 1 };
		colorTextSelect[] = { 0.5, 0.75, 0.5, 1 };
		colorSelectedBg[] = { 0.55, 0.60, 0.35, 0.1 };

		font = FontB;

		rows = 1;
		columns = 1;
		strings[] = {$STR_CHECK_SHOW};

		onCheckBoxesSelChanged = "show_howtoplay = _this select 2; [""show_howtoplay"",show_howtoplay] call fn_SaveStat;"
	};

	class TutoControlGroup  {
		idc = -1;
		type = CT_CONTROLS_GROUP;
		style = ST_SINGLE;
		x = 0.31; y = 0.1; w = 0.67; h = 0.8;

		class VScrollbar : StdScrollBar { };
		class HScrollbar : StdScrollBar { };

		class Controls
		{
			class TutoStructuredText : UselessStuff
			{
				idc = 515;
				type = CT_STRUCTURED_TEXT;
				style = ST_LEFT;
				x = 0; y = 0; w = 0.65; h = 1;
				text= "";
				size = 0.035;
				sizeEx = 0;
				shadow = 2;
				font = FontM;
				color = COLOR_TEXT;
			};
		};
	};
};
