///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_on_0102\mission00.nut 
//	概要	：オフラインキャンペーン レベル1 キャンペーン2 ミッション2 
//	作成	：落合 
//	作成日	：110606 
//	目的	：［討伐］指定の敵を倒せ 
//
///////////////////////////////////////////////////////////////////////////////////////////////


function loadMission() 
{
	print("[sample mission] load()\n");
//ミッションのステージを読み込む前の処理を設定しよう！ 
	scr_SetDisableGimmickType( GIMMICK_RAFT );
	scr_SetDisableGimmickType( GIMMICK_BOMBSTONE );

	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );

}
function startMission() 
{
	print("[sample mission] start()\n");
	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );



//Bot登録 
	scr_BotPlayerRegistAndCreate( 101, "NOOB01", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "MEDIC01", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 103, "MAGE01", POWER_COLOR_WHITE );
//	scr_BotPlayerRegistAndCreate( 104, "NOOB02", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "IQ10", POWER_COLOR_BLACK );	//BOSSWmisT 
	scr_BotPlayerRegistAndCreate( 202, "IQ11", POWER_COLOR_BLACK );	//BOSSChelD 
	scr_BotPlayerRegistAndCreate( 203, "IQ12", POWER_COLOR_BLACK );	//BOSSCbomT 
	scr_BotPlayerRegistAndCreate( 204, "IQ13", POWER_COLOR_BLACK );	//BOSSWspdD 
	scr_BotPlayerRegistAndCreate( 205, "IQ14", POWER_COLOR_BLACK );	//BOSSMssD 
	scr_BotPlayerRegistAndCreate( 206, "IQ4DS", POWER_COLOR_BLACK );	//2番IQ11 
	scr_BotPlayerRegistAndCreate( 207, "IQ4DS", POWER_COLOR_BLACK );	//2番 
	scr_BotPlayerRegistAndCreate( 208, "IQ4DS", POWER_COLOR_BLACK );	//2番 
	scr_BotPlayerRegistAndCreate( 209, "IQ6", POWER_COLOR_BLACK );	//3番IQ10 
	scr_BotPlayerRegistAndCreate( 210, "IQ6", POWER_COLOR_BLACK );	//3番 
	scr_BotPlayerRegistAndCreate( 211, "IQ6", POWER_COLOR_BLACK );	//3番 
	scr_BotPlayerRegistAndCreate( 212, "IQ4S", POWER_COLOR_BLACK );	//4番IQ12 
	scr_BotPlayerRegistAndCreate( 213, "IQ4S", POWER_COLOR_BLACK );	//4番 
	scr_BotPlayerRegistAndCreate( 214, "IQ4S", POWER_COLOR_BLACK );	//4番 
	scr_BotPlayerRegistAndCreate( 215, "IQ5", POWER_COLOR_BLACK );	//5番IQ13 
	scr_BotPlayerRegistAndCreate( 216, "IQ5", POWER_COLOR_BLACK );	//5番 
	scr_BotPlayerRegistAndCreate( 217, "IQ5", POWER_COLOR_BLACK );	//5番 
	scr_BotPlayerRegistAndCreate( 218, "IQ7", POWER_COLOR_BLACK );	//7番 
	scr_BotPlayerRegistAndCreate( 219, "IQ7", POWER_COLOR_BLACK );	//7番 
	scr_BotPlayerRegistAndCreate( 220, "IQ7", POWER_COLOR_BLACK );	//7番 
	scr_BotPlayerRegistAndCreate( 221, "IQ7", POWER_COLOR_BLACK );	//7番 
	scr_BotPlayerRegistAndCreate( 222, "IQ7", POWER_COLOR_BLACK );	//7番 
	scr_BotPlayerRegistAndCreate( 223, "IQ7", POWER_COLOR_BLACK );	//7番 
	scr_BotPlayerRegistAndCreate( 224, "IQ7", POWER_COLOR_BLACK );	//7番 


//コールバックの設定をしておくよ！ 
	scr_SetMessageCallback( "miscb_PlayerSally_First", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );		//初回出撃した時のコールバック 
	scr_SetMessageCallback( "miscb_TimeOver", 2, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );		//タイムオーバー時 
	scr_SetTimerCallback( "miscb_Boss201Damage", 3, CB_TYPE_ONCE, 10.0 );	//ボスのダメージ監視 
	scr_SetTimerCallback( "miscb_Boss203Damage", 4, CB_TYPE_ONCE, 10.5 );	//ボスのダメージ監視 

