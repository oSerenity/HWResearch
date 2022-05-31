///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_STORY01\mission00.nut 
//	概要	：シナリオキャンペーン レベル1 キャンペーン1 ミッション1 
//	作成	：落合 
//	作成日	：110606 
//	目的	：［変則戦争］勝利 
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
// File name: cam_STORY01 \ mission00.nut
// Overview: Scenario Campaign Level 1 Campaign 1 Mission 1
// Created: Ochiai
// Creation Date: 11/06/06 AKA 06/06/2011
// Purpose: [Irregular War] Victory
///////////////////////////////////////////////////////////////////////////////////////////////

function loadMission() 
{
	print("[sample mission] load()\n");
        //ミッションのステージを読み込む前の処理を設定しよう！
	// Let's set the process before loading the mission stage!
	scr_SetDisableGimmickType( GIMMICK_RAFT );
	//開戦前バリケード封じ 
	// Barricade seal before the start of war
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );
	scr_SetDisableGimmickType( GIMMICK_CANNON );
	scr_SetDisableGimmickType( GIMMICK_BOMBSTONE );
	scr_SetDisableGimmickType( GIMMICK_BALLISTA );

}
function startMission() 
{
	print("[sample mission] start()\n");


	//復活時間設定 
	// Resurrection time setting
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 8 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 8 );

	//BOTの登録 
	// BOT registration
	scr_BotPlayerRegistAndCreate( 101, "NOOB01", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "MEDIC01", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 103, "MAGE01", POWER_COLOR_WHITE );
//	scr_BotPlayerRegistAndCreate( 104, "NOOB02", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 202, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 203, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 204, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 205, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 206, "MOB_D", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 207, "MOB_D", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 208, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 209, "MOB_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 210, "WIZ_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 211, "WIZ_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 212, "HEAVY_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 213, "HEAVY_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 214, "HEAVY_T", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 215, "WIZ_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 216, "WIZ_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 217, "WIZ_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 218, "WIZ_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 219, "DARK_MAGE_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 220, "HEAVY_D", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 221, "HEAVY_D", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 222, "HEAVY_D", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 223, "DARK_MAGE_S", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 224, "GATE_KEEPER", POWER_COLOR_BLACK );	
	scr_BotPlayerRegistAndCreate( 225, "GATE_KEEPER", POWER_COLOR_BLACK );	

        //コールバックの設定 
	// Callback settings
	scr_SetMessageCallback( "miscb_PlayerSally_First", 1000, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );
//	scr_SetMessageCallback( "miscb_GameSetWinWhite", 1100, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_WHITE );
//	scr_SetMessageCallback( "miscb_GameSetWinBlack", 1200, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_BLACK );
	scr_SetMessageCallback( "miscb_GameSetWinWhite", 1100, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_BLACK_CASTLE_MONUMENT );
	scr_SetMessageCallback( "miscb_GameSetWinBlack", 1200, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_WHITE_CASTLE_MONUMENT );
	scr_SetMessageCallback( "miscb_TimeOver", 80002, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );		//タイムオーバー時 


	scr_SetMessageCallback( "miscb_PlayerDead", 1300, CB_TYPE_ONCE, MESSAGE_PLAYER_DEAD );	//初回死亡時 
	scr_SetBreakCastleGateCallback( "miscb_BreakCastleGate", 1400, CB_TYPE_ONCE, POWER_COLOR_BLACK );	//敵軍の城門破壊 


	//オフラインキャンペーンＨＵＤ設定 
	// Offline campaign HUD setting
	scr_SetDisableTacticalInfomation();	//バナーテキストを非表示 
	scr_SetEnablePlayerHeroPopup( false );	//ヒーローポップアップの非表示 
	scr_SetEnableInputPlayerVoiceReaction( false );	//リアクションボイスマクロの非表示 
	scr_SetDisableTacticalInfomation (); // Hide banner text
	scr_SetEnablePlayerHeroPopup (false); // Hide hero popup
	scr_SetEnableInputPlayerVoiceReaction (false); // Hide reaction voice macro
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_DAMAGED, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_75, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_50, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_40, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_30, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_20, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_10, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_BROKEN, true );
	scr_BotPlayerDisableLearningSkillByLevelUp();
	scr_SetEnableGameWinDemo( false );




//トラックボットのリスポーンを制御 
// Control the respawn of the truck bot
	scr_BotPlayerSetRespawnEnable( 201, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 202, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 203, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 204, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 205, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 208, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 209, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 210, false );	//WIZ_S 
	scr_BotPlayerSetRespawnEnable( 211, false );	//WIZ_S 
	scr_BotPlayerSetRespawnEnable( 212, false );	//HEAVY_T 
	scr_BotPlayerSetRespawnEnable( 213, false );	//HEAVY_T 
	scr_BotPlayerSetRespawnEnable( 214, false );	//HEAVY_T 
	scr_BotPlayerSetRespawnEnable( 215, false );	//WIZ_T 
	scr_BotPlayerSetRespawnEnable( 216, false );	//WIZ_T 
	scr_BotPlayerSetRespawnEnable( 217, false );	//WIZ_T 
	scr_BotPlayerSetRespawnEnable( 218, false );	//WIZ_T 
	scr_BotPlayerSetRespawnEnable( 219, false );	
	scr_BotPlayerSetRespawnEnable( 220, false );	
	scr_BotPlayerSetRespawnEnable( 221, false );	
	scr_BotPlayerSetRespawnEnable( 222, false );	
	scr_BotPlayerSetRespawnEnable( 223, false );	
	scr_BotPlayerSetRespawnEnable( 224, false );	
	scr_BotPlayerSetRespawnEnable( 225, false );	

//ボットのトリガーを制御 
// Control bot triggers
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 203, true );
	scr_BotPlayerSetActionTrigger( 204, true );
	scr_BotPlayerSetActionTrigger( 205, true );
	scr_BotPlayerSetActionTrigger( 208, true );
	scr_BotPlayerSetActionTrigger( 209, true );



