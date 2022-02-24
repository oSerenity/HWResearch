///////////////////////////////////////////////////////////////////////////////////////////////
//
// ファイル名：cam_of_0001\mission02.nut 
//	概要	：オフラインキャンペーン レベル0 チュートリアル ミッション3 
//	作成	：落合 
//	作成日	：110717 
//	目的	：兵器ギミックに関するチュートリアル 
//
///////////////////////////////////////////////////////////////////////////////////////////////

function loadMission() {
	print("[sample mission] load()\n");
	
	//
	// ギミックの使用不可設定は このloadMission()内でコールすること！
	//
	
	scr_SetDisableGimmickType( GIMMICK_BRIDGE1 );
	scr_SetDisableGimmickType( GIMMICK_BRIDGE2 );
	// 爆弾岩は使用不可
	scr_SetDisableGimmickType( GIMMICK_BOMBSTONE );
	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );
	//丸太凍結 
	scr_SetSleepGimmickType( GIMMICK_BATTERING_RAM );

}

function startMission() {
	print("[sample mission] start()\n");
	
	// プレイヤーのプロファイルを固定する
//	scr_PlayerSetFixedProfile( 0, "PlayerCleric" );
	scr_PlayerSetFixedProfile( 1, "PlayerCleric" );
//	scr_PlayerSetFixedProfile( 2, "PlayerCleric" );
	//経験値取得を制御 
	scr_PlayerSetEnableGetExperience( false );
	//ログ非表示 
	scr_SetDisableTacticalInfomation();
	
	scr_SetEnableGameWinDemo( false );

	// アイテム取得不可
	scr_DisableGameReward();
	// トラップエリア登録
	scr_RegistTrapBox( 1000, 16214.6 ,100.0 ,-3931.2 ,2869.0 ,1500.0 ,2986.9 ,-337.5  );	//城内
	scr_RegistTrapBox( 1001, -57.1 ,100.0 ,-797.1 ,922.9 ,1500.0 ,7236.4 ,0.0  );       	//戻り道
//	scr_RegistTrapBox( 1002, -9022.0 ,100.0 ,-1361.3 ,488.4 ,1500.0 ,1422.1 ,-24.7  );  	//上陸
	scr_RegistTrapBox( 1003, -12866.1 ,100.0 ,-2597.7 ,192.5 ,1500.0 ,4625.9 ,-24.7  ); 	//的城の前
	scr_RegistTrapBox( 1004, -16184.2 ,100.0 ,-4332.0 ,1971.7 ,1500.0 ,1904.3 ,-24.7  );	//的城
	scr_RegistTrapBox( 1005, -13995.7 ,100.0 ,-3202.1 ,420.7 ,100.0 ,623.6 ,-24.4   );  	//城門

	
	// コールバック
	scr_SetMessageCallback( "miscb_PlayerSally", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	//出撃 
	scr_SetMessageCallback( "miscb_GameSetWinWhite", 8, CB_TYPE_ONCE, MESSAGE_GAME_BREAK_BLACK_CASTLE_MONUMENT );	//勝利時 


	// BOTの登録
	scr_BotPlayerRegistAndCreate( 101, "AllanC", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "MightyC", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 202, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 204, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 205, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 206, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 207, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 208, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 209, "DEKU", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 210, "DEKU", POWER_COLOR_BLACK );

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


	//BOTのレベルアップでのスキル習得を封じる 
	scr_BotPlayerDisableLearningSkillByLevelUp();
	scr_SetEnablePlayerHeroPopup( false );
	scr_SetEnableInputPlayerVoiceReaction( false );

	//出撃前メッセージ 

	scr_WaitStart( 0.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_00" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();

	scr_PlayerSetForceRespawnPosition( 16378.294922, 100.000000, -3963.266357, -128.0 );	//プレイヤーの出現位置を固定 

	// ゲーム開始を待ちます
	mis_WaitGameStart();
}
function mis_WaitPlayerCreate()
{
	print("create()\n");
	while( !scr_PlayerIsCreateBody( 0 ) )
	{
		suspend();
	}
}
function mis_WaitGameStart()
{
	while( GAME_STATE_PLAYING!=scr_GetGamePlayingStatus() )
	{
		local state = GetGamePlayingStatus();
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );
		suspend();
	}

	scr_BotPlayerSpawnToWorld( 101, 16169.583984, 100.000000, -4631.985352, 50.0 );	//味方 
	scr_BotPlayerSpawnToWorld( 102, 15578.662109, 100.000000, -4157.663574, 50.0 );
	scr_BotPlayerSetLifeRecover( 101, false );
	scr_BotPlayerSetLifeRecover( 102, false );
	scr_BotPlayerSetVoiceReactionNextHeal( 101 );
	scr_BotPlayerSetVoiceReactionNextHeal( 102 );
	suspend();
	scr_BotPlayerSetLifeRate( 101, 0.2 );
	scr_BotPlayerSetLifeRate( 102, 0.2 );


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

function miscb_PlayerSally()
{
	print("sally()\n");
	//経験値入手を封印 
	scr_PlayerSetEnableGetExperience( false );
	//スキル習得を変更 
	scr_SetEnableSkillPanelAnimation( 0, false );


	scr_SetTrapOutCallback( "miscb_TrapOut1000", 1000, CB_TYPE_ALWAYS, 1000 );	//城内 
	scr_SetTrapInCallback( "miscb_TrapIn1001", 1001, CB_TYPE_ALWAYS, 1001 );	//戻り 道 
	scr_SetTrapInCallback( "miscb_TrapIn1002", 1002, CB_TYPE_ALWAYS, 1002 );	//上陸 
	scr_SetTrapInCallback( "miscb_TrapIn1005", 1005, CB_TYPE_ALWAYS, 1005 );	//城門 


	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );
	scr_ResetGameCameraBehind( false );
	mis_CameraSet();
	mis_CameraSet();
	mis_CameraSet();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_01" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_05, -1.0 );	//Ａ　ヒールを追加？ 
	scr_SetMessageCallback( "miscb_HealSuccess", 2, CB_TYPE_ALWAYS, MESSAGE_PLAYER_SUCCESS_HEAL );	

	scr_RemoveCallbackFromId( 77 );
	scr_SetMessageCallback( "miscb_CastHeal", 77, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_CASTING_HEAL );

	scr_SetMessageCallback( "miscb_CancelHeal", 88, CB_TYPE_ALWAYS, MESSAGE_PLAYER_CANCEL_CASTING_SKILL );

}
function miscb_CastHeal()
{
	print("castheal()\n");
	scr_CloseKeyHelp();
	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_06, -1.0 );
}
function miscb_CancelHeal()
{
	print("cancelheal()\n");
	scr_CloseKeyHelp();
	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_05, -1.0 );	//Ａ　ヒールを追加？ 

	scr_RemoveCallbackFromId( 77 );
	scr_SetMessageCallback( "miscb_CastHeal", 77, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_CASTING_HEAL );
}
function miscb_HealSuccess()
{
	print("healcount()\n");

	if(scr_GetRecordTotalHealCount() == 2)
	{
		scr_RemoveCallbackFromId( 88 );
		gCheckPointNo = 1;
		scr_CloseKeyHelp();
		scr_RemoveCallbackFromId( 2 );
		scr_WaitStart( 2.5 );	
		while( scr_Waiting() )	
		{
			suspend();
		}

		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_02" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();

		scr_ResetGameCameraDirection( 14696.822266, -1651.484619, false );
		scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
		mis_CameraSet();

		scr_CreateSceneEffect( 300, "Ccam01c", 15861.946289, 106.000000, -3790.797363, 25.0 );	//↑ 
		scr_CreateSceneEffect( 301, "Ccam01c", 17455.474609, 706.000000, -2660.985107, -67.0 );	//↑ 
		scr_CreateSceneEffect( 302, "Ccam01c", 16255.296875, 106.000000, -2569.314697, 113.0 );	//↑ 
		scr_CreateSceneEffect( 303, "Ccam01c", 15802.107422, 781.000000, -1899.949951, -66.0 );	//↑ 
		scr_CreateSceneEffect( 400, "Ccam02c", 14724.213867, 1352.667725, -1709.489990, 0.0 );	//↓ 
	
		scr_RegistTrapSphere( 1500, 14663.495117, 960.000000, -1680.492432, 430.0 );	//バリスタ
		scr_SetTrapInCallback( "miscb_TrapIn1500", 1500, CB_TYPE_ONCE, 1500 );
	}
	else
	{
		scr_CloseKeyHelp();
		scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_05, -1.0 );	//Ａ　ヒールを追加？ 

		scr_RemoveCallbackFromId( 77 );
		scr_SetMessageCallback( "miscb_CastHeal", 77, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_CASTING_HEAL );
	}

}

