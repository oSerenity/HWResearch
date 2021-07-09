/* XDASEA_Xm8R_SPsX */ 
//
//	GimmickViewerのシーケンス
//

function initGimmickViewer() {
	RunScriptFunction( SQ_THREAD_GAME, "startGimmickViewerThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

function startGimmickViewerThread() {

	// ギミックロード 
	LoadGimmickAll();
	suspend();

	// GimmickViewer(Bodyやtalent)の生成 
	CreateGimmickViewer();
						
	local windowSample_ = WindowBase( 64, 608, 256, 64 );
	windowSample_.setWindowText( "Title Press BACK to Abort" );
	while( true ) {
		suspend();
		
		windowSample_.exec();
		windowSample_.draw();
		grahicsMouse();
		
		if (DebugPadIsTrigger(::PAD_BACK) || ihp.GetGameKeyboard().IsPush( 'X' ) )
		{
			break;
		}
	}

	DestroyGimmickViewer(); // Bodyやtalentの破棄 

	// ギミック破棄 
	DestroyGimmickAll();

	debugMenuWakeup();
}
