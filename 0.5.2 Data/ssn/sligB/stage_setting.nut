/* XDASEA_Xm8R_SPsX */ 
// ƒMƒ~ƒbƒN‚ª¶¬‚³‚κ‚ι‘O‚ΙA¶¬‚π—}~‚·‚ι—\–ρ‚πs‚¤ 
function GimmickDisable( stage_seed ) {
	switch ( stage_seed.settingID_ ) {
	case 0:
		// ƒMƒ~ƒbƒN–Ό‚π—ρ‹“‚µA•\¦‚³‚Ή‚Θ‚Ά‚ζ‚¤‚Ι‚·‚ι 
		// SetGimmickDisable( "TagName" );
		break;
	}
}

// ƒMƒ~ƒbƒN‚ª¶¬‚³‚κ‚½γ‚ΙAέ’θ•ΟX‚πs‚¤ 
function GimmickSetting( stage_seed ) {
	switch ( stage_seed.settingID_ ) {
	case 0:
		// POWER_COLOR_WHITE, POWER_COLOR_BLACK, POWER_COLOR_UNKNOWN 
		// SetGimmickColor( "TagName", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gcmoA_001", POWER_COLOR_BLACK );
		SetGimmickColor( "gcmoB_001", POWER_COLOR_WHITE );
		SetGimmickColor( "ggat01_001", POWER_COLOR_BLACK );
		SetGimmickColor( "ggat01_002", POWER_COLOR_WHITE );
		SetGimmickColor( "gfmo_001", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gfmo_002", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gfmo_003", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gbar01_001", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_002", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_003", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_004", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_005", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_006", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_007", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_008", POWER_COLOR_WHITE );

		// RULE_BUILDING_STATE_COMPLETE		// ®¬
		// RULE_BUILDING_STATE_MATERIALS	// ‘ή’u‚«κ 
		// RULE_BUILDING_STATE_BROKEN		// ”j‰σiΕ”Βj
		// SetGimmickBuild( "TagName", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 

		//ι‚Μό‚θ 
		SetGimmickBuild( "Wgbal01_001", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Wgbal01_003", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Wgbal01_004", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Wgbal01_006", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Bgbal01_001", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Bgbal01_003", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Bgbal01_004", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Bgbal01_006", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		//ƒtƒB[ƒ‹ƒh 
		SetGimmickBuild( "gcat01_101", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "gcat01_106", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "gbal01_103", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "gbal01_104", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "gbal01_105", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "gbal01_106", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		
		break;
		
	case 1:
		// POWER_COLOR_WHITE, POWER_COLOR_BLACK, POWER_COLOR_UNKNOWN 
		// SetGimmickColor( "TagName", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gcmoA_001", POWER_COLOR_BLACK );
		SetGimmickColor( "gcmoB_001", POWER_COLOR_WHITE );
		SetGimmickColor( "ggat01_001", POWER_COLOR_BLACK );
		SetGimmickColor( "ggat01_002", POWER_COLOR_WHITE );
		SetGimmickColor( "gfmo_001", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gfmo_002", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gfmo_003", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gbar01_001", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_002", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_003", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_004", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_005", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_006", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_007", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_008", POWER_COLOR_WHITE );

		// RULE_BUILDING_STATE_COMPLETE		// ®¬
		// RULE_BUILDING_STATE_MATERIALS	// ‘ή’u‚«κ 
		// RULE_BUILDING_STATE_BROKEN		// ”j‰σiΕ”Βj
		// SetGimmickBuild( "TagName", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		
		break;

	case 2:	//‚¨‚µƒvƒƒC—p 
		// POWER_COLOR_WHITE, POWER_COLOR_BLACK, POWER_COLOR_UNKNOWN 
		// SetGimmickColor( "TagName", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gcmoA_001", POWER_COLOR_BLACK );
		SetGimmickColor( "gcmoB_001", POWER_COLOR_WHITE );
		SetGimmickColor( "ggat01_001", POWER_COLOR_BLACK );
		SetGimmickColor( "ggat01_002", POWER_COLOR_WHITE );
		SetGimmickColor( "gfmo_001", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gfmo_002", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gfmo_003", POWER_COLOR_UNKNOWN );
		SetGimmickColor( "gbar01_001", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_002", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_003", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_004", POWER_COLOR_BLACK );
		SetGimmickColor( "gbar01_005", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_006", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_007", POWER_COLOR_WHITE );
		SetGimmickColor( "gbar01_008", POWER_COLOR_WHITE );

		// RULE_BUILDING_STATE_COMPLETE		// ®¬
		// RULE_BUILDING_STATE_MATERIALS	// ‘ή’u‚«κ 
		// RULE_BUILDING_STATE_BROKEN		// ”j‰σiΕ”Βj
		// SetGimmickBuild( "TagName", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		
		//ι‚Μό‚θ 
		SetGimmickBuild( "Wgbal01_002", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Wgbal01_005", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Bgbal01_002", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		SetGimmickBuild( "Bgbal01_005", RULE_BUILDING_STATE_COMPLETE );		// ’zΟ‚έ 
		
		break;
	}
}

gStageGimmickFileList <- [
"gall01.bres"
"gshe01.bres"
//"gshe02.bres"
"gcra01.bres"
"gice01.bres"
"gmet01.bres"
"gtorn01.bres"
"gtou01.bres"
"gtou02.bres"
"gtou03.bres"
"gtou04.bres"
"gtou05.bres"
"gtou06.bres"
"gtou07.bres"
"gtou08.bres"
"gtou09.bres"
//"gtrop01.bres"
//"gwind01.bres"
"gbal01.bres"
"gbal01b.bres"
"gbal01m.bres"
//"gbal02m.bres"
"gbar01.bres"
"gbar01b.bres"
"gbom01.bres"
"gbom02.bres"
"gcat01.bres"
"gcat01b.bres"
"gcat01m.bres"
"gcmoA.bres"
"gcmoB.bres"
"gfla01.bres"
"gfla02.bres"
"gfmoA.bres"
"gfmoB.bres"
"ggat01.bres"
"ggat01b.bres"
"ggat02.bres"
"ggat02b.bres"
"glad01.bres"
"glad01b.bres"
"glad01m.bres"
//"glad02m.bres"
"gbri01.bres"
"gbri01b.bres"
//"gbri02.bres"
//"gbri02b.bres"
"gligAboat.bres"
// 06/03’Η‰Α
"gmon01.bres"
"gmon01m.bres"
"gmon01b.bres"
"gcru01.bres"
//"gdea01.bres"
// 08/08’Η‰Α
"gspg01.bres"
//ƒGƒ“ƒWƒjƒA’Η‰Α
"gbal02.bres"
"gbal02b.bres"
"gbal02m.bres"
"gcat02.bres"
"gcat02b.bres"
"gcat02m.bres"
"gshe03.bres"
"grob01.bres"
"grob01m.bres"
"gcbom01.bres"
//ι“`—pΕ”Β’Η‰Α
//"gcmw01.bres"
//αχƒoƒt—pƒoƒƒG[ƒVƒ‡ƒ“’Η‰Α
"gcru02.bres"
"gcru03.bres"
"gcru04.bres"
//ƒeƒNƒXƒ`ƒƒ‹¤—L‚Μκ‡‚ΝƒeƒNƒXƒ`ƒƒ³‚ª“ό‚Α‚Δ‚Ά‚ιƒMƒ~ƒbƒN‚ªγΚ‚Ι‚Ά‚Θ‚―‚κ‚Ξ‚Ά‚―‚Θ‚ΆB
]