//トラップ登録 
	scr_RegistTrapBox( 1001,   10699.2 ,0.0 ,12135.0 ,2255.1 ,1500.0 ,1990.8 ,-25.0  );	//城 
	scr_RegistTrapBox( 1002,   -7397.6 ,0.0 ,8020.2 ,1710.0 ,1000.0 ,3989.7 ,-43.1  );	//手前ワープ 
	scr_RegistTrapBox( 1003,   6143.4 ,0.0 ,618.6 ,1507.8 ,1000.0 ,4759.2 ,-10.4   );	//奥ワープ 

	scr_RegistTrapSphere( 1004, -5331.32, 0.0, 2420.0, 3300.0 );	//ボス位置3番IQ10_201 
	scr_RegistTrapSphere( 1005, -6816.79, 100.0, -6797.3, 3300.0 );	//ボス位置4番IQ12_203 
	scr_RegistTrapSphere( 1006, -10388.9, 100.0, -1078.5, 3300.0 );	//ボス位置2番IQ11_201 
	scr_RegistTrapSphere( 1008, -1434.89, 0.0, 1606.93, 900.0 );	//ボス位置7番_IQ14_205 


//トラップコールバック 
	scr_SetTrapInCallback( "miscb_TrapIn1002", 10002, CB_TYPE_ONCE, 1002 );
	scr_SetTrapInCallback( "miscb_TrapIn1003", 10003, CB_TYPE_ONCE, 1003 );

	scr_SetTrapInCallback( "miscb_TrapIn1004", 10004, CB_TYPE_ONCE, 1004 );
	scr_SetTrapInCallback( "miscb_TrapIn1005", 10005, CB_TYPE_ONCE, 1005 );
	scr_SetTrapInCallback( "miscb_TrapIn1006", 10006, CB_TYPE_ONCE, 1006 );
	scr_SetTrapInCallback( "miscb_TrapIn1008", 10008, CB_TYPE_ONCE, 1008 );

	//オフラインキャンペーンＨＵＤ設定 
	scr_SetDisableTacticalInfomation();	//バナーテキストを非表示 
	scr_SetEnablePlayerHeroPopup( false );	//ヒーローポップアップの非表示 
	scr_SetEnableInputPlayerVoiceReaction( false );	//リアクションボイスマクロの非表示 
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
	scr_OpenDialog( 0, "C122_01" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_OpenMissionConditionText1(  0, "TXHFC02201", 5 );	//５体のロボを殺せ 


	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();
	scr_PlayerSetForceRespawnPosition( 10216.331055, 500.000000, 11851.6, -115.0 );	//プレイヤーの出現位置を固定 

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
	while( GAME_STATE_PLAYING != scr_GetGamePlayingStatus() )	//もし（）内の条件が満たされている時以下の処理を繰り返し実行する
	{
		local state;						//ローカル変数（一度結果が帰ったら忘れる関数）を設定する 
		state = GetGamePlayingStatus();				//変数に関数の結果の値（戻り値）を代入する 
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );	//デバッグログに変数を表示する 
		suspend();	
	}

	//BOTをゲームに配置 

	//敵 
	scr_BotPlayerSpawnToWorld( 201, -5331.32, 0.0, 2420.0, 0.0 );	//BOSSWmisT 
	scr_BotPlayerSpawnToWorld( 202, -10375.49, 100.0, -1044.5, 0.0 );	//BOSSChelD 
	scr_BotPlayerSpawnToWorld( 203, -6816.79, 100.0, -6797.3, 0.0 );	//BOSSCbomT 

	scr_BotPlayerSpawnToWorld( 205, -1434.89, 0.0, 1606.93, 0.0 );	//BOSSMssD 
	suspend();
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 205, true );

	scr_AddTargetEnemyCallback( "miscb_KillTarget_IQ10", 201, "" );
	scr_AddTargetEnemyCallback( "miscb_KillTarget_IQ11", 202, "" );
	scr_AddTargetEnemyCallback( "miscb_KillTarget_IQ12", 203, "" );
	scr_AddTargetEnemyCallback( "miscb_KillTarget_IQ14", 205, "" );

	scr_AddStandbyEnemyCallback( "miscb_BotDead_IQ10", 201, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead_IQ11", 202, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead_IQ12", 203, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead_IQ14", 205, STANDBY_COUNT_START_TIMING );

	
	
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

//変数の設定 

gKillBossCount <- 0;

////////////////////////////////////////////////
// ここからはコールバック処理 
////////////////////////////////////////////////
function miscb_Boss201Damage()
{
	print( "bossdamage!\n" );
	if(scr_BotPlayerGetLifeRate( 201 ) <= 0.95 )
	{
		//BOSSを発見！ 
		scr_RemoveCallbackFromId( 3 );
		scr_RemoveCallbackFromId( 10004 );
		scr_BotPlayerSetActionTrigger( 201, true );
		scr_BotPlayerSpawnToWorld( 209, -6223.5, 100.0, 2499.2, 0.0 );	//MOBs 
		scr_BotPlayerSpawnToWorld( 210, -5892.8, 100.0, 1785.1, 0.0 );	//MOBs 
		scr_BotPlayerSpawnToWorld( 211, -5274.2, 100.0, 719.85, 0.0 );	//MOBs 
		suspend();
		scr_BotPlayerSetActionTrigger( 209, true );
		scr_BotPlayerSetActionTrigger( 210, true );
		scr_BotPlayerSetActionTrigger( 211, true );
	}
	else{
	scr_SetTimerCallback( "miscb_Boss201Damage", 3, CB_TYPE_ONCE, 10.0 );	//ボスのダメージ監視 
	}
}
function miscb_Boss203Damage()
{
	print( "bossdamage!\n" );
	if(scr_BotPlayerGetLifeRate( 203 ) <= 0.95 )
	{
		//BOSSを発見！ 
		scr_RemoveCallbackFromId( 4 );
		scr_RemoveCallbackFromId( 10005 );
		scr_BotPlayerSetActionTrigger( 203, true );
		scr_BotPlayerSpawnToMonument( 215, "gfmo_006" );
		scr_BotPlayerSpawnToMonument( 216, "gfmo_006" );
		scr_BotPlayerSpawnToMonument( 217, "gfmo_006" );
		suspend();
		scr_BotPlayerSetActionTrigger( 215, true );
		scr_BotPlayerSetActionTrigger( 216, true );
		scr_BotPlayerSetActionTrigger( 217, true );
	}
	else{
	scr_SetTimerCallback( "miscb_Boss203Damage", 4, CB_TYPE_ONCE, 10.5 );	//ボスのダメージ監視 
	}
}

//プレイヤーが出撃した時のコールバック処理
function miscb_PlayerSally_First()

{
	print( "Player is sally!\n" );
	
	//カメラを寄りの背後視点に変更 
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( false );

	//モニュメント操作 
	scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_WHITE );	//T04 
	scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );	//T06 
	scr_CompleteMonumentBuild( "gfmo_006", POWER_COLOR_BLACK );	//T02 

	scr_WaitStart( 1.0 );	//１秒待つよ 
	while( scr_Waiting() )	//待つのが終るのを監視するよ 
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C121_02" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	mis_WarpToMonument04();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C121_07" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

