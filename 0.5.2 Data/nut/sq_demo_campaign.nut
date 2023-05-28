/* XDASEA_Xm8R_SPsX */
//
// Campaign Sequence
//

function initCampaignThread() {
	// Run the campaign thread
	RunScriptFunction(SQ_THREAD_GAME, "startCampaignThread");
	SetPatternThreadId(SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS);
	ChangeForcusThreadId(-1); // Close the debug menu
}

function startCampaignThread() {
	// Activate the selector thread
	IncludeScriptFile("nut\\sq_thread_ini_selector.nut");
	RunScriptFunction(SQ_THREAD_INI_SELECTOR, "iniSelectorThread");
	EnableForcusThreadId(SQ_THREAD_INI_SELECTOR, true);

	// Run the demo campaign
	runDemoCampaign(0, SQ_THREAD_GAME, true);
}

function loadMissionScript() {
	// Load the mission script
	local campaign_name = GetRunningCampaignName();

	// Destroy the mission Bres resources
	MissionBresDestroyRequest();

	// Wait until the destruction is complete
	while (false == MissionBresIsDestroyComplete()) {
		suspend();
	}

	MissionBresLoadRequest(campaign_name);

	// Wait until the loading is complete
	while (false == MissionBresIsLoadComplete()) {
		suspend();
	}

	// Load the mission script file
	// local mission_name = GetRunningMissionName();
	// local mission_file_name = "campaign/default/" + campaign_name + "/" + mission_name + "/" + mission_name + ".nut";
	// IncludeScriptFile(mission_file_name);
}

function SetupDemo() {
	// Swap game resources with menu resources
	changeResourceForMenu();

	local startUpSceneIds = SetupMenu(SQ_THREAD_GAME);

	StartMenuBG();
}

function SetupViewerCampaignDemo() {
	// Start the campaign
	RequestCampaign();
	suspend();

	// Wait until the preparation is complete
	while (!IsRunningCampaign()) {
		suspend();
	}
	suspend();
}

function PlayStartDemo() {
	GeminiNowLoadingStart();
	while (!GeminiIsNowLoadingStart()) {
		suspend();
	}

	// Start the campaign demo
	StartOpeningCampaignDemo();

	RequestMenu(SQ_THREAD_GAME);
}

function PlayEndDemo() {
	if (IsRunningMissionSuccess()) {
		GeminiNowLoadingStop();
		while (!GeminiIsNowLoadingStop()) {
			suspend();
		}
		GeminiNowLoadingEnd();

		// Start the closing campaign demo
		StartClosingCampaignDemo();
	}

	ReleaseCampaignDemo();
}

function PlayGameDemo(mode, thread_id, is_debug_mode) {
	// Start the game
	// Swap menu resources with game resources
	changeResourceForGame();

	SetDispList(true);

	// Play the game
	ezGamePlay(mode, thread_id, is_debug_mode);

	GeminiNowLoadingPut(1);

	SetDispList(true);

	// Autosave
	if (IsGameResultFinished()) {
		ezSaveData(false, true);
	}
}

function runDemoCampaign(mode, thread_id, is_debug_mode) {
	GeminiNowLoadingStart();
	GeminiNowLoadingPut(0);

	ezBackgroundLoadAndConfig(thread_id, false, false, false);

	// Start the demo
	// Swap game resources with menu resources
	SetupDemo();

	local releaseFlags = (1 << SCENE_GROUP_MENU) | (1 << SCENE_GROUP_HUD) | (1 << SCENE_GROUP_MENUBG);

	// Loop
	while (true) {
		GeminiNowLoadingEnd();

		SetupViewerCampaignDemo();

		PlayStartDemo();

		GeminiNowLoadingPut(0);

		// Release scenes
		SceneManagerOrderRelaseSceneByGroup(releaseFlags);

		SceneManagerDelCurrentScene("menu_bg");

		// Synchronize resident resources
		loadResidentResourceThreadSync();

		PlayGameDemo(mode, thread_id, is_debug_mode);

		GraphicsCatalogDestroy();
		DestroyScaleformMenu(false);

		// Release scenes
		SceneManagerOrderRelaseSceneByGroup(releaseFlags);

		SetupDemo();

		PlayEndDemo();
	}
}
