private ["_unit","_part","_injurer","_unitSide","_whileExit","_bleedOutConst","_ayuda","_texto","_camTarget","_respawnMenu","_respMessage","_saveVolume","_saveVolumeVoice"];

_unit = _this select 0;
_part = _this select 1;
_injurer = _this select 2;

if (!local _unit) exitWith {};

_bleedOutConst = time + 360;

_unit switchMove "AinjPpneMstpSnonWrflDnon";
_unit playActionNow "Unconscious";
_unit setFatigue 1;

if (_part != "") then { removeHeadgear _unit; };
if (vehicle _unit != _unit) then { _unit action ["getOut", vehicle _unit]; };

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
_unit setVariable ["finishedoff",false,true];
_unitSide = side _unit;

while { !_whileExit } do
{
	_tiempo = 5 + random 5;

	if (random 10 < 1) then { playSound3D [(injuredSounds call BIS_fnc_selectRandom),_unit,false, getPosASL _unit, 1, 1, 50]; };
	if (random 10 > 9) then { _unit setCaptive false; } else { _unit setCaptive true; }; // change side to civilian

	_ayuda = [_unit, _unitSide] call pedirAyuda;

	if (isPlayer _unit) then
	{
		_camTarget = player;
		if (isNull _ayuda) then
		{
			_texto = format [localize "STR_RESPAWN_INCONSCIENTE_CAMERA_TO_PLAYER", _bleedOutConst - time];
		}
		else
		{
			_texto = format [localize "STR_RESPAWN_INCONSCIENTE_CAMERA_TO_AYUDA", name _ayuda, _bleedOutConst - time];
			if (!(_unit getVariable ["finishedoff",false])) then { _camTarget = _ayuda; };
		};

		[_texto,0,0,_tiempo,0,0,4] spawn bis_fnc_dynamicText;

		deadCam camSetPos [
			(position _camTarget select 0) + 12 - random 24,
			(position _camTarget select 1) + 12 - random 24,
			(position _camTarget select 2) + 6];
		deadCam camSetTarget _camTarget;
		deadCam cameraEffect ["internal", "BACK"];
		deadCam camCommit _tiempo;
	};

	sleep _tiempo;

	if ((time > _bleedOutConst) or
		(damage _unit <= 0.25) or
		(_unit getVariable ["suicide",false]) or
		(_unit getVariable ["finishedoff",false])
	) then { _whileExit = true; };
};

if (isPlayer _unit) then
{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", _respawnMenu];

	if (_unit getVariable ["suicide",false]) then
		{_unit setVariable ["suicide",nil];};

	if (_unit getVariable ["finishedoff",false]) then
	{
		// player-killer go to prison
		if (isPlayer _injurer and _injurer != _unit) then {[_injurer,60] remoteExec ["castigo",_injurer]};

		// generate respawn message
		_respMessage = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_BOT", name _injurer];
		if (isPlayer _injurer)
		then { _respMessage = format [localize "STR_RESPAWN_HANDLEDAMAGE_BY_PLAYER", name _injurer]; };
		[format ["%1 %2", localize "STR_RESPAWN_HANDLEDAMAGE", _respMessage],0,0,10,0,0,4] spawn bis_fnc_dynamicText;
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

if (damage _unit > 0.25) then { _unit setDamage 1; }
else
{
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";

	if (!isPlayer _unit) then
	{
		{_unit enableAI _x} foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
		_unit stop false;
	};
};
