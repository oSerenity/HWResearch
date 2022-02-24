/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// 初期化.
//
//--------------------------------------------------------------


// 初期化.
function initSystem() {
	// 最初から動かしたい予約スレッド.
	RunScriptFunction( SQ_THREAD_DEBUGFORCUSLIST,	"debugFocusListThread" );

	// デバッグメニューを常駐させる 
	IncludeScriptFile( "nut\\sq_thread_test_menu.nut" );
}

function debugMenuStart() {
	debugMenuThreadStart();
}

function startTrap() {

	if (0!=GAME_IS_RELEASE)
	{
		return "Gemini";
	}
	
	if (0!=GAME_IS_DEMO)
	{
		return "Gemini";
	}
	
	local trap_string = [
		[ "game",			function (arg) { return "Game"; } ],
		[ "menu",			function (arg) { return "Menu"; } ],
		[ "hitviewer",		function (arg) { return "HitViewer"; } ],
	]

	local arg = GetAppArgmentString().tolower();
	
	print( "AppArgment:" + arg + "\n" );

	foreach (trap in trap_string)
	{
		if (null != arg.find(trap[0]))
		{
			print("StartTrapArgment:" + trap[0] + "\n");
			return trap[1](arg);
		}
	}
	
	local username = getenv("USERNAME");
	if (null != username)
	{
		foreach (trap in trap_string)
		{
			if (username.tolower() == trap[0])
			{
				print("StartTrapUsername:" + trap[0] + "\n");
				return trap[1](arg);
			}
		}
	}

	print("StartTrap:none -> DebugMenu\n");
	// DEBUG_MENU_MODE = 0;	
	return "DebugMenu";
}

// ----
// 外部スクリプトから利用しているため、変更しないでください。 
GAME_PLAYER_MAX <- G_PLAYER_MAX;
GAME_LOCAL_HUMAN_PLAYER_MAX <- G_LOCAL_HUMAN_PLAYER_MAX;
GAME_LOCAL_PLAYER_MAX <- G_LOCAL_PLAYER_MAX;
GAME_LOCAL_SCREEN_MAX <- G_LOCAL_SCREEN_MAX;
GAME_LOCAL_PAD_MAX <- G_LOCAL_PAD_MAX;
GAME_TEAM_PLAYER_MAX <- G_TEAM_PLAYER_MAX;

GAME_START_PLAYER_NUM <- G_START_PLAYER_NUM;
GAME_START_TEAM_PLAYER_NUM <- G_START_TEAM_PLAYER_NUM;

POWER_COLOR_BLACK <- 0;
POWER_COLOR_WHITE <- 1;
POWER_COLOR_UNKNOWN <- 2;

RULE_BUILDING_STATE_COMPLETE	<- 0;		// 完成
RULE_BUILDING_STATE_MATERIALS	<- 1;		// 資材置き場 
RULE_BUILDING_STATE_BROKEN		<- 2;		// 破壊（看板）

GAME_IS_DEMO <- SQ_IS_DEMO
GAME_IS_RELEASE <- SQ_IS_RELEASE
DEBUG_MENU_MODE <- SQ_IS_DEMO;

// 外部スクリプトから利用しているため、変更しないでください。 
// ----


// 共通パーツを色々インクルード.
IncludeScriptFile( "nut\\sq_window.nut" );
IncludeScriptFile( "nut\\sq_test_menu.nut" );
IncludeScriptFile( "nut\\sq_thread_test_focus_list.nut" );
IncludeScriptFile( "nut\\sq_util.nut" );
IncludeScriptFile( "nut\\sq_gemini.nut" );

IncludeScriptFile( "nut\\all_sq_lib.nut" );

// Jsonの設定をロード 
IncludeScriptFile( "json\\jsonFileList.nut" );

// グローバルを色々.
ihp <- ih.GetInterface();

initSystem();

