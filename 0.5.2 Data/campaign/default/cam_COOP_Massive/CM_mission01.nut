//COOPモード第2回戦（15vs15) 
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
		//チーム№１ ：火炎軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01009" );

		scr_BotPlayerRegistCoopProfile( "FIRE_FRAMEKNIGHT_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FRAMEKNIGHT_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FRAMEKNIGHT_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FIRE_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FIRE_02" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FIRE_03" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FIRE_04" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FIRE_05" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_BURN_01" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_BURN_02" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_BURN_03" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_BURN_04" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_BURN_05" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FIRE_06" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "FIRE_FRAMEKNIGHT_04" );	// 4人目 
	}
	if(gTeamSet_num == 2)
	{
		print("teamNo02()\n");
		//チーム№2 ：風軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01010" );


		scr_BotPlayerRegistCoopProfile( "WIND_STORMKNIGHT_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORMKNIGHT_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORMKNIGHT_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "WIND_BLASTER_01" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "WIND_BLASTER_02" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "WIND_BLASTER_03" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "WIND_BLASTER_04" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "WIND_BLASTER_05" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORM_01" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORM_02" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORM_03" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORM_04" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORM_05" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "WIND_BLASTER_06" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "WIND_STORMKNIGHT_04" );	// 4人目 
	}
	if(gTeamSet_num == 3)
	{
		print("teamNo03()\n");
		//チーム№3 ：大工軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01011" );

		scr_BotPlayerRegistCoopProfile( "CARP_MASTER" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "CARP_CARPENTER01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "CARP_CARPENTER02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "CARP_SMITH01" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "CARP_SMITH02" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "CARP_TOWERBUILDER01" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "CARP_TOWERBUILDER02" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "CARP_TOWERBUILDER03" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "CARP_MECHANIC01" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "CARP_MECHANIC02" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "CARP_HEALER01" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "CARP_HEALER02" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "CARP_MECHANIC03" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "CARP_SMITH03" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "CARP_CARPENTER03" );	// 3人目 
	}
	if(gTeamSet_num == 4)
	{
		print("teamNo04()\n");
		//チーム№4 ：宇宙人軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01012" );

		scr_BotPlayerRegistCoopProfile( "ALIE_CREATURE" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_ROKETMAN_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_ROKETMAN_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_ROKETMAN_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_SPIN_01" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_SPIN_02" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_MEDIC_01" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_MEDIC_02" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_MEDIC_03" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_METEOMASTER_01" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_METEOMASTER_02" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_METEOMASTER_03" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_METEOMASTER_04" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_METEOMASTER_05" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "ALIE_MEDIC_04" );	// 9人目 
	}
	if(gTeamSet_num == 5)
	{
		print("teamNo05()\n");
		//チーム№5 ：ウガウガ軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01013" );

		scr_BotPlayerRegistCoopProfile( "UGAU_HEAD" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK06" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_TOWERBUILDER01" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_TOWERBUILDER02" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_TOWERBUILDER03" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_HAVENOT01" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_HAVENOT02" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK07" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_HAVENOT03" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "UGAU_BERSERK08" );	// 8人目 

	}
	if(gTeamSet_num == 6)
	{
		print("teamNo06()\n");
		//チーム№6 ：消防士軍団 
		scr_SetCoopBotTeamNameTextId( "$TXCET01014" );

		
		scr_BotPlayerRegistCoopProfile( "SMOK_CRUSHER01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_CRUSHER02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_STUNHUMMER01" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_STUNHUMMER02" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_STUNHUMMER03" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_TOWERBUILDER01" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_TOWERBUILDER02" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_TOWERBUILDER03" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_FRAMEKNIGHT_01" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_FRAMEKNIGHT_02" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_BURN_01" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_BURN_02" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_CRUSHER03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_BURN_03" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "SMOK_FRAMEKNIGHT_03" );	//12人目 
	}
	if(gTeamSet_num == 7)
	{
		print("teamNo07()\n");
		//チーム№7 ：スパロボ軍団（強敵） 
		scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
		scr_SetCoopBotTeamNameTextId( "$TXCET01015" );


		scr_BotPlayerRegistCoopProfile( "SROB_BOSS_IQ9_01" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "SROB_BOSS_IQ9_02" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "SROB_BOSS_Dr" );	//15人目 
		scr_BotPlayerRegistCoopProfile( "SROB_THOR_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "SROB_THOR_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "SROB_ROKETMAN_01" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "SROB_ROKETMAN_02" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "SROB_ROKETMAN_03" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "SROB_ROKETMAN_04" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "SROB_MECHANIC_01" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "SROB_LIGHTNING_01" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "SROB_LIGHTNING_02" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "SROB_ROKETMAN_05" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "SROB_MECHANIC_02" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "SROB_MECHANIC_03" );	//10人目 
	}
	if(gTeamSet_num == 8)
	{
		print("teamNo08_Strong()\n");
		//チーム№8 ：騎士軍団（強敵） 
		scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
		scr_SetCoopBotTeamNameTextId( "$TXCET01016" );

		
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_A_01" );	// 1人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_A_02" );	// 2人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_A_03" );	// 3人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_A_04" );	// 4人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_B_01" );	// 6人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_B_02" );	// 7人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_B_03" );	// 8人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_B_04" );	// 9人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_C_01" );	//11人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_C_02" );	//12人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_C_03" );	//13人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_C_04" );	//14人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_A_05" );	// 5人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_B_05" );	//10人目 
		scr_BotPlayerRegistCoopProfile( "DKIG_DARKKIGHT_C_05" );	//15人目 
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
	if(gTeamSet_num != 8)
	{
		scr_BotPlayerDisableLearningSkillByLevelUp();
	}
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
