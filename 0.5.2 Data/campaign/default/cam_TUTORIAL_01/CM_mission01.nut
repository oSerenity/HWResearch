///////////////////////////////////////////////////////////////////////////////////////////////
//
// ファイル名：cam_of_0001\mission01.nut 
//	概要	：オフラインキャンペーン レベル0 チュートリアル ミッション2 
//	作成	：落合 
//	作成日	：110717 
//	目的	：ショット魔法に関するチュートリアル 
//
///////////////////////////////////////////////////////////////////////////////////////////////

function loadMission() {
	print("[sample mission] load()\n");
	
	//
	// ギミックの使用不可設定は このloadMission()内でコールすること！
	//
	
//	scr_SetDisableGimmickType( GIMMICK_BRIDGE1 );
//	scr_SetDisableGimmickType( GIMMICK_BRIDGE2 );
	// 爆弾岩は使用不可
	scr_SetDisableGimmickType( GIMMICK_BOMBSTONE );
	//開戦前バリケード封じ 
	scr_SetDisableGimmickType( GIMMICK_KEEP_OUT );

}

function startMission() {
	print("[sample mission] start()\n");
	
	// プレイヤーのプロファイルを固定する
//	scr_PlayerSetFixedProfile( 0, "PlayerMage" );
//	scr_PlayerSetFixedProfile( 1, "PlayerMage" );
	scr_PlayerSetFixedProfile( 2, "PlayerMage" );
	//経験値取得を制御 
	scr_PlayerSetEnableGetExperience( false );
	//ログ非表示 
	scr_SetDisableTacticalInfomation();

	// アイテム取得不可
	scr_DisableGameReward();
	// トラップエリア登録
	scr_RegistTrapBox( 1000, 23899.7 ,0.0 ,2403.5 ,3124.6 ,1000.0 ,5905.2 ,0.0  );	//城より前 
	scr_RegistTrapBox( 1001, 15653.9 ,0.0 ,2940.9 ,407.0 ,1000.0 ,943.5 ,0.0  );	//壁の向こう１ 
	scr_RegistTrapBox( 1001, 15388.7 ,0.0 ,5880.4 ,2348.8 ,1000.0 ,410.5 ,-276.4  );	//壁の向こう１ 
	scr_RegistTrapBox( 1001, 14383.2 ,0.0 ,322.4 ,2348.8 ,1000.0 ,479.5 ,-241.8  );	//壁の向こう１ 
	scr_RegistTrapBox( 1002, 15209.7 ,0.0 ,-2685.3 ,2464.6 ,1000.0 ,473.4 ,-352.5  );	//毒沼 
	scr_RegistTrapBox( 1003, 6854.2 ,1000.0 ,2754.8 ,2726.1 ,1000.0 ,403.8 ,-270.0  );	//階段より奥 
//	scr_RegistTrapBox( 1004, 17494.9 ,300.0 ,472.9 ,301.6 ,100.0 ,310.6 ,0.0  );	//台座 
//	scr_RegistTrapBox( 1004, 17512.3 ,300.0 ,5478.1 ,301.6 ,100.0 ,310.6 ,0.0  );	//台座 
	scr_RegistTrapSphere( 1004, 17729.664063, 105.980064, 2046.967, 300.0 );	//台座 
	scr_RegistTrapSphere( 1004, 17334.306641, 130.693085, 4583.161, 300.0 );	//台座 
	scr_RegistTrapSphere( 1004, 16409.660156, 0.000000, 3143.93164, 300.0 );	//台座 
	

	scr_RegistTrapBox( 1005, 12413.0 ,0.0 ,671.2 ,892.1 ,1000.0 ,2501.0 ,-349.2);	//毒沼 
	scr_RegistTrapBox( 1005, 10798.7 ,0.0 ,6052.0 ,774.5 ,1000.0 ,1213.6 ,-26.5);  	//毒沼 


	// コールバック
	scr_SetMessageCallback( "miscb_PlayerSally", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );	//出撃 

//	scr_SetTrapInCallback( "miscb_TrapIn1000", 1000, CB_TYPE_ALWAYS, 1000 );	//城より前 
	scr_SetTrapInCallback( "miscb_TrapIn1001", 1001, CB_TYPE_ALWAYS, 1001 );	//壁の向こう１ 
	scr_SetTrapInCallback( "miscb_TrapIn1002", 1002, CB_TYPE_ALWAYS, 1002 );	//毒沼 
	scr_SetTrapInCallback( "miscb_TrapIn1003", 1003, CB_TYPE_ALWAYS, 1003 );	//階段より奥 
//	scr_SetTrapInCallback( "miscb_TrapIn1004", 1004, CB_TYPE_ALWAYS, 1004 );	//台座 

	scr_SetTrapInCallback( "miscb_TrapIn1005", 1005, CB_TYPE_ONCE, 1005 );	//毒沼 


	// BOTの登録
	scr_BotPlayerRegistAndCreate( 101, "Allan", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 202, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 204, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 205, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 206, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 207, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 208, "MATO", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 209, "MATO", POWER_COLOR_BLACK );

	scr_BotPlayerSetLifeRecover( 201, false );
	scr_BotPlayerSetLifeRecover( 202, false );
	scr_BotPlayerSetLifeRecover( 203, false );
	scr_BotPlayerSetLifeRecover( 204, false );
	scr_BotPlayerSetLifeRecover( 205, false );
	scr_BotPlayerSetLifeRecover( 206, false );
	scr_BotPlayerSetLifeRecover( 207, false );
	scr_BotPlayerSetLifeRecover( 208, false );
	scr_BotPlayerSetLifeRecover( 209, false );



	//BOTのレベルアップでのスキル習得を封じる 
	scr_BotPlayerDisableLearningSkillByLevelUp();
	scr_SetEnablePlayerHeroPopup( false );
	scr_SetEnableInputPlayerVoiceReaction( false );

	scr_SetEnableGameWinDemo( false );

	//出撃前メッセージ 

	scr_WaitStart( 0.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_00" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();

	scr_PlayerSetForceRespawnPosition( 17827.882813, 0.000000, 3107.767578, -91.0 );	//プレイヤーの出現位置を固定 

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
function mis_WaitGameStart()
{
	while( GAME_STATE_PLAYING!=scr_GetGamePlayingStatus() )
	{
		local state = GetGamePlayingStatus();
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );
		suspend();
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
function miscb_PlayerSally()
{
	print("sally()\n");
	//経験値入手を封印 
	scr_PlayerSetEnableGetExperience( false );
	//スキル習得演出を変更 
	scr_SetEnableSkillPanelAnimation( 0, false );

	scr_CreateSceneEffect( 9990, "Ccam37c", 15873.620117, 120.000000, -2690.331055, -161.0 );	//進入禁止 
	scr_CreateSceneEffect( 9991, "Ccam37c", 16307.124023, 120.000000, -2833.268799, -161.0 );	//進入禁止 



	scr_SetTrapInCallback( "miscb_TrapIn1000", 1000, CB_TYPE_ALWAYS, 1000 );	//城より前 

	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );
	scr_ResetGameCameraBehind( false );
	mis_CameraSet();
	mis_CameraSet();
	mis_CameraSet();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_01" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_OpenKeyHelp( SCR_KEY_HELP_COMMAND_03, -1.0 );	//キーヘルプ　RT ショット魔法 
	scr_SetPlayerUseSkillCallback( "miscb_SuccessShot", 2, CB_TYPE_ONCE, SCR_FIRE_BALL );	//ショット成功 

}
function miscb_TrapIn1000()
{
	print("in1000()\n");
	mis_Info_OutOfBounds();
	mis_WarpToReturnTutorial( 17827.882813, 0.000000, 3107.767578, -90.0 )
}
function miscb_TrapIn1001()
{
	print("in1001()\n");
	mis_Info_OutOfBounds();
	mis_WarpToReturnTutorial( 17827.882813, 0.000000, 3107.767578, -90.0 )
}
function miscb_TrapIn1002()
{
	print("in1002()\n");
	mis_Info_OutOfBounds();
	mis_WarpToReturnTutorial( 17827.882813, 0.000000, 3107.767578, -90.0 )
}
function miscb_TrapIn1003()
{
	print("in1003()\n");
	mis_Info_OutOfBounds();
	mis_WarpToReturnTutorial( 11141.960938, 0.000000, 2968.680420, -90.0 )
}

function miscb_TrapIn1005()
{
	print("in1005()\n");
	scr_SetTrapOutCallback( "miscb_TrapOut1005", 2005, CB_TYPE_ONCE, 1005 );
	scr_SetTimerCallback( "miscb_HPcure", 12005, CB_TYPE_ONCE, 1.0 );
}
function miscb_HPcure()
{
	print("HPreset()\n");
	scr_PlayerSetLifeRate( 1.0 );
	scr_SetTimerCallback( "miscb_HPcure", 12005, CB_TYPE_ONCE, 1.0 );
}
function miscb_TrapOut1005()
{
	print("out1005()\n");
	scr_RemoveCallbackFromId( 12005 );
	scr_SetTrapInCallback( "miscb_TrapIn1005", 1005, CB_TYPE_ONCE, 1005 );	//毒沼 
}
function miscb_SuccessShot()
{
	print("successshot()\n");
	scr_CloseKeyHelp();
	scr_WaitStart( 1.5 );	//撃ったのを待つ 
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_02" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_OpenKeyHelp( SCR_KEY_HELP_SHOT_01, -1.0 );	//キーヘルプ　RT FB  

	scr_BotPlayerSpawnToWorld( 201,16385.113281, 0.000000, 3104.364502, 81.0 );	//deku 
	scr_AddStandbyEnemyCallback( "miscb_KillBot201", 201, STANDBY_COUNT_START_TIMING );	//ころした 

	scr_ResetGameCameraDirection( 16385.113281, 3104.364502, false );
	mis_CameraSet();

}
function miscb_KillBot201()
{
	print("kill201()\n");
	scr_CloseKeyHelp();
	scr_RemoveStandbyEnemyCallback( 201 );
	//３体敵出現 

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_03" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_PlayerSetAPRate( 1.0 );	//AP回復 

	scr_ResetGameCameraDirection( 17729.501953,  2046.860352, false );
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );
	mis_CameraSet();
//	scr_BotPlayerSpawnToWorld( 202,17426.501953, 325.757690, 686.860352, 1.0 );	//deku 
	scr_BotPlayerSpawnToWorld( 202,17729.664063, 105.980064, 2046.967285, 1.0 );	//deku 
	
	scr_CreateSceneEffect( 311, "Ccam02c", 17729.501953, 415.757690, 2046.860352, -116.0 );	//↓ 
	scr_AddStandbyEnemyCallback( "miscb_KillBot202", 202, STANDBY_COUNT_START_TIMING );	//ころした 


	mis_CameraSet();
	mis_CameraSet();
	scr_ResetGameCameraDirection( 17334.156250, 4583.435547, false );
	mis_CameraSet();
//	scr_BotPlayerSpawnToWorld( 203,17437.156250, 325.757690, 5405.435547, 177.0 );	//deku 
	scr_BotPlayerSpawnToWorld( 203,17334.306641, 130.693085, 4583.161, 177.0 );	//deku 
	scr_CreateSceneEffect( 312, "Ccam02c", 17334.156250, 415.757690, 4583.435547, -116.0 );	//↓ 
	scr_AddStandbyEnemyCallback( "miscb_KillBot203", 203, STANDBY_COUNT_START_TIMING );	//ころした 


	mis_CameraSet();
	mis_CameraSet();
	scr_ResetGameCameraDirection( 16409.984375,  3143.220947, false );
	mis_CameraSet();
//	scr_BotPlayerSpawnToWorld( 201,16128.984375, 438.539429, 2744.220947, 81.0 );	//deku 
	scr_BotPlayerSpawnToWorld( 201, 16409.660156, 0.000000, 3143.93164, 81.0 );	//deku 
	scr_CreateSceneEffect( 310, "Ccam02c", 16409.984375, 230.539429, 3143.220947, -116.0 );	//↓ 
	scr_AddStandbyEnemyCallback( "miscb_KillBot201b", 201, STANDBY_COUNT_START_TIMING );	//ころした 

	mis_CameraSet();
	mis_CameraSet();

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_18" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_SetTrapInCallback( "miscb_TrapIn1004", 1004, CB_TYPE_ALWAYS, 1004 );	//台座 

}
function miscb_TrapIn1004()
{
	print("in1004()\n");
	
	if(gKillTargetsCount == 0)
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_04" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
	
		mis_WarpToReturnTutorial( 17827.882813, 0.000000, 3107.767578, -90.0 )
	}
}
gKillTargetsCount <- 0;
function miscb_KillBot201b()
{
	print("kill201b()\n");
	scr_RemoveStandbyEnemyCallback( 201 );
	scr_RemoveScene( 310, true );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargets();
}
function miscb_KillBot202()
{
	print("kill202()\n");
	scr_RemoveStandbyEnemyCallback( 202 );
	scr_RemoveScene( 311, true );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargets();
}
function miscb_KillBot203()
{
	print("kill203()\n");
	scr_RemoveStandbyEnemyCallback( 203 );
	scr_RemoveScene( 312, true );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargets();
}
function mis_KillAllTargets()
{
	print("killtarget()\n");
	if(gKillTargetsCount == 3 )
	{
		print("killalltarget()\n");

		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_20" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();

		scr_PlayerSetAPRate( 1.0 );	//AP回復 
		scr_PlayerLearnSkill( SCR_LIGHTNING_STRIKE, true );
		scr_RemoveCallbackFromId( 1004 );	//行動制限　台座　を解除 

		scr_ResetGameCameraDirection( 18878.189453, 3206.179199, false );
		scr_SetGameCameraAngleType( ANGLE_ZOOM_OUT );
		mis_CameraSet();
		mis_SpawnBot201_202_203();
		gKillTargetsCount = 0;
		mis_CameraSet();

		scr_OpenKeyHelp( SCR_KEY_HELP_COMMAND_01, -1.0 );	//キーヘルプ　B サンダーストライク  
		scr_SetPlayerUseSkillCallback( "miscb_PlayerUseThunder", 76, CB_TYPE_ONCE, SCR_LIGHTNING_STRIKE );

	}
}
function miscb_KillBot201c()
{
	print("kill201c()\n");
	scr_RemoveStandbyEnemyCallback( 201 );
	scr_RemoveScene( 310, true );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargetsEx();
}
function miscb_KillBot202c()
{
	print("kill202c()\n");
	scr_RemoveStandbyEnemyCallback( 202 );
	scr_RemoveScene( 311, true );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargetsEx();
}
function miscb_KillBot203c()
{
	print("kill203c()\n");
	scr_RemoveStandbyEnemyCallback( 203 );
	scr_RemoveScene( 312, true );
	gKillTargetsCount = (gKillTargetsCount + 1);
	mis_KillAllTargetsEx();
}
function mis_SpawnBot201_202_203()
{
	print("spawn207208209()\n");
	scr_BotPlayerSpawnToWorld( 201, 18878.189453, 0.000000, 3206.179199, -90.0 );
	scr_BotPlayerSpawnToWorld( 202, 19049.160156, 0.000000, 3043.633545, -90.0 );
	scr_BotPlayerSpawnToWorld( 203, 19051.710938, 0.000000, 3453.181885, -90.0 );
	suspend();
	suspend();
	suspend();
//	scr_BotPlayerSetLifeRate( 201, 0.6 );
//	scr_BotPlayerSetLifeRate( 202, 0.6 );
//	scr_BotPlayerSetLifeRate( 203, 0.6 );

	scr_AddStandbyEnemyCallback( "miscb_KillBot201c", 201, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot202c", 202, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot203c", 203, STANDBY_COUNT_START_TIMING );
}
gUseThunder <- 0;
function miscb_PlayerUseThunder()
{
	print("useth()\n");
	scr_CloseKeyHelp();
	scr_SetTimerCallback( "miscb_PlayerUseThunderInfo", 82, CB_TYPE_ONCE, 3.0 );
	gUseThunder = 1;
}
function miscb_PlayerUseThunderInfo()
{
	print("usethinfo()\n");

	if(scr_BotPlayerGetLife( 201 ) != 0 || scr_BotPlayerGetLife( 202 ) != 0 || scr_BotPlayerGetLife( 203 ) != 0 )
	{
		scr_OpenMissionExpainText( 0, "#TXCMA00121" );	//iizo  
	}
}
function mis_KillAllTargetsEx()
{
	print("killtarget()\n");
	if(gKillTargetsCount == 3 )
	{
		if(gUseThunder == 1)
		{
			print("killalltargetUseT()\n");
			scr_CloseMissionExpainText( 0 );
			scr_WaitStart( 0.3 );	
			while( scr_Waiting() )	
			{
				suspend();
			}

			scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
			scr_PauseOn();	
			scr_OpenDialog( 0, "C001_05" );
			while( scr_IsOpenDialog(0) )
			{
				suspend();
			}
			scr_PauseOff();
	
			scr_PlayerSetAPRate( 1.0 );	//AP回復 
			scr_PlayerLearnSkill( SCR_ENCHANT_WIND, true );
	
		
			scr_OpenKeyHelp( SCR_KEY_HELP_ENCHANT, -1.0 );	//キーヘルプ　A エンチャント魔法  
			scr_SetPlayerBeginEnchantCallback( "miscb_PlayerBeingEnchaunt", 3, CB_TYPE_ONCE, ENCHANT_WIND );	//エンチャント状態になった 
			scr_RemoveCallbackFromId( 1004 );	//行動制限　台座　を解除 
		}
		else
		{
			print("killalltargetNotuseT()\n");
			gKillTargetsCount = 0;
			mis_SpawnBot201_202_203();
		}
	}
}
function miscb_PlayerBeingEnchaunt()
{
	print("cameraset()\n");
	scr_CloseKeyHelp();
	scr_WaitStart( 1.5 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_06" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_BotPlayerSpawnToWorld( 204, 18531.205078, 0.000000, 3256.806641, -90.0 );
	scr_ResetGameCameraDirection( 18531.205078, 3256.806641, false );
	mis_CameraSet();

	scr_OpenKeyHelp( SCR_KEY_HELP_ATTACK, -1.0 );	//Ｘ　武器で攻撃 

	scr_SetMessageCallback( "miscb_AttackWithEnchaunt", 4, CB_TYPE_ALWAYS, MESSAGE_PLAYER_SUCCESS_ATTACK );	//エンチャント攻撃を当てた 
	scr_AddStandbyEnemyCallback( "miscb_KillBot204", 204,  STANDBY_COUNT_START_TIMING );	//ころした 

}
gAttackWithEnchaunt <- 0;
function miscb_AttackWithEnchaunt()
{
	print("Eat()\n");
	gAttackWithEnchaunt = (gAttackWithEnchaunt+1);

}
function miscb_KillBot204()
{
	print("kill204()\n");
	if(gAttackWithEnchaunt == 0)
	{

//	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
//	scr_PauseOn();	
//	scr_OpenDialog( 0, "C001_07" );
//	while( scr_IsOpenDialog(0) )
//	{
//		suspend();
//	}
//	scr_PauseOff();
	mis_BannerInfoTimer("miscb_BunnerInfoRemove",10.0);	//バナーを削除する 
	scr_OpenMissionExpainText( 0, "#TXCMA01071" );	//  



	scr_BotPlayerSpawnToWorld( 204, 18531.205078, 0.000000, 3256.806641, -90.0 );
	}
	else
	{
	scr_CloseKeyHelp();
	scr_RemoveCallbackFromId( 4 );
	scr_RemoveStandbyEnemyCallback( 204 );
	scr_CloseMissionExpainText( 0 );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_08" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_PlayerSetAPRate( 1.0 );	//Ap回復 
	scr_OpenKeyHelp( SCR_KEY_HELP_SHOT_02, -1.0 );	//RT　ウィンド 

	mis_SpawnBot205_206();	//敵出現 
	scr_ResetGameCameraDirection( 17360.623047, 3170.641113, false );
	mis_CameraSet();

	scr_SetPlayerUseSkillCallback( "miscb_SuccessShot02", 5, CB_TYPE_ONCE, SCR_WIND_BLAST );	//ショット成功2 

	scr_RemoveCallbackFromId( 1001 );	//行動制限　壁の向こう　解除 
	
	}
}
function mis_SpawnBot205_206()
{
	print("spawn205206()\n");
	scr_BotPlayerSpawnToWorld( 205, 17465.085938, 0.000000, 3641.212891, 90.0 );
	scr_BotPlayerSpawnToWorld( 206, 17461.794922, 0.000000, 2614.181152, 90.0 );

	scr_AddStandbyEnemyCallback( "miscb_KillBot205", 205,  STANDBY_COUNT_START_TIMING );	//ころした 
	scr_AddStandbyEnemyCallback( "miscb_KillBot206", 206,  STANDBY_COUNT_START_TIMING );	//ころした 
}
gUseWindShot <- 0;
function miscb_SuccessShot02()
{
	print("ss2()\n");
	scr_CloseKeyHelp();
	gUseWindShot = (gUseWindShot+1);

	scr_WaitStart( 0.6 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

//	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
//	scr_PauseOn();	
//	scr_OpenDialog( 0, "C001_10" );
//	while( scr_IsOpenDialog(0) )
//	{
//		suspend();
//	}
//	scr_PauseOff();
	scr_CreateSceneSound( 701, 850, 0.0, 0.0, 0.0 );
	scr_OpenMissionExpainText( 0, "#TXCMA01101" );	//  


}
gKillTargetsCount02 <- 0;
function miscb_KillBot205()
{
	print("kill205()\n");
	scr_RemoveStandbyEnemyCallback( 205 );
	gKillTargetsCount02 = (gKillTargetsCount02+1);
	mis_KillAllTargets02();
}
function miscb_KillBot206()
{
	print("kill206()\n");
	scr_RemoveStandbyEnemyCallback( 206 );
	gKillTargetsCount02 = (gKillTargetsCount02+1);
	mis_KillAllTargets02();
}
function mis_KillAllTargets02()
{
	print("kill206()\n");

	if(gKillTargetsCount02 == 2  &&  gUseWindShot == 0 )
	{
//	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
//		scr_PauseOn();	
//		scr_OpenDialog( 0, "C001_09" );
//		while( scr_IsOpenDialog(0) )
//		{
//			suspend();
//		}
//		scr_PauseOff();
		scr_OpenMissionExpainText( 0, "#TXCMA01091" );	//  

	
		mis_SpawnBot205_206();	//敵出現 
		gKillTargetsCount02 = 0;
	}
	if(gKillTargetsCount02 == 2  &&  gUseWindShot == 1 )
	{
		scr_CloseMissionExpainText( 0 );
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_11" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();

		scr_CompleteMonumentBuild( "gfmo_006", POWER_COLOR_WHITE );	//一番を白に 


		scr_RegistTrapSphere( 1101, 13947.090820, 0.000000, 4065.163086, 700.0 );	//エンチャント説明トラップ 
		scr_SetTrapInCallback( "miscb_TrapIn1101", 1101, CB_TYPE_ONCE, 1101 );
		scr_ResetGameCameraDirection( 13947.090820, 4065.163086, false );
		mis_CameraSet();
		scr_BotPlayerSpawnToWorld( 101, 13947.090820, 0.000000, 4065.163086, 92.0 );	//味方出現 

		scr_CreateSceneEffect( 320, "Ccam02c", 13947.090820, 300.000000, 4065.163086, -116.0 );	//↓ 
		scr_CreateSceneEffect( 321, "Ccam01c", 17534.044922, 6.000000, 3257.225098, -44.0 );	//↑ 
		scr_CreateSceneEffect( 322, "Ccam01c", 15360.800781, 6.000000, 4749.204102, -118.0 );	//↑ 
		scr_CreateSceneEffect( 323, "Ccam01c", 19409.167969, 6.000000, 3004.852539, -90.0 );	//↑ 
		scr_CreateSceneEffect( 324, "Ccam01c", 16230.482422, 6.000000, 4944.931641, -103.0 );	//↑ 



	}
}
function miscb_TrapIn1101()
{
	print("in1101()\n");
	scr_RemoveScene( 321, true );
	scr_RemoveScene( 322, true );
	scr_RemoveScene( 323, true );
	scr_RemoveScene( 324, true );

	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_12" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();


	if(scr_BotPlayerGetEnchant( 101 ) == ENCHANT_WIND )
	{
		print("usedE()\n");
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		suspend();
		
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_19" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		mis_EndEnchauntTutorial();

	}
	else
	{
		scr_OpenKeyHelp( SCR_KEY_HELP_ENCHANT, -1.0 );
		scr_SetMessageCallback( "miscb_CastEnchaunt", 7, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_CASTING_ENCHANT );
	}
}
function miscb_CastEnchaunt()
{
	print("castE()\n");
	scr_CloseKeyHelp();
	scr_OpenKeyHelp( SCR_KEY_HELP_SKILL_06, -1.0 );
	scr_SetMessageCallback( "miscb_CancelEnchaunt", 8, CB_TYPE_ONCE, MESSAGE_PLAYER_CANCEL_CASTING_SKILL );
	scr_SetPlayerUseSkillCallback( "miscb_UseEnchaunt", 6, CB_TYPE_ONCE, SCR_ENCHANT_WIND );
}
function miscb_CancelEnchaunt()
{
	print("cancelE()\n");
	scr_CloseKeyHelp();
	scr_OpenKeyHelp( SCR_KEY_HELP_ENCHANT, -1.0 );
	scr_SetMessageCallback( "miscb_CastEnchaunt", 7, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_CASTING_ENCHANT );
	scr_RemoveCallbackFromId( 6 );
}
function miscb_UseEnchaunt()
{
	print("useE()\n");
	scr_CloseKeyHelp();
	scr_WaitStart( 1.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}

	if(scr_BotPlayerGetEnchant( 101 ) == ENCHANT_WIND )
	{
		scr_CloseKeyHelp();
		scr_RemoveCallbackFromId( 6 );

		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_13" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();

		mis_EndEnchauntTutorial();
	}
	else
	{
		scr_RemoveCallbackFromId( 8 );
		scr_OpenKeyHelp( SCR_KEY_HELP_ENCHANT, -1.0 );
		scr_SetMessageCallback( "miscb_CastEnchaunt", 7, CB_TYPE_ONCE, MESSAGE_PLAYER_BEGIN_CASTING_ENCHANT );
	}

}
function mis_EndEnchauntTutorial()
{
	scr_RemoveScene( 320, true );
	print("endE()\n");
	scr_BotPlayerSpawnToWorld( 207, 10291.220703, 0.000000, 2990.078369, 86.0 );
	scr_BotPlayerSpawnToWorld( 208, 10467.712891, 0.000000, 2711.532227, 86.0 );
	scr_BotPlayerSpawnToWorld( 209, 10443.658203, 0.000000, 3269.602783, 86.0 );
	scr_CreateSceneEffect( 330, "Ccam02c", 10291.220703, 400.000000, 2990.078369, -116.0 );	//↓ 
	scr_CreateSceneEffect( 331, "Ccam01c", 13460.724609, 6.000000, 3918.979492, -107.0 );	//↑ 
	scr_CreateSceneEffect( 332, "Ccam01c", 12077.963867, 6.000000, 3473.511719, -107.0 );	//↑ 
	scr_ResetGameCameraDirection( 10291.220703, 2990.078369, false );
	mis_CameraSet();

	scr_BotPlayerSetLifeRate( 207, 0.6 );
	scr_BotPlayerSetLifeRate( 208, 0.6 );
	scr_BotPlayerSetLifeRate( 209, 0.6 );

	scr_AddStandbyEnemyCallback( "miscb_KillBot207", 207, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot208", 208, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot209", 209, STANDBY_COUNT_START_TIMING );

	scr_RegistTrapSphere( 1102, 10291.220703, 0.000000, 2990.078369, 1400.0 );	//全開ショット説明トラップ 
	scr_SetTrapInCallback( "miscb_TrapIn1102", 1102, CB_TYPE_ONCE, 1102 );

}

function miscb_TrapIn1102()
{
	print("in1102()\n");
	scr_RemoveScene( 330, true );
	scr_RemoveScene( 331, true );
	scr_RemoveScene( 332, true );


	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_14" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

	scr_OpenKeyHelp( SCR_KEY_HELP_SHOT_03, -1.0 );	//RT+A max shot 
	scr_PlayerSetAPRate( 1.0 );

	scr_SetMessageCallback( "miscb_UseMaxShot", 7, CB_TYPE_ONCE, MESSAGE_PLAYER_MAX_CHAGE_SHOT );
	scr_SetPlayerUseSkillCallback( "miscb_FailedMaxShot", 20, CB_TYPE_ALWAYS, SCR_WIND_BLAST );	//失敗時にAPを強制回復 
}
function miscb_FailedMaxShot()
{
	print("全開ショットに失敗したのでAP強制回復()\n");

	if( scr_PlayerGetAPRate() <= 0.3 )
	{
		scr_PlayerSetAPRate( 0.45 );
	}
}
gUseMaxShot <- 0;
function miscb_UseMaxShot()
{
	print("maxS()\n");

	gUseMaxShot = 1;
	scr_CloseKeyHelp();
	scr_RemoveCallbackFromId( 20 );	//miscb_FailedMaxShot 

	scr_WaitStart( 1.4 );	
	while( scr_Waiting() )	
	{
		suspend();
	}
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C001_16" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();

}
gKillTargetsCount03 <- 0;
function miscb_KillBot207()
{
	print("kill207()\n");
	scr_RemoveStandbyEnemyCallback( 207 );
	gKillTargetsCount03 = (gKillTargetsCount03+1);
	mis_KillAllTargets03();
}
function miscb_KillBot208()
{
	print("kill208()\n");
	scr_RemoveStandbyEnemyCallback( 208 );
	gKillTargetsCount03 = (gKillTargetsCount03+1);
	mis_KillAllTargets03();
}
function miscb_KillBot209()
{
	print("kill209()\n");
	scr_RemoveStandbyEnemyCallback( 209 );
	gKillTargetsCount03 = (gKillTargetsCount03+1);
	mis_KillAllTargets03();
}
function mis_SpawnBot207_208_209()
{
	print("spawn207208209()\n");
	scr_BotPlayerSpawnToWorld( 207, 10291.220703, 0.000000, 2990.078369, 86.0 );
	scr_BotPlayerSpawnToWorld( 208, 10467.712891, 0.000000, 2711.532227, 86.0 );
	scr_BotPlayerSpawnToWorld( 209, 10443.658203, 0.000000, 3269.602783, 86.0 );
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetLifeRate( 207, 0.6 );
	scr_BotPlayerSetLifeRate( 208, 0.6 );
	scr_BotPlayerSetLifeRate( 209, 0.6 );

	scr_AddStandbyEnemyCallback( "miscb_KillBot207", 207, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot208", 208, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_KillBot209", 209, STANDBY_COUNT_START_TIMING );


}
function mis_KillAllTargets03()
{
	print("kill206()\n");

	if(gKillTargetsCount03 == 3  &&  gUseMaxShot == 0 )
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_15" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();
		mis_SpawnBot207_208_209();	//敵出現 
		gKillTargetsCount03 = 0;
	}
	if(gKillTargetsCount03 == 3  &&  gUseMaxShot == 1 )
	{
		scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
		scr_PauseOn();	
		scr_OpenDialog( 0, "C001_17" );
		while( scr_IsOpenDialog(0) )
		{
			suspend();
		}
		scr_PauseOff();

		scr_RemoveCallbackAll();
		scr_GameSetMissionSuccess();


	}
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
	scr_PauseOff();
	scr_SetInputDisable( SCR_INPUT_MOVE );	//移動を禁止 
	// カメラを はいご へリセット
	scr_ResetGameCameraBehind( true )
	mis_CameraSet();
	scr_SetInputEnable( SCR_INPUT_MOVE );	//移動を禁止解除 
	scr_PauseOn();		
	scr_FadeIn( 0.5 );
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
	scr_OpenDialog( 0, "C001_21" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
}