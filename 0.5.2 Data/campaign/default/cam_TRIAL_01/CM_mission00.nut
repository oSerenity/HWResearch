///////////////////////////////////////////////////////////////////////////////////////////////
//
// ファイル名：TRIAL_01\mission00.nut 
//	概要	：お試し版テストステージ 
//	作成	：落合 
//	作成日	：120116 
//	目的	：チュートリアル＋戦争 
//
///////////////////////////////////////////////////////////////////////////////////////////////
//
// File name: TRIAL_01 \ mission00.nut
// Overview: Trial version test stage
// Created: Ochiai
// Creation date: 12/01/16
// Purpose: Tutorial + War
//
///////////////////////////////////////////////////////////////////////////////////////////////
function loadMission() 
{
	print("[sample mission] load()\n");
	scr_SetDisableGimmickType( GIMMICK_RAFT );	//めんどいので筏は消す 
	scr_SetDisableGimmickType( GIMMICK_CANNON );	//めんどいのでキャノンは消す 
	scr_SetDisableGimmickType( GIMMICK_LADDER );	//めんどいのではしごは消す 

	//再生BGMを変更する 
	scr_SetInterruptStageBgm( 5 );	//チュートリアル終了までこのBGMにしておく 

}
function startMission() 
{
	print("[お試しプレイ] start()\n");
	
	// プレイヤーのプロファイルを固定する。 
	scr_PlayerSetFixedProfile( 0, "PlayerWarrior" );
//	scr_PlayerSetFixedProfile( 1, "PlayerCleric" );
//	scr_PlayerSetFixedProfile( 2, "PlayerMage" );

	//復活時間設定 
	//プレイヤーのリスポーンタイムは０秒に 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );

	// BOTの登録 :28体のこり２体  
	//門番 
	scr_BotPlayerRegistAndCreate( 100, "M01", POWER_COLOR_WHITE );	//途中参加魔導 
	scr_BotPlayerRegistAndCreate( 101, "M02", POWER_COLOR_WHITE );	//途中参加魔導 
//	scr_BotPlayerRegistAndCreate( 102, "NOOB01", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 

	//門番 
	scr_BotPlayerRegistAndCreate( 103, "Ryan", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 104, "Mighty", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 105, "John", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 106, "W01", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 107, "W02", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 108, "W03", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 109, "W04", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 110, "C01", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 111, "C02", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 113, "W12", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 114, "W13", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 
	scr_BotPlayerRegistAndCreate( 115, "C03A", POWER_COLOR_WHITE );	//チームスキル専用モビルアーマー 

	scr_BotPlayerRegistAndCreate( 112, "EX01", POWER_COLOR_WHITE );	//タワー防衛用チート万.2012/01/25 

	//敵 
	scr_BotPlayerRegistAndCreate( 200, "DOLL", POWER_COLOR_BLACK );	//練習台 
	scr_BotPlayerRegistAndCreate( 300, "DOLL2", POWER_COLOR_BLACK );	//練習台オフェンス 

	scr_BotPlayerRegistAndCreate( 201, "W05", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 202, "W06", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "W07", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 204, "W08", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 205, "W09", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 206, "W10", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 207, "W11", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 208, "W14", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 209, "W15", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 210, "W16", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 211, "C05", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 212, "C06", POWER_COLOR_BLACK );


	//トラップの登録 
	//命名規則 
	//5000番台＝ボックストラップ 
	//6000番台＝スフィアトラップ 
	scr_RegistTrapBox( 5000,   16576.0 ,0.0 ,-4185.1 ,1786.6 ,1200.0 ,1793.0 ,-337.4  );	//自軍の城 
	scr_RegistTrapBox( 5001,  7092.1 ,0.0 ,-3586.6 ,355.5 ,1500.0 ,3923.1 ,-356.1  );	//大陸イン（行動制限１） 
	scr_RegistTrapBox( 5001,  9636.7 ,0.0 ,3052.3 ,350.0 ,1500.0 ,4082.4 ,-323.8  );	//大陸イン 
	scr_RegistTrapSphere( 5001, 10524.356445, 0.081543, -638.387329, 404.9  );	//行動制限１タワー３番周囲  
	
	scr_RegistTrapBox( 5002,  -4358.3, 0.0, -1483.3, 1308.3, 1000.0, 7983.3, -354.9   );	//奥のほうイン 
	scr_RegistTrapBox( 5003,  818.2, -100.0, -2201.2, 21685.7, 190.0, 13706.0, -2.5    );	//落ちないように  
	scr_RegistTrapBox( 5004,  3751.1, 0.0, -1073.8, 615.0, 1000.0, 7195.7, -24.7 );	//チームスキル解説用  
	
	scr_RegistTrapBox( 5005,  -15187.302734, 0.592201, -3718.333008, 3883.0, 1000.0, 8359.1, -21.2   );	//敵城前。敵城城門解説用  
	scr_RegistTrapBox( 5006,   -16308.5 ,0.0 ,-4233.2 ,1644.8 ,1500.0 ,1832.1 ,-297.0  );	//敵城内 


	//初期設定コールバック 
	//ID命名規則 
	//1000番台＝初期設定コールバック 
	//2000番台＝追加コールバック 
	//トラップの番号X10＝トラップ関連コールバック 
	scr_SetMessageCallback( "miscb_PlayerSallyFirst", 1000, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	//初回出撃時 
	scr_SetMessageCallback( "miscb_GameSetWinWhite", 1001, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_WHITE );	//勝利時 
	scr_SetMessageCallback( "miscb_GameSetWinBlack", 1002, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_BLACK );	//敗北時 

	scr_SetTrapInCallback( "miscb_TrapIn5001", 50001, CB_TYPE_ALWAYS, 5001 );	//行動制限１ 

	//オフラインキャンペーンＨＵＤ設定 
	scr_SetEnablePlayerHeroPopup( false );	//ヒーローポップアップの非表示 
	scr_SetEnableInputPlayerVoiceReaction( false );	//リアクションボイスマクロの非表示 
	scr_SetDisableGameBattleStart();	//開戦カウントダウン表示を非表示に 
//	scr_SetDisableTacticalInfomation();	//ログ非表示 
//	scr_SetDisableTacticalInfomation();	//バナーテキストを非表示 
	scr_SetEnableTacticalBannerText( SCR_BANNER_5MINUTES, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_1MINUTES_SUPERIOR, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_1MINUTES_INFERIOR, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_1MINUTES_EVEN, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_ENEMY_CASTLE_APPROACH, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_ALLY_CASTLE_APPROACH, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_ENEMY_CASTLE_ATTACK, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_ALLY_CASTLE_ATTACK, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HIGH_SCORER, false );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HARD_WALKER, false );


	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_UNION_INVADING_TO_ENEMY_CASTLE, false );
	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_SUICIDE, false );
	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_REMAINING_TIME_05, false );
	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_REMAINING_TIME_01_WIN, false );
	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_REMAINING_TIME_01_LOSE, false );
	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_REMAINING_TIME_01_EVEN, false );
	scr_SetEnableTacticalMessageLog( SCR_MESSAGE_LOG_ENEMY_INVADING_TO_UNION_CASTLE, false );


	// アイテム取得不可
	scr_DisableGameReward();
	scr_BotPlayerDisableLearningSkillByLevelUp();


	// プレイヤー生成を待ちます 
	mis_WaitPlayerCreate();
	//プレイヤーの出現位置を固定 
	scr_PlayerSetForceRespawnPosition( 16230.390625, 100.000000, -4021.990479, -64.0 );
	//経験値取得をチュートリアル終了まで封じておく 
	scr_PlayerSetEnableGetExperience( false );


	//開戦前メッセージ 
	mis_Wait( 0.45 );
	mis_MassageDialog( "T000_01" );	//メッセージ：ようこそ！～まずかんたんに操作をせつめいするぞい。戦士で出てね 

	//カウントダウン開始を待つ
	mis_WaitGameStartCountDown();
	//カウントダウンタイマー無効化 
	scr_ForceStopGameCountDownTimer();	//ゲーム開始カウントダウンを停止。バリケードの維持 
}
///////////////////////
//▼汎用ファンクション 
function mis_WaitPlayerCreate()
{
	//プレイヤーの生成を待つ。プレイヤーの出撃位置固定に利用 
	while( !scr_PlayerIsCreateBody( 0 ) )
	{
		suspend();
	}
}
function mis_WaitGameStartCountDown()
{
	//ゲーム開始のカウントダウンがスタートするのを待つ 
	while( GAME_STATE_START_COUNT_DOWN!=scr_GetGamePlayingStatus() )
	{
		local state = GetGamePlayingStatus();
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );
		suspend();
	}
}
function mis_WaitGameStart()
{
	//ゲームの開始を待つ 
	while( GAME_STATE_PLAYING!=scr_GetGamePlayingStatus() )
	{
		local state = GetGamePlayingStatus();
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );
		suspend();
	}
}
function mis_Wait( sec )
{
	//スクリプトを止めて時間分待つ。 
	print("waitsec()\n");
	scr_WaitStart( sec );
	while( scr_Waiting() )	
	{
		suspend();
	}
}
function mis_MassageDialog( doc_id )
{
	//メッセージダイアログを開く 
	print("deadEffect!()\n");
	scr_PauseOn();	
	scr_OpenDialog( 0, doc_id );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
}
function mis_CameraSet(x,y)
{
	print("cameraset()\n");
	scr_SetInputDisable( SCR_INPUT_CAMERA );	//カメラを禁止 
	scr_ResetGameCameraDirection( x, y, false );
	scr_WaitStart( 0.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_SetInputEnable( SCR_INPUT_CAMERA );	//カメラ禁止解除 
}
function mis_BannerInfoTimer(fn_name,time)
{
	//同ＩＤタイマーコールバックのセット・入れ替え 
	scr_RemoveCallbackFromId( 30003 );

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
function mis_WarpToReturnTutorial( x, y, z, roty )
{
	print("warpToCheckPoint()\n");
	scr_PauseOn();		
	// フェードしてワープ
	scr_FadeOutBlack( 0.4 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	// ワープ
	scr_PlayerWarp( x, y, z, roty );
	// 1フレーム待たないとワープが完了しない
	suspend();
	scr_PauseOff();
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	// カメラを はいご へリセット
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( true )
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_PauseOn();		
	scr_FadeIn( 0.4 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	scr_PauseOff();
}
//▼コールバック処理   
gTutorialState <- 0;	//状態変数。0=チュートリアル前。1=チュートリアル中。2はチュートリアル後。 
function miscb_PlayerSallyFirst()
{
	print("初回の出撃時イベント開始!()\n");
	//BOT設定の続き 
	scr_BotPlayerSetSyncBreakCastleMonumentWithPlayer( POWER_COLOR_WHITE, true );	//BOTはプレイヤーのタワー破壊行動と同期する 
	scr_BotPlayerSetEnableDamageCastleMonument( POWER_COLOR_BLACK, false );	//敵BOTはタワーへの攻撃力を持たない 

	//カメラを寄りの背後視点に変更 
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( false );
	
	scr_SetInputDisable( SCR_INPUT_CAMERA );	//カメラを禁止 
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	scr_SetInputDisable( SCR_INPUT_BUTTON );	// こうげき ・スキルを禁止 
	
	mis_PlayerSpawnCheck();

}
function miscb_PlayerSallyAfter()
{
	print("チュートリアル開始以降にリスポーンしたでおじゃ()\n");

	mis_Wait( 0.6 );	//出撃終了を待つ 
	//プレイヤーの職業を特定するための変数を設定 
	local PlayerJob = 0;
	PlayerJob = scr_PlayerGetJobType();
	//分岐。プレイヤーが戦士でなければもう一度出撃させる 
	if(PlayerJob != SCR_JOB_WARRIOR)
	{
		print("戦士以外の職業で出撃したのでぶっ殺す!()\n");
		mis_MassageDialog( "T000_02" );	//なにをしておるかぁ！戦士で出撃なんじゃ！ 
		scr_PlayerSetLife( 0 );	//プレイヤー殺害 
	}
	else
	{
		print("戦士で出撃したのでイベント進行するを!()\n");
		
		if(gTeamSkillFlag == 1)
		{
			print("チームスキルチュートリアルにに移行するフラグがあったを()\n");
			mis_StartTeamSkillTutorial();
		}
		
	}
}
function mis_PlayerSpawnCheck()
{
	print("ちゃんと出撃したぞ！!()\n");
	mis_Wait( 1.0 );	//出撃終了を待つ 
	//プレイヤーの職業を特定するための変数を設定 
	print("戦士で出撃したのでイベント進行するを!()\n");
	scr_SetTrapInCallback( "miscb_TrapIn5003", 50003, CB_TYPE_ALWAYS, 5003 );	//おちないように 
	mis_StartTutorial();
}
function miscb_TrapIn5001()
{
	print("行動制限１執行。戦闘チュートリアルに押し戻す()\n");
	mis_MassageDialog( "T000_03" );	//メッセージ：モドれっての 
	mis_WarpToReturnTutorial( 13546.433594, 100.000000, -2435.386963, -66.0 );
}
function miscb_TrapIn5003()
{
	print("おちっとあぶないかんね()\n");
	mis_MassageDialog( "T000_04" );	//メッセージ：落ちると死ぬぞおい 
	mis_WarpToReturnTutorial( 13546.433594, 100.000000, -2435.386963, -66.0 );
}
function mis_StartTutorial()
{
	if(gTutorialState == 0)
	{
		print("カメラチュートリアルから開始する!()\n");
		gTutorialState = 1;	//チュートリアル中に以降 

		scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXTBA00011" );	// 見渡してみよう 
		
		scr_SetInputEnable( SCR_INPUT_CAMERA );	//カメラ禁止解除 
		scr_OpenKeyHelp( SCR_KEY_HELP_CAMERA_01, -1.0 );	//キーヘルプ　RS左右カメラ回転 
		scr_SetCameraRotationCallback( "miscb_CameraMove", 2000, 100.0 );	//カメラ回転したか 
	}
}
gAfterCameraMove <- 0;	//カメラ回した具合の状態変数 
function miscb_CameraMove()
{
	print("カメラ回転させた()\n");

	gAfterCameraMove = (gAfterCameraMove+1);	//カメラの回転度合いをチェック 
	scr_SetCameraRotationCallback( "miscb_CameraMove", 2000, 70.0 );	//カメラ回転したかいれかえ 

	if(gAfterCameraMove == 2 )	//もし240度以上回転させていたら以降 
	{
		print("カメラチュートリアル２に以降する()\n");
		scr_RemoveCallbackFromId( 2000 );
		scr_CloseKeyHelp();
		
		scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
		scr_OpenMissionExpainText( 0, "#TXTBA00021" );	//ズームアウト 
		scr_OpenKeyHelp( SCR_KEY_HELP_CAMERA_02 ,-1.0);	//キーヘルプ　RS上下カメラズーム 
		scr_SetMessageCallback( "miscb_CameraZoom", 2001, CB_TYPE_ALWAYS, MESSAGE_CAMERA_CHANGE_ANGLE_TYPE );	//カメラズーム変更した 
	}
}
gAfterCameraZoom <- 0;	//カメラ変更回数の状態変数 
gCameraZoom <- 0;
function miscb_CameraZoom()
{
	print("カメラズームを変更した()\n");
	
	if( scr_GetGameCameraAngleType() == ANGLE_ZOOM_OUT || scr_GetGameCameraAngleType() == ANGLE_ZOOM_OUT2 )
	{
		gAfterCameraZoom = (gAfterCameraZoom+1);	//カメラ変更回数を加算 
	}
	else
	{
		gCameraZoom = (gCameraZoom+1);	//カメラ変更回数を加算 
	}

	if( gAfterCameraZoom >= 1 || gCameraZoom >= 3  )	//もし１回でも上方向にカメラを変更していた場合、分岐 
	{
		if( scr_GetGameCameraAngleType() == ANGLE_ZOOM_IN )
		{
			print("移動チュートリアルに移行()\n");
			mis_ClearMoveTutorial();
		}
	}
}

function mis_ClearMoveTutorial()
{
	print("移動チュートリアルは終了。戦闘チュートリアルに移行する()\n");

	scr_RemoveCallbackFromId( 2001 );
	mis_Wait( 0.4 );
	scr_CloseKeyHelp();
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00042" );	//城の外に出てみよう 
	//入力制限を解除 
	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_BUTTON );
	scr_OpenKeyHelp( SCR_KEY_HELP_MOVE , -1.0);	//キーヘルプ　LS移動 

	//カウントダウンを０にし、バリケードを解放する 
	scr_ForceReleaseGameCountDownTimer();
	//城から出た時のコールバックを宣言 
	scr_SetTrapOutCallback( "miscb_TrapOut5000", 50000, CB_TYPE_ONCE, 5000 );	//場内から出たを返す 
	//道案内エフェクトを表示 
	//命名規則 
	//700番台＝サウンド 
	//800番台＝エフェクト 
	scr_CreateSceneEffect( 801, "Ccam01c", 15845.251953, 106.000000, -3843.932861, -66.0 );

}
gBattleTutorialState <- 0;	//戦闘チュートリアルの進行状態変数。0=開始前、1=攻撃チュートリアル中、2=スキルチュートリアル中。3=投石中。4=おさらい中。5=終了後 
function miscb_TrapOut5000()
{
	print("城から抜けたので戦闘チュートリアルに移行する()\n");
	scr_CloseKeyHelp();	//移動のキーヘルプを削除 
	scr_CloseMissionExpainText( 0 );
	
	scr_BotPlayerSpawnToWorld( 200, 12806.377930, 100.000000, -2092.628418, 110.0 );	//MOBsDefN 
	scr_BotPlayerSetLifeRecover( 200, false );	
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 200, true );
//	suspend();
//	scr_BotPlayerEnableInterruptActionMode( 200, SCR_ACTION_MODE_STAY, -1, -1.0 );	//地点防衛に変更 


	scr_AddStandbyEnemyCallback( "miscb_KillBot200", 200, STANDBY_COUNT_START_TIMING  );	//連続斬りなどで倒しちゃった場合 
	scr_CreateSceneEffect( 802, "Ccam02c", 12806.364258, 300.000000, -2092.646191, -66.0 );

	scr_RegistTrapSphere( 6001, 12806.377930, 100.000000, -2092.628418, 800.0 );	//ドールくんに近づいたかを検出 
	scr_SetTrapInCallback( "miscb_TrapIn6001", 60001, CB_TYPE_ONCE, 6001 );	//エネミーコルバックを返す 


}
function miscb_KillTarget200()
{
	//カラのコールバック 
}
function miscb_TrapIn6001()
{
	print("攻撃チュートリアル開始()\n");

	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );
	mis_CameraSet( 12806.3, -2092.6 );	

	mis_MassageDialog( "T000_05" );	//メッセージ：攻撃してみようず 
	scr_OpenKeyHelp( SCR_KEY_HELP_ATTACK , -1.0);	//キーヘルプ　X 通常 こうげき  
	scr_SetMessageCallback( "miscb_HitAttack", 2003, CB_TYPE_ALWAYS, MESSAGE_PLAYER_SUCCESS_ATTACK );
	scr_RemoveScene( 802, true );
	scr_AddTargetEnemyCallback( "miscb_KillTarget200", 200, "" );	//討伐表示開始 

}
function miscb_KillBot200()
{
	print("ドールくんが死んだんだ…()\n");
	if(gBattleTutorialState == 6)
	{
		print("おさらい中に倒したので、戦闘チュートリアルを終了()\n");
		mis_EndBattleTutorial();
	}
	if(gBattleTutorialState == 3)
	{
		print("投石チュートリアル中に倒したので、ガードに移行するかチェック()\n");
		mis_CheckUseStone();
	}
	if(gBattleTutorialState == 2)
	{
		print("スキルチュートリアル中に倒したので、スキルを使ったかどうかチェック()\n");
		mis_CheckUseSmash();
	}
	if(gBattleTutorialState == 1)
	{
		print("攻撃チュートリアル中に倒したのでスキルチュートリアルに移行する()\n");
		mis_StartSkillTutorial();
		
	}
	if(gBattleTutorialState == 0)
	{
		print("戦闘チュートリアル開始前ならその場に復活()\n");
		scr_BotPlayerSpawnToWorld( 200, 12806.377930, 100.000000, -2092.628418, 110.0 );	//Doll 
	}

}
gHitAttack <- 0;	//通常攻撃を当てた回数 
function miscb_HitAttack()
{
	print("ドールくんにちゃんと攻撃をあててるよ()\n");
	gHitAttack = (gHitAttack + 1 );
	if(gHitAttack >= 1 )
	{
		scr_RemoveCallbackFromId( 2003 );
		gBattleTutorialState = 1;
	}
}
function mis_StartSkillTutorial()
{
	print("スキルチュートリアル１開始()\n");
	scr_PlayerAddExperience( 0.2 );	//疑似経験知 
	mis_Wait( 0.3 );
	gBattleTutorialState = 2;	//スキルチュートリアル中に状態移行 
	scr_CloseKeyHelp();
	
	mis_MassageDialog( "T000_06" );	//メッセージ：イイね！次はスキルだずぇ。まずはふっとばしからな 
	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_01 , -1.0);	//キーヘルプ　Ａ スキル こうげき  
	scr_SetPlayerUseSkillCallback( "miscb_UseSMASH", 2004, CB_TYPE_ONCE, SCR_SMASH );
	scr_BotPlayerSpawnToWorld( 200, 12806.377930, 100.000000, -2092.628418, 110.0 );	//Doll 
}
gUseSmash <- 0 ;
function miscb_UseSMASH()
{
	gUseSmash = 1;
}
function mis_CheckUseSmash()
{
	print("ふっとばしは使ったのかな？()\n");
	if(gUseSmash == 0 )
	{
		print("つかってねーよこいつ。もう一回やれや()\n");
		scr_BotPlayerSpawnToWorld( 200, 12806.377930, 100.000000, -2092.628418, 110.0 );	//Doll 
//		mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
//		scr_OpenMissionExpainText( 0, "#TXTBA00051" );	// スキル使えって 
	}
	if(gUseSmash == 1 )
	{
		print("使ってるわ！じゃぁそのまま投石やろうず()\n");
		mis_StartStoneTutorial();
	}
}
function mis_StartStoneTutorial()
{
	scr_RegistTrapSphere( 6100, 11534.307617, 100.000000, -1731.998535, 100.0  );	//投石チュートリアル位置  


	scr_CloseKeyHelp();
	scr_PlayerAddExperience( 0.3 );	//疑似経験知 	
	mis_Wait( 0.3 );	//待つ 
	mis_MassageDialog( "T000_07" );	//メッセージ：つぎは投石やってみような！ 
	scr_BotPlayerSpawnToWorld( 200, 11534.307617, 100.000000, -1731.998535, 110.0 );	//Doll 
	scr_PlayerSetAPRate( 1.0 );

	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_02 , -1.0);	//キーヘルプ　B 投石 
	scr_SetPlayerUseSkillCallback( "miscb_UseSTONE", 2005, CB_TYPE_ONCE, SCR_STONE );
	scr_SetTimerCallback( "miscb_DamageBot200", 2006, CB_TYPE_ONCE, 1.0 );	//202自殺監視 
	gBattleTutorialState = 3;	//チュートリアル状態移行 
	
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 200, true );
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 200, true );

}
gUseStone <- 0 ;
function miscb_UseSTONE()
{
	print("useStone()\n");
	gUseStone = 1;
}
function miscb_DamageBot200()
{
	print("投石チュートリアル中にダメージが入ったら進行チェック()\n");
	scr_SetTimerCallback( "miscb_DamageBot200", 2006, CB_TYPE_ONCE, 1.0 );	//202自殺監視 
	if(gUseStone == 0 )
	{
		if(scr_BotPlayerGetLifeRate( 200 ) <= 0.8 )
		{

		}
	}
	if(gUseStone == 1 )
	{
		if(scr_BotPlayerGetLifeRate( 200 ) <= 0.95 )
		{
			scr_CloseKeyHelp();
			scr_RemoveCallbackFromId( 2006 );

			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
			mis_BannerInfoTimer("miscb_BunnerInfoRemove",4.0);	//バナーを削除する 
			scr_OpenMissionExpainText( 0, "#TXTBA00061" );	//そのまま倒せ 
		}
	}
}
function mis_CheckUseStone()
{
	print("投石は使ったのかな？()\n");
	if(gUseStone == 0 )
	{
		print("つかってねーよこいつ。もう一回やれや()\n");
		scr_BotPlayerSpawnToWorld( 200, 11534.307617, 100.000000, -1731.998535, 110.0 );	//Doll 
	}
	if(gUseStone == 1 )
	{
		print("使ってるわ！じゃぁそのままがーどやろうず()\n");
		mis_StartGuardTutorial();
	}
}
function mis_StartGuardTutorial()
{
	print("投石チュートリアル終了。ガードのレクチャーに入る()\n");
	scr_RemoveTargetEnemyCallback( 200 );

	gBattleTutorialState = 4;
	scr_PlayerAddExperience( 0.3 );	//疑似経験知 
	scr_RegistTrapSphere( 6200, 11534.307617, 100.000000, -1731.998535, 1400.0  );	//トラックへ切り替えるトラップ  


	mis_MassageDialog( "T100_08" );	//ガードの説明 :良い感じだな！攻撃の次は守りを覚えておけよ！ガードだ！RTを押している間盾でガードするぞ。人形の投石を防いでみろ！ 

	mis_CameraSet( 11116.6, -1483.7 );
	scr_BotPlayerSpawnToWorld( 200, -27593.705078, -100.000000, -5395.319336, 110.0 );	//Dollくんを見えないところに飛ばす  
	scr_BotPlayerSpawnToWorld( 300, 11534.307617, 100.000000, -1731.998535, 110.0 );	//戦闘ドールくんを出撃  
	suspend();
	scr_BotPlayerSetLifeRecover( 300, false );	
	scr_SetTrapInCallback( "miscb_TrapIn6200", 62000, CB_TYPE_ALWAYS, 6200 );	//ドールくんをトラックモードに切り替える  
	scr_SetTrapOutCallback( "miscb_TrapOut6200", 62100, CB_TYPE_ALWAYS, 6200 );	//ドールくんをディフェンスモードに切り替える  
	scr_BotPlayerEnableInterruptActionMode( 300, SCR_ACTION_MODE_DEFENSE, 6100, -1.0 );	//投石地点を防衛開始 


	//ガードに関するコールバックを作成 
	scr_OpenKeyHelp( SCR_KEY_HELP_GUARD, -1.0 );	//ガードのキーヘルプ LT GUARD 
	scr_SetMessageCallback( "miscb_GuardSuccess", 6211, CB_TYPE_ONCE, MESSAGE_PLAYER_SUCCESS_GUARD );	//ガード成功のコールバック 
	scr_AddTargetEnemyCallback( "miscb_KillTarget300", 300, "" );	//討伐表示開始 
	scr_AddStandbyEnemyCallback( "miscb_KillBot300", 300, STANDBY_COUNT_START_TIMING  );	//連続斬りなどで倒しちゃった場合 


	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00241" );	//人形の投石を防いでみよう！ 
}
function miscb_KillTarget300()
{
	//カラ 
}
function miscb_KillBot300()
{
	if(gBattleTutorialState == 5)	//2012/01/24新規 
	{
		print("ガードチュートリアル中に倒したので、おさらいに移行()\n");
		scr_CloseMissionExpainText( 0 );
		scr_RemoveCallbackFromId( 62000 );	//miscb_TrapIn6200 
		scr_RemoveCallbackFromId( 62100 );	//miscb_TrapOut6200 
		scr_RemoveCallbackFromId( 6212 );	//miscb_CheckPlayerLife 
		scr_RemoveStandbyEnemyCallback( 300 );
		scr_RemoveTargetEnemyCallback( 300 );

		mis_StartChangeTutorial();
	}
	if(gBattleTutorialState == 4)	//2012/01/24新規 
	{
		print("ガードチュートリアル中にガードせずに倒したので、最復活()\n");
		mis_ReStartGuardTutorial();
	}
}
function mis_ReStartGuardTutorial()
{
	scr_BotPlayerSpawnToWorld( 300, 11534.307617, 100.000000, -1731.998535, 110.0 );	//Doll 
}
function miscb_TrapIn6200()
{
	print("ドールくんをトラックモードに移行()\n");
	
	scr_RemoveCallbackFromId( 6212 );
	suspend();
	scr_SetTimerCallback( "miscb_CheckPlayerLife", 6212, CB_TYPE_ONCE, 1.0 );	//プレイヤーの体力を監視する 
	scr_BotPlayerEnableInterruptActionMode( 300, SCR_ACTION_MODE_TRACKING, 3, -1.0 );	//投石地点を防衛開始 
}
function miscb_TrapOut6200()
{
	print("ドールくんをディフェンスモードに移行()\n");
	scr_RemoveCallbackFromId( 6212 );
	//地点防衛を解除して次の防衛地点へ 
	scr_BotPlayerEnableInterruptActionMode( 300, SCR_ACTION_MODE_DEFENSE, 6100, -1.0 );	//投石地点を防衛開始 
}
function miscb_CheckPlayerLife()
{
	if(scr_PlayerGetLifeRate() <= 0.9)
	{
		print("プレイヤーの体力が７割以下になっていたら攻撃をやめさせる()\n");
		scr_BotPlayerEnableInterruptActionMode( 300, SCR_ACTION_MODE_STAY, -1, -1.0 );	//投石地点を防衛開始 
	}
	else
	{
		scr_BotPlayerEnableInterruptActionMode( 300, SCR_ACTION_MODE_TRACKING, 3, -1.0 );	//投石地点を防衛開始 
	}
	scr_SetTimerCallback( "miscb_CheckPlayerLife", 6212, CB_TYPE_ONCE, 1.0 );	//プレイヤーの体力を監視する 
}
function miscb_GuardSuccess()
{
	print("ガード成功した。倒す旨伝える()\n");
	gBattleTutorialState = 5;

	scr_CloseKeyHelp();
	scr_CloseMissionExpainText( 0 );
	mis_Wait( 0.6 );	//レベルアップを待つ 

	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00242" );	//うまくふせいだな！そのまま人形をやっつけよう！ガードしながら移動もX攻撃もできるぞ！  

}
function mis_StartChangeTutorial()
{
	print("ガードチュートリアル終了。スキルチェンジのレクチャーに入る()\n");
	gBattleTutorialState = 6;	//スキルチェンジ中に状態移行 

	scr_PlayerAddExperience( 1.0 );	//疑似経験知 
	scr_CloseMissionExpainText( 0 );

	mis_Wait( 2.0 );	//レベルアップを待つ 

	scr_PlayerSetCurrentSkill( SCR_SMASH );

	mis_MassageDialog( "T000_08" );	//メッセージ：スキル変えようぜ 
	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_03, -1.0 );	//キーヘルプ　Ddown スキル切り替え 
	scr_SetPlayerCurrentSkillCallback( "miscb_ChangeSkill", 2007, CB_TYPE_ONCE, SCR_SPINNING_BLADE );	//初スキル切り替え 
}
function miscb_ChangeSkill()
{
	print("changeskill()\n");
	scr_CloseKeyHelp();

	mis_Wait( 0.4 );	//切り替えを待つ 
	mis_MassageDialog( "T000_09" );	//メッセージ：okおさらおう 

	mis_CameraSet( 11534.3, -1731.9 );	

	scr_AddTargetEnemyCallback( "miscb_KillTarget200", 200, "" );	//討伐表示開始 
	scr_RemoveTargetEnemyCallback( 300 );


	scr_BotPlayerSpawnToWorld( 300, -27593.705078, -100.000000, -5395.319336, 110.0 );	//Dollオフェンスくんを見えないところに飛ばす  
	scr_BotPlayerSpawnToWorld( 200, 11534.307617, 100.000000, -1731.998535, 110.0 );	//Doll 
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00071" );	//X攻撃A/bスキル 
	
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 200, true );

}
function mis_EndBattleTutorial()
{
	print("戦闘チュートリアルを終了。タワーへ誘導()\n");
	scr_CloseMissionExpainText( 0 );
	gBattleTutorialState = 7;	//状態移行 
	scr_PlayerAddExperience( 0.2 );	//疑似経験知 

	mis_MassageDialog( "T000_10" );	//メッセージ：先に行こうぜ 
	mis_ChangeInvisibleWall_1();	//行動制限トラップの入れ替え1 

	//誘導エフェクトを出し、スタート用のトラップとコールバックを設置。
	scr_CreateSceneEffect( 803, "Ccam02c", 10531.496094, 300.174561, -642.748340, -51.0 );
	scr_CreateSceneEffect( 804, "Ccam01c", 12684.128906, 106.000000, -2282.383789, -51.0 );
	mis_CameraSet( 10527.9, -666.0 );	

	scr_RegistTrapSphere( 6002, 10527.996094, 0.174561, -666.048340, 700.0 );	//タワー３番周囲  
	scr_SetTrapInCallback( "miscb_TrapIn6002", 60002, CB_TYPE_ONCE, 6002 );	//タワー解説開始 

}
function mis_ChangeInvisibleWall_1()
{
	print("戦闘チュートリアルからタワーチュートリアル移行に伴う行動制限トラップの入れ替え()\n");
	scr_RemoveTrap( 5001 );
	suspend();
	suspend();
	suspend();
	scr_RegistTrapBox( 5001,  7092.1 ,0.0 ,-3586.6 ,355.5 ,1500.0 ,3923.1 ,-356.1  );	//大陸イン（行動制限１） 
	scr_RegistTrapBox( 5001,  9636.7 ,0.0 ,3052.3 ,350.0 ,1500.0 ,4082.4 ,-323.8  );	//大陸イン 

}
function miscb_TrapIn6002()
{
	print("タワーについての解説を始める。よく聞くように()\n");
	mis_CameraSet( 10527.9, -666.0 );	
	mis_MassageDialog( "T000_11" );	//メッセージ：しましまうんたん 
	scr_RemoveScene( 803, true );

	scr_SetBuildMonumentCallback( "miscb_BuildTower03", 2009, CB_TYPE_ONCE, "gfmo_001", MONUMENT_BUILD_OWNERSHIP );	//３番タワー建築の折 s
}
function miscb_BuildTower03()
{
	print("タワー３が真っ白です本当にありがとうございました。COM戦開始します。()\n");

	scr_PlayerAddExperience( 0.2 );	//疑似経験知 
	mis_Wait( 0.2 );	//建築を待つ 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	mis_Wait( 1.6 );	//建築を待つ 
	scr_RemoveTrap( 5001 );	//行動制限１を削除 
	
	scr_SetMessageCallback( "miscb_PlayerRespawnFirst", 1000, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	//出撃時 
	mis_MassageDialog( "T000_12" );	//メッセージ：okこれでこっからいきかえれっから。いっぺん死んでみるかい？ 
	mis_Wait( 0.5 );	//建築を待つ 

	mis_DeathTrap();

	scr_PlayerSetLife( 0 );	//プレイヤー殺害 
	scr_SetInputEnable( SCR_INPUT_MOVE );

	mis_Wait( 2.8 );
	mis_MassageDialog( "T000_13" );	//おどろいた？ 


}
function mis_DeathTrap()
{
	print("みんな死ぬ()\n");
	mis_Wait( 0.2 );	//建築を待つ 

	scr_CreateSceneEffect( 10110, "Slis02c", 10947.317383, 100.000000, -1019.666870, 0.0  );	//落雷 
	scr_CreateSceneEffect( 10111, "Slis03c", 10947.317383, 100.000000, -1019.666870, 0.0  );	//落雷 
	scr_CreateSceneSound( 50110, 80950, 10947.317383, 100.000000, -1019.666870 );

	scr_CreateSceneEffect( 10210, "Slis02c", 10038.220703, 100.000000, -238.202881, 0.0  );	//落雷 
	scr_CreateSceneEffect( 10211, "Slis03c", 10038.220703, 100.000000, -238.202881, 0.0  );	//落雷 

	scr_CreateSceneEffect( 10310, "Slis02c", 10476.724609, 100.000000, -28.096619, 0.0  );	//落雷 
	scr_CreateSceneEffect( 10311, "Slis03c", 10476.724609, 100.000000, -28.096619, 0.0  );	//落雷 

	scr_CreateSceneEffect( 10410, "Slis02c", 10540.187500, 100.000000, -1298.997803, 0.0  );	//落雷 
	scr_CreateSceneEffect( 10411, "Slis03c", 10540.187500, 100.000000, -1298.997803, 0.0  );	//落雷 

	scr_CreateSceneEffect( 10510, "Slis02c", 11182.740234, 100.000000, -566.815186, 0.0  );	//落雷 
	scr_CreateSceneEffect( 10511, "Slis03c", 11182.740234, 100.000000, -566.815186, 0.0  );	//落雷 

	scr_CreateSceneEffect( 10610, "Slis02c", 9892.731445, 100.000000, -735.801331, 0.0  );	//落雷 
	scr_CreateSceneEffect( 10611, "Slis03c", 9892.731445, 100.000000, -735.801331, 0.0  );	//落雷 

	mis_Wait( 0.2 );	//建築を待つ 
}
function miscb_PlayerRespawnFirst()
{
	print("生まれ変わったね！。COM戦開始します。()\n");
	scr_SetInputDisable( SCR_INPUT_BUTTON );
	mis_Wait( 1.3 );	//出撃を待つ 
	mis_MassageDialog( "T000_14" );	//メッセージ：さて、奴らをまとめてぶっとばそうか。仲間を呼んだから一緒にあいつらのもとにいってたも 

	mis_Wait( 0.3 );
	scr_SetInputEnable( SCR_INPUT_BUTTON );

	//COM戦を開始 
	mis_StartBattle();
}
function mis_StartBattle()
{
	print("タワーの解説まで終わったので、チュートリアルを終了してテストゲームに移行する()\n");

	//チュートリアル終了準備 
	scr_RemoveScene( 801, true );
	scr_RemoveScene( 802, true );
	scr_RemoveScene( 804, true );
	scr_RemoveTargetEnemyCallback( 200 );
	scr_RemoveTargetEnemyCallback( 300 );

	scr_RemoveCallbackFromId( 1000 );	//再出撃コールバック削除 
	scr_RemoveCallbackFromId( 50003 );	//おちないように削除 


	// フェードしてワープ 
	scr_PauseOn();		
	scr_FadeOutBlack( 0.4 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	scr_PlayerWarp( 16230.390625, 100.000000, -4021.990479, -64.0 );
	suspend();
	scr_PauseOff();
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	scr_SetInputDisable( SCR_INPUT_BUTTON );	//ボタンを禁止 

	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( true )
	//タワーの状態を中立にもどす 
	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );
	
	scr_BotPlayerSetRespawnEnable( 200, false );
	scr_BotPlayerSetRespawnEnable( 300, false );
	scr_BotPlayerSpawnToWorld( 300, -27593.705078, -100.000000, -5395.319336, 110.0 );	//MOBsDefNを画面外へ 
	scr_BotPlayerSpawnToWorld( 200, -27593.705078, -100.000000, -5395.319336, 110.0 );	//MOBsDefNを画面外へ 

	suspend();
	mis_Wait( 2.0 );	//出撃を待つ 
	scr_FadeIn( 0.6 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}


	scr_BotPlayerSpawnToWorld( 103, 17267.476563, 700.000000, -2977.644287, -68.0 );
//	scr_RegistTrapSphere( 9999999, 16472.154297, 100.000000, -4118.274414, 1800.9  );	//うろつき用自分の城スフィア  

	scr_RegistTrapSphere( 7777, 16252.653320, 100.000000, -3315.407227, 800.9  );	//うろつき用自分の城スフィア  
	scr_RegistTrapSphere( 7778, 15666.587891, 100.000000, -4671.519531, 800.9  );	//うろつき用自分の城スフィア  

	scr_RegistTrapSphere( 7779, 13744.385742, 100.000000, -2436.211914, 680.9  );	//城門前防衛用  
	scr_RegistTrapSphere( 7780, 13363.796875, 100.000000, -3258.906250, 680.9  );	//城門前防衛用  


	scr_BotPlayerSpawnToMonument( 106, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 106, true );
	scr_BotPlayerEnableInterruptActionMode( 106, SCR_ACTION_MODE_DEFENSE, 7777, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 107, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 107, true );
	scr_BotPlayerEnableInterruptActionMode( 107, SCR_ACTION_MODE_DEFENSE, 7778, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 104, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 104, true );
	scr_BotPlayerEnableInterruptActionMode( 104, SCR_ACTION_MODE_DEFENSE, 7778, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 108, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 108, true );
	scr_BotPlayerEnableInterruptActionMode( 108, SCR_ACTION_MODE_DEFENSE, 7777, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 105, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 105, true );
	scr_BotPlayerEnableInterruptActionMode( 105, SCR_ACTION_MODE_DEFENSE, 7778, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 109, "gcmoA_001" );
	mis_Wait( 0.2 );
	scr_BotPlayerSetActionTrigger( 109, true );
	scr_BotPlayerEnableInterruptActionMode( 109, SCR_ACTION_MODE_DEFENSE, 7778, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 110, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 110, true );
	scr_BotPlayerEnableInterruptActionMode( 110, SCR_ACTION_MODE_DEFENSE, 7777, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 111, "gcmoA_001" );
	mis_Wait( 0.2 );
	scr_BotPlayerSetActionTrigger( 111, true );
	scr_BotPlayerEnableInterruptActionMode( 111, SCR_ACTION_MODE_DEFENSE, 7778, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 113, "gcmoA_001" );
	mis_Wait( 0.2 );
	scr_BotPlayerSetActionTrigger( 113, true );
	scr_BotPlayerEnableInterruptActionMode( 113, SCR_ACTION_MODE_DEFENSE, 7778, -1.0 );	//投石地点を防衛開始 

	scr_BotPlayerSpawnToMonument( 114, "gcmoA_001" );
	mis_Wait( 0.1 );
	scr_BotPlayerSetActionTrigger( 114, true );
	scr_BotPlayerEnableInterruptActionMode( 114, SCR_ACTION_MODE_DEFENSE, 7777, -1.0 );	//投石地点を防衛開始 

	mis_Wait( 0.4 );
	mis_MassageDialog( "T100_15" );	//メッセージ：ルール説明 さて、いよいよはじまるぞ！ 仲間たちも出撃した！そうだ！挨拶をしてみようマジで 

	scr_OpenKeyHelp( SCR_KEY_HELP_VOICE_MACRO_01, -1.0 );	//会話のキーヘルプ LB 
	scr_SetMessageCallback( "miscb_Greeting", 115, CB_TYPE_ONCE, MESSAGE_PLAYER_VOCALIZE );	//挨拶した 
	scr_SetMessageCallback( "miscb_OpenVoiceMenu", 116, CB_TYPE_ONCE, MESSAGE_OPEN_VOICE_MACRO_WINDOW );	//挨拶した 

	scr_SetEnableVoiceMacroWindowOpenWaitMode( 0, true );	//ボイスマクロウィンドウを勝手に閉じないようにするよ 

}
function miscb_OpenVoiceMenu()
{
	print("ボイスマクロウィンドウを表示したみたいだぜ()\n");
	scr_CloseKeyHelp();
	print("openVoicemacro()\n");
	if(scr_GetOpenVoiceMacroWindowType(0) == SCR_VOICE_MACRO_WINDOW_TYPE_TALK )
	{
//		mis_MassageDialog( "C000_33" );	//メッセージ：とりあえずYであいさつをしてみたらどうだ？ 
	}
	scr_SetMessageCallback( "miscb_OpenVoiceMenu", 116, CB_TYPE_ONCE, MESSAGE_OPEN_VOICE_MACRO_WINDOW );	//挨拶した 
}
function miscb_Greeting()
{
	print("何かボイスマクロを発行したのでまぁ良しとする()\n");
	scr_CloseKeyHelp();
	scr_SetEnableVoiceMacroWindowOpenWaitMode( 0, false );	//ボイスマクロのウェイトモードをもとに戻す 

	if( scr_PlayerGetLastVoiceMacroId() == 30000 )
	{
		scr_RemoveCallbackFromId( 116 );
		print("ちゃんと挨拶してるので褒める()\n");
		mis_Wait( 2.0 );
		mis_MassageDialog( "T100_16" );	//メッセージ：とりあえずYであいさつをしてみたらどうだ？ 
	}
	else
	{
		print("挨拶じゃなかったけどまぁいいかというメッセージ()\n");
		mis_Wait( 2.0 );
		mis_MassageDialog( "T100_17" );	//メッセージ：とりあえずYであいさつをしてみたらどうだ？ 
	}
	mis_MassageDialog( "T000_15b" );	//メッセージ：ルール説明 
	mis_StartBattle2();	//今度こそバトルを開始する 
}



///////////////////////////////////////////////////////////////////////////////////////////////////////////
gGetCountExpByKillBot <- 0;
function miscb_KillAny()
{
	print( "模擬戦中にぼっと殺したので擬似経験値!\n" );
	//COM戦開始時はlv2の40%からスタート 
	if(gGetCountExpByKillBot <= 28)
	{
		scr_PlayerAddExperience( 0.01 );	//疑似経験知 	
		gGetCountExpByKillBot = (gGetCountExpByKillBot + 1);
	}
	else
	{
		scr_RemoveCallbackFromId( 4444 );
	}
}
function mis_SetRemoveExplain()
{
	print( "[ここで一句]SetRemoveExplain!\n" );
	//秒数後にバナーメッセージを消去 
	scr_RemoveCallbackFromId( 33003 );	//miscb_RemoveExplain 
	suspend();
	scr_SetTimerCallback( "miscb_RemoveExplain", 33003, CB_TYPE_ONCE, 4.5 );
}
function miscb_RemoveExplain()
{
	print( "[ここで一句]RemoveExplain!\n" );
	scr_CloseMissionExpainText( 0 );
}
function mis_RemoveTrapOut()
{
	print( "[ここで一句]RemoveTrapOut!\n" );
	scr_RemoveCallbackFromId( 33003 );	//miscb_RemoveExplain 

	scr_RemoveCallbackFromId( 5221 );	//miscb_TrapOut501 タワー解説解除 
	scr_RemoveCallbackFromId( 5222 );	//miscb_TrapOut501 タワー解説解除 
	scr_RemoveCallbackFromId( 5223 );	//miscb_TrapOut501 タワー解説解除 

	scr_RemoveCallbackFromId( 6221 );	//miscb_TrapOut601 バリスタ解説解除 
	scr_RemoveCallbackFromId( 6222 );	//miscb_TrapOut601 バリスタ解説解除 
	scr_RemoveCallbackFromId( 6223 );	//miscb_TrapOut601 バリスタ解説解除 
	scr_RemoveCallbackFromId( 6224 );	//miscb_TrapOut601 バリスタ解説解除 
	scr_RemoveCallbackFromId( 6225 );	//miscb_TrapOut601 バリスタ解説解除 
	scr_RemoveCallbackFromId( 6226 );	//miscb_TrapOut601 バリスタ解説解除 

	scr_RemoveCallbackFromId( 7221 );	//miscb_TrapOut701 爆弾岩解説解除 
}
function mis_SetResetMassage()
{
	print( "[ここで一句]miscb_SetResetMassage!\n" );
	//秒数後にメッセージをリセット 
	scr_RemoveCallbackFromId( 30003 );
	suspend();

	scr_SetTimerCallback( "miscb_ResetMessage", 30003, CB_TYPE_ONCE, 5.0 );
}
function miscb_ResetMessage()
{
	//バナーメッセージをもとにもどす 
	print( "[ここで一句]miscb_ResetMassage!\n" );
	scr_CloseMissionExpainText( 0 );
	mis_SetInfoCallbackAll();	//進行に合わせてメッセージコールバックを再設定する 
}
function mis_SetInfoCallbackAll()
{
	print( "[ここで一句]SetInfoCallBackALL!\n" );
	if(gFirstMonumentInfo <= 3)
	{
		scr_RemoveCallbackFromId( 5001 );
		scr_RemoveCallbackFromId( 5002 );
		scr_RemoveCallbackFromId( 5003 );
		suspend();
		scr_SetTrapInCallback( "miscb_TrapIn5501", 5001, CB_TYPE_ONCE, 5501 );	//ギミック解説爆弾岩 
		scr_SetTrapInCallback( "miscb_TrapIn5502", 5002, CB_TYPE_ONCE, 5502 );	//ギミック解説爆弾岩 
		scr_SetTrapInCallback( "miscb_TrapIn5503", 5003, CB_TYPE_ONCE, 5503 );	//ギミック解説爆弾岩 
	}
}
//▼タワー関連 
gFirstMonumentInfo <- 0;	//タワー解説履歴用フラグ。初回は音が鳴る。 
function mis_AlertEnemyTower( towID )
{
	print( "タワーに近づいた時に敵のタワーが立っていたら破壊を促す!\n" );
	
	local TowerState = 0;
	TowerState = scr_GetMonumentPowerColor( towID );

	if(TowerState == POWER_COLOR_BLACK )
	{
		if(gFirstMonumentInfo == 0)
		{
			//初回メッセージ中はわりこませない 
			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );	//初回のみＳＥ付 
			scr_OpenMissionExpainText( 0, "#TXTBA00181" );	//敵のタワーだ！ 
	
			gFirstMonumentInfo = 1;
		}
		else
		{
			scr_OpenMissionExpainText( 0, "#TXTBA00181" );
			gFirstMonumentInfo = (gFirstMonumentInfo + 1);
		}
		mis_SetRemoveExplain();
	}
}
function miscb_TrapIn5501()
{
	print( "[ここで一句]NearFirldTower01!\n" );
	mis_RemoveTrapOut();	//トラップアウト関連のコールバックを消去する 
	scr_SetTrapOutCallback( "miscb_TrapOut5501", 5221, CB_TYPE_ONCE, 5501 );	//ギミック解説解除 
	mis_AlertEnemyTower( "gfmo_003" );
}
function miscb_TrapIn5502()
{
	print( "[ここで一句]NearFirldTower02!\n" );
	mis_RemoveTrapOut();	//トラップアウト関連のコールバックを消去する 
	scr_SetTrapOutCallback( "miscb_TrapOut5502", 5222, CB_TYPE_ONCE, 5502 );	//ギミック解説解除 
	mis_AlertEnemyTower( "gfmo_002" );
}
function miscb_TrapIn5503()
{
	print( "[ここで一句]NearFirldTower03!\n" );
	mis_RemoveTrapOut();	//トラップアウト関連のコールバックを消去する 
	scr_SetTrapOutCallback( "miscb_TrapOut5503", 5223, CB_TYPE_ONCE, 5503 );	//ギミック解説解除 
	mis_AlertEnemyTower( "gfmo_001" );
}
function miscb_TrapOut5501()
{
	print( "[ここで一句]Out5501!\n" );
	//バリスタ解説範囲を出た 
	mis_SetResetMassage();	//数秒後にメッセージを消去 
}
function miscb_TrapOut5502()
{
	print( "[ここで一句]Out5502!\n" );
	//バリスタ解説範囲を出た 
	mis_SetResetMassage();	//数秒後にメッセージを消去 
}
function miscb_TrapOut5503()
{
	print( "[ここで一句]Out5503!\n" );
	//バリスタ解説範囲を出た 
	mis_SetResetMassage();	//数秒後にメッセージを消去 
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////








function mis_StartBattle2()
{
	print("会話を教え終わったので今度こそ戦闘を開始する()\n");

	scr_SetInterruptStageBgm( -1 );
	scr_PlayStageBgm( 1.0, true );
	mis_Wait( 1.0 );

	mis_SetRebirthTime();	//リスポーン時間を設定 
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_SetInputEnable( SCR_INPUT_BUTTON );	//ボタンを禁止解除 
	scr_HUDOpenGameBattleStart();

	scr_BotPlayerSpawnToMonument( 201, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 202, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 203, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 204, "gcmoB_001" );

	scr_BotPlayerSpawnToMonument( 205, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 206, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 207, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 208, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 209, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 210, "gcmoB_001" );


	scr_BotPlayerEnableInterruptActionMode( 104, SCR_ACTION_MODE_DEFENSE, 7779, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 105, SCR_ACTION_MODE_DEFENSE, 7780, -1.0 );	//城門前を警備 

	scr_BotPlayerDisableInterruptActionMode( 106 );
	scr_BotPlayerDisableInterruptActionMode( 107 );
	scr_BotPlayerDisableInterruptActionMode( 108 );
	scr_BotPlayerDisableInterruptActionMode( 109 );
	scr_BotPlayerDisableInterruptActionMode( 110 );
	scr_BotPlayerDisableInterruptActionMode( 111 );
	scr_BotPlayerDisableInterruptActionMode( 113 );
	scr_BotPlayerDisableInterruptActionMode( 114 );
	scr_BotPlayerDisableInterruptActionMode( 115 );


	//リスポーン時間調整用エリアトラップ 
	scr_RegistTrapBox( 4004, -14789.0, 0.0, -2143.3, 5633.1, 1000.0, 4060.1, -34.3  );	//エリア４：敵城大陸 
	scr_RegistTrapBox( 4004, -12206.2, 0.0, -5450.5, 4239.3, 1000.0, 3024.5, 0.0  );	//エリア４：敵城大陸 
	scr_SetTrapInCallback( "miscb_TrapIn4004", 40004, CB_TYPE_ALWAYS, 4004 );	//城門説明 
	scr_SetTrapOutCallback( "miscb_TrapOut4004", 41004, CB_TYPE_ALWAYS, 4004 );	//城門説明 

	//COM戦中イベント 
	scr_SetBreakCastleGateCallback( "miscb_BreakGate", 2012, CB_TYPE_ONCE, POWER_COLOR_BLACK );	//城門破壊時 
	scr_SetMessageCallback( "miscb_KillAny", 4444, CB_TYPE_ALWAYS, MESSAGE_PLAYER_KILL_JOB_ANY );	//擬似経験値を渡す 

	scr_RegistTrapSphere( 9999, -16140.387695, 100.00, -4232.728516,        1200.0 );	//敵城中心 
	scr_RegistTrapSphere( 99999, -13711.969727, 134.749557, -3056.56,       350.0 );	//城門前 
	scr_RegistTrapSphere( 999999, -10109.402344, 100.000000, -1651.867920,       600.0 );	//１番タワー周辺前 

	//敵対タワーがあれば破壊を促す 
	scr_RegistTrapSphere( 5503, 10475.34082, 0.0, -673.215698,    400.0 );	//３番モニュメント 
	scr_RegistTrapSphere( 5502, 256.2047, 0.0, -1417.31939,       400.0 );	//２番モニュメント 
	scr_RegistTrapSphere( 5501, -9609.232422, 0.0, -1983.852539,  400.0 );	//１番モニュメント 
	scr_SetTrapInCallback( "miscb_TrapIn5501", 5001, CB_TYPE_ONCE, 5501 );	//ギミック解説爆弾岩 
	scr_SetTrapInCallback( "miscb_TrapIn5502", 5002, CB_TYPE_ONCE, 5502 );	//ギミック解説爆弾岩 
	scr_SetTrapInCallback( "miscb_TrapIn5503", 5003, CB_TYPE_ONCE, 5503 );	//ギミック解説爆弾岩 

	suspend();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 203, true );
	scr_BotPlayerSetActionTrigger( 204, true );
	scr_BotPlayerSetActionTrigger( 205, true );
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );
	scr_BotPlayerSetActionTrigger( 208, true );
	scr_BotPlayerSetActionTrigger( 209, true );
	scr_BotPlayerSetActionTrigger( 210, true );

	scr_BotPlayerSetActionTrigger( 103, true );
	scr_BotPlayerSetActionTrigger( 104, true );
	scr_BotPlayerSetActionTrigger( 105, true );


	mis_Wait( 3.1 );
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",7.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXTBA00201" );	//敵城を目指せ 


	/////2012/01/25追加 /////////////////////////////////////////////////////////
	//攻城戦調整用スフィア 
	scr_RegistTrapSphere( 26000, -10146.443359, 100.000000, -1949.272705, 800.0 );	//１番タワー防御ポジション 

	scr_RegistTrapSphere( 36000, -11540.218750, 100.000000, -2855.317383, 220.0 );	//魔法使い攻撃ポジション１（みぎ） 
	scr_RegistTrapSphere( 36001, -12236.423828, 100.000000, -2126.521973, 220.0 );	//魔法使い攻撃ポジション２(ひだり） 

	scr_RegistTrapSphere( 46000, -12198.554688, 100.000000, -3292.661377, 800.0 );	//魔法使い防御ポジション１(右） 
	scr_RegistTrapSphere( 46001, -12957.583984, 100.000000, -2111.565918, 800.0 );	//魔法使い防御ポジション２（左） 

	scr_RegistTrapSphere( 56000, -12739.935547, 100.000000, -3698.034912, 600.0 );	//丸太防衛ポジション１（右 
	scr_RegistTrapSphere( 56001, -13627.449219, 100.000000, -1885.314697, 600.0 );	//丸太防衛ポジション２（左 

	scr_RegistTrapSphere( 66000, -31.279968, -100.000000, -8591.618164, 100.0 );	//チート万自殺用 


	//攻城戦イベントコールバック 
	scr_SetBuildMonumentCallback(  "miscb_BuildTower01", 10, CB_TYPE_ONCE, "gfmo_003", MONUMENT_BUILD_OWNERSHIP );

}
////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
function miscb_BuildTower01()
{
	print( "１番タワー大地に立つ！!\n" );

	local BuildColor = 0;
	BuildColor = scr_GetMonumentPowerColor( "gfmo_003" );

	if( BuildColor == POWER_COLOR_WHITE )
	{
		print( "白色になった。城門前のイベントを解放する!\n" );
		scr_SetTrapInCallback( "miscb_TrapIn5005", 50005, CB_TYPE_ONCE, 5005 );	//城門説明 
		
		scr_BotPlayerSpawnToMonument( 112, "gfmo_003" );	//ex2を護衛として召喚 
		scr_BotPlayerSetActionTrigger( 112, true );
		scr_BotPlayerEnableInterruptActionMode( 112, SCR_ACTION_MODE_DEFENSE, 26000, -1.0 );	//t01を警備 
	}
	else
	{
		scr_RemoveCallbackFromId( 50005 );
		scr_SetBreakMonumentCallback( "miscb_BreakTower01", 9, CB_TYPE_ONCE, "gfmo_003" );
	}
}
function miscb_BreakTower01()
{
	scr_SetBuildMonumentCallback(  "miscb_BuildTower01", 10, CB_TYPE_ONCE, "gfmo_003", MONUMENT_BUILD_OWNERSHIP );
}
function miscb_TrapIn5005()
{
	print( "城門付近まで完全に来ましたわぁ!\n" );

//	scr_RemoveCallbackFromId( 10 );	//miscb_BuildTower01 
	
	scr_BotPlayerSpawnToMonument( 211, "gcmoB_001" );
	scr_BotPlayerSpawnToMonument( 212, "gcmoB_001" );
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 211, true );
	scr_BotPlayerSetActionTrigger( 212, true );
	scr_BotPlayerEnableInterruptActionMode( 211, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 212, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );

	
	mis_BannerInfoTimer("miscb_BunnerInfoRemove", 8.0);	//バナーを削除する 
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
//	scr_OpenMissionExpainText( 0, "#TXTBA00091" );	//城門壊せ！ 
	scr_OpenMissionExpainText( 0, "#TXTBA00251" );	//城門壊せ！城壁のバリスタに気をつけろ！ 


	//城門に向けて矢印作成 
	scr_CreateSceneEffect( 800, "Ccam01c", -12437.139648, 106.000000, -2475.133545, -115.0 );

	//殺害者登場＆リスポーンコールバック作成 
	scr_SetTimerCallback( "miscb_StartBallistaEvent", 11, CB_TYPE_ONCE, 8.0 );

	//エリアによる形成設定を削除し、攻城戦モードに固定する 
	scr_RemoveCallbackFromId( 40004 );	//miscb_TrapIn4004 
	scr_RemoveCallbackFromId( 41004 );	//miscb_TrapIn4004 
	miscb_TrapIn4004();

}
function miscb_StartBallistaEvent()
{
	local BallistStateB02 = 0;
	BallistStateB02 = scr_GetGimmickBuildState( "Wgbal01_002" );

	local BallistStateB05 = 0;
	BallistStateB05 = scr_GetGimmickBuildState( "Wgbal01_005" );


	if( BallistStateB02 == GIMMICK_BUILD_NAUGHT && BallistStateB05 == GIMMICK_BUILD_NAUGHT )
	{
		print( "バリスタが破壊されていたら魔法使いのイベントはスキップ!\n" );
		mis_EndBallistaEvent();
	}
	else
	{
		print( "死亡コールバックを仕掛ける!\n" );
		if(scr_PlayerGetLife() != 0 )
		{
			scr_SetMessageCallback( "miscb_PlayerDeadAtBallistaTutorial", 12, CB_TYPE_ONCE, MESSAGE_PLAYER_DEAD );	//死亡時 
			scr_SetTimerCallback( "miscb_ForceStart", 13, CB_TYPE_ONCE, 15.0 );	//2012/02/23 ２５→１5に 
		}
		else
		{
			scr_SetTimerCallback( "miscb_StartBallistaEvent", 11, CB_TYPE_ONCE, 3.0 );
		}
	}
}
function miscb_ForceStart()
{
	print( "イベント強制進行!\n" );
	scr_RemoveCallbackFromId( 12 );	//miscb_PlayerDeadAtBallistaTutorial 

	scr_RemoveCallbackFromId( 40004 );
	suspend();
	scr_SetTrapInCallback( "miscb_TrapIn4004AtForce", 40004, CB_TYPE_ONCE, 4004 );	//まほうつかいばくたん 

}
function miscb_TrapIn4004AtForce()
{
	print( "イベント強制進行実行!\n" );
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00261" );	//魔法使いに出撃してもらった！彼らに矢を止めてもらうんだ！ 
//	mis_BannerInfoTimer("miscb_BunnerInfoRemove",12.0);	//バナーを削除する 
	
	mis_SpawnMage();
}
function miscb_PlayerDeadAtBallistaTutorial()
{
	print( "死んだので出撃コールバック設定!\n" );
	scr_RemoveCallbackFromId( 13 );	//miscb_ForceStart 
	
	scr_SetMessageCallback( "miscb_PlayerSallyAtBallistaTutorial", 14, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	//初回出撃時 
}
function miscb_PlayerSallyAtBallistaTutorial()
{
	print( "出撃したので魔法使い爆誕CB設置!\n" );
	mis_Wait( 0.8 );
	//エリア４トラップを改変 
	scr_SetTrapInCallback( "miscb_TrapIn4004AtballistaTutorial", 40004, CB_TYPE_ONCE, 4004 );	//まほうつかいばくたん 
}
function miscb_TrapIn4004AtballistaTutorial()
{
	print( "魔法使い爆誕!\n" );

	mis_MassageDialog( "T000_24" );	//メッセージダイアログ：バリスタの矢で攻め切れないだろ！魔法使いに出撃してもらったぞ！彼らがバリスタを破壊している間守ってやるんだ！ 
	mis_Wait( 0.2 );

	mis_SpawnMage();

	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00261" );	//魔法使いに出撃してもらった！彼らに矢を止めてもらうんだ！ 
}
gMageSpawn <- 0;
function mis_SpawnMage()
{
	print( "魔法使いをタワーか見にくい位置から出現!\n" );

	scr_RemoveScene( 800, true );
	
	mis_SetRebirthTimeAtCastleEvent();	//敵のスポーン時間調整 
	
	if(scr_GetMonumentPowerColor( "gfmo_003" ) == POWER_COLOR_WHITE )
	{
		scr_BotPlayerSpawnToMonument( 100, "gfmo_003" );
		scr_BotPlayerSpawnToMonument( 101, "gfmo_003" );
	}
	else
	{
		scr_BotPlayerSpawnToWorld( 100, -6101.808594, 252.607819, 2250.324951, 110.0 );	//見にくい位置から 
		scr_BotPlayerSpawnToWorld( 101, -6101.808594, 252.607819, 2250.324951, 110.0 );
	}

	//もしバリスタが壊れていたらイベント 
	local BallistStateB02 = 0;
	BallistStateB02 = scr_GetGimmickBuildState( "Wgbal01_002" );

	local BallistStateB05 = 0;
	BallistStateB05 = scr_GetGimmickBuildState( "Wgbal01_005" );

	if(BallistStateB02 == GIMMICK_BUILD_COMPLETE )
	{
		scr_CreateSceneEffect( 821, "Ccam02c", -13170.214844, 1260.000000, -4531.687500, -66.0 );	//5（みぎ） 
	}
	if(BallistStateB05 == GIMMICK_BUILD_COMPLETE )
	{
		scr_CreateSceneEffect( 820, "Ccam02c", -14360.279297, 1038.430176, -1522.741455, -66.0 );	//2(ひだり） 
	}

	scr_BotPlayerSetActionTrigger( 100, true );
	scr_BotPlayerSetActionTrigger( 101, true );
	
	//魔法使いイベント中の陣形へ移行 

	scr_BotPlayerEnableInterruptActionMode( 100, SCR_ACTION_MODE_DEFENSE, 36000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 101, SCR_ACTION_MODE_DEFENSE, 36001, -1.0 );

	scr_BotPlayerEnableInterruptActionMode( 106, SCR_ACTION_MODE_DEFENSE, 46000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 107, SCR_ACTION_MODE_DEFENSE, 46001, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 108, SCR_ACTION_MODE_DEFENSE, 46000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 109, SCR_ACTION_MODE_DEFENSE, 46001, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 113, SCR_ACTION_MODE_DEFENSE, 46000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 114, SCR_ACTION_MODE_DEFENSE, 46001, -1.0 );

	scr_BotPlayerEnableInterruptActionMode( 201, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );	//城内を警備 
	scr_BotPlayerEnableInterruptActionMode( 202, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 203, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 204, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 205, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 206, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 207, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 208, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 209, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 210, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );

	////////////////////////////////////////////////////////////////////////////////////
	
	scr_AddTargetEnemyCallback( "miscb_Killbot100", 100, "$TXHFI00001" );
	scr_AddTargetEnemyCallback( "miscb_Killbot101", 101, "$TXHFI00001" );
	
	scr_RemoveCallbackFromId( 30003 );	//インフォメーション削除コールバックを削除 
	scr_RemoveCallbackFromId( 80000 );	

	
	scr_SetTimerCallback( "miscb_CheckBallistaState", 2015, CB_TYPE_ONCE, 3.0 );	//バリスタの状態監視 
	scr_SetTimerCallback( "miscb_ModeChangeBotEnemyAtMage", 621, CB_TYPE_ONCE, 4.0 );	//敵が攻撃再開 

	gMageSpawn = 1;
}
function miscb_ModeChangeBotEnemyAtMage()
{
	print( "敵の攻撃設定を変更\n" );
	scr_BotPlayerEnableInterruptActionMode( 201, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 202, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 203, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 204, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );

	scr_BotPlayerEnableInterruptActionMode( 205, SCR_ACTION_MODE_DEFENSE, 46000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 206, SCR_ACTION_MODE_DEFENSE, 46001, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 207, SCR_ACTION_MODE_DEFENSE, 46000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 208, SCR_ACTION_MODE_DEFENSE, 46001, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 209, SCR_ACTION_MODE_DEFENSE, 46000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 210, SCR_ACTION_MODE_DEFENSE, 46001, -1.0 );

}
function miscb_Killbot100()
{
	//カラ 
}
function miscb_Killbot101()
{
	//カラ 
}
gBreak02 <- 0;
gBreak05 <- 0;
function miscb_CheckBallistaState()
{
	print( "バリスタは立っているか？!\n" );
	//もしバリスタが壊れていたらイベント 
	local BallistStateB02 = 0;
	BallistStateB02 = scr_GetGimmickBuildState( "Wgbal01_002" );

	local BallistStateB05 = 0;
	BallistStateB05 = scr_GetGimmickBuildState( "Wgbal01_005" );

	if(BallistStateB02 == GIMMICK_BUILD_NAUGHT)
	{
		print( "バリスタ02b!\n" );
		if(gBreak02 == 0)
		{
			print( "バリスタ02bfirst!\n" );
			scr_RemoveScene( 821, true );
			scr_RemoveTargetEnemyCallback( 100 );
			scr_BotPlayerDisableInterruptActionMode( 100 );
			gBreak02 = 1;
		}
	}
	if(BallistStateB05 == GIMMICK_BUILD_NAUGHT)
	{
		print( "バリスタ05b!\n" );
		if(gBreak05 == 0)
		{
			print( "バリスタ05bfirst!\n" );
			scr_RemoveScene( 820, true );
			scr_RemoveTargetEnemyCallback( 101 );
			scr_BotPlayerDisableInterruptActionMode( 101 );
			gBreak05 = 1;
		}
	}

	if( BallistStateB02 == GIMMICK_BUILD_NAUGHT && BallistStateB05 == GIMMICK_BUILD_NAUGHT )
	{
		print( "バリスタが破壊されているじゃないですかぁあ!\n" );
		mis_EndBallistaEvent();
	}
	else
	{
		print( "バリスタまだある!\n" );
		scr_RemoveCallbackFromId( 2015 );	//miscb_CheckBallistaStateの重複を避ける 
		suspend();
		scr_SetTimerCallback( "miscb_CheckBallistaState", 2015, CB_TYPE_ONCE, 3.0 );	//バリスタの状態監視 
	}
}
function mis_EndBallistaEvent()
{
	//バリスタ終わって城門へ 
	if(scr_PlayerGetLife() == 0 )
	{
		scr_RemoveCallbackFromId( 14 );	//重複を避ける 
		suspend();
		scr_SetMessageCallback( "miscb_PlayerSallyAndGateEvent", 14, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	//初回出撃時 
	}
	else
	{
		mis_StartGateEvent();
	}
}
function miscb_PlayerSallyAndGateEvent()
{
	mis_StartGateEvent();
}
function mis_StartGateEvent()
{
	print( "城門を破壊するよう支持!\n" );
	
	scr_BotPlayerEnableInterruptActionMode( 100, SCR_ACTION_MODE_DEFENSE, 36000, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 101, SCR_ACTION_MODE_DEFENSE, 36001, -1.0 );

	
	scr_RemoveScene( 800, true );
	suspend();
	scr_CreateSceneEffect( 800, "Ccam01c", -12437.139648, 106.000000, -2475.133545, -115.0 );
	
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",14.0);	//バナーを削除する 
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00271" );	//バリスタ止んだぞ！ 城門壊せ！ 

	scr_BotPlayerDisableInterruptActionMode( 106 );
	scr_BotPlayerDisableInterruptActionMode( 107 );
	scr_BotPlayerDisableInterruptActionMode( 108 );
	scr_BotPlayerDisableInterruptActionMode( 109 );
	scr_BotPlayerDisableInterruptActionMode( 113 );
	scr_BotPlayerDisableInterruptActionMode( 114 );
	
	//
	mis_ChangeEnemyMode();	//敵の魔法使い攻撃モードを解除 
	scr_BotPlayerEnableInterruptActionMode( 201, SCR_ACTION_MODE_DEFENSE, 99999, -1.0 );	//城門を警備 
	scr_BotPlayerEnableInterruptActionMode( 202, SCR_ACTION_MODE_DEFENSE, 99999, -1.0 );
	//

	scr_SetTimerCallback( "miscb_StartRamEvent", 1280, CB_TYPE_ONCE, 20.0 );	//城門破壊イベント  
}
function miscb_StartRamEvent()
{
	print( "城門硬いよねーイベント!\n" );

	if(scr_PlayerGetLife() == 0 )
	{
		scr_RemoveCallbackFromId( 14 );	//重複を避ける 
		suspend();
		scr_SetMessageCallback( "miscb_PlayerSallyAndRamEvent", 14, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );
	}
	else
	{
		scr_RemoveCallbackFromId( 40004 );
		suspend();
		scr_SetTrapInCallback( "miscb_TrapIn4004AtRam", 40004, CB_TYPE_ONCE, 4004 );	//そうりょばくたん 
	}
}
function miscb_PlayerSallyAndRamEvent()
{
	print( "城門硬いよねーイベントさりー!\n" );
	scr_RemoveCallbackFromId( 40004 );
	suspend();
	scr_SetTrapInCallback( "miscb_TrapIn4004AtRam", 40004, CB_TYPE_ONCE, 4004 );	//そうりょばくたん 
}
function miscb_TrapIn4004AtRam()
{
	print( "そうりょばくたん!\n" );

	mis_BannerInfoTimer("miscb_BunnerInfoRemove",7.0);	//バナーを削除する 
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00231" );	//くそっ！ なんて固い城門なんだ！ 
	

	if(scr_GetMonumentPowerColor( "gfmo_003" ) == POWER_COLOR_WHITE )
	{
	scr_BotPlayerSpawnToMonument( 115, "gfmo_003" );
	suspend();
	scr_BotPlayerSetActionTrigger( 115, true );
	}
	else
	{
		scr_BotPlayerSpawnToWorld( 115, -6101.808594, 252.607819, 2250.324951, 110.0 );	//見にくい位置から 
		suspend();
		scr_BotPlayerSetActionTrigger( 115, true );
	}
	scr_SetTimerCallback( "miscb_CheckRamState", 2015, CB_TYPE_ONCE, 2.0 );	//まうたの状態監視 
}
gRamInfo <- 0;
function miscb_CheckRamState()
{
	print( "まるたは立っているか？!\n" );
	//もしまるたが召喚されていればイベント 
	
	if( scr_GetGimmickBuildState( "gmon01_002" ) == GIMMICK_BUILD_FREE )
	{
		scr_RemoveScene( 810, true );
		suspend();
		scr_CreateSceneEffect( 810, "Ccam02c", -13157.0, 450.0, -2800.0, -85.0 );
		
		//解説 
		if(gRamInfo == 0)
		{
			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
			gRamInfo = 1;
			mis_SetRebirthTimeLast();	//リスポーン時間調整 
			
			//ボットの状態を遷移 
			scr_BotPlayerEnableInterruptActionMode( 106, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 107, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 108, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 109, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 113, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 114, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );

			scr_BotPlayerEnableInterruptActionMode( 100, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 101, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			
			scr_BotPlayerEnableInterruptActionMode( 201, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 202, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 203, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 204, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 205, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 206, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 207, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 208, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 209, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 210, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			//////////////////////////////////////////////////////////////////////////////////////
		}
//		mis_BannerInfoTimer("miscb_BunnerInfoRemove",10.0);	//バナーを削除する 
		scr_OpenMissionExpainText( 0, "#TXTBA00211" );	//おお！味方が攻城兵器を準備している！完成まで守ってあげよう！ 
		scr_RemoveCallbackFromId( 2015 );	//miscb_CheckRamState 
		suspend();
		scr_SetTimerCallback( "miscb_CheckRamState", 2015, CB_TYPE_ONCE, 2.0 );	//まうたの状態監視 
	}
	else
	{
		if(scr_GetGimmickBuildState( "gmon01_002" ) == GIMMICK_BUILD_COMPLETE)
		{
			mis_BannerInfoTimer("miscb_BunnerInfoRemove",25.0);	//バナーを削除する 
			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
			scr_OpenMissionExpainText( 0, "#TXTBA00221" );	//攻城兵器が完成！これで一気に城門をぶっ壊せ！ 	
			
			scr_BotPlayerEnableInterruptActionMode( 110, SCR_ACTION_MODE_DEFENSE, 56000, -1.0 );
			scr_BotPlayerEnableInterruptActionMode( 111, SCR_ACTION_MODE_DEFENSE, 56001, -1.0 );
			
		}
		else
		{
			scr_RemoveScene( 810, true );
			scr_RemoveCallbackFromId( 2015 );	//miscb_CheckRamState 
			suspend();
			scr_SetTimerCallback( "miscb_CheckRamState", 2015, CB_TYPE_ONCE, 2.0 );	//まうたの状態監視 
		}
	}
}
gBreakGate <- 0;
gSkillEventState <- 0;
function miscb_BreakGate()
{
	print( "城門壊れた!\n" );
	scr_RemoveScene( 810, true );
	scr_RemoveCallbackFromId( 2015 );	//miscb_CheckRamState 

	mis_SetRebirthTimeAtFinal();	//リスポーン時間を調整 

	//敵を城の中心にあつめるモードチェンジ 
	gBreakGate = 1;
	mis_ChangeEnemyMode();
	

	//チームスキル発動ポジショントラップを設置 
	scr_RegistTrapSphere( 991, -13711.969727, 134.749557, -3056.56,       550.0 );	//城門前 
	scr_SetTrapInCallback( "miscb_TrapIn991AtTeam", 9919, CB_TYPE_ALWAYS, 991 );	//チームスキル 

	//１秒後に解説トラップインしてなかったら城内へ誘導バナーインフォ。インしてたらCB削除 
	scr_SetTimerCallback( "miscb_BunnerAboutBreakCastle", 9920, CB_TYPE_ONCE, 1.0 );

}
function miscb_BunnerAboutBreakCastle()
{
	print( "城門破壊時に城門の遠くにいたのでバナーで誘導\n" );
	gSkillEventState = 1;
	//城門破壊。タワー説明 
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",12.0);	//バナーを削除する 
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00111" );	//こわれたお！
	mis_Wait( 0.5 );
	
	scr_BotPlayerDisableInterruptActionMode( 106 );
	scr_BotPlayerDisableInterruptActionMode( 107 );
	scr_BotPlayerDisableInterruptActionMode( 108 );
	scr_BotPlayerDisableInterruptActionMode( 109 );
	scr_BotPlayerDisableInterruptActionMode( 113 );
	scr_BotPlayerDisableInterruptActionMode( 114 );
	
}
gTeam <- 0;
function miscb_TrapIn991AtTeam()
{
	print( "城門付近にトラップイン\n" );

	if(scr_PlayerGetLife() != 0)
	{
		if(gSkillEventState == 0)
		{
			print( "城門破壊時に城門付近にいたのでイベント\n" );
			scr_CloseMissionExpainText( 0 );			
			scr_RemoveCallbackFromId( 9920 );	//miscb_BunnerAboutBreakCastle 
			scr_SetInputDisable( SCR_INPUT_CAMERA );	//カメラを禁止 
			scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
			scr_SetInputDisable( SCR_INPUT_BUTTON );	// こうげき ・スキルを禁止 
			
			mis_Wait( 1.8 );	//城門崩壊のアニメーションを見守る 
			gSkillEventState = 2;	//一度解説したよフラグ 
			mis_MassageDialog( "T000_32" );	//よっしゃあ！んん！奴ら城の中に集まりだしたぞ！？ 
			
			scr_ResetGameCameraDirection( -16140.387695, -4232.728516, false );
			scr_SetGameCameraAngleType( ANGLE_ZOOM_UP );	//カメラをズームに設定 

			//復活待機中のやつを強制召喚 
			mis_Wait( 0.3 );
			scr_BotPlayerSpawnToMonument( 201, "gcmoB_001" );
			scr_BotPlayerSpawnToMonument( 202, "gcmoB_001" );
			mis_Wait( 0.2 );
			scr_BotPlayerSpawnToMonument( 203, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 204, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 205, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 206, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 207, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 208, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 209, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 210, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 211, "gcmoB_001" );
			mis_Wait( 0.1 );
			scr_BotPlayerSpawnToMonument( 212, "gcmoB_001" );
			mis_Wait( 1.1 );
//			mis_Wait( 2.5 );	//城門崩壊のアニメーションを見守る 
			mis_MassageDialog( "T000_31" );	//メッセージ：チームスキルでまとめてぶっ殺すぞ！ レベルアップさせるず！ 
			scr_PlayerAddExperience( 1.7 );	//疑似経験知 
			gTeam = 1;
			
			scr_BotPlayerDisableInterruptActionMode( 106 );
			scr_BotPlayerDisableInterruptActionMode( 107 );
			scr_BotPlayerDisableInterruptActionMode( 108 );
			scr_BotPlayerDisableInterruptActionMode( 109 );
			scr_BotPlayerDisableInterruptActionMode( 113 );
			scr_BotPlayerDisableInterruptActionMode( 114 );

			
			scr_OpenKeyHelp( SCR_KEY_HELP_TEAM_SKILL, -1.0 );	//チームスキル Y 
			mis_BannerInfoTimer("miscb_BunnerInfoRemove",10.0);	//バナーを削除する 
			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
			scr_OpenMissionExpainText( 0, "#TXTMA00301" );	//仲間がいるぞ！

			
			scr_SetMessageCallback( "miscb_CastStartCharge", 2018, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_TEAM_SKILL );
			scr_SetMessageCallback( "miscb_StartCharge", 2019, CB_TYPE_ONCE, MESSAGE_PLAYER_START_TEAM_CHARGE );
			scr_SetMessageCallback( "miscb_EndCharge", 2020, CB_TYPE_ONCE, MESSAGE_PLAYER_END_TEAM_CHARGE );

			scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 

			scr_SetInputEnable( SCR_INPUT_CAMERA );	//カメラを禁止 
			scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止 
			scr_SetInputEnable( SCR_INPUT_BUTTON );	// こうげき ・スキルを禁止 
			
			scr_SetMessageCallback( "miscb_PlayerDeadAtTeamSkillTutorial", 2017, CB_TYPE_ALWAYS, MESSAGE_PLAYER_DEAD );	//死亡時 
		}
	}
	if(scr_PlayerGetLife() != 0)
	{
		if(gSkillEventState == 1)
		{
			print( "あとでキタ人\n" );
			scr_CloseMissionExpainText( 0 );
			gSkillEventState = 2;	//一度解説したよフラグ 

			scr_ResetGameCameraDirection( -16140.387695, -4232.728516, false );
			scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
			mis_Wait( 0.3 );	//城門崩壊のアニメーションを見守る 


			mis_MassageDialog( "T000_31" );	//メッセージ：チームスキルでまとめてぶっ殺すぞ！ レベルアップさせるず！ 
			scr_PlayerAddExperience( 1.0 );	//疑似経験知 
			gTeam = 1;
			
			scr_OpenKeyHelp( SCR_KEY_HELP_TEAM_SKILL, -1.0 );	//チームスキル Y 
			mis_BannerInfoTimer("miscb_BunnerInfoRemove",10.0);	//バナーを削除する 
			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
			scr_OpenMissionExpainText( 0, "#TXTMA00301" );	//仲間がいるぞ！
			
			scr_SetMessageCallback( "miscb_CastStartCharge", 2018, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_TEAM_SKILL );
			scr_SetMessageCallback( "miscb_StartCharge", 2019, CB_TYPE_ONCE, MESSAGE_PLAYER_START_TEAM_CHARGE );
			scr_SetMessageCallback( "miscb_EndCharge", 2020, CB_TYPE_ONCE, MESSAGE_PLAYER_END_TEAM_CHARGE );
			
			scr_SetMessageCallback( "miscb_PlayerDeadAtTeamSkillTutorial", 2017, CB_TYPE_ALWAYS, MESSAGE_PLAYER_DEAD );	//死亡時 
		}
	}
	if(scr_PlayerGetLife() != 0)
	{
		if(gSkillEventState == 3)
		{
			print( "しんできた人\n" );
			scr_CloseMissionExpainText( 0 );
			gSkillEventState = 2;	//一度解説したよフラグ 
			mis_BannerInfoTimer("miscb_BunnerInfoRemove",6.0);	//バナーを削除する 
			scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
			scr_OpenMissionExpainText( 0, "#TXTBA00281" );	//チームスキルで城内を一掃だ！
			scr_OpenKeyHelp( SCR_KEY_HELP_TEAM_SKILL, -1.0 );	//チームスキル Y 

			scr_RemoveCallbackFromId( 2018 );	//miscb_CastStartCharge 
			scr_RemoveCallbackFromId( 2019 );	//miscb_StartCharge 
			scr_RemoveCallbackFromId( 2020 );	//miscb_EndCharge 

			scr_SetMessageCallback( "miscb_CastStartCharge", 2018, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_TEAM_SKILL );
			scr_SetMessageCallback( "miscb_StartCharge", 2019, CB_TYPE_ONCE, MESSAGE_PLAYER_START_TEAM_CHARGE );
			scr_SetMessageCallback( "miscb_EndCharge", 2020, CB_TYPE_ONCE, MESSAGE_PLAYER_END_TEAM_CHARGE );
		}
	}
}
function miscb_PlayerDeadAtTeamSkillTutorial()
{
	print("死んだのでリセと()\n");
	gSkillEventState = 3;
}
function miscb_CastStartCharge()
{
	print("全軍突撃の詠唱を始めたので方向を敵に向ける()\n");

	scr_ResetGameCameraDirection( -16140.387695, -4232.728516, false );

	scr_BotPlayerDisableInterruptActionMode( 106 );
	scr_BotPlayerDisableInterruptActionMode( 107 );
	scr_BotPlayerDisableInterruptActionMode( 110 );
	scr_BotPlayerDisableInterruptActionMode( 111 );
	scr_BotPlayerDisableInterruptActionMode( 112 );
	suspend();
	scr_BotPlayerEnableInterruptActionMode( 106, SCR_ACTION_MODE_TRACKING, 3, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 107, SCR_ACTION_MODE_TRACKING, 3, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 110, SCR_ACTION_MODE_TRACKING, 3, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 111, SCR_ACTION_MODE_TRACKING, 3, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 112, SCR_ACTION_MODE_TRACKING, 3, -1.0 );

}
function miscb_StartCharge()
{
	print("全軍発動したのでキーヘルプとか消していろんなコールバック削除()\n");
	scr_CloseKeyHelp();
	scr_CloseMissionExpainText( 0 );
	scr_RemoveCallbackFromId( 2018 );	//miscb_CastStartCharge 

	scr_BotPlayerDisableInterruptActionMode( 106 );
	scr_BotPlayerDisableInterruptActionMode( 107 );
	scr_BotPlayerDisableInterruptActionMode( 110 );
	scr_BotPlayerDisableInterruptActionMode( 111 );
	scr_BotPlayerDisableInterruptActionMode( 112 );

	//敵のスポーン時間を変更する 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 70 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY,70 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 70 );

}
gCharge <- 0;
function miscb_EndCharge()
{
	print("全軍突撃が終わったので、チュートリアルを終了移行する()\n");
	mis_Wait( 0.6 );
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",16.0);	//バナーを削除する 
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXTBA00151" );
	scr_CreateSceneEffect( 886, "Ccam01c", -15948.404297, 106.000000, -4168.423340, -115.0 );
	gCharge = 1;
}





////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////
function miscb_TrapIn4004()
{
	//エリア4に入った 
	print( "in4004!\n" );
	mis_SetRebirthTimeLast();
	
	//敵をすべて城防衛モードに 
	mis_ChangeEnemyMode();
}
function miscb_TrapOut4004()
{
	//エリア4から出た 
	print( "out4004!\n" );
	mis_SetRebirthTime();
	
	//敵をすべてフリーに 
	mis_ReturnEnemyMode();
}
function mis_SetRebirthTime()
{
	print("開戦直後～攻城戦開始までのリスポーン時間設定に!()\n");
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 2 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 2 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_NORMAL, 5 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_PENALTY, 5 );
	
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 8 );
}
function mis_SetRebirthTimeLast()
{
	print("攻城戦開始後のリスポーン時間設定に!()\n");
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 8 );	//2012/02/23　４→８に。 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 8 );	//2012/02/23　４→８に。 
	
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_NORMAL, 2 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_PENALTY, 2 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 0 );
}
function mis_SetRebirthTimeAtCastleEvent()
{
	print("魔法使い出現～城門破壊のリスポーン時間設定に!()\n");
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 13 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 13 );
	
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_PENALTY, 0 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 22 );
}
function mis_SetRebirthTimeAtFinal()
{
	print("城門破壊後後のリスポーン時間設定に!()\n");
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 0 );
	
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_WHITE, SCR_REBIRTH_TYPE_PENALTY, 0 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 0 );
}
///////////////////////
function mis_ChangeEnemyMode()
{
	print( "敵大陸に到達した時の敵設定変更!\n" );

//	scr_BotPlayerEnableInterruptActionMode( 110, SCR_ACTION_MODE_DEFENSE, 26000, -1.0 );	//T01を警備 
	scr_BotPlayerEnableInterruptActionMode( 111, SCR_ACTION_MODE_DEFENSE, 26000, -1.0 );	//t01を警備 

	scr_BotPlayerEnableInterruptActionMode( 201, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 202, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 203, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );	//城門前を警備 
	scr_BotPlayerEnableInterruptActionMode( 204, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 205, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 206, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 207, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 208, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 209, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );
	scr_BotPlayerEnableInterruptActionMode( 210, SCR_ACTION_MODE_DEFENSE_CASTLE, -1, -1.0 );


	if(gBreakGate == 1)
	{
		print( "城門破壊時の敵設定変更!\n" );
//		scr_BotPlayerDisableInterruptActionMode( 110 );
		scr_BotPlayerDisableInterruptActionMode( 111 );

		scr_BotPlayerEnableInterruptActionMode( 201, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );	//城内を警備 
		scr_BotPlayerEnableInterruptActionMode( 202, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 203, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 204, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 205, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 206, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 207, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 208, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 209, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 210, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 211, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
		scr_BotPlayerEnableInterruptActionMode( 212, SCR_ACTION_MODE_DEFENSE, 9999, -1.0 );
	}
}
function mis_ReturnEnemyMode()
{
	print( "敵大陸から出た時の敵設定変更!\n" );
	scr_BotPlayerDisableInterruptActionMode( 200 );
	scr_BotPlayerDisableInterruptActionMode( 201 );
	scr_BotPlayerDisableInterruptActionMode( 202 );
	scr_BotPlayerDisableInterruptActionMode( 203 );
	scr_BotPlayerDisableInterruptActionMode( 204 );
	scr_BotPlayerDisableInterruptActionMode( 205 );
	scr_BotPlayerDisableInterruptActionMode( 206 );
	scr_BotPlayerDisableInterruptActionMode( 207 );
	scr_BotPlayerDisableInterruptActionMode( 208 );
	scr_BotPlayerDisableInterruptActionMode( 209 );
	scr_BotPlayerDisableInterruptActionMode( 210 );

}
function miscb_GameSetWinWhite()
{
	//勝利時 
	print( "Game Set Win White!\n" );
	scr_RemoveScene( 886, true );
	scr_CloseMissionExpainText( 0 );
	scr_RemoveCallbackAll();
	scr_GameSetMissionClear();	


	mis_Wait( 4.0 );
	mis_MassageDialog( "T000_22" );

}
function miscb_GameSetWinBlack()
{
	//敗北時 
	print( "Game Set Win BLACK!\n" );
	scr_CloseMissionExpainText( 0 );
	scr_RemoveCallbackAll();
	scr_GameSetMissionClear();	

	mis_Wait( 4.0 );
	mis_MassageDialog( "T000_23" );

}
