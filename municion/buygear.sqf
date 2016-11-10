_c = _this select 0;
_t = _this select 1;
_m = _this select 2;

_f = 0;
_pos = getPos expCrate;

_f = server getVariable "resourcesFIA";

/*
if (!isMultiPlayer) then {
	diag_log "not multiplayer";
	_f = server getVariable "resourcesFIA";
}
else {
	if (player != stavros) then {
		diag_log "not stavros";
		_f = player getVariable "dinero";
	}
	else {
		diag_log "stavros";
		_f = server getVariable "resourcesFIA";
	};
};
*/

if (_f < _m) exitWith {
	_l1 = ["Devin", "Get lost ya cheap wanker!"];
    [[_l1],"DIRECT",0.15] execVM "createConv.sqf";
};

expCrate addBackpackCargoGlobal ["B_Carryall_oli", 1];

if (_t == "expLight") then {
	if (_m == 300) exitWith {
		expCrate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 1];
		expCrate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];

	};
	if (_m == 800) exitWith {
		expCrate addMagazineCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 3];
		expCrate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 8];
		expCrate addMagazineCargoGlobal ["SatchelCharge_Remote_Mag", 8];
	};
};
if (_t == "expHeavy") then {
	if (_m == 300) exitWith {
		expCrate addMagazineCargoGlobal [apMine, 5];
		expCrate addMagazineCargoGlobal [atMine, 2];
		expCrate addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 2];
	};
	if (_m == 800) exitWith {
		expCrate addMagazineCargoGlobal [apMine, 8];
		expCrate addMagazineCargoGlobal [atMine, 4];
		expCrate addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];
		expCrate addMagazineCargoGlobal ["APERSBoundingMine_Range_Mag", 1];
		expCrate addMagazineCargoGlobal ["APERSTripMine_Wire_Mag", 3];
	};
};

_l2 = ["Devin", "Aye, the market for explosives is boomin'. They be hard to get a hold of, don't ya know."];
if (_m == 800) then {_l2 = ["Devin", "Yer a fine customer. Give ya an ever better deal next time."]};
[[_l2],"DIRECT",0.15] execVM "createConv.sqf";

_nul = [0, (-1* _m)] remoteExec ["resourcesFIA",2];

/*
if (!isMultiPlayer) then {
	_nul = [0, (-1* _m)] remoteExec ["resourcesFIA",2];
}
else {
	if (player != stavros) then {
		[-1* _m] call resourcesPlayer;
	}
	else {
		_nul = [0, (-1* _m)] remoteExec ["resourcesFIA",2];
	};
};
*/