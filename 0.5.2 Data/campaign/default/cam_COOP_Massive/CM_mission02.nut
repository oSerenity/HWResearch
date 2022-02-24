//COOPモード第3回戦（15vs15) 
//作成：落合勇介 
//
gTeamSet_num <- 0;
function initMission() 
{
	//敵チームを確定する(ロードの狭間） 
	print("[CoopM] unit()\n");

	//もし２回連続で強チームに当たっている場合、1/10の確率で最強チームと当てる 
	local Log_num = 0;
	Log_num = scr_GetCoopStrongBotTeamCount();
	if(Log_num == 2)
	{
		local Random_num = 0;
		Random_num = scr_GetCoopBotTeamRandomIndex( 1, 10 );
		if(Random_num == 1)
		{
			//大当たり。最強軍と戦闘 
			print("teamno9()\n");
			gTeamSet_num = 9;
			scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
			scr_SetCoopBotTeamNameTextId( "$TXCET01025" );
			
			scr_BotPlayerRegistCoopProfile( "MOST_ODIN_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "MOST_ODIN_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "MOST_ODIN_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "MOST_ODIN_04" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_01" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_02" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_03" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_04" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_01" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_02" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_03" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_04" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "MOST_ODIN_05" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_05" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_05" );	//15人目 
		}
	}
	if(gTeamSet_num != 9)	//上記の最強軍に当たっていない場合 
	{
	//	local TeamSet_num = 0;	//チーム決定のためのローカル変数 
	//	TeamSet_num = scr_GetCoopBotTeamRandomIndex( 1, 4 );	//ランダムでチーム№を決定する 
		gTeamSet_num = scr_GetCoopBotTeamRandomIndex( 1, 8 );	//ランダムでチーム№を決定する 
	
	
		if(gTeamSet_num == 1)
		{
			print("teamNo01()\n");
			//チーム№１ ：おばけ（雷）軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01017" );

			scr_BotPlayerRegistCoopProfile( "GHOS_GHOSTKING" );	//15人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THOR_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THOR_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THOR_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THOR_04" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_01" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_02" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_03" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_04" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THUNDER_01" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THUNDER_02" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_05" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THUNDER_03" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_06" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THUNDER_04" );	//14人目 
		}
		if(gTeamSet_num == 2)
		{
			print("teamNo02()\n");
			//チーム№2 ：氷軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01018" );
	
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTDEMON" );	//15人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTKNIGHT_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTKNIGHT_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTKNIGHT_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_01" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_02" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_03" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_04" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_05" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "ICED_BLIZZARD_01" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "ICED_BLIZZARD_02" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "ICED_BLIZZARD_03" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_06" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "ICED_BLIZZARD_04" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTKNIGHT_04" );	// 4人目 
		}
		if(gTeamSet_num == 3)
		{
			print("teamNo03()\n");
			//チーム№3 ：サムライ軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01019" );
	
			scr_BotPlayerRegistCoopProfile( "SAMU_BOSS_FUDO" );	//15人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_04" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_05" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_NINJA_01" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_NINJA_02" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_01" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_02" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_03" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_04" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_NINJA_03" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_05" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_06" );	// 6人目 
		}
		if(gTeamSet_num == 4)
		{
			print("teamNo04()\n");
			//チーム№4 ：ゾンビ軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01020" );
	
			scr_BotPlayerRegistCoopProfile( "ZOMB_BLUE01" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BLUE02" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_ZOMBIEMAKER" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BOSS_ZOMBIEDr" );	//15人目 	
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_STUNHUMMER_01" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_STUNHUMMER_02" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_HAVENOT_01" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_HAVENOT_02" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_05" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_STUNHUMMER_03" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_HAVENOT_03" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_04" );	// 4人目 
		}
		if(gTeamSet_num == 5)
		{
			print("teamNo05()\n");
			//チーム№5 ：中華軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01021" );
	
			
			scr_BotPlayerRegistCoopProfile( "FIGH_BOSS_IDATEN" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BOSS_KOMEI" );	//15人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BERSERK01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BERSERK02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_GOLDENHUMMER" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_SPIN" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_STONEMAN" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_DRAGON01" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_DRAGON02" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_DRAGON03" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_STUNHUMMER01" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_STUNHUMMER02" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_STUNHUMMER03" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_DRAGON04" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BERSERK03" );	// 3人目 
		}
		if(gTeamSet_num == 6)
		{
			print("teamNo06()\n");
			//チーム№6 ：スピナー軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01022" );
	
	
			scr_BotPlayerRegistCoopProfile( "SPIN_CLOWN01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_CLOWN02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_CLOWN03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH01" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH02" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH03" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH04" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS01" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS02" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS03" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS04" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS05" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_CLOWN04" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH05" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS06" );	//15人目 
		}
		if(gTeamSet_num == 7)
		{
			print("teamNo07()\n");
			//チーム№7 ：光の国軍団 
			scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
			scr_SetCoopBotTeamNameTextId( "$TXCET01023" );
	
	
			scr_BotPlayerRegistCoopProfile( "LIGH_GOLDENKIGHT" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_MASTER" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_NOMAGIC" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_FUNNY" );	//15人目 	
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLSKILL_M_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLSKILL_C_01" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_BERSERK" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLROUNDER" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_WIZARD" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_GUARDNER01" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_GUARDNER02" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLSKILL_M_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLSKILL_C_03" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLSKILL_M_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLSKILL_C_02" );	// 5人目 
		}
		if(gTeamSet_num == 8)
		{
			print("teamNo08_Strong()\n");
			//チーム№8 ：闇の国軍団（強敵） 
			scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
			scr_SetCoopBotTeamNameTextId( "$TXCET01024" );
	
			scr_BotPlayerRegistCoopProfile( "DARK_DRAGONKNIGHT" );	// 7人目 
			scr_BotPlayerRegistCoopProfile( "DARK_DEADMASTER" );	// 8人目 
			scr_BotPlayerRegistCoopProfile( "DARK_KNIGHT" );	// 9人目 
			scr_BotPlayerRegistCoopProfile( "DARK_BERSERK" );	//10人目 
			scr_BotPlayerRegistCoopProfile( "DARK_GHOSTKING" );	//11人目 
			scr_BotPlayerRegistCoopProfile( "DARK_FROSTDEMON" );	//12人目 
			scr_BotPlayerRegistCoopProfile( "DARK_PRINCESS_DUMMY" );	//13人目 
			scr_BotPlayerRegistCoopProfile( "DARK_BUTLER" );	//14人目 
			scr_BotPlayerRegistCoopProfile( "DARK_DARKLOAD" );	//15人目 
			scr_BotPlayerRegistCoopProfile( "DARK_HAVENOT_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "DARK_THUNDER_01" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "DARK_THUNDER_02" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "DARK_HAVENOT_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "DARK_HAVENOT_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "DARK_THUNDER_03" );	// 6人目 
		}
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
