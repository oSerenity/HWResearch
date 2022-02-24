///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_on_0102\mission00.nut 
//	概要	：オフラインキャンペーン レベル2 キャンペーン2 ミッション2(ストーリー03) 
//	作成	：落合 
//	作成日	：110606 
//	目的	：［変則戦闘］勝利する。進行ルートごとに指定の敵を倒さないと進め無い。制限時間あり。 
//
///////////////////////////////////////////////////////////////////////////////////////////////
function loadMission() 
{
	print("[sample mission] load()\n");
	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );
	scr_SetDisableGimmickType( GIMMICK_BRIDGE1 );
	scr_SetDisableGimmickType( GIMMICK_BOMBSTONE );
}
function startMission() 
{
	print("[sample mission] start()\n");

	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_NORMAL, 10 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 5 );



//コールバックの設定をしておくよ！ 
	scr_SetMessageCallback( "miscb_PlayerSally_First", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );
	scr_SetMessageCallback( "miscb_GameSetWinWhite", 2, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_BLACK_CASTLE_MONUMENT );
	scr_SetMessageCallback( "miscb_GameSetWinBlack", 3, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_WHITE_CASTLE_MONUMENT );

	scr_SetMessageCallback( "miscb_TimeOver", 4, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );	//タイムオーバー時 
	scr_SetMessageCallback( "miscb_PlayerDead", 7, CB_TYPE_ALWAYS, MESSAGE_PLAYER_DEAD );


//BOT登録 
	scr_BotPlayerRegistAndCreate( 101, "NOOBon02", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "MEDICon02", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 103, "MAGEon02", POWER_COLOR_WHITE );
//	scr_BotPlayerRegistAndCreate( 104, "NOOB05D", POWER_COLOR_WHITE );
//	scr_BotPlayerRegistAndCreate( 105, "NOOB06D", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "MUMMY_Dm", POWER_COLOR_BLACK );	//マミーT 
	scr_BotPlayerRegistAndCreate( 202, "MUMMY_Dm", POWER_COLOR_BLACK );	//マミーT 
	scr_BotPlayerRegistAndCreate( 203, "MUMMY_Dm", POWER_COLOR_BLACK );	//マミーT 
	scr_BotPlayerRegistAndCreate( 204, "MUMMY_Dm", POWER_COLOR_BLACK );	//マミーT 
	scr_BotPlayerRegistAndCreate( 205, "MUMMY_Dm", POWER_COLOR_BLACK );	//マミーT 
	scr_BotPlayerRegistAndCreate( 206, "MUMMY_S", POWER_COLOR_BLACK );	//マミーD 
	scr_BotPlayerRegistAndCreate( 207, "MUMMY_S", POWER_COLOR_BLACK );	//マミーD 
	scr_BotPlayerRegistAndCreate( 208, "MUMMY_S", POWER_COLOR_BLACK );	//マミーD 
	scr_BotPlayerRegistAndCreate( 209, "MUMMY_S", POWER_COLOR_BLACK );	//マミーD 
	scr_BotPlayerRegistAndCreate( 210, "MUMMY_S", POWER_COLOR_BLACK );	//マミーD 

	scr_BotPlayerRegistAndCreate( 301, "GHOST_DW", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 302, "GHOST_DW", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 303, "GHOST_DW", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 304, "GHOST_DW", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 305, "GHOST_DW", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 306, "GHOST_SM", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 307, "GHOST_SM", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 308, "GHOST_SM", POWER_COLOR_BLACK );	//おばけ_ 
	scr_BotPlayerRegistAndCreate( 309, "GHOST_SM", POWER_COLOR_BLACK );	//おばけ_ 

	scr_BotPlayerRegistAndCreate( 401, "GHOST_KING", POWER_COLOR_BLACK );	//おばけ王１ 
	scr_BotPlayerRegistAndCreate( 402, "GHOST_KING", POWER_COLOR_BLACK );	//おばけ王２ 
	scr_BotPlayerRegistAndCreate( 403, "MUMMY_KING", POWER_COLOR_BLACK );	//不死王 

	scr_BotPlayerRegistAndCreate( 501, "MOBsuc", POWER_COLOR_BLACK );	//犠牲フライバー 

//トラップ登録 
	scr_RegistTrapBox( 13101,  16440.0, 0.0, 1399.7, 2126.0, 1000.0, 2068.5, -7.3 );	//城内
//	scr_RegistTrapBox( 11101, 8318.0, 0.0, -7760.1, 1555.2, 1000.0, 465.9, -336.8 );	//ミイラゾーン１開始トラップ 
	scr_RegistTrapBox( 11101, 7577.8, 0.0, -2455.6, 1123.6, 1000.0, 411.9, -238.5 );	//ミイラゾーン１開始トラップ 
	scr_RegistTrapBox( 11102, 12914.8, 0.0, -1819.3, 3888.1, 1000.0, 352.8, -336.8 );	//蟻地獄解説とミイラ再スタート 

	scr_RegistTrapBox( 11103, 10831.5, 0.0 , -4767.9, 5245.07, 1000.0 , 4372.6, -333.5 );	//ミイラゾーン１ヒントのメッセージコールバック削除用 
	scr_RegistTrapBox( 11103, -9765.98, 0.0 , 6239.8, 5245.07, 1000.0 , 4372.6, -333.5 );	//ミイラゾーン２ヒントのメッセージコールバック削除用 

	scr_RegistTrapBox( 12101,  5852.6, 0.0, 7143.2, 1232.1, 1000.0, 578.1, -298.8 );	//お化けゾーン１開始トラップ 
	scr_RegistTrapBox( 12102,  5461.1, 0.0, 6273.3, 1233.1, 1000.0, 576.1, -321.9 );	//ｐ化け１のワープブロック 
	scr_RegistTrapBox( 12103,  9593.8, 0.0, 8488.2, 3765.0, 1000.0, 170.2, -42.1  );	//ｐ化け１の再開ブロック 
	scr_RegistTrapBox( 13201,  2605.2, 0.0, 2122.2, 1810.7, 1000.0, 296.6, -321.9  );	//中央開始 
	scr_RegistTrapBox( 13201,  4770.2, 0.0, -1258.5, 1812.7, 1000.0, 221.1, -246.1  );	//中央開始 
	scr_RegistTrapBox( 13202,  -6221.1, 0.0, -3349.2, 1058.4, 1000.0, 295.6, -316.0 );	//中央押し戻し大橋 
	scr_RegistTrapBox( 13203,  -5294.3, 0.0, 2385.7, 1055.4, 1000.0, 294.6, -49.6   );	//中央押し戻し細い橋 
	scr_RegistTrapBox( 11201,  -6928.2, 0.0, 4508.0, 1426.6, 1000.0, 295.6, -41.8   );	//みいら２開始 
//	scr_RegistTrapBox( 11201,  -11512.3, 0.0, 10031.5, 977.4, 1000.0, 870.9, 0.0  );	//みいら２開始 
	scr_RegistTrapBox( 11202,  -12648.9, 0.0, 4278.7, 4138.5, 1000.0, 116.9, -326.7 );	//みいら２わーぷ
	scr_RegistTrapBox( 12201,  -8694.0, 0.0, -6016.5, 1834.2, 1000.0, 298.6, -270.0  );	//おばけ２開始 
//	scr_RegistTrapBox( 12202,  -9293.4, 0.0, -8599.4, 1205.4, 1000.0, 294.6, -67.7  );	//おばけ２わーぷ 
	scr_RegistTrapBox( 12203,  -11955.5, 0.0, -2077.3, 2277.0, 1000.0, 200.5, -17.4  );	//おばけ２わーぷ 
	scr_RegistTrapBox( 13301,  -13122.9, 0.0, 4038.0, 3880.4, 1000.0, 312.5, -326.7 );	//攻城戦 
	scr_RegistTrapBox( 13301,  -13285.1, 0.0, -288.4, 3748.3, 1000.0, 312.5, -33.7  );	//攻城戦 

	scr_RegistTrapBox( 13302,  -16433.1, 0.0, -20.4, 949.3, 1000.0, 878.5, -351.7  );	//敵城内  
	scr_RegistTrapSphere( 13303, -15700.030273, 0.000000, 2413.928223, 1000.0 );	//敵城内 


//トラップコールバック 
//	scr_SetTrapInCallback( "miscb_TrapIn13101", 13101, CB_TYPE_ONCE, 13101 );	//城内
//	scr_SetTrapOutCallback( "miscb_TrapOut131", 23101, CB_TYPE_ONCE, 13101 );	//城内
	scr_SetTrapInCallback( "miscb_TrapIn11101", 11101, CB_TYPE_ONCE, 11101 );	//ミイラゾーン１開始トラップ 
	scr_SetTrapInCallback( "miscb_TrapIn11102", 11102, CB_TYPE_ONCE, 11102 );	//ミイラゾーン１開始トラップ 
	scr_SetTrapOutCallback( "miscb_TrapOut11103", 11103, CB_TYPE_ALWAYS, 11103 );	//ミイラゾーン1&2ヒント消去 

	scr_SetTrapInCallback( "miscb_TrapIn12101", 12101, CB_TYPE_ONCE, 12101 );	//お化けゾーン１開始トラップ 
	scr_SetTrapInCallback( "miscb_TrapIn12102", 12102, CB_TYPE_ALWAYS, 12102 );	//ｐ化け１のワープブロック 
//	scr_SetTrapInCallback( "miscb_TrapIn12103", 12103, CB_TYPE_ONCE, 12103 );	//ｐ化け１の再開トラップ 

	scr_SetTrapInCallback( "miscb_TrapIn13201", 13201, CB_TYPE_ONCE, 13201 );	//中央奪い合い開始 
	scr_SetTrapInCallback( "miscb_TrapIn13202", 13202, CB_TYPE_ALWAYS, 13202 );	//中央押し戻し 
	scr_SetTrapInCallback( "miscb_TrapIn13203", 13203, CB_TYPE_ALWAYS, 13203 );	//中央押し戻し2 

	scr_SetTrapInCallback( "miscb_TrapIn11201", 11201, CB_TYPE_ONCE, 11201 );	//みいら２開始  
	scr_SetTrapInCallback( "miscb_TrapIn11202", 11202, CB_TYPE_ALWAYS, 11202 );	//みいら2わーぷ  
	
	scr_SetTrapInCallback( "miscb_TrapIn12201", 12201, CB_TYPE_ONCE, 12201 );	//おばけ２開始  
//	scr_SetTrapInCallback( "miscb_TrapIn12202", 12202, CB_TYPE_ALWAYS, 12202 );	//おばけ2わーぷ  
	scr_SetTrapInCallback( "miscb_TrapIn12203", 12203, CB_TYPE_ALWAYS, 12203 );	//おばけ2わーぷ  

	scr_SetTrapInCallback( "miscb_TrapIn13301", 13301, CB_TYPE_ONCE, 13301 );	//攻城戦開始  
	scr_SetTrapInCallback( "miscb_TrapIn13303", 13303, CB_TYPE_ONCE, 13303 );	//おばけ変更  

	//オフラインキャンペーンＨＵＤ設定 
	scr_SetDisableTacticalInfomation();	//バナーテキストを非表示 
	scr_SetEnablePlayerHeroPopup( false );	//ヒーローポップアップの非表示 
	scr_SetEnableInputPlayerVoiceReaction( false );	//リアクションボイスマクロの非表示 
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


