///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_on_0302\mission02.nut 
//	概要	：オフラインキャンペーン レベル3 キャンペーン2 ミッション3 
//	作成	：落合 
//	作成日	：110606 
//	目的	：［宝探し］本物の姫様を探せ 
//
///////////////////////////////////////////////////////////////////////////////////////////////
function loadMission() 
{
	print("[sample mission] load()\n");
//ミッションのステージを読み込む前の処理を設定しよう！ 
	scr_SetDisableGimmickType( GIMMICK_CANNON );
	scr_SetDisableGimmickType( GIMMICK_BALLISTA );
	scr_SetDisableGimmickType( GIMMICK_LADDER );
	scr_SetDisableGimmickType( GIMMICK_BATTERING_RAM );
	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );
}
///////////////////////////////////
//汎用ファンクション 
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
///////////////////////////////////
function startMission() 
{
	scr_SetDisableTacticalInfomation();
	print("[sample mission] start()\n");
	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );


//Bot登録 
	scr_BotPlayerRegistAndCreate( 201, "PRINCESS_DUM01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 202, "PRINCESS_DUM02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "PRINCESS_DUM03", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 204, "PRINCESS_DUM04", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 205, "PRINCESS_DUM05", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 206, "PRINCESS_DUM06", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 207, "PRINCESS_DUM07", POWER_COLOR_BLACK );

	scr_BotPlayerRegistAndCreate( 208, "BUTLER03", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 209, "DEVIL_PRINCE02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 210, "PRINCESS", POWER_COLOR_BLACK );

	scr_BotPlayerRegistAndCreate( 211, "MOB02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 212, "MOB02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 213, "MOB02", POWER_COLOR_BLACK );

//コールバックの設定をしておくよ！ 
	scr_SetMessageCallback( "miscb_PlayerSally_First", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );		//初回出撃した時のコールバック 
	scr_SetMessageCallback( "miscb_TimeOver", 2, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );		//タイムオーバー時 

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


//トラップ登録 
	scr_RegistTrapBox( 1001,  -26477.5, 3000.0, -5038.6, 676.9, 1000.0, 524.7, -26.5  );	//敵の城 
	scr_SetTrapInCallback( "miscb_TrapIn1001", 10001, CB_TYPE_ALWAYS, 1001 );	

	//開戦前メッセージ 
	mis_Wait( 0.45 );
	mis_MassageDialog( "C323_01" );	//メッセージ： 

	scr_SetTimerCallback( "miscb_HintMassage", 3, CB_TYPE_ONCE, 90.0 );


	scr_OpenMissionConditionText(  0, "TXHFC06301" );	//姫探せ 

	mis_WaitPlayerCreate();
	scr_PlayerSetForceRespawnPosition( 26798.957031, 2974.854736, 6928.67, -114.0 );	//プレイヤーの出現位置を固定 


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
function miscb_HintMassage()
{
	print( "hint!\n" );

	mis_BannerInfoTimer("miscb_BunnerInfo0102",3.0);	//バナーを次のものに更新 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMD23191" );	//  

//	if(gPset_num == 1)
//	{
//		mis_MassageDialog( "C323_19" );	//メッセージ： 
//	}
//	else
//	{
//		mis_MassageDialog( "C323_20" );	//メッセージ： 
//	}
}
function miscb_BunnerInfo0102()
{
	//バナーインフォメーション続き 
	print( "Bunner0102!\n" );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",5.0);	//バナーを削除する 

	if(gPset_num == 1)
	{
		scr_OpenMissionExpainText( 0, "#TXCMD23192" );	//  
	}
	else
	{
		scr_OpenMissionExpainText( 0, "#TXCMD23201" );	//  
	}
}
function mis_SetDummy( regist_id, TrapF_id, TrapN_id, x1, y1, z1, r1)
{
	print( "Setdum!\n" );
	scr_BotPlayerSpawnToWorld( regist_id, x1, y1, z1, r1 );	//MOBs 
	scr_RegistTrapSphere( TrapF_id, x1, y1, z1, 2500.0 );
	scr_RegistTrapSphere( TrapN_id, x1, y1, z1, 800.0 );
}
function mis_SetDummyRand( regist_id, TrapF_id, TrapN_id, x1, y1, z1, r1, x2, y2, z2, r2, x3, y3, z3, r3 )
{
	print( "SetRandom!\n" );
	local set_num = 0;
	set_num = scr_GetRandI( 1, 3 );	//ランダムでセットポジションを指定する 

	if(set_num == 1)
	{
		scr_BotPlayerSpawnToWorld( regist_id, x1, y1, z1, r1 );	//MOBs 
		scr_RegistTrapSphere( TrapF_id, x1, y1, z1, 2500.0 );
		scr_RegistTrapSphere( TrapN_id, x1, y1, z1, 800.0 );
	}
	if(set_num == 2)
	{
		scr_BotPlayerSpawnToWorld( regist_id, x2, y2, z2, r2 );	//MOBs 
		scr_RegistTrapSphere( TrapF_id, x2, y2, z2, 2500.0 );
		scr_RegistTrapSphere( TrapN_id, x2, y2, z2, 800.0 );
	}
	if(set_num == 3)
	{
		scr_BotPlayerSpawnToWorld( regist_id, x3, y3, z3, r3 );	//MOBs 
		scr_RegistTrapSphere( TrapF_id, x3, y3, z3, 2500.0 );
		scr_RegistTrapSphere( TrapN_id, x3, y3, z3, 800.0 );
	}
}
gPset_num <- 0;	//魔王の位置判定に使う 
function mis_SetPrincessRand( regist_id, TrapF_id, TrapN_id, TrapS_id, x1, y1, z1, r1, x2, y2, z2, r2, x3, y3, z3, r3 )
{
	print( "SetPrincess!\n" );
	gPset_num = scr_GetRandI( 1, 3 );	//ランダムでセットポジションを指定する 

	if(gPset_num == 1)
	{
		scr_BotPlayerSpawnToWorld( regist_id, x1, y1, z1, r1 );	//
		scr_RegistTrapSphere( TrapF_id, x1, y1, z1, 5100.0 );
		scr_RegistTrapSphere( TrapN_id, x1, y1, z1, 1200.0 );
		scr_RegistTrapSphere( TrapS_id, x1, y1, z1,  300.0 );
	}
	if(gPset_num == 2)
	{
		scr_BotPlayerSpawnToWorld( regist_id, x2, y2, z2, r2 );
		scr_RegistTrapSphere( TrapF_id, x2, y2, z2,  5100.0 );
		scr_RegistTrapSphere( TrapN_id, x2, y2, z2,  1200.0 );
		scr_RegistTrapSphere( TrapS_id, x2, y2, z2,   300.0 );
	}
	if(gPset_num == 3)
	{
		scr_BotPlayerSpawnToWorld( regist_id, x3, y3, z3, r3 );
		scr_RegistTrapSphere( TrapF_id, x3, y3, z3,  5100.0 );
		scr_RegistTrapSphere( TrapN_id, x3, y3, z3,  1200.0 );
		scr_RegistTrapSphere( TrapS_id, x3, y3, z3,   300.0 );
	}
	scr_BotPlayerSetLifeRecover( regist_id, false );
}
//ゲーム開始を待つ処理 
function mis_WaitGameStart()
{
	while( GAME_STATE_PLAYING != scr_GetGamePlayingStatus() )	//もし（）内の条件が満たされている時以下の処理を繰り返し実行する
	{
		local state;						//ローカル変数（一度結果が帰ったら忘れる関数）を設定する 
		state = GetGamePlayingStatus();				//変数に関数の結果の値（戻り値）を代入する 
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );	//デバッグログに変数を表示する 
		suspend();	
	}
	//固定配置セット 
	mis_SetDummy( 201, 501, 601, 22254.3, 3174.8, 6617.4, 103.0);
	mis_SetDummy( 202, 502, 602, -163.1, 1554.1, -8924.9, -178.0);
	mis_SetDummy( 203, 503, 603, -17.2, 143.3, -2170.1, -179.0);
	//ランダムでダミーをセット 
	mis_SetDummyRand( 204, 504, 604,  -1204.5, 2.2, 3788.0, -178.0,  77.8, -81.9, 3267.3, -179.0,  2587.9, 2.2, 4213.8, -179.0 );
	mis_SetDummyRand( 205, 505, 605,  2492.4, 38.0, -1685.2, 35.0,  -2663.7, 38.0, -1753.6, 144.0,  -1371.9, 113.8, -3817.3, 17.0 );
	mis_SetDummyRand( 206, 506, 606,  -20348.9, 3175.7, -3879.9, 24.0,  -22247.2, 2975.7, -2990.0, 62.0,  -18316.5, 3951.7, -1719.3, -113.0 );
	mis_SetDummyRand( 207, 507, 607, -4391.9, 2.2, 1559.1, 101.0,  -13315.3, 2970.1, -690.9, -157.0,  -15925.9, 3992.3, -4434.1, -102.0 );
	//ランダムで本物をセット 
	mis_SetPrincessRand( 210, 508, 608, 700, -24724.1, 2975.7, -6900.5, 70.0,  3447.9, 2346.5, -9501.1, -118.0,  8656.4, -611.3, 2869.8, -95.0 );

	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );
	scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_BLACK );
	scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );
}
////////////////////////////////////////////////
// ここからはコールバック処理 
////////////////////////////////////////////////
//プレイヤーが出撃した時のコールバック処理
function miscb_PlayerSally_First()
{
	print( "Player is sally!\n" );

//	scr_OpenMissionConditionText(  0, "$TXHFC32301" );	//達成条件を表示 
//	scr_OpenMissionStateText(  0, "$TXHFS32301" );	//達成状況を表示 

	//カメラを寄りの背後視点に変更 
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( false );


	scr_BotPlayerSpawnToMonument( 211, "gfmo_001" );
	scr_BotPlayerSpawnToMonument( 212, "gfmo_001" );
	scr_BotPlayerSpawnToMonument( 213, "gfmo_001" );

	scr_BotPlayerSetActionTrigger( 211, true );
	scr_BotPlayerSetActionTrigger( 212, true );
	scr_BotPlayerSetActionTrigger( 213, true );

	scr_SetTimerCallback( "miscb_DamageCheckPrincess", 1233, CB_TYPE_ONCE, 4.0 );

//トラップコールバック 
	scr_SetTrapInCallback( "miscb_TrapIn501", 5001, CB_TYPE_ALWAYS, 501 );	
	scr_SetTrapInCallback( "miscb_TrapIn502", 5002, CB_TYPE_ALWAYS, 502 );	
	scr_SetTrapInCallback( "miscb_TrapIn503", 5003, CB_TYPE_ALWAYS, 503 );	
	scr_SetTrapInCallback( "miscb_TrapIn504", 5004, CB_TYPE_ALWAYS, 504 );	
	scr_SetTrapInCallback( "miscb_TrapIn505", 5005, CB_TYPE_ALWAYS, 505 );	
	scr_SetTrapInCallback( "miscb_TrapIn506", 5006, CB_TYPE_ALWAYS, 506 );	
	scr_SetTrapInCallback( "miscb_TrapIn507", 5007, CB_TYPE_ALWAYS, 507 );	
	scr_SetTrapInCallback( "miscb_TrapIn508", 5008, CB_TYPE_ALWAYS, 508 );	

	scr_SetTrapOutCallback( "miscb_TrapOut501", 5101, CB_TYPE_ALWAYS, 501 );	
	scr_SetTrapOutCallback( "miscb_TrapOut502", 5102, CB_TYPE_ALWAYS, 502 );	
	scr_SetTrapOutCallback( "miscb_TrapOut503", 5103, CB_TYPE_ALWAYS, 503 );	
	scr_SetTrapOutCallback( "miscb_TrapOut504", 5104, CB_TYPE_ALWAYS, 504 );	
	scr_SetTrapOutCallback( "miscb_TrapOut505", 5105, CB_TYPE_ALWAYS, 505 );	
	scr_SetTrapOutCallback( "miscb_TrapOut506", 5106, CB_TYPE_ALWAYS, 506 );	
	scr_SetTrapOutCallback( "miscb_TrapOut507", 5107, CB_TYPE_ALWAYS, 507 );	
	scr_SetTrapOutCallback( "miscb_TrapOut508", 5108, CB_TYPE_ALWAYS, 508 );	

	scr_SetTrapInCallback( "miscb_TrapIn601", 6001, CB_TYPE_ONCE, 601 );	
	scr_SetTrapInCallback( "miscb_TrapIn602", 6002, CB_TYPE_ONCE, 602 );	
	scr_SetTrapInCallback( "miscb_TrapIn603", 6003, CB_TYPE_ONCE, 603 );	
	scr_SetTrapInCallback( "miscb_TrapIn604", 6004, CB_TYPE_ONCE, 604 );	
	scr_SetTrapInCallback( "miscb_TrapIn605", 6005, CB_TYPE_ONCE, 605 );	
	scr_SetTrapInCallback( "miscb_TrapIn606", 6006, CB_TYPE_ONCE, 606 );	
	scr_SetTrapInCallback( "miscb_TrapIn607", 6007, CB_TYPE_ONCE, 607 );	
	scr_SetTrapInCallback( "miscb_TrapIn608", 6008, CB_TYPE_ONCE, 608 );	


	//殺害時にトラップを削除するコールバック 
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap01", 201, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap02", 202, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap02", 202, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap03", 203, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap04", 204, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap05", 205, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap06", 206, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_killBotRemoveTrap07", 207, STANDBY_COUNT_START_TIMING );
}
function mis_RemoveTrap( TrapF_id, TrapN_id )
{
	scr_RemoveTrap( TrapF_id );
	scr_RemoveTrap( TrapN_id );
	scr_ClearTargetEnemyCallback();
}
function miscb_killBotRemoveTrap01()
{
	print( "cleartrap01!\n" );
	mis_RemoveTrap( 501, 601 );
}
function miscb_killBotRemoveTrap02()
{
	print( "cleartrap02!\n" );
	mis_RemoveTrap( 502, 602 );
}
function miscb_killBotRemoveTrap03()
{
	print( "cleartrap03!\n" );
	mis_RemoveTrap( 503, 603 );
}
function miscb_killBotRemoveTrap04()
{
	print( "cleartrap04!\n" );
	mis_RemoveTrap( 504, 604 );
}
function miscb_killBotRemoveTrap05()
{
	print( "cleartrap05!\n" );
	mis_RemoveTrap( 505, 605 );
}
function miscb_killBotRemoveTrap06()
{
	print( "cleartrap06!\n" );
	mis_RemoveTrap( 506, 606 );
}
function miscb_killBotRemoveTrap07()
{
	print( "cleartrap07!\n" );
	mis_RemoveTrap( 507, 607 );
}
function miscb_DamageCheckPrincess()
{
	print( "princess is safe!\n" );
	scr_RemoveCallbackFromId( 1233 );
	scr_SetTimerCallback( "miscb_DamageCheckPrincess", 1233, CB_TYPE_ONCE, 4.0 );
	if(scr_BotPlayerGetLifeRate( 210 ) <= 0.999 )
	{
		mis_MassageDialog( "C323_02" );	//メッセージ： 
		scr_RemoveCallbackAll();
		scr_CloseMissionExpainText( 0 );
		scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
		scr_CloseMissionStateText( 0 );	//達成状況を非表示 
		scr_GameSetMissionFailure();	//ミッション失敗 
	}
}
function miscb_TimeOver()
{
	print( "TimeOver!\n" );
	
	mis_Wait( 0.5 );
	
	mis_MassageDialog( "C323_03" );	//メッセージ： 
	scr_RemoveCallbackAll();
	scr_GameSetMissionFailure();	//ミッション失敗 

}
function miscb_TrapIn1001()
{
	print( "TrapIn 1001!\n" );
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C323_04" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	mis_Warp();
	scr_PauseOff();
}
function mis_Warp()
{
	scr_FadeOutBlack( 0.4 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
	scr_PlayerWarp( 26928.962891, 2974.854736, 6991.894531, -117.0 );
	suspend();
	scr_ResetGameCameraBehind( true );
	scr_FadeIn( 0.4 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
}
function killBOTprincess()
{
	print( "dummy!\n" );
}
function mis_TrapOut(regist_id)
{
	print( "TrapOut!\n" );
	scr_RemoveTargetEnemyCallback( regist_id );
}
function miscb_TrapOut501()
{
	print( "TrapOut501!\n" );
	scr_RemoveTargetEnemyCallback( 201 );
}
function miscb_TrapOut502()
{
	print( "TrapOut502!\n" );
	scr_RemoveTargetEnemyCallback( 202 );
}
function miscb_TrapOut503()
{
	print( "TrapOut503!\n" );
	scr_RemoveTargetEnemyCallback( 203 );
}
function miscb_TrapOut504()
{
	print( "TrapOut504!\n" );
	scr_RemoveTargetEnemyCallback( 204 );
}
function miscb_TrapOut505()
{
	print( "TrapOut505!\n" );
	scr_RemoveTargetEnemyCallback( 205 );
}
function miscb_TrapOut506()
{
	print( "TrapOut506!\n" );
	scr_RemoveTargetEnemyCallback( 206 );
}
function miscb_TrapOut507()
{
	print( "TrapOut507!\n" );
	scr_RemoveTargetEnemyCallback( 207 );
}
function miscb_TrapOut508()
{
	print( "TrapOut508!\n" );
	scr_RemoveTargetEnemyCallback( 210 );
}
function miscb_TrapIn501()
{
	print( "TrapIn 501!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 201, "PRINCESS ?");
}
function mis_DummyReaction( regist_id, CB_id_01, CB_id_02 )
{
	print( "dummy is Active!\n" );
	scr_RemoveTargetEnemyCallback( regist_id );
	scr_RemoveCallbackFromId( CB_id_01 );
	scr_RemoveCallbackFromId( CB_id_02 );

	mis_CaughtDummy();

	scr_BotPlayerSetActionTrigger( regist_id, true );
}
function miscb_TrapIn601()
{
	print( "TrapIn 601!\n" );
	mis_DummyReaction( 201, 5001, 5101 );
}
function miscb_TrapIn502()
{
	print( "TrapIn 502!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 202, "PRINCESS ?");
}
function miscb_TrapIn602()
{
	print( "TrapIn 602!\n" );
	mis_DummyReaction( 202, 5002, 5102 );
}
function miscb_TrapIn503()
{
	print( "TrapIn 503!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 203, "PRINCESS ?");
}
function miscb_TrapIn603()
{
	print( "TrapIn 603!\n" );
	mis_DummyReaction( 203, 5003, 5103 );
}
function miscb_TrapIn504()
{
	print( "TrapIn 504!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 204, "PRINCESS ?");
}
function miscb_TrapIn604()
{
	print( "TrapIn 604!\n" );
	mis_DummyReaction( 204, 5004, 5104 );
}
function miscb_TrapIn505()
{
	print( "TrapIn 505!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 205, "PRINCESS ?");
}
function miscb_TrapIn605()
{
	print( "TrapIn 605!\n" );
	mis_DummyReaction( 205, 5005, 5105 );
}
function miscb_TrapIn506()
{
	print( "TrapIn 506!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 206, "PRINCESS ?");
}
function miscb_TrapIn606()
{
	print( "TrapIn 606!\n" );
	mis_DummyReaction( 206, 5006, 5106 );
}
function miscb_TrapIn507()
{
	print( "TrapIn 507!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 207, "PRINCESS ?");
}
function miscb_TrapIn607()
{
	print( "TrapIn 607!\n" );
	mis_DummyReaction( 207, 5007, 5107 );
}
gCaughtDummyCount <- 0;
function mis_CaughtDummy()
{
	print( "Dumm!\n" );
	gCaughtDummyCount = (gCaughtDummyCount + 1 );
	if(gCaughtDummyCount == 1 )
	{
//		mis_MassageDialog( "C323_05" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23051" );	//  
	}
	if(gCaughtDummyCount == 2 )
	{
//		mis_MassageDialog( "C323_06" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23061" );	//  
	}
	if(gCaughtDummyCount == 3 )
	{
//		mis_MassageDialog( "C323_07" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23071" );	//  
	}
	if(gCaughtDummyCount == 4 )
	{
//		mis_MassageDialog( "C323_08" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23081" );	//  
	}
	if(gCaughtDummyCount == 5 )
	{
//		mis_MassageDialog( "C323_09" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23091" );	//  
	}
	if(gCaughtDummyCount == 6 )
	{
//		mis_MassageDialog( "C323_10" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23101" );	//  
	}
	if(gCaughtDummyCount == 7 )
	{
//		mis_MassageDialog( "C323_11" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",4.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23111" );	//  
	}
}
function miscb_TrapIn508()
{
	print( "TrapIn 508!\n" );
	scr_AddTargetEnemyCallback( "killBOTprincess", 210, "PRINCESS ?");
}
function miscb_TrapIn608()
{
	print( "TrapIn 608!\n" );
	scr_RemoveCallbackFromId( 3 );

	scr_ClearTargetEnemyCallback();
	scr_AddTargetEnemyCallback( "killBOTprincess", 210, "PRINCESS");
	scr_RemoveCallbackFromId( 5008 );
	scr_RemoveCallbackFromId( 5108 );
	scr_RemoveCallbackFromId( 5001 );
	scr_RemoveCallbackFromId( 5101 );
	scr_RemoveCallbackFromId( 5002 );
	scr_RemoveCallbackFromId( 5102 );
	scr_RemoveCallbackFromId( 5003 );
	scr_RemoveCallbackFromId( 5103 );
	scr_RemoveCallbackFromId( 5004 );
	scr_RemoveCallbackFromId( 5104 );
	scr_RemoveCallbackFromId( 5005 );
	scr_RemoveCallbackFromId( 5105 );
	scr_RemoveCallbackFromId( 5006 );
	scr_RemoveCallbackFromId( 5106 );
	scr_RemoveCallbackFromId( 5007 );
	scr_RemoveCallbackFromId( 5107 );

	scr_RemoveCallbackFromId( 6001 );
	scr_RemoveCallbackFromId( 6002 );
	scr_RemoveCallbackFromId( 6003 );
	scr_RemoveCallbackFromId( 6004 );
	scr_RemoveCallbackFromId( 6005 );
	scr_RemoveCallbackFromId( 6006 );
	scr_RemoveCallbackFromId( 6007 );


	scr_BotPlayerSetLife( 201, 0 );
	scr_BotPlayerSetLife( 202, 0 );
	scr_BotPlayerSetLife( 203, 0 );
	scr_BotPlayerSetLife( 204, 0 );
	scr_BotPlayerSetLife( 205, 0 );
	scr_BotPlayerSetLife( 206, 0 );
	scr_BotPlayerSetLife( 207, 0 );

	scr_BotPlayerSetLife( 211, 0 );
	scr_BotPlayerSetLife( 212, 0 );
	scr_BotPlayerSetLife( 213, 0 );
	scr_BotPlayerSetRespawnEnable( 211, false );
	scr_BotPlayerSetRespawnEnable( 212, false );
	scr_BotPlayerSetRespawnEnable( 213, false );


	mis_MassageDialog( "C323_12" );	//メッセージ： 


	if(gPset_num == 1)
	{
		scr_BotPlayerSpawnToWorld( 208, -24408.5, 2975.7, -7020.1, 70.0 );	//魔王と執事 
		scr_BotPlayerSpawnToWorld( 209, -24393.4, 2975.7, -6713.1, 70.0 );
	}
	if(gPset_num == 2)
	{
		scr_BotPlayerSpawnToWorld( 208, 3041.1, 2306.4, -9443.6, -118.0 );	//魔王と執事 
		scr_BotPlayerSpawnToWorld( 209, 3260.4, 2306.4, -9844.8, -118.0 );
	}
	if(gPset_num == 3)
	{
		scr_BotPlayerSpawnToWorld( 208, 8259.7, -701.8, 2998.3, -95.0 );	//魔王と執事 
		scr_BotPlayerSpawnToWorld( 209, 8310.3, -701.8, 2746.6, -95.0 );
	}

	suspend();
	scr_BotPlayerSetActionTrigger( 208, true );
	scr_BotPlayerSetActionTrigger( 209, true );


	scr_OpenMissionConditionText(  0, "TXHFC06302" );	//魔王をぶっころせ 

	scr_SetTimerCallback( "miscb_DeadCheck", 1234, CB_TYPE_ONCE, 2.0 );
}
gDeadBUTLER <- 0;
gDeadPRINCE <- 0;
function miscb_DeadCheck()
{
	print( "DeadcheckBUTLER!\n" );
	scr_SetTimerCallback( "miscb_DeadCheck", 1234, CB_TYPE_ONCE, 2.0 );
	if(gDeadBUTLER == 0 ){
		if(scr_BotPlayerGetLife( 208 ) == 0 )
		{
		gDeadBUTLER = 1;
		
//		mis_MassageDialog( "C323_13" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23131" );	//  

		
		}
	}
	if(gDeadPRINCE == 0 ){
		if(scr_BotPlayerGetLife( 209 ) == 0 )
		{
		gDeadPRINCE = 1;
		
//		mis_MassageDialog( "C323_14" );	//メッセージ： 
		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXCMD23141" );	//  
		}
	}
	if(gDeadBUTLER == 1)
	{
		if(gDeadPRINCE == 1)
		{
		scr_RemoveCallbackFromId( 1234 );
		scr_RemoveCallbackFromId( 2 );
		scr_SetTrapInCallback( "miscb_TrapIn700",7000, CB_TYPE_ONCE, 700 );	

//		scr_OpenMissionStateText(  0, "$TXHFS32303" );	//達成状況を更新 
		scr_OpenMissionConditionText(  0, "TXHFC06303" );	//ミイラをぶっころせ 
		
		mis_MassageDialog( "C323_15" );	//メッセージ： 
		
		}
	}
}
function miscb_TrapIn700()
{
	print( "TrapIn 700!\n" );

	if(scr_BotPlayerGetLifeRate( 210 ) <= 0.998 )
	{
		miscb_DamageCheckPrincess();	//姫様が生きてるかチェック 
	}
	else
	{
		scr_RemoveCallbackAll();
		scr_GameSetMissionSuccess();
		scr_CloseMissionExpainText( 0 );
		scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
		scr_CloseMissionStateText( 0 );	//達成状況を非表示 

		scr_SetInputDisable( SCR_INPUT_BUTTON );

		mis_Wait( 1.8 );
		mis_MassageDialog( "C323_16" );	//メッセージ： 
	}
}