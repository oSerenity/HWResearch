/* XDASEA_Xm8R_SPsX */ 
//
//	メニューを含めた画面遷移のシーケンス
//

//-----------------------------------------------------------------------------
//	グローバル変数 
gGeminiDebugMode <- false;


//-----------------------------------------------------------------------------
//	初期化
function initDemoP1Thread() {
	RunScriptFunction( SQ_THREAD_GAME, "startDemoP1Thread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}
function startDemoP1Thread() {
	// セレクターを常駐させる 
	IncludeScriptFile( "nut\\sq_thread_ini_selector.nut" );
	RunScriptFunction( SQ_THREAD_INI_SELECTOR, "iniSelectorThread" );
	EnableForcusThreadId( SQ_THREAD_INI_SELECTOR, true );

	gGeminiDebugMode = true;
	runMainLoop();
}

//-----------------------------------------------------------------------------
//	メニュー用リソースロード
function loadMenu( scene )
{
	//今は分岐無し. ホントはsceneによって、必要であれば読み込むbresを変える(?).
	JsonLoadItemAll();
	LoadCharacterAll();
	LoadScaleformMenu();
}
function releaseMenu()
{
	ReleaseScaleformMenu();
}

//-----------------------------------------------------------------------------
//	メインループ
function runMainLoop() {

	local gameResourceOnMemory = false;
	local menuResourceOnMemory = false;	//bresの管理が出来たら要修正(?)
	local nextScene = GetFirstScene();

	//	常駐リソースのロード
	loadResidentResource();
	
	//	メインループ
	while (true)
	{
		suspend();
		switch( nextScene )
		{
		//ゲームシーン
		case "game":
			{
				//	メニューリソースの開放
				if( menuResourceOnMemory )
				{
					releaseMenu();
					menuResourceOnMemory = false;
				}
			
				//	ゲーム用リソースのロード	//最終的にはゲーム起動シーケンスのどこかで裏読みを...
				if( !gameResourceOnMemory )
				{
					loadGameResource();
					gameResourceOnMemory = true;
				}
		
				//	ゲーム実行
				DemoP1_RunGame( SQ_THREAD_GAME );

				//	ゲーム用リソースの開放
				//...(開放しない？)
				SceneManagerSetNextSceneName( "title" );
			} break;
		//メニューシーン
		default:
			{
				if( gameResourceOnMemory )
				{
					releaseGameResource();
					gameResourceOnMemory = false;
				}

				//	メニュー用リソースのロード
				if( !menuResourceOnMemory )
				{
					loadMenu( nextScene );
					menuResourceOnMemory = true;
				}

				//	メニュー実行
				DemoP1_RunMenu( SQ_THREAD_GAME, nextScene );

				//	メニュー用リソースの開放
				//...(開放しない？)
			} break;
		}

		nextScene = GetNextScene();
		if( ("" == nextScene) || ("exit" == nextScene) )
			break;
	}
	
	// Menu, HUD の開放.
	DestroyScaleformMenu();
	DestroyScaleformHUD();

	GeminiPostEscape();
	while(1){ suspend(); }
}

//-----------------------------------------------------------------------------
//	メニュー実行 
//	※タイトルロゴのみ
function DemoP1_RunMenu( thread_id, scene ) {
	DebugConsoleOff();

	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	CreateScaleformMenu();

	//// データのロード
	//ezLoadData( true, true );

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu();

	// シーンを開始
	foreach(id in startUpSceneIds)
	{
		SceneManagerAddCurrentScene(id);
	}

	while( true ) {
		suspend();
		
		//if( !IsPlayingScaleformMenu( scene ) )
		//if( SceneManagerGetCurrentSceneNum()==0 )
		//{
		//	break;
		//}
		grahicsMouse();
	}
	
	//ScreenFadeSet( 0xff000000);
	suspend();
	
	GraphicsCatalogDestroy();
	DestroyScaleformMenu();

	EnableForcusThreadId( thread_id, false );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );
	
	suspend();
}


//-----------------------------------------------------------------------------
//	ゲーム実行
function DemoP1_RunGame( thread_id ) {

	// GameConfig作成 
	ezDebugGameConfig( thread_id );

	// ゲームプレイ 
	ezGamePlay( 0, thread_id, true );

	SceneManagerAddCurrentScene("go_game");

}