// 起動 
switch( startTrap() )
{
case "Demo":
	// メニューを含む流れのテスト
	IncludeScriptFile( "nut\\sq_demo_p1.nut" );
	initDemoP1Thread();
	break;
case "HitViewer":
	// HitViewer
	IncludeScriptFile( "nut\\sq_demo_p0.nut" );
	initHitViewer();
	break;
case "DebugMenu":
	// デバッグメニュー 
	debugMenuStart();
	break;
case "Menu":
	// メニューを含む流れのテスト
	IncludeScriptFile( "nut\\sq_demo_p1.nut" );
	initDemoP1Thread();
	break;
case "EffectViewer":
	// EffectViewer
	IncludeScriptFile( "nut\\sq_thread_effect_test.nut" );
	print("EffectViewer\n");
	initEffectViewer();
	break;
case "MapViewer":
	// MapViewer
	IncludeScriptFile( "nut\\sq_thread_map_viewer.nut" );
	mapViewerStart();
	break;
case "ActionCommandViewer":
	// ActionCommandViewer
	IncludeScriptFile( "nut\\sq_thread_actcmd_viewer.nut" );
	ActionCommandViewerStart();
	break;
case "GUIViewer":
	// GUIViewer
	IncludeScriptFile( "nut\\sq_thread_gui_viewer.nut" );
	GUIViewerStart();
	break;	
case "SaveLoadTest":
	// SaveLoadTest
	IncludeScriptFile( "nut\\sq_thread_saveload_test.nut" );
	initSaveLoadTest();
	break;
case "Gemini":
	// IncludeScriptFile( "nut\\sq_gemini.nut" );
	initRelaseGeminiThread();
	break;
case "Game":
default:
	// ゲームの起動 
	IncludeScriptFile( "nut\\sq_demo_p0.nut" );
	initDemoP0Thread();
	break;
}

//-----------------------------------------------------------------------------
// 初期化/生成/消滅のためのサブルーチン 

gFlagLoadResidentResource <- false;
gFlagLoadGameResource <- false;
gFlagLoadJsonResource <- false;

//	常駐リソースロード 
function loadResidentResource() {
	if (false == gFlagLoadResidentResource) {
		gFlagLoadResidentResource = true;
		// リソース 
		LoadScaleformCommon();	// スケールフォーム常駐

		loadJsonResource();		// JSON 
		
		// Script
		IncludeScriptFile( "nut\\sq_test_game_config.nut" );	// ゲームコンフィグ
		
		// 初期化
		InitializeGameRule();	// ゲームルール
		InitializeSaveData();	// セーブデータ
		InitializeGameAudio();	// ゲームオーディオ
	}
}

//	ゲーム用リソースロード
function loadGameResource() {
	if (false == gFlagLoadGameResource) {
		gFlagLoadGameResource = true;
		LoadCharacterAll();		// キャラクター
		// LoadGimmickAll();		// ギミック
		LoadGfxAll();			// エフェクト
		LoadActorFunction();	// ActionFuncs [注 : JsonLoadPlayerAll()の後で実行]
	}
	SetKeyCustomize();
	LoadScaleformHUD();		// HUD
}

// JSON 
function loadJsonResource() {
	if (false == gFlagLoadJsonResource)
	{
		gFlagLoadJsonResource = true;
		
		JsonLoadMenuParam();		// Menu
		JsonLoadGameAll();			// ゲーム全般
		JsonLoadItemAll();			// ItemJson
		JsonLoadCampaignAll();		// キャンペーン 
		JsonLoadCoopAll();			// COOP
		JsonLoadQuestAll();			// クエスト
		JsonLoadMedalRankAll();		// 勲章・ランク
		JsonLoadAchievementAll();	// アチーブメント
		JsonLoadStageAll();			// ステージ情報
		JsonLoadAudioAll();			// オーディオ
		JsonLoadPlayerAll();		// プレイヤ
		JsonLoadDocsAll();			// ドキュメント
		JsonLoadLobbyAll();			// ロビー設定
		JsonLoadTrialAll();			// トライアル版設定
		JsonLoadBotAll();			// BOT設定
		JsonLoadContentsAll();		// コンテンツ
		JsonLoadGimmickAll();		// ギミック 
	}
}

function releaseGameResource() {
	if (false == gFlagLoadGameResource) {
		ReleaseScaleformHUD();
		gFlagLoadGameResource = false;
	}
}


//-----------------------------------------------------------------------------
// 簡易ゲーム実行のためのサブルーチン 
function ezDebugGameConfig( thread_id )
{
	GeminiNowLoadingStart();
	GeminiNowLoadingPut(0);
	
	DebugGameConfig( thread_id );
}

gLoadComplete <- false;

