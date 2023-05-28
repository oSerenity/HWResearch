/* XDASEA_Xm8R_SPsX */
//
// SaveLoadTest Sequence
//

function initSaveLoadTest() {
	// Run the SaveLoadTest thread
	RunScriptFunction(SQ_THREAD_GAME, "startSaveLoadThread");
	SetPatternThreadId(SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS);
	ChangeForcusThreadId(-1); // Close the debug menu
}

function startSaveLoadThread() {
	
	loadJsonResource();
	
	suspend();
	
	InitializeGameRule(); // Initialize game rules
	InitializeSaveData(); // Initialize save data
	suspend();
	
	SaveLoadTool_Initialize();

	while (true) {
		suspend();
		
		SaveLoadTool_Execute();
		SaveLoadTool_Draw();
		
		if (SaveLoadTool_IsExit()) {
			suspend();
			break;
		}
	}

	debugMenuWakeup();
}
