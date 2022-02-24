///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_on_0202\mission00.nut 
//	概要	：オフラインキャンペーン レベル2 キャンペーン2 ミッション1 
//	作成	：落合 
//	作成日	：110608 
//	目的	：［変則撃退］3分間城を破壊されないよう敵を倒す 
//
///////////////////////////////////////////////////////////////////////////////////////////////
function loadMission() 
{
	print("[sample mission] load()\n");
	scr_SetDisableGimmickType( GIMMICK_RAFT );
	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );
	scr_SetDisableGimmickType( GIMMICK_BATTERING_RAM );	
	scr_SetDisableGimmickType( GIMMICK_CANNON );


}
function startMission() 
{
	print("[sample mission] start()\n");


	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 0 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 0 );

	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_NORMAL, 2 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_PENALTY, 2 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 3 );



//コールバックの設定をしておくよ！ 
	scr_SetMessageCallback( "miscb_PlayerSally_First", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );
	scr_SetMessageCallback( "miscb_GameSet", 2, CB_TYPE_ONCE,  MESSAGE_GAME_BREAK_CASTLE_MONUMENT );	//ゲームセット 
	scr_SetMessageCallback( "miscb_TimeOver", 3, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );

//BOT登録 
	scr_BotPlayerRegistAndCreate( 101, "NOOB03DC", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "NOOB04DC", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 103, "MEDIC02DC", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 104, "MAGE02DC", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 105, "NOOB05D", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 106, "NOOB06D", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "LITTLE_GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 202, "LITTLE_GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "LITTLE_GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 204, "LITTLE_GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 205, "GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 206, "GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 207, "GREYS02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 208, "GREYS02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 209, "GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 210, "GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 211, "GREYS02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 212, "GREYS02", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 213, "GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 214, "GREYS01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 215, "GREYS01", POWER_COLOR_BLACK );

	scr_AddStandbyEnemyCallback( "miscb_BotDead201", 201, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead202", 202, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead203", 203, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead204", 204, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead205", 205, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead206", 206, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead207", 207, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead208", 208, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead209", 209, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead210", 210, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead211", 211, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead212", 212, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead213", 213, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead214", 214, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_BotDead215", 215, STANDBY_CAN_RESPAWN_TIMING );


	scr_BotPlayerSetLifeRecover( 201, false );
	scr_BotPlayerSetLifeRecover( 202, false );
	scr_BotPlayerSetLifeRecover( 203, false );
	scr_BotPlayerSetLifeRecover( 204, false );
	scr_BotPlayerSetLifeRecover( 205, false );
	scr_BotPlayerSetLifeRecover( 206, false );
	scr_BotPlayerSetLifeRecover( 207, false );
	scr_BotPlayerSetLifeRecover( 208, false );
	scr_BotPlayerSetLifeRecover( 209, false );
	scr_BotPlayerSetLifeRecover( 210, false );
	scr_BotPlayerSetLifeRecover( 211, false );
	scr_BotPlayerSetLifeRecover( 212, false );
	scr_BotPlayerSetLifeRecover( 213, false );
	scr_BotPlayerSetLifeRecover( 214, false );
	scr_BotPlayerSetLifeRecover( 215, false );


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

	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_ENEMY_CASTLE_APPROACH, true );
	scr_SetEnableTacticalBannerText( SCR_BANNER_HUDREQ_DISP_ENEMY_CASTLE_ATTACK, true );


//トラップ登録 
	scr_RegistTrapBox( 1000, 16214.6 ,100.0 ,-3931.2 ,2869.0 ,1500.0 ,2986.9 ,-337.5  );	//城内


	scr_RegistTrapBox( 1001,  7092.1 ,0.0 ,-3586.6 ,355.5 ,1500.0 ,3923.1 ,-356.1  );	// 
	scr_RegistTrapBox( 1001,  9636.7 ,0.0 ,3052.3 ,350.0 ,1500.0 ,4082.4 ,-323.8  );	// 

