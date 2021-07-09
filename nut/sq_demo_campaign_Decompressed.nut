/* XDASEA_Xm8R_SPsX */ 
//
//	キャンペーンシーケンス
//

function initCampaignThread() {
	RunScriptFunction( SQ_THREAD_GAME, "startCampaignThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

function startCampaignThread() {
	// セレクターを常駐させる 
	IncludeScriptFile( "nut\\sq_thread_ini_selector.nut" );
	RunScriptFunction( SQ_THREAD_INI_SELECTOR, "iniSelectorThread" );
	EnableForcusThreadId( SQ_THREAD_INI_SELECTOR, true );

	runDemoCampaign(0,SQ_THREAD_GAME,true);
}

function loadMissionScript() {
	// ミッションスクリプトのロード
	local campaign_name = GetRunningCampaignName();
	
	// とりあえず破棄
	MissionBresDestroyRequest();
	// 破棄待ち
	while ( false == MissionBresIsDestroyComplete() )
	{
		suspend();
	}
	
	MissionBresLoadRequest( campaign_name );
	// ロード終了待ち
	while ( false == MissionBresIsLoadComplete() )
	{
		suspend();
	}
	
//	local mission_name = GetRunningMissionName();
//	local mission_file_name = "campaign/default/" + campaign_name + "/" + mission_name + "/" + mission_name + ".nut";
//	IncludeScriptFile( mission_file_name );
}





function SetupDemo()
{
	// ゲームのリソースとメニューのリソースを入れ替える
	changeResourceForMenu();

	local startUpSceneIds = SetupMenu( SQ_THREAD_GAME );

	StartMenuBG();
}


function SetupViewerCampaignDemo()
{
	// キャンペーンの開始
	RequestCampaign();
	suspend();

	// 準備完了待ち
	while( !IsRunningCampaign() )
	{
		suspend();
	}
	suspend();
}

function PlayStartDemo()
{
	GeminiNowLoadingStart();
	while(!GeminiIsNowLoadingStart())
	{
		suspend();
	}
	
	// キャンペーンの開始
	StartOpeningCampaignDemo();

	RequestMenu( SQ_THREAD_GAME );
}

function PlayEndDemo()
{
	if(IsRunningMissionSuccess())
	{
		GeminiNowLoadingStop();
		while(!GeminiIsNowLoadingStop())
		{
			suspend();
		}
		GeminiNowLoadingEnd();
	
		// デモ開始
		StartClosingCampaignDemo();
	}

	ReleaseCampaignDemo();
}

function PlayGameDemo(mode, thread_id, is_debug_mode)
{
	// ゲーム開始
	// メニューのリソースとゲームのリソースを入れ替え
	changeResourceForGame();

	SetDispList(true);

	// ゲームプレイ 
	ezGamePlay( mode, thread_id, is_debug_mode );

	GeminiNowLoadingPut(1);

	SetDispList(true);

	// オートセーブ
	if( IsGameResultFinished() ) {
		ezSaveData( false, true );
	}
}




function runDemoCampaign( mode, thread_id, is_debug_mode ) {

	GeminiNowLoadingStart();
	GeminiNowLoadingPut(0);

	ezBackgroundLoadAndConfig( thread_id, false, false, false );

	// デモ開始
	// ゲームのリソースとメニューのリソースを入れ替える
	
	SetupDemo();

	local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD) | (1<<SCENE_GROUP_MENUBG);

	// ループ 
	while (true)
	{
		GeminiNowLoadingEnd();

		SetupViewerCampaignDemo();

		PlayStartDemo();

		GeminiNowLoadingPut(0);
		
		// シーンを解放する
		SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		
		SceneManagerDelCurrentScene("menu_bg");

		// 念のためSyncしておく 
		loadResidentResourceThreadSync();

		PlayGameDemo( mode, thread_id, is_debug_mode );

		GraphicsCatalogDestroy();
		DestroyScaleformMenu(false);

		// シーンを解放する。
		SceneManagerOrderRelaseSceneByGroup(releaseFlags);

		SetupDemo();

		PlayEndDemo();
	}
}


