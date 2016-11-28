private ["_unit","_part","_injurer","_unitSide","_isPlayerWas","_whileExit","_finishedoff","_camTime","_bleedOutConst","_ayuda","_texto","_textoKiller","_textoFinishedoffer","_camTarget","_respawnMenu","_damAccumMessage","_damAccumLimitConst","_isDie","_helpTime","_helpTimeDelayConst","_saveVolume","_saveVolumeVoice"];

_unit = _this select 0;
_part = _this select 1;
_injurer = _this select 2;

if (!local _unit) exitWith {};

_damAccumLimitConst = 65;
_bleedOutConst = time + 360;
_camTimeForCommitConst = 8;
_helpTimeDelayConst = (random 20) + 20;

_unitSide = side _unit;
_unit setCaptive true;

if (_part != "") then { removeHeadgear _unit; };

if ( vehicle _unit != _unit ) then
{
	_unit setVariable ["dieInVehicle",true];
	if ( !alive vehicle _unit ) then
	{
		_unit action ["getOut", vehicle _unit];
		if ( !isPlayer _unit ) then { sleep 5; };
	};
}
else
{
	_unit switchMove "AinjPpneMstpSnonWrflDnon";
	_unit playActionNow "Unconscious";
};

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
				[localize "STR_RESPAWN_MESSAGE_SPACE_KEY",0,0,10,0,0,4] spawn bis_fnc_dynamicText;
			};
			false;
		}];

	if (!isNull _injurer) then
	{
		if (isPlayer _injurer)
		then { _textoKiller = format [localize "STR_RESPAWN_KILLER_IS_PLAYER", name _injurer]; }
		else { _textoKiller = format [localize "STR_RESPAWN_KILLER_IS_BOT", name _injurer]; };
	}	else { _textoKiller = localize "STR_RESPAWN_KILLER_IS_HAPPY"; };

	_textoKiller = format[localize "STR_RESPAWN_MESSAGE_KILLER_NAME", _textoKiller];

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

_whileExit = _unit getVariable ["dieInVehicle",false];
_camTime = time - _camTimeForCommitConst;
_helpTime = time - _helpTimeDelayConst;
_unit setVariable ["finishedoff",nil,true];
_ayuda = objNull;

while { !_whileExit } do
{
	if (random 100 < 9) then { playSound3D [(injuredSounds call BIS_fnc_selectRandom),_unit,false, getPosASL _unit, 1, 1, 50]; };
	if (random 100 > 9) then { _unit setCaptive true; } else { _unit setCaptive false; }; // change side to civilian

	if (isPlayer _unit) then
	{
		if (isNull _ayuda)
		then { _texto = _textoKiller + format [localize "STR_RESPAWN_INCONSCIENTE_CAMERA_TO_PLAYER", ceil (_bleedOutConst - time)]; }
		else { _texto = _textoKiller + format [localize "STR_RESPAWN_INCONSCIENTE_CAMERA_TO_AYUDA", name _ayuda, ceil (_bleedOutConst - time)]; };

		[_texto,0,0,1,0,0,4] spawn bis_fnc_dynamicText;

		if ( (_camTime + _camTimeForCommitConst) <= time ) then
		{
			_camTime = time;

			if (isNull _ayuda)
			then { _camTarget = player; }
			else { _camTarget = _ayuda; };

			deadCam camSetPos [
				(position _camTarget select 0) + 12 - random 24,
				(position _camTarget select 1) + 12 - random 24,
				(position _camTarget select 2) + 6];
			deadCam camSetTarget _camTarget;
			deadCam cameraEffect ["internal", "BACK"];
			deadCam camCommit _camTimeForCommitConst;
		};
	};

	sleep 1;

	_finishedoff = _unit getVariable "finishedoff";

	if ((time > _bleedOutConst) or
		(damage _unit <= 0.25) or
		(_unit getVariable ["suicide",false]) or
		(_unit getVariable ["damAccum", 0] > _damAccumLimitConst) or
		(!isNil "_finishedoff"))
	then { _whileExit = true; };

	if ( (_helpTime + _helpTimeDelayConst) <= time ) then
	{
		_helpTime = time;
		_ayuda = [_unit, _unitSide] call pedirAyuda;
	};
};

_isDie = false;
if ((time > _bleedOutConst) or
	(_unit getVariable ["suicide",false]) or
	(_unit getVariable ["damAccum", 0] > _damAccumLimitConst) or
	(_unit getVariable ["dieInVehicle",false]) or
	(!isNil "_finishedoff"))
then { _isDie = true; };

// player-killer go to prison
if (!isNil "_finishedoff") then
{
	if (isPlayer _finishedoff and _unitSide != civilian and
		[side _finishedoff, _unitSide] call BIS_fnc_sideIsFriendly ) then
		{[_finishedoff,60] remoteExec ["castigo",_finishedoff]};
};

if (isPlayer _unit) then
{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", _respawnMenu];

	if (_unit getVariable ["suicide",false]) then
		{_unit setVariable ["suicide",nil]; };

	_damAccumMessage = "";
	if (_unit getVariable ["damAccum", 0] > _damAccumLimitConst) then
	{
		_damAccumMessage = localize "STR_RESPAWN_MESSAGE_TORN_TO_PIECES";
		[ _textoKiller + _damAccumMessage,0,0,10,0,0,4] spawn bis_fnc_dynamicText;
	};

	if (!isNil "_finishedoff") then
	{
		if (!isNull _finishedoff) then
		{
			if (isPlayer _finishedoff)
			then { _textoFinishedoffer = format [localize "STR_RESPAWN_KILLER_IS_PLAYER", name _finishedoff]; }
			else { _textoFinishedoffer = format [localize "STR_RESPAWN_KILLER_IS_BOT", name _finishedoff]; };
		}	else { _textoFinishedoffer = localize "STR_RESPAWN_KILLER_IS_HAPPY"; };

		_textoFinishedoffer = format[localize "STR_RESPAWN_MESSAGE_FINISHEDOFFER_NAME", _textoFinishedoffer];
		[ _textoKiller + _textoFinishedoffer + _damAccumMessage,0,0,10,0,0,4] spawn bis_fnc_dynamicText;
	};

	if (time > _bleedOutConst) then
		{[_textoKiller + localize "STR_RESPAWN_MESSAGE_BLEEDOUT",0,0,10,0,0,4] spawn bis_fnc_dynamicText; };

	if (_unit getVariable ["dieInVehicle",false]) then
	{
		[_textoKiller + localize "STR_RESPAWN_MESSAGE_DIE_IN_VEH" + _damAccumMessage,0,0,10,0,0,4] spawn bis_fnc_dynamicText;
		_unit setVariable ["dieInVehicle",nil];
	}
	else
	{
		deadCam camSetPos [
			(position player select 0),
			(position player select 1),
			(position player select 2) + 1];
		deadCam camSetTarget player;
		deadCam camCommit 1;
		sleep 1;
	};

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
_unit setVariable ["damAccum",nil,true];
_isPlayerWas = isPlayer _unit;

if (_isDie) then { _unit setDamage 1; }
else
{
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";

	if (!isPlayer _unit) then
	{
		{_unit enableAI _x} foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
		_unit stop false;
	};
};

if (_isPlayerWas)
then { player setVariable ["inconsciente",false,true]; }
else { _unit setVariable ["inconsciente",false,true]; };