//トラップの設定 
// Trap settings
	scr_RegistTrapBox( 1000, 10699.2 ,0.0 ,12135.0 ,2255.1 ,1500.0 ,1990.8 ,-25.0   );	//城 
	scr_RegistTrapBox( 1000, 10699.2 ,0.0 ,12135.0 ,2255.1 ,1500.0 ,1990.8 ,-25.0   );	//city

	scr_RegistTrapBox( 1001, 8013.3 ,200.0 ,11430.3 ,371.9 ,2000.0 ,4693.1 ,-25.0  );	//城出てすぐ 
	scr_RegistTrapBox( 1001, 8013.3, 200.0, 11430.3, 371.9, 2000.0, 4693.1, -25.0  ); 	// Immediately after leaving the castle

	scr_RegistTrapBox( 1002, 5143.2 ,0.0 ,7388.0 ,371.9 ,1000.0 ,639.2 ,-20.9  );	//橋通るルート 
	scr_RegistTrapBox( 1003, 4310.4 ,200.0 ,9698.5 ,377.3 ,1000.0 ,696.6 ,-20.9  );	//バラの道通るルート 
	scr_RegistTrapBox( 1004, 2434.3 ,0.0 ,11640.2 ,261.3 ,1000.0 ,566.6 ,-20.9  );	//アーチを通るルート 
	scr_RegistTrapBox (1002, 5143.2, 0.0, 7388.0, 371.9, 1000.0, 639.2, -20.9); 	// Route through the bridge
	scr_RegistTrapBox (1003, 4310.4, 200.0, 9698.5, 377.3, 1000.0, 696.6, -20.9); 	// Route through the rose road
	scr_RegistTrapBox (1004, 2434.3, 0.0, 11640.2, 261.3, 1000.0, 566.6, -20.9); 	// Route through the arch

	scr_RegistTrapBox( 1005, -4369.4 ,0.0 ,7275.1 ,564.2 ,1000.0 ,1381.3 ,-57.9   );	//向かって右の橋 
	scr_RegistTrapBox( 1006, -5639.3 ,0.0 ,10387.2 ,508.2 ,1000.0 ,2142.3 ,-331.8   );	//向かって左の端 
	scr_RegistTrapBox (1005, -4369.4, 0.0, 7275.1, 564.2, 1000.0, 1381.3, -57.9); 		// The bridge on the right
	scr_RegistTrapBox (1006, -5639.3, 0.0, 10387.2, 508.2, 1000.0, 2142.3, -331.8); 	// Left edge towards

	scr_RegistTrapBox( 1007,  -9981.6 ,0.0 ,5761.9 ,211.5 ,1000.0 ,2119.8 ,-44.4  );	//ヘビー出現 
	scr_RegistTrapBox( 1008, -10087.9 ,0.0 ,228.9 ,4539.4 ,1000.0 ,234.7 ,-46.1  );	//タワー４黒に 
	scr_RegistTrapBox (1007, -9981.6, 0.0, 5761.9, 211.5, 1000.0, 2119.8, -44.4); // Heavy appearance
	scr_RegistTrapBox (1008, -10087.9, 0.0, 228.9, 4539.4, 1000.0, 234.7, -46.1); // Tower 4 in black

	scr_RegistTrapBox( 1009, 11007.8 ,0.0 ,2603.5 ,283.7 ,1000.0 ,1065.6 ,-21.7  );	//中央ルート 
	scr_RegistTrapBox( 1010, 12314.0 ,0.0 ,735.6 ,229.2 ,1000.0 ,1055.1 ,-356.1  );	//アーチ通るルート 
	scr_RegistTrapBox( 1011, 11884.8 ,0.0 ,5536.7 ,227.5 ,1000.0 ,581.8 ,-24.8  );	//橋を通るルート 
	scr_RegistTrapBox (1009, 11007.8, 0.0, 2603.5, 283.7, 1000.0, 1065.6, -21.7); 	// Central route
	scr_RegistTrapBox (1010, 12314.0, 0.0, 735.6, 229.2, 1000.0, 1055.1, -356.1); 	// Route through the arch
	scr_RegistTrapBox (1011, 11884.8, 0.0, 5536.7, 227.5, 1000.0, 581.8, -24.8); 	// Route through the bridge

	scr_RegistTrapBox( 1012, 19491.7 ,0.0 ,5146.8 ,229.2 ,1000.0 ,4319.1 ,-345.9  );	//敵城門前 
	scr_RegistTrapBox( 1012, 19491.7 ,0.0 ,5146.8 ,229.2 ,1000.0 ,4319.1 ,-345.9 ); 	//in front of the enemy city gate

	scr_RegistTrapBox( 1013, -3531.97 ,0.0 ,704.243 ,2618.4 ,1000.0 ,191.0 ,-46.64  );	//タワー５黒で 魔法使い軍団出撃 
	scr_RegistTrapBox( 1013, -4768.34 ,0.0 ,-3435.5 ,2619.5 ,1000.0 ,186.5 ,-100.5  );	//タワー５黒で魔法使い軍団出撃 
	scr_RegistTrapBox( 1013, -1868.34 ,0.0 ,-6225.8 ,2618.4 ,1000.0 ,188.7 ,-171.6  );	//タワー５黒で魔法使い軍団出撃 
	scr_RegistTrapBox (1013, -3531.97, 0.0, 704.243, 2618.4, 1000.0, 191.0, -46.64); 	// Tower 5 Black Wizard Army Sortie
	scr_RegistTrapBox (1013, -4768.34, 0.0, -3435.5, 2619.5, 1000.0, 186.5, -100.5); 	// Tower 5 Black Wizard Army Sortie
	scr_RegistTrapBox (1013, -1868.34, 0.0, -6225.8, 2618.4, 1000.0, 188.7, -171.6); 	// Tower 5 Black Wizard Army Sortie
	
	scr_RegistTrapBox( 1014,  2077.9 ,0.0 ,-1445.3 ,179.4 ,1000.0 ,2285.4 ,-36.0  );	//タワー６でヘビーカスタム 
	scr_RegistTrapBox( 1014,   2218.2 ,0.0 ,992.3 ,160.1 ,1000.0 ,1704.4 ,-296.6  );	//タワー６でヘビーカスタム 
	scr_RegistTrapBox (1014, 2077.9, 0.0, -1445.3, 179.4, 1000.0, 2285.4, -36.0); 		// Heavy Custom at Tower 6
	scr_RegistTrapBox (1014, 2218.2, 0.0, 992.3, 160.1, 1000.0, 1704.4, -296.6); 		// Heavy Custom at Tower 6
	
	scr_RegistTrapBox( 1015,   7164.4 ,0.0 ,1715.1 ,174.2 ,1000.0 ,4250.4 ,-12.6  );	//敵城は目の前だ！ 
	scr_RegistTrapBox (1015, 7164.4, 0.0, 1715.1, 174.2, 1000.0, 4250.4, -12.6); 		// The enemy castle is right in front of you!


//トラップ消去床 
// Trap erase floor
	scr_RegistTrapBox( 2002,   3886.0 ,0.0 ,9566.6 ,147.8 ,1000.0 ,697.9 ,-20.9  );	//橋通るルート 
	scr_RegistTrapBox( 2003,   4727.6 ,0.0 ,7166.9 ,147.8 ,1000.0 ,697.9 ,-20.9  );	//バラの道通るルート 
	scr_RegistTrapBox( 2004,   2117.5 ,0.0 ,11465.6 ,153.1 ,1000.0 ,697.9 ,-20.9  );	//アーチを通るルート 
	scr_RegistTrapBox (2002, 3886.0, 0.0, 9566.6, 147.8, 1000.0, 697.9, -20.9); 	// Route through the bridge
	scr_RegistTrapBox (2003, 4727.6, 0.0, 7166.9, 147.8, 1000.0, 697.9, -20.9); 	// Route through the rose road
	scr_RegistTrapBox (2004, 2117.5,0.0,11465.6,153.1,1000.0,697.9,-20.9); 			// Route through the arch

	scr_RegistTrapBox( 2009,   11287.3 ,0.0 ,2946.5 ,89.5 ,1000.0 ,1230.4 ,-21.7  );	//中央ルート 
	scr_RegistTrapBox( 2010,   12590.7 ,0.0 ,745.4 ,78.6 ,1000.0 ,1055.1 ,-356.1  );	//アーチ通るルート 
	scr_RegistTrapBox( 2011,   12114.1 ,0.0 ,5681.5 ,87.8 ,1000.0 ,577.6 ,-24.8  );	//橋を通るルート 
	scr_RegistTrapBox (2009, 11287.3, 0.0, 2946.5, 89.5, 1000.0, 1230.4, -21.7); // Central route
	scr_RegistTrapBox (2010, 12590.7, 0.0, 745.4, 78.6, 1000.0, 1055.1, -356.1); // Route through the arch
	scr_RegistTrapBox (2011, 12114.1, 0.0, 5681.5, 87.8, 1000.0, 577.6, -24.8); // Route through the bridge

//トラップインコールバック 
// Trap in callback
	scr_SetTrapInCallback( "miscb_TrapIn1000", 10000, CB_TYPE_ONCE, 1000 );	
//	scr_SetTrapOutCallback( "miscb_TrapOut1000", 100000, CB_TYPE_ONCE, 1000 );

	scr_SetTrapInCallback( "miscb_TrapIn1001", 10001, CB_TYPE_ONCE, 1001 );	
	scr_SetTrapInCallback( "miscb_TrapIn1002", 10002, CB_TYPE_ONCE, 1002 );
	scr_SetTrapInCallback( "miscb_TrapIn1003", 10003, CB_TYPE_ONCE, 1003 );
	scr_SetTrapInCallback( "miscb_TrapIn1004", 10004, CB_TYPE_ONCE, 1004 );
	scr_SetTrapInCallback( "miscb_TrapIn1005", 10005, CB_TYPE_ONCE, 1005 );
	scr_SetTrapInCallback( "miscb_TrapIn1006", 10006, CB_TYPE_ONCE, 1006 );

	scr_SetTrapInCallback( "miscb_TrapIn1007", 10007, CB_TYPE_ONCE, 1007 );
	scr_SetTrapInCallback( "miscb_TrapIn1008", 10008, CB_TYPE_ONCE, 1008 );

	scr_SetTrapInCallback( "miscb_TrapIn1009", 10009, CB_TYPE_ONCE, 1009 );
	scr_SetTrapInCallback( "miscb_TrapIn1010", 10010, CB_TYPE_ONCE, 1010 );
	scr_SetTrapInCallback( "miscb_TrapIn1011", 10011, CB_TYPE_ONCE, 1011 );
	scr_SetTrapInCallback( "miscb_TrapIn1012", 10012, CB_TYPE_ONCE, 1012 );

	scr_SetTrapInCallback( "miscb_TrapIn1013", 10013, CB_TYPE_ONCE, 1013 );
	scr_SetTrapInCallback( "miscb_TrapIn1014", 10014, CB_TYPE_ONCE, 1014 );
	scr_SetTrapInCallback( "miscb_TrapIn1015", 10015, CB_TYPE_ONCE, 1015 );

	scr_SetTrapInCallback( "miscb_TrapIn2002", 12002, CB_TYPE_ONCE, 2003 );
	scr_SetTrapInCallback( "miscb_TrapIn2003", 12003, CB_TYPE_ONCE, 2002 );
	scr_SetTrapInCallback( "miscb_TrapIn2004", 12004, CB_TYPE_ONCE, 2004 );
	scr_SetTrapInCallback( "miscb_TrapIn2009", 12009, CB_TYPE_ONCE, 2009 );
	scr_SetTrapInCallback( "miscb_TrapIn2010", 12010, CB_TYPE_ONCE, 2010 );
	scr_SetTrapInCallback( "miscb_TrapIn2011", 12011, CB_TYPE_ONCE, 2011 );