function ezBackgroundLoadAndConfig( thread_id, network_enable, network_signin_and_entried, run_config )
{
	// 落ち着かせる  
	suspend();

	// 常駐リソース 
	loadResidentResource();

	// 裏読み loadResidentResource() & loadGameResource();
	gLoadComplete = false;
	RunScriptFunction( SQ_THREAD_LOADER, "ezBackgroundLoadSub" );
	SetPatternThreadId( SQ_THREAD_LOADER, SQ_THREAD_PATTERN_ALWAYS );

	if( run_config )
	{
		// GameConfig作成 
		ezDebugGameConfig( thread_id );
	}

	local result = true;
	if (network_enable)
	{
		// ネットワークメニュー 
		result = ezNetworkMainMenu( network_signin_and_entried );
	}
	
	// wait for resource ready
	while (gLoadComplete==false)
	{
		suspend();
	}
	
	return result;
}

function ezBackgroundLoadSub()
{
	// ゲームリソース 
	loadGameResource();
	
	// 終了 
	gLoadComplete = true;
}

function ezNetworkMainMenu( only_entry ) {
	// シードからSignIn状態を取り出す 
	local game_seed = GameSeed();
	game_seed.popSeed( 0 );
	local signin_mask = game_seed.getEntryAndSignInLocalPlayerMask( only_entry );

	local menu = MenuPage();
	menu.addMenu( 0, "Network Matching" );
	
	if (signin_mask & 0xf) {
		// ログインしているユーザーが居る 
		menu.addItem( 0, 0, "Search Host" );
		menu.addItem( 0, 1, "Create Host [VsMode:WithBot]" );
		menu.addItem( 0, 2, "Create Host [VsMode:WithoutBot]" );
		menu.addItem( 0, 3, "Create Host [TeamMode:WithBot]" );
		menu.addItem( 0, 4, "Create Host [TeamMode:WithoutBot]" );
		menu.addItem( 0, 5, "Quit" );
		
		NetworkStart();
		
		local result = false;
		
		while( true ) {
			local selected = menu.update();
			menu.draw( 400, 32, 22 );
			suspend();
			if (selected<0)
			{
				continue;
			}

			if (5==selected)
			{
				break;
			}

			IncludeScriptFile("nut\\sq_net_test.nut");
			
			switch(selected)
			{
			case 0:
				result = NetTestSearchHost( signin_mask );
				break;
			case 1:
				result = NetTestCreateHost( signin_mask, 0 );
				break;
			case 2:
				result = NetTestCreateHost( signin_mask, 2 );
				break;
			case 3:
				result = NetTestCreateHost( signin_mask, 1 );
				break;
			case 4:
				result = NetTestCreateHost( signin_mask, 3 );
				break;
			}
			
			if (result) {
				break;
			}
			
			NetworkCancelToRoot();
		}
		
		if (result==false) {
			NetworkEnd();
		}
		
		return result;
	} else {
		// 誰もログインしていない 
		menu.addItem( 0, 0, "Quit" );
		menu.addItem( 0, 1, "Please SignIn or Check Human Input Pad Setting" );
		while( true ) {
			local selected = menu.update();
			menu.draw( 400, 32, 22 );
			suspend();
			if (0==selected)
			{
				return false;
			}
		}
	}
}

function ezNetworkEnd() {
	NetworkCancelToRoot();
	NetworkEnd();
}

