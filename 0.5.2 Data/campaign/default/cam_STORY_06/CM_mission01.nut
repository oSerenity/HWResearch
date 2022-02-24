///////////////////////////////////////////////////////////////////////////////////////////////
//
//	ファイル名：cam_on_0302\mission01.nut 
//	概要	：オフラインキャンペーン レベル3 キャンペーン2 ミッション2 
//	作成	：落合 
//	作成日	：110606 
//	目的	：［討伐］指定の敵を倒せ 
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
function startMission() 
{
	print("[sample mission] start()\n");



	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_NORMAL, 99 );
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_PLAYER, SCR_REBIRTH_TYPE_PENALTY, 99 );
//Bot登録 
	scr_BotPlayerRegistAndCreate( 101, "NOOB11", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 102, "MEDIC04", POWER_COLOR_WHITE );
	scr_BotPlayerRegistAndCreate( 103, "MAGE04", POWER_COLOR_WHITE );

	scr_BotPlayerRegistAndCreate( 201, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 202, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 203, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 204, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 205, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 206, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 207, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 208, "MOB", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 209, "FROST_DEMON", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 210, "DARK_KNIGHT_T", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 211, "STRONG_STEEL", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 212, "STRONG_STEEL", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 213, "MAGEstrong01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 214, "MAGEstrong01", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 215, "CANDLE", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 216, "CANDLE", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 217, "CANDLE", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 218, "CANDLE", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 219, "CANDLE", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 220, "NINstrong", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 221, "STRONG_SKULL", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 222, "MOBstrong06", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 223, "MOBstrong06", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 224, "DEVIL_PRINCE", POWER_COLOR_BLACK );
	scr_BotPlayerRegistAndCreate( 225, "PRINCESS_SAD", POWER_COLOR_BLACK );


//コールバックの設定をしておくよ！ 
	scr_SetMessageCallback( "miscb_PlayerSally_First", 1, CB_TYPE_ONCE, MESSAGE_PLAYER_SALLY );		//初回出撃した時のコールバック 
	scr_SetMessageCallback( "miscb_GameSetPlayerDead", 1300, CB_TYPE_ONCE, MESSAGE_PLAYER_DEAD );
	scr_SetMessageCallback( "miscb_TimeOver", 80002, CB_TYPE_ONCE,  MESSAGE_GAME_TIME_OVER );		//タイムオーバー時 


//トラップ登録 
	scr_RegistTrapBox( 1001,  22895.5 ,0.0 ,2934.9 ,1867.6 ,1500.0 ,1826.7 ,0.0  );	//自軍城 
	scr_RegistTrapBox( 1002,  -22923.3 ,0.0 ,-3087.5 ,1865.3 ,1500.0 ,1830.2 ,0.0  );	//敵軍城 
	scr_RegistTrapBox( 1003,  -16621.9 ,0.0 ,-7069.3 ,222.2 ,1000.0 ,711.5 ,-326.6  );	//北01 
	scr_RegistTrapBox( 1004,  -16006.9 ,0.0 ,-5866.8 ,222.2 ,1000.0 ,711.5 ,-351.4  );	//北02 
	scr_RegistTrapBox( 1005,  -15856.9 ,0.0 ,-4451.8 ,222.2 ,1000.0 ,711.5 ,-6.2  );	//北03 
	scr_RegistTrapBox( 1006,  -15781.9 ,0.0 ,-3234.3 ,222.2 ,1000.0 ,711.5 ,0.0  );	//中央 

	scr_RegistTrapBox( 1006,  -769.9 ,0.0 ,-1512.3 ,14569.2 ,1000.0 ,11112.5 ,0.0  );	//中央 

	scr_RegistTrapBox( 1007,  -15888.9 ,0.0 ,-1880.1 ,222.2 ,1000.0 ,788.4 ,-355.9  );	//南01 
	scr_RegistTrapBox( 1008,  -15994.4 ,0.0 ,-564.3 ,222.2 ,1000.0 ,711.5 ,-8.9  );	//南02 
	scr_RegistTrapBox( 1009,  -16772.3 ,0.0 ,678.6 ,221.0 ,1000.0 ,852.5 ,-46.2  );	//南03 
	scr_RegistTrapBox( 1010,  -22478.7 ,0.0 ,373.9 ,297.8 ,1000.0 ,1829.5 ,0.0  );	//城南 
	scr_RegistTrapBox( 1011,  -22561.5 ,0.0 ,-6424.7 ,297.8 ,1000.0 ,1829.5 ,0.0  );	//城北 

	scr_RegistTrapBox( 1012,  -18330.0, 0.0, -2270.0, 210.0, 1000.0, 6990.0, 0.0   );	//最初にイベントがスタートするトラップ 

	//オフラインキャンペーンＨＵＤ設定 
	scr_SetDisableTacticalInfomation();	//バナーテキストを非表示 
	scr_SetEnablePlayerHeroPopup( false );	//ヒーローポップアップの非表示 
	scr_SetEnableInputPlayerVoiceReaction( false );	//リアクションボイスマクロの非表示 
	scr_BotPlayerDisableLearningSkillByLevelUp();
	scr_SetEnableGameWinDemo( false );



//トラップコールバック 

	scr_SetTrapInCallback( "miscb_TrapIn1012", 10012, CB_TYPE_ONCE, 1012 );

	//初回出撃位置を変更 
	// プレイヤー生成を待ちます
	mis_WaitPlayerCreate();

//	scr_PlayerSetForceRespawnPosition( -16834.185547, 20.000002, -3074.025391,-90.0 );	//プレイヤーの出現位置を固定 
	scr_PlayerSetForceRespawnPosition( -17703.693359, 20.000000, -3053.614746,-90.0 );	//プレイヤーの出現位置を固定 

	//開戦前メッセージ 
	mis_Wait( 0.45 );
	mis_MassageDialog( "C322_01" );	//メッセージ： 

	scr_OpenMissionConditionText(  0, "TXHFC06201" );	//達成条件を表示 

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
}
///////////////////////////////////////////
//汎用ファンクション //////////////////////
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
	print("massage!()\n");
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
////////////////////////////////////////////////
// ここからはコールバック処理 
////////////////////////////////////////////////
//プレイヤーが出撃した時のコールバック処理
function miscb_PlayerSally_First()
{
	print( "Player is sally!\n" );
	//必ず敵城に出撃
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );
	scr_SetInputDisable( SCR_INPUT_BUTTON );

	scr_ResetGameCameraBehind( true );
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );
	scr_BotPlayerSetMarchCastleMonument( POWER_COLOR_WHITE, false );


	mis_Wait( 1.0 );
	mis_SetFireEffect();
	scr_CreateSceneEffect( 7601, "Ccam01c",    -17408.226563, 7.000000, -3043.719,   -90.0 );

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
//	scr_SetTimerCallback( "miscb_1stWave", 20001, CB_TYPE_ONCE, 0.5 );
}
function miscb_TimeOver()
{
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
function mis_SetFireEffect()
{
	print( "setfireE!\n" );
	mis_AppearFireEffect( 601, 602, 701, 702, -17270.4 );
	mis_AppearFireEffect( 603, 604, 703, 704, -17670.4 );
	mis_AppearFireEffect( 605, 606, 705, 706, -18070.4 );
	mis_AppearFireEffect( 607, 608, 707, 708, -18470.4 );
	mis_AppearFireEffect( 609, 610, 709, 710, -18870.4 );
	mis_AppearFireEffect( 611, 612, 711, 712, -19270.4 );
	mis_AppearFireEffect( 613, 614, 713, 714, -19670.4 );
}
function mis_AppearFireEffect( E_id_01, E_id_02, S_id_01, S_id_02, x )
{
	scr_CreateSceneEffect( E_id_01, "st29", x, 50.0, -2588.5, 0.0);
	scr_CreateSceneSound( S_id_01, 80050, x, 50.0, -2588.5 );
	scr_CreateSceneEffect( E_id_02, "st29", x, 50.0, -3460.5, 0.0);
	scr_CreateSceneSound( S_id_02, 80050, x, 50.0, -3460.5 );
	mis_Wait( 0.4 );
}
function mis_RemoveFireEffect()
{
	scr_RemoveScene( 601, true );
	scr_RemoveScene( 602, true );
	scr_RemoveScene( 603, true );
	scr_RemoveScene( 604, true );
	scr_RemoveScene( 605, true );
	scr_RemoveScene( 606, true );
	scr_RemoveScene( 607, true );
	scr_RemoveScene( 608, true );
	scr_RemoveScene( 609, true );
	scr_RemoveScene( 610, true );
	scr_RemoveScene( 611, true );
	scr_RemoveScene( 612, true );
	scr_RemoveScene( 613, true );
	scr_RemoveScene( 614, true );
	suspend();
	mis_DisAppearFireEffect( 617, 618, 717, 718, -19670.4 );
	mis_DisAppearFireEffect( 615, 616, 715, 716, -19270.4 );
	mis_DisAppearFireEffect( 613, 614, 713, 714, -18870.4 );
	mis_DisAppearFireEffect( 611, 612, 711, 712, -18470.4 );
	mis_DisAppearFireEffect( 609, 610, 709, 710, -18070.4 );
	mis_DisAppearFireEffect( 607, 608, 707, 708, -17670.4 );
	mis_DisAppearFireEffect( 605, 606, 705, 706, -17270.4 );
}
function mis_DisAppearFireEffect( E_id_01, E_id_02, S_id_01, S_id_02, x )
{
	scr_CreateSceneEffect( E_id_01, "Bbur01c", x, 50.0, -2588.5, 0.0);
	scr_CreateSceneSound( S_id_01, 80050, x, 50.0, -2588.5 );
	scr_CreateSceneEffect( E_id_02, "Bbur01c", x, 50.0, -3460.5, 0.0);
	scr_CreateSceneSound( S_id_02, 80050, x, 50.0, -3460.5 );
}
function miscb_TrapIn1012()
{
	print( "TrapIn 1001!\n" );
	//城門前まできたらイベント発生 
	scr_SetInputDisable( SCR_INPUT_MOVE );
	scr_SetInputDisable( SCR_INPUT_CAMERA );

	scr_BotPlayerSetMapIconVisible( 225, false );

	//姫と魔王のコールバックを設定 
	scr_AddStandbyEnemyCallback( "miscb_MovePrince", 224, STANDBY_COUNT_START_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_MovePrincess", 225, STANDBY_COUNT_START_TIMING );

	scr_BotPlayerSpawnToWorld( 224, -20140.210938, 1060.513062, -3028.814697, 90.0 );
	scr_BotPlayerSpawnToWorld( 225, -20204.042969, 1000.000000, -2768.888672, 90.0 );
	//炎の道が消える 
	scr_RemoveScene( 7601, true );
	mis_RemoveFireEffect();

	//姫と魔王が登場 
	scr_ResetGameCameraDirection( -20204.042969, -2768.888672, false );
	scr_SetGameCameraAngleType( ANGLE_ZOOM_UP );
	mis_Wait( 1.0 );
	mis_MassageDialog( "C322_02" );	//メッセージ： 

	scr_ResetGameCameraDirection( -15177.921875, -3162.732910, false );
	mis_Wait( 0.4 );
	scr_BotPlayerSetMapIconVisible( 224, false );
	scr_BotPlayerSetLife( 224, 0 );	//魔王殺す 
	scr_BotPlayerSetLife( 225, 0 );	//姫殺す 
	scr_SetTimerCallback( "miscb_SetKeepOut", 123456, CB_TYPE_ONCE, 1.3 );

//	scr_SetInputEnable( SCR_INPUT_MOVE );
//	scr_SetInputEnable( SCR_INPUT_CAMERA );
//	scr_SetInputEnable( SCR_INPUT_BUTTON );

	scr_RemoveTrap( 1012 );
}
function miscb_SetKeepOut()
{
	print( "KP!\n" );
	mis_SetKeepOutEffect();
	scr_SetTimerCallback( "miscb_MassageKeepOut", 1234567, CB_TYPE_ONCE, 1.2 );
}
gEventOut <- 0;
function miscb_MassageKeepOut()
{
	print( "KPM!\n" );
	mis_MassageDialog( "C322_03" );	//メッセージ： 
	gEventOut = 1;
}
gMovePrince <- 0;
function miscb_MovePrince()
{
	print( "movep!\n" );
	scr_RemoveStandbyEnemyCallback( 224 );

	scr_BotPlayerSpawnToWorld( 224, -471.313110, -798.000000, 2571.028320, 0.0 );	//魔王飛ばす 
	gMovePrince = 1;
}
function miscb_MovePrincess()
{
	print( "movepc!\n" );
	scr_RemoveStandbyEnemyCallback( 225 );

	scr_BotPlayerSpawnToWorld( 225, -471.313110, -798.000000, 2571.028320, 0.0 );	//姫飛ばす 
	suspend();
	mis_OPEventCheck();
}
function miscb_WaitMove()
{
	print( "Waitmovep!\n" );
	//魔王が消えるのを待っている 
	scr_RemoveCallbackFromId( 12345 );	//タイマーを念のため削除 
	mis_OPEventCheck();
}
function mis_OPEventCheck()
{
	if(gMovePrince == 1 && gEventOut == 1 )	//魔王が消えててメッセージが出た後なら続き、そうじゃなければ待つ 
	{
		print( "EVend!\n" );
		//魔王が見えなくなったらイベントが再開する。 
		mis_OPEventEnd();
	}
	else
	{
		print( "ReWait!\n" );
		scr_SetTimerCallback( "miscb_WaitMove", 12345, CB_TYPE_ONCE, 0.5 );
	}
}
function mis_OPEventEnd()
{
	print( "OPeventend!\n" );
	mis_Wait( 0.5 );
	scr_ResetGameCameraDirection( -20342.277344, -3185.972900, false );
	scr_SetGameCameraAngleType( ANGLE_ZOOM_IN );
	mis_Wait( 0.5 );
	mis_MassageDialog( "C322_04" );	//メッセージ： 
//	mis_BannerInfoTimer("miscb_BunnerInfo0102",2.0);	//バナーを次のものに更新 
//	scr_OpenMissionExpainText( 0, "#TXCMD22041" );	//  

	scr_SetInputEnable( SCR_INPUT_MOVE );
	scr_SetInputEnable( SCR_INPUT_CAMERA );
	scr_SetInputEnable( SCR_INPUT_BUTTON );

//	scr_OpenMissionConditionText(  0, "$TXHFC32201" );	//達成条件を表示 


	scr_BotPlayerSpawnToWorld( 101, -17188.322266, 0.000000, -2346.393555, -90.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 102, -17798.615234, 0.000000, -2687.452393, -90.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 103, -17756.314453, 0.000000, -3637.496582, -90.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 101, true );
	scr_BotPlayerSetActionTrigger( 102, true );
	scr_BotPlayerSetActionTrigger( 103, true );

//	scr_SetTimerCallback( "miscb_1stWave", 20001, CB_TYPE_ONCE, 5.3 );
	scr_SetTimerCallback( "miscb_MOBWave", 20005, CB_TYPE_ONCE, 1.5 );
}
function miscb_BunnerInfo0102()
{
	//バナーインフォメーション続き 
//	print( "Bunner0102!\n" );
//	mis_BannerInfoTimer("miscb_BunnerInfo0103",3.0);	//バナーを削除する 
//	scr_OpenMissionExpainText( 0, "#TXCMD22042" );	//  

}
function miscb_BunnerInfo0103()
{
	//バナーインフォメーション続き 
//	print( "Bunner0103!\n" );
//	mis_BannerInfoTimer("miscb_BunnerInfoRemove",3.0);	//バナーを削除する 
//	scr_OpenMissionExpainText( 0, "#TXCMD22043" );	//  
}



function mis_SetKeepOutEffect()
{
	print( "setkeepoutE!\n" );
//	scr_CreateSceneEffect( 501, "Ccam01c", -16553.515625, 50.000000, -6741.971680,-58.0);
//	scr_CreateSceneEffect( 502, "Ccam01c", -16072.391602, 50.000000, -6066.508789,-81.0);
//	scr_CreateSceneEffect( 503, "Ccam01c", -15946.726563, 50.000000, -5557.560547,-81.0);
//	scr_CreateSceneEffect( 504, "Ccam01c", -15867.599609, 50.000000, -4796.581543,-91.0);
//	scr_CreateSceneEffect( 505, "Ccam01c", -15876.244141, 50.000000, -4264.760742,-91.0);
//	scr_CreateSceneEffect( 506, "Ccam01c", -15935.495117, 50.000000, -1641.743652,-91.0);
//	scr_CreateSceneEffect( 507, "Ccam01c", -16010.713867, 50.000000, -895.456970,-103.0);
//	scr_CreateSceneEffect( 508, "Ccam01c", -16048.087891, 50.000000, -295.533447,-103.0);
//	scr_CreateSceneEffect( 509, "Ccam01c", -16442.724609, 50.000000, 384.246979,-133.0);
//	scr_CreateSceneEffect( 510, "Ccam01c", -16822.898438, 50.000000, 754.349426,-133.0);
//	scr_CreateSceneEffect( 511, "Ccam01c", -22402.683594, 50.000000, -260.174744,90.0);
//	scr_CreateSceneEffect( 512, "Ccam01c", -22370.082031, 50.000000, 536.179016,90.0);
//	scr_CreateSceneEffect( 513, "Ccam01c", -22341.332031, 50.000000, 1238.506836,90.0);
//	scr_CreateSceneEffect( 514, "Ccam01c", -22586.263672, 50.000000, -5670.206055,90.0);
//	scr_CreateSceneEffect( 515, "Ccam01c", -22495.460938, 50.000002, -6459.307617,90.0);
//	scr_CreateSceneEffect( 516, "Ccam01c", -22461.003906, 50.000000, -7319.501465,90.0);
	scr_CreateSceneEffect( 501, "Gjum01c", -16553.515625, 50.000000, -6741.971680,-58.0);
	scr_CreateSceneEffect( 502, "Gjum01c", -16072.391602, 50.000000, -6066.508789,-81.0);
	scr_CreateSceneEffect( 503, "Gjum01c", -15946.726563, 50.000000, -5557.560547,-81.0);
	scr_CreateSceneEffect( 504, "Gjum01c", -15867.599609, 50.000000, -4796.581543,-91.0);
	scr_CreateSceneEffect( 505, "Gjum01c", -15876.244141, 50.000000, -4264.760742,-91.0);
	scr_CreateSceneEffect( 506, "Gjum01c", -15935.495117, 50.000000, -1641.743652,-91.0);
	scr_CreateSceneEffect( 507, "Gjum01c", -16010.713867, 50.000000, -895.456970,-103.0);
	scr_CreateSceneEffect( 508, "Gjum01c", -16048.087891, 50.000000, -295.533447,-103.0);
	scr_CreateSceneEffect( 509, "Gjum01c", -16442.724609, 50.000000, 384.246979,-133.0);
	scr_CreateSceneEffect( 510, "Gjum01c", -16822.898438, 50.000000, 754.349426,-133.0);
	scr_CreateSceneEffect( 511, "Gjum01c", -22402.683594, 50.000000, -260.174744,90.0);
	scr_CreateSceneEffect( 512, "Gjum01c", -22370.082031, 50.000000, 536.179016,90.0);
	scr_CreateSceneEffect( 513, "Gjum01c", -22341.332031, 50.000000, 1238.506836,90.0);
	scr_CreateSceneEffect( 514, "Gjum01c", -22586.263672, 50.000000, -5670.206055,90.0);
	scr_CreateSceneEffect( 515, "Gjum01c", -22495.460938, 50.000002, -6459.307617,90.0);
	scr_CreateSceneEffect( 516, "Gjum01c", -22461.003906, 50.000000, -7319.501465,90.0);

	scr_CreateSceneEffect( 8501, "Ccam37c", -16553.515625, 150.000000, -6741.971680,-58.0);
	scr_CreateSceneEffect( 8502, "Ccam37c", -16072.391602, 150.000000, -6066.508789,-81.0);
	scr_CreateSceneEffect( 8503, "Ccam37c", -15946.726563, 150.000000, -5557.560547,-81.0);
	scr_CreateSceneEffect( 8504, "Ccam37c", -15867.599609, 150.000000, -4796.581543,-91.0);
	scr_CreateSceneEffect( 8505, "Ccam37c", -15876.244141, 150.000000, -4264.760742,-91.0);
	scr_CreateSceneEffect( 8506, "Ccam37c", -15935.495117, 150.000000, -1641.743652,-91.0);
	scr_CreateSceneEffect( 8507, "Ccam37c", -16010.713867, 150.000000, -895.456970,-103.0);
	scr_CreateSceneEffect( 8508, "Ccam37c", -16048.087891, 150.000000, -295.533447,-103.0);
	scr_CreateSceneEffect( 8509, "Ccam37c", -16442.724609, 150.000000, 384.246979,-133.0);
	scr_CreateSceneEffect( 8510, "Ccam37c", -16822.898438, 150.000000, 754.349426,-133.0);
	scr_CreateSceneEffect( 8511, "Ccam37c", -22402.683594, 150.000000, -260.174744,90.0);
	scr_CreateSceneEffect( 8512, "Ccam37c", -22370.082031, 150.000000, 536.179016,90.0);
	scr_CreateSceneEffect( 8513, "Ccam37c", -22341.332031, 150.000000, 1238.506836,90.0);
	scr_CreateSceneEffect( 8514, "Ccam37c", -22586.263672, 150.000000, -5670.206055,90.0);
	scr_CreateSceneEffect( 8515, "Ccam37c", -22495.460938, 150.000002, -6459.307617,90.0);
	scr_CreateSceneEffect( 8516, "Ccam37c", -22461.003906, 150.000000, -7319.501465,90.0);


	scr_SetTrapInCallback( "miscb_TrapIn1001", 10001, CB_TYPE_ALWAYS, 1001 );	
	scr_SetTrapInCallback( "miscb_TrapIn1002", 10002, CB_TYPE_ALWAYS, 1002 );
	scr_SetTrapInCallback( "miscb_TrapIn1003", 10003, CB_TYPE_ALWAYS, 1003 );
	scr_SetTrapInCallback( "miscb_TrapIn1004", 10004, CB_TYPE_ALWAYS, 1004 );
	scr_SetTrapInCallback( "miscb_TrapIn1005", 10005, CB_TYPE_ALWAYS, 1005 );
	scr_SetTrapInCallback( "miscb_TrapIn1006", 10006, CB_TYPE_ALWAYS, 1006 );
	scr_SetTrapInCallback( "miscb_TrapIn1007", 10007, CB_TYPE_ALWAYS, 1007 );
	scr_SetTrapInCallback( "miscb_TrapIn1008", 10008, CB_TYPE_ALWAYS, 1008 );
	scr_SetTrapInCallback( "miscb_TrapIn1009", 10009, CB_TYPE_ALWAYS, 1009 );
	scr_SetTrapInCallback( "miscb_TrapIn1010", 10010, CB_TYPE_ALWAYS, 1010 );
	scr_SetTrapInCallback( "miscb_TrapIn1011", 10011, CB_TYPE_ALWAYS, 1011 );
}
function miscb_GameSetPlayerDead()
{
	print( "Game Setplayerdead\n" );
	suspend();
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	scr_BotPlayerSetLife( 101, 0 );
	scr_BotPlayerSetLife( 102, 0 );
	scr_BotPlayerSetLife( 103, 0 );

	scr_WaitStart( 0.8 );	//１秒待つよ 
	while( scr_Waiting() )	//待つのが終るのを監視するよ 
	{
		suspend();
	}
	mis_MassageDialog( "C321_18" );	//メッセージ： 

	
	scr_GameSetMissionFailure();
}
function miscb_TrapIn1001()
{
	print( "TrapIn 1001開戦後に自軍城内に入った。転送を使ったっぽいのでゲームオーバーにする!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	mis_Wait( 1.0 );
	scr_CreateSceneSound( 66621, 850, 0.0, 0.0, 0.0 );
	scr_PauseOn();	
	scr_OpenDialog( 0, "C322_11" );
	while( scr_IsOpenDialog(0) )
	{
		suspend();
	}
	scr_PauseOff();
	scr_GameSetMissionFailure();	//ミッション失敗 

}
function miscb_TrapIn1002()
{
	print( "TrapIn 1002!\n" );
	mis_WarpOutCastle();
}
function miscb_TrapIn1003()
{
	print( "TrapIn 1003!\n" );
	mis_WarpFromKeepOut(-17188.640625, 0.000000, -6521.600586,-56.0);	//warpto01 
}
function miscb_TrapIn1004()
{
	print( "TrapIn 1004!\n" );
	mis_WarpFromKeepOut(-16692.625000, 0.000000, -5641.742188,-72.0);	//warpto02 
}
function miscb_TrapIn1005()
{
	print( "TrapIn 1005!\n" );
	mis_WarpFromKeepOut(-16544.861328, 0.000000, -4443.845215,-84.0);	//warpto03 
}
function miscb_TrapIn1006()
{
	print( "TrapIn 1006!\n" );
	mis_WarpFromKeepOut(-16691.576172, 20.000002, -3131.127441,-91.0);	//warpto04 
}
function miscb_TrapIn1007()
{
	print( "TrapIn 1007!\n" );
	mis_WarpFromKeepOut(-16651.597656, 0.000000, -1728.659302,-91.0);	//warpto05 
}
function miscb_TrapIn1008()
{
	print( "TrapIn 1008!\n" );
	mis_WarpFromKeepOut(-16638.476563, 0.000000, -783.261536,-100.0);	//warpto06 
}
function miscb_TrapIn1009()
{
	print( "TrapIn 1009!\n" );
	mis_WarpFromKeepOut(-17276.117188, 0.000000, 204.638885,-134.0);	//warpto07 
}
function miscb_TrapIn1010()
{
	print( "TrapIn 1009!\n" );
	mis_WarpTo08();
}
function miscb_TrapIn1011()
{
	print( "TrapIn 1009!\n" );
	mis_WarpTo09();
}
//ワープ 
function mis_WarpFromKeepOut(x, y, z, roty)
{
	print( "warptokeepout!\n" );
	scr_RemoveCallbackFromId( 10003 );
	scr_RemoveCallbackFromId( 10004 );
	scr_RemoveCallbackFromId( 10005 );
	scr_RemoveCallbackFromId( 10006 );
	scr_RemoveCallbackFromId( 10007 );
	scr_RemoveCallbackFromId( 10008 );
	scr_RemoveCallbackFromId( 10009 );

	scr_FadeOutBlack( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
	scr_PlayerWarp( x, y, z, roty );
	suspend();
	scr_ResetGameCameraBehind( true );
	scr_FadeIn( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}

	scr_SetTrapInCallback( "miscb_TrapIn1003", 10003, CB_TYPE_ALWAYS, 1003 );
	scr_SetTrapInCallback( "miscb_TrapIn1004", 10004, CB_TYPE_ALWAYS, 1004 );
	scr_SetTrapInCallback( "miscb_TrapIn1005", 10005, CB_TYPE_ALWAYS, 1005 );
	scr_SetTrapInCallback( "miscb_TrapIn1006", 10006, CB_TYPE_ALWAYS, 1006 );
	scr_SetTrapInCallback( "miscb_TrapIn1007", 10007, CB_TYPE_ALWAYS, 1007 );
	scr_SetTrapInCallback( "miscb_TrapIn1008", 10008, CB_TYPE_ALWAYS, 1008 );
	scr_SetTrapInCallback( "miscb_TrapIn1009", 10009, CB_TYPE_ALWAYS, 1009 );
}
function mis_WarpTo08(){
	scr_FadeOutBlack( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
	scr_PlayerWarp( -21652.250000, 0.000000, 470.746643,90.0 );
	suspend();
	scr_ResetGameCameraBehind( true );
	scr_FadeIn( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
}
function mis_WarpTo09(){
	scr_FadeOutBlack( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
	scr_PlayerWarp( -21553.046875, 0.000000, -6439.815430,90.0 );
	suspend();
	scr_ResetGameCameraBehind( true );
	scr_FadeIn( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
}
function mis_WarpOutCastle(){
	scr_FadeOutBlack( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
	scr_PlayerWarp( -19655.097656, 0.000000, -3007.147461,88.0 );
	suspend();
	scr_FadeIn( 0.5 );
	while( !scr_IsFadeFinish() ){
		suspend();
	}
}
gMOBwave <- 0;
function miscb_1stWave()
{
	print( "1stwave!\n" );

	scr_BotPlayerSetMapIconVisible( 209, true );
	scr_BotPlayerSetMapIconVisible( 210, true );
	scr_BotPlayerSetMapIconVisible( 211, true );
	scr_BotPlayerSetMapIconVisible( 212, true );
	scr_BotPlayerSetMapIconVisible( 213, true );
	scr_BotPlayerSetMapIconVisible( 214, true );

	scr_BotPlayerSpawnToWorld( 209, -18865.630859, 0.000000, -4328.713867, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 210, -18932.501953, 0.000000, -1516.575806, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 211, -19535.294922, 0.000000, -3785.524658,88.0, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 212, -19533.072266, 0.000000, -2097.156738, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 213,-17441.910156, 325.757690, -5537.039063, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 214,-17424.933594, 325.757690, -551.124268, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 209, true );
	scr_BotPlayerSetActionTrigger( 210, true );
	scr_BotPlayerSetActionTrigger( 211, true );
	scr_BotPlayerSetActionTrigger( 212, true );

	scr_AddStandbyEnemyCallback( "miscb_DeleatBot209", 209, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot210", 210, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot211", 211, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot212", 212, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot213", 213, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot214", 214, STANDBY_CAN_RESPAWN_TIMING );

	scr_SetTimerCallback( "miscb_ActionStart213_214", 213124, CB_TYPE_ONCE, 3.5 );	//魔法使いのトリガーをオン 

	scr_SetTimerCallback( "miscb_checkWaveClear01", 30001, CB_TYPE_ALWAYS, 3.0 );
}
function miscb_ActionStart213_214()
{
	scr_BotPlayerSetActionTrigger( 213, true );
	scr_BotPlayerSetActionTrigger( 214, true );
}
function miscb_checkWaveClear01()
{
	if(scr_BotPlayerGetLife( 209 ) == 0 && scr_BotPlayerGetLife( 210 ) == 0 && scr_BotPlayerGetLife( 211 ) == 0 && scr_BotPlayerGetLife( 212 ) == 0 && scr_BotPlayerGetLife( 213 ) == 0 && scr_BotPlayerGetLife( 214 ) == 0 )
	{
		print( "1stwaveClear!\n" );
//		scr_SetTimerCallback( "miscb_MOBWave", 20005, CB_TYPE_ONCE, 3.0 );
		scr_SetTimerCallback( "miscb_2ndWave", 20002, CB_TYPE_ONCE, 5.4 );
		scr_RemoveCallbackFromId( 30001 );
	}
}
function miscb_2ndWave()
{
	print( "2ndwave!\n" );

	mis_MassageDialog( "C322_05" );	//メッセージ： 

	scr_BotPlayerSetMapIconVisible( 215, true );
	scr_BotPlayerSetMapIconVisible( 216, true );
	scr_BotPlayerSetMapIconVisible( 217, true );
	scr_BotPlayerSetMapIconVisible( 218, true );
	scr_BotPlayerSetMapIconVisible( 219, true );
	scr_BotPlayerSetMapIconVisible( 220, true );
	scr_BotPlayerSetMapIconVisible( 221, true );

	scr_BotPlayerSpawnToWorld( 215, -19257.722656, 0.000000, -1633.601196, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 216, -19234.480469, 20.000002, -4930.458008, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 217, -17428.929688, 325.757690, -5538.379395, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 218, -17460.386719, 325.757690, -511.715454, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 219, -16850.152344, 20.000002, -3084.773438, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 220, -19126.423828, 0.000000, -2473.700195, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 221, -19180.603516, 0.000000, -3563.985107, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 220, true );
	scr_BotPlayerSetActionTrigger( 221, true );

	scr_SetTimerCallback( "miscb_ActionStart215", 215, CB_TYPE_ONCE, 10.0 );	//魔法使いのトリガーをオン 

	scr_SetTimerCallback( "miscb_checkWaveClear02", 30002, CB_TYPE_ALWAYS, 3.0 );

	scr_AddStandbyEnemyCallback( "miscb_DeleatBot215", 215, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot216", 216, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot217", 217, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot218", 218, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot219", 219, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot220", 220, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot221", 221, STANDBY_CAN_RESPAWN_TIMING );
}
function miscb_ActionStart215()
{
	scr_BotPlayerSetActionTrigger( 215, true );
	scr_SetTimerCallback( "miscb_ActionStart216", 216, CB_TYPE_ONCE, 8.0 );	//魔法使いのトリガーをオン 
}
function miscb_ActionStart216()
{
	scr_BotPlayerSetActionTrigger( 216, true );
	scr_SetTimerCallback( "miscb_ActionStart217", 217, CB_TYPE_ONCE, 6.0 );	//魔法使いのトリガーをオン 
}
function miscb_ActionStart217()
{
	scr_BotPlayerSetActionTrigger( 217, true );
	scr_SetTimerCallback( "miscb_ActionStart218", 218, CB_TYPE_ONCE, 5.0 );	//魔法使いのトリガーをオン 
}
function miscb_ActionStart218()
{
	scr_BotPlayerSetActionTrigger( 218, true );
	scr_SetTimerCallback( "miscb_ActionStart219", 219, CB_TYPE_ONCE, 3.0 );	//魔法使いのトリガーをオン 
}
function miscb_ActionStart219()
{
	scr_BotPlayerSetActionTrigger( 219, true );
}
function miscb_checkWaveClear02()
{
	if(scr_BotPlayerGetLife( 215 ) == 0 && scr_BotPlayerGetLife( 216 ) == 0 && scr_BotPlayerGetLife( 217 ) == 0 && scr_BotPlayerGetLife( 218 ) == 0 && scr_BotPlayerGetLife( 219 ) == 0 && scr_BotPlayerGetLife( 220 ) == 0 && scr_BotPlayerGetLife( 221 ) == 0 )
	{
		print( "2ndwaveClear!\n" );
		scr_SetTimerCallback( "miscb_MOBWave", 20005, CB_TYPE_ONCE, 3.0 );
		scr_RemoveCallbackFromId( 30002 );
	}
}
function miscb_3rdWave()
{
	print( "3rdwave!\n" );

	//一旦姫の力で全員全回復 
	mis_MassageDialog( "C322_06" );	//メッセージ： 
	if(scr_BotPlayerGetLife( 101 ) == 0 || scr_BotPlayerGetLife( 102 ) == 0 || scr_BotPlayerGetLife( 103 ) == 0)
	{
		if(scr_BotPlayerGetLife( 101 ) == 0)
		{
			scr_CreateSceneEffect( 801, "Cpmg07c", -17188.322266, 0.000000, -2346.393555, -90.0 );
			scr_BotPlayerSpawnToWorld( 101, -17188.322266, 0.000000, -2346.393555, -90.0 );	//MOBs 
		}
		if(scr_BotPlayerGetLife( 102 ) == 0)
		{
			scr_CreateSceneEffect( 802, "Cpmg07c", -17798.615234, 0.000000, -2687.452393, -90.0 );
			scr_BotPlayerSpawnToWorld( 102, -17798.615234, 0.000000, -2687.452393, -90.0 );	//MOBs 
		}
		if(scr_BotPlayerGetLife( 103 ) == 0)
		{
			scr_CreateSceneEffect( 803, "Cpmg07c", -17756.314453, 0.000000, -3637.496582, -90.0 );
			scr_BotPlayerSpawnToWorld( 103, -17756.314453, 0.000000, -3637.496582, -90.0 );	//MOBs 
		}
		mis_Wait( 1.0 );
		mis_MassageDialog( "C322_10" );	//メッセージ： 
	}
	scr_SetTimerCallback( "miscb_3rdWave_Spawn", 20009, CB_TYPE_ONCE, 2.0 );

}
function miscb_3rdWave_Spawn()
{
	print( "3rdwave!\n" );

	scr_BotPlayerSetMapIconVisible( 209, true );
	scr_BotPlayerSetMapIconVisible( 210, true );
	scr_BotPlayerSetMapIconVisible( 220, true );
	scr_BotPlayerSetMapIconVisible( 221, true );

	scr_BotPlayerSpawnToWorld( 209,-19240.425781, 0.000000, -1525.596436, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 210,-19262.960938, 0.000000, -4238.807129, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 220,-17104.955078, 0.000000, -1636.918091, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 221,-17135.798828, 88.241173, -4435.777344, 0.0 );	//MOBs 

	suspend();
	scr_BotPlayerSetActionTrigger( 209, true );
	scr_BotPlayerSetActionTrigger( 210, true );
	scr_BotPlayerSetActionTrigger( 220, true );
	scr_BotPlayerSetActionTrigger( 221, true );

	scr_SetTimerCallback( "miscb_SpawnCandle", 99901, CB_TYPE_ONCE, 16.0 );


	scr_AddStandbyEnemyCallback( "miscb_DeleatBot209", 209, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot210", 210, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot220", 220, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot221", 221, STANDBY_CAN_RESPAWN_TIMING );
}
function miscb_SpawnCandle()
{
	scr_BotPlayerSetMapIconVisible( 215, true );
	scr_BotPlayerSetMapIconVisible( 216, true );
	scr_BotPlayerSetMapIconVisible( 217, true );
	scr_BotPlayerSetMapIconVisible( 218, true );
	
	scr_BotPlayerSpawnToWorld( 215, -19620.230469, 0.000000, -3009.560059, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 216, -17399.919922, 325.757690, -5554.333984, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 217, -17442.939453, 325.757690, -579.115356, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 218, -16860.699219, 20.000002, -3062.826172, 0.0 );	//MOBs 
	suspend();
	suspend();
	suspend();
	scr_BotPlayerSetActionTrigger( 215, true );
	scr_BotPlayerSetActionTrigger( 216, true );
	scr_BotPlayerSetActionTrigger( 217, true );
	scr_BotPlayerSetActionTrigger( 218, true );

	scr_SetTimerCallback( "miscb_checkWaveClear03", 30003, CB_TYPE_ALWAYS, 3.0 );

	scr_AddStandbyEnemyCallback( "miscb_DeleatBot215", 215, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot216", 216, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot217", 217, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot218", 218, STANDBY_CAN_RESPAWN_TIMING );
}
function miscb_checkWaveClear03()
{
	if(scr_BotPlayerGetLife( 209 ) == 0 && scr_BotPlayerGetLife( 210 ) == 0 && scr_BotPlayerGetLife( 215 ) == 0 && scr_BotPlayerGetLife( 216 ) == 0 && scr_BotPlayerGetLife( 217 ) == 0 && scr_BotPlayerGetLife( 218 ) == 0 && scr_BotPlayerGetLife( 220 ) == 0 && scr_BotPlayerGetLife( 221 ) == 0 )
	{
		print( "3rdwaveClear!\n" );
		scr_SetTimerCallback( "miscb_EndWave", 20004, CB_TYPE_ONCE, 2.0 );
		scr_RemoveCallbackFromId( 30003 );
	}
}
function miscb_MOBWave()
{
	print( "Endwave!\n" );

	scr_BotPlayerSetMapIconVisible( 201, true );
	scr_BotPlayerSetMapIconVisible( 202, true );
	scr_BotPlayerSetMapIconVisible( 203, true );
	scr_BotPlayerSetMapIconVisible( 204, true );
	scr_BotPlayerSetMapIconVisible( 205, true );
	scr_BotPlayerSetMapIconVisible( 206, true );
	scr_BotPlayerSetMapIconVisible( 207, true );
	scr_BotPlayerSetMapIconVisible( 208, true );

	scr_BotPlayerSpawnToWorld( 201, -19275.236328, 20.000002, -564.694763, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 202, -19268.332031, 0.000000, -1221.071899, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 203, -19260.699219, 0.000000, -1885.233887, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 204, -19251.878906, 0.000000, -2652.872070, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 205, -19244.250000, 0.000000, -3317.546631, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 206, -19237.279297, 0.000000, -3924.907471, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 207, -19231.324219, 0.000000, -4443.767578, 0.0 );	//MOBs 
	scr_BotPlayerSpawnToWorld( 208, -19224.205078, 20.000002, -5009.435547, 0.0 );	//MOBs 
	suspend();
	scr_BotPlayerSetActionTrigger( 201, true );
	scr_BotPlayerSetActionTrigger( 202, true );
	scr_BotPlayerSetActionTrigger( 203, true );
	scr_BotPlayerSetActionTrigger( 204, true );
	scr_BotPlayerSetActionTrigger( 205, true );
	scr_BotPlayerSetActionTrigger( 206, true );
	scr_BotPlayerSetActionTrigger( 207, true );
	scr_BotPlayerSetActionTrigger( 208, true );

	gMOBwave = (gMOBwave + 1);
	scr_SetTimerCallback( "miscb_checkWaveClearMOB", 30004, CB_TYPE_ALWAYS, 3.0 );

	scr_AddStandbyEnemyCallback( "miscb_DeleatBot201", 201, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot202", 202, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot203", 203, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot204", 204, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot205", 205, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot206", 206, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot207", 207, STANDBY_CAN_RESPAWN_TIMING );
	scr_AddStandbyEnemyCallback( "miscb_DeleatBot208", 208, STANDBY_CAN_RESPAWN_TIMING );

}
function miscb_checkWaveClearMOB()
{
	if(scr_BotPlayerGetLife( 201 ) == 0 && scr_BotPlayerGetLife( 202 ) == 0 && scr_BotPlayerGetLife( 203 ) == 0 && scr_BotPlayerGetLife( 204 ) == 0 && scr_BotPlayerGetLife( 205 ) == 0 && scr_BotPlayerGetLife( 206 ) == 0 && scr_BotPlayerGetLife( 207 ) == 0 && scr_BotPlayerGetLife( 208 ) == 0 )
	{
		print( "MOBwaveClear!\n" );
		if(gMOBwave == 1)
		{
//			scr_SetTimerCallback( "miscb_2ndWave", 20002, CB_TYPE_ONCE, 3.0 );
			scr_SetTimerCallback( "miscb_1stWave", 20001, CB_TYPE_ONCE, 3.0 );
			scr_RemoveCallbackFromId( 30004 );
		}
		if(gMOBwave == 2)
		{
			scr_SetTimerCallback( "miscb_3rdWave", 20003, CB_TYPE_ONCE, 1.0 );
			scr_RemoveCallbackFromId( 30004 );
		}
	}
}
function miscb_EndWave()
{
	print( "Endwave!\n" );

	mis_MassageDialog( "C322_07" );	//メッセージ： 

	scr_SetTimerCallback( "miscb_startEndWave", 28888, CB_TYPE_ONCE, 3.0 );
}
function miscb_startEndWave()
{
	print( "startEndwave!\n" );

	mis_MassageDialog( "C322_08" );	//メッセージ： 

	scr_CreateSceneEffect( 601, "Slis02c", -20882.460938, 675.000000, -1113.404297,-81.0);
	scr_CreateSceneSound( 651, 80950, -20882.460938, 675.000000, -1113.404297 );
	scr_CreateSceneEffect( 604, "Slis02c", -21004.626953, 675.000000, -4854.258789,-81.0);
	scr_CreateSceneSound( 654, 80950, -21004.626953, 675.000000, -4854.258789 );
//	scr_BotPlayerSetLife( 101, 0 );
	mis_Wait( 0.8 );
	scr_RemoveScene( 601, true );
	scr_RemoveScene( 604, true );


	scr_CreateSceneEffect( 603, "Slis02c", -21014.138672, 600.000000, -4026.064941,-81.0);
	scr_CreateSceneSound( 653, 80950, -21014.138672, 600.000000, -4026.064941 );
	scr_CreateSceneEffect( 602, "Slis02c", -21039.771484, 600.000000, -2029.680908,-81.0);
	scr_CreateSceneSound( 652, 80950, -21039.771484, 600.000000, -2029.680908 );
//	scr_BotPlayerSetLife( 102, 0 );
	mis_Wait( 0.8 );
	scr_RemoveScene( 603, true );
	scr_RemoveScene( 602, true );
	scr_RemoveScene( 651, true );
	scr_RemoveScene( 654, true );


//	scr_BotPlayerSetLife( 103, 0 );
	mis_Wait( 0.8 );
	scr_RemoveScene( 605, true );
	scr_RemoveScene( 606, true );
	scr_RemoveScene( 653, true );
	scr_RemoveScene( 652, true );


	scr_CreateSceneEffect( 1212, "Gque05c", -19555.492188, 0.000000, -3008.868652,-81.0);
	scr_CreateSceneSound( 1213, 80950, -19555.492188, 0.000000, -3008.868652 );
	scr_CreateSceneEffect( 1214, "Slis02c", -19555.492188, 0.000000, -3008.868652,-81.0);
	scr_CreateSceneSound( 1215, 80950, -19555.492188, 0.000000, -3008.868652 );
	scr_BotPlayerSetMapIconVisible( 224, true );
	scr_BotPlayerSpawnToWorld( 224, -19555.492188, 0.000000, -3008.868652, 90.0 );	//MOBs 

	suspend();

	scr_BotPlayerSetActionTrigger( 224, true );
	scr_AddTargetEnemyCallback( "miscb_KillBoss224", 224, "$TXHFI32201" );
	scr_AddStandbyEnemyCallback( "miscb_DeadBoss224", 224, STANDBY_COUNT_START_TIMING );

}
function miscb_KillBoss224()
{
	print( "killbos!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );

	mis_Wait( 1.8 );

	mis_MassageDialog( "C322_09" );	//メッセージ： 

	scr_PauseOff();
	scr_GameSetMissionSuccess();
}
function miscb_DeadBoss224()
{
	print( "deadbos!\n" );
	scr_RemoveCallbackAll();
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 
	scr_CloseMissionStateText( 0 );	//達成状況を非表示 
	scr_CloseMissionExpainText( 0 );


	mis_Wait( 1.8 );

	mis_MassageDialog( "C322_09" );	//メッセージ： 

	scr_PauseOff();
	scr_GameSetMissionSuccess();

}
function mis_GotoDeadPoint( regist_id )
{
	print( "gotoDeadPointsomeBot!\n" );
	scr_RemoveStandbyEnemyCallback( regist_id );
	scr_BotPlayerSetMapIconVisible( regist_id, false );
	scr_BotPlayerSpawnToWorld( regist_id, 49534.313110, 716.000000, 1691.028320, 0.0 );	//MOBs 
}
function miscb_DeleatBot201()
{
	mis_GotoDeadPoint( 201 );
}
function miscb_DeleatBot202()
{
	mis_GotoDeadPoint( 202 );
}
function miscb_DeleatBot203()
{
	mis_GotoDeadPoint( 203 );
}
function miscb_DeleatBot204()
{
	mis_GotoDeadPoint( 204 );
}
function miscb_DeleatBot205()
{
	mis_GotoDeadPoint( 205 );
}
function miscb_DeleatBot206()
{
	mis_GotoDeadPoint( 206 );
}
function miscb_DeleatBot207()
{
	mis_GotoDeadPoint( 207 );
}
function miscb_DeleatBot208()
{
	mis_GotoDeadPoint( 208 );
}
function miscb_DeleatBot209()
{
	mis_GotoDeadPoint( 209 );
}
function miscb_DeleatBot210()
{
	mis_GotoDeadPoint( 210 );
}
function miscb_DeleatBot211()
{
	mis_GotoDeadPoint( 211 );
}
function miscb_DeleatBot212()
{
	mis_GotoDeadPoint( 212 );
}
function miscb_DeleatBot213()
{
	mis_GotoDeadPoint( 213 );
}
function miscb_DeleatBot214()
{
	mis_GotoDeadPoint( 214 );
}
function miscb_DeleatBot215()
{
	mis_GotoDeadPoint( 215 );
}
function miscb_DeleatBot216()
{
	mis_GotoDeadPoint( 216 );
}
function miscb_DeleatBot217()
{
	mis_GotoDeadPoint( 217 );
}
function miscb_DeleatBot218()
{
	mis_GotoDeadPoint( 218 );
}
function miscb_DeleatBot219()
{
	mis_GotoDeadPoint( 219 );
}
function miscb_DeleatBot220()
{
	mis_GotoDeadPoint( 220 );
}
function miscb_DeleatBot221()
{
	mis_GotoDeadPoint( 221 );
}
function miscb_DeleatBot222()
{
	mis_GotoDeadPoint( 222 );
}