//出撃前メッセージ 
// Message before sortie
	scr_WaitStart( 0.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C111_01" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
//	scr_PauseOff();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
//	scr_PauseOn();	
	scr_OpenDialog( 0, "C111_02" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	//達成条件表示 
	//Indicates that the condition is met
	scr_OpenMissionConditionText(  0, "TXHFC01101" );	//戦闘に勝利せよ 

	// プレイヤー生成を待ちます
	// Wait for player generation
	mis_WaitPlayerCreate();
	scr_PlayerSetForceRespawnPosition( 10216.331055, 500.000000, 11851.6, -115.0 );	//プレイヤーの出現位置を固定 


// ゲーム開始を待ちます
// Wait for the game to start
	mis_WaitGameStart();

}
function mis_WaitPlayerCreate()
{
	while( !scr_PlayerIsCreateBody( 0 ) )
	{
		suspend();
	}
}
function mis_WaitGameStart()
{
	while( GAME_STATE_PLAYING != scr_GetGamePlayingStatus() )
	{
		local state;			
		state = GetGamePlayingStatus();	
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );
		suspend();	
	}
	//BOTをゲームに配置 
	//味方
	// Place BOT in the game
	// Allies
	scr_BotPlayerSpawnToMonument( 101, "gcmoA_001" );
	scr_BotPlayerSpawnToMonument( 102, "gcmoA_001" );
	scr_BotPlayerSpawnToMonument( 103, "gcmoA_001" );
//	scr_BotPlayerSpawnToMonument( 104, "gcmoA_001" );


	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );
//	scr_BotPlayerSetActionTrigger( 104, true );

}
//汎用ファンクション ////
// Generic function ////
function mis_Wait( sec )
{
	print("waitsec()\n");
	scr_WaitStart( sec );
	while( scr_Waiting() )	
	{
		suspend();
	}
}
function mis_MassageDialog( doc_id )
{
	print("deadEffect!()\n");
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, doc_id );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
}
function mis_CameraSet()
{
	print("cameraset()\n");
//	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	scr_SetInputDisable (SCR_INPUT_MOVE); // Prohibit movement
	scr_SetInputDisable( SCR_INPUT_CAMERA );	//カメラを禁止 
	scr_SetInputDisable (SCR_INPUT_CAMERA); // Prohibit camera
	scr_WaitStart( 0.65 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
//	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_SetInputEnable( SCR_INPUT_CAMERA );	//カメラ禁止解除 
	scr_SetInputEnable (SCR_INPUT_MOVE); // Unban movement
	scr_SetInputEnable (SCR_INPUT_CAMERA); // Camera prohibition lifted
}
function mis_BannerInfoTimer(fn_name,time)
{
	//同ＩＤタイマーコールバックのセット・入れ替え 
	// Set / replace the same ID timer callback
	scr_RemoveCallbackFromId( 80000 );	
	suspend();
	scr_SetTimerCallback( fn_name, 80000, CB_TYPE_ONCE, time );
}
function miscb_BunnerInfoRemove()
{
	//バナーインフォメーション削除 
	// Delete banner information
	print( "BunnerRemove!\n" );
	scr_CloseMissionExpainText( 0 );
}

//////////////////////////////////////////////////////////////
//プレイヤーが初回出撃した時のコールバック処理について書こう！ 
// Let's write about the callback process when the player first sorties!
function miscb_PlayerSally_First()
{
	print( "Player is sally!\n" );
	
	scr_ResetGameCameraDirection( 7904.0, 10745.0, false );
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラ操作 
	scr_SetGameCameraAngleType (ANGLE_ZOOM_IN); // Camera operation

	mis_Wait( 0.5 );
	
	mis_MassageDialog( "C111_15" );

//	scr_OpenMissionConditionText(  0, "$TXHFC11101" );
//	scr_OpenMissionStateText(  0, "$TXHFS11101" );
	scr_OpenMissionConditionText(  0, "TXHFC01102" );	//敵の城に迎え 
	scr_OpenMissionConditionText (0, "TXHFC01102"); // Meet the enemy's castle
	
	scr_BotPlayerSetSyncBreakCastleMonumentWithPlayer( POWER_COLOR_WHITE, true );

	//道案内　7601 下二桁ふやしてく。１２種類予定 
	//入り口、しょっぱな、７番、６番、５番、４番、３番、２番、１番建築、門番殺し、城門破壊 
	// Directions 7601 The last two digits will increase. 12 types planned
	// Entrance, salty, 7th, 6th, 5th, 4th, 3rd, 2nd, 1st architecture, gatekeeper killing, castle gate destruction
	scr_CreateSceneEffect( 7601, "Ccam01c",    9129.495117, 581.000000, 11331.468,   -115.0 );

}
function miscb_TimeOver()
{
	print( "TimeOver!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionConditionText (0); // Hide achievement conditions
	scr_CloseMissionStateText (0); // Hide achievement status
	scr_CloseMissionExpainText( 0 );

	
	mis_MassageDialog( "C111_16" );

	scr_GameSetMissionFailure();	//ミッション失敗 
	scr_GameSetMissionFailure (); // Mission failed
}
function miscb_GameSetWinWhite()
{
	print( "Game Set Win White!\n" );
//	scr_GameSetMissionClear();
	scr_GameSetMissionSuccess();

	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionConditionText (0); // Hide achievement conditions
	scr_CloseMissionStateText (0); // Hide achievement status
	scr_CloseMissionExpainText( 0 );

	scr_BotPlayerSetLife( 201, 0 );
	scr_BotPlayerSetLife( 202, 0 );
	scr_BotPlayerSetLife( 203, 0 );
	scr_BotPlayerSetLife( 204, 0 );
	scr_BotPlayerSetLife( 205, 0 );
	scr_BotPlayerSetLife( 208, 0 );
	scr_BotPlayerSetLife( 209, 0 );
	scr_BotPlayerSetLife( 210, 0 );
	scr_BotPlayerSetLife( 211, 0 );
	scr_BotPlayerSetLife( 212, 0 );
	scr_BotPlayerSetLife( 213, 0 );
	scr_BotPlayerSetLife( 214, 0 );
	scr_BotPlayerSetLife( 215, 0 );
	scr_BotPlayerSetLife( 216, 0 );
	scr_BotPlayerSetLife( 217, 0 );
	scr_BotPlayerSetLife( 218, 0 );
	scr_BotPlayerSetLife( 219, 0 );
	scr_BotPlayerSetLife( 220, 0 );
	scr_BotPlayerSetLife( 221, 0 );
	scr_BotPlayerSetLife( 222, 0 );
	scr_BotPlayerSetLife( 223, 0 );
	scr_BotPlayerSetLife( 224, 0 );
	scr_BotPlayerSetLife( 225, 0 );

	mis_Wait( 4.5 );

	mis_MassageDialog( "C111_12" );
}
function miscb_GameSetWinBlack()
{
	print( "Game Set Winblack!\n" );
	
	scr_GameSetMissionFailure();
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionConditionText (0); // Hide achievement conditions
	scr_CloseMissionStateText (0); // Hide achievement status
	scr_CloseMissionExpainText( 0 );


	// タイミングはビッグタワー破壊直後。バナーテキスト表示を待つ処理を入れよう！ 
	// The timing is right after the big tower is destroyed. Let's put in the process of waiting for the banner text display!
	mis_Wait( 1.6 );
		
	mis_MassageDialog( "C111_14" );
}
//自分の城にいつづけると敵発生 
// Whenever you stay in your castle, an enemy will occur
function miscb_TrapIn1000()
{
	print( "TrapIn 1000!\n" );
	scr_SetTimerCallback( "miscb_InOwnCastle", 1111, CB_TYPE_ONCE, 60.0 );
	scr_SetTrapOutCallback( "miscb_TrapOut1000", 100000, CB_TYPE_ONCE, 1000 );
}
function miscb_TrapOut1000()
{
	print( "TrapOut 1000!\n" );
	scr_RemoveCallbackFromId( 1111 );
	scr_SetTrapInCallback( "miscb_TrapIn1000", 10000, CB_TYPE_ONCE, 1000 );	
}
function miscb_InOwnCastle()
{
	//城の中に1分以上いた 
	// I was in the castle for over a minute
	scr_RemoveCallbackFromId( 10000 );
	scr_RemoveCallbackFromId( 100000 );
	suspend();

	print( "InOwnCastle60seconds!\n" );
	scr_BotPlayerSpawnToWorld( 208, 8098.5, 499.9, 9001.20, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 209, 6535.6, 500.2, 12673.6, 0.0 );	//MOBs 
	print( "TrapIn spawned!\n" );


	scr_SetTrapInCallback( "miscb_TrapIn1000", 10000, CB_TYPE_ONCE, 1000 );	
//	scr_SetTrapOutCallback( "miscb_TrapOut1000", 100000, CB_TYPE_ONCE, 1000 );
}
//////////////////////////////////
function miscb_TrapIn1001()
{
	//城門のすぐ前にあるトラップ 
	// Trap right in front of the castle gate
	print( "TrapIn 1001!\n" );
	mis_Wait( 0.6 );

	scr_BotPlayerSpawnToWorld( 201, 6252.9, 500.0, 10384.2, 0.0 );	//MOBs 
	scr_WaitStart( 0.2 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
//	scr_BotPlayerSpawnToWorld( 202, 6213.8, 500.0, 11633.1, 0.0 );	//MOBs 
//	scr_WaitStart( 0.3 );	
//	while( scr_Waiting() )	
//	{
//		suspend();
//	}
//	scr_BotPlayerSpawnToWorld( 203, 7215.3, 500.0, 9591.27, 0.0 );	//MOBs 
//	scr_WaitStart( 0.1 );	
//	while( scr_Waiting() )	
//	{
//		suspend();
//	}

	mis_BannerInfoTimer("miscb_BunnerInfo0102",3.0);	//バナーを次のものに更新 
	mis_BannerInfoTimer ("miscb_BunnerInfo0102", 3.0); // Update banner to:
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB11031" );	//ひい！出た  
	scr_OpenMissionExpainText (0, "# TXCMB11031"); // Hi! Came out

	//２０１番が死んだら矢印出す。 
	// When No. 201 dies, put out an arrow.
	scr_AddDeathEnemyCallback( "miscb_KilledBot201", 201 );
	
}
function miscb_BunnerInfo0102()
{
	//バナーインフォメーション続き 
	// Banner information continued
	print( "Bunner0101!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",8.0);	//バナーを削除する 
	mis_BannerInfoTimer ("miscb_BunnerInfoRemove", 8.0); // Remove the banner
	scr_OpenMissionExpainText( 0, "#TXCMB11032" );	//ひい！出た  
	scr_OpenMissionExpainText (0, "# TXCMB11032"); // Hi! Came out
}
function miscb_KilledBot201()
{
	print( "敵は死んだので誘導!\n" );
	print ("Enemy is dead, so guide! \ N");
	scr_RemoveDeathEnemyCallback( 201 );
	scr_CreateSceneEffect( 7602, "Ccam01c",    5881.153320, 507.000000, 10418.968,   -108.0 );
}
////////////////////////////////////
gFirstMonument <- 0;
function miscb_TrapIn1002()
{
	//橋のある道を通るルート。 
	// A route that goes through a road with a bridge.
	print( "TrapIn 1002!\n" );
	scr_RemoveCallbackFromId( 12002 );

	//タワー出現を待つ 
	// Wait for the tower to appear
	mis_Wait( 1.0 );

	scr_BotPlayerSpawnToWorld( 206,  3626.75, 100.08, 6674.7, 0.0 );	//MOBsF 
	mis_Wait( 0.6 );
	scr_BotPlayerSpawnToWorld( 207,  1747.94, 99.99, 5531.99, 0.0 );	//MOBst 
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );

	//ボットのリスポーン管理 
	// Bot respawn management
	scr_BotPlayerSetRespawnEnable( 204, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 205, false );	//MOB_T 


	scr_BotPlayerSpawnToWorld( 204,  -433.396118, 100.000000, 7069.909668, 0.0 );	//MOBst 
	scr_BotPlayerSpawnToWorld( 205,  -1046.998901, 100.000000, 6527.925781, 0.0 );	//MOBst 
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 204, true );
	scr_BotPlayerSetActionTrigger( 205, true );

}
function miscb_TrapIn2002()
{
	//橋のある道を通るルートを逆から 
	// Reverse the route through the road with a bridge
	print( "TrapIn 2002!\n" );
	scr_RemoveCallbackFromId( 10002 );
}
//モニュメント状態変数 0=未建築　1=黒建築 2=白建築 
// Monument state variable 0 = unbuilt 1 = black building 2 = white building
gMonument07 <- 0 ;
function miscb_TrapIn1003()
{
	//正面のバラの道を通るルート。タワー１を黒に。 
	// Route through the rose road in front. Turn Tower 1 black.
	print( "TrapIn 1003!\n" );
	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );
	scr_SetBreakMonumentCallback( "miscb_BreakMonument07", 20001, CB_TYPE_ONCE, "gfmo_001" );
	gMonument07 = 1 ;
	scr_RemoveCallbackFromId( 12003 );

	//タワー出現を待つ 
	// Wait for the tower to appear
	mis_Wait( 1.0 );

	scr_BotPlayerSpawnToMonument( 204, "gfmo_001" );

	mis_Wait( 0.2 );
	scr_BotPlayerSpawnToMonument( 205, "gfmo_001" );

	//ボットのリスポーン管理 
	// Bot respawn management
	scr_BotPlayerSetRespawnEnable( 204, true );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 205, false );	//MOB_T 


	mis_InfomationAboutTower();	//もし初の敵タワーなら解説メッセージ 
	mis_InfomationAboutTower (); // Commentary message if it is the first enemy tower