//	scr_OpenMissionConditionText1(  0, "$TXHFC12201", 5 );	//達成条件を表示 
//	scr_OpenMissionStateText1( 0, "$TXHFS12201", gKillBossCount );
	scr_OpenMissionConditionText2(  0, "TXHFC02202", 5, gKillBossCount );	//何体殺した 


	scr_SetTrapInCallback( "miscb_TrapIn1001", 10001, CB_TYPE_ALWAYS, 1001 );	

	//味方 
	scr_BotPlayerSpawnToMonument( 101, "gfmo_002" );
	scr_BotPlayerSpawnToMonument( 102, "gfmo_002" );
	scr_BotPlayerSpawnToMonument( 103, "gfmo_002" );
//	scr_BotPlayerSpawnToMonument( 104, "gfmo_004" );
	suspend();
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );
//	scr_BotPlayerSetActionTrigger( 104, true );

	//リスポーン向きを変更 
	scr_SetMonumentRebirthDirection( "gfmo_005", 9.29, 9.29 );	//３番タワー 
	scr_SetMonumentRebirthDirection( "gfmo_006", -120.0, -120.0 );	//２番タワー 
	scr_SetMonumentRebirthDirection( "gfmo_002", 15.0, 15.0 );	//4番タワー 


}
function miscb_TimeOver()
{
	print( "TimeOver!\n" );
	
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	scr_WaitStart( 0.5 );
	while( scr_Waiting() )	
	{
		suspend();
	}
	
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C121_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();


	scr_GameSetMissionFailure();	//ミッション失敗 

}
function mis_MassageAtKilltarget()
{
//	scr_PauseOn();	
//	scr_OpenDialog( 0, "C122_02" );
//	while( scr_IsOpenDialog(0) )
//	{
//		suspend();
//	}
//	scr_PauseOff();
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMB22021" );	//  
}
function mis_CheckKillTargetEvent()
{
	if(gKillBossCount == 1)
	{
		scr_OpenMissionConditionText2(  0, "TXHFC02202", 5, gKillBossCount );	//何体殺した 
	}
	if(gKillBossCount == 2)
	{
		scr_OpenMissionConditionText2(  0, "TXHFC02202", 5, gKillBossCount );	//何体殺した 
	}
	if(gKillBossCount == 3)
	{
		scr_OpenMissionConditionText2(  0, "TXHFC02202", 5, gKillBossCount );	//何体殺した 
	}
	if(gKillBossCount == 4)
	{
		scr_BotPlayerSpawnToWorld( 204, -3009.477539, 554.683167, -1765.202393, 0.0 );	//BOSSWspdD 
		scr_BotPlayerSpawnToWorld( 215, -3557.624512, 523.079102, -1571.907715, 0.0 );	//BOSSWspdD 
		scr_BotPlayerSpawnToWorld( 216, -2560.883789, 525.868958, -1470.157715, 0.0 );	//BOSSWspdD 
		scr_BotPlayerSpawnToWorld( 217, -2891.775879, 521.376221, -2408.854248, 0.0 );	//BOSSWspdD 
		suspend();
		scr_BotPlayerSetActionTrigger( 204, true );
		scr_BotPlayerSetActionTrigger( 215, true );
		scr_BotPlayerSetActionTrigger( 216, true );
		scr_BotPlayerSetActionTrigger( 217, true );
		scr_AddTargetEnemyCallback( "miscb_KillTarget_IQ13", 204, "" );
		scr_AddStandbyEnemyCallback( "miscb_BotDead_IQ13", 204, STANDBY_COUNT_START_TIMING );
		
		scr_OpenMissionConditionText2(  0, "TXHFC02202", 5, gKillBossCount );	//何体殺した 

		mis_MassageAtKilltarget();
	}
}
function miscb_KillTarget_IQ10()
{
	print( "killtarget01!\n" );
	scr_RemoveTargetEnemyCallback( 201 );

}
function miscb_BotDead_IQ10()
{
	gKillBossCount = (gKillBossCount + 1);
	scr_BotPlayerSetRespawnEnable( 201, false );
	//従者を殺す 
	scr_BotPlayerSetLife( 209, 0 );
	scr_BotPlayerSetLife( 210, 0 );
	scr_BotPlayerSetLife( 211, 0 );
	
	mis_CheckKillTargetEvent();
}
function miscb_KillTarget_IQ11()
{
	print( "killtarget02!\n" );
	scr_RemoveTargetEnemyCallback( 202 );
}
function miscb_BotDead_IQ11()
{
	gKillBossCount = (gKillBossCount + 1);
	scr_BotPlayerSetRespawnEnable( 202, false );
	//従者を殺す 
	scr_BotPlayerSetLife( 206, 0 );
	scr_BotPlayerSetLife( 207, 0 );
	scr_BotPlayerSetLife( 208, 0 );

	mis_CheckKillTargetEvent();
}
function miscb_KillTarget_IQ12()
{
	print( "killtarget03!\n" );
	scr_RemoveTargetEnemyCallback( 203 );

}
function miscb_BotDead_IQ12()
{
	gKillBossCount = (gKillBossCount + 1);
	scr_BotPlayerSetRespawnEnable( 203, false );
	//従者を殺す 
	scr_BotPlayerSetLife( 212, 0 );
	scr_BotPlayerSetLife( 213, 0 );
	scr_BotPlayerSetLife( 214, 0 );

	mis_CheckKillTargetEvent();
}
function miscb_KillTarget_IQ14()
{
	print( "killtarget05!\n" );
	scr_RemoveTargetEnemyCallback( 205 );
}
function miscb_BotDead_IQ14()
{
	gKillBossCount = (gKillBossCount + 1);
	scr_BotPlayerSetRespawnEnable( 205, false );
	//従者を殺す 
	scr_WaitStart( 1.0 );
	while( scr_Waiting() )	{
		suspend();
	}
	scr_BotPlayerSetLife( 218, 0 );
	scr_BotPlayerSetLife( 219, 0 );
	scr_BotPlayerSetLife( 220, 0 );
	scr_BotPlayerSetLife( 221, 0 );
	scr_BotPlayerSetLife( 222, 0 );

	mis_CheckKillTargetEvent();
}
function miscb_KillTarget_IQ13()
{
	print( "killtarget04!\n" );
	
	scr_RemoveCallbackAll();
	scr_BotPlayerSetLife( 215, 0 );
	scr_BotPlayerSetLife( 216, 0 );
	scr_BotPlayerSetLife( 217, 0 );
	scr_RemoveTargetEnemyCallback( 204 );
	scr_BotPlayerSetRespawnEnable( 204, false );
	scr_GameSetMissionSuccess();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	scr_WaitStart( 2.0 );
	while( scr_Waiting() )	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C122_03" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

}
function miscb_BotDead_IQ13()
{
	print( "killtarget04!\n" );
	
	scr_RemoveCallbackAll();
	scr_BotPlayerSetLife( 215, 0 );
	scr_BotPlayerSetLife( 216, 0 );
	scr_BotPlayerSetLife( 217, 0 );
	scr_RemoveTargetEnemyCallback( 204 );
	scr_BotPlayerSetRespawnEnable( 204, false );
	scr_GameSetMissionSuccess();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	scr_WaitStart( 2.0 );
	while( scr_Waiting() )	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C122_03" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
}
function mis_WarpInfo()
{
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenDialog( 0, "C121_05" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
}
function miscb_TrapIn1001()
{
	print( "TrapIn 1001!\n" );
	scr_WaitStart( 1.6 );
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_PauseOn();	
	mis_WarpInfo();
	mis_WarpToMonument04();
	scr_PauseOff();	


}
function miscb_TrapIn1002()
{
	print( "TrapIn 1002!\n" );
	scr_PauseOn();	
	mis_WarpInfo();
	mis_WarpToMonument04();
	scr_PauseOff();	

}
function miscb_TrapIn1003()
{
	print( "TrapIn 1003!\n" );
	scr_PauseOn();	
	mis_WarpInfo();
	mis_WarpToMonument04();
	scr_PauseOff();	

}
function miscb_TrapIn1004()
{
	print( "TrapIn 1004!\n" );
	scr_RemoveCallbackFromId( 3 );
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSpawnToWorld( 209, -6223.5, 100.0, 2499.2, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 210, -5892.8, 100.0, 1785.1, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 211, -5274.2, 100.0, 719.85, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 209, true );
	scr_BotPlayerSetActionTrigger( 210, true );
	scr_BotPlayerSetActionTrigger( 211, true );

}
function miscb_TrapIn1005()
{
	print( "TrapIn 1005!\n" );
	scr_RemoveCallbackFromId( 4 );
	scr_BotPlayerSetActionTrigger( 203, true );
	scr_BotPlayerSpawnToWorld( 212, -7984.0, 100.0, -7190.6, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 213, -7484.0, 100.0, -6371.1, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 214, -5905.0, 100.0, -7132.2, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 212, true );
	scr_BotPlayerSetActionTrigger( 213, true );
	scr_BotPlayerSetActionTrigger( 214, true );

}
function miscb_TrapIn1006()
{
	print( "TrapIn 1006!\n" );
	scr_BotPlayerSpawnToWorld( 206, -9739.138672, 100.000000, -596.60107, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 207, -11224.563477, 100.000000, -490.3203, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 208, -10342.878906, 100.000000, -1875.781, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );
	scr_BotPlayerSetActionTrigger( 208, true );

}
function miscb_TrapIn1008()
{
	print( "TrapIn 1007!\n" );
	scr_BotPlayerSpawnToWorld( 218, 492.22, 100.00, 1723.4, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 219, 435.94, 100.00, 1191.4, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 220, -303.79, 100.00, 325.6, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 221, -2498.66, 99.64, 669.6, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 222, -2140.75, 100.00, 408.4, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 218, true );
	scr_BotPlayerSetActionTrigger( 219, true );
	scr_BotPlayerSetActionTrigger( 220, true );
	scr_BotPlayerSetActionTrigger( 221, true );
	scr_BotPlayerSetActionTrigger( 222, true );

}
//ワープ
function mis_WarpToMonument04()
{
	// フェードしてワープ
	scr_FadeOutBlack( 1.0 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	// ワープ
	scr_PlayerWarp(  -5764.734863, 100.000000, -2499.236328, 22.0 );
	// 1フレーム待たないとワープが完了しない
	suspend();
	// カメラを背後へリセット
	scr_ResetGameCameraBehind( true );
	
	scr_FadeIn( 1.0 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
}
