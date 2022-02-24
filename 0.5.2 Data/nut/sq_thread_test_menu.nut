/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// デバッグメニューの表示スレッド.
//
//--------------------------------------------------------------

function debugMenuThreadStart() {
	if ( SQ_THREAD_STATE_RUNNING != GetThreasState( SQ_THREAD_DEBUGMENUN ) ) {
		RunScriptFunction( SQ_THREAD_DEBUGMENUN, "debugMenuThread" );
	}
	
	// フォーカスを許可し、フォーカスする 
	EnableForcusThreadId( SQ_THREAD_DEBUGMENUN, true );
	ChangeForcusThreadId( SQ_THREAD_DEBUGMENUN );
}

function debugMenuWakeup() {
	// フォーカスを許可し、フォーカスする 
	EnableForcusThreadId( SQ_THREAD_DEBUGMENUN, true );
	ChangeForcusThreadId( SQ_THREAD_DEBUGMENUN );
}

// スレッド.
function debugMenuThread() {

	local debug_menu = MenuPage();
	debug_menu.addMenu( 0, "Debug Menu" );
	local menu_index = 0;
	debug_menu.addItemScript( 0, menu_index++, "DemoP0",				"nut\\sq_demo_p0.nut",				"initDemoP0Thread" );
	debug_menu.addItemScript( 0, menu_index++, "HitViewer",				"nut\\sq_demo_p0.nut",				"initHitViewer" );
	debug_menu.addItemScript( 0, menu_index++, "EffectViewer",			"nut\\sq_thread_effect_test.nut",	"initEffectViewer" );
	debug_menu.addItemScript( 0, menu_index++, "MapViewer",				"nut\\sq_thread_map_viewer.nut",	"mapViewerStart" );
	debug_menu.addItemScript( 0, menu_index++, "ActionCommandViewer",	"nut\\sq_thread_actcmd_viewer.nut",	"ActionCommandViewerStart" );
	debug_menu.addItemScript( 0, menu_index++, "DemoCharacterViewer",	"nut\\sq_thread_demo_viewer.nut",	"DemoViewerStart" );
	debug_menu.addItemScript( 0, menu_index++, "GUIViewer",				"nut\\sq_thread_gui_viewer.nut",	"GUIViewerStart" );
	debug_menu.addItemScript( 0, menu_index++, "GimmickViewer",			"nut\\sq_thread_gimmick_viewer.nut","initGimmickViewer" );
	debug_menu.addItemScript( 0, menu_index++, "DemoP1",				"nut\\sq_demo_p1.nut",				"initDemoP1Thread" );
	debug_menu.addItemScript( 0, menu_index++, "Gemini",				"nut\\sq_gemini.nut",				"initRelaseGeminiThread" );
	debug_menu.addItemScript( 0, menu_index++, "NetworkMatchingTest",	"nut\\sq_thread_network_test.nut",	"initNetworkMatchingTest" );
	debug_menu.addItemScript( 0, menu_index++, "NetworkBattleTest",		"nut\\sq_thread_network_test.nut",	"initNetworkBattleTest" );
	debug_menu.addItemScript( 0, menu_index++, "SaveLoadTest",			"nut\\sq_thread_saveload_test.nut",	"initSaveLoadTest" );
	debug_menu.addItemScript( 0, menu_index++, "DemoCampaign",			"nut\\sq_demo_campaign.nut",		"initCampaignThread" );
//	debug_menu.addItemScript( 0, menu_index++, "DebugGameConfig",		"nut\\sq_test_game_config.nut",		"DebugGameConfigFromDebugMenu" );

	local demo_menu = MenuPage();
	demo_menu.addMenu( 0, "Demonstration Menu" );
	menu_index = 0;
	demo_menu.addItemScript( 0, menu_index++, "MenuSequence",		"nut\\sq_gemini.nut",				"initRelaseGeminiThread" );
//	demo_menu.addItemScript( 0, menu_index++, "SoloCampaign",		"nut\\sq_demo_campaign.nut",		"initCampaignThread" );
//	demo_menu.addItemScript( 0, menu_index++, "SoloTestPlay",		"nut\\sq_demo_p0.nut",				"initDemoP0Thread" );
	
	// フォーカスを許可し、フォーカスがある時のみスレッドが動くようにする 
	EnableForcusThreadId( SQ_THREAD_DEBUGMENUN, true );
	SetPatternThreadId( SQ_THREAD_DEBUGMENUN, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	
	while (true) {
		switch(DEBUG_MENU_MODE)
		{
		case 0:
			while(true) {
				if (DebugPadIsTrigger(::PAD_Y) || ihp.GetGameKeyboard().IsPush( 'Y' ) )
				{
					DEBUG_MENU_MODE = 1;
					suspend();
					break;
				}
			
				local selected = debug_menu.update();
				if (0<=selected) {
					// フォーカスを不許可にし、サスペンドする 
					EnableForcusThreadId( SQ_THREAD_DEBUGMENUN, false );
					suspend();
					break;
				}
				debug_menu.draw( 400, 32, 22 );
				grahicsMouse();
				suspend();
			}
			break;
		case 1:
			while(true) {
				if (DebugPadIsTrigger(::PAD_Y) || ihp.GetGameKeyboard().IsPush( 'Y' ) )
				{
					DEBUG_MENU_MODE = 0;
					suspend();
					break;
				}
			
				local selected = demo_menu.update();
				if (0<=selected) {
					// フォーカスを不許可にし、サスペンドする 
					EnableForcusThreadId( SQ_THREAD_DEBUGMENUN, false );
					suspend();
					break;
				}
				demo_menu.draw( 400, 32, 22 );
				grahicsMouse();
				suspend();
			}
			break;
		}
	}
}

