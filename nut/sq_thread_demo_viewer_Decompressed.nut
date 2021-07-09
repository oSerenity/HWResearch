/* XDASEA_Xm8R_SPsX */ 
//
//	DemoViewerのシーケンス
//


gDemoViewerLangage <- 0; // デフォルトは日本語 

function DemoViewerStart()
{
	RunScriptFunction( SQ_THREAD_GAME, "startActionCommandViewerThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );
}

function SetUpLangage( lang )
{
	ScaleformSetLanguage( lang ); // 0...Japanese 1...English
	while( false == ScaleformLanguageReady() )
	{
		suspend();
	}
}

function startActionCommandViewerThread()
{
	//if( ihp.GetGameKeyboard().IsPush( 'E' ) )
	if( DebugPadIsLevel(::PAD_LB) )
		gDemoViewerLangage = 1; // English 

	// エフェクト全ロード 
	LoadGfxAll();
	suspend();
	
	// アイテムロード 
	JsonLoadItemAll();
	suspend();
	
	// キャラクタ－モデルとモーションを読み込む 
	LoadCharacterAll();
	suspend();
	
	// プレイヤー全ロード 
	JsonLoadPlayerAll();		// プレイヤーのパラメータをロード 
	// ↑JsonDemoも含む 
	suspend();

	//LoadGimmickAll(); // ←デモでは未使用. 
	//suspend();


	// HUDロード 
	ScaleformBresLoadRequest( "UI_common.bres", true );
	while( false == ScaleformBresIsLoadComplete() )
	{
		suspend();
	}
	SetUpLangage( gDemoViewerLangage );
	ScaleformLoadHUDJson();


	LoadScaleformHUD();

	// ActionFuncs [注 : JsonLoadPlayerAll()の後で実行]
	LoadActorFunction();
	suspend();
	
	// HUD作成 ( createDemoCharacterの前 ) 
	CreateScaleformHUD();

	// BGM再生
	//local bgm_no = game_seed.getStageSeed().getStageBgm();
	//PlayBgmForce( bgm_no, 1.0 );

	// BodyやTalentの生成 
	CreateDemoCharacter(); // DemoCharacterManagerをクリエイト 

	InitMoviePlayerCache();

	{
		// demo 
		local scene = SceneManagerAddScene("go_demo",SCENE_GROUP_HUD);
		//scene.addMoviePlayer("go_demo");
		SceneManagerAddCurrentScene("go_demo");
	}

	SetHudPlayStatus(true);

//	local windowSample_ = WindowBase( 64, 608, 256, 64 );
//	windowSample_.setWindowText( "Title Press BACK to Abort" );
	while(true)
	{
		suspend();

//		windowSample_.exec();
//		windowSample_.draw();
		grahicsMouse();

		// 言語切り替え 
		if( DebugPadIsTrigger(::PAD_LB) )
		{
			gDemoViewerLangage++;
			if( gDemoViewerLangage >1 ) gDemoViewerLangage=0;
			SetUpLangage( gDemoViewerLangage );
		}
		// 抜けてメニューに戻る 
		if(DebugPadIsTrigger(::PAD_BACK) || ihp.GetGameKeyboard().IsPush( 'X' ) )
		{
			break;
		}
	}

	SetHudPlayStatus(false);

	// BodyやTalentの破棄
	DestroyDemoCharacter();
	suspend();

	// エフェクトの破棄 
	StageEffectDestroy();
	for (local i=0; i<8; ++i) { suspend(); }
	GfxEraseAll();
	for (local i=0; i<8; ++i) { suspend(); }
	GfxBresDestroyRequest(); // リソース消去 
	while ( false == GfxBresIsDestroyComplete() )
	{
		suspend();
	}
	
	// キャラの破棄 
	//CharaModelDestroy();
	DestroyCharacterAll();
	DestroyGimmickAll();
	
	ScaleformBresDestroyRequest();

	// HUD削除 
	DestroyScaleformHUD();
	ReleaseScaleformHUD();

	debugMenuWakeup();
}
