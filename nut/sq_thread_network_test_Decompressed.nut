/* XDASEA_Xm8R_SPsX */ 

function initNetworkMatchingTest() {
	RunScriptFunction( SQ_THREAD_GAME, "startNetworkMatchingTestThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}


function startNetworkMatchingTestThread() {
	ezNetworkMainMenu( false );
	debugMenuWakeup();
}

function initNetworkBattleTest() {
	RunScriptFunction( SQ_THREAD_GAME, "startNetworkBattleTestThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}

function startNetworkBattleTestThread() {

	local create_player_mode = 2;		// 2:ネットワークモード 
	local thread_id = SQ_THREAD_GAME;
	local is_debug_mode = true;

	if (ezBackgroundLoadAndConfig( thread_id, true, true, true ))
	{
		buildSceneForGame();	
		
		// ループ 
		while (true)
		{
			// ゲームプレイ 
			ezGamePlay( create_player_mode, thread_id, is_debug_mode );

			// ネットワーク終了 
			ezNetworkEnd();
				
			// 次のコンフィギュレーション決定 
			ezDebugGameConfig( thread_id );
			
			// ネットワーク接続 
			if (false==ezNetworkMainMenu( true ))
			{
				break;
			}
	
			SceneManagerAddCurrentScene("go_game");
		}
	}

	debugMenuWakeup();
}

