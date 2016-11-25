private ["_unit","_part","_injurer","_unitSide","_whileExit","_finishedoff","_camTime","_bleedOutConst","_ayuda","_texto","_camTarget","_respawnMenu","_respMessage","_saveVolume","_saveVolumeVoice"];

_unit = _this select 0;
_part = _this select 1;
_injurer = _this select 2;

if (!local _unit) exitWith {};

_bleedOutConst = time + 360;

_unit setCaptive true;

if (_part != "") then { removeHeadgear _unit; };
if (vehicle _unit != _unit) then { _unit action ["getOut", vehicle _unit]; };

_unit switchMove "AinjPpneMstpSnonWrflDnon";
_unit playActionNow "Unconscious";
_unit setFatigue 1;

if (isPlayer _unit) then
{
	closeDialog 0;

	disableUserInput true;
	titleText ["", "BLACK FADED"];
	sleep 2;
	titleText ["", "BLACK IN"];
	disableUserInput false;

	_respawnMenu = (findDisplay 46) displayAddEventHandler
		["KeyDown",
		{
			if (_this select 1 == 57) then
			{
				player setVariable ["suicide",true];
				[localize "STR_RESPAWN_INCONSCIENTE_SPACE_KEY",0,0,10,0,0,4] spawn bis_fnc_dynamicText;
			};
			false;
		}];

	if (hayTFAR) then
	{
		_saveVolume = player getVariable ["tf_globalVolume", 1.0];
		player setVariable ["tf_unable_to_use_radio", true, true];
		player setVariable ["tf_globalVolume", 0];
		_saveVolumeVoice = player getVariable ["tf_voiceVolume", 1.0];
		if (random 100 < 20) then {player setVariable ["tf_voiceVolume", 0.0, true]};
	};

	deadCam = "camera" camCreate (player modelToWorld [0,0,2]);
}
else
{
	{ _unit disableAI _x; } foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
	_unit stop true;
};

_whileExit = false;
_camTime = time - 7;
_unit setVariable ["finishedoff",nil,true];
_unitSide = side _unit;

while { !_whileExit } do
{
	if (random 100 < 5) then { playSound3D [(injuredSounds call BIS_fnc_selectRandom),_unit,false, getPosASL _unit, 1, 1, 50]; };
	if (random 100 > 5) then { _unit setCaptive true; } else { _unit setCaptive false; }; // change side to civilian

	_ayuda = [_unit, _unitSide] call pedirAyuda;
	_finishedoff = _unit getVariable "finishedoff";

	if (isPlayer _unit) then
	{
		if (isNull _injurer) then { _texto = localize "STR_RESPAWN_INCONSCIENTE_FELL_OF_BURNED"; }
		else
		{
			if (isPlayer _injurer)
			then { _texto = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_PLAYER", name _injurer]; }
			else { _texto = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_BOT", name _injurer]; };
			_texto = format[localize "STR_RESPAWN_INCONSCIENTE_YOU_KILLED", _texto];
		};

		if (isNull _ayuda)
		then { _texto = _texto + format [localize "STR_RESPAWN_INCONSCIENTE_CAMERA_TO_PLAYER", ceil (_bleedOutConst - time)]; }
		else { _texto = _texto + format [localize "STR_RESPAWN_INCONSCIENTE_CAMERA_TO_AYUDA", name _ayuda, ceil (_bleedOutConst - time)]; };

		_camTarget = player;
		if (!isNull _ayuda and isNil "_finishedoff") then { _camTarget = _ayuda; };

		[_texto,0,0,1,0,0,4] spawn bis_fnc_dynamicText;

		if ( (_camTime + 7) <= time ) then
		{
			_camTime = time;

			deadCam camSetPos [
				(position _camTarget select 0) + 12 - random 24,
				(position _camTarget select 1) + 12 - random 24,
				(position _camTarget select 2) + 6];
			deadCam camSetTarget _camTarget;
			deadCam cameraEffect ["internal", "BACK"];
			deadCam camCommit 10;
		};
	};

	sleep 1;

	if ((time > _bleedOutConst) or
		(damage _unit <= 0.25) or
		(_unit getVariable ["suicide",false]) or
		(!isNil "_finishedoff"))
	then { _whileExit = true; };
};

if (isPlayer _unit) then
{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", _respawnMenu];

	if (_unit getVariable ["suicide",false]) then
		{_unit setVariable ["suicide",nil];};

	_finishedoff = _unit getVariable "finishedoff";
	if (!isNil "_finishedoff") then
	{
		if ( isNull _finishedoff ) then
			{ [format ["%1", localize "STR_RESPAWN_INCONSCIENTE_FELL_OF_BURNED"],0,0,10,0,0,4] spawn bis_fnc_dynamicText; }
		else
		{
			// player-killer go to prison
			if (isPlayer _finishedoff and _finishedoff != _unit) then {[_finishedoff,60] remoteExec ["castigo",_finishedoff]}; // TODO test it

			// generate respawn message
			if (isPlayer _finishedoff)
			then { _respMessage = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_PLAYER", name _finishedoff]; }
			else { _respMessage = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_BOT", name _finishedoff]; };
			[format ["%1 %2", localize "STR_RESPAWN_HANDLEDAMAGE", _respMessage],0,0,10,0,0,4] spawn bis_fnc_dynamicText;
		};
	};

	if (time > _bleedOutConst) then
		{[localize "STR_RESPAWN_INCONSCIENTE_BLEEDOUT",0,0,10,0,0,4] spawn bis_fnc_dynamicText;};

	deadCam camSetPos [
		(position player select 0),
		(position player select 1),
		(position player select 2) + 1];
	deadCam camSetTarget player;
	deadCam camCommit 1;
	sleep 1;
	deadCam cameraEffect ["terminate", "BACK"];
	camDestroy deadCam;

	if (hayTFAR) then
	{
		player setVariable ["tf_unable_to_use_radio", false, true];
		player setVariable ["tf_globalVolume", _saveVolume];
		player setVariable ["tf_voiceVolume", _saveVolumeVoice, true];
	};
};

_unit setCaptive false;
_unit setVariable ["inconsciente",nil,true];

if (damage _unit > 0.25) then
{
	if (!isPlayer _unit) then
		{ _unit removeAllEventHandlers "HandleDamage"; };

	_unit setDamage 1;
}
else
{
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";

	if (!isPlayer _unit) then
	{
		{_unit enableAI _x} foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
		_unit stop false;
	};
};
