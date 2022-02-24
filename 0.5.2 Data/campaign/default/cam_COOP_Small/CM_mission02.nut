//COOPモード第3回戦（8vs8) 
//作成：落合勇介 
//
gTeamSet_num <- 0;
function initMission() 
{
	//敵チームを確定する(ロードの狭間） 
	print("[CoopS] unit()\n");


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
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_01" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_02" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "MOST_YAHWEH_03" );	// 6人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_04" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "MOST_PLUTO_05" );	//8人目 
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
	
	
			scr_BotPlayerRegistCoopProfile( "GHOS_THOR_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THOR_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_01" );	//3 人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_02" );	//4 人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_LIGHTNING_03" );	//5人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THUNDER_01" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_THUNDER_02" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "GHOS_GHOSTKING" );	//8人目 
		}
		if(gTeamSet_num == 2)
		{
			print("teamNo02()\n");
			//チーム№2 ：氷軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01018" );
	
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTKNIGHT_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTKNIGHT_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_01" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_02" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROST_03" );	//5人目 
			scr_BotPlayerRegistCoopProfile( "ICED_BLIZZARD_01" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "ICED_BLIZZARD_02" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "ICED_FROSTDEMON" );	//8人目 
		}
		if(gTeamSet_num == 3)
		{
			print("teamNo03()\n");
			//チーム№3 ：サムライ軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01019" );
	
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_SAMURAI_03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_NINJA_01" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_NINJA_02" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_01" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_DRAGONKNIGHT_02" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "SAMU_BOSS_FUDO" );	//8目 
		}
		if(gTeamSet_num == 4)
		{
			print("teamNo04()\n");
			//チーム№4 ：ゾンビ軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01020" );
	
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BERSERK_02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_STUNHUMMER" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_HAVENOT" );	//4人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BLUE01" );	//5人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BLUE02" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_ZOMBIEMAKER" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "ZOMB_BOSS_ZOMBIEDr" );	//8人目 
		}
		if(gTeamSet_num == 5)
		{
			print("teamNo05()\n");
			//チーム№5 ：中華軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01021" );
	
			scr_BotPlayerRegistCoopProfile( "FIGH_BERSERK01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BERSERK03" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_DRAGON03" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_STUNHUMMER01" );	//4人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_STUNHUMMER03" );	//5人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_GOLDENHUMMER" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BOSS_IDATEN" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "FIGH_BOSS_KOMEI" );	//8人目 
		}
		if(gTeamSet_num == 6)
		{
			print("teamNo06()\n");
			//チーム№6 ：スピナー軍団 
			scr_SetCoopBotTeamNameTextId( "$TXCET01022" );
	
			scr_BotPlayerRegistCoopProfile( "SPIN_CLOWN01" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_CLOWN02" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH01" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH02" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_ROUGH03" );	// 5人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS02" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS03" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "SPIN_WAITRESS04" );	//8人目 
		}
		if(gTeamSet_num == 7)
		{
			print("teamNo07()\n");
			//チーム№7 ：光の国軍団 
			scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
			scr_SetCoopBotTeamNameTextId( "$TXCET01023" );
	
			scr_BotPlayerRegistCoopProfile( "LIGH_BERSERK" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_ALLROUNDER" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_WIZARD" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_GUARDNER01" );	//4人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_GUARDNER02" );	//5人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_GOLDENKIGHT" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_NOMAGIC" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "LIGH_FUNNY" );	//8人目 
		}
		if(gTeamSet_num == 8)
		{
			print("teamNo08_Strong()\n");
			print("teamNo08_Strong()\n");
			//チーム№8 ：闇の国軍団（強敵） 
			scr_NotifyStrongCoopMission();	//このチームは強チーム設定なので演出ON 
			scr_SetCoopBotTeamNameTextId( "$TXCET01024" );
	
			
			scr_BotPlayerRegistCoopProfile( "DARK_THUNDER" );	// 1人目 
			scr_BotPlayerRegistCoopProfile( "DARK_DRAGONKNIGHT" );	// 2人目 
			scr_BotPlayerRegistCoopProfile( "DARK_DEADMASTER" );	// 3人目 
			scr_BotPlayerRegistCoopProfile( "DARK_KNIGHT" );	// 4人目 
			scr_BotPlayerRegistCoopProfile( "DARK_BERSERK" );	//5人目 
			scr_BotPlayerRegistCoopProfile( "DARK_PRINCESS_DUMMY" );	//6人目 
			scr_BotPlayerRegistCoopProfile( "DARK_BUTLER" );	//7人目 
			scr_BotPlayerRegistCoopProfile( "DARK_DARKLOAD" );	//8人目 
		}
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
