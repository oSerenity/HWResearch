/* XDASEA_Xm8R_SPsX */ 
//
//	EffectViewerのシーケンス
//

function initEffectViewer() {
	RunScriptFunction( SQ_THREAD_GAME, "startEffectViwerThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

// グローバル変数 
gMotionEnable <- false;

function startEffectViwerThread() {

	//ScreenFadeSet( 0xffffffff );
	//suspend();
	
	// エフェクト全ロード 
	LoadGfxAll();
	suspend();

	JsonLoadPlayerAll();		// プレイヤ for BoneInfos

	// アイテムロード 
	JsonLoadItemAll();
	suspend();

	if( !DebugPadIsLevel(::PAD_RB) ) // RBが押されていない 
	{
		gMotionEnable = true;
	}

	if( gMotionEnable )
	{
		LoadCharacterAll();
		suspend();
	}
			
	// エフェクトテスト(Bodyやtalent)の生成 
	CreateEffectTest( gMotionEnable );
						
	local windowSample_ = WindowBase( 64, 608, 256, 64 );
	windowSample_.setWindowText( "Title Press X to Abort" );
	while( true ) {
		suspend();
		
		windowSample_.exec();
		windowSample_.draw();
		grahicsMouse();
		
		if (DebugPadIsTrigger(::PAD_X) || ihp.GetGameKeyboard().IsPush( 'X' ) )
		{
			break;
		}
	}

	DestroyEffectTest(); // エフェクトテスト(Bodyやtalent)の破棄 

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
	
	if( gMotionEnable )
	{
		// キャラの破棄 
		//CharaModelDestroy();
		//CharaBresDestroyRequest();
		//while ( false == CharaBresIsDestroyComplete() )
		//{
		//	suspend();
		//}
		DestroyCharacterAll();
		suspend();
	}

	debugMenuWakeup();
}
