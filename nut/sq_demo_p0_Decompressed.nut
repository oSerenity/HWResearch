/* XDASEA_Xm8R_SPsX */ 
//
//	P0 のタメのシーケンス
//
//	HitViewerも同じものを使います 
//
function initDemoP0Thread() {
	RunScriptFunction( SQ_THREAD_GAME, "startDemoP0Thread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

function startDemoP0Thread() {
	// セレクターを常駐させる 
	IncludeScriptFile( "nut\\sq_thread_ini_selector.nut" );
	RunScriptFunction( SQ_THREAD_INI_SELECTOR, "iniSelectorThread" );
	EnableForcusThreadId( SQ_THREAD_INI_SELECTOR, true );

	runDemo(0,SQ_THREAD_GAME,true);
}

function initHitViewer() {
	RunScriptFunction( SQ_THREAD_GAME, "startStageViwerThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

function startStageViwerThread()
{
	// セレクターを常駐させる 
	IncludeScriptFile( "nut\\sq_thread_ini_selector.nut" );
	RunScriptFunction( SQ_THREAD_INI_SELECTOR, "iniSelectorThread" );
	EnableForcusThreadId( SQ_THREAD_INI_SELECTOR, true );

	runDemo(1,SQ_THREAD_GAME,true);
}

function runDemo( mode, thread_id, is_debug_mode ) {

	GeminiNowLoadingStart();
	GeminiNowLoadingPut(0);

	ezBackgroundLoadAndConfig( thread_id, false, false, true );

	local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD) | (1<<SCENE_GROUP_MENUBG);

	// ループ 
	while (true)
	{
		//StartCapture();


		loadGameResource();
		buildSceneForGame();

		// ゲームプレイ 
		ezGamePlay( mode, thread_id, is_debug_mode );

		// シーンを解放する。
		SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		releaseGameResource();

		// オートセーブ
		if( IsGameResultFinished() ) {
			ezSaveData( false, true );
		}

		GeminiNowLoadingEnd();

		//EndCapture();
		// 次のコンフィギュレーション決定 
		ezDebugGameConfig( thread_id );

		GeminiNowLoadingStart();
		GeminiNowLoadingPut(0);
	}
}
