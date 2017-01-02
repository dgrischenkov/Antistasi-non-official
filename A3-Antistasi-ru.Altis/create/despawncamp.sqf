if (!isServer and hasInterface) exitWith {};

/*
0: position of the camp
1: type of the camp
*/

_pos = _this select 0;
_type = _this select 1;
_objs = [];

{
	if (str typeof _x find "Land_Campfire_" > -1) then {_x inflame false;};
} forEach nearestObjects [_pos, [], 40];
sleep 2;

if (_type == "campFIA") then {
	{
    	if ((  str typeof _x find "Land_TentA_" > -1
        	or str typeof _x find "Land_Campfire_" > -1
        	or str typeof _x find "Land_FoodContainer_01_" > -1
        	or str typeof _x find campCrate > -1))
		then {
        	_objs pushBack _x;
   		};
	} forEach nearestObjects [_pos, [], 40];

};

if (_type == "campTony") then {
	{
		 if (  str typeof _x find blackMarketCrate > -1
       	    or str typeof _x find "Land_Wreck_Ural_F" > -1
        	or str typeof _x find "Land_TentDome_F" > -1
        	or str typeof _x find "Land_Campfire_" > -1)
		then {
        	_objs pushBack _x;
    	};
	} forEach nearestObjects [_pos, [], 15];
};

if (_type == "exp") then {
    {
         if (  str typeof _x find "Land_Money_F" > -1
            or str typeof _x find "Box_IED_Exp_F" > -1
            or str typeof _x find "Land_Suitcase_F" > -1
            or str typeof _x find "Land_WoodenCounter_01_F" > -1
            or str typeof _x find "Oil_Spill_F" > -1
            or str typeof _x find "Box_Syndicate_Wps_F" > -1
            or str typeof _x find "Land_PlasticCase_01_medium_F" > -1
            or str typeof _x find "Land_Sign_Mines_F" > -1
            or str typeof _x find "Land_GasTank_01_blue_F" > -1
            or str typeof _x find "Land_Sacks_goods_F" > -1
            or str typeof _x find "Land_FireExtinguisher_F" > -1
            or str typeof _x find "Item_ToolKit" > -1
            or str typeof _x find "Land_WeldingTrolley_01_F" > -1
            or str typeof _x find "Land_Wreck_Van_F" > -1
            or str typeof _x find "Land_ClothShelter_02_F" > -1)
        then {
            _objs pushBack _x;
        };
    } forEach nearestObjects [_pos, [], 15];
};

if (_type == "camp") then {
    {
         if ( str typeof _x find "Box_NATO_Equip_F" > -1
            or str typeof _x find "CamoNet_BLUFOR_F" > -1
            or str typeof _x find "CamoNet_INDP_open_F" > -1
            or str typeof _x find "Land_Ammobox_rounds_F" > -1
            or str typeof _x find "Land_Axe_F" > -1
            or str typeof _x find "Land_Axe_fire_F" > -1
            or str typeof _x find "Land_BagFence_Round_F" > -1
            or str typeof _x find "Land_BottlePlastic_V2_F" > -1
            or str typeof _x find "Land_Campfire_F" > -1
            or str typeof _x find "Land_Camping_Light_F" > -1
            or str typeof _x find "Land_CampingChair_V1_F" > -1
            or str typeof _x find "Land_CanisterFuel_F" > -1
            or str typeof _x find "Land_Canteen_F" > -1
            or str typeof _x find "Land_ClothShelter_01_F" > -1
            or str typeof _x find "Land_GasCooker_F" > -1
            or str typeof _x find "Land_Ground_sheet_folded_khaki_F" > -1
            or str typeof _x find "Land_Ground_sheet_khaki_F" > -1
            or str typeof _x find "Land_Map_unfolded_F" > -1
            or str typeof _x find "Land_Matches_F" > -1
            or str typeof _x find "Land_MetalBarrel_F" > -1
            or str typeof _x find "Land_PainKillers_F" > -1
            or str typeof _x find "Land_PlasticCase_01_small_F" > -1
            or str typeof _x find "Land_Sack_F" > -1
            or str typeof _x find "Land_SharpStone_01" > -1
            or str typeof _x find "Land_Sleeping_bag_brown_F" > -1
            or str typeof _x find "Land_Sleeping_bag_F" > -1
            or str typeof _x find "Land_Sleeping_bag_folded_F" > -1
            or str typeof _x find "Land_TentA_F" > -1
            or str typeof _x find "Land_TentDome_F" > -1
            or str typeof _x find "Land_TinContainer_F" > -1
            or str typeof _x find "Land_WoodenBox_F" > -1
            or str typeof _x find "Land_WoodenLog_F" > -1
            or str typeof _x find "Land_WoodPile_F" > -1
            or str typeof _x find "Land_WoodPile_large_F" > -1
            or str typeof _x find "ShootingMat_01_folded_Olive_F" > -1
            or str typeof _x find "ShootingMat_01_Olive_F" > -1)
        then {
            _objs pushBack _x;
        };
    } forEach nearestObjects [_pos, [], 40];
};

{
	_x enableSimulation false;
    _x hideObjectGlobal true;
} foreach _objs;