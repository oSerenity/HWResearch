// ギミックが生成される前に、生成を抑止する予約を行う 
function GimmickDisable( stage_seed ) {
	switch ( stage_seed.settingID_ ) {
	case 0:
		// ギミック名を列挙し、表示させないようにする 
		// SetGimmickDisable( "TagName" );
		break;
	}
}

// ギミックが生成された後に、設定変更を行う 
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

		// RULE_BUILDING_STATE_COMPLETE		// 完成
		// RULE_BUILDING_STATE_MATERIALS	// 資材置き場 
		// RULE_BUILDING_STATE_BROKEN		// 破壊（看板）
		// SetGimmickBuild( "TagName", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 

		//城の周り 
		SetGimmickBuild( "Wgbal01_001", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Wgbal01_003", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Wgbal01_005", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Wgbal01_007", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Bgbal01_001", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Bgbal01_003", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Bgbal01_005", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Bgbal01_007", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		//フィールド 
		SetGimmickBuild( "gcat01_101", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gcat01_102", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gcat01_201", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gcat01_202", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gbal01_101", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gbal01_201", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gbal01_103", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "gbal01_203", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		
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

		// RULE_BUILDING_STATE_COMPLETE		// 完成
		// RULE_BUILDING_STATE_MATERIALS	// 資材置き場 
		// RULE_BUILDING_STATE_BROKEN		// 破壊（看板）
		// SetGimmickBuild( "TagName", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		
		break;

	case 2:	//お試しプレイ用 
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

		// RULE_BUILDING_STATE_COMPLETE		// 完成
		// RULE_BUILDING_STATE_MATERIALS	// 資材置き場 
		// RULE_BUILDING_STATE_BROKEN		// 破壊（看板）
		// SetGimmickBuild( "TagName", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		
		//城の周り 
		SetGimmickBuild( "Wgbal01_002", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Wgbal01_005", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Bgbal01_002", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		SetGimmickBuild( "Bgbal01_005", RULE_BUILDING_STATE_COMPLETE );		// 建築済み 
		
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
// 06/03追加
"gmon01.bres"
"gmon01m.bres"
"gmon01b.bres"
"gcru01.bres"
//"gdea01.bres"
// 08/08追加
"gspg01.bres"
"gcloAber.bres"
"gcloBjump.bres"
"gcloAnet.bres"
"gcloArag.bres"
//エンジニア追加
"gcat02.bres"
"gcat02b.bres"
"gcat02m.bres"
"gshe03.bres"
"gbal02.bres"
"gbal02b.bres"
"gbal02m.bres"
"grob01.bres"
"grob01m.bres"
//宣伝用看板追加
"gcmw01.bres"
]
