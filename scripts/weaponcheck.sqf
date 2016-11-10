private ["_weapons"];

_weapons = _this select 0;

/*
if !(hayRHS) then {
	genLMGs = 		["LMG_Mk200_F","LMG_Zafir_F","arifle_MX_SW_F"];
	genGL = 		["arifle_Katiba_GL_F","arifle_MX_GL_F","arifle_Mk20_GL_F","arifle_TRG21_GL_F"];
	genSNPR = 		["srifle_DMR_01_F","srifle_EBR_F","srifle_GM6_F","srifle_LRR_F","arifle_MXM_F","srifle_DMR_06_olive_F"];
}
else {
	genLMGs = 		["rhs_weap_pkp","rhs_weap_pkm"];
	genGL = 		["rhs_weap_akm_gp25","rhs_weap_akms_gp25","rhs_weap_ak103_gp25","rhs_weap_ak74m_gp25"];
	genSNPR = 		["rhs_weap_vss","rhs_weap_svds","rhs_weap_svdp_wd","srifle_GM6_F","rhs_weap_svdp"];
};
*/

{
	call {
		if (_x in genLMGs) exitWith {server setVariable ["genLMGlocked",false,true];};
		if (_x in genGL) exitWith {server setVariable ["genGLlocked",false,true];};
		if (_x in genSNPR) exitWith {server setVariable ["genSNPRlocked",false,true];};
		if (_x in genATLaunchers) exitWith {server setVariable ["genATlocked",false,true];};
		if (_x in genAALaunchers) exitWith {server setVariable ["genAAlocked",false,true];};
	};
} forEach _weapons;