function miscb_TrapIn1500()
{
	print("in1500()\n");
	scr_RemoveScene( 300, true );
	scr_RemoveScene( 301, true );
	scr_RemoveScene( 302, true );
	scr_RemoveScene( 303, true );
	scr_RemoveScene( 400, true );


	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_04" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	gCheckPointNo = 2;

	scr_PlayerLearnSkill( SCR_CONSTRUCT, false );

	mis_SpawnTargetBallista();
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 203, true );

//	scr_OpenMissionExpainText( 0, "#TXCMA02043" );	//一掃せよ  


	scr_SetMessageCallback( "miscb_KilledByBallista", 3, CB_TYPE_ALWAYS, MESSAGE_PLAYER_KILL_BY_GIMMICK );	//ギミックで倒した 

}
function mis_SpawnTargetBallista()
{
	print("spawnBallistaTarget()\n");
	scr_BotPlayerSpawnToWorld( 201, 12897.951172, 100.000000, -1535.420654, 112.0 );
	scr_BotPlayerSpawnToWorld( 202, 12609.159180, 100.000000, -2213.000977, 112.0 );
	scr_BotPlayerSpawnToWorld( 203, 13228.147461, 100.000000, -2168.871094, 112.0 );
	scr_AddStandbyEnemyCallback( "miscb_KillBot201", 201, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot202", 202, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot203", 203, STANDBY_COUNT_START_TIMING );

}
gUseBallista <- 0;
function miscb_KilledByBallista()
{
	print("kill2099996()\n");

	gUseBallista = (gUseBallista+1);
}
gKillTargetsCount <- 0;
function miscb_KillBot201()
{
	print("dead201()\n");
	scr_RemoveStandbyEnemyCallback( 201 );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargets();
}
function miscb_KillBot202()
{
	print("dead202()\n");
	scr_RemoveStandbyEnemyCallback( 202 );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargets();
}
function miscb_KillBot203()
{
	print("dead202()\n");
	scr_RemoveStandbyEnemyCallback( 203 );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargets();
}
function mis_KillAllTargets()
{
	print("kill206()\n");

	if(gKillTargetsCount == 3  &&  gUseBallista != 3 )
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_04" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		mis_SpawnTargetBallista();	//敵出現 
		gKillTargetsCount = 0;
		gUseBallista = 0;
	}
	if(gKillTargetsCount == 3  &&  gUseBallista == 3 )
	{
		scr_CloseMissionExpainText( 0 );
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		scr_RemoveCallbackFromId( 3 );

		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_05" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();

		scr_CreateSceneEffect( 410, "Ccam02c", 15949.004883, 400.000000, -4242.297363, 0.0 );	//↓ 
		scr_RegistTrapSphere( 1501, 15949.004883, 100.000000, -4242.297363, 500.0 );
		scr_SetTrapInCallback( "miscb_TrapIn1501", 1501, CB_TYPE_ONCE, 1501 );
		gCheckPointNo = 3;
	}
}

