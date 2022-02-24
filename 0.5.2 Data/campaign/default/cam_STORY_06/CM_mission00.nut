///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_on_0302\mission00.nut 
//	概要	：オフラインキャンペーン レベル3 キャンペーン2 ミッション1(STORY06) 
//	作成	：落合 
//	作成日	：110606 
//	目的	：［戦争］敵の城を落とせ 
//
///////////////////////////////////////////////////////////////////////////////////////////////
function loadMission() 
{
	print("[sample mission] load()\n");
	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );
	scr_SetDisableGimmickType( GIMMICK_LADDER );
	scr_SetDisableGimmickType( GIMMICK_BOMBSTONE );
	scr_SetDisableGimmickType( GIMMICK_BATTERING_RAM );
}
////////////////////////////////////////////////////////////////////////
//汎用ファンクション ///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
function mis_BigWarp( x1, y1, z1, r1, x2, y2, z2, r2 )
{
	//エフェクト付きのワープ演出 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_CreateSceneSound( 98764, 140300, x1, y1, z1 );
	scr_CreateSceneEffect( 98765, "Stor01f",  x1,  y1,  z1,  r1 );
	scr_WaitStart( 1.2 );
	while( scr_Waiting() )	
	{
		suspend();
	}
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
	scr_FadeIn( 0.3 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
	//邪悪な力でどこかに飛ばされた 
	
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C321_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
	scr_RemoveScene( 98765, true );

}

function mis_Warp( x, y, z, roty)
{
	//通行止めトラップから押し戻す 
	print("warp()\n");
	mis_MassageDialog( "C321_05" );	//メッセージ： 
	scr_PauseOn();		
	// フェードしてワープ
	scr_FadeOutBlack( 0.3 );
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
//	scr_ResetGameCameraBehind( true )
	scr_PauseOn();		
	scr_FadeIn( 0.3 );
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
function mis_AppearEffect( id, x, y, z, roty )
{
	print("apEffect!()\n");
	scr_CreateSceneEffect( id, "Slis02c",  x,  y,  z,  roty );
	mis_Wait(0.1);
	scr_CreateSceneSound( 30000, 80950, -1817.268555, 48.085918, 2106.088379 );
	scr_RemoveScene( id, false );
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
function mis_EnemySpawnAndSet( id, regist_id, x, y, z, roty )
{
	print("BotSpawn!()\n");
	scr_BotPlayerSpawnToWorld( regist_id, x, y, z, roty );
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( regist_id, true );
	suspend();
}
function mis_ChangeMissionCondition()
{
	print("changeMissionCondition!()\n");
//	scr_OpenMissionStateText1( 0, "$TXHFS32101", gRemainedRespawn );
	
	if(gAtButler == 0 )
	{
		scr_OpenMissionConditionText1( 0, "TXHFC06102", gRemainedRespawn );	//闇の城に迎え 
		
	}
	else
	{
		scr_OpenMissionConditionText1( 0, "TXHFC06103", gRemainedRespawn );	//バトラー倒せ 
		
	}
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
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
function startMission() 
{
	print("[sample mission] start()\n");

	scr_SetMessageCallback( "miscb_PlayerSally_First", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	
	scr_SetMessageCallback( "miscb_GameSetWinWhite", 2, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_BLACK_CASTLE_MONUMENT );	
	scr_SetMessageCallback( "miscb_GameSetWinBlack", 3, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_WHITE_CASTLE_MONUMENT );
	scr_SetMessageCallback( "miscb_TimeOver", 80002, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );		//タイムオーバー時 
	scr_SetMessageCallback( "miscb_GameSetPlayerDead", 4, CB_TYPE_ALWAYS, MESSAGE_PLAYER_DEAD ); 

	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 99 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY,99 );

	scr_BotPlayerRegistAndCreate( 101, "NOOB07", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "NOOB09", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 103, "NOOB10", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 104, "MEDIC03", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 105, "MAGE03", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "STEEL_HEAD_T", POWER_COLOR_BLACK );	//追従雑魚 
	scr_BotPlayerRegistAndCreate( 202, "STEEL_HEAD_T", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "STEEL_HEAD_T", POWER_COLOR_BLACK );

	scr_BotPlayerRegistAndCreate( 301, "DARK_PAWN_D", POWER_COLOR_BLACK );	//防衛戦士 
	scr_BotPlayerRegistAndCreate( 302, "DARK_PAWN_D", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 303, "DARK_PAWN_D", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 304, "DARK_PAWN_D", POWER_COLOR_BLACK );

	scr_BotPlayerRegistAndCreate( 401, "SKULL_HEAD_D", POWER_COLOR_BLACK );	//防衛僧侶 
	scr_BotPlayerRegistAndCreate( 402, "SKULL_HEAD_D", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 403, "SKULL_HEAD_D", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 404, "SKULL_HEAD_D", POWER_COLOR_BLACK );


	scr_BotPlayerRegistAndCreate( 501, "DEVIL02", POWER_COLOR_BLACK );	//防衛魔道 
	scr_BotPlayerRegistAndCreate( 502, "DEVIL02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 503, "DEVIL02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 504, "DEVIL02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 505, "DEVIL02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 506, "DEVIL02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 507, "DEVIL02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 508, "DEVIL02", POWER_COLOR_BLACK );

	scr_BotPlayerRegistAndCreate( 601, "STRONG_BUKET_D", POWER_COLOR_BLACK );	//塔防衛中ボス１ 
	scr_BotPlayerRegistAndCreate( 602, "GENERAL_D", POWER_COLOR_BLACK );	//塔防衛中ボス１ 
	scr_BotPlayerRegistAndCreate( 603, "UNDEAD_D", POWER_COLOR_BLACK );	//塔防衛中ボス１ 
	scr_BotPlayerRegistAndCreate( 604, "DARK_KNIGHT_D", POWER_COLOR_BLACK );	//塔防衛中ボス１ 
	scr_BotPlayerRegistAndCreate( 605, "BUTLER02", POWER_COLOR_BLACK );


//トラップ 
	scr_RegistTrapBox( 1002,   16243.2 ,500.0 ,-2743.9 ,1394.0 ,1500.0 ,180.8 ,-342.2   );	//通行止め　毒沼１　城側	 
	scr_RegistTrapBox( 1003,   16118.2 ,500.0 ,-3108.2 ,1394.0 ,1500.0 ,177.2 ,-342.2   );	//通行止め　毒沼１　沼側	 
	scr_RegistTrapBox( 1004,   10055.0 ,500.0 ,2957.1 ,170.0 ,1500.0 ,1439.3 ,0.0       );	//4番タワースイッチ		 
	scr_RegistTrapBox( 1005,   2186.9 ,1700.0 ,1997.8 ,348.4 ,800.0 ,1348.2 ,-13.2      );	//ワープゾーン１　沼へ	 
	scr_RegistTrapBox( 1006,   -8245.3 ,500.0 ,5421.1 ,131.4 ,1500.0 ,2023.3 ,-329.7    );	//出現トラップ１　毒沼敵城側 
	scr_RegistTrapBox( 1007,   -16101.3 ,500.0 ,2664.5 ,1181.0 ,1500.0 ,253.8 ,-344.9   );	//ワープゾーン２　橋へ	 
	scr_RegistTrapBox( 1008,   -9226.9 ,500.0 ,-3171.4 ,409.0 ,1500.0 ,1717.9 ,0.0      );	//出現トラップ２　大階段敵側 
	scr_RegistTrapBox( 1009,   -15759.0 ,500.0 ,-3207.1 ,230.4 ,1500.0 ,4932.1 ,0.0     );	//ワープ２削除			 
	scr_RegistTrapBox( 1010,   -18250.0 ,500.0 ,-5638.3 ,168.1 ,1500.0 ,3123.3 ,-322.6  );	//バトラーイベント		 
	scr_RegistTrapBox( 1010,   -18347.2 ,500.0 ,-947.5 ,150.1 ,1500.0 ,3126.9 ,-39.7    );	//バトラーイベント		 

	scr_RegistTrapBox( 1012,   -1020.2 ,-400.0 ,117.5 ,3093.5 ,600.0 ,3218.4 ,-7.6    );	//落下対策		 
	scr_RegistTrapBox( 1012,   1503.5 ,-400.0 ,1989.4 ,2074.3 ,600.0 ,856.9 ,-326.0   );	//落下対策		 
	scr_RegistTrapBox( 1012,   2579.7 ,-400.0 ,299.2 ,307.4 ,600.0 ,1233.6 ,-341.0    );	//落下対策		 
	scr_RegistTrapBox( 1012,   4318.2 ,-400.0 ,-1387.7 ,363.2 ,600.0 ,2507.0 ,-76.4   );	//落下対策		 
	scr_RegistTrapBox( 1012,   5589.6 ,-400.0 ,-920.5 ,754.7 ,600.0 ,1288.7 ,-76.4    );	//落下対策		 

	scr_RegistTrapBox( 1013,   472.5, -300.0 , 387.4, 3880.7, 600.0 , 4719.3, -71.2  );	//マグマ解説  


	//最出撃時の味方復活用トラップ 
	scr_RegistTrapBox( 5500,   23204.2 ,500.0 ,1952.4 ,1785.1 ,1500.0 ,1697.6 ,0.0      );	//自軍城 
	scr_RegistTrapSphere( 5505, 13849.599609, 149.588593, 3189.037354, 1600.0 );	//モニュメント05番 
	scr_RegistTrapSphere( 5504, 5484.995117, 1841.184570, 2960.935303, 1600.0 );	//モニュメント04番 
	scr_RegistTrapSphere( 5503, 33.734718, 2198.483887, -9.870132, 1600.0 );	//モニュメント03番 
	scr_RegistTrapSphere( 5502, -5412.019531, 1843.783203, -2968.158691, 1600.0 );	//モニュメント02番 
	scr_RegistTrapSphere( 5501, -13854.777344, 149.588593, -3189.930664, 1600.0 );	//モニュメント01番 
	scr_SetTrapInCallback( "miscb_TrapIn5500", 55000, CB_TYPE_ALWAYS, 5500 );	
	scr_SetTrapInCallback( "miscb_TrapIn5505", 55005, CB_TYPE_ALWAYS, 5505 );	
	scr_SetTrapInCallback( "miscb_TrapIn5504", 55004, CB_TYPE_ALWAYS, 5504 );	
	scr_SetTrapInCallback( "miscb_TrapIn5503", 55003, CB_TYPE_ALWAYS, 5503 );	
	scr_SetTrapInCallback( "miscb_TrapIn5502", 55002, CB_TYPE_ALWAYS, 5502 );	
	scr_SetTrapInCallback( "miscb_TrapIn5501", 55001, CB_TYPE_ALWAYS, 5501 );	


	scr_SetTrapInCallback( "miscb_TrapIn1002", 10002, CB_TYPE_ALWAYS, 1002 );	//毒沼の手前に押し戻す 
	scr_SetTrapInCallback( "miscb_TrapIn1003", 10003, CB_TYPE_ALWAYS, 1003 );	//毒沼の奥に押し戻す 
	scr_SetTrapInCallback( "miscb_TrapIn1004", 10004, CB_TYPE_ONCE, 1004 );		//4番からトラッキングボット出現 
	scr_SetTrapInCallback( "miscb_TrapIn1005", 10005, CB_TYPE_ALWAYS, 1005 );	//沼へ強制ワープ 
	scr_SetTrapInCallback( "miscb_TrapIn1006", 10006, CB_TYPE_ONCE, 1006 );		//毒沼に敵出現 
	scr_SetTrapInCallback( "miscb_TrapIn1007", 10007, CB_TYPE_ALWAYS, 1007 );	//橋へワープする 
	scr_SetTrapInCallback( "miscb_TrapIn1008", 10008, CB_TYPE_ONCE, 1008 );	//ダークナイト出現 
	scr_SetTrapInCallback( "miscb_TrapIn1009", 10009, CB_TYPE_ONCE, 1009 );		//ワープ2を削除する 
	scr_SetTrapInCallback( "miscb_TrapIn1010", 10010, CB_TYPE_ONCE, 1010 );		//バトラー出現 
//	scr_SetTrapInCallback( "miscb_TrapIn1012", 10012, CB_TYPE_ALWAYS, 1012 );	//落下対策 
//	scr_SetTrapInCallback( "miscb_TrapIn1013", 10013, CB_TYPE_ONCE, 1013 );		//マグマ解説  

	scr_SetBuildMonumentCallback( "miscb_BuildMonument02", 21002, CB_TYPE_ONCE, "gfmo_001", MONUMENT_BUILD_OWNERSHIP );


	//オフラインキャンペーンＨＵＤ設定 
	scr_SetDisableTacticalInfomation();	//バナーテキストを非表示 
	scr_SetEnablePlayerHeroPopup( false );	//ヒーローポップアップの非表示 
	scr_SetEnableInputPlayerVoiceReaction( false );	//リアクションボイスマクロの非表示 
	scr_BotPlayerDisableLearningSkillByLevelUp();
	scr_SetEnableGameWinDemo( false );

	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_DAMAGED, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_75, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_50, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_40, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_30, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_20, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_10, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_ALLY_GATE_BROKEN, true );


	//開戦前メッセージ 
	mis_Wait( 0.45 );
	mis_MassageDialog( "C321_01" );	//メッセージ： 
	
	
	
	scr_OpenMissionConditionText1( 0, "TXHFC06101", gRemainedRespawn );


	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();
	scr_PlayerSetForceRespawnPosition( 22220.121094, 0.000000, 2979.813, -90.0 );	//プレイヤーの出現位置を固定 



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

	//初期の味方配置 
	scr_BotPlayerSpawnToMonument( 101, "gcmoA_001" );
	scr_BotPlayerSpawnToWorld( 102, 19209.095703, 0.000000, 3632.318848 , 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 103, 19230.089844, 0.000000, 2545.037842 , 0.0 );	//MOBs 
	scr_BotPlayerSpawnToMonument( 104, "gcmoA_001" );
	scr_BotPlayerSpawnToMonument( 105, "gcmoA_001" );
	suspend();
	scr_BotPlayerSetActionTrigger( 101, true );

	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );
	scr_BotPlayerSetActionTrigger( 104, true );
	scr_BotPlayerSetActionTrigger( 105, true );

	scr_BotPlayerSetRespawnEnable( 101, false );
	scr_BotPlayerSetRespawnEnable( 102, false );
	scr_BotPlayerSetRespawnEnable( 103, false );
	scr_BotPlayerSetRespawnEnable( 104, false );
	scr_BotPlayerSetRespawnEnable( 105, false );
}
function miscb_GameSetWinWhite()
{
	//ゲームクリア 
	print( "Game Set Win White!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	scr_GameSetMissionSuccess();

	scr_BotPlayerSetLife( 201, 0 );
	scr_BotPlayerSetLife( 202, 0 );
	scr_BotPlayerSetLife( 203, 0 );
	scr_BotPlayerSetLife( 301, 0 );
	scr_BotPlayerSetLife( 302, 0 );
	scr_BotPlayerSetLife( 303, 0 );
	scr_BotPlayerSetLife( 304, 0 );
	scr_BotPlayerSetLife( 401, 0 );
	scr_BotPlayerSetLife( 402, 0 );
	scr_BotPlayerSetLife( 403, 0 );
	scr_BotPlayerSetLife( 404, 0 );
	scr_BotPlayerSetLife( 501, 0 );
	scr_BotPlayerSetLife( 502, 0 );
	scr_BotPlayerSetLife( 503, 0 );
	scr_BotPlayerSetLife( 504, 0 );
	scr_BotPlayerSetLife( 505, 0 );
	scr_BotPlayerSetLife( 506, 0 );
	scr_BotPlayerSetLife( 507, 0 );
	scr_BotPlayerSetLife( 508, 0 );
	scr_BotPlayerSetLife( 601, 0 );
	scr_BotPlayerSetLife( 602, 0 );
	scr_BotPlayerSetLife( 603, 0 );
	scr_BotPlayerSetLife( 604, 0 );
	scr_BotPlayerSetLife( 605, 0 );
	mis_Wait( 1.6 );
	mis_MassageDialog( "C321_17" );	//メッセージ： 
}
function miscb_GameSetWinBlack()
{
	//敗北時 
	print( "Game Set Win BLACK!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	scr_GameSetMissionFailure();
	mis_Wait( 1.6 );
	mis_MassageDialog( "C111_14" );	//メッセージ： 
}
function miscb_GameSetPlayerDead()
{
	//死んでゲームオーバー 
	if(gRemainedRespawn == 0)
	{
		print( "Game Setplayerdead\n" );
		scr_RemoveCallbackAll();
		scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
		scr_CloseMissionStateText( 0 );	//達成状況を非表示 
		scr_CloseMissionExpainText( 0 );

		mis_Wait( 1.6 );
		mis_MassageDialog( "C321_18" );	//メッセージ： 
		scr_GameSetMissionFailure();
	}
}
function miscb_TimeOver()
{
	//時間切れ 
	print( "TimeOver!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C111_16" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
	scr_GameSetMissionFailure();	//ミッション失敗 
}
function miscb_BuildMonument02()
{
	//2番タワーを建てた 
	print( "BuildM02!\n" );
	mis_1UP();
	mis_AllRevive( "gfmo_001" );	
}

gRemainedRespawn <- 0;	//残り復活回数を示す変数 
function miscb_PlayerSally_First()
{
	//初回出撃時 
	print( "Player is sally!\n" );

	//カメラを寄りの背後視点に変更 
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( false );

	mis_Wait( 1.0 );
//	mis_MassageDialog( "C321_02" );	//メッセージ： 
	mis_BannerInfoTimer("miscb_BunnerInfo0102",3.0);	//バナーを次のものに更新 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMD21021" );	//  

//	scr_OpenMissionConditionText(  0, "$TXHFC32101" );	//達成条件を表示 
	mis_ChangeMissionCondition();	//達成条件更新 

	scr_SetTrapInCallback( "miscb_TrapIn1012", 10012, CB_TYPE_ALWAYS, 1012 );	//落下対策 

	//行き止まりエフェクトを表示 
	scr_CreateSceneEffect( 501, "Gjum01c", 16045.371094, 50.000000, -2846.056152,123.0 );
	scr_CreateSceneEffect( 591, "Ccam37c", 16045.371094, 230.00000, -2846.056152,123.0 );

	scr_CreateSceneEffect( 502, "Gjum01c", 2544.683105, 1760.000000, 1969.708130,123.0 );	//ワープ１ 
	scr_CreateSceneEffect( 503, "Gjum01c", 2430.105957, 1760.000000, 2303.863037,123.0 );	//ワープ１ 
	scr_CreateSceneEffect( 504, "Gjum01c", 2587.310303, 1760.000000, 1607.767944,123.0 );	//ワープ１ 

	scr_CreateSceneEffect( 505, "Gjum01c", -16070.921875, 0.000000, 2904.134521,123.0 );	//ワープ2 


	//初期の敵配置 
	scr_CompleteMonumentBuild( "gfmo_004", POWER_COLOR_BLACK );	//5番タワー 
	scr_SetBreakMonumentCallback( "miscb_BreakMonument05", 20005, CB_TYPE_ONCE, "gfmo_004" );

	scr_BotPlayerSpawnToMonument( 201, "gfmo_004" );
	scr_BotPlayerSpawnToWorld( 301, 17187.380859, 43.166065, 4244.13964, 0.0 );	//W 
	scr_BotPlayerSpawnToWorld( 302, 17506.160156, 101.202454, 2141.9138, 0.0 );	//W 
	scr_BotPlayerSpawnToWorld( 401, 13910.119141, 0.000000, 4684.455566, 0.0 );	//C 
	scr_BotPlayerSpawnToWorld( 402, 13962.224609, 0.000000, 1956.991577, 0.0 );	//C 
	scr_BotPlayerSpawnToWorld( 501, 14111.922852, 620.823853, 803.80773, 0.0 );	//M 
	scr_BotPlayerSpawnToWorld( 502, 14295.130859, 603.619202, 5898.9111, 0.0 );	//M 


	scr_BotPlayerSpawnToWorld( 605, -19284.792969, 0.000000, -3017.141113, 89.0 );	//BUTLER 
	scr_AddStandbyEnemyCallback( "miscb_BotDead605", 605, STANDBY_COUNT_START_TIMING );

	suspend();
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 203, true );

	scr_BotPlayerSetActionTrigger( 301, true );
	scr_BotPlayerSetActionTrigger( 302, true );
	scr_BotPlayerSetActionTrigger( 401, true );
	scr_BotPlayerSetActionTrigger( 402, true );
	scr_BotPlayerSetActionTrigger( 501, true );
	scr_BotPlayerSetActionTrigger( 502, true );

	scr_BotPlayerSetActionTrigger( 605, true );

	//防衛ボットのリスポーンを封じる 
	scr_BotPlayerSetRespawnEnable( 301, false );
	scr_BotPlayerSetRespawnEnable( 302, false );
	scr_BotPlayerSetRespawnEnable( 401, false );
	scr_BotPlayerSetRespawnEnable( 402, false );
	scr_BotPlayerSetRespawnEnable( 501, false );
	scr_BotPlayerSetRespawnEnable( 502, false );

	//リスポーン回数管理用の出撃コールバック 
	scr_SetMessageCallback( "miscb_PlayerSally", 5, CB_TYPE_ALWAYS, MESSAGE_PLAYER_SALLY );
}
function miscb_BunnerInfo0102()
{
	//バナーインフォメーション続き 
	print( "Bunner0102!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfo0103",3.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMD21022" );	//  

}
function miscb_BunnerInfo0103()
{
	//バナーインフォメーション続き 
	print( "Bunner0101!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMD21023" );	//  
	scr_OpenMissionConditionText1( 0, "TXHFC06102", gRemainedRespawn );

}
function miscb_PlayerSally()
{
	//2回目以降のスポーン時.蘇生回数を調整 
	print( "P sally!\n" );
	gRemainedRespawn = (gRemainedRespawn - 1);	//残りリスポーン可能回数を減らす 

	if(gRemainedRespawn == 0)
	{
		//復活時間設定 
		scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 99 );
		scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 99 );
	}
	mis_ChangeMissionCondition();	//達成条件更新 
	
	gRespawnFriendChance = 1;
	
}
function mis_1UP()
{
	print( "1up!\n" );
	//リスポーン回数を増やす 
	gRemainedRespawn = (gRemainedRespawn + 1);
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );
	mis_Wait( 1.0 );
	mis_MassageDialog( "C321_03" );	//メッセージ： 
	mis_ChangeMissionCondition();	//達成条件更新 
}
function mis_AllRevive( tag_name )
{
	print( "allrevive!\n" );
	//死んだ仲間を復活させる 
	if(scr_BotPlayerGetLife( 101 ) == 0 || scr_BotPlayerGetLife( 104 ) == 0 || scr_BotPlayerGetLife( 105 ) == 0 )
	{
		scr_BotPlayerSpawnToMonument( 101, tag_name );
		scr_BotPlayerSpawnToMonument( 104, tag_name );
		scr_BotPlayerSpawnToMonument( 105, tag_name );
		mis_Wait( 0.4 );
//		mis_MassageDialog( "C321_04" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD21041" );	//  
	}
}
function miscb_BreakMonument05()
{
	print( "BreakM05!\n" );
	//5番タワーを破壊した 
	scr_BotPlayerSetRespawnEnable( 201, false );	//トラッキングボットのリスポーンを封じる 
	scr_SetBuildMonumentCallback( "miscb_BuildMonument05", 21005, CB_TYPE_ONCE, "gfmo_004", MONUMENT_BUILD_OWNERSHIP );	//5番タワーを建てた 
}
function miscb_BuildMonument05()
{
	//5番タワーを建てた 
	print( "BuildM05!\n" );
	mis_1UP();
	mis_AllRevive( "gfmo_004" );
	
	mis_BuildBT04andSpawnEnemy();	//4番タワーから敵出現 
	
}
gTState04 <- 0;	//タワー状態の変数 0=無建築　1=黒建築状態　2=白建築状態 3=UNKNOWn 
gTState03 <- 0;	//タワー状態の変数 0=無建築　1=黒建築状態　2=白建築状態 3=UNKNOWn 
function mis_BuildBT04andSpawnEnemy()
{
	//4番タワーが建っていなければ黒で建築済みにし、敵を出現させる 
	if(gTState04 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );	//4番タワー 
		scr_SetBreakMonumentCallback( "miscb_BreakMonument04", 20004, CB_TYPE_ONCE, "gfmo_003" );
		gTState04 = 1;
		mis_Wait(0.3);
		
		
		scr_BotPlayerSetRespawnEnable( 201, true );
		scr_BotPlayerSetRespawnEnable( 202, true );
		scr_BotPlayerSetRespawnEnable( 203, true );

		scr_BotPlayerSpawnToMonument( 201, "gfmo_003" );
		scr_BotPlayerSpawnToMonument( 202, "gfmo_003" );
		scr_BotPlayerSpawnToMonument( 203, "gfmo_003" );
	}
}
function miscb_TrapIn1004()
{
	//初めの大階段に来たら4番タワーから敵出現 
	print( "TrapIn 1004!\n" );
	mis_BuildBT04andSpawnEnemy();	//4番タワーから敵出現 
}
function mis_BuildBT03()
{
	//３番タワーを建てる 
	if(gTState03 == 0)
	{
		scr_CompleteMonumentBuild( "gfmo_005", POWER_COLOR_BLACK );	//3番タワー 
		gTState03 = 1;
		scr_SetBreakMonumentCallback( "miscb_BreakMonument03", 20003, CB_TYPE_ONCE, "gfmo_005" );
	}
}
function miscb_BreakMonument04()
{
	print( "BreakM04!\n" );
	//4番タワーを破壊した 
	scr_BotPlayerSetRespawnEnable( 201, false );	//トラッキングボットのリスポーンを封じる 
	scr_BotPlayerSetRespawnEnable( 202, false );	//トラッキングボットのリスポーンを封じる 
	scr_BotPlayerSetRespawnEnable( 203, false );	//トラッキングボットのリスポーンを封じる 
	
	mis_BuildBT03();
	
	gTState04 = 3;
	scr_SetBuildMonumentCallback( "miscb_BuildMonument04", 21004, CB_TYPE_ONCE, "gfmo_003", MONUMENT_BUILD_OWNERSHIP );	//4番タワーを建てた 
}
function miscb_BuildMonument04()
{
	//4番タワーを建てた 
	print( "BuildM04!\n" );
	mis_1UP();
	mis_AllRevive( "gfmo_003" );
	gTState04 = 2;
}
//行きどまりトラップ処理　毒沼関連  
function miscb_TrapIn1002()
{
	//通行止め　毒沼１　城側 
	print( "TrapIn 1002!\n" );
	mis_Warp( 16452.451172, 0.000000, -1494.731445, -2.0);
}
function miscb_TrapIn1003()
{
	//通行止め　毒沼１　沼側 
	print( "TrapIn 1003!\n" );
	mis_Warp( 15740.921875, 0.000000, -3773.756836, -154.0);
}
gWarp01 <- 0; //ワープ１をすでにしているかフラグ 
function miscb_TrapIn1005()
{
	//4番タワーをこえたら毒沼へワープ。しんでない仲間も殺して転送 
	print( "TrapIn 1005!\n" );
	
	mis_BigWarp( 2544.683105, 1760.000000, 1969.708130, 0.0,   12908.477539, 500.000000, -8393.312500,-17.0 );

	if(scr_BotPlayerGetLife( 101 ) != 0 ){
		print( "warpBOt\n" );
		scr_BotPlayerSetLife( 101, 0 );
		scr_AddStandbyEnemyCallback( "miscb_BOTrespawn101_01", 101, STANDBY_COUNT_START_TIMING );
	}
	if(scr_BotPlayerGetLife( 104 ) != 0 ){
		scr_BotPlayerSetLife( 104, 0 );
		scr_AddStandbyEnemyCallback( "miscb_BOTrespawn104_01", 104, STANDBY_COUNT_START_TIMING );
	}
	if(scr_BotPlayerGetLife( 105 ) != 0 ){
		scr_BotPlayerSetLife( 105, 0 );
		suspend();
		scr_AddStandbyEnemyCallback( "miscb_BOTrespawn105_01", 105, STANDBY_COUNT_START_TIMING );
	}
	
	if(gWarp01 == 0)
	{
		scr_SetTrapInCallback( "miscb_TrapIn1013", 10013, CB_TYPE_ONCE, 1013 );		//マグマ解説  
		//配置１を全殺害しておく 
		scr_BotPlayerSetRespawnEnable( 201, false );	//トラッキングボットのリスポーンを封じる 
		scr_BotPlayerSetRespawnEnable( 202, false );	//トラッキングボットのリスポーンを封じる 
		scr_BotPlayerSetRespawnEnable( 203, false );	//トラッキングボットのリスポーンを封じる 
		scr_BotPlayerSetLife( 301, 0 );
		scr_BotPlayerSetLife( 302, 0 );
		scr_BotPlayerSetLife( 401, 0 );
		scr_BotPlayerSetLife( 402, 0 );
		scr_BotPlayerSetLife( 501, 0 );
		scr_BotPlayerSetLife( 502, 0 );
		
		scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
		scr_SetInputDisable( SCR_INPUT_CAMERA );	//移動を禁止 

		scr_ResetGameCameraDirection( 10233.072266, -5154.229980, false );
		mis_Wait( 0.6 );

		//敵配置 
		scr_BotPlayerSpawnToWorld( 303, 10734.041016, 0.000000, -6070.914063, 120.0 );	//W 
		scr_BotPlayerSpawnToWorld( 304, 8075.623047, 0.000000, -5443.991699, 120.0 );	//W 
		scr_BotPlayerSpawnToWorld( 503, 12324.863281, 0.000000, -5110.498535, 150.0 );	//M 

		mis_AppearEffect( 601, 10233.072266, 0.000000, -5154.229980, -14.0 );	//出現エフェクト 
		scr_BotPlayerSpawnToWorld( 601, 10233.072266, 0.000000, -5154.229980, 120.0 );	//バケツ 
	
		suspend();
		suspend();
		suspend();	
		mis_Wait( 0.4 );
		mis_MassageDialog( "C321_07" );	//メッセージ：バケツのキレ芸で毒沼解説 
		scr_BotPlayerSetActionTrigger( 303, true );
		scr_BotPlayerSetActionTrigger( 304, true );
		scr_BotPlayerSetActionTrigger( 503, true );
		scr_BotPlayerSetActionTrigger( 601, true );
		
		scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を許可 
		scr_SetInputEnable( SCR_INPUT_CAMERA );	//移動を許可 

	}
	gWarp01 = 1;
}
function miscb_BOTrespawn101_01()
{
	print( "respawn101\n" );
	scr_BotPlayerSpawnToWorld( 101, 13361.242188, 500.000000, -8002.933594, 0.0 );	//C 
	scr_RemoveStandbyEnemyCallback( 101 );
}
function miscb_BOTrespawn104_01()
{
	print( "respawn104\n" );
	scr_BotPlayerSpawnToWorld( 104, 12265.027344, 500.131256, -8303.057617, 0.0 );	//C 
	scr_RemoveStandbyEnemyCallback( 104 );
}
function miscb_BOTrespawn105_01()
{
	print( "respawn105\n" );
	scr_BotPlayerSpawnToWorld( 105, 13040.429688, 500.000000, -8967.266602, 0.0 );	//C 
	scr_RemoveStandbyEnemyCallback( 105 );
}
function miscb_TrapIn1012()
{
	print( "In1012\n" );
	//ワープしないで落下してクモの巣に落ちやがった馬鹿対策 
	if(gWarp01 == 0)
	{
		scr_PauseOn();	
		scr_FadeOutBlack( 0.2 );
		while( !scr_IsFadeFinish() )
		{
			suspend();
		}
		scr_PlayerWarp( 4532.869629, 1500.000000, 3280.824951 ,-124.0 );
		suspend();
		scr_ResetGameCameraBehind( true );
		scr_FadeIn( 0.2 );
		while( !scr_IsFadeFinish() ){
			suspend();
		}
		scr_PauseOff();
	}
}
function miscb_TrapIn1013()
{
	print( "In1013\n" );
	//マグマに差し掛かる。バナーさしこみ 
	mis_BannerInfoTimer("miscb_BunnerInfo0202",2.0);	//バナーを次のものに更新 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMD21091" );	//  

}
function miscb_BunnerInfo0202()
{
	//バナーインフォメーション続き 
	print( "Bunner0101!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove2",2.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMD21092" );	//  
}
function miscb_BunnerInfoRemove2()
{
	//バナーインフォメーション削除とともに敵出現 
	print( "BunnerRemoveandset04!\n" );
	scr_CloseMissionExpainText( 0 );
	
	scr_BotPlayerSpawnToWorld( 501, 2864.558838, -155.929886, 1278.807373, 0.0 );	//M 
	scr_BotPlayerSpawnToWorld( 502, 1922.078857, -100.000000, 2977.313721, 0.0 );	//M 
	scr_BotPlayerSpawnToWorld( 504, -2863.006592, -200.000000, -1110.8206, 0.0 );	//M 
	scr_BotPlayerSpawnToWorld( 505, -1722.879395, -200.000000, -2504.0371, 0.0 );	//M 
	suspend();
	suspend();
	suspend();	
	suspend();	
	scr_BotPlayerSetActionTrigger( 501, true );
	scr_BotPlayerSetActionTrigger( 502, true );
	scr_BotPlayerSetActionTrigger( 504, true );
	scr_BotPlayerSetActionTrigger( 505, true );
}
function miscb_TrapIn1006()
{
	//毒沼にサムライ出現 
	print( "TrapIn 1006!\n" );
	
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_ResetGameCameraDirection( -12519.552734, 6737.442383, false );
	mis_Wait( 0.3 );
	
	mis_AppearEffect( 602, -12519.552734, 0.000000, 6737.442383, 163.0 );	//出現エフェクト 
	scr_BotPlayerSpawnToWorld( 602, -12519.552734, 0.000000, 6737.442383, 127.0 );	//ショーグン 

	scr_BotPlayerSpawnToWorld( 301, -10127.383789, 0.000000, 5101.453125, 0.0  );	//W 
	scr_BotPlayerSpawnToWorld( 302, -12294.839844, 0.000000, 5116.889648, 0.0  );	//W 
	scr_BotPlayerSpawnToWorld( 403, -12175.860352, 500.295563, 7854.0751, 0.0 );	//C 
	scr_BotPlayerSpawnToWorld( 506, -13404.150391, 497.231781, 7471.1552, 0.0  );	//M 

	scr_SetInputEnable( SCR_INPUT_CAMERA );	//許可 

	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 301, true );
	scr_BotPlayerSetActionTrigger( 302, true );
	scr_BotPlayerSetActionTrigger( 403, true );
	scr_BotPlayerSetActionTrigger( 506, true );

	scr_BotPlayerSetRespawnEnable( 301, false );
	scr_BotPlayerSetRespawnEnable( 302, false );
	scr_BotPlayerSetRespawnEnable( 403, false );
	scr_BotPlayerSetRespawnEnable( 506, false );
	scr_BotPlayerSetRespawnEnable( 602, false );

	mis_Wait( 0.4 );
	mis_MassageDialog( "C321_10" );	//メッセージ：マグマ解説 
	scr_BotPlayerSetActionTrigger( 602, true );

}
gWarp02 <- 0;
function miscb_TrapIn1007()
{
	//橋へワープし、ワープ１を削除する。また、配置雑魚も整理。 
	if(gWarp02 == 0)
	{
		scr_RemoveScene( 502, true );
		scr_RemoveScene( 503, true );
		scr_RemoveScene( 504, true );
		scr_RemoveTrap( 1005 );
		scr_RemoveCallbackFromId( 10005 );	//ワープ１を削除 
		
		//通行止めトラップを削除 
		scr_RemoveScene( 501, true );
		scr_RemoveScene( 591, true );
		scr_RemoveTrap( 1002 );
		scr_RemoveTrap( 1003 );
		scr_RemoveCallbackFromId( 10002 );
		scr_RemoveCallbackFromId( 10003 );
		
		mis_BuildBT03();
		
	}

	//ワープ 
	mis_BigWarp( -16070.921875, 0.000000, 2904.134521, 0.0,   3232.943604, 1674.489746, 2171.961670,-120.0 );

	if(scr_BotPlayerGetLife( 101 ) != 0 ){
		print( "warpBOt\n" );
		scr_BotPlayerSetLife( 101, 0 );
		scr_AddStandbyEnemyCallback( "miscb_BOTrespawn101_02", 101, STANDBY_COUNT_START_TIMING );
	}
	if(scr_BotPlayerGetLife( 104 ) != 0 ){
		scr_BotPlayerSetLife( 104, 0 );
		scr_AddStandbyEnemyCallback( "miscb_BOTrespawn104_02", 104, STANDBY_COUNT_START_TIMING );
	}
	if(scr_BotPlayerGetLife( 105 ) != 0 ){
		scr_BotPlayerSetLife( 105, 0 );
		suspend();
		scr_AddStandbyEnemyCallback( "miscb_BOTrespawn105_02", 105, STANDBY_COUNT_START_TIMING );
	}
	
	if(gWarp02 == 0)
	{
		//配置2,4を全殺害しておく 
		scr_BotPlayerSetLife( 301, 0 );
		scr_BotPlayerSetLife( 302, 0 );
		scr_BotPlayerSetLife( 303, 0 );
		scr_BotPlayerSetLife( 304, 0 );
		scr_BotPlayerSetLife( 403, 0 );
		scr_BotPlayerSetLife( 503, 0 );
		scr_BotPlayerSetLife( 506, 0 );
		
		scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
		scr_SetInputDisable( SCR_INPUT_CAMERA );	//移動を禁止 

		scr_ResetGameCameraDirection( 289.330353,  454.061768, false );
		mis_Wait( 0.6 );

		mis_AppearEffect( 603, 289.330353, 1950.000000, 454.061768, -14.0 );	//出現エフェクト 
		scr_BotPlayerSpawnToWorld( 603, 289.330353, 1950.000000, 454.061768, 40.0 );	//バケツ 
		mis_Wait( 0.4 );
		mis_MassageDialog( "C321_12" );	//メッセージ：おちたらヤバイ 


		//敵配置 
		scr_BotPlayerSetRespawnEnable( 201, true );
		scr_BotPlayerSetRespawnEnable( 202, true );
		scr_BotPlayerSetRespawnEnable( 203, true );

		scr_BotPlayerSpawnToMonument( 201, "gfmo_005" );
		scr_BotPlayerSpawnToMonument( 202, "gfmo_005" );
		scr_BotPlayerSpawnToMonument( 203, "gfmo_005" );

		scr_BotPlayerSpawnToWorld( 401, 1578.095459, 1760.000000, 1562.736084, 40.0 );	//C 
		scr_BotPlayerSpawnToWorld( 402, 1303.003174, 1760.000000, 1995.973145, 40.0 );	//C 
		scr_BotPlayerSpawnToWorld( 507, -1588.414185, 1760.000000, -1592.1179, 150.0 );	//M 
		scr_BotPlayerSpawnToWorld( 508, -1242.273315, 1760.000000, -2156.9377, 150.0 );	//M 
	
		suspend();
		suspend();
		suspend();	
		scr_BotPlayerSetActionTrigger( 401, true );
		scr_BotPlayerSetActionTrigger( 402, true );
		scr_BotPlayerSetActionTrigger( 507, true );
		scr_BotPlayerSetActionTrigger( 508, true );
		scr_BotPlayerSetActionTrigger( 603, true );

		
		scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を許可 
		scr_SetInputEnable( SCR_INPUT_CAMERA );	//移動を許可 
	}
	
	gWarp02 = 1;
}
function miscb_BOTrespawn101_02()
{
	print( "respawn101\n" );
	scr_BotPlayerSpawnToWorld( 101, 4251.659668, 1500.000000, 3315.070801, 0.0 );	//C 
	scr_RemoveStandbyEnemyCallback( 101 );
}
function miscb_BOTrespawn104_02()
{
	print( "respawn104\n" );
	scr_BotPlayerSpawnToWorld( 104, 4505.953613, 1500.000000, 2883.260986, 0.0 );	//C 
	scr_RemoveStandbyEnemyCallback( 104 );
}
function miscb_BOTrespawn105_02()
{
	print( "respawn105\n" );
	scr_BotPlayerSpawnToWorld( 105, 4214.319336, 1600.000000, 2370.943115, 0.0 );	//C 
	scr_RemoveStandbyEnemyCallback( 105 );
}
function miscb_BreakMonument03()
{
	print( "BreakM03!\n" );
	//3番タワーを破壊した 
	gTState03 = 3;
	scr_SetBuildMonumentCallback( "miscb_BuildMonument03", 21003, CB_TYPE_ONCE, "gfmo_005", MONUMENT_BUILD_OWNERSHIP );	//3番タワーを建てた 
}
function miscb_BuildMonument03()
{
	//3番タワーを建てた 
	print( "BuildM03!\n" );
	mis_1UP();
	mis_AllRevive( "gfmo_005" );
	gTState03 = 2;
}
function miscb_TrapIn1008()
{
	print( "TrapIn 1013!\n" );
	//大階段おくに到達。ダークナイト召喚  

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 10 );
	scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_BLACK );
	scr_SetBreakMonumentCallback( "miscb_BreakMonument01", 20001, CB_TYPE_ONCE, "gfmo_002" );

	scr_BotPlayerSpawnToMonument( 201, "gfmo_002" );
	scr_BotPlayerSpawnToMonument( 202, "gfmo_002" );
	scr_BotPlayerSpawnToMonument( 203, "gfmo_002" );

	scr_BotPlayerSpawnToWorld( 301, -11131.955078, 0.000000, -3537.359375, 90.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 302, -11147.863281, 0.000000, -2259.958496, 90.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 501, -14102.953125, 523.784424, -815.435181, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 506, -14288.966797, 523.784668, -5896.869629, 0.0 );	//MOBs 


	scr_AddTargetEnemyCallback( "miscb_KillBot604", 604, "$TXHFI32101" );
	mis_AppearEffect( 604, -13200.050781, 0.000000, -3232.565430, 94.0 );	//出現エフェクト 
	scr_BotPlayerSpawnToWorld( 604, -13200.050781, 0.000000, -3232.565430, 94.0 );	//暗黒騎士 

	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 301, true );
	scr_BotPlayerSetActionTrigger( 302, true );
	scr_BotPlayerSetActionTrigger( 501, true );
	scr_BotPlayerSetActionTrigger( 506, true );

	mis_Wait( 0.2 );
	scr_BotPlayerSetRespawnEnable( 201, true );
	scr_BotPlayerSetRespawnEnable( 202, true );
	scr_BotPlayerSetRespawnEnable( 203, true );

	mis_Wait( 0.4 );
	mis_MassageDialog( "C321_14" );	//メッセージ：ダークナイト  
	scr_BotPlayerSetActionTrigger( 604, true );
	scr_AddTargetEnemyCallback( "miscb_KillBot605", 605, "$TXHFI21301" );
}
function miscb_KillBot604()
{
	print( "kill604!\n" );
	mis_Wait( 0.4 );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMD21151" );	//  

}
function miscb_BreakMonument01()
{
	print( "BreakM01!\n" );
	scr_SetBuildMonumentCallback( "miscb_BuildMonument01", 21001, CB_TYPE_ONCE, "gfmo_002", MONUMENT_BUILD_OWNERSHIP );
}
function miscb_BuildMonument01()
{
	print( "BuildM02!\n" );
	mis_1UP();
	mis_AllRevive( "gfmo_002" );
}
function miscb_TrapIn1009()
{
	//敵城付近まで来たらワープ２を削除 
	
	scr_RemoveScene( 505, true );
	scr_RemoveTrap( 1007 );
	scr_RemoveCallbackFromId( 10007 );	//ワープ2を削除する 

}
gAtButler <- 0;	//進行度フラグ。達成条件切り替えに使う。1=バトラーに会いました 
function miscb_TrapIn1010()
{
	print( "TrapIn 1010!\n" );
	//敵城に到達。執事の警護召喚 

	scr_BotPlayerSpawnToWorld( 303, -18933.199219, 0.000000, -2735.897461, 89.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 304, -18925.599609, 0.000000, -3322.043213, 89.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 403, -19357.750000, 0.000000, -2538.324707, 89.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 404, -19345.035156, 0.000000, -3516.748047, 89.0 );	//MOBs 
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 303, true );
	scr_BotPlayerSetActionTrigger( 304, true );
	scr_BotPlayerSetActionTrigger( 403, true );
	scr_BotPlayerSetActionTrigger( 404, true );

	mis_Wait( 1.0 );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C321_16" );
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
	scr_OpenDialog( 0, "C321_19" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
	
	gAtButler = 1;
//	scr_OpenMissionConditionText(  0, "$TXHFC32102" );	//達成条件を表示 
	scr_OpenMissionConditionText1(  0, "TXHFC06103", gRemainedRespawn );	//バトラー倒せ 

}
function miscb_BotDead605()
{
	print( "deadbos!\n" );
	scr_RemoveCallbackAll();
	scr_GameSetMissionSuccess();

	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	scr_BotPlayerSetLife( 201, 0 );
	scr_BotPlayerSetLife( 202, 0 );
	scr_BotPlayerSetLife( 203, 0 );
	scr_BotPlayerSetLife( 301, 0 );
	scr_BotPlayerSetLife( 302, 0 );
	scr_BotPlayerSetLife( 303, 0 );
	scr_BotPlayerSetLife( 304, 0 );
	scr_BotPlayerSetLife( 401, 0 );
	scr_BotPlayerSetLife( 402, 0 );
	scr_BotPlayerSetLife( 403, 0 );
	scr_BotPlayerSetLife( 404, 0 );
	scr_BotPlayerSetLife( 501, 0 );
	scr_BotPlayerSetLife( 502, 0 );
	scr_BotPlayerSetLife( 503, 0 );
	scr_BotPlayerSetLife( 504, 0 );
	scr_BotPlayerSetLife( 505, 0 );
	scr_BotPlayerSetLife( 506, 0 );
	scr_BotPlayerSetLife( 507, 0 );
	scr_BotPlayerSetLife( 508, 0 );
	scr_BotPlayerSetLife( 601, 0 );
	scr_BotPlayerSetLife( 602, 0 );
	scr_BotPlayerSetLife( 603, 0 );
	scr_BotPlayerSetLife( 604, 0 );

	mis_Wait( 1.6 );
	mis_MassageDialog( "C321_17" );	//メッセージ： 

}
function miscb_KillBot605()
{
	print( "killbos!\n" );
}



