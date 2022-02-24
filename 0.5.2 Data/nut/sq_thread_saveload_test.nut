/* XDASEA_Xm8R_SPsX */ 
//
//	SaveLoadTestのシーケンス
//

function initSaveLoadTest() {
	RunScriptFunction( SQ_THREAD_GAME, "startSaveLoadThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

function startSaveLoadThread() {
	
	loadJsonResource();
	
	suspend();
	
	InitializeGameRule();	// ゲームルール
	InitializeSaveData();	// セーブデータ
	suspend();
	
	SaveLoadTool_Initialize();

	while( true ) {
		suspend();
		
		SaveLoadTool_Execute();
		SaveLoadTool_Draw();
		
		if( SaveLoadTool_IsExit() )
		{
			suspend();
			break;
		}
	}

	debugMenuWakeup();
}