//	scr_OpenMissionConditionText1( 0, "TXHFC01106", 7 );	//このタワーに関してのみ設定する
	scr_OpenMissionConditionText1 (0, "TXHFC01106", 7); // Set only for this tower
	scr_OpenMissionConditionText(  0, "TXHFC01105" );	//タワーを立てつつ敵の城へ 
	scr_OpenMissionConditionText (0, "TXHFC01105"); // Go to the enemy's castle while building a tower

	mis_Wait( 3.0 );
	scr_BotPlayerSpawnToWorld( 206, -2340.44, 499.98, 8250.4, 0.0 );	//MOBsd 
	mis_Wait( 0.2 );
	scr_BotPlayerSpawnToWorld( 207, -1487.27, 499.98, 8871.8, 0.0 );	//MOBst 
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );
	print( "TrapIn 1003!\n" );

}
function miscb_TrapIn2003()
{
	//正面のバラの道を通るルートを逆から。 
	// Reverse the route through the rose road in front.
	print( "TrapIn 2003!\n" );
	scr_RemoveCallbackFromId( 10003 );
}
function mis_InfomationAboutTower()
{
	if(gFirstMonument == 0)
	{
		gFirstMonument = 1;

		mis_BannerInfoTimer("miscb_BunnerInfo0202",3.0);	//バナーを次のものに更新 
		mis_BannerInfoTimer ("miscb_BunnerInfo0202", 3.0); // Update banner to:
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMB11041" );	//ひい！出た  
		scr_OpenMissionExpainText (0, "# TXCMB11041"); // Hi! Came out
	}
}
function miscb_BunnerInfo0202()
{
	//バナーインフォメーション続き 
	// Banner information continued
	print( "Bunner0202!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfo0203",4.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11042" );	//ひい！出た  
	mis_BannerInfoTimer ("miscb_BunnerInfo0203", 4.0); // Remove the banner
	scr_OpenMissionExpainText (0, "# TXCMB11042"); // Hi! Came out
}
function miscb_BunnerInfo0203()
{
	//バナーインフォメーション続き 
	// Banner information continued
	print( "Bunner0203!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfo0204",4.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11043" );	//ひい！出た 
	mis_BannerInfoTimer ("miscb_BunnerInfo0204", 4.0); // Remove the banner
	scr_OpenMissionExpainText (0, "# TXCMB11043"); // Hi! Came out
}
function miscb_BunnerInfo0204()
{
	//バナーインフォメーション続き 
	// Banner information continued
	print( "Bunner0204!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",12.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11044" );	//ひい！出た  
	mis_BannerInfoTimer ("miscb_BunnerInfoRemove", 12.0); // Remove the banner
	scr_OpenMissionExpainText (0, "# TXCMB11044"); // Hi! Came out
}
function miscb_TrapIn1004()
{
	//石のアーチがある道を通るルート。
	// Banner information continued
	print( "TrapIn 1004!\n" );
	scr_RemoveCallbackFromId( 12004 );

	scr_BotPlayerSpawnToWorld( 204,1255.03, 100.00, 10753.05, 0.0 );	//MOBsf 
	mis_Wait( 0.2 );
	scr_BotPlayerSpawnToWorld( 205,-767.16, 99.99, 10559.278, 0.0 );	//MOBsd 
	scr_BotPlayerSpawnToWorld( 206, -1486.55, 99.91, 10849.98, 0.0 );	//MOBsd 
	suspend();
	scr_BotPlayerSetActionTrigger( 206, true );

	mis_Wait( 8.0 );
	scr_BotPlayerSpawnToWorld( 207,-2743.02, 100.95, 11015.1, 0.0 );	//MOBst 
	suspend();
	scr_BotPlayerSetActionTrigger( 207, true );

}
function miscb_TrapIn2004()
{
	//石のアーチがある道を通るルートを逆から。 
	// Reverse the route through the road with the stone arch.
	print( "TrapIn 2004!\n" );
	scr_RemoveCallbackFromId( 10004 );
}
function miscb_BreakMonument07()
{
	//タワー7を破壊。 
	// Destroy Tower 7.
	print( "BreakM01!\n" );
	gMonument07 = 0;

	scr_SetBuildMonumentCallback( "miscb_BuildMonument07", 200012, CB_TYPE_ONCE, "gfmo_001", MONUMENT_BUILD_OWNERSHIP );	//4番タワーを建てた 
	scr_SetBuildMonumentCallback( "miscb_BuildMonument07", 200012, CB_TYPE_ONCE, "gfmo_001", MONUMENT_BUILD_OWNERSHIP );	// Built the 4th tower

	//ボットのリスポーン管理 
	// Bot respawn management
	scr_BotPlayerSetRespawnEnable( 204, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 205, false );	//MOB_T 
}
function miscb_BuildMonument07()
{
	//タワー7を建築。 
	// Build Tower 7.
//	scr_CreateSceneEffect( 7603, "Ccam01c",    2073.381348, 508.000031, 9141.7005,   -114.0 );
	scr_CreateSceneEffect( 7603, "Ccam01c",    1188.517822, 507.999847, 8519.669922,   -93.0 );
	scr_CreateSceneEffect( 17603, "Ccam01c",    -3524.177734, 507.999939, 9489.948242,   -57.0 );
	scr_CreateSceneEffect( 27603, "Ccam01c",    -5985.905762, 107.000000, 10944.434,   -144.0 );
	
}
//////////////////////////////////////////////
gMonument06 <- 0;
function miscb_TrapIn1005()
{
	//タワー2向かって右の橋 
	// Bridge on the right towards Tower 2
	print( "TrapIn 1005!\n" );
	mis_BuildTower06Black();
	scr_RemoveCallbackFromId( 10006 );
}
function miscb_TrapIn1006()
{
	print( "TrapIn 1006!\n" );
	mis_BuildTower06Black();
	scr_RemoveCallbackFromId( 10005 );
}
function mis_BuildTower06Black()
{
	//タワー6がクロじゃなければ黒にして敵出現 
	// If Tower 6 is not black, make it black and an enemy appears
	print( "builedM06!\n" );
	if(gMonument06 == 0){
		scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument06", 20003, CB_TYPE_ONCE, "gfmo_003" );
		gMonument06 = 1 ;

		mis_Wait( 1.3 );
		
		scr_BotPlayerSpawnToWorld( 210, -7014.83, 553.7, 7087.6, 0.0 );	//wuzsf 
		scr_BotPlayerSpawnToWorld( 211, -7115.53, 555.1, 7573.7, 0.0 );	//wuzsf 

		suspend();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( 210, true );
		scr_BotPlayerSetActionTrigger( 211, true );

		scr_BotPlayerSpawnToMonument( 208, "gfmo_003" );
		mis_Wait( 0.6 );
		scr_BotPlayerSpawnToMonument( 209, "gfmo_003" );

		scr_BotPlayerSetRespawnEnable( 204, false );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 208, false );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 209, false );	//MOB_T 
	}

		scr_OpenMissionConditionText(  0, "TXHFC01105" );	//タワーを立てつつ敵の城へ 
		scr_OpenMissionConditionText (0, "TXHFC01105"); // Go to the enemy's castle while building a tower

	mis_InfomationAboutTower();	//もし初の敵タワーなら解説メッセージ 
	mis_InfomationAboutTower (); // Commentary message if it is the first enemy tower


}
function miscb_BreakMonument06()
{
	//タワー6を破壊 
	// Destroy Tower 6
	print( "BreakM06!\n" );
	gMonument06 = 0;

	scr_OpenMissionConditionText(  0, "TXHFC01105" );	//タワーを立てつつ敵の城へ 
	scr_OpenMissionConditionText (0, "TXHFC01105"); 	// Go to the enemy's castle while building a tower

	scr_BotPlayerSetRespawnEnable( 208, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 209, false );	//MOB_T 

	scr_SetBuildMonumentCallback( "miscb_BuildMonument06", 2000232, CB_TYPE_ONCE, "gfmo_003", MONUMENT_BUILD_OWNERSHIP );	//4番タワーを建てた 
	scr_SetBuildMonumentCallback ("miscb_BuildMonument06", 2000232, CB_TYPE_ONCE, "gfmo_003", MONUMENT_BUILD_OWNERSHIP);	// Built the 4th tower

}
function miscb_BuildMonument06()
{
	//タワー6を建築。 
	// Build Tower 6.
		print( "BilllM06!\n" );
	scr_CreateSceneEffect( 7604, "Ccam01c",  -8232.653320, 575.804260, 6802.891,   -127.0 );
}
///////////////////////////////////
gMonument05 <- 0;
function miscb_TrapIn1007()
{
	//ヘビー出現 
	// Heavy appearance
	print( "TrapIn 1007!\n" );
	scr_OpenMissionConditionText(  0, "TXHFC01105" );	//タワーを立てつつ敵の城へ 
	scr_OpenMissionConditionText (0, "TXHFC01105"); 	// Go to the enemy's castle while building a tower
	
	//タワー5を黒にしてタイマーを設置 
	// Turn tower 5 black and set a timer
	if(gMonument05 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_004", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument05", 20004, CB_TYPE_ONCE, "gfmo_004" );
		gMonument05 = 1 ;
		//タイマーでボットを召喚するやつ 
		// The one who summons a bot with a timer
		scr_SetTimerCallback( "miscb_BotSpawn201202tower05", 1201202, CB_TYPE_ONCE, 10.0 );

	}

	mis_Wait( 1.0 );

	scr_BotPlayerSetRespawnEnable( 204, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 205, false );	//MOB_T 


	scr_BotPlayerSpawnToWorld( 212, -12039.912109, 100.000000, 2624.010254, 0.0 );	//hevf 
	scr_BotPlayerSpawnToWorld( 213, -11340.427734, 100.000000, 2806.663330, 0.0 );	//hevf 
	scr_BotPlayerSpawnToWorld( 214, -10848.613281, 177.526520, 2130.238770, 0.0 );	//hevf 
	suspend();
	scr_BotPlayerSetActionTrigger( 212, true );
	scr_BotPlayerSetActionTrigger( 213, true );
	scr_BotPlayerSetActionTrigger( 214, true );

	mis_BannerInfoTimer("miscb_BunnerInfo0302",3.0);	//バナーを次のものに更新 
	mis_BannerInfoTimer ("miscb_BunnerInfo0302", 3.0); 	// Update banner to:
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB11051" );	//のろまがでてきたぜ  
	scr_OpenMissionExpainText (0, "# TXCMB11051"); 	// I'm getting lazy
}
function miscb_BreakMonument05()
{
	//タワー5を破壊 
	// Destroy Tower 5
	print( "BreakM05!\n" );
	gMonument05 = 0;

	scr_BotPlayerSetRespawnEnable( 208, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 209, false );	//MOB_T 
	
	//タワー４を黒に 
	if(gMonument04 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument04", 20004, CB_TYPE_ONCE, "gfmo_002" );
		gMonument04 = 1 ;
		
		
		mis_Wait( 0.4 );
		scr_BotPlayerSpawnToMonument( 201, "gfmo_002" );
		scr_BotPlayerSpawnToMonument( 202, "gfmo_002" );
		scr_BotPlayerSpawnToMonument( 203, "gfmo_002" );

		scr_BotPlayerSetRespawnEnable( 201, true );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 202, false );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 203, false );	//MOB_T 
	}
	
	scr_SetBuildMonumentCallback( "miscb_BuildMonument05", 200032, CB_TYPE_ONCE, "gfmo_004", MONUMENT_BUILD_OWNERSHIP );

}
function miscb_BuildMonument05()
{
	//タワー5を建築。 
	scr_CreateSceneEffect( 7605, "Ccam01c",    -11196.185547, 107.000000, 1232.786,   137.0 );
	scr_CreateSceneEffect( 17605, "Ccam01c",    -9156.767578, 107.000000, -1266.61,   140.0 );
}
function miscb_BunnerInfo0302()
{
	//バナーインフォメーション続き 
	print( "Bunner0302!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",5.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11052" );	//かんけーねぇ  
}
function miscb_BotSpawn201202tower05()
{
	//タワー5が黒なら敵出現 
	if(gMonument05 == 1)
	{
		print( "sp201202toM05!\n" );

		scr_BotPlayerSpawnToMonument( 201, "gfmo_004" );
		scr_BotPlayerSpawnToMonument( 202, "gfmo_004" );

		scr_BotPlayerSetRespawnEnable( 201, true );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 202, false );	//MOB_T 
	}
}
///////////////////////////////////////
gMonument04 <- 0;
function miscb_TrapIn1008()
{
	//タワー4が黒なら敵出現 
	print( "TrapIn 1008!\n" );

	scr_BotPlayerSetRespawnEnable( 208, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 209, false );	//MOB_T 
	
	//タワー４を黒に 
	if(gMonument04 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument04", 20004, CB_TYPE_ONCE, "gfmo_002" );
		gMonument04 = 1 ;
		
		
		mis_Wait( 0.4 );
		scr_BotPlayerSpawnToMonument( 201, "gfmo_002" );
		scr_BotPlayerSpawnToMonument( 202, "gfmo_002" );
		scr_BotPlayerSpawnToMonument( 203, "gfmo_002" );

		scr_BotPlayerSetRespawnEnable( 201, true );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 202, false );	//MOB_T 
		scr_BotPlayerSetRespawnEnable( 203, false );	//MOB_T 
	}
}
gMonument03 <- 0;
function miscb_BreakMonument04()
{
	//タワー４を破壊したらタワー3を黒にしつつボットリスポーンを制御 
	print( "BreakM04!\n" );
	gMonument04 = 3;

	scr_BotPlayerSetRespawnEnable( 201, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 202, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 203, false );	//MOB_T 

	if(gMonument03 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_005", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument03", 20005, CB_TYPE_ONCE, "gfmo_005" );
		gMonument03 = 1 ;
	}

	//次のイベントに備え橋の魔術師を殺しておく 
	if(scr_BotPlayerGetLife( 210 ) != 0 )
	{
		print( "remove210!\n" );
		scr_BotPlayerSetLife( 210, 0 );
	}
	if(scr_BotPlayerGetLife( 211 ) != 0 )
	{
		print( "remove211!\n" );
		scr_BotPlayerSetLife( 211, 0 );
	}

	scr_SetBuildMonumentCallback( "miscb_BuildMonument04", 200042, CB_TYPE_ONCE, "gfmo_002", MONUMENT_BUILD_OWNERSHIP );


}
function miscb_BuildMonument04()
{
	//タワー4を建築。 
	scr_CreateSceneEffect( 7606, "Ccam01c",  -7112.963867, 547.423950, -3246.082,   82.0 );
}
function miscb_TrapIn1013()
{
	//タワー3が立っていなければ立てつつ魔法使い軍団を出現させつつメッセージる。 
	print( "TrapIn 1013!\n" );

	scr_BotPlayerSetRespawnEnable( 208, false );	//MOB_T 
	scr_BotPlayerSetRespawnEnable( 209, false );	//MOB_T 


	if(gMonument03 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_005", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument03", 20005, CB_TYPE_ONCE, "gfmo_005" );
		gMonument03 = 1 ;
	}


	//中ボス魔法使いを召喚 
	scr_ResetGameCameraDirection( -3015.471436, -1726.461182, false );	//ボスっぽい奴の方向を向く
	if(scr_GetGameCameraAngleType() == ANGLE_ZOOM_OUT2 )	//カメラが垂直見下ろしの場合は見下ろしに 
	{
		scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	}
	mis_CameraSet();
	scr_CreateSceneEffect( 51, "Slis02c", -3015.471436, 555.281494, -1726.461182, 0.0  );	//落雷 
	scr_CreateSceneEffect( 52, "Slis03c", -3015.471436, 555.281494, -1726.461182, 0.0  );	//落雷 
	scr_CreateSceneSound( 50110, 80950, -3015.471436, 555.281494, -1726.461182 );
	scr_BotPlayerSpawnToWorld( 219,  -3015.471436, 555.281494, -1726.461182, -80.0 );	//DARKMAGE 
	suspend();
	scr_RemoveScene( 51, false );
	scr_RemoveScene( 52, false );
	mis_CameraSet();

	//ザコ魔法使いを召喚 
	scr_BotPlayerSpawnToWorld( 210,  -3736.853271, 100.000000, -4393.96289, -100.0 );	//CAndle 
	scr_BotPlayerSpawnToWorld( 211,  -2430.222656, 100.000000, -3913.61547, -100.0 );	//CAndle 
	scr_BotPlayerSpawnToWorld( 215,  -3871.904785, 101.303963, -267.150269, -100.0 );	//CAndle 
	scr_BotPlayerSpawnToWorld( 216,  -3547.345703, 523.648499, -1564.37426, -100.0 );	//CAndle 
	scr_BotPlayerSpawnToWorld( 217,  -2877.055908, 521.067871, -2405.06738, -100.0 );	//CAndle 
	scr_BotPlayerSpawnToWorld( 218,  -2588.416016, 526.686890, -1446.10571, -100.0 );	//CAndle 
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 210, true );
	scr_BotPlayerSetActionTrigger( 211, true );
	scr_BotPlayerSetActionTrigger( 215, true );
	scr_BotPlayerSetActionTrigger( 216, true );
	scr_BotPlayerSetActionTrigger( 217, true );
	scr_BotPlayerSetActionTrigger( 218, true );
	scr_BotPlayerSetActionTrigger( 219, true );

	//candleのリスポーンを解除 
	scr_AddStandbyEnemyCallback( "miscb_respawn210Tower03", 210, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_respawn211Tower03", 211, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_respawn215Tower03", 215, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_respawn216Tower03", 216, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_respawn217Tower03", 217, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_respawn218Tower03", 218, STANDBY_CAN_RESPAWN_TIMING );


	mis_Wait( 0.4 );

	mis_BannerInfoTimer("miscb_BunnerInfo0402",3.0);	//バナーを次のものに更新 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB11061" );	//むりだぜ  

//	scr_AddStandbyEnemyCallback( "miscb_BotDead219", 219, STANDBY_COUNT_START_TIMING );	//ダークメイジ死亡時にイベント 
	scr_AddTargetEnemyCallback( "miscb_BotDead219", 219, "$TXHFI11101" );

}
function miscb_BunnerInfo0402()
{
	//バナーインフォメーション続き 
	print( "Bunner0402!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfo0403",3.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11062" );	//とんがり  
}
function miscb_BunnerInfo0403()
{
	//バナーインフォメーション続き 
	print( "Bunner0403!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",6.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11063" );	//ガードすれば  
}
function mis_respawnTower03( regist_id )
{
	//雑魚のリスポーン設定 
	print( "respawn!\n" );
	if(gMonument03 == 1)
	{
		scr_BotPlayerSpawnToMonument( regist_id, "gfmo_005" );
	}
}
function miscb_respawn210Tower03()
{
	print( "spawn210!\n" );
	mis_respawnTower03( 210 );
}
function miscb_respawn211Tower03()
{
	print( "spawn211!\n" );
	mis_respawnTower03( 211 );
}
function miscb_respawn215Tower03()
{
	print( "spawn215!\n" );
	mis_respawnTower03( 215 );
}
function miscb_respawn216Tower03()
{
	print( "spawn216!\n" );
	mis_respawnTower03( 216 );
}
function miscb_respawn217Tower03()
{
	print( "spawn217!\n" );
	mis_respawnTower03( 217 );
}
function miscb_respawn218Tower03()
{
	print( "spawn218!\n" );
	mis_respawnTower03( 218 );
}
function miscb_BreakMonument03()
{
	//タワー3を破壊。ボットのスポーン制御 
	print( "break03!\n" );
	gMonument03 = 2;
	mis_BuildTower02();	//タワーなければ建てる 

	scr_RemoveStandbyEnemyCallback( 210 );
	scr_RemoveStandbyEnemyCallback( 211 );
	scr_RemoveStandbyEnemyCallback( 215 );
	scr_RemoveStandbyEnemyCallback( 216 );
	scr_RemoveStandbyEnemyCallback( 217 );
	scr_RemoveStandbyEnemyCallback( 218 );

	scr_SetBuildMonumentCallback( "miscb_BuildMonument03", 200052, CB_TYPE_ONCE, "gfmo_005", MONUMENT_BUILD_OWNERSHIP );

}
function miscb_BuildMonument03()
{
	//タワー3を建築。 
	scr_CreateSceneEffect( 7607, "Ccam01c",    -226.529510, 107.000000, -2125.499,   60.0 );
	scr_CreateSceneEffect( 17607, "Ccam01c",    1641.938477, 107.000000, -1096.174,   60.0 );
}
function miscb_BotDead219()
{
	//ダークメイジ１を殺した。手下を殺してリスポーン制御 
	print( "kill219!\n" );
	mis_BuildTower02();	//タワーなければ建てる 
	scr_RemoveTargetEnemyCallback( 219 );	

	scr_RemoveStandbyEnemyCallback( 210 );
	scr_RemoveStandbyEnemyCallback( 211 );
	scr_RemoveStandbyEnemyCallback( 215 );
	scr_RemoveStandbyEnemyCallback( 216 );
	scr_RemoveStandbyEnemyCallback( 217 );
	scr_RemoveStandbyEnemyCallback( 218 );

	scr_BotPlayerSetLife( 210, 0 );
	scr_BotPlayerSetLife( 211, 0 );
	scr_BotPlayerSetLife( 215, 0 );
	scr_BotPlayerSetLife( 216, 0 );
	scr_BotPlayerSetLife( 217, 0 );
	scr_BotPlayerSetLife( 218, 0 );

}
gMonument02 <- 0;
function mis_BuildTower02()
{
	//タワー2を建てる 
	print( "build02!\n" );
	if(gMonument02 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_006", POWER_COLOR_BLACK );
		scr_SetBreakMonumentCallback( "miscb_BreakMonument02", 20006, CB_TYPE_ONCE, "gfmo_006" );
		gMonument02 = 1 ;
		//タワー出現を待つ 
		scr_WaitStart( 1.0 );
		while( scr_Waiting() ){
			suspend();
		}
		//タイマーでボットを召喚するやつ 
		scr_SetTimerCallback( "miscb_BotSpawn201202tower02", 201202, CB_TYPE_ONCE, 10.0 );
	}
}
function miscb_BotSpawn201202tower02()
{
	//もしタワー2が建っていればボットをスポーンしてリスポーン制御 
	print( "botrespawn201202!\n" );
	if(gMonument02 == 1)
	{
//		scr_BotPlayerSpawnToWorld( 201,  5379.999023, 578.358276, 1847.79028, -120.0 );	//mob 
//		scr_BotPlayerSpawnToWorld( 202,  5831.020508, 580.843933, 824.169739, -120.0 );	//mob 
		scr_BotPlayerSpawnToMonument( 201, "gfmo_006" );
		scr_BotPlayerSpawnToMonument( 202, "gfmo_006" );

		suspend();
		scr_BotPlayerSetRespawnEnable( 201, true );	
		scr_BotPlayerSetRespawnEnable( 202, false );	
	}
}

function miscb_TrapIn1014()
{
	//タワー2を建て、ヘビー軍団とダークメイジ召喚。メッセージ 
	print( "TrapIn 1014!\n" );

	mis_BuildTower02();	//タワーなければ建てる 

	//中ボス魔法使いを召喚 
	scr_ResetGameCameraDirection( 5072.511230, 1043.21582, false );	//ボスっぽい奴の方向を向く
	if(scr_GetGameCameraAngleType() == ANGLE_ZOOM_OUT2 )	//カメラが垂直見下ろしの場合は見下ろしに 
	{
		scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	}
	mis_CameraSet();
	scr_CreateSceneEffect( 51, "Slis02c", 5072.511230, 574.698059, 1043.21582, 0.0  );	//落雷 
	scr_CreateSceneEffect( 52, "Slis03c", 5072.511230, 574.698059, 1043.21582, 0.0  );	//落雷 
	scr_CreateSceneSound( 50110, 80950, 5072.511230, 574.698059, 1043.21582 );
	scr_BotPlayerSpawnToWorld( 223,  5072.511230, 574.698059, 1043.21582, -120.0 );	//DARKMAGE 
	suspend();
	scr_RemoveScene( 51, false );
	scr_RemoveScene( 52, false );
	mis_CameraSet();

	//heavy軍団 
	scr_BotPlayerSpawnToWorld( 212,  3682.265869, 258.899048, -363.73843, -120.0 );	//heavy 
	scr_BotPlayerSpawnToWorld( 213,  3483.224609, 237.147568, -60.030273, -120.0 );	//heavy 
	scr_BotPlayerSpawnToWorld( 214,  3275.635742, 250.485199, 240.265594, -120.0 );	//heavy 
	scr_BotPlayerSpawnToWorld( 220,  4463.625000, 505.929291, 1162.46398, -120.0 );	//heavy 
	scr_BotPlayerSpawnToWorld( 221,  4857.141113, 500.000000, 414.962646, -120.0 );	//heavy 
	scr_BotPlayerSpawnToWorld( 222,  4277.213379, 477.801361, 614.007080, -120.0 );	//heavy 
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 220, true );
	scr_BotPlayerSetActionTrigger( 221, true );
	scr_BotPlayerSetActionTrigger( 222, true );
	scr_BotPlayerSetActionTrigger( 223, true );

	scr_AddStandbyEnemyCallback( "miscb_BotDead223", 223, STANDBY_COUNT_START_TIMING );	//ダークメイジ死亡時にイベント 

	mis_Wait( 0.4 );

	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB11071" );	//大群だよ追い  

}
function miscb_BotDead223()
{
	//ダークメイジ2を殺した。手下を殺してリスポーン制御 
	print( "kill223!\n" );
	scr_RemoveStandbyEnemyCallback( 223 );

	scr_BotPlayerSetLife( 212, 0 );
	scr_BotPlayerSetLife( 213, 0 );
	scr_BotPlayerSetLife( 214, 0 );
	scr_BotPlayerSetLife( 220, 0 );
	scr_BotPlayerSetLife( 221, 0 );
	scr_BotPlayerSetLife( 222, 0 );

}
function miscb_BreakMonument02()
{
	//タワー2を破壊。 ボットのスポーンを制御 
	print( "BreakM02!\n" );
	gMonument02 = 2;

	scr_BotPlayerSetRespawnEnable( 201, false );	
	scr_BotPlayerSetRespawnEnable( 202, false );	

	scr_SetBuildMonumentCallback( "miscb_BuildMonument02", 200062, CB_TYPE_ONCE, "gfmo_006", MONUMENT_BUILD_OWNERSHIP );

}
function miscb_BuildMonument02()
{
	//タワー7を建築。 
	scr_CreateSceneEffect( 7608, "Ccam01c",    5720.996582, 583.861816, 639.827,   150.0 );
	scr_CreateSceneEffect( 7609, "Ccam01c",    6801.886719, 506.000000, -1198.486,   61.0 );
	scr_CreateSceneEffect( 17609, "Ccam01c",    10003.981445, 107.000000, -645.2927,   0.0 );
	scr_CreateSceneEffect( 27609, "Ccam01c",    11069.489258, 502.257568, 2975.05,   58.0 );

}
/////////////////////////////////////
function miscb_TrapIn1015()
{
	//敵城が近い事を教えるメッセージタイミング 
	print( "TrapIn 1015!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB11081" );	//もうすぐだぜ  

}
gMonument01 <- 0;
function miscb_TrapIn1009()
{
	//敵城前中央ルート 
	print( "TrapIn 1009!\n" );
	scr_RemoveCallbackFromId( 12009 );
	scr_CompleteMonumentBuild( "gfmo_007", POWER_COLOR_BLACK );
	scr_SetBreakMonumentCallback( "miscb_BreakMonument01", 20008, CB_TYPE_ONCE, "gfmo_007" );
	gMonument01 = 1 ;

	mis_Wait( 1.0 );
	scr_BotPlayerSpawnToMonument( 201, "gfmo_007" );
	mis_Wait( 0.3 );
	scr_BotPlayerSpawnToMonument( 202, "gfmo_007" );
	mis_Wait( 0.2 );
	scr_BotPlayerSpawnToMonument( 212, "gfmo_007" );

	scr_BotPlayerSetRespawnEnable( 201, true );	
	scr_BotPlayerSetRespawnEnable( 202, false );	
	scr_BotPlayerSetRespawnEnable( 212, false );	

}
function miscb_TrapIn2009()
{
	print( "TrapIn 2009!\n" );
	//逆から 
	scr_RemoveCallbackFromId( 10009 );
}
gNearCastle <- 0;
function miscb_BreakMonument01()
{
	//タワー1壊したら城にスポーン 
	print( "BreakM01!\n" );
	gMonument01 = 0;
	gNearCastle = 1;
	
	scr_BotPlayerSpawnToMonument( 201, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 203, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 213, "gcmoB_001" );
	scr_BotPlayerSetRespawnEnable( 203, false );	
	scr_BotPlayerSetRespawnEnable( 213, false );	


	scr_SetBuildMonumentCallback( "miscb_BuildMonument01", 200082, CB_TYPE_ONCE, "gfmo_007", MONUMENT_BUILD_OWNERSHIP );

}
function miscb_BuildMonument01()
{
	//タワー7を建築。 
	scr_CreateSceneEffect( 7610, "Ccam01c",    16025.333984, 507.000000, 5348.7539,   100.0 );
}
function miscb_TrapIn1010()
{
	//アーチのあるルート
	print( "TrapIn 1010!\n" );
	scr_RemoveCallbackFromId( 12010 );
	gNearCastle = 1;

	scr_BotPlayerSpawnToMonument( 201, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 202, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 212, "gcmoB_001" );

	scr_BotPlayerSetRespawnEnable( 201, true );	
	scr_BotPlayerSetRespawnEnable( 202, false );	
	scr_BotPlayerSetRespawnEnable( 212, false );	

}
function miscb_TrapIn2010()
{
	print( "TrapIn 2010!\n" );
	scr_RemoveCallbackFromId( 10010 );
}
function miscb_TrapIn1011()
{
	//橋のあるルート 
	print( "TrapIn 1011!\n" );
	scr_RemoveCallbackFromId( 12011 );

	mis_Wait( 1.0 );
	scr_BotPlayerSpawnToWorld( 212,  13691.822266, 100.000000, 6425.361328, -120.0 );	//hev 
	mis_Wait( 0.3 );
	scr_BotPlayerSpawnToWorld( 201,  15875.365234, 100.000000, 7959.118164, -120.0 );	//mob 
	mis_Wait( 0.2 );
	scr_BotPlayerSpawnToWorld( 202,  15732.249023, 100.000000, 8965.762695, -120.0 );	//mob 

	scr_BotPlayerSetRespawnEnable( 201, true );	
	scr_BotPlayerSetRespawnEnable( 202, false );	
	scr_BotPlayerSetRespawnEnable( 212, false );	

}
function miscb_TrapIn2011()
{
	print( "TrapIn 2011!\n" );
	scr_RemoveCallbackFromId( 10011 );
}
//////////////////////////////////////////
function miscb_TrapIn1012()
{
	//敵城の目の前まで来たらゲートキーパー出現してメッセージ 
	print( "TrapIn 1012!\n" );

	//ゲートキーパーを召喚 
	scr_ResetGameCameraDirection(  20984.414063, 4283.028809, false );	//ボスっぽい奴の方向を向く
	if(scr_GetGameCameraAngleType() == ANGLE_ZOOM_OUT2 )	//カメラが垂直見下ろしの場合は見下ろしに 
	{
		scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	}
	mis_CameraSet();
	scr_CreateSceneEffect( 51, "Slis02c", 20277.980469, 500.000000, 3998.363037, 0.0  );	//落雷 
	scr_CreateSceneEffect( 52, "Slis03c", 20277.980469, 500.000000, 3998.363037, 0.0  );	//落雷 
	scr_CreateSceneSound( 50110, 80950, 20277.980469, 500.000000, 3998.363037 );
	scr_CreateSceneEffect( 53, "Slis02c", 20515.289063, 500.000000, 4850.882324, 0.0  );	//落雷2 
	scr_CreateSceneEffect( 54, "Slis03c", 20515.289063, 500.000000, 4850.882324, 0.0  );	//落雷2 
	scr_CreateSceneSound( 50110, 80950, 20515.289063, 500.000000, 4850.882324 );
	scr_BotPlayerSpawnToWorld( 224,  20277.980469, 500.000000, 3998.363037, -80.0 );	//Buket 
	scr_BotPlayerSpawnToWorld( 225,  20515.289063, 500.000000, 4850.882324, -80.0 );	//buket 
	suspend();
	scr_RemoveScene( 51, false );
	scr_RemoveScene( 52, false );
	scr_RemoveScene( 53, false );
	scr_RemoveScene( 54, false );
	mis_CameraSet();

	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 224, true );
	scr_BotPlayerSetActionTrigger( 225, true );


	scr_AddTargetEnemyCallback( "miscb_KillBot224", 224, "$TXHFI11102" );
	scr_AddTargetEnemyCallback( "miscb_KillBot225", 225, "$TXHFI11102" );
	scr_AddStandbyEnemyCallback( "miscb_BotDead224", 224, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead225", 225, STANDBY_COUNT_START_TIMING );

	//メッセージ 
	mis_MassageDialog( "C111_09" );

//	scr_OpenMissionStateText(  0, "$TXHFS11102" );	//達成状況を更新 
	scr_OpenMissionConditionText(  0, "TXHFC01103" );	//敵の城内に侵入する 

	//ザコのスポーンを固定 
	scr_BotPlayerSetRespawnEnable( 201, false );	
	scr_BotPlayerSetRespawnEnable( 202, false );	
	scr_BotPlayerSetRespawnEnable( 203, false );	
	scr_BotPlayerSetRespawnEnable( 204, false );	
	scr_BotPlayerSetRespawnEnable( 205, false );	
	scr_BotPlayerSetRespawnEnable( 208, false );	
	scr_BotPlayerSetRespawnEnable( 209, false );	

}
function miscb_KillBot224()
{
	//門番を殺した 
	print( "kill224!\n" );
	scr_RemoveTargetEnemyCallback( 224 );	//討伐表示を解除 
}
function miscb_KillBot225()
{
	//門番を殺した 
	print( "kill224!\n" );
	scr_RemoveTargetEnemyCallback( 225 );	//討伐表示を解除 
}
gkillCountGateKeeper <- 0;
function miscb_BotDead224()
{
	//門番が死んだ 
	print( "dead224!\n" );
	scr_RemoveStandbyEnemyCallback( 224 );	
	gkillCountGateKeeper = (gkillCountGateKeeper + 1);
	mis_MassageAtKillGateKeeper();
}
function miscb_BotDead225()
{
	//門番が死んだ 
	print( "dead225!\n" );
	scr_RemoveStandbyEnemyCallback( 225 );	
	gkillCountGateKeeper = (gkillCountGateKeeper + 1);
	mis_MassageAtKillGateKeeper();
}
function mis_MassageAtKillGateKeeper()
{
	//門番を２体倒した時にメッセージ 
	if(gkillCountGateKeeper == 2 )
	{
		mis_BannerInfoTimer("miscb_BunnerInfo0502",3.0);	//バナーを次のものに更新 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMB11101" );	//ひい！出た  
		scr_CreateSceneEffect( 7611, "Ccam01c",   20289.458984, 506.000000, 4498.917,   106.0 );
	}
}
function miscb_BunnerInfo0502()
{
	//バナーインフォメーション続き 
	print( "Bunner0502!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",12.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMB11102" );	//じょうもんこわせ  

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL,  18 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 18 );
	scr_BotPlayerSpawnToMonument( 201, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 202, "gcmoB_001" );
	scr_BotPlayerSetRespawnEnable( 201, true );	
	scr_BotPlayerSetRespawnEnable( 202, true );	

}
function miscb_PlayerDead()
{
	//プレイヤーが初めて死亡した 
	print( "playerDead!\n" );

	mis_Wait( 2.8 );
	mis_MassageDialog( "C111_13" );
}
function miscb_BreakCastleGate()
{
	//敵城の城門を破壊した時にメッセージ  
	mis_Wait( 0.2 );

	mis_BannerInfoTimer("miscb_BunnerInfoRemove",12.0);	//バナーを削除する 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB11111" );	//ビッグタワー壊せ   
//	scr_OpenMissionStateText(  0, "$TXHFS11103" );	//達成状況を更新 
	scr_OpenMissionConditionText(  0, "TXHFC01104" );	//ビッグタワーを壊せ 
	
	scr_CreateSceneEffect( 7612, "Ccam01c",    23401.218750, 506.000000, 3611.394,   105.0 );

}
