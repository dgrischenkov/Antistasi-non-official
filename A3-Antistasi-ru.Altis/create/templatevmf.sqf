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
opI_OFF = 	"rhs_vmf_recon_officer"; // officer/official
opI_PIL = 	"rhs_pilot_combat_heli"; // pilot
opI_OFF2 = 	"rhs_vmf_recon_officer_armored"; // officer/traitor
opI_CREW = 	"rhs_vmf_recon_rifleman"; // crew
opI_MK = 	"rhs_vmf_recon_marksman";
opI_MED =	"rhs_vmf_recon_medic";
opI_RFL1 = 	"rhs_vmf_recon_rifleman_l";
opI_RFL2 = 	"rhs_vmf_recon_rifleman_scout";
opI_AR = 	"rhs_vmf_recon_arifleman";
opI_AR2 = 	"rhs_vmf_recon_arifleman_scout";
opI_SL = 	"rhs_vmf_recon_sergeant";
opI_MK2 = 	"rhs_vmf_recon_marksman_vss";
opI_AAR = 	"rhs_vmf_recon_machinegunner_assistant";
opI_SP = 	"rhs_vmf_recon_rifleman_asval";
opI_GL =	"rhs_vmf_recon_grenadier";
opI_LAT = 	"rhs_vmf_recon_rifleman_lat";

// config path for infantry groups
opCfgInf = 			(configfile >> "CfgGroups" >> "east" >> "OPF_F" >> "Infantry");

// standard group arrays, used for spawning groups
opGroup_Sniper = 	[opI_MK, opI_RFL2, opI_MK2]; // sniper team
opGroup_SpecOps = 	[opI_SL, opI_MK, opI_MED, opI_RFL1, opI_RFL2, opI_AR2, opI_MK2]; // spec opcs
opGroup_Squad = 	[opI_RFL1, opI_AR, opI_AAR, opI_MK, opI_SP, opI_MED, opI_GL, opI_LAT]; // squad
opGroup_Security = 	[opI_RFL1, opI_MK2, opI_RFL2, opI_MED]; // security detail

// the affiliation
side_red = 			east;

opFlag = 			"Flag_CSAT_F";

opIR = "rhs_acc_perst1ik";