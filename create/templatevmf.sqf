// (un-)armed transport helicopters
opHeliTrans = 		["rhs_ka60_grey","RHS_Mi8AMTSh_FAB_vvs"];

// helicopter that dismounts troops
opHeliDismount = 	"RHS_Mi8AMTSh_FAB_vvs"; // Mi-290 Taru (Bench)

// helicopter that fastropes troops in
opHeliFR = 			"rhs_ka60_grey"; // PO-30 Orca (Unarmed)

// gunship
opGunship = 		"RHS_Mi24V_UPK23_vvs"; // Mi-48 Kajman

// CAS, fixed-wing
opCASFW = 			["RHS_Su25SM_vvs", "RHS_T50_vvs_generic"]; // To-199 Neophron (CAS)

// small UAV (Darter, etc)
opUAVsmall = 		"rhs_pchela1t_vvs"; // Tayran AR-2

// air force
opAir = 			["rhs_ka60_grey","RHS_Mi8AMTSh_FAB_vvs","RHS_Mi24V_UPK23_vvs","RHS_Su25SM_vvs","RHS_Mi24P_vvs"];

// self-propelled anti air
opSPAA = 			"rhs_zsu234_aa";

opTruck = 			"RHS_Ural_Flat_VMF_01";

opMRAPu = 			"rhs_tigr_vmf";

// infantry classes, to allow for class-specific skill adjustments and pricing
opI_OFF = 	"O_T_Officer_F"; // officer/official
opI_PIL = 	"O_T_Pilot_F"; // pilot
opI_OFF2 = 	"O_T_Soldier_TL_F"; // officer/traitor
opI_CREW = 	"O_T_Crew_F"; // crew
opI_MK = 	"O_T_Soldier_M_F";
opI_MED =	"O_T_Medic_F";
opI_RFL1 = 	"O_T_Soldier_F";
opI_RFL2 = 	"O_T_Soldier_AT_F";
opI_AR = 	"O_T_Soldier_AR_F";
opI_AR2 = 	"O_T_Soldier_AA_F";
opI_SL = 	"O_T_Soldier_SL_F";
opI_MK2 = 	"O_T_Soldier_AA_F";
opI_AAR = 	"O_T_Soldier_AAR_F";
opI_SP = 	"O_T_Soldier_UAV_F";
opI_GL =	"O_T_Soldier_GL_F";
opI_LAT = 	"O_T_Soldier_LAT_F";

// config path for infantry groups
opCfgInf = 			(configfile >> "CfgGroups" >> "east" >> "OPF_F" >> "Infantry");

// standard group arrays, used for spawning groups
opGroup_Sniper = 	[opI_MK, opI_RFL2, opI_MK2, opI_SP]; // sniper team
opGroup_SpecOps = 	[opI_SL, opI_MK, opI_MED, opI_RFL1, opI_RFL2, opI_AR2, opI_MK2, opI_SP]; // spec opcs
opGroup_Squad = 	[opI_RFL1, opI_AR, opI_AAR, opI_MK, opI_SP, opI_MED, opI_GL, opI_LAT]; // squad
opGroup_Security = 	[opI_RFL1, opI_MK2, opI_RFL2, opI_MED, opI_SP]; // security detail

// the affiliation
side_red = 			east;

opFlag = 			"Flag_CSAT_F";

opIR = "rhs_acc_perst1ik";