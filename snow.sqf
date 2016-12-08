
FS_SnowDensity = _this select 0;

FS_spawnSnowCube = {
	private ["_step", "_height", "_RelativePositions", "_source"];
	
	FS_SnowSources = [];
	_step = 20;
	_height = 7;
	_RelativePositions = [
		[0, 0, _height],
		[_step, 0, _height], [-_step, 0, _height], 						// left and right
		[_step / 2, _step, _height], [-_step / 2, _step, _height], 		// front : left and right
		[_step / 2, -_step, _height], [-_step / 2, -_step, _height], 	// back : left and right
		[0, 0, _step / 2 + _height], [0, 0, -_step / 2 + _height] 		// up and down
	];

	for [{private _i = 0}, {_i < count _RelativePositions}, {_i = _i + 1}] do 
	{
		_source = "#particlesource" createVehicleLocal getpos player;
		_source setDropInterval FS_SnowDensity; 
		_source setParticleCircle [0.0, [0, 0, 0]];
		_source setParticleRandom [0, [10, 10, 7], [0, 0, 0], 0, 0.01, [0, 0, 0, 0.1], 0, 0];
		_source setParticleParams [
			/*Sprite*/				["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,1], "",// [File,Ntieth,Index,Count,Loop(Bool)], "?"
			/*Type*/				"Billboard", 
			/*TimmerPer*/			1,
			/*Lifetime*/			6, 
			/*Position*/			_RelativePositions select _i,  
			/*MoveVelocity*/		[0,0,0], 
			/*Simulation*/			1,0.0000001,0.000,1.7, //rotationVel,weight,volume,rubbing
			/*Scale*/				[0.07],  
			/*Color*/				[[1,1,1,1]],
			/*AnimSpeed*/			[0,1], 
			/*randDirPeriod*/		0.2, 
			/*randDirIntesity*/		1.2,
			/*onTimerScript*/		"",
			/*DestroyScript*/		"",
			/*Follow*/				player 
			/*Angle*/				//0,
			/*onSurface*/ 			//true,
			/*bounceOnSurface*/		//0.5,
			/*emissiveColor*/		//[[0,0,0,0]]
		];
		
		FS_SnowSources pushBack _source;
	};			
	
	"" spawn FS_SnowPersistence;
};

FS_SnowPersistence = {
  
	while {alive player} do {
		private["_player", "_vel"];
		
		_player = vehicle player;
		_vel = speed _player;
		
		{
			if (_player != (attachedTo _x)) then {
				_x attachto [_player, [0, _vel * 0.5, 8]];
			};
			
			if (underwater player) then {
				_x setDropInterval 0;
			} else {
				_x setDropInterval (FS_SnowDensity / 2 + (random FS_SnowDensity));
			};
		} forEach FS_SnowSources;

		sleep 1;
	};
	
	{
		deleteVehicle _x;
	} forEach FS_SnowSources;
	
	// это нужно размещать в респавне перса
	//waitUntil {alive player};
	//[] spawn FS_spawnSnowCube; // restarts snow
};

/* 	Awesome steam from mouth script by Fess25Rus 

	This script is awesome because it calculates the head direction and turns steam particles velocity according to it. I had never seen something like this before (the scripts I found were pretty simple and without head tracking), so I had to create it myself. This script also changes particles velocity to make steam round the unit's head, i.e. there will be no steam from the neck when unit moves fast!

	Summary, my glorius script :
	+ Tracks the head direction
	+ Makes steam round the neck
	+ Creates steam only when unit actually made an exhale (sound of breathe was played)
 */
FS_makeBreathe = {
	private ["_unit","_breathe","_source","_fog", "_v1", "_v2", "_cosA", "_cosB", "_sinA", "_sinB", "_velocity", "_volume"];
	_unit = _this select 0;
	_breathe = _this select 1;
	
	if (!(_breathe in [1,2,4,6,14])) exitWith {};
	/*
	    1 : Breath
		2 : Breath Injured
		3 : Breath Scuba
		4 : Injured
		5 : Pulsation
		6 : Hit Scream
		7 : Burning
		8 : Drowning
		9 : Drown
		10 : Gasping
		11 : Stabilizing
		12 : Healing
		13 : Healing With Medikit
		14 : Recovered 
	*/
	_source = "logic" createVehicleLocal (getpos _unit);
	_source attachto [_unit, [0,0.15,0], "neck"];
	
	_fog = "#particlesource" createVehicleLocal getpos _source;
	_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
	_fog setDropInterval 0.001;

	_fog setParticleParams [
		/*Sprite*/ 			["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0], "",
		/*Type*/ 			"Billboard",
		/*TimmerPer*/ 		0.5,
		/*Lifetime*/ 		0.5,
		/*Position*/ 		[0,0,0],
		/*MoveVelocity*/ 	[1.2, 1.2,-0.2],
		/*Simulation*/ 		1, 1.275, 1, 0.2, //rotationVel,weight,volume,rubbing
		/*Scale*/ 			[0, 0.2,0],
		/*Color*/ 			[[1,1,1, 0.001], [1,1,1, 0.01], [1,1,1, 0]],
		/*AnimSpeed*/ 		[1000],
		/*randDirPeriod*/ 	1,
		/*randDirIntesity*/ 0.04,
		/*onTimerScript*/ 	"",
		/*DestroyScript*/ 	"", 
		/*Follow*/ 			_source
	];
	
	for [{_i = 0}, {_i < 10}, {_i = _i + 1}] do {
		_v1 = vectorDir _unit;
		_v2 = eyeDirection _unit;
		_cosA = [0,1,0] vectorCos _v1; 	// cos between north and body direction
		_cosB = _v1 vectorCos _v2;		// cos between head- and body- directions
		_sinA = sqrt(1 - _cosA^2);
		_sinB = sqrt(1 - _cosB^2);
		
		/* initial direction */
		_velocity = [0, 1.2, -0.2];
		
		_volume = (_v1 select 0)*(_v2 select 1)-(_v1 select 1)*(_v2 select 0);
		// Which is equal to "(_v1 vectorCrossProduct _v2) select 2", but FASTER
		// We can find out which vector is on the right by calculating the volume of cross product
		// Volume will be negative if we turn head to the left and positive if turn to the right
		
		/* direction when unit is running (to make steam round the neck && to prevent steam from the neck) */ 
		if (speed _unit > 5) then 
		{
			if (_volume <= 0) then {
				_velocity = [2.2, 1.2, -0.2]; 
			} else {
				_velocity = [-2.2, 1.2, -0.2]; 
			};
		};
		
		/* 1. Turn due to body direction */
		if (getDir _unit > 180 && getDir _unit <= 360) then {
			_velocity = [
							(_velocity select 0) * _cosA - (_velocity select 1) * _sinA, 
							(_velocity select 0) * _sinA + (_velocity select 1) * _cosA, 
							-0.2
						];
		} else {
			_velocity = [
							(_velocity select 0) * _cosA + (_velocity select 1) * _sinA, 
							-(_velocity select 0) * _sinA + (_velocity select 1) * _cosA, 
							-0.2
						];
		};
	
		/* 2. Turn due to head direction */
		if (_volume <= 0) then { _sinB = -1 * _sinB; };
		
		_velocity = [
						(_velocity select 0) * _cosB - (_velocity select 1) * _sinB, 
						(_velocity select 0) * _sinB + (_velocity select 1) * _cosB, 
						-0.2
					];
		
		_fog setParticleParams [
			/*Sprite*/ 			["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0], "",
			/*Type*/ 			"Billboard",
			/*TimmerPer*/ 		0.5,
			/*Lifetime*/ 		0.5,
			/*Position*/ 		[0,0,0],
			/*MoveVelocity*/ 	_velocity,
			/*Simulation*/ 		1, 1.275, 1, 0.2, //rotationVel,weight,volume,rubbing
			/*Scale*/ 			[0, 0.2,0],
			/*Color*/ 			[[1,1,1, 0.001], [1,1,1, 0.01], [1,1,1, 0]],
			/*AnimSpeed*/ 		[1000],
			/*randDirPeriod*/ 	1,
			/*randDirIntesity*/ 0.04,
			/*onTimerScript*/ 	"",
			/*DestroyScript*/ 	"", 
			/*Follow*/ 			_source
		];
		
		sleep 0.05;
	};

	_fog setDropInterval 1;
	
	deleteVehicle _fog;
	deleteVehicle _source;
};

// ====================================================================

1 setFog 1;
[] spawn FS_spawnSnowCube;
{
	_x setVariable ["EH_SoundPlayed_idx", _x addEventHandler ["SoundPlayed", {_this spawn FS_makeBreathe; }]];
}
forEach units group player;