function ezGamePlay( create_player_mode, thread_id, debug_mode )
{
	StartCapture();

	// ルール作成 
	CreateGameRule(0);
	
	// ゲームシード用意 
	local game_seed = GameSeed();
	game_seed.popSeed(0);
	
	// シードから
	LoadStageFromSeed( game_seed.getStageSeed() );
	
	// レイヤー設定
	SetupLayerForGamePlay();

	// ステージ固有ルールの設定
	game_seed.popSeed(0);
	GameStageRuleSetting( game_seed.getStageSeed(), game_seed.getGameRuleSeed() );
	game_seed.pushSeed(0);
	
	// ジャッジメントの生成
	CreateGameJudgement(0);
	
	// HUD作成 
	HudInitialize();

	CreateScaleformHUD();

	// ゲームセッティング開始  
	GameSettingStart();
	
	// ゲームフィールド作成待ち 
	for (local i=0; i<8; ++i) {
		suspend();
	}
	
	// ゲームセッティング完了 
	GameSettingComplete();
	
	// BGM再生
	local bgm_no = game_seed.getStageSeed().getStageBgm();
	PlayBgmForce( bgm_no, 1.0 );

	// Stage配置SE再生 
	StagePlaySe();

	for (local i=0; i<4; ++i) {
		suspend();
	}

	//今はC++側でtrueにしているのでコメント化
	//SetHudPlayStatus(true);

	InitialPlayerParam(); // プレイヤー配置前に実行 

	// プレイヤー作成＆配置 ;
	switch( create_player_mode ) {
	case 0:	CreatePlayerAll(0);			break;
	case 1:	CreateDebugPlayerAll(0);	break;
	case 2: CreateNetworkPlayerAll(0);	break;
	}
	
	// プレイヤー配置完了 
	GamePlayerCreateComplete();

	// 中断メニュー待機 
	ezGamePlayAbort( thread_id, debug_mode );

	SetHudPlayStatus(false);

	// ステージSE停止 
	StageStopSe();
	
	// キャンペーンの終了
	ReleaseCampaignDemo();

	// ゲームルール削除準備
	NotifyGameRuleDestroy();

	// プレイヤー消去 
	DestroyPlayerAll();
	
	// HUD削除 
	DestroyScaleformHUD();
	
	// レイヤー設定
	SetupLayerForMenu();

	// ステージ消去 
	DestroyStage();
	
	// ルール削除 
	DestroyGameRule(0);

	EndCapture();
}

function ezGamePlayAbort( thread_id, debug_mode ) {

	// ゲーム終了か、開始まで待つ 
	ezWaitAtGameStart();

	EnableForcusThreadId( thread_id, true );
	// SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );

	local abort_check = true;
	while( true ) {
		suspend();

		// Jsonの強制更新をするか？  
		if (debug_mode) {
			JsonDebugForcePushParam();
		}
		
		// ゲームが終わったら勝手に抜ける 
		if (GAME_STATE_ENDED<=GetGamePlayingStatus()) {
			break;
		}
		
		if (false==OnForcusThreadId(thread_id)) {
			continue;
		}
		
		if (abort_check) {
			if(DebugPadIsTrigger(::PAD_X) || ihp.GetGameKeyboard().IsPush( 'X' )) {
				abort_check = false;
				SetGameEndStatus(GAME_END_MYSELF);
				SE_Ok();
			}
		}
			
		grahicsMouse();
	}
	
	// SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_ALWAYS );
	EnableForcusThreadId( thread_id, false );
	// ChangeForcusThreadId( -1 );

	CloseDialog();

	ResetHeroPopup();
	
	suspend();
}

function ezWaitAtGameStart() {

	while( true ) {
		suspend();
			
		if (GAME_STATE_ENDED<=GetGamePlayingStatus()) {
			break;
		}
		
		if (GAME_STATE_PLAYING==GetGamePlayingStatus()) {
			break;
		}
	}

	suspend();
}

// サインインしているユーザーのセーブデータをロードしてみる
function ezLoadData( is_load_system, is_load_game ) {
	for (local i=0; i<GAME_LOCAL_PAD_MAX; ++i) {
		if(IsUserSignIn(i)) {
			if(is_load_system) {
				for (local j=0; j<10; ++j) {
					suspend();
				}
				LoadSystemData(i);
				suspend();
				while(IsSaveLoadActive()) {
					DrawSystemDataReading(i);
					suspend();
				}
			}
			if(is_load_game) {
				for (local j=0; j<10; ++j) {
					suspend();
				}
				LoadGameData( i );
				suspend();
				while( IsSaveLoadActive() ) {
					DrawGameDataReading(i);
					suspend();
				}
			}
		}
	}
}
// サインインしているユーザーのセーブデータをセーブしてみる
function ezSaveData( is_save_system, is_save_game ) {
	for (local i=0; i<GAME_LOCAL_PAD_MAX; ++i) {
		if(IsUserSignIn(i)) {
			if(is_save_system) {
				for (local j=0; j<10; ++j) {
					suspend();
				}
				SaveSystemData(i);
				suspend();
				while(IsSaveLoadActive()) {
					DrawSystemDataWriting(i);
					suspend();
				}
			}
			if(is_save_game) {
				for (local j=0; j<10; ++j) {
					suspend();
				}
				SaveGameData( i );
				suspend();
				while( IsSaveLoadActive() ) {
					DrawGameDataWriting(i);
					suspend();
				}
			}
		}
	}
}
