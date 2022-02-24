//COOPモード第一回戦（15vs15) 
//作成：落合勇介 
//
gTeamSet_num <- 0;
function initMission() 
{
	//敵チームを確定する(ロードの狭間） 
	print("[CoopM] unit()\n");
	
//	local TeamSet_num = 0;	//チーム決定のためのローカル変数 
//	TeamSet_num = scr_GetCoopBotTeamRandomIndex( 1, 4 );	//ランダムでチーム№を決定する 
	gTeamSet_num = scr_GetCoopBotTeamRandomIndex( 1, 8 );	//ランダムでチーム№を決定する 


	if(gTeamSet_num == 1)
	{
		print("teamNo01()\n");
		//チーム№１ ：雑魚軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01001" );

		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_A_01" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_A_02" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_A_03" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_06" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_07" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_08" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_09" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_A_04" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_10" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "STEEL_HEAD_A_05" );	//15人目 
	}
	if(gTeamSet_num == 2)
	{
		print("teamNo02()\n");
		//チーム№2 ：戦士軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01002" );

		scr_BotPlayerRegistCoopProfile( "WARR_DRAGON_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DRAGON_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "WARR_GUARDNER_01" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "WARR_GUARDNER_02" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "WARR_KNIGHT_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "WARR_KNIGHT_02" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "WARR_KNIGHT_03" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DR_KNIGHT_01" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DR_KNIGHT_02" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DR_KNIGHT_03" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "WARR_SPIN_01" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "WARR_SPIN_02" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "WARR_KNIGHT_04" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DR_KNIGHT_04" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "WARR_SPIN_03" );	//15人目 
	}
	if(gTeamSet_num == 3)
	{
		print("teamNo03()\n");
		scr_SetCoopBotTeamNameTextId( "$TXCET01003" );
		//チーム№3 ：魔法使い軍団 
		scr_BotPlayerRegistCoopProfile( "MAGE_FIRE_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_FIRE_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_LIGHTNING" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_FROST" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_BLASTER" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_WIZARD_01" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_WIZARD_02" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_UNLIMITED" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_01" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_02" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_03" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_04" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_05" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_FIRE_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_06" );	//14人目 
	}
	if(gTeamSet_num == 4)
	{
		print("teamNo04()\n");
		//チーム№4 ：僧侶軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01004" );


		scr_BotPlayerRegistCoopProfile( "CLER_HEALER_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "CLER_HEALER_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "CLER_CARPENTER_01" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "CLER_CARPENTER_02" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_02" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_03" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_04" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "CLER_ALLROUNDER_01" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "CLER_ALLROUNDER_02" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "CLER_DEADMASTER_01" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "CLER_DEADMASTER_02" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "CLER_ALLROUNDER_03" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "CLER_ALLROUNDER_04" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_05" );	// 9人目 
	}
	if(gTeamSet_num == 5)
	{
		print("teamNo05()\n");
		//チーム№5 ：トマト軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01005" );

		scr_BotPlayerRegistCoopProfile( "TOMA_STONEMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_STONEMAN_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_STONEMAN_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_SPIN_01" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_SPIN_02" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_FATMAN_01" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_FUNNY_01" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_FUNNY_02" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_TOWERBUILDER_01" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_TOWERBUILDER_02" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_HAVENOT_01" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_HAVENOT_02" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_HAVENOT_03" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_FATMAN_02" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_SPIN_03" );	// 6人目 
	}
	if(gTeamSet_num == 6)
	{
		print("teamNo06()\n");
		//チーム№6 ：ロボット軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01006" );

		scr_BotPlayerRegistCoopProfile( "ROBO_BOSS_UNLIMITED" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_06" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_07" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_08" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_01" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_02" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_03" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_04" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_09" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_05" );	//14人目 
	}
	if(gTeamSet_num == 7)
	{
		print("teamNo07()\n");
		//チーム№7 ：肥満軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01007" );


		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_SMITH_01" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_SMITH_02" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_SMITH_03" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_SMITH_04" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_NOMAGIC_01" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_NOMAGIC_02" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_NOMAGIC_03" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_NOMAGIC_04" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_07" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_06" );	// 6人目 
	}
	if(gTeamSet_num == 8)
	{
		print("teamNo08_Strong()\n");
		//チーム№8 ：忍者軍団（強敵） 
		scr_SetCoopBotTeamNameTextId( "$TXCET01008" );

		scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
		
		scr_BotPlayerRegistCoopProfile( "NINJ_BOSS_HANZO" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_06" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_07" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_08" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_09" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_KUNOICHI_01" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_KUNOICHI_02" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_KUNOICHI_03" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_KUNOICHI_04" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_10" );	//10人目 
	}
}
function loadMission() 
{
	print("[CoopM] load()\n");

}
function startMission() 
{
	print("[CoopM] start()\n");

	scr_SetMessageCallback( "miscb_GameSetWinWhite", 1000, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_WHITE );	
	scr_SetMessageCallback( "miscb_GameSetWinBlack", 1100, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_BLACK );
	
	
	local union_color = scr_PlayerGetPowerColor();	//プレイヤーカラーによって条件分岐 
	//プレイヤーの色の設定を待つ 
	while( !scr_PlayerIsCreateBody(0) )
	{
		suspend();
	}
	//敵チームによってはリスポーン時間を変更する 
	if( union_color == POWER_COLOR_WHITE )
	{
	//プレイヤーが白の場合 
	
	
	
	}
	else
	{
	//プレイヤーが黒の場合 
	
	
	
	}
	//BOTのレベルアップ時のスキル入手を禁止する 
	scr_BotPlayerDisableLearningSkillByLevelUp();
	
}
function miscb_GameSetWinWhite()
{
	print( "Game Set Win White!\n" );
	scr_RemoveCallbackAll();
	
	local union_color = scr_PlayerGetPowerColor();	//プレイヤーカラーによって勝敗分岐 
	if( union_color == POWER_COLOR_WHITE )
	{
		scr_GameSetMissionClear();	
	}
	else
	{
		scr_GameSetMissionFailure();
	}
}
function miscb_GameSetWinBlack()
{
	print( "Game Set Win BLACK!\n" );
	scr_RemoveCallbackAll();
	local union_color = scr_PlayerGetPowerColor();	//プレイヤーカラーによって勝敗分岐 
	if( union_color == POWER_COLOR_BLACK )
	{
		scr_GameSetMissionClear();	
	}
	else
	{
		scr_GameSetMissionFailure();
	}
}
