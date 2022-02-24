//COOPモード第一回戦（8vs8) 
//作成：落合勇介 
//
gTeamSet_num <- 0;
function initMission() 
{
	//敵チームを確定する(ロードの狭間） 
	print("[CoopS] unit()\n");
	
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
	}
	if(gTeamSet_num == 2)
	{
		print("teamNo02()\n");
		//チーム№2 ：戦士軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01002" );

		scr_BotPlayerRegistCoopProfile( "WARR_DRAGON_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "WARR_GUARDNER_01" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "WARR_KNIGHT_01" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "WARR_KNIGHT_03" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DR_KNIGHT_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "WARR_DR_KNIGHT_03" );	//6人目 
		scr_BotPlayerRegistCoopProfile( "WARR_SPIN_01" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "WARR_SPIN_03" );	//8人目 
	}
	if(gTeamSet_num == 3)
	{
		print("teamNo03()\n");
		//チーム№3 ：魔法使い軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01003" );

		scr_BotPlayerRegistCoopProfile( "MAGE_FIRE_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_LIGHTNING" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_FROST" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_BLASTER" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_WIZARD_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_01" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_HAVENOT_05" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "MAGE_UNLIMITED" );	//8人目 
	}
	if(gTeamSet_num == 4)
	{
		print("teamNo04()\n");
		//チーム№4 ：僧侶軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01004" );

		scr_BotPlayerRegistCoopProfile( "CLER_HEALER_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "CLER_CARPENTER_01" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_01" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_03" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "CLER_STUNHUMMER_05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "CLER_ALLROUNDER_01" );	//6人目 
		scr_BotPlayerRegistCoopProfile( "CLER_ALLROUNDER_04" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "CLER_DEADMASTER" );	//8人目 
	}
	if(gTeamSet_num == 5)
	{
		print("teamNo05()\n");
		//チーム№5 ：トマト軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01005" );

		scr_BotPlayerRegistCoopProfile( "TOMA_STONEMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_STONEMAN_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_SPIN_01" );	//3人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_SPIN_02" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_FATMAN" );	//5人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_FUNNY" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_TOWERBUILDER" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "TOMA_HAVENOT" );	//8人目 
	}
	if(gTeamSet_num == 6)
	{
		print("teamNo06()\n");
		//チーム№6 ：ロボット軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01006" );

		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_ROKETMAN_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_01" );	//5人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_02" );	//6人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_MECHANIC_03" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "ROBO_BOSS_UNLIMITED" );	//8人目 
	}
	if(gTeamSet_num == 7)
	{
		print("teamNo07()\n");
		//チーム№7 ：肥満軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01007" );

		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_03" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_05" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_FATMAN_07" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_SMITH_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_SMITH_03" );	//6人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_NOMAGIC_03" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "HEAV_NOMAGIC_04" );	//8人目 
	}
	if(gTeamSet_num == 8)
	{
		print("teamNo08_Strong()\n");
		//チーム№8 ：忍者軍団（強敵） 
		scr_SetCoopBotTeamNameTextId( "$TXCET01008" );

		scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
		
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_NINJA_05" );	//5人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_KUNOICHI_01" );	//6人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_KUNOICHI_03" );	//7人目 
		scr_BotPlayerRegistCoopProfile( "NINJ_BOSS_HANZO" );	//8人目 
	}
}
function loadMission() 
{
	print("[CoopS] load()\n");

}
function startMission() 
{
	print("[CoopS] start()\n");

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