//トラップコールバック 
	scr_SetTrapInCallback( "miscb_TrapIn1001", 10001, CB_TYPE_ALWAYS, 1001 );	
	scr_SetTrapOutCallback( "miscb_TrapOut1000", 10000, CB_TYPE_ALWAYS, 1000 );	//城内から出たら押し戻す 


//	scr_SetTrapInCallback( "miscb_TrapIn1001", 10001, CB_TYPE_ONCE, 1001 );	
	//出撃前メッセージ 
	scr_WaitStart( 0.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C311_01" );
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
	scr_OpenDialog( 0, "C311_07" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();


	scr_OpenMissionConditionText(  0, "TXHFC05101" );	//達成条件を表示 


	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();
	scr_PlayerSetForceRespawnPosition( 16031.367188, 100.000000, -3937.96, -65.0 );	//プレイヤーの出現位置を固定 


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
	scr_WaitStart( 0.2 );	//１秒待つよ 
	while( scr_Waiting() )	//待つのが終るのを監視するよ 
	{
		suspend();
	}
	scr_BotPlayerSpawnToMonument( 102, "gcmoA_001" );
	scr_WaitStart( 0.1 );	//１秒待つよ 
	while( scr_Waiting() )	//待つのが終るのを監視するよ 
	{
		suspend();
	}
	scr_BotPlayerSpawnToMonument( 103, "gcmoA_001" );
	scr_WaitStart( 0.3 );	//１秒待つよ 
	while( scr_Waiting() )	//待つのが終るのを監視するよ 
	{
		suspend();
	}
	scr_BotPlayerSpawnToMonument( 104, "gcmoA_001" );
	scr_BotPlayerSpawnToWorld( 105, 13366.1, 100.0, -3333.7, 0.0 );	//
	scr_BotPlayerSpawnToWorld( 106, 13732.3, 100.0, -2405.7, 0.0 );	//
	suspend();
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );
	scr_BotPlayerSetActionTrigger( 104, true );
	scr_BotPlayerSetActionTrigger( 105, true );
	scr_BotPlayerSetActionTrigger( 106, true );

	scr_SetTimerCallback( "miscb_1stWave", 2001, CB_TYPE_ONCE, 60.0 );
	scr_SetTimerCallback( "miscb_2ndWave", 2002, CB_TYPE_ONCE, 120.0 );
	scr_SetTimerCallback( "miscb_endWave", 2003, CB_TYPE_ONCE, 210.0 );

	scr_CompleteMonumentBuild( "gfmo_001", POWER_COLOR_BLACK );
	scr_CompleteMonumentBuild( "gfmo_002", POWER_COLOR_BLACK );
	scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_BLACK );

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