function mis_RespawnWithPlayerSally()
{
	print( "revive friend!\n" );
	//プレイヤーが最出撃した際に同時に仲間も復活させる 
	
	//最出撃したか？ 
	if(gRespawnFriendChance == 1)
	{	
		//プレイヤーが出撃した場所によって仲間の出撃先を分岐 
		if(gRespawnFriendPoint == 0)
		{
			scr_BotPlayerSpawnToMonument( 101, "gcmoA_001" );	//城 
			scr_BotPlayerSpawnToMonument( 104, "gcmoA_001" );
			scr_BotPlayerSpawnToMonument( 105, "gcmoA_001" );
		}
		if(gRespawnFriendPoint == 1)
		{
			scr_BotPlayerSpawnToMonument( 101, "gfmo_002" );	//T1 
			scr_BotPlayerSpawnToMonument( 104, "gfmo_002" );
			scr_BotPlayerSpawnToMonument( 105, "gfmo_002" );
		}
		if(gRespawnFriendPoint == 2)
		{
			scr_BotPlayerSpawnToMonument( 101, "gfmo_001" );	//T2 
			scr_BotPlayerSpawnToMonument( 104, "gfmo_001" );
			scr_BotPlayerSpawnToMonument( 105, "gfmo_001" );
		}
		if(gRespawnFriendPoint == 3)
		{
			scr_BotPlayerSpawnToMonument( 101, "gfmo_005" );	//T3 
			scr_BotPlayerSpawnToMonument( 104, "gfmo_005" );
			scr_BotPlayerSpawnToMonument( 105, "gfmo_005" );
		}
		if(gRespawnFriendPoint == 4)
		{
			scr_BotPlayerSpawnToMonument( 101, "gfmo_003" );	//T4 
			scr_BotPlayerSpawnToMonument( 104, "gfmo_003" );
			scr_BotPlayerSpawnToMonument( 105, "gfmo_003" );
		}
		if(gRespawnFriendPoint == 5)
		{
			scr_BotPlayerSpawnToMonument( 101, "gfmo_004" );	//T5 
			scr_BotPlayerSpawnToMonument( 104, "gfmo_004" );
			scr_BotPlayerSpawnToMonument( 105, "gfmo_004" );
		}
	}
	gRespawnFriendChance = 0;
}
gRespawnFriendChance <- 0;
gRespawnFriendPoint <- 0;
function miscb_TrapIn5500()
{
	print( "in5500!\n" );
	//復活場所指定変数変更 
	gRespawnFriendPoint = 0;
	mis_RespawnWithPlayerSally();
}
function miscb_TrapIn5505()
{
	print( "in5505!\n" );
	//復活場所指定変数変更 
	gRespawnFriendPoint = 5;
	mis_RespawnWithPlayerSally();
}
function miscb_TrapIn5504()
{
	print( "in5504!\n" );
	//復活場所指定変数変更 
	gRespawnFriendPoint = 4;
	mis_RespawnWithPlayerSally();
}
function miscb_TrapIn5503()
{
	print( "in5503!\n" );
	//復活場所指定変数変更 
	gRespawnFriendPoint = 3;
	mis_RespawnWithPlayerSally();
}
function miscb_TrapIn5502()
{
	print( "in5502!\n" );
	//復活場所指定変数変更 
	gRespawnFriendPoint = 2;
	mis_RespawnWithPlayerSally();
}
function miscb_TrapIn5501()
{
	print( "in5501!\n" );
	//復活場所指定変数変更 
	gRespawnFriendPoint = 1;
	mis_RespawnWithPlayerSally();
}