//出撃前メッセージ 
	scr_WaitStart( 0.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C212_01" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();


	scr_OpenMissionConditionText(  0, "TXHFC03201" );	//達成条件を表示 


	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();
	scr_PlayerSetForceRespawnPosition( 15894.094727, 0.000000, 1291.30, -100.0 );	//プレイヤーの出現位置を固定 


// ゲーム開始を待ちます
	mis_WaitGameStart();

}
function mis_WaitPlayerCreate()
{
	while( !scr_PlayerIsCreateBody( 0 ) )
	{
		suspend();
	}
}
//ゲーム開始を待つ処理
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
	scr_BotPlayerSpawnToMonument( 101, "gcmoA_001" );
	scr_BotPlayerSpawnToMonument( 102, "gcmoA_001" );
	scr_BotPlayerSpawnToMonument( 103, "gcmoA_001" );
	suspend();
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );
	scr_BotPlayerSetLifeRecover( 101, false );
	scr_BotPlayerSetLifeRecover( 102, false );
	scr_BotPlayerSetLifeRecover( 103, false );
}
///////////////////汎用ファンクション /////////////////////
///////////////////////////////////////////////////////////
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
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	scr_SetInputDisable( SCR_INPUT_CAMERA );	//カメラを禁止 
	mis_Wait( 0.65 );
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_SetInputEnable( SCR_INPUT_CAMERA );	//カメラ禁止解除 
}
function mis_Warp( x, y, z, roty)
{
	print("warp()\n");
	scr_PauseOn();		
	// フェードしてワープ
	scr_FadeOutBlack( 0.5 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	// ワープ
	scr_PlayerWarp( x, y, z, roty );
	// 1フレーム待たないとワープが完了しない
	suspend();
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	scr_PauseOff();
	// カメラを はいご へリセット
	scr_ResetGameCameraBehind( true )
	scr_PauseOn();		
	scr_FadeIn( 0.5 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_PauseOff();
}
function mis_Wait( sec )
{
	print("waitsec()\n");
	scr_WaitStart( sec );
	while( scr_Waiting() )	
	{
		suspend();
	}
}
function mis_SetKeepOutEffect( id, x, y, z, roty )
{
	print("setEffect!()\n");
	scr_CreateSceneEffect( id, "Ccam37c",  x,  y,  z,  roty );
	scr_CreateSceneEffect( id+600, "Gjum01c",  x,  y,  z,  roty );

}
function mis_RemoveEffect( id, x, y, z, roty )
{
	print("Effect!()\n");
	scr_CreateSceneEffect( id, "Shap01c",  x,  y,  z,  roty );
	mis_Wait(0.1);
	scr_RemoveScene( id, false );
}
function mis_AppearEffect( id, x, y, z, roty )
{
	print("Effect!()\n");
	scr_CreateSceneEffect( id, "Stor01f",  x,  y,  z,  roty );
	mis_Wait(0.1);
	scr_RemoveScene( id, false );
}
function mis_BannerInfoTimer(fn_name,time)
{
	//同ＩＤタイマーコールバックのセット・入れ替え 
	scr_RemoveCallbackFromId( 80000 );	
	suspend();
	scr_SetTimerCallback( fn_name, 80000, CB_TYPE_ONCE, time );
}
function miscb_BunnerInfoRemove()
{
	//バナーインフォメーション削除 
	print( "BunnerRemove!\n" );
	scr_CloseMissionExpainText( 0 );
}
function mis_BigWarp( x1, y1, z1, r1, x2, y2, z2, r2 )
{
	//エフェクト付きのワープ演出 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_CreateSceneSound( 98764, 140300, x1, y1, z1 );
	scr_CreateSceneEffect( 98765, "Stor01f",  x1,  y1,  z1,  r1 );
	mis_Wait( 1.2 );

	scr_FadeOutBlack( 0.5 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	
	// ワープ
	scr_PlayerWarp( x2, y2, z2, r2 );
	// 1フレーム待たないとワープが完了しない
	suspend();
	// カメラを はいご へリセット
	scr_ResetGameCameraBehind( true )
	scr_FadeIn( 0.6 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
	scr_RemoveScene( 98765, true );
	suspend();

}
//ゲームセット時のコールバック 
///////////////////////////////
function miscb_GameSetWinWhite()
{
	//勝った 
	print( "Game Set Win White!\n" );
	scr_GameSetMissionSuccess();
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	scr_BotPlayerSetLife( 401, 0 );
	scr_BotPlayerSetLife( 201, 0 );
	scr_BotPlayerSetLife( 202, 0 );
	scr_BotPlayerSetLife( 206, 0 );
	scr_BotPlayerSetLife( 207, 0 );
	scr_BotPlayerSetLife( 208, 0 );
	scr_BotPlayerSetLife( 209, 0 );
	scr_BotPlayerSetLife( 301, 0 );
	scr_BotPlayerSetLife( 302, 0 );
	scr_BotPlayerSetLife( 303, 0 );
	scr_BotPlayerSetLife( 304, 0 );

	mis_Wait( 1.6 );

	mis_MassageDialog( "C212_26" );

}
function miscb_GameSetWinBlack()
{
	//負けた 
	print( "Game Set Winblack!\n" );
	scr_GameSetMissionFailure();
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	mis_Wait( 1.6 );

	mis_MassageDialog( "C111_14" );

}
function miscb_TimeOver()
{
	//タイムオーバー 
	print( "TimeOver!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	mis_Wait( 2.0 );

	mis_MassageDialog( "C212_29" );
	scr_GameSetMissionFailure();	//ミッション失敗 
}
///////////////////////コールバック処理 
////////////////////////////////////////
function miscb_PlayerSally_First()
{
	//初回出撃時 
	print( "Player is sally!\n" );

	//カメラを寄りの背後視点に変更 
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( false );

	//分かれ道誘導
	scr_CreateSceneEffect( 7601, "Ccam01c",    12925.493164, 7.000000, 603.77,   -157.0 );
	scr_CreateSceneEffect( 7602, "Ccam01c",    13116.818359, 7.186249, 1521.4,   -7.0 );

	mis_Wait( 1.0 );	

	mis_MassageDialog( "C212_02" );

//	scr_OpenMissionConditionText(  0, "$TXHFC21201" );	//達成条件を表示 
//	scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
	scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


	scr_SetMessageCallback( "miscb_PlayerSally", 6, CB_TYPE_ALWAYS, MESSAGE_PLAYER_SALLY );	
	scr_BotPlayerSetMarchCastleMonument( POWER_COLOR_WHITE, false );	//仲間の勝手な進軍を制御 

	//中央タワーを黒に 
	scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_BLACK );
}
function miscb_PlayerSally()
{
	print( "Player is sally after!\n" );
	//2回目以降の出撃 
	mis_CheckClearMummyZone01();	//ミイラのクリア状況を確認し初期化 
	mis_CheckClearMummyZone02();	//ミイラのクリア状況を確認し初期化 
}
function miscb_PlayerDead()
{
	print( "Player dead !\n" );
	//おばけの場合はチェックを死亡時に通して初期化 
	mis_CheckClearGhostZone01();
	mis_CheckClearGhostZone02();
}
function miscb_TrapIn11102()
{
	print( "in11102!\n" );
	//蟻地獄説明イベント。敵が蟻地獄上に出現して死ぬ。 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );
	scr_BotPlayerSetActionTrigger( 101, false );
	scr_BotPlayerSetActionTrigger( 102, false );
	scr_BotPlayerSetActionTrigger( 103, false );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	scr_ResetGameCameraDirection( 11902.744141, -3363.385498, false );	//カメラセットしつつ登場  
	mis_Wait( 0.4 );
	scr_BotPlayerSpawnToWorld( 501,  11902.744141, -186.334549, -3363.385498, 31.0 );
	scr_BotPlayerSetActionTrigger( 501, true );
	scr_BotPlayerSetRespawnEnable( 501, false );

	scr_AddTargetEnemyCallback( "miscb_KillBot501", 501, "$TXHFI21202" );
	scr_AddStandbyEnemyCallback( "miscb_BotDead501", 501, STANDBY_COUNT_START_TIMING );
}
function miscb_KillBot501()
{
	//特に処理はしない空のコールバック 
}
function miscb_BotDead501()
{
	//アリ地獄に食われる奴が死んだ 
	print( "dead501!\n" );
	scr_RemoveStandbyEnemyCallback( 501 );

	//メッセージ 
	mis_MassageDialog( "C212_03" );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//ミイラ出現１///////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
function mis_CheckClearMummyZone01()
{
	//ミイラゾーンの進行状態をチェック。（リスポーン時） 
	print( "checkmum01!\n" );
	if(gClearMummyZone01 == 1)
	{
		//ミイラ出現後、クリア前 

		//ヒントのカウントをリセット 
		scr_RemoveCallbackFromId( 5 );
//		scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を更新 
		scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 

		//再開のトラップを引く 
		scr_RemoveCallbackFromId( 11102 );
		scr_SetTrapInCallback( "miscb_RestartMummyZone01", 11102, CB_TYPE_ONCE, 11102 );	//ミイラゾーン１開始トラップ
	}
}
gClearMummyZone01 <- 0;	//0開始前　1途中　2クリア 
function miscb_TrapIn11101()
{
	print( "In11101!\n" );
	//蟻地獄１の橋付近に到達。ミイラゾーン開始 
	gClearMummyZone01 = 1;	//開始フラグを建てる 

	//メッセージ 
	mis_MassageDialog( "C212_04" );

	//エフェクトつきワープ 
	mis_BigWarp( 8103.4, 384.3, -2577.2, 0.0,   11063.6, -106.0, -3773.5, -97.0 );
//	mis_Warp( 11063.634766, -106.025642, -3773.557373, -97.0 );	//ワープ 

//	mis_SetKeepOutEffect( 901, 8844.054688, 303.315918, -7539.941406, 27.0  );	//行きどまり
	mis_SetKeepOutEffect( 902, 7955.053711, 450.000000, -2494.441406, 115.0 );	//行きどまり

	//メッセージと敵出現開始 
	//メッセージ
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C321_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	suspend();
	suspend();
	scr_OpenDialog( 0, "C212_05" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	scr_OpenDialog( 0, "C212_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	//敵出現とカメラムーブ 
	mis_SpawnMummy01();

	//トラップ機能の入れ替え 
	scr_SetTrapInCallback( "miscb_TrapIn11101b", 11101, CB_TYPE_ALWAYS, 11101 );	//ミイラゾーン１開始トラップ

	//ミイラの倒し方を教えるメッセージ用のコールバックをセット 
	scr_SetTimerCallback( "miscb_HintMassage01", 5, CB_TYPE_ONCE, 15.0 );	//時間で告知 
	scr_AddStandbyEnemyCallback( "miscb_BotDead201", 201, STANDBY_COUNT_START_TIMING );	//死亡させたらカウントをリセット。
	scr_AddStandbyEnemyCallback( "miscb_BotDead202", 202, STANDBY_COUNT_START_TIMING );	//全員を倒したら進む 
//	scr_AddStandbyEnemyCallback( "miscb_BotDead203", 203, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead204", 204, STANDBY_COUNT_START_TIMING );
//	scr_AddStandbyEnemyCallback( "miscb_BotDead205", 205, STANDBY_COUNT_START_TIMING );

//	scr_OpenMissionStateText(  0, "$TXHFS21202" );	//達成状況を更新：ミイラ 
	scr_OpenMissionConditionText(  0, "TXHFC03202" );	//ミイラをぶっころせ 


}
function miscb_TrapIn11101b()
{
	print( "In11101b!\n" );
	//ミイラ出現中に再びつり橋付近にトラップイン。メッセージとワープ 
	//メッセージ
	mis_MassageDialog( "C212_28" );
	mis_Warp( 11063.634766, -106.025642, -3773.557373, -97.0 );	//ワープ 
}
function mis_SpawnMummy01()
{
	print( "mummyZone01start!\n" );
	//ミイラ出現とカメラ操作 
	mis_SpawnMummy( 201, 10696.456055, 9.876427, -2783.638672, 0.0 );	//一体目 
	mis_SpawnMummy( 202, 9189.043945, 30.261307, -4292.390625, 0.0 );	//2体目 
//	mis_SpawnMummy( 203, 9806.758789, 11.152480, -5716.043945, 0.0 );	//3体目 
	mis_SpawnMummy( 204, 12306.189453, 13.227468, -5482.09472, 0.0 );	//4体目 
//	mis_SpawnMummy( 205, 12992.689453, 12.015456, -3504.48632, 0.0 );	//5体目 
}
function mis_SpawnMummy( regist_id, x, y, z, roty)
{
	//ミイラを出現させてトリガーon 
	if( scr_BotPlayerGetLife( regist_id ) == 0 )
	{
		scr_BotPlayerSetMapIconVisible( regist_id, true );
		scr_BotPlayerSpawnToWorld( regist_id,  x, y, z, roty );
		suspend();
		suspend();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( regist_id, true );
	}
}
function miscb_RestartMummyZone01()
{
	//ミイラ１途中で死亡したプレイヤーが再び蟻地獄１付近に来た。
	//再度中央へワープさせカウントリセットと共に死亡してたミイラを復活させる（メッセージで明示) 
	print( "restartMummy01!\n" );
	//メッセージと敵出現開始 

	//メッセージ
	mis_MassageDialog( "C212_09" );

	mis_Warp( 11063.634766, -106.025642, -3773.557373, -97.0 );	//ワープ 

	//敵出現とカメラムーブ 
	mis_SpawnMummy01();

	//メッセージ
	mis_MassageDialog( "C212_06" );
//	scr_OpenMissionStateText(  0, "$TXHFS21202" );	//達成状況を更新：ミイラ 
	scr_OpenMissionConditionText(  0, "TXHFC03202" );	//ミイラをぶっころせ 


	//ヒントをリセット 
	scr_RemoveCallbackFromId( 5 );
	scr_SetTimerCallback( "miscb_HintMassage01", 5, CB_TYPE_ONCE, 30.0 );	//時間で告知 
}
function miscb_HintMassage01()
{
	print( "hint01!\n" );
	//ミイラの倒し方バナー演出 
	//メッセージ
	mis_BannerInfoTimer("miscb_BunnerInfo0102",3.0);	//バナーを次のものに更新 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMC12071" );	//ふじみ？ 
}
function miscb_BunnerInfo0102()
{
	//バナーインフォメーション続き 
	print( "Bunner0102!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMC12072" );	// あるいは？ 
}
function miscb_TrapOut11103()
{
	print( "removeHintmassage!\n" );
	//ヒントのカウントを削除 
	scr_RemoveCallbackFromId( 5 );
}
function mis_KillAllMummy()
{
	//ミイラを全員殺したかをチェック 
	print( "killAllMum!\n" );
	if(scr_BotPlayerGetLife( 201 ) == 0 && scr_BotPlayerGetLife( 202 ) == 0   && scr_BotPlayerGetLife( 204 ) == 0  )
	{
		//もし全員殺して居たらメッセージの上ゾーン解放 
		gClearMummyZone01 = 2;	//クリアフラグを建てる 
		//誘導エフェクト（お化け側を削除）
		scr_RemoveScene( 7602, true );
		
		//フラグを削除 
		scr_RemoveStandbyEnemyCallback( 201 );
		scr_RemoveStandbyEnemyCallback( 202 );
//		scr_RemoveStandbyEnemyCallback( 203 );
		scr_RemoveStandbyEnemyCallback( 204 );
//		scr_RemoveStandbyEnemyCallback( 205 );

		scr_RemoveCallbackFromId( 5 );

		//メッセージ
		mis_MassageDialog( "C212_08" );

		scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
		scr_ResetGameCameraDirection( 7955.053711, -2494.441406, false );
		mis_CameraSet();

		//エフェクトとトラップ削除 
//		scr_RemoveScene( 901, false );
		scr_RemoveScene( 902, false );
		scr_RemoveScene( 1501, false );
		scr_RemoveScene( 1502, false );
		scr_RemoveTrap( 11101 );
		scr_RemoveCallbackFromName( "miscb_RestartMummyZone01" );
//		mis_RemoveEffect( 911, 8844.054688, 253.315918, -7539.941406, 27.0 )
		mis_RemoveEffect( 912, 7955.053711, 400.000000, -2494.441406, 115.0 )

//		scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
	scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


		mis_Wait(0.8);
		mis_MassageDialog( "C212_27" );

		//おばけゾーンを同時にクリア状態に 
		mis_SkipGhostZone01();
	}
}
function mis_SkipGhostZone01()
{
	//ミイラ１をクリアしたのでおばけ１もクリア済みに移行する 
	gClearGhostZone01 = 3;	//クリア進行状況をクリア済みに設定 
	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_WHITE );	//3番タワーを白に 

	//エフェクトとトラップ削除 
	scr_RemoveScene( 903, false );
	scr_RemoveScene( 1503, false );

	scr_RemoveTrap( 12101 );
	mis_RemoveEffect( 913, 5521.393066, -239.814850, 6441.430664, 27.0 )

	scr_RemoveTargetEnemyCallback( 401 );
	scr_RemoveStandbyEnemyCallback( 401 );
	scr_RemoveStandbyEnemyCallback( 301 );
	scr_RemoveStandbyEnemyCallback( 302 );
	scr_RemoveStandbyEnemyCallback( 303 );
	scr_RemoveStandbyEnemyCallback( 304 );
	scr_RemoveStandbyEnemyCallback( 305 );
	scr_RemoveStandbyEnemyCallback( 306 );
	scr_RemoveStandbyEnemyCallback( 307 );
	scr_RemoveStandbyEnemyCallback( 308 );
	scr_RemoveStandbyEnemyCallback( 309 );

	mis_KillAllGhost();	//すべてのお化けを殺害 
	scr_BotPlayerSetLife( 401, 0 );
	mis_Wait(4.0);	//リスポーン可能まで待つ 
	mis_GhostZoneGotoDeadPoint();	//おばけを見えない位置に飛ばす 
}
///↓ミイラの死亡監視 
function miscb_BotDead201()
{
	print( "dead201!\n" );
	mis_KillAllMummy();
}
function miscb_BotDead202()
{
	print( "dead202!\n" );
	mis_KillAllMummy();
}
function miscb_BotDead203()
{
	print( "dead203!\n" );
	mis_KillAllMummy();
}
function miscb_BotDead204()
{
	print( "dead204!\n" );
	mis_KillAllMummy();
}
function miscb_BotDead205()
{
	print( "dead205!\n" );
	mis_KillAllMummy();
}
function miscb_KillBot201()
{
	print( "kill201!\n" );
}
function miscb_KillBot202()
{
	print( "kill202!\n" );
}
function miscb_KillBot203()
{
	print( "kill203!\n" );
}
function miscb_KillBot204()
{
	print( "kill204!\n" );
}
function miscb_KillBot205()
{
	print( "kill205!\n" );
}
/////////////////////////
function mis_MummyZoneGotoDeadPoint()
{
	//クリアしたらミイラを見えない位置に 
	if(gClearMummyZone01 == 1 || gClearMummyZone02 == 1 )
	{
		scr_RemoveStandbyEnemyCallback( 201 );
		scr_RemoveStandbyEnemyCallback( 202 );
		scr_RemoveStandbyEnemyCallback( 203 );
		scr_RemoveStandbyEnemyCallback( 204 );
		scr_RemoveStandbyEnemyCallback( 205 );

		scr_BotPlayerSetLife( 201, 0 );
		scr_BotPlayerSetLife( 202, 0 );
		scr_BotPlayerSetLife( 203, 0 );
		scr_BotPlayerSetLife( 204, 0 );
		scr_BotPlayerSetLife( 205, 0 );
		mis_Wait(5.0);
		scr_BotPlayerSetMapIconVisible( 201, false );
		scr_BotPlayerSetMapIconVisible( 202, false );
		scr_BotPlayerSetMapIconVisible( 203, false );
		scr_BotPlayerSetMapIconVisible( 204, false );
		scr_BotPlayerSetMapIconVisible( 205, false );

		scr_BotPlayerSpawnToWorld( 201, -16221.938477, -2000.620903, 2540.641602, 0.0 );
		scr_BotPlayerSpawnToWorld( 202, -16221.938477, -2000.620903, 2540.641602, 0.0 );
		scr_BotPlayerSpawnToWorld( 203, -16221.938477, -2000.620903, 2540.641602, 0.0 );
		scr_BotPlayerSpawnToWorld( 204, -16221.938477, -2000.620903, 2540.641602, 0.0 );
		scr_BotPlayerSpawnToWorld( 205, -16221.938477, -2000.620903, 2540.641602, 0.0 );
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//おばけ出現１///////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
gClearGhostZone01 <- 0;	//0開始前　1途中（０wave)　2途中（クリアとクリアの間。リスポーンがオフ。チェック時に２なら１へ)　3クリア時 
function mis_CheckClearGhostZone01()
{
	//おばけ１進行状況チェック 
	print( "checkgho01!\n" );
	if(gClearGhostZone01 == 1 || gClearGhostZone01 == 2 )	//途中もしくは移行中の場合 
	{
	//死亡時にチェック 
	//メッセージ 
		gCountKill401 = 0;	//おばけ王殺害カウントをリセット 
		gClearGhostZone01 = 0;	//進行状況を開始前に 
//		scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
		scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


		//関連コールバックの削除 
		scr_RemoveCallbackFromId( 8 );	//2ndset 
		scr_RemoveCallbackFromId( 9 );	//3rdset 
		scr_RemoveTargetEnemyCallback( 401 );
		scr_RemoveStandbyEnemyCallback( 401 );
		scr_RemoveStandbyEnemyCallback( 301 );
		scr_RemoveStandbyEnemyCallback( 302 );
		scr_RemoveStandbyEnemyCallback( 303 );
		scr_RemoveStandbyEnemyCallback( 304 );
		scr_RemoveStandbyEnemyCallback( 305 );
		scr_RemoveStandbyEnemyCallback( 306 );
		scr_RemoveStandbyEnemyCallback( 307 );
		scr_RemoveStandbyEnemyCallback( 308 );
		scr_RemoveStandbyEnemyCallback( 309 );


		mis_Wait(1.0);	//一秒待つ 
		mis_MassageDialog( "C212_16" );

		//タワーの状態が白い場合黒へ 
		scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );	//3番タワー 

		mis_Wait(2.0);	//待つ 
		mis_KillAllGhost();	//すべてのお化けを殺害 
		scr_BotPlayerSetLife( 401, 0 );
		mis_Wait(4.0);	//リスポーン可能まで待つ 
		mis_GhostZoneGotoDeadPoint();	//おばけを見えない位置に飛ばす 
		mis_Wait(4.0);
		
		scr_RemoveCallbackFromId( 11203 );
		suspend();
		scr_SetTrapInCallback( "miscb_TrapIn12103", 12103, CB_TYPE_ONCE, 12103 );	//ｐ化け１の再開トラップＣＢをセット 
	}
}
function mis_ResetGhostZone01()
{
	//ボットの死亡監視をセットし、イベント進行可能に 
	scr_AddStandbyEnemyCallback( "miscb_BotDead401", 401, STANDBY_COUNT_START_TIMING );
	scr_AddTargetEnemyCallback( "miscb_KillBot401", 401, "TARGET" );

	scr_AddStandbyEnemyCallback( "miscb_BotDead301", 301, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead302", 302, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead303", 303, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead304", 304, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead305", 305, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead306", 306, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead307", 307, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead308", 308, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead309", 309, STANDBY_COUNT_START_TIMING );
}
function miscb_TrapIn12101()
{
	print( "in12101!\n" );
	//橋にさしかかった時。メッセージあってから開始 
	gClearGhostZone01 = 1;

	//メッセージ 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C212_04" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	//タワーの状態が白い場合黒へ 
	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );

	mis_BigWarp( 6343.7, -287.3, 7354.8, 0.0,   8101.1, -11.8, 6141.0, 25.0 );

//	mis_Warp(  8101.167480, -11.870073, 6141.099609, 25.0 );	//ワープ 
	mis_SetKeepOutEffect( 903, 5521.393066, -189.814850, 6441.430664, 27.0  );	//行きどまり

	//邪悪な力でどこかに飛ばされた 
	mis_MassageDialog( "C321_06" );

	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSetMapIconVisible( 401, true );
	scr_BotPlayerSpawnToWorld( 401, 10080.541016, -310.785736, 9921.041016, -152.0 );
	scr_AddStandbyEnemyCallback( "miscb_BotDead401", 401, STANDBY_COUNT_START_TIMING );
	scr_AddTargetEnemyCallback( "miscb_KillBot401", 401, "TARGET" );

	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );

	mis_Wait( 0.4 );

	//メッセージ 
	mis_MassageDialog( "C212_10" );

	scr_BotPlayerSetMapIconVisible( 301, true );
	scr_BotPlayerSetMapIconVisible( 304, true );
	scr_BotPlayerSetMapIconVisible( 305, true );


	scr_BotPlayerSpawnToWorld( 301,  8524.683594, -188.734299, 7941.33496, -152.0 );
	scr_BotPlayerSpawnToWorld( 304,  9312.593750, -56.053619, 9472.558594, -152.0 );
	scr_BotPlayerSpawnToWorld( 305,  8835.383789, -96.660164, 10268.59863, -152.0 );
	mis_Wait( 0.4 );
	scr_BotPlayerSetActionTrigger( 304, true );
	scr_BotPlayerSetActionTrigger( 305, true );

	scr_BotPlayerSetMapIconVisible( 306, true );
	scr_BotPlayerSetMapIconVisible( 309, true );


	scr_BotPlayerSpawnToWorld( 306, 9242.816406, -50.903744, 7406.530762, -152.0 );
	scr_BotPlayerSpawnToWorld( 309, 10822.913086, -310.253906, 9253.49414, -152.0 );
	mis_Wait( 0.4 );
	scr_BotPlayerSetActionTrigger( 306, true );
	scr_BotPlayerSetActionTrigger( 309, true );

	scr_AddStandbyEnemyCallback( "miscb_BotDead301", 301, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead302", 302, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead303", 303, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead304", 304, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead305", 305, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead306", 306, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead307", 307, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead308", 308, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead309", 309, STANDBY_CAN_RESPAWN_TIMING );

	//メッセージ 
	mis_MassageDialog( "C212_30" );
	
	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );

//	scr_OpenMissionStateText(  0, "$TXHFS21203" );	//達成状況を更新：おばけ 
	scr_OpenMissionConditionText(  0, "TXHFC03203" );	//おばけぶっころせ 


}
function mis_SetGhost1stWave()
{
	//1度失敗してからの2回目以降の最初のセットアップ 
	print( "miscb_SetGhost1stWave!\n" );
	gClearGhostZone01 = 1;

	//メッセージ※2回目以降 
	mis_MassageDialog( "C212_17" );
	
	//タワーの状態が白い場合黒へ 
	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );	//3番タワー 

	mis_Warp(  8101.167480, -11.870073, 6141.099609, 25.0 );	//ワープ 

	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSetMapIconVisible( 401, true );
	scr_BotPlayerSpawnToWorld( 401, 10080.541016, -310.785736, 9921.041016, -152.0 );
	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );

	mis_Wait( 0.4 );
	mis_SetUpGhostReapawn(  301,  8524.683594, -188.734299, 7941.33496, -152.0  );
//	mis_SetUpGhostReapawn(  302,  7529.367676, -117.395302, 8411.90332, -152.0  );
//	mis_SetUpGhostReapawn(  303,  8545.242188, -193.200302, 8975.70117, -152.0  );
	mis_SetUpGhostReapawn(  304,  9312.593750, -56.053619, 9472.558594, -152.0  );
	mis_SetUpGhostReapawn(  305,  8835.383789, -96.660164, 10268.59863, -152.0  );
	mis_Wait( 0.2 );
	mis_SetUpGhostReapawn( 306, 9242.816406, -50.903744, 7406.530762, -152.0  );
//	mis_SetUpGhostReapawn( 307, 9972.809570, -180.898590, 6333.837402, -152.0  );
//	mis_SetUpGhostReapawn( 308, 10783.459961, -105.432961, 7609.47168, -152.0  );
	mis_SetUpGhostReapawn( 309, 10822.913086, -310.253906, 9253.49414, -152.0  );
	mis_Wait( 0.4 );

	//メッセージ 
	mis_MassageDialog( "C212_30" );

	mis_ResetGhostZone01();	//コールバックの復活 

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );

//	scr_OpenMissionStateText(  0, "$TXHFS21203" );	//達成状況を更新：おばけ 
	scr_OpenMissionConditionText(  0, "TXHFC03203" );	//おばけぶっころせ 


}
function miscb_SetGhost2ndWave()
{
	//1回ゴー金倒して2戦目セットアップ 
//	print( "miscb_SetGhost2ndWave!\n" );
//	gClearGhostZone01 = 1;
//	scr_BotPlayerSetRespawnEnable( 101, false );	//仲間のリスポーンを禁じる。 
//	scr_BotPlayerSetRespawnEnable( 102, false );
//	scr_BotPlayerSetRespawnEnable( 103, false );
//
//	//メッセージ※ 
//	mis_MassageDialog( "C212_12" );
//
//	mis_Warp(  8071.041992, -202.377258, 10356.734375, 130.0 );	//ワープ 
//	scr_SetInputDisable( SCR_INPUT_MOVE );
//	scr_SetInputDisable( SCR_INPUT_CAMERA );
//	scr_SetInputDisable( SCR_INPUT_BUTTON );
//
//	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
//	mis_Wait( 0.2 );
//
//	//ゴー金召喚 
//	scr_BotPlayerSpawnToWorld( 401, 11700.390625, -109.359406, 6851.424805, -45.0 );
//
//	suspend();
//	scr_BotPlayerSetActionTrigger( 401, true );
//
//	mis_Wait( 0.4 );
//	mis_SetUpGhostReapawn(  301,  8120.629395, -107.488350, 8519.6083, -45.0  );
//	mis_SetUpGhostReapawn(  302,  8318.245117, -150.450058, 7651.7475, -45.0  );
//	mis_SetUpGhostReapawn(  303,  8994.533203, -101.607613, 6988.6093, -45.0  );
//	mis_SetUpGhostReapawn(  304,  9844.098633, -189.594620, 6492.2221, -45.0  );
//	mis_SetUpGhostReapawn(  305,  10684.855469, 2.026405, 6376.102051, -45.0  );
//	mis_Wait( 0.2 );
//	mis_SetUpGhostReapawn(  306, 9664.787109, -215.379440, 9999.341797, -45.0  );
//	mis_SetUpGhostReapawn(  307, 11119.425781, -310.244080, 9093.57812, -45.0  );
//	mis_SetUpGhostReapawn(  308, 10693.331055, -110.050064, 7600.05371, -45.0  );
//	mis_SetUpGhostReapawn(  309, 11874.958008, -112.739090, 7949.26953, -45.0  );
//	mis_Wait( 0.4 );
//
//	scr_SetInputEnable( SCR_INPUT_MOVE );
//	scr_SetInputEnable( SCR_INPUT_CAMERA );
//	scr_SetInputEnable( SCR_INPUT_BUTTON );
}
function miscb_SetGhost3rdWave()
{
	//２戦目終了して3戦目開始 
	print( "miscb_SetGhost3rdWave!\n" );
	gClearGhostZone01 = 1;

	//メッセージ※ 
	mis_MassageDialog( "C212_14" );

//	mis_Warp(  11025.994141, -19.975473, 6429.573242, -69.0 );	//ワープ 
	mis_Warp(  9311.736328, -54.328903, 9568.214844, -128.0 );	//ワープ 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSpawnToWorld( 401, 6471.685059, -288.019287, 8193.853516, 112.0 );

	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );

	scr_BotPlayerSetMapIconVisible( 301, false );
	scr_BotPlayerSetMapIconVisible( 305, false );
	suspend();
	scr_BotPlayerSpawnToWorld( 301,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 305,  49845.938477, -2552.620903, 7915.641602, 0.0 );


	mis_Wait( 0.4 );
//	mis_SetUpGhostReapawn(  301,  9366.799805, -186.290268, 6619.01123, 112.0 );
//	mis_SetUpGhostReapawn(  302,  10140.929688, -237.728439, 8607.6015, 112.0 );
	mis_SetUpGhostReapawn(  303,  8933.499023, -229.225937, 8053.48193, 112.0 );
//	mis_SetUpGhostReapawn(  304,  8230.642578, -237.058746, 6874.05761, 112.0 );
	mis_SetUpGhostReapawn(  304,  7798.478027, -213.598450, 9701.82324, 112.0 );
//	mis_SetUpGhostReapawn(  305,  9018.236328, -64.457321, 9508.125000, 112.0 );
	mis_Wait( 0.2 );

	mis_SetUpGhostReapawn(  306, 7339.334961, -284.259277, 6731.59277, 112.0 );
	mis_SetUpGhostReapawn(  307, 7964.596191, -97.848999, 7726.864258, 112.0 );
	mis_SetUpGhostReapawn(  308, 7465.936035, -130.348740, 8536.55566, 112.0 );
	mis_SetUpGhostReapawn(  309, 6891.687500, -256.528320, 9336.26269, 112.0 );
	mis_Wait( 0.4 );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
}
function mis_SetUpGhostReapawn( regist_id, x, y, z, roty )
{
	//おばけが死んだらスポーン位置にリスポーンする 
	print( "respawnghost!\n" );
	if(gClearGhostZone01 == 1 || gClearGhostZone02 == 1)
	{
		if(scr_BotPlayerGetLife( regist_id ) == 0 )
		{
			scr_BotPlayerSetMapIconVisible( regist_id, true );
			scr_BotPlayerSpawnToWorld( regist_id,  x, y, z, roty );
			suspend();
			suspend();
			suspend();
			suspend();
			suspend();
			suspend();
			suspend();
			suspend();
			scr_BotPlayerSetActionTrigger( regist_id, true );
		}
	}
}
//↓おばけの出現位置設定 
function mis_GhostZone01FirstRespawnSet()
{
	print( "respawnghost1stwave!\n" );
	mis_SetUpGhostReapawn( 301, 8524.683594, -188.734299, 7941.33496, -152.0 );
//	mis_SetUpGhostReapawn( 302, 7529.367676, -117.395302, 8411.90332, -152.0 );
//	mis_SetUpGhostReapawn( 303, 8545.242188, -193.200302, 8975.70117, -152.0 );
	mis_SetUpGhostReapawn( 304, 9312.593750, -56.053619, 9472.558594, -152.0 );
	mis_SetUpGhostReapawn( 305, 8835.383789, -96.660164, 10268.59863, -152.0 );
	mis_SetUpGhostReapawn( 306, 9242.816406, -50.903744, 7406.530762, -152.0 );
//	mis_SetUpGhostReapawn( 307, 9972.809570, -180.898590, 6333.837402, -152.0 );
//	mis_SetUpGhostReapawn( 308, 10783.459961, -105.432961, 7609.47168, -152.0 );
	mis_SetUpGhostReapawn( 309, 10822.913086, -310.253906, 9253.49414, -152.0 );
}
function mis_GhostZone01SecondRespawnSet()
{
	print( "respawnghost2ndwave!\n" );
//	mis_SetUpGhostReapawn( 301, 8120.629395, -107.488350, 8519.6083, -45.0 );
//	mis_SetUpGhostReapawn( 302, 8318.245117, -150.450058, 7651.7475, -45.0 );
//	mis_SetUpGhostReapawn( 303, 8994.533203, -101.607613, 6988.6093, -45.0 );
//	mis_SetUpGhostReapawn( 304, 9844.098633, -189.594620, 6492.2221, -45.0 );
//	mis_SetUpGhostReapawn( 305, 10684.855469, 2.026405, 6376.102051, -45.0 );
//	mis_SetUpGhostReapawn( 306, 9664.787109, -215.379440, 9999.341797, -45.0 );
//	mis_SetUpGhostReapawn( 307, 11119.425781, -310.244080, 9093.57812, -45.0 );
//	mis_SetUpGhostReapawn( 308, 10693.331055, -110.050064, 7600.05371, -45.0 );
//	mis_SetUpGhostReapawn( 309, 11874.958008, -112.739090, 7949.26953, -45.0 );
}
function mis_GhostZone01ThirdRespawnSet()
{
	print( "respawnghost3rdwave!\n" );
//	mis_SetUpGhostReapawn( 301, 9366.799805, -186.290268, 6619.01123, 112.0 );
//	mis_SetUpGhostReapawn( 302, 10140.929688, -237.728439, 8607.6015, 112.0 );
	mis_SetUpGhostReapawn( 303, 8933.499023, -229.225937, 8053.48193, 112.0 );
//	mis_SetUpGhostReapawn( 304, 8230.642578, -237.058746, 6874.05761, 112.0 );
	mis_SetUpGhostReapawn( 304, 7798.478027, -213.598450, 9701.82324, 112.0 );
//	mis_SetUpGhostReapawn( 305, 9018.236328, -64.457321, 9508.125000, 112.0 );
	mis_SetUpGhostReapawn( 306, 7339.334961, -284.259277, 6731.59277, 112.0 );
	mis_SetUpGhostReapawn( 307, 7964.596191, -97.848999, 7726.864258, 112.0 );
	mis_SetUpGhostReapawn( 308, 7465.936035, -130.348740, 8536.55566, 112.0 );
	mis_SetUpGhostReapawn( 309, 6891.687500, -256.528320, 9336.26269, 112.0 );
}
////////////////////////////
function mis_GhostZoneGotoDeadPoint()
{
	//見えないところに死体を飛ばす 
	print( "fareway!\n" );
	scr_BotPlayerSetMapIconVisible( 301, false );
	scr_BotPlayerSetMapIconVisible( 302, false );
	scr_BotPlayerSetMapIconVisible( 303, false );
	scr_BotPlayerSetMapIconVisible( 304, false );
	scr_BotPlayerSetMapIconVisible( 305, false );
	scr_BotPlayerSetMapIconVisible( 306, false );
	scr_BotPlayerSetMapIconVisible( 307, false );
	scr_BotPlayerSetMapIconVisible( 308, false );
	scr_BotPlayerSetMapIconVisible( 309, false );
	scr_BotPlayerSetMapIconVisible( 401, false );
	
	scr_BotPlayerSpawnToWorld( 301,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 302,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 303,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 304,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 305,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 306,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 307,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 308,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 309,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 401,  49845.938477, -2552.620903, 7915.641602, 0.0 );
}
function miscb_KillBot401()
{
	//ゴー金を倒した 
	print( "kill401!\n" );
	gClearGhostZone01 = 2;	//クリア進行状況を行こう中に設定 
	mis_KillAllGhost();	//すべてのお化けを殺害 
}
function mis_KillAllGhost()
{
	print( "killAllghost!\n" );
	scr_BotPlayerSetLife( 301, 0 );
	scr_BotPlayerSetLife( 302, 0 );
	scr_BotPlayerSetLife( 303, 0 );
	scr_BotPlayerSetLife( 304, 0 );
	scr_BotPlayerSetLife( 305, 0 );
	scr_BotPlayerSetLife( 306, 0 );
	scr_BotPlayerSetLife( 307, 0 );
	scr_BotPlayerSetLife( 308, 0 );
	scr_BotPlayerSetLife( 309, 0 );
}
gCountKill401 <- 0;	//おばけ王殺害回数 
function miscb_BotDead401()
{
	print( "dead401!\n" );
	//おばけ王死亡。次へ移行する。 
	gCountKill401 = (gCountKill401 + 1);	//殺害回数をセット 
	mis_KillAllGhost();	//すべてのお化けを殺害 

	if(gClearGhostZone01 == 1 || gClearGhostZone01 == 2 )	//途中もしくは移行中の場合 
	{
		if(gCountKill401 == 1)	//2回戦へ移行 
		{
			//メッセージ 
			mis_MassageDialog( "C212_11" );	
//			scr_SetTimerCallback( "miscb_SetGhost2ndWave", 8, CB_TYPE_ONCE, 3.1 );	//3秒後に2nd開始 
			scr_SetTimerCallback( "miscb_SetGhost3rdWave", 9, CB_TYPE_ONCE, 3.5 );	//3秒後に3rd開始 
		}
//		if(gCountKill401 == 2)	//3回戦へ移行 
//		{
//			//メッセージ 
//			mis_MassageDialog( "C212_13" );	
//			scr_SetTimerCallback( "miscb_SetGhost3rdWave", 9, CB_TYPE_ONCE, 3.1 );	//3秒後に3rd開始 
//		}
		if(gCountKill401 == 2)	//終わり 
		{
			//メッセージ 
			mis_MassageDialog( "C212_15" );	
			gClearGhostZone01 = 3;	//クリア進行状況をクリア済みに設定 
			//エフェクト消去イベント 
			scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
			scr_ResetGameCameraDirection( 5521.393066,  6441.430664, false );
			mis_CameraSet();
			scr_SetTimerCallback( "mis_GhostZoneGotoDeadPoint", 10, CB_TYPE_ONCE, 8.0 );	//見えない位置に移動タイマー 

			//誘導エフェクト(ミイラ側を削除）
			scr_RemoveScene( 7601, true );


			//関連コールバックの削除 
			scr_RemoveCallbackFromId( 8 );	//2ndset 
			scr_RemoveCallbackFromId( 9 );	//3rdset 
			scr_RemoveTargetEnemyCallback( 401 );
			scr_RemoveStandbyEnemyCallback( 401 );
			scr_RemoveStandbyEnemyCallback( 301 );
			scr_RemoveStandbyEnemyCallback( 302 );
			scr_RemoveStandbyEnemyCallback( 303 );
			scr_RemoveStandbyEnemyCallback( 304 );
			scr_RemoveStandbyEnemyCallback( 305 );
			scr_RemoveStandbyEnemyCallback( 306 );
			scr_RemoveStandbyEnemyCallback( 307 );
			scr_RemoveStandbyEnemyCallback( 308 );
			scr_RemoveStandbyEnemyCallback( 309 );

			//エフェクトとトラップ削除 
			scr_RemoveScene( 903, false );
			scr_RemoveScene( 1503, false );
			scr_RemoveTrap( 12101 );
			mis_RemoveEffect( 913, 5521.393066, -239.814850, 6441.430664, 27.0 )

			mis_Wait(0.8);
			mis_MassageDialog( "C212_27" );

			scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
			scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


			//ミイラゾーンを同時にクリア状態に 
			mis_SkipMummyZone01();
		}
	}
}
function mis_SkipMummyZone01()
{
	//おばけ１をクリアしたのでミイラ１もクリア状態に移行 
	mis_MummyZoneGotoDeadPoint();	//生きてるミイラを削除 
	gClearMummyZone01 = 2;
	scr_RemoveCallbackFromName( "miscb_RestartMummyZone01" );	//リスタート設定を削除 
//	scr_RemoveScene( 901, false );	//エフェクトとトラップ削除 
	scr_RemoveScene( 902, false );
	scr_RemoveScene( 1501, false );	//エフェクトとトラップ削除 
	scr_RemoveScene( 1502, false );

	scr_RemoveTrap( 11101 );
	scr_RemoveCallbackFromName( "miscb_RestartMummyZone01" );
//	mis_RemoveEffect( 911, 8844.054688, 253.315918, -7539.941406, 27.0 )
	mis_RemoveEffect( 912, 7955.053711, 400.000000, -2494.441406, 115.0 )
}
function mis_GhostZone01RespawnSet()
{
	//おばけのリスポーン位置を進行状況に合わせて設定 
	if(gCountKill401 == 0)	//1stwave中 
	{
		mis_GhostZone01FirstRespawnSet();
	}
	if(gCountKill401 == 1)	//2ndwave中 
	{
		mis_GhostZone01SecondRespawnSet();
	}
	if(gCountKill401 == 2)	//3rdwave中 
	{
		mis_GhostZone01ThirdRespawnSet();
	}
}
//↓おばけの殺害監視 
function miscb_BotDead301()
{
	print( "kill301!\n" );
	//おばけ死亡時のリスポーン。zone1と２で分ける。 
	mis_GhostZone01RespawnSet();
}
function miscb_BotDead302()
{
	print( "kill302!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead303()
{
	print( "kill303!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead304()
{
	print( "kill304!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead305()
{
	print( "kill305!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead306()
{
	print( "kill306!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead307()
{
	print( "kill307!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead308()
{
	print( "kill308!\n" );
	mis_GhostZone01RespawnSet();

}
function miscb_BotDead309()
{
	print( "kill309!\n" );
	mis_GhostZone01RespawnSet();

}
////////////////////////
function miscb_TrapIn12102()
{
	print( "in12102!\n" );
	//開始トラップの奥の行き止まりトラップ。場合分け。 
	if(gClearGhostZone01 == 1 || gClearGhostZone01 == 2 )	//途中もしくは移行中の場合ワープさせる 
	{
		mis_MassageDialog( "C212_28" );
		mis_Warp( 6826.965820, -264.779053, 7592.624023, 50.0 );	//ワープ 
	}
	if(gClearGhostZone01 == 0 )	//初期化状態なので最初から行う。1stのリスタートへ 
	{
		mis_SetGhost1stWave();
	}
	if(gClearGhostZone01 == 3 )	//クリア済み。このトラップを消去 
	{
		scr_RemoveTrap( 12102 );
	}
}
function miscb_TrapIn12103()
{
	print( "in12103!\n" );
	//おばけ1の1回失敗した後の2週目以降の再開トラップ 
	if(gClearGhostZone01 == 0 )	//初期化状態なので最初から行う。1stのリスタートへ 
	{
		mis_SetGhost1stWave();
	}
	if(gClearGhostZone01 == 3 )	//クリア済み。このトラップを消去 
	{
		scr_RemoveTrap( 12103 );
	}
}
///////////////////////////////////////////////
//中央防衛 ////////////////////////////////////
///////////////////////////////////////////////
function miscb_TrapIn13201()
{
	print( "in13201!\n" );
	//中央浮島に到達。メッセージと共に敵出現 

	mis_SetKeepOutEffect( 904, -5978.005859, -241.102966, -3438.3413, 115.0 );	//行きどまり
	mis_SetKeepOutEffect( 905, -5184.603516, 453.059875, 2350.948730, 115.0 );	//行きどまり

	//メッセージ※ 
	mis_MassageDialog( "C212_18" );

	//敵出現 
	//ミイラ僧侶 
	scr_BotPlayerSpawnToWorld( 206,  -814.702454, -409.562897, 513.188110, -149.0 );
	mis_Wait(0.2);
	scr_BotPlayerSpawnToWorld( 207,  103.202545, -212.753387, 875.870605, -85.0 );
	mis_Wait(0.2);
	scr_BotPlayerSpawnToWorld( 208,  732.453857, -3.745044, 185.727325, -17.0 );
	mis_Wait(0.2);
	scr_BotPlayerSpawnToWorld( 209,  -80.634438, 325.966919, -536.226074, 103.0 );
	mis_Wait(0.2);
	scr_BotPlayerSpawnToWorld( 210,  -9.164841, 568.867554, 292.286865, -90.0 );
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );
	scr_BotPlayerSetActionTrigger( 208, true );
	scr_BotPlayerSetActionTrigger( 209, true );
	scr_BotPlayerSetActionTrigger( 210, true );
	//敵出現おばけ魔導 
	scr_BotPlayerSetMapIconVisible( 306, true );
	scr_BotPlayerSetMapIconVisible( 307, true );
	scr_BotPlayerSetMapIconVisible( 308, true );
	scr_BotPlayerSetMapIconVisible( 309, true );
	
	scr_BotPlayerSpawnToWorld( 306,   741.280762, 550.000000, 2024.124878, -159.0 );
	scr_BotPlayerSpawnToWorld( 307,   -769.292358, 99.846581, 1930.963379, 156.0 );
	scr_BotPlayerSpawnToWorld( 308,   1141.788818, 500.000000, -1930.251831, -32.0 );
	scr_BotPlayerSpawnToWorld( 309,   784.164063, 500.000000, -2042.996704, -23.0 );
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 306, true );
	scr_BotPlayerSetActionTrigger( 307, true );
	scr_BotPlayerSetActionTrigger( 308, true );
	scr_BotPlayerSetActionTrigger( 309, true );

	//モニュメントを壊したらメッセージと共に敵を殺す 
	scr_SetBreakMonumentCallback( "miscb_BreakTower02", 11, CB_TYPE_ONCE, "gfmo_002" );

	scr_CreateSceneEffect( 999, "Ccam02c", -74.997192, 1400.036987, 5.902091, -111.0 );	//↓ 
//	scr_OpenMissionStateText(  0, "$TXHFS21204" );	//達成状況を更新：中央 
	scr_OpenMissionConditionText(  0, "TXHFC03204" );	//達成状況を表示:敵の城へ向かえ 

	
}
function miscb_BreakTower02()
{
	//中央タワーを破壊 
	print( "inbreak01!\n" );
	scr_RemoveScene( 999, true );

	scr_BotPlayerSetLife( 206, 0 );
	scr_BotPlayerSetLife( 207, 0 );
	scr_BotPlayerSetLife( 208, 0 );
	scr_BotPlayerSetLife( 209, 0 );
	scr_BotPlayerSetLife( 210, 0 );
	scr_BotPlayerSetLife( 306, 0 );
	scr_BotPlayerSetLife( 307, 0 );
	scr_BotPlayerSetLife( 308, 0 );
	scr_BotPlayerSetLife( 309, 0 );

	mis_Wait(1.0);
	
	mis_MassageDialog( "C212_27" );

	//エフェクト消滅イベント 
//	scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
	scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	scr_ResetGameCameraDirection( -13706.970703,  1980.668213, false );
	scr_RemoveScene( 904, false );
	scr_RemoveScene( 905, false );
	scr_RemoveScene( 1504, false );
	scr_RemoveScene( 1505, false );
	suspend();
	mis_RemoveEffect( 914, -5978.005859, -291.102966, -3438.3413, 115.0 )
	mis_RemoveEffect( 915, -5184.603516, 403.059875, 2350.948730, 115.0 )
	//トラップ消去 
	scr_RemoveTrap( 13202 );
	scr_RemoveTrap( 13203 );
	mis_CameraSet();

	mis_Wait(4.0);
	scr_BotPlayerSetMapIconVisible( 206, false );
	scr_BotPlayerSetMapIconVisible( 207, false );
	scr_BotPlayerSetMapIconVisible( 208, false );
	scr_BotPlayerSetMapIconVisible( 209, false );
	scr_BotPlayerSetMapIconVisible( 210, false );
	scr_BotPlayerSetMapIconVisible( 306, false );
	scr_BotPlayerSetMapIconVisible( 307, false );
	scr_BotPlayerSetMapIconVisible( 308, false );
	scr_BotPlayerSetMapIconVisible( 309, false );
	
	scr_BotPlayerSpawnToWorld( 206,  -16221.938477, -800.620903, 2540.641602, 0.0 );	//見えない位置へ 
	scr_BotPlayerSpawnToWorld( 207,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 208,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 209,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 210,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 306,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 307,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 308,  -16221.938477, -800.620903, 2540.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 309,  -16221.938477, -800.620903, 2540.641602, 0.0 );

}
function miscb_TrapIn13202()
{
	//中央からの行き止まりトラップ（大橋 
	print( "in13202!\n" );
	//メッセージ
	mis_MassageDialog( "C212_28" );
	mis_Warp( -5088.628906, -455.924622, -2387.012207, 51.0 );	//ワープ 
}
function miscb_TrapIn13203()
{
	//中央からの行き止まりトラップ（吊り橋 
	print( "in13203!\n" );
	//メッセージ
	mis_MassageDialog( "C212_28" );
	mis_Warp( -4242.349609, 400.000000, 2161.147461, 99.0 );	//ワープ 
}
/////////////////////////////////////////////////////////////////////////////////////////////////
//ミイラ出現２///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
gClearMummyZone02 <- 0;	//0開始前　1途中　2クリア 
function mis_CheckClearMummyZone02()
{
	//おばけ２の進行状況チェック 
	print( "checkmum02!\n" );
	if(gClearMummyZone02 == 1)
	{
		//ミイラ出現後、クリア前 
		//ヒントのカウントをリセット 
		scr_RemoveCallbackFromId( 5 );
		//再開のトラップを引く 
		scr_RemoveCallbackFromId( 11201 );
		scr_SetTrapInCallback( "miscb_RestartMummyZone02", 11201, CB_TYPE_ONCE, 11201 );	//ミイラゾーン2開始トラップ
//		scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
		scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 

	}
}
function miscb_TrapIn11201()
{
	print( "In11201!\n" );
	//蟻地獄2の橋付近に到達。ミイラゾーン開始 
	gClearMummyZone02 = 1;	//開始フラグを建てる 

	//メッセージ 
	mis_MassageDialog( "C212_19" );

	mis_Warp( -9686.828125, 126.170303, 6789.653809, -59.0 );	//ワープ 
	
	mis_SetKeepOutEffect( 921, -12517.038086, 50.000000, 4129.511719, 27.0  );	//行きどまり
	mis_SetKeepOutEffect( 922, -11795.563477, 50.476391, 3621.425781, 115.0 );	//行きどまり
	mis_SetKeepOutEffect( 923, -11130.300781, 50.180916, 3243.699707, 115.0 );	//行きどまり

	//メッセージと敵出現開始 
	//敵出現とカメラムーブ 
	mis_SpawnMummy02();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C321_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	suspend();
	suspend();
	scr_OpenDialog( 0, "C212_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

//	scr_OpenMissionStateText(  0, "$TXHFS21202" );	//達成状況を更新：ミイラ 
	scr_OpenMissionConditionText(  0, "TXHFC03202" );	//ミイラをぶっころせ 


	//ミイラの倒し方を教えるメッセージ用のコールバックをセット 
	scr_SetTimerCallback( "miscb_HintMassage01", 5, CB_TYPE_ONCE, 20.0 );	//時間で告知 
	scr_AddStandbyEnemyCallback( "miscb_BotDead201_02", 201, STANDBY_COUNT_START_TIMING );	//死亡させたらカウントをリセット。
	scr_AddStandbyEnemyCallback( "miscb_BotDead202_02", 202, STANDBY_COUNT_START_TIMING );	//全員を倒したら進む 
	scr_AddStandbyEnemyCallback( "miscb_BotDead203_02", 203, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead204_02", 204, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead205_02", 205, STANDBY_COUNT_START_TIMING );
}
function miscb_TrapIn11202()
{
	print( "In11202b!\n" );
	//ミイラ出現中にトラップイン。メッセージとワープ 
	//メッセージ
	mis_MassageDialog( "C212_28" );
	mis_Warp(  -12406.500000, 18.141487, 4950.863281, 40.0 );	//ワープ 
}
function miscb_RestartMummyZone02()
{
	//ミイラ１途中で死亡したプレイヤーが再び蟻地獄１付近に来た。
	//再度中央へワープさせカウントリセットと共に死亡してたミイラを復活させる（メッセージで明示) 
	print( "restartMummy02!\n" );
	//メッセージと敵出現開始 

	//メッセージ
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C212_09" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	
	mis_Warp(  -9686.828125, 126.170303, 6789.653809, -59.0 );	//ワープ 

	//敵出現とカメラムーブ 
	mis_SpawnMummy02();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C212_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

//	scr_OpenMissionStateText(  0, "$TXHFS21202" );	//達成状況を更新：ミイラ 
	scr_OpenMissionConditionText(  0, "TXHFC03202" );	//ミイラをぶっころせ 

	//ヒントをリセット 
	scr_RemoveCallbackFromId( 5 );
	scr_SetTimerCallback( "miscb_HintMassage01", 5, CB_TYPE_ONCE, 30.0 );	//時間で告知 
}
function mis_SpawnMummy02()
{
	print( "mummyZone02start!\n" );
	//ミイラ出現とカメラ操作 
	mis_SpawnMummy( 201, -10235.028320, 13.030673, 8058.882813, 0.0 );	//一体目 
	mis_SpawnMummy( 202, -11232.968750, 12.035982, 6293.446289, 0.0 );	//2体目 
	mis_SpawnMummy( 203, -9429.203125, 9.637215, 5080.861328, 0.0 );	//3体目 
	mis_SpawnMummy( 204, -7648.885742, 34.297489, 6313.074707, 0.0 );	//4体目 
	mis_SpawnMummy( 205, -7804.375977, 13.795551, 7709.039063, 0.0 );	//5体目 
}
//↓ミイラの死亡監視 
function miscb_BotDead201_02()
{
	print( "dead201!\n" );
	mis_KillAllMummy02();
}
function miscb_BotDead202_02()
{
	print( "dead202!\n" );
	mis_KillAllMummy02();
}
function miscb_BotDead203_02()
{
	print( "dead203!\n" );
	mis_KillAllMummy02();
}
function miscb_BotDead204_02()
{
	print( "dead204!\n" );
	mis_KillAllMummy02();
}
function miscb_BotDead205_02()
{
	print( "dead205!\n" );
	mis_KillAllMummy02();
}
//////////////////////////
function mis_KillAllMummy02()
{
	print( "killAllMum!\n" );
	//ミイラを全員殺したかチェック 
	if(scr_BotPlayerGetLife( 201 ) == 0 && scr_BotPlayerGetLife( 202 ) == 0  &&  scr_BotPlayerGetLife( 203 ) == 0  && scr_BotPlayerGetLife( 204 ) == 0  &&  scr_BotPlayerGetLife( 205 ) == 0  )
	{
		//もし全員殺して居たらメッセージの上ゾーン解放 
		gClearMummyZone02 = 2;	//クリアフラグを建てる 
		//フラグを削除 
		scr_RemoveStandbyEnemyCallback( 201 );
		scr_RemoveStandbyEnemyCallback( 202 );
		scr_RemoveStandbyEnemyCallback( 203 );
		scr_RemoveStandbyEnemyCallback( 204 );
		scr_RemoveStandbyEnemyCallback( 205 );
		scr_RemoveCallbackFromId( 5 );
		//メッセージ
		mis_MassageDialog( "C212_20" );

		scr_ResetGameCameraDirection( -12007.507813, 3751.413330, false );
		mis_CameraSet();
		//エフェクトとトラップ削除 
		scr_RemoveScene( 921, false );
		scr_RemoveScene( 922, false );
		scr_RemoveScene( 923, false );
		scr_RemoveScene( 1521, false );
		scr_RemoveScene( 1522, false );
		scr_RemoveScene( 1523, false );

		scr_RemoveTrap( 11201 );
		scr_RemoveTrap( 11202 );
		mis_RemoveEffect( 931, -12517.038086, 0.000000, 4129.511719, 27.0  )
		mis_RemoveEffect( 932, -11947.662109, 1.311306, 3765.856445, 115.0 )
		mis_RemoveEffect( 933, -11130.300781, 0.180916, 3243.699707, 115.0 )

		//メッセージ
		mis_MassageDialog( "C212_27" );
//		scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
		scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


		//おばけゾーンを同時にクリア状態に 
		mis_SkipGhostZone02();
	}
}
function mis_SkipGhostZone02()
{
	//ミイラ２をクリアしたのでおばけ２もクリア状態に移行 
	gClearGhostZone02 = 3;	//クリア進行状況をクリア済みに設定 
	scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_WHITE );	//1番タワーを白に 
	//エフェクトとトラップ削除 
	scr_RemoveScene( 924, false );
	scr_RemoveScene( 925, false );
	scr_RemoveScene( 926, false );
	scr_RemoveScene( 1524, false );
	scr_RemoveScene( 1525, false );
	scr_RemoveScene( 1526, false );
	scr_RemoveTrap( 12201 );
//	scr_RemoveTrap( 12202 );
	scr_RemoveTrap( 12203 );

	mis_RemoveEffect( 934, -12313.207031, -86.653839, -2185.291748, 27.0 )
	mis_RemoveEffect( 935, -12980.842773, -93.826546, -2412.014648, 27.0 )
//	mis_RemoveEffect( 936, -9383.158203, 287.589844, -8616.767578, 27.0  )

	scr_RemoveTargetEnemyCallback( 401 );
	scr_RemoveStandbyEnemyCallback( 401 );
	scr_RemoveStandbyEnemyCallback( 301 );
	scr_RemoveStandbyEnemyCallback( 302 );
	scr_RemoveStandbyEnemyCallback( 303 );
	scr_RemoveStandbyEnemyCallback( 304 );
	scr_RemoveStandbyEnemyCallback( 305 );
	scr_RemoveStandbyEnemyCallback( 306 );
	scr_RemoveStandbyEnemyCallback( 307 );
	scr_RemoveStandbyEnemyCallback( 308 );
	scr_RemoveStandbyEnemyCallback( 309 );

	mis_KillAllGhost();	//すべてのお化けを殺害 
	scr_BotPlayerSetLife( 401, 0 );
	mis_Wait(4.0);	//リスポーン可能まで待つ 
	mis_GhostZoneGotoDeadPoint();	//おばけを見えない位置に飛ばす 
}
/////////////////////////////////////////////////////////////////////////////////////////////////
//おばけ出現２///////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
gClearGhostZone02 <- 0;	//0開始前　1途中（０wave)　2途中（クリアとクリアの間。リスポーンがオフ。チェック時に２なら１へ)　3クリア時 
function mis_CheckClearGhostZone02()
{
	//おばけ２の進行状況チェック 
	print( "checkgho02!\n" );
	if(gClearGhostZone02 == 1 || gClearGhostZone02 == 2 )	//途中もしくは移行中の場合 
	{
	//メッセージ 
		gCountKill401 = 0;	//おばけ王殺害カウントをリセット 
		gClearGhostZone02 = 0;	//進行状況を開始前に 


		//関連コールバックの削除 
		scr_RemoveCallbackFromId( 8 );	//2ndset 
		scr_RemoveCallbackFromId( 9 );	//3rdset 
		scr_RemoveTargetEnemyCallback( 401 );
		scr_RemoveStandbyEnemyCallback( 401 );
		scr_RemoveStandbyEnemyCallback( 301 );
		scr_RemoveStandbyEnemyCallback( 302 );
		scr_RemoveStandbyEnemyCallback( 303 );
		scr_RemoveStandbyEnemyCallback( 304 );
		scr_RemoveStandbyEnemyCallback( 305 );
		scr_RemoveStandbyEnemyCallback( 306 );
		scr_RemoveStandbyEnemyCallback( 307 );
		scr_RemoveStandbyEnemyCallback( 308 );
		scr_RemoveStandbyEnemyCallback( 309 );


		mis_Wait(1.0);	//一秒待つ 
		mis_MassageDialog( "C212_16" );
		
//		scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
		scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 


		mis_Wait(2.0);	//一秒待つ 
		mis_KillAllGhost();	//すべてのお化けを殺害 
		//タワーの状態が白い場合黒へ 
		scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );	//1番タワー 
		scr_BotPlayerSetLife( 401, 0 );
		mis_Wait(4.0);	//リスポーン可能まで待つ 
		mis_GhostZoneGotoDeadPoint();	//おばけを見えない位置に飛ばす 
		mis_Wait(4.0);

		//トラップのいれかえ 
		scr_RemoveCallbackFromId( 12201 );
		scr_SetTrapInCallback( "miscb_TrapIn12201b", 12201, CB_TYPE_ONCE, 12201 );
	}
}
function mis_ResetGhostZone02()
{
	//おばけの死亡監視を設定し、進行可能に 
	scr_AddStandbyEnemyCallback( "miscb_BotDead401_02", 401, STANDBY_COUNT_START_TIMING );
	scr_AddTargetEnemyCallback( "miscb_KillBot401_02", 401, "TARGET" );

	scr_AddStandbyEnemyCallback( "miscb_BotDead301_02", 301, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead302_02", 302, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead303_02", 303, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead304_02", 304, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead305_02", 305, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead306_02", 306, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead307_02", 307, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead308_02", 308, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead309_02", 309, STANDBY_COUNT_START_TIMING );
}
function miscb_TrapIn12201()
{
	print( "in12201!\n" );
	//橋にさしかかった時。メッセージあってから開始 
	gClearGhostZone02 = 1;
	gCountKill401 = 0;

	mis_SetKeepOutEffect( 924, -12313.207031, -36.653839, -2185.291748, 27.0  );	//行きどまり
	mis_SetKeepOutEffect( 925, -12980.842773, -43.826546, -2412.014648, 27.0  );	//行きどまり
//	mis_SetKeepOutEffect( 926, -9383.158203, 337.589844, -8616.767578, 27.0  );	//行きどまり

	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	scr_ResetGameCameraDirection( -12072.078125,  -3861.968018, false );	//カメラセットしつつ登場  
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSetMapIconVisible( 401, true );
	scr_BotPlayerSpawnToWorld( 401, -12072.078125, -111.021011, -3861.968018, -152.0 );
	scr_AddStandbyEnemyCallback( "miscb_BotDead401_02", 401, STANDBY_COUNT_START_TIMING );
	scr_AddTargetEnemyCallback( "miscb_KillBot401_02", 401, "TARGET" );
	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );
	mis_Wait( 0.4 );
	//メッセージ 
	mis_MassageDialog( "C212_21" );

	mis_SetUpGhostReapawn(  301, -13218.181641, -90.351913, -4735.346680, -152.0  );
	mis_SetUpGhostReapawn(  302, -12578.936523, -205.941086, -5284.25585, -152.0  );
//	mis_SetUpGhostReapawn(  303, -12851.049805, -281.304077, -6214.41992, -152.0  );
	mis_SetUpGhostReapawn(  304, -10439.472656, -157.758820, -7117.80517, -152.0  );
	mis_SetUpGhostReapawn(  305, -10086.342773, -94.832169, -7679.045410, -152.0  );
	mis_Wait( 0.2 );
	mis_SetUpGhostReapawn( 306, -8699.766602, -55.629601, -4349.147461, -152.0  );
//	mis_SetUpGhostReapawn( 307, -10064.504883, -67.694801, -6464.76562, -152.0  );
	mis_SetUpGhostReapawn( 308, -11373.054688, 69.756180, -5307.572266, -152.0  );
	mis_SetUpGhostReapawn( 309, -11359.906250, -199.101913, -3818.5041, -152.0  );
	mis_Wait( 0.4 );


	scr_AddStandbyEnemyCallback( "miscb_BotDead301_02", 301, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead302_02", 302, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead303_02", 303, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead304_02", 304, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead305_02", 305, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead306_02", 306, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead307_02", 307, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead308_02", 308, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead309_02", 309, STANDBY_CAN_RESPAWN_TIMING );

	//メッセージ 
	mis_MassageDialog( "C212_30" );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );

//	scr_OpenMissionStateText(  0, "$TXHFS21203" );	//達成状況を更新：おばけ 
	scr_OpenMissionConditionText(  0, "TXHFC03203" );	//おばけぶっころせ 

}
//↓おばけの死亡監視 
function miscb_BotDead301_02()
{
	print( "kill301!\n" );
	//おばけ死亡時のリスポーン。zone1と２で分ける。 
	mis_GhostZone02RespawnSet();
}
function miscb_BotDead302_02()
{
	print( "kill302!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead303_02()
{
	print( "kill303!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead304_02()
{
	print( "kill304!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead305_02()
{
	print( "kill305!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead306_02()
{
	print( "kill306!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead307_02()
{
	print( "kill307!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead308_02()
{
	print( "kill308!\n" );
	mis_GhostZone02RespawnSet();

}
function miscb_BotDead309_02()
{
	print( "kill309!\n" );
	mis_GhostZone02RespawnSet();

}
//////////////////////
function mis_GhostZone02RespawnSet()
{
	//おばけのリスポーン位置を進行状況に合わせて変更 
	if(gCountKill401 == 0)	//1stwave中 
	{
		mis_GhostZone02FirstRespawnSet();
	}
	if(gCountKill401 == 1)	//2ndwave中 
	{
		mis_GhostZone02SecondRespawnSet();
	}
	if(gCountKill401 == 2)	//3rdwave中 
	{
		mis_GhostZone02ThirdRespawnSet();
	}
}
//↓リスポーン位置設定 
function mis_GhostZone02FirstRespawnSet()
{
	print( "respawnghost1stwave!\n" );
	mis_SetUpGhostReapawn( 301, -13218.181641, -90.351913, -4735.346680, -152.0 );
	mis_SetUpGhostReapawn( 302, -12578.936523, -205.941086, -5284.25585, -152.0 );
//	mis_SetUpGhostReapawn( 303, -12851.049805, -281.304077, -6214.41992, -152.0 );
	mis_SetUpGhostReapawn( 304, -10439.472656, -157.758820, -7117.80517, -152.0 );
	mis_SetUpGhostReapawn( 305, -10086.342773, -94.832169, -7679.045410, -152.0 );
	mis_SetUpGhostReapawn( 306, -8699.766602, -55.629601, -4349.147461, -152.0 );
//	mis_SetUpGhostReapawn( 307, -10064.504883, -67.694801, -6464.76562, -152.0 );
	mis_SetUpGhostReapawn( 308, -11373.054688, 69.756180, -5307.572266, -152.0 );
	mis_SetUpGhostReapawn( 309, -11359.906250, -199.101913, -3818.5041, -152.0 );
}
function mis_GhostZone02SecondRespawnSet()
{
	print( "respawnghost2ndwave!\n" );
//	mis_SetUpGhostReapawn( 301, -9905.484375, -67.694801, -6464.709961, -45.0 );
	mis_SetUpGhostReapawn( 302, -9847.016602, -287.464264, -6017.271973, -45.0 );
//	mis_SetUpGhostReapawn( 303, -9463.552734, -298.990021, -5274.226074, -45.0 );
	mis_SetUpGhostReapawn( 304, -9147.993164, -303.219421, -4723.317383, -45.0 );
	mis_SetUpGhostReapawn( 305, -10960.115234, -291.264374, -4144.63183, -45.0 );
	mis_SetUpGhostReapawn( 306, -10625.569336, -125.240715, -7477.6665, -45.0 );
	mis_SetUpGhostReapawn( 307, -11938.287109, -199.646637, -7394.3598, -45.0 );
	mis_SetUpGhostReapawn( 308, -11149.324219, 69.872498, -6214.957031, -45.0 );
//	mis_SetUpGhostReapawn( 309, -11582.856445, 69.824516, -5514.815430, -45.0 );
}
function mis_GhostZone02ThirdRespawnSet()
{
	print( "respawnghost3rdwave!\n" );
	mis_SetUpGhostReapawn( 301, -11600.029297, -278.499084, -6639.2353, 112.0 );
	mis_SetUpGhostReapawn( 302, -12188.792969, -298.837769, -6696.5590, 112.0 );
	mis_SetUpGhostReapawn( 303, -12494.456055, -250.455338, -7330.7968, 112.0 );
	mis_SetUpGhostReapawn( 304, -12170.461914, -308.929199, -7983.4814, 112.0 );
	mis_SetUpGhostReapawn( 305, -11097.262695, 14.002506, -7536.363281, 112.0 );
	mis_SetUpGhostReapawn( 306, -10692.314453, -67.694801, -6407.99072, 112.0 );
	mis_SetUpGhostReapawn( 307, -11235.435547, 69.872498, -6103.921387, 112.0 );
	mis_SetUpGhostReapawn( 308, -13203.647461, -218.672745, -5777.4506, 112.0 );
	mis_SetUpGhostReapawn( 309, -11382.492188, -138.942841, -8453.5253, 112.0 );
}
////////////////////////////
function miscb_KillBot401_02()
{
	//ゴー金撃破 
	print( "kill401_02!\n" );
	gClearGhostZone02 = 2;	//クリア進行状況を行こう中に設定 
	mis_KillAllGhost();	//すべてのお化けを殺害 
}
function miscb_BotDead401_02()
{
	print( "dead401_02!\n" );
	//おばけ王死亡。次へ移行する。 
	gCountKill401 = (gCountKill401 + 1);	//殺害回数をセット 
	mis_KillAllGhost();	//すべてのお化けを殺害 

	if(gClearGhostZone02 == 1 || gClearGhostZone02 == 2 )	//途中もしくは移行中の場合 
	{
		if(gCountKill401 == 1)	//2回戦へ移行 
		{
			//メッセージ 
			mis_MassageDialog( "C212_11" );
			scr_SetTimerCallback( "miscb_SetGhost2ndWave02", 8, CB_TYPE_ONCE, 3.1 );	//3秒後に2nd開始 
		}
		if(gCountKill401 == 2)	//3回戦へ移行 
		{
			//メッセージ 
			mis_MassageDialog( "C212_13" );
			scr_SetTimerCallback( "miscb_SetGhost3rdWave02", 9, CB_TYPE_ONCE, 3.1 );	//3秒後に2nd開始 
		}
		if(gCountKill401 == 3)	//終わり 
		{
			//メッセージ 
			mis_MassageDialog( "C212_15b" );
			gClearGhostZone02 = 3;	//クリア進行状況をクリア済みに設定 
			//エフェクト消去イベント 
			scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
			scr_ResetGameCameraDirection( -12313.207031, -2185.291748, false );
			mis_CameraSet();
			scr_SetTimerCallback( "mis_GhostZoneGotoDeadPoint", 10, CB_TYPE_ONCE, 8.0 );	//見えない位置に移動タイマー 


			//関連コールバックの削除 
			scr_RemoveCallbackFromId( 8 );	//2ndset 
			scr_RemoveCallbackFromId( 9 );	//3rdset 
			scr_RemoveTargetEnemyCallback( 401 );
			scr_RemoveStandbyEnemyCallback( 401 );
			scr_RemoveStandbyEnemyCallback( 301 );
			scr_RemoveStandbyEnemyCallback( 302 );
			scr_RemoveStandbyEnemyCallback( 303 );
			scr_RemoveStandbyEnemyCallback( 304 );
			scr_RemoveStandbyEnemyCallback( 305 );
			scr_RemoveStandbyEnemyCallback( 306 );
			scr_RemoveStandbyEnemyCallback( 307 );
			scr_RemoveStandbyEnemyCallback( 308 );
			scr_RemoveStandbyEnemyCallback( 309 );

			//エフェクトとトラップ削除 
			scr_RemoveScene( 924, false );
			scr_RemoveScene( 925, false );
//			scr_RemoveScene( 926, false );
			scr_RemoveScene( 1524, false );
			scr_RemoveScene( 1525, false );
			scr_RemoveScene( 1526, false );

			scr_RemoveTrap( 12201 );
//			scr_RemoveTrap( 12202 );
			scr_RemoveTrap( 12203 );

			mis_RemoveEffect( 934, -12313.207031, -86.653839, -2185.291748, 27.0 )
			mis_RemoveEffect( 935, -12980.842773, -93.826546, -2412.014648, 27.0 )
//			mis_RemoveEffect( 936, -9383.158203, 287.589844, -8616.767578, 27.0  )


			mis_Wait(0.8);
			mis_MassageDialog( "C212_27" );

//			scr_OpenMissionStateText(  0, "$TXHFS21201" );	//達成状況を表示:敵の城へ向かえ 
			scr_OpenMissionConditionText(  0, "TXHFC01102" );	//達成状況を表示:敵の城へ向かえ 

			//ミイラゾーンを同時にクリア状態に 
			mis_SkipMummyZone02();
		}
	}
}
function mis_SkipMummyZone02()
{
	//おばけ２をクリアしたのでミイラもクリア状態に移行 
	mis_MummyZoneGotoDeadPoint();	//生きてるミイラを削除 
	gClearMummyZone02 = 2;
	scr_RemoveCallbackFromName( "miscb_RestartMummyZone02" );	//リスタート設定を削除 
		//エフェクトとトラップ削除 
		scr_RemoveScene( 921, false );
		scr_RemoveScene( 922, false );
		scr_RemoveScene( 923, false );
		scr_RemoveScene( 1521, false );
		scr_RemoveScene( 1522, false );
		scr_RemoveScene( 1523, false );
		scr_RemoveTrap( 11201 );
		scr_RemoveTrap( 11202 );
		mis_RemoveEffect( 931, -12517.038086, 0.000000, 4129.511719, 27.0  )
		mis_RemoveEffect( 932, -11947.662109, 1.311306, 3765.856445, 115.0 )
		mis_RemoveEffect( 933, -11130.300781, 0.180916, 3243.699707, 115.0 )
}
function mis_SetGhost1stWave02()
{
	//2回目以降の最初のセットアップ
	print( "miscb_SetGhost1stWave02!\n" );
	gClearGhostZone02 = 1;

	//メッセージ※2回目以降 
	mis_MassageDialog( "C212_17" );

	//タワーの状態が白い場合黒へ 
	scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );	//1番タワー 
//	mis_Warp(  8101.167480, -11.870073, 6141.099609, 25.0 );	//ワープ 

	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	scr_ResetGameCameraDirection( -12072.078125, -3861.968018, false );	//カメラセットしつつ登場  
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSetMapIconVisible( 401, true );
	scr_BotPlayerSpawnToWorld( 401, -12072.078125, -111.021011, -3861.968018, -152.0 );
	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );

	mis_Wait( 0.4 );
	mis_SetUpGhostReapawn(  301, -13218.181641, -90.351913, -4735.346680, -152.0  );
	mis_SetUpGhostReapawn(  302, -12578.936523, -205.941086, -5284.25585, -152.0  );
//	mis_SetUpGhostReapawn(  303, -12851.049805, -281.304077, -6214.41992, -152.0  );
	mis_SetUpGhostReapawn(  304, -10439.472656, -157.758820, -7117.80517, -152.0  );
	mis_SetUpGhostReapawn(  305, -10086.342773, -94.832169, -7679.045410, -152.0  );
	mis_Wait( 0.2 );
	mis_SetUpGhostReapawn( 306, -8699.766602, -55.629601, -4349.147461, -152.0  );
//	mis_SetUpGhostReapawn( 307, -10064.504883, -67.694801, -6464.76562, -152.0  );
	mis_SetUpGhostReapawn( 308, -11373.054688, 69.756180, -5307.572266, -152.0  );
	mis_SetUpGhostReapawn( 309, -11359.906250, -199.101913, -3818.5041, -152.0  );
	mis_Wait( 0.4 );

	//メッセージ 
	mis_MassageDialog( "C212_30" );

//	scr_OpenMissionStateText(  0, "$TXHFS21203" );	//達成状況を更新：おばけ 
	scr_OpenMissionConditionText(  0, "TXHFC03203" );	//おばけぶっころせ 


	mis_ResetGhostZone02();	//コールバックの復活 

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
}
function miscb_SetGhost2ndWave02()
{
	//2回戦目開始 
	print( "miscb_SetGhost2ndWave02!\n" );
	gClearGhostZone02 = 1;

	//メッセージ※ 
	mis_MassageDialog( "C212_12" );
	
	mis_Warp(  -12800.961914, -90.796577, -4408.809082, 139.0 );	//ワープ 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSpawnToWorld( 401, -9933.451172, -81.419624, -7616.146484, -45.0 );

	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );

	scr_BotPlayerSetMapIconVisible( 301, false );
	scr_BotPlayerSetMapIconVisible( 309, false );
	suspend();
	scr_BotPlayerSpawnToWorld( 301,  49845.938477, -2552.620903, 7915.641602, 0.0 );
	scr_BotPlayerSpawnToWorld( 309,  49845.938477, -2552.620903, 7915.641602, 0.0 );


	mis_Wait( 0.4 );
//	mis_SetUpGhostReapawn(  301, -9905.484375, -67.694801, -6464.709961, -45.0  );
	mis_SetUpGhostReapawn(  302, -9847.016602, -287.464264, -6017.271973, -45.0  );
//	mis_SetUpGhostReapawn(  303, -9463.552734, -298.990021, -5274.226074, -45.0  );
	mis_SetUpGhostReapawn(  304, -9147.993164, -303.219421, -4723.317383, -45.0  );
	mis_SetUpGhostReapawn(  305, -10960.115234, -291.264374, -4144.63183, -45.0  );
	mis_Wait( 0.2 );
	mis_SetUpGhostReapawn(  306, -10625.569336, -125.240715, -7477.6665, -45.0  );
	mis_SetUpGhostReapawn(  307, -11938.287109, -199.646637, -7394.3598, -45.0  );
	mis_SetUpGhostReapawn(  308, -11149.324219, 69.872498, -6214.957031, -45.0  );
//	mis_SetUpGhostReapawn(  309, -11582.856445, 69.824516, -5514.815430, -45.0  );
	mis_Wait( 0.4 );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
}
function miscb_SetGhost3rdWave02()
{
	//3回戦目開始 
	print( "miscb_SetGhost3rdWave02!\n" );
	gClearGhostZone02 = 1;

	//メッセージ※ 
	mis_MassageDialog( "C212_14" );

	mis_Warp( -8926.181641, -198.280579, -6200.209961, -104.0 );	//ワープ 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_Wait( 0.2 );

	//ゴー金召喚 
	scr_BotPlayerSpawnToWorld( 401, -13484.661133, -325.763763, -6768.6650, 112.0 );

	suspend();
	scr_BotPlayerSetActionTrigger( 401, true );

	mis_Wait( 0.5 );
	mis_SetUpGhostReapawn(  301, -11600.029297, -278.499084, -6639.2353, 112.0 );
	mis_SetUpGhostReapawn(  302, -12188.792969, -298.837769, -6696.5590, 112.0 );
	mis_SetUpGhostReapawn(  303, -12494.456055, -250.455338, -7330.7968, 112.0 );
	mis_SetUpGhostReapawn(  304, -12170.461914, -308.929199, -7983.4814, 112.0 );
	mis_SetUpGhostReapawn(  305, -11097.262695, 14.002506, -7536.363281, 112.0 );
	mis_Wait( 0.2 );

	mis_SetUpGhostReapawn(  306, -10692.314453, -67.694801, -6407.99072, 112.0 );
	mis_SetUpGhostReapawn(  307, -11235.435547, 69.872498, -6103.921387, 112.0 );
	mis_SetUpGhostReapawn(  308, -13203.647461, -218.672745, -5777.4506, 112.0 );
	mis_SetUpGhostReapawn(  309, -11382.492188, -138.942841, -8453.5253, 112.0 );
	mis_Wait( 0.4 );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
}
function miscb_TrapIn12202()
{
//	//行き止まり 
//	print( "in12202!\n" );
//	//メッセージ 
//	mis_MassageDialog( "C212_28" );
//	mis_Warp( -10200.379883, -35.377880, -8188.813965, -54.0 );	//ワープ 
}
function miscb_TrapIn12203()
{
	//行き止まり 
	print( "in12203!\n" );
	//メッセージ
	mis_MassageDialog( "C212_28" );
	mis_Warp( -12208.571289, -268.136780, -2984.351074, 167.0 );	//ワープ 
}
function miscb_TrapIn12201b()
{
	print( "in12201b!\n" );
	if(gClearGhostZone02 == 0 )	//初期化状態なので最初から行う。1stのリスタートへ 
	{
		mis_SetGhost1stWave02();
	}
}
///////////////////////////////////////////////////////////////////////////////////////////////////
//攻城戦関連 /////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
function miscb_TrapIn13301()
{
	print( "in13301!\n" );
	//城前に到着。ゴーストキング出現してその後個分出現。 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 6 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 6 );

	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	//メッセージ 
	mis_MassageDialog( "C212_23" );

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	scr_ResetGameCameraDirection( -13638.841797, 2173.383301, false );	//カメラセットしつつ登場  
	mis_Wait( 0.4 );

	//カメラセットして出現してメッセージ 
	mis_AppearEffect( 402, -13638.841797, 1000.000000, 2173.383301, 97.0 );	//登場エフェクト 
	scr_BotPlayerSpawnToWorld( 402, -13638.841797, 1000.000000, 2173.383301, 97.0 );
	scr_AddTargetEnemyCallback( "miscb_KillBot402_last", 402, "$TXHFI21201" );
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 402, true );
	mis_Wait( 1.5 );

	//メッセージ 
	mis_MassageDialog( "C212_24" );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );

	scr_BotPlayerSetMapIconVisible( 301, true );
	scr_BotPlayerSetMapIconVisible( 302, true );
	scr_BotPlayerSetMapIconVisible( 303, true );
	scr_BotPlayerSetMapIconVisible( 304, true );

	//左翼展開 
	scr_BotPlayerSpawnToWorld( 301, -13001.375977, 0.736697, 2435.147217, 97.0 );
	scr_BotPlayerSpawnToWorld( 302, -12760.235352, 0.000000, 3162.302734, 97.0 );
	//右翼展開 
	scr_BotPlayerSpawnToWorld( 303, -13082.255859, 0.000000, 1769.44751, 97.0 );
	scr_BotPlayerSpawnToWorld( 304, -13229.534180, 0.804072, 998.911865, 97.0 );

	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 301, true );
	scr_BotPlayerSetActionTrigger( 302, true );
	scr_BotPlayerSetActionTrigger( 303, true );
	scr_BotPlayerSetActionTrigger( 304, true );

	//城内召喚 
	scr_BotPlayerSetMapIconVisible( 201, true );
	scr_BotPlayerSetMapIconVisible( 202, true );
	scr_BotPlayerSetMapIconVisible( 206, true );
	scr_BotPlayerSetMapIconVisible( 207, true );
	scr_BotPlayerSetMapIconVisible( 208, true );
	scr_BotPlayerSetMapIconVisible( 209, true );
	
	scr_BotPlayerSpawnToWorld( 206, -16466.542969, 600.000000, 799.657349, 97.0 );
	scr_BotPlayerSpawnToWorld( 207, -16010.664063, 600.000000, 4287.11035, 97.0 );
	scr_BotPlayerSpawnToWorld( 208, -13919.439453, 675.000000, 4051.43383, 97.0 );
	scr_BotPlayerSpawnToWorld( 209, -14602.927734, 675.000000, 496.459656, 97.0 );

	scr_BotPlayerSpawnToWorld( 201, -15102.439453, 600.000000, 4116.45117, 97.0 );
	scr_BotPlayerSpawnToWorld( 202, -15398.443359, 600.000000, 676.280029, 97.0 );

	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );
	scr_BotPlayerSetActionTrigger( 208, true );
	scr_BotPlayerSetActionTrigger( 209, true );

	scr_AddStandbyEnemyCallback( "miscb_BotDead402_last", 402, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead301_last", 301, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead302_last", 302, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead303_last", 303, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead304_last", 304, STANDBY_CAN_RESPAWN_TIMING );

	mis_Wait(0.5);
	//メッセージ 
	mis_MassageDialog( "C212_25" );

//	scr_OpenMissionStateText(  0, "$TXHFS21205" );	//達成状況を更新 
	scr_OpenMissionConditionText(  0, "TXHFC03205" );	//ビッグタワーぶっ壊せ 


	scr_BotPlayerSetMarchCastleMonument( POWER_COLOR_WHITE, true );	//仲間の勝手な進軍を許可 
}
function miscb_KillBot402_last()
{
	print( "kill402last!\n" );
	scr_RemoveTargetEnemyCallback( 402 );
}
function miscb_BotDead301_last()
{
	print( "dead301last!\n" );
	if(gIncastle != 1)
	{
		scr_BotPlayerSpawnToWorld( 301, -13707.509766, 1000.000000, 2528.556396, 97.0 );
	}
	else
	{
		scr_BotPlayerSpawnToWorld( 301, -15937.562500, 0.000000, 3379.980469, 97.0 );
		suspend();
		suspend();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( 301, true );
	}
}
function miscb_BotDead302_last()
{
	print( "BotDead302last!\n" );
	if(gIncastle != 1)
	{
		scr_BotPlayerSpawnToWorld( 302, -13707.509766, 1000.000000, 2528.556396, 97.0 );
	}
	else
	{
		scr_BotPlayerSpawnToWorld( 302, -15937.562500, 0.000000, 3379.980469, 97.0 );
		suspend();
		suspend();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( 302, true );
	}
}
function miscb_BotDead303_last()
{
	print( "BotDead303last!\n" );
	if(gIncastle != 1)
	{
		scr_BotPlayerSpawnToWorld( 303, -13911.671875, 1000.000000, 1938.961792, 97.0 );
	}
	else
	{
		scr_BotPlayerSpawnToWorld( 303, -16160.471680, 0.000000, 1601.926636, 97.0 );
		suspend();
		suspend();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( 303, true );
	}
}
function miscb_BotDead304_last()
{
	print( "BotDead304last!\n" );
	if(gIncastle != 1)
	{
		scr_BotPlayerSpawnToWorld( 304, -13911.671875, 1000.000000, 1938.961792, 97.0 );
	}
	else
	{
		scr_BotPlayerSpawnToWorld( 304, -16160.471680, 0.000000, 1601.926636, 97.0 );
		suspend();
		suspend();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( 304, true );
	}
}
function miscb_BotDead402_last()
{
	print( "BotDead304last!\n" );
	mis_Wait(0.5);
	//リスポーン設定を無効化 
	scr_RemoveStandbyEnemyCallback( 301 );
	scr_RemoveStandbyEnemyCallback( 302 );
	scr_RemoveStandbyEnemyCallback( 303 );
	scr_RemoveStandbyEnemyCallback( 304 );
	//おばけを殺害 
	scr_BotPlayerSetLife( 301, 0 );
	scr_BotPlayerSetLife( 302, 0 );
	scr_BotPlayerSetLife( 303, 0 );
	scr_BotPlayerSetLife( 304, 0 );
}
gIncastle <- 0;
function miscb_TrapIn13303()
{
	//場内に侵入。城壁リスポーンのおばけのリスポーン位置を変更  
	print( "in13303!\n" );
	
	gIncastle = 1;
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_BotPlayerSetLife( 301, 0 );
	scr_BotPlayerSetLife( 302, 0 );
	scr_BotPlayerSetLife( 303, 0 );
	scr_BotPlayerSetLife( 304, 0 );

}