//プレイヤーが初回出撃した時のコールバック処理
function miscb_PlayerSally_First()
{
	print( "Player is sally!\n" );
//	scr_OpenMissionConditionText(  0, "$TXHFC31101" );	//達成条件を表示 
	//カメラを寄りの背後視点に変更 
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );	//カメラをズームに設定 
	scr_ResetGameCameraBehind( false );



}
//ゲームセット時のコールバック 
function miscb_GameSet()
{
	print( "Game Set Winblack!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	scr_GameSetMissionFailure();
	// タイミングはビッグタワー破壊直後。バナーテキスト表示を待つ処理を入れよう！ 
	scr_WaitStart( 1.6 );
	while( scr_Waiting() )
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C311_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

}
function miscb_1stWave()
{
	print( "1stwave!\n" );

	scr_RemoveCallbackFromId( 10000 );


	mis_SpawnBot( 201,  7503.282227, 259.129364, -2823.545898, 0.0 );
	scr_BotPlayerSpawnToMonument( 202, "gfmo_001" );
	mis_SpawnBot( 203,  7503.282227, 259.129364, -2823.545898, 0.0 );
	scr_BotPlayerSpawnToMonument( 204, "gfmo_001" );
	mis_SpawnBot( 205,  7503.282227, 259.129364, -2823.545898, 0.0 );
	scr_BotPlayerSpawnToMonument( 206, "gfmo_001" );
	mis_SpawnBot( 207,  7503.282227, 259.129364, -2823.545898, 0.0 );


	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 203, true );
	scr_BotPlayerSetActionTrigger( 204, true );
	scr_BotPlayerSetActionTrigger( 205, true );
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );


	suspend();
	suspend();


	scr_BotPlayerSetLifeRate( 201, 0.09 );
	scr_BotPlayerSetLifeRate( 202, 0.09 );
	scr_BotPlayerSetLifeRate( 203, 0.09 );
	scr_BotPlayerSetLifeRate( 204, 0.09 );
	scr_BotPlayerSetLifeRate( 205, 0.09 );
	scr_BotPlayerSetLifeRate( 206, 0.09 );
	scr_BotPlayerSetLifeRate( 207, 0.09 );



	scr_WaitStart( 1.0 );
	while( scr_Waiting() )
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C311_02" );
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
	scr_OpenDialog( 0, "C311_08" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();


}
function miscb_2ndWave()
{
	print( "2ndwave!\n" );

	mis_SpawnBot( 208,  8856.31443, 544.165, -4200.0, 0.0 );
	mis_SpawnBot( 209,  9618.19822, 392.809, -5128.3, 0.0 );
	mis_SpawnBot( 210,  10401.0919, 373.368, -5157.1, 0.0 );
	mis_SpawnBot( 211,  12457.9573, 430.000, 154.059, 0.0 );
	mis_SpawnBot( 212,  12968.8490, 430.000, 482.157, 0.0 );
	mis_SpawnBot( 213,  12195.8097, 430.000, 1224.88, 0.0 );
	mis_SpawnBot( 214,  10941.3031, 400.000, 3191.64, 0.0 );
	mis_SpawnBot( 215,  7250.23735, 100.009, 119.598, 0.0 );

	scr_BotPlayerSetActionTrigger( 208, true );
	scr_BotPlayerSetActionTrigger( 209, true );
	scr_BotPlayerSetActionTrigger( 210, true );
	scr_BotPlayerSetActionTrigger( 211, true );
	scr_BotPlayerSetActionTrigger( 212, true );
	scr_BotPlayerSetActionTrigger( 213, true );
	scr_BotPlayerSetActionTrigger( 214, true );
	scr_BotPlayerSetActionTrigger( 215, true );
}
function miscb_endWave()
{
	print( "endwave!\n" );

//	scr_PauseOn();	
//	scr_OpenDialog( 0, "C311_03" );
//	while( scr_IsOpenDialog(0) )
//	{
//		suspend();
//	}
//	scr_PauseOff();
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMD11031" );	//  


}
//ワープ
function mis_Warp()
{
	scr_FadeOutBlack( 1.0 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
	scr_PlayerWarp( 14349.2, 1100.0, -3201.0, -65.0 );
	suspend();
	scr_ResetGameCameraBehind( true );
	scr_FadeIn( 1.0 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
}
function miscb_TrapIn1001()
{
	print( "TrapIn 1001!\n" );
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C311_05" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	mis_Warp();
	scr_PauseOff();
}
function miscb_TrapOut1000()
{
	print( "Trapout 1000!\n" );
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C311_07" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	mis_Warp();
	scr_PauseOff();

}
function miscb_TimeOver()
{
	print( "TimeOver!\n" );
	scr_RemoveCallbackAll();
	scr_GameSetMissionSuccess();

	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	scr_BotPlayerSetLife( 201, 0 );
	scr_BotPlayerSetLife( 202, 0 );
	scr_BotPlayerSetLife( 203, 0 );
	scr_BotPlayerSetLife( 204, 0 );
	scr_BotPlayerSetLife( 205, 0 );
	scr_BotPlayerSetLife( 206, 0 );
	scr_BotPlayerSetLife( 207, 0 );
	scr_BotPlayerSetLife( 208, 0 );
	scr_BotPlayerSetLife( 209, 0 );
	scr_BotPlayerSetLife( 210, 0 );
	scr_BotPlayerSetLife( 211, 0 );
	scr_BotPlayerSetLife( 212, 0 );
	scr_BotPlayerSetLife( 213, 0 );
	scr_BotPlayerSetLife( 214, 0 );
	scr_BotPlayerSetLife( 215, 0 );

	scr_WaitStart( 3.8 );
	while( scr_Waiting() )
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C311_04" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();



}
/////////////ボットの復活ファンクション////////////////
function mis_SpawnBot( regist_id , x, y, z, roty )
{
	print( "spawn!\n" );
	scr_RemoveScene( regist_id, true );
	suspend();
	suspend();
	print( "removedScene!\n" );
	if( scr_BotPlayerGetLife( regist_id ) == 0 )
	{
		scr_BotPlayerSpawnToWorld( regist_id, x, y, z, roty );
		print( "spawned!\n" );
		scr_CreateSceneEffect( regist_id, "Cpmg07c",  x, y, z, roty );
		print( "createdscene!\n" );
	}
	suspend();
	suspend();
	print( "suspended!\n" );
	if( scr_BotPlayerGetLife( regist_id ) != 0 )
	{
		scr_BotPlayerSetLifeRate( regist_id, 0.09 );
		print( "setKiferate!\n" );
	}
}
function miscb_BotDead201()
{
	print( "botdead201!\n" );
	mis_SpawnBot( 201,  9944.82429, 100.000, 67.1864, 0.0 );
}
function miscb_BotDead202()
{
	print( "botdead202!\n" );
	mis_SpawnBot( 202,  10185.9822, 100.000, -450.33, 0.0 );
}
function miscb_BotDead203()
{
	print( "botdead203!\n" );
	mis_SpawnBot( 203,  9806.04299, 100.000, -1203.0, 0.0 );
}
function miscb_BotDead204()
{
	print( "botdead204!\n" );
	mis_SpawnBot( 204,  9563.13379, 100.000, -1929.3, 0.0 );
}
function miscb_BotDead205()
{
	print( "botdead205!\n" );
	mis_SpawnBot( 205,  10042.6646, 100.000, -2265.9, 0.0 );
}
function miscb_BotDead206()
{
	print( "botdead206!\n" );
	mis_SpawnBot( 206,  10019.3976, 396.081, -3152.1, 0.0 );
}
function miscb_BotDead207()
{
	print( "botdead207!\n" );
	mis_SpawnBot( 207,  9329.37693, 419.579, -3468.5, 0.0 );
}
function miscb_BotDead208()
{
	print( "botdead208!\n" );
	mis_SpawnBot( 208,  8856.31443, 544.165, -4200.0, 0.0 );
}
function miscb_BotDead209()
{
	print( "botdead209!\n" );
	mis_SpawnBot( 209,  9618.19822, 392.809, -5128.3, 0.0 );
}
function miscb_BotDead210()
{
	print( "botdead210!\n" );
	mis_SpawnBot( 210,  10401.0919, 373.368, -5157.1, 0.0 );
}
function miscb_BotDead211()
{
	print( "botdead211!\n" );
	mis_SpawnBot( 211,  12457.9573, 430.000, 154.059, 0.0 );
}
function miscb_BotDead212()
{
	print( "botdead212!\n" );
	mis_SpawnBot( 212,  12968.8490, 430.000, 482.157, 0.0 );
}
function miscb_BotDead213()
{
	print( "botdead213!\n" );
	mis_SpawnBot( 213,  12195.8097, 430.000, 1224.88, 0.0 );
}
function miscb_BotDead214()
{
	print( "botdead214!\n" );
	mis_SpawnBot( 214,  10941.3031, 400.000, 3191.64, 0.0 );
}
function miscb_BotDead215()
{
	print( "botdead215!\n" );
	mis_SpawnBot( 215,  7250.23735, 100.009, 119.598, 0.0 );
}