function miscb_TrapIn1501()
{
	print("in1501()\n");
	scr_RemoveScene( 410, true );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_PlayerLearnSkill( SCR_TRANSPORT, false );

	scr_OpenKeyHelp( SCR_KEY_HELP_TRANSPORT, -1.0 );
	scr_BotPlayerSetMarchCastleMonument( POWER_COLOR_WHITE, false );

	scr_SetMessageCallback( "miscb_Transport", 4, CB_TYPE_ALWAYS, MESSAGE_PLAYER_SUCCESS_TRANSPORT );
	scr_SetMessageCallback( "miscb_Team", 5, CB_TYPE_ALWAYS,  MESSAGE_PLAYER_BEGIN_TEAM_SKILL );
	scr_SetMessageCallback( "miscb_TeamCancel", 6, CB_TYPE_ALWAYS,  MESSAGE_PLAYER_CANCEL_TEAM_SKILL );

	scr_RegistTrapSphere( 1502, -9609.232422, 250.0, -1983.852539, 800.0 );	//１番タワー 
	scr_SetTrapInCallback( "miscb_TrapIn1502", 1502, CB_TYPE_ONCE, 1502 );

	scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_WHITE );
	gCheckPointNo = 4;

}
function miscb_Transport()
{
	print("useTransport()\n");
	scr_RemoveCallbackFromId( 10000 );
	gCheckPointNo = 5;

	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_CameraSet();

	scr_WaitStart( 1.2 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_SetTrapInCallback( "miscb_TrapIn1000", 10000, CB_TYPE_ALWAYS, 1000 );	//城内 

}
function miscb_Team()
{
	print("teamskillstart()\n");
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );

	if(scr_GetMonumentPowerColor( "gfmo_003" ) != POWER_COLOR_WHITE )
	{
			print("towernotBuild()\n");
			scr_CompleteMonumentBuild( "gfmo_003", POWER_COLOR_WHITE );
	}

}
function miscb_TeamCancel()
{
	print("teamskillcanscell()\n");
	scr_BotPlayerSetActionTrigger( 101, false );
	scr_BotPlayerSetActionTrigger( 102, false );
}
function miscb_TrapIn1502()
{
	//１番タワー転送 
	print("in1502()\n");
	scr_RemoveCallbackFromId( 4 );
	scr_RemoveCallbackFromId( 5 );
	scr_RemoveCallbackFromId( 6 );
	scr_CloseKeyHelp();
	scr_RemoveCallbackFromId( 1000 );

	gCheckPointNo = 6;

	scr_WaitStart( 0.5 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_08" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_ResetGameCameraDirection( -16552.822266, -4525.484619, false );
	scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
	mis_CameraSet();

	scr_CreateSceneEffect( 310, "Ccam01c", -9070.542969, 106.000000, -1190.100830, -115.0 );	//↑ 
	scr_CreateSceneEffect( 311, "Ccam01c", -11169.074219, 106.000000, -2078.660156, -115.0 );	//↑ 


	scr_RegistTrapSphere( 1505, -11107.74902, 425.493408, 662.739746, 700.0 );	//キャノン 
	scr_RegistTrapSphere( 1505, -10174.369141, 430.000000, -3736.311279, 700.0 );	//バリスタ 
	scr_RegistTrapSphere( 1506, -14703.454102, 902.265015, -2516.274902, 300.0 );	//バリケド 
	scr_RegistTrapSphere( 1506, -13883.033203, 900.113464, -4207.648926, 300.0 );
	scr_RegistTrapSphere( 1506, -14523.898438, 904.032104, -5674.731445, 300.0 );
	scr_RegistTrapSphere( 1506, -16445.179688, 904.549988, -2135.289795, 300.0 );


	scr_SetTrapInCallback( "miscb_TrapIn1003", 1003, CB_TYPE_ONCE, 1003 );	//的城 の前 
	scr_SetTrapInCallback( "miscb_TrapIn1004", 1004, CB_TYPE_ONCE, 1004 );	//的城 
	scr_SetTrapInCallback( "miscb_TrapIn1505", 1505, CB_TYPE_ALWAYS, 1505 );	//kyanonn 
	scr_SetTrapInCallback( "miscb_TrapIn1506", 1506, CB_TYPE_ONCE, 1506 );	//バリケード 

}
function miscb_TrapIn1003()
{
	print("in1003()\n");
	scr_CloseMissionExpainText( 0 );

//	scr_RemoveScene( 320, true );
	scr_RemoveScene( 321, true );
	scr_ResetGameCameraDirection( -16552.822266, -4525.484619, false );
	mis_CameraSet();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_12" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_CreateSceneEffect( 330, "Ccam01c", -13704.968750, 106.000000, -2040.894043, -116.0);	//↑ 
	scr_CreateSceneEffect( 331, "Ccam01c", -12899.226563, 120.000000, -3725.276855, -116.0);	//↑ 
	scr_CreateSceneEffect( 332, "Ccam02c", -14265.191406, 800.000000, -4461.229492, 0.0);	//↓ 
	scr_CreateSceneEffect( 333, "Ccam02c", -15162.352539, 800.000000, -2663.147949, 0.0);	//↓ 


}
function miscb_TrapIn1505()
{
	print("in1505()\n");
	//キャノン 
	mis_Info_OutOfBounds();
	mis_WarpToReturnTutorial(-12179.229492, 100.000000, -2434.161621, -116.0);


}
gCheckPointNo02 <- 0;
function miscb_TrapIn1506()
{
	print("in1506()\n");
//	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
//	scr_PauseOn();	
//	scr_OpenDialog( 0, "C002_13" );
//	while( scr_IsOpenDialog(0) )
//	{
//		suspend();
//	}
//	scr_PauseOff();
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
//	mis_BannerInfoTimer("miscb_BunnerInfoRemove",10.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMA02131" );	//  

}
function miscb_TrapIn1004()
{
	print("in1004()\n");
	scr_CloseMissionExpainText( 0 );
	scr_WaitStart( 0.1 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_RemoveScene( 330, true );
	scr_RemoveScene( 331, true );
	scr_RemoveScene( 332, true );
	scr_RemoveScene( 333, true );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_14" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_GimmickWakeUpEnable( GIMMICK_BATTERING_RAM );
	mis_WarpToReturnTutorial( -12179.229492, 100.000000, -2434.161621, -116.0 );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_15" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_SetBreakCastleGateCallback( "miscb_BreakCastleGate", 7, CB_TYPE_ONCE, POWER_COLOR_BLACK );
	scr_CreateSceneEffect( 430, "Ccam02c", -13143.822266, 520.000000, -2801.484619, -116.0 );	//↓ 
	gCheckPointNo02 = 1;
	scr_SetTrapInCallback( "miscb_TrapIn1004b", 1004, CB_TYPE_ALWAYS, 1004 );	//的城 

}
function miscb_TrapIn1004b()
{
	print("in1004b()\n");

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_23" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	mis_WarpToReturnTutorial(-12179.229492, 100.000000, -2434.161621, -116.0);
}



function miscb_BreakCastleGate()
{
	print("breakgate()\n");
	scr_RemoveScene( 430, true );
	scr_RemoveCallbackFromId( 1004 );
	scr_RemoveCallbackFromId( 1005 );
	scr_WaitStart( 1.8 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_16" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_CreateSceneEffect( 441, "Ccam01c", -13293.239258, 110.000000, -2866.018311, -115.0 );
	scr_CreateSceneEffect( 442, "Ccam01c", -15948.404297, 106.000000, -4168.423340, -115.0 );

}


function mis_CameraSet()
{
	print("cameraset()\n");
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	scr_SetInputDisable( SCR_INPUT_CAMERA );	//カメラを禁止 
	scr_WaitStart( 0.45 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_SetInputEnable( SCR_INPUT_CAMERA );	//カメラ禁止解除 
}
function mis_WarpToReturnTutorial( x, y, z, roty )
{
	print("returnToTutorial()\n");
	scr_PauseOn();		
	// フェードしてワープ
	scr_FadeOutBlack( 1.0 );
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
	scr_ResetGameCameraBehind( true )
	mis_CameraSet();
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_PauseOn();		
	scr_FadeIn( 1.0 );
	while( !scr_IsFadeFinish() )
	{
		suspend();
	}
	scr_PauseOff();
}
function mis_Info_OutOfBounds()
{
	print("OB()\n");
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
//	scr_OpenDialog( 0, "C000_43" );
	scr_OpenDialog( 0, "C002_25" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
}
function miscb_GameSetWinWhite()
{
	print("winwhite()\n");
	scr_RemoveScene( 441, true );
	scr_RemoveScene( 442, true );
	scr_RemoveCallbackAll();
//	scr_GameSetMissionClear();
	scr_GameSetMissionSuccess();
	// ちょっと待つ
	scr_WaitStart( 4.0 );
	while( scr_Waiting() )
	{
		suspend();
	}
	
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
//	scr_OpenDialog( 0, "C002_17" );
//	scr_OpenDialog( 0, "C004_03" );
	scr_OpenDialog( 0, "C002_26" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();


}
//行動制限関連 
//変数。チュートリアル進行度合い 
gCheckPointNo <- 0;
function miscb_TrapOut1000()
{
	print("out1000()\n");
	if(gCheckPointNo == 0)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_03" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
	
		mis_WarpToReturnTutorial(16378.294922, 100.000000, -3963.266357, -128.0);
	}
	if(gCheckPointNo == 1)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_18" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
	
		mis_WarpToReturnTutorial(16348.223633, 700.000000, -2202.186035, -70.0);
	}
	if(gCheckPointNo == 2)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_19" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		scr_PauseOff();
		mis_WarpToReturnTutorial(16348.223633, 700.000000, -2202.186035, -70.0);
	}
	if(gCheckPointNo == 3)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_20" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		mis_WarpToReturnTutorial(16378.294922, 100.000000, -3963.266357, -128.0);
	}
	if(gCheckPointNo == 4)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_24" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		mis_WarpToReturnTutorial(16378.294922, 100.000000, -3963.266357, -128.0);
	}

}
function miscb_TrapIn1000()
{
	print("in1000()\n");
	if(gCheckPointNo == 5)
	{
		gCheckPointNo = 4;
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_07" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		suspend();
		suspend();
		scr_BotPlayerSetActionTrigger( 101, false );
		scr_BotPlayerSetActionTrigger( 102, false );
		scr_PlayerSetAPRate( 1.0 );

	}
	if(gCheckPointNo == 6)
	{

		scr_WaitStart( 1.0 );
		while( scr_Waiting() )
		{
			suspend();
		}

		mis_Info_OutOfBounds();
		mis_WarpToReturnTutorial(-6718.068848, 100.000000, 82.275726, -117.0);
	}
}

function miscb_TrapIn1001()
{
	print("in1001()\n");
	mis_Info_OutOfBounds();
	mis_WarpToReturnTutorial(-6718.068848, 100.000000, 82.275726, -117.0);
}
function miscb_TrapIn1002()
{
	print("in1002()\n");
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C002_21" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	mis_WarpToReturnTutorial(-7027.546387, 100.000000, -208.879578, 155.0);
}
function miscb_TrapIn1005()
{
	print("in1005()\n");
	if(gCheckPointNo02 == 0)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_22" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		mis_WarpToReturnTutorial(-12179.229492, 100.000000, -2434.161621, -116.0);

	}
	if(gCheckPointNo02 == 1)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C002_23" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
	
		mis_WarpToReturnTutorial(-12179.229492, 100.000000, -2434.161621, -116.0);

	}


}
