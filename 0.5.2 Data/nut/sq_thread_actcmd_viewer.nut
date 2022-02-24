/* XDASEA_Xm8R_SPsX */ 
//
//	ActionCommandViewerのシーケンス
//

function ActionCommandViewerStart()
{
	RunScriptFunction( SQ_THREAD_GAME, "startActionCommandViewerThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );
}

function startActionCommandViewerThread()
{
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
	suspend();
	
	// BOTのロード 
	JsonLoadBotAll();			// BOT設定
	suspend();
		
	// ActionFuncs [注 : JsonLoadPlayerAll()の後で実行]
	LoadActorFunction();
	suspend();
	
	// BodyやTalentの生成 
	// ここで3回ではなく、この中で3個bodyを作る 
	CreateActionCommandViewer(0, 0);
	CreateActionCommandViewer(1, 0);
	CreateActionCommandViewer(2, 0);

//	local windowSample_ = WindowBase( 64, 608, 256, 64 );
//	windowSample_.setWindowText( "Title Press BACK to Abort" );
	while(true)
	{
		suspend();

//		windowSample_.exec();
//		windowSample_.draw();
		grahicsMouse();

		if(DebugPadIsTrigger(::PAD_BACK) || ihp.GetGameKeyboard().IsPush( 'X' ) )
		{
			break;
		}
	}

	// BodyやTalentの破棄
	DestroyActionCommandViewer();
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
	DestroyCharacterAll();

	debugMenuWakeup();
}
