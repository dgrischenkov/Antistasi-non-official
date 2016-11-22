private ["_unit","_unitSide","_grupo","_grupos","_isLeader","_dummyGroup","_bleedOutConst","_suicide","_saveVolume","_ayuda","_ayudado","_texto","_camTarget","_saveVolumeVoice","_inconsciente"];

_unit = _this select 0;

if (!local _unit) exitWith {};
if (damage _unit < 0.9) exitWith {};
if (_unit getVariable "inconsciente") exitWith {};

_bleedOutConst = time + 360;

_unitSide = side _unit;
_unit setVariable ["inconsciente",true,true];
_unit setVariable ["ayudado",false];
_unit setCaptive true;
_unit switchMove "AinjPpneMstpSnonWrflDnon";
_unit playActionNow "Unconscious";
_unit setFatigue 1;

if (vehicle _unit != _unit) then { _unit action ["getOut", vehicle _unit]; };

if (isPlayer _unit) then
{
	closeDialog 0;

	disableUserInput true;
	titleText ["", "BLACK FADED"];
	sleep 3;
	titleText ["", "BLACK IN", 1];
	disableUserInput false;

	respawnMenu = (findDisplay 46) displayAddEventHandler
		["KeyDown", { if (_this select 1 == 57) then { [player] spawn respawn; }; false; }];
	publicVariable "respawnMenu";

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

while { (time < _bleedOutConst) and (alive _unit) and (damage _unit > 0.25) } do
{
	_tiempo = 5 + random 5;

	_ayuda = [_unit, _unitSide] call pedirAyuda;

	if (random 10 < 1) then { playSound3D [(injuredSounds call BIS_fnc_selectRandom),_unit,false, getPosASL _unit, 1, 1, 50]; };

	if (isPlayer _unit) then
	{
		if (isNull _ayuda) then
		{
			_texto = format ["<t size='0.6'>There is no AI near to help you.<t size='0.5'><br/>Hit SPACE to Respawn"];
			_camTarget = player;
		}
		else
		{
			_texto = format ["<t size='0.6'>%1 is on the way to help you.<t size='0.5'><br/>Hit SPACE to Respawn",name _ayuda];
			_camTarget = _ayuda;
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
};

// reviwed or dead
if (_unit getVariable ["inconsciente", false] and !(damage _unit > 0.25)) then
{
	_unit setCaptive false;
	_unit setVariable ["inconsciente",false,true];
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon_healed";

	if (isPlayer _unit) then
	{
		(findDisplay 46) displayRemoveEventHandler ["KeyDown", respawnMenu];

		deadCam camSetPos [
			(position player select 0),
			(position player select 1),
			(position player select 2) + 1];
		deadCam camSetTarget player;
		deadCam camCommit 2;
		sleep 2;
		deadCam cameraEffect ["terminate", "BACK"];
		camDestroy deadCam;

		if (hayTFAR) then
		{
			player setVariable ["tf_unable_to_use_radio", false, true];
			player setVariable ["tf_globalVolume", _saveVolume];
			player setVariable ["tf_voiceVolume", _saveVolumeVoice, true];
		};
	}
	else
	{
		{_unit enableAI _x} foreach ["TARGET","AUTOTARGET","MOVE","ANIM"];
		_unit stop false;
	};
}
else
{
	if ((isPlayer _unit) and (damage _unit > 0)) then
	{
		[_unit] spawn respawn;
	}
	else
	{
		_unit setDamage 1;
	};
};
