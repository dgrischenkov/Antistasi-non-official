private ["_sitio","_texto","_garrison","_size","_posicion"];

_sitio = _this select 0;

_garrison = garrison getVariable [_sitio,[]];

_size = [_sitio] call sizeMarker;
_posicion = getMarkerPos _sitio;

_texto = format [localize "STR_UI_GARRISON_INFO", count _garrison, {_x == "B_G_Soldier_SL_F"} count _garrison, {_x == "b_g_soldier_unarmed_f"} count _garrison, {_x == "B_G_Soldier_F"} count _garrison, {_x == "B_G_Soldier_AR_F"} count _garrison,{_x == "B_G_medic_F"} count _garrison,{_x == "B_G_Soldier_GL_F"} count _garrison,{_x == "B_G_Soldier_M_F"} count _garrison,{_x == "B_G_Soldier_LAT_F"} count _garrison, {_x == "B_Soldier_AA_F"} count _garrison, {_x distance _posicion < _size} count staticsToSave];

_texto