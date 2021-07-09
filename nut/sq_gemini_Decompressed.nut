/* XDASEA_Xm8R_SPsX */ 
//
//	メニューを含めた画面遷移のシーケンス
//

//-----------------------------------------------------------------------------
//	グローバル変数 

gGeminiDebugMode <- false;

gameResourceOnMemory <- false;
menuResourceOnMemory <- false; //bresの管理が出来たら要修正(?)
menuResourceOnMemory1 <- false; //bresの管理が出来たら要修正(?)
menuResourceOnMemory2 <- false; //bresの管理が出来たら要修正(?)
menuResourceOnMemory3 <- false; //bresの管理が出来たら要修正(?)
menuResourceOnMemory4 <- false; //bresの管理が出来たら要修正(?)
menuResourceOnMemory5 <- false; //bresの管理が出来たら要修正(?)

//gScaleformGameMode <- "title_demo"
gScaleformGameMode <- "menu"
//gScaleformGameMode <- "game"
//gScaleformGameMode <- "campaign"

subMenuMode <- 0;
fromSceneName <- "";
nextSceneName <- "";


MA_MAINMENU			<- 0;
SB_STAFFROLL		<- 2;
SB_ITEMSPNNER		<- 3;
SB_DLCMENU			<- 4;
SB_HAPPYBOX			<- 5;
SB_HAPPYBOX_LMT		<- 6;
SB_CROSSPLATFORM	<- 7;













GAME_PLAYING_MULTIPLAY	<- 0;	// 通常のマルチプレイ 
GAME_PLAYING_TUTORIAL	<- 1;	// シングルのチュートリアル 
GAME_PLAYING_CAMPAIGN	<- 2;	// シングル/マルチのキャンペーン 
GAME_PLAYING_DEMO       <- 3;   // お試し版



//-----------------------------------------------------------------------------
//	初期化

function initRelaseGeminiThread() {
	
	RunScriptFunction( SQ_THREAD_GAME, "startRelaseGeminiThread" );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );		// デバッグメニューを閉じる 
}


function startRelaseGeminiThread() {
	runMainLoop();
}


//-----------------------------------------------------------------------------
// 各モードの初期化

// menu
function SetupMenu( thread_id )
{
	DebugConsoleOff();

	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	// メニュー(menu.sgfx)の作成
	CreateScaleformMenu();

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu();
	return startUpSceneIds;
}

function changeResourceForMenu()
{
	if( gameResourceOnMemory )
	{
		releaseGameResource();
		// SceneManagerAllClose();
		
		DestroyScaleformMenu(true);
		//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD) | (1<<SCENE_GROUP_MENUBG);
		//SceneManagerOrderRelaseSceneByGroup(releaseFlags);

		gameResourceOnMemory = false;
	}

	//	メニュー用リソースのロード
	if( !menuResourceOnMemory )
	{
		loadMenu();
		menuResourceOnMemory = true;
	}
	else
	{
		SceneManagerInitialize();
	}
}

function changeResourceForGame()
{
	//	メニューリソースの開放
	if( menuResourceOnMemory )
	{
		releaseMenu();
		menuResourceOnMemory = false;
	}
	
	if( !gameResourceOnMemory )
	{
		loadGameResource();
		buildSceneForGame();
		gameResourceOnMemory = true;
	}
}

// UI_menu & UI_menu2
function SetupMenu1( thread_id )
{
	DebugConsoleOff();

	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	// メニュー(menu.sgfx)の作成
	CreateScaleformMenu();

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu1();
	
	return startUpSceneIds;
}

function changeResourceForMenu1()
{
	if( gameResourceOnMemory )
	{
		releaseGameResource();
		DestroyScaleformMenu(false);

		//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
		//SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		gameResourceOnMemory = false;
	}
	
	if( menuResourceOnMemory2 )
	{
		releaseMenu2();
		DestroyScaleformMenu(false);

		//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
		//SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		menuResourceOnMemory2 = false;
	}
	
	if( menuResourceOnMemory3 )
	{
		releaseMenu3();
		DestroyScaleformMenu(false);

		//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
		//SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		menuResourceOnMemory3 = false;
	}
	
	if( menuResourceOnMemory4 )
	{
		releaseMenu4();
		DestroyScaleformMenu(false);

		//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
		//SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		menuResourceOnMemory4 = false;
	}

	if( menuResourceOnMemory5 )
	{
		releaseMenu5();
		DestroyScaleformMenu(false);

		//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
		//SceneManagerOrderRelaseSceneByGroup(releaseFlags);
		menuResourceOnMemory5 = false;
	}

	//	メニュー用リソースのロード
	if( !menuResourceOnMemory1 )
	{
		loadMenu1();
		menuResourceOnMemory1 = true;
	}
	else
	{
		SceneManagerInitialize();
	}
}

function changeResourceForGame1()
{
	//	メニューリソースの開放
	if( menuResourceOnMemory1 )
	{
		releaseMenu1();
		menuResourceOnMemory1 = false;
	}
	
	if( !gameResourceOnMemory )
	{
		loadGameResource();



		buildSceneForGame();
		gameResourceOnMemory = true;
	}
}

// UI_StaffRoll
function SetupMenu2( thread_id )
{
	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	// メニュー(menu.sgfx)の作成
	CreateScaleformMenu();

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu2();
	
	return startUpSceneIds;
}

// UI_spinner
function SetupMenu3( thread_id )
{
	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	// メニュー(menu.sgfx)の作成
	CreateScaleformMenu();

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu3();
	return startUpSceneIds;
}

// UI_dlc
function SetupMenu4( thread_id )
{
	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	// メニュー(menu.sgfx)の作成
	CreateScaleformMenu();

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu4();
	return startUpSceneIds;
}

function SetupMenu5( thread_id )
{
	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );

	// メニュー(menu.sgfx)の作成
	CreateScaleformMenu();

	// メニュー用のレイヤー設定
	SetupLayerForMenu();
	
	// シーンを組み立てる(引数わたしでも参照わたしてることになるので大丈夫だが、まあチュートリア的な意味で
	local startUpSceneIds = clone buildSceneForMenu5();
	return startUpSceneIds;
}

function changeResourceForMenu2()
{
	if( menuResourceOnMemory1 )
	{
		releaseMenu1WithOutBG();
		menuResourceOnMemory1 = false;
	}

	//	メニュー用リソースのロード
	if( !menuResourceOnMemory2 )
	{
		loadMenu2();
		menuResourceOnMemory2 = true;
	}
	else
	{
		SceneManagerInitialize();
	}
}

function changeResourceForMenu3()
{
	if( menuResourceOnMemory1 )
	{
		releaseMenu1WithOutBG();
		menuResourceOnMemory1 = false;
	}

	//	メニュー用リソースのロード
	if( !menuResourceOnMemory3 )
	{
		loadMenu3();
		menuResourceOnMemory3 = true;
	}
	else
	{
		SceneManagerInitialize();
	}
}

function changeResourceForMenu4()
{
	if( menuResourceOnMemory1 )
	{
		releaseMenu1WithOutBG();
		menuResourceOnMemory1 = false;
	}

	//	メニュー用リソースのロード
	if( !menuResourceOnMemory4 )
	{
		loadMenu4();
		menuResourceOnMemory4 = true;
	}
	else
	{
		SceneManagerInitialize();
	}
}


function changeResourceForMenu5()
{
	if( menuResourceOnMemory1 )
	{
		releaseMenu1WithOutBG();
		menuResourceOnMemory1 = false;
	}

	//	メニュー用リソースのロード
	if( !menuResourceOnMemory5 )
	{
		loadMenu5();
		menuResourceOnMemory5 = true;
	}
	else
	{
		SceneManagerInitialize();
	}
}















function RequestMenu( thread_id )
{
	EnableForcusThreadId( thread_id, false );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );
	suspend();
}

// demo
function SetupCampaignDemo()
{
	// キャンペーンの開始
	RequestCampaign();

	local campaignName = GetSelectedCampaignName();
	SetRunningCampaignName(campaignName);

	local missionName = GetSelectedMissionName();
	SetRunningMissionName(missionName);

	suspend();

	// 準備完了待ち
	while( !IsRunningCampaign() )
	{
		suspend();
	}
	suspend();
}

function ReleaseCampaignDemo()
{
	ReleaseCampaign();
}

//-----------------------------------------------------------------------------
// データの交換


//-----------------------------------------------------------------------------
// Menu

function StartMenuBG()
{
	SceneManagerAddCurrentScene("menu_bg");
}

function StartMenuDemo()
{
	//SceneManagerAddCurrentScene("sc_nameBalloon");
	SceneManagerAddCurrentScene("go_demo");
}

function StartMenuScene(from, scene, player, label, args)
{
	// シーンを開始
	SceneManagerChangeCurrentScene(from, scene, player, label, args);
}

function StartMenuSceneList(startUpSceneIds)
{
	foreach(id in startUpSceneIds)
	{
		SceneManagerAddCurrentScene(id);
	}
}

function PlayMenu()
{
	while( true )
	{
		suspend();
		grahicsMouse();
	
		local sceneName = SceneManagerGetSceneName();

		if(sceneName=="go_game")
		{
			GenerateGameModeChangeStamp();
			gScaleformGameMode = "game";
			break;
		}
		else if(sceneName=="go_campaign")
		{
			GenerateGameModeChangeStamp();
			gScaleformGameMode = "campaign";
			break;
		}

		local notFindScene = SceneManagerNotFindCurrent();
		if(notFindScene!="")
		{
			//if(SceneManagerIsCloseCurrentScene(sceneName))// 終了処理中
			if(SceneManagerIsClosedCurrentScene(sceneName))// 完全に終了した場合
			{
				if(notFindScene=="staffroll")
				{
					gScaleformGameMode = "subMenu";
					subMenuMode = SB_STAFFROLL;
					fromSceneName = sceneName;
					nextSceneName = notFindScene;
					break;
				}
				if(notFindScene=="sc_itemspinner")
				{
					gScaleformGameMode = "subMenu";
					subMenuMode = SB_ITEMSPNNER;
					fromSceneName = sceneName;
					nextSceneName = notFindScene;
					break;
				}
				if(notFindScene=="sc_happybox")
				{
					gScaleformGameMode = "subMenu";
					subMenuMode = SB_HAPPYBOX;
					fromSceneName = sceneName;
					nextSceneName = notFindScene;
					break;
				}
				if(notFindScene=="sc_happybox_lmt")
				{
					gScaleformGameMode = "subMenu";
					subMenuMode = SB_HAPPYBOX_LMT;
					fromSceneName = sceneName;

					//nextSceneName = notFindScene;
					nextSceneName = "sc_happybox";
					break;
				}
				if(notFindScene=="sc_dlcmenu")
				{
					gScaleformGameMode = "subMenu";
					subMenuMode = SB_DLCMENU;

					// 読み直し処理　キャラカスタマイズからDLC購入画面へ移動する時に
					// カレントのsceneとなるのは"CharacterMaking"と"Mannequin"の２つ
					// "Mannequin"は他の画面でも利用されているので、その他の画面へ
					// 戻る必要がある場合は更に工夫する必要がある。

					if(sceneName=="Mannequin")
						fromSceneName = "CharacterMaking";
					else
						fromSceneName = sceneName;

					nextSceneName = notFindScene;
					break;
				}
				if(notFindScene=="crossPlatform")
				{
					gScaleformGameMode = "subMenu";
					subMenuMode = SB_CROSSPLATFORM;
					fromSceneName = sceneName;
					nextSceneName = notFindScene;
					break;
				}
			}
		}
	}
	
	suspend();
}

//-----------------------------------------------------------------------------
// Demo

function PlayDemo( isOpenDemo )
{
	if(!isOpenDemo)
		return ;

	InitMoviePlayerCache();

	// BGM再生
	//local bgm_no = game_seed.getStageSeed().getStageBgm();
	//PlayBgmForce( bgm_no, 1.0 );

	SetHudPlayStatus(true);

	SceneManagerAddScene("go_demo", SCENE_GROUP_HUD);
	StartMenuDemo();

	GeminiNowLoadingEnd();

	for(;;)
	{
		suspend();
		grahicsMouse();

		if(IsDemoEnd())
		{
			break;
		}
		else if (isSkipDemo())
		{
			stopBGM();
			break;
		}
	}

	resetDrawDialog();
	if(IsExistUserSignOutHistory())
	{
		enablePause(true);
		suspend();

		while(isDrawDialog())
		{
			drawDialog("SignOutHistroy");
			suspend();
		}

		resetDrawDialog();
	}

	local cf = 0;

	SetHudPlayStatus(false);

	GeminiNowLoadingStart();
	while(!GeminiIsNowLoadingStart())
	{
		++cf;
		suspend();
	}

	while (true)
	{
		++cf;
		suspend();

		if(SceneManagerDeleteScene("go_demo")!=0)
			break;
	}

	suspend();

	for(local i=cf;i<30;++i) {
		suspend();
	}

	enablePause(false);
}



function StartOpeningCampaignDemo()
{
	// demoが有れば再生する。
	local demoName = GetRunningMissionStartDemoID();

	if(demoName==null)
		return ;

	local isOpenDemo = CreateDemo(demoName); // DemoCharacterManagerをクリエイト 
	
	PlayDemo( isOpenDemo );
	
	// BodyやTalentの破棄
	DestroyDemoCharacter();
}

function StartClosingCampaignDemo()
{
	// demoが有れば再生する。
	local demoName = GetRunningMissionEndDemoID();

	if(demoName==null)
		return ;

	local isOpenDemo = CreateDemo(demoName); // DemoCharacterManagerをクリエイト 
	
	PlayDemo( isOpenDemo );
	
	// BodyやTalentの破棄
	DestroyDemoCharacter();
}


//-----------------------------------------------------------------------------
//	メニュー用リソースロード
function loadMenu()
{
	LoadScaleformMenu();
}

function loadMenu1()
{
	LoadScaleformMenu1();
}

function loadMenu2()
{
	LoadScaleformMenu2();
}

function loadMenu3()
{
	LoadScaleformMenu3();
}

function loadMenu4()
{
	LoadScaleformMenu4();
}

function loadMenu5()
{
	LoadScaleformMenu5();
}


function releaseMenu()
{
	ReleaseScaleformMenu(true);
}

function releaseMenu1WithOutBG()
{
	ReleaseScaleformMenu1(false);
}

function releaseMenu1()
{
	ReleaseScaleformMenu1(true);
}

function releaseMenu2()
{
	ReleaseScaleformMenu2(false);
}

function releaseMenu3()
{
	ReleaseScaleformMenu3(false);
}

function releaseMenu4()
{
	ReleaseScaleformMenu4(false);
}

function releaseMenu5()
{
	ReleaseScaleformMenu5(false);
}


//-----------------------------------------------------------------------------
//	キャンペーン用リソースロード
function loadMissionScript() {
	// ミッションスクリプトのロード
	local campaign_name = GetRunningCampaignName();
	
	// とりあえず破棄
	MissionBresDestroyRequest();
	// 破棄待ち
	while ( false == MissionBresIsDestroyComplete() )
	{
		suspend();
	}
	
	MissionBresLoadRequest( campaign_name );
	// ロード終了待ち
	while ( false == MissionBresIsLoadComplete() )
	{
		suspend();
	}
	
//	local mission_name = GetRunningMissionName();
//	local mission_file_name = "campaign/default/" + campaign_name + "/" + mission_name + "/" + mission_name + ".nut";
//	IncludeScriptFile( mission_file_name );
}

//-----------------------------------------------------------------------------
//	データ裏読みのためのスレッド 
gFlagLoadResidentResourceComplete <- false;

function RequestFirstLoad()
{
	// 明示的に先読み 
	// LoadScaleformCommon();

	RequestLoadScaleformCommon();
	RequestSetupScaleformLanguage();

	RequestLoadScaleformHUD();

	LoadScaleformMenuBG();
	LoadScaleformMenuMain();
	
	gFlagLoadScaleformCommon = true;
	gFlagLoadScaleformMenu = true;
	IsDaneLoadScaleformHUD = true;

	//GeminiNowLoadingStart();
	//GeminiNowLoadingPut(1);



	// 裏読み開始 
	RunScriptFunction( SQ_THREAD_LOADER, "loadResidentResourceProc" );
	SetPatternThreadId( SQ_THREAD_LOADER, SQ_THREAD_PATTERN_ALWAYS );
}


function loadResidentResourceThreadStart()
{
	WaitLoadScaleformCommon();
	WaitSetupScaleformLanguage();
	ScaleformLoadHUDJson();
	SetKeyCustomize();
	buildSceneForCommon();
	SetupLayerForMenu();

	WaitLoadScaleformMenuBress();

	gFlagLoadResidentResourceComplete = false;
}

function loadResidentResourceThreadSync()
{
	// SetNowLoadingVisibleOperation(true);
	
	if (true==gFlagLoadResidentResourceComplete) {
		while (gFlagLoadResidentResourceComplete==false) {
			suspend();
		}
		for (local i=0; i<30; ++i) {
			suspend();
		}
	}
}

function loadResidentResourceProc()
{
	// 常駐リソース 
	loadResidentResource();
	// ゲームリソース 
	loadGameResource();
	// 読み込み完了 
	gFlagLoadResidentResourceComplete = true;
}

//-----------------------------------------------------------------------------
//	メインループ
function runMainLoop() {

	
	// メニューモードは強制的にONになる 
	SetPlayBgm(true);
	SetPadVibration(true);

	local preMode = "";
	local nextMode = gScaleformGameMode;
	local from = "";
	local next = "";
	local player = "";
	local label = "";
	local args = "";
	local wait_frame = 0;

	////	ロゴ 
	//for (local logo_stage=0; logo_stage<5; ++logo_stage)
	for (local logo_stage=0; logo_stage<5; )
	{
		if(SetLogoStage(logo_stage)){
			logo_stage++;
		}
		// 最初から裏読みを開始すると、ロゴの間にブラックアウト時間が生じるので、
		// 表示後にずらす（重い処理でブロックされている模様）
		if(logo_stage >= 1){
			wait_frame++;
			if(wait_frame == 5)
				RequestFirstLoad();
		}

		suspend();
	}

	////	常駐リソースのロード
	loadResidentResourceThreadStart();

	//	メインループ
	while (true)
	{
		suspend();

		switch( nextMode )
		{
		case "campaign":
			{
				clearCustomLog();

				// メニューのリソースとゲームのリソースを入れ替え
				//changeResourceForGame();
				changeResourceForGame1();

				SetDispList(true);

				// ゲームプレイ 
				ezGamePlay( 0, SQ_THREAD_GAME, true );
				
				SetDispList(true);

				// シーンを解放する。
				DestroyScaleformMenu(true);
				//local releaseFlags = (1<<SCENE_GROUP_MENU)|(1<<SCENE_GROUP_HUD)|(1<<SCENE_GROUP_MENUBG);
				//SceneManagerOrderRelaseSceneByGroup(releaseFlags);

				// オートセーブ
				if( IsGameResultFinished() ) {
					ezSaveData( false, true );
				}

				gScaleformGameMode = "menu";

				from = "";
				if(HasNextSceneForMenu())
				{
					//GetScene();

					next = GetNextSceneForMenu();
					player = GetNextMoviePlayerForMenu();
					label = GetNextLabelForMenu();
					args = GetNextArgsForMenu();
				}
			}
			break;
		//ゲームシーン
		case "game":
			{
				clearCustomLog();

				// メニューのリソースとゲームのリソースを入れ替え
				//changeResourceForGame();
				changeResourceForGame1();

				//	ゲーム実行
				ezGamePlay(2, SQ_THREAD_GAME, true );

				// シーンを解放する。
				DestroyScaleformMenu(true);
				//local releaseFlags = (1<<SCENE_GROUP_MENU)|(1<<SCENE_GROUP_HUD)|(1<<SCENE_GROUP_MENUBG);
				//SceneManagerOrderRelaseSceneByGroup(releaseFlags);

				gScaleformGameMode = "menu";
				
				from = "";
				if(HasNextSceneForMenu())
				{
					//GetScene();
					next = GetNextSceneForMenu();
					player = GetNextMoviePlayerForMenu();
					label = GetNextLabelForMenu();
					args = GetNextArgsForMenu();
				}
			} break;

		//メニューシーン
		// UI_menu & UI_menu2 & UI_StaffRoll
		case "menu":
			{
				// ゲームのリソースとメニューのリソースを入れ替える

				if(subMenuMode==SB_CROSSPLATFORM)
				{
					SetupLanguageForFont(true);
					while(!IsEndSetupLanguageForFont())
					{
						suspend();
					}
				}

				// UI_menu & UI_menu2
				changeResourceForMenu1();

				local startUpSceneIds = SetupMenu1( SQ_THREAD_GAME );

				// フェードがかかった状態なら 
				if (!GeminiIsNowLoadingEnd()) {
					// NowLoadingをフェードさせて、フェードアウトするまで待つ 
					GeminiNowLoadingStop();
					while (!GeminiIsNowLoadingStop())
					{
						suspend();
					}
				}

				// 特殊化　平野君の作ったメニューを開く為の例外処理
				local exMenuOpen = 0;
				// キャンペーンを終了してきた場合、デモを再生するかもしれない。
				if(preMode=="subMenu")
				{
					// subMenu からここへ戻るときにはGeminiNowLoadingStart
					// していない。
					if(subMenuMode==SB_STAFFROLL)
					{
						DrawMenuBG(true);
						// フェードインさせる 
						GeminiNowLoadingEnd();
					}
					else
					{
						if(subMenuMode==SB_DLCMENU)
						{
							// タイトルに戻るときはサインアウトした為なので邪魔をしない。
							if(fromSceneName=="CharacterMaking" && next != "title")
							{
								exMenuOpen = 1;
							}
						}
						DrawWaitingOnMenuBG(false);
					}
				}
				else if(preMode=="campaign")
				{
					StartMenuBG();

					SetStateDemo();
					SetupDrawLayerForDispModel();
					if(IsRunningMissionSuccess())
					{
						StartClosingCampaignDemo();
					}
					ReleaseCampaignDemo();
					ResetStateDemo();

					// フェードインさせる 
					GeminiNowLoadingEnd();
				}
				else
				{
					StartMenuBG();
					// フェードインさせる 
					GeminiNowLoadingEnd();
				}

				subMenuMode = MA_MAINMENU;
				fromSceneName = "";

				suspend();

				// 再生するメニューを選ぶ
				if(exMenuOpen==0)
				{
					if(next!="")
					{
						StartMenuScene( from, next, player, label, args);
					}
					else
					{
						StartMenuSceneList( startUpSceneIds );
					}
				}
				else if(exMenuOpen==1)
				{
					SceneManagerOpenCharaMakingFromDLC();
					suspend();
				}

				if(isInvited())
				{
					next = "sc_mainmenu"; player = ""; label  = "main"; args   = "";
				}

				while(true)
				{
					suspend();
					if(scr_IsFadeFinish())
						break;
				}

				while(true)
				{
					// メニューの処理
					PlayMenu()

					// NowLoading Start
					if(gScaleformGameMode == "subMenu")
					{
						if(subMenuMode==SB_STAFFROLL)
						{
							GeminiNowLoadingStart();
							while(GeminiIsNowLoadingStart())
							{
								suspend();
							}
							suspend();

							GeminiNowLoadingPut(1);
							DrawWaitingOnMenuBG(false);
						}
						else
						{
							DrawWaitingOnMenuBG(true);
						}

						GraphicsCatalogDestroy();
						DestroyScaleformMenu(false);

						RequestMenu( SQ_THREAD_GAME );

						// シーンを解放する
						local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
						SceneManagerOrderRelaseSceneByGroup(releaseFlags);

						break;
					}
					else
					{
						GeminiNowLoadingStart();
						while(GeminiIsNowLoadingStart())
						{
							suspend();
						}
						suspend();

						// キャンペーンに進む場合、デモを再生するかもしれない。
						local isChangeNextMode = true;
						if(gScaleformGameMode=="campaign")
						{
							SetStateDemo();
							SetupDrawLayerForDispModel();
							SetupCampaignDemo();
							StartOpeningCampaignDemo();
							ResetStateDemo();

							if(IsExistUserSignOutHistory())
							{
								isChangeNextMode = false;
							}
							if(isInvited())
							{
								isChangeNextMode = false;
								ReleaseCampaignDemo();
							}
						}

						if(isChangeNextMode)
						{
							GeminiNowLoadingPut(0);

							GraphicsCatalogDestroy();
							DestroyScaleformMenu(true);

							RequestMenu( SQ_THREAD_GAME );

							// シーンを解放する
							local releaseFlags = (1<<SCENE_GROUP_MENU)|(1<<SCENE_GROUP_HUD)|(1<<SCENE_GROUP_MENUBG);
							SceneManagerOrderRelaseSceneByGroup(releaseFlags);
							break;
						}
						else
						{
							StartMenuBG();
							// フェードインさせる 
							GeminiNowLoadingEnd();

							subMenuMode = MA_MAINMENU;
							fromSceneName = "";

							from = "";
							if(HasNextSceneForMenu())
							{
								//GetScene();
								next = GetNextSceneForMenu();
								player = GetNextMoviePlayerForMenu();
								label = GetNextLabelForMenu();
								args = GetNextArgsForMenu();
								StartMenuScene( from, next, player, label, args);
							}

							while(true)
							{
								suspend();
								if(scr_IsFadeFinish())
									break;
							}
						}
					}
				}

				// 念のためSyncしておく 
				loadResidentResourceThreadSync();

			} break;
		case "subMenu":
			{
				// UI_StaffRoll
				local startUpSceneIds = "";

				// ゲームのリソースとメニューのリソースを入れ替える
				//print ( "@@@ subMenuMode : "+subMenuMode + "\n");

				switch(subMenuMode)
				{
				case SB_STAFFROLL:
					{
						changeResourceForMenu2();
						startUpSceneIds = SetupMenu2( SQ_THREAD_GAME );

						// フェードがかかった状態なら 
						if (!GeminiIsNowLoadingEnd()) {
							// NowLoadingをフェードさせて、フェードアウトするまで待つ 
							GeminiNowLoadingStop();
							while (!GeminiIsNowLoadingStop())
							{
								suspend();
							}
						}

						from   = fromSceneName; next   = nextSceneName; player = ""; label  = ""; args   = "";
					}
					break;
				case SB_ITEMSPNNER:
					{
						changeResourceForMenu3();
						startUpSceneIds = SetupMenu3( SQ_THREAD_GAME );
						from   = fromSceneName;
						next   = nextSceneName;
						player = "itemspinner";
						args   = "";
						label  = "level1";
					}
					break;
				case SB_DLCMENU:
					{
						changeResourceForMenu4();
						startUpSceneIds = SetupMenu4( SQ_THREAD_GAME );
						if(fromSceneName=="CharacterMaking")
							from   = "custom";
						else 
							from   = fromSceneName;
						next   = nextSceneName; player = "DLCMenu"; label  = "dlc1"; args   = "";
					}
					break;
				case SB_HAPPYBOX:
					{
						changeResourceForMenu3();
						startUpSceneIds = SetupMenu3( SQ_THREAD_GAME );
						from   = fromSceneName;
						next   = nextSceneName;
						player = "itemspinner";
						args   = "";
						label  = "level4";
					}
					break;
				case SB_HAPPYBOX_LMT:
					{
						changeResourceForMenu3();
						startUpSceneIds = SetupMenu3( SQ_THREAD_GAME );
						from   = fromSceneName;
						next   = nextSceneName;
						player = "itemspinner";
						args   = "";
						label  = "level5";
					}
					break;
				case SB_CROSSPLATFORM:
					{

						SetupLanguageForFont(false);
						while(!IsEndSetupLanguageForFont())
						{
							suspend();
						}
						changeResourceForMenu5();

						startUpSceneIds = SetupMenu5( SQ_THREAD_GAME );
						from   = fromSceneName;
						next   = nextSceneName;
						player = "";
						args   = "";
						label  = "";
					}
					break;
				};

				DrawWaitingOnMenuBG(false);

				nextSceneName = "";

				// 再生するメニューを選ぶ
				StartMenuScene( from, next, player, label, args);
				suspend();

				switch(subMenuMode)
				{
				case SB_STAFFROLL:
					{
						// スタッフロールではBGは表示なし。
						DrawMenuBG(false);

						for (local i=0; i<40; ++i) { suspend(); }

						// フェードインさせる 
						GeminiNowLoadingEnd();

						startStaffroll();

						//suspend();

						// メニューの処理
						while(true)
						{
							suspend();
							if(scr_IsFadeFinish())
								break;
						}
					}
					break;
				}

				print ( "@@@ loop  : "+subMenuMode + "\n");

				while( true )
				{
					suspend();
					grahicsMouse();

					local notFindScene = SceneManagerNotFindCurrent();
					if(notFindScene!="")
					{
						local sceneName = SceneManagerGetSceneName();
						if(SceneManagerIsWaitCurrentScene(sceneName))
							break;
					}
				}

				gScaleformGameMode = "menu";

				switch(subMenuMode)
				{
				case SB_STAFFROLL:
					{
						local notFindScene = SceneManagerNotFindCurrent();
						if(notFindScene=="title")
						{
							from   = "staffroll"; next   = "title"; player = "multiplay_true"; label  = "Start"; args   = "";
						}
						else if(notFindScene=="sc_mainmenu")
						{
							from   = "staffroll"; next   = "sc_mainmenu"; player = "multiplay_true"; label  = "main"; args   = "";
						}
						else
						{
							from   = "staffroll"; next   = "option"; player = "option"; label  = "1"; args   = "";
						}
						//GeminiNowLoadingStartJustNow();
						GeminiNowLoadingPut(1);
					}
					break;
				case SB_ITEMSPNNER:
					{
						local notFindScene = SceneManagerNotFindCurrent();

						print("from   " + from    + "\n" );
						print("next   " + next    + "\n" );
						print("player " + player  + "\n" );
						print("label  " + label   + "\n" );
						print("args   " + args    + "\n" );

						if(notFindScene=="title")
						{
							from   = "sc_itemspinner"; next   = "title"; player = "multiplay_true"; label  = "Start"; args   = "";
						}
						else if(notFindScene=="sc_mainmenu")
						{
							from   = "sc_itemspinner"; next   = "sc_mainmenu"; player = "multiplay_true"; label  = "main"; args   = "";
						}
						else
						{
							from   = "sc_itemspinner"; next   = "sc_gameplay"; player = "multiplay_true"; label  = "gamePlay"; args   = "";
						}
						DrawWaitingOnMenuBG(true);
					}
					break; 
				case SB_DLCMENU:
					{
						local notFindScene = SceneManagerNotFindCurrent();
						if(notFindScene=="title")
						{
							from   = "sc_dlcmenu"; next   = "title"; player = "multiplay_true"; label  = "Start"; args   = "";
						}
						else if(notFindScene=="sc_mainmenu")
						{
							from   = "sc_dlcmenu"; next   = "sc_mainmenu"; player = "multiplay_true"; label  = "main"; args   = "";
						}
						else if(fromSceneName=="CharacterMaking")
						{
							// こちらは"menu"モードに移ってから判定します。
							//from   = "sc_dlcmenu"; next   = "CharacterMaking"; player = "CharacterMaking"; label  = ""; args   = "";
							//SceneManagerOpenCharaMakingFromDLC();
						}
						else
						{
							from   = "sc_dlcmenu"; next   = "sc_gameplay"; player = "multiplay_true"; label  = "gameplay"; args   = "";
						}
						DrawWaitingOnMenuBG(true);
					}
					break; 
				case SB_HAPPYBOX:
					{
						local notFindScene = SceneManagerNotFindCurrent();

						print("from   " + from    + "\n" );
						print("next   " + next    + "\n" );
						print("player " + player  + "\n" );
						print("label  " + label   + "\n" );
						print("args   " + args    + "\n" );

						if(notFindScene=="title")
						{
							from   = "sc_happybox"; next   = "title"; player = "multiplay_true"; label  = "Start"; args   = "";
						}
						else if(notFindScene=="sc_mainmenu")
						{
							from   = "sc_happybox"; next   = "sc_mainmenu"; player = "multiplay_true"; label  = "main"; args   = "";
						}
						else
						{
							from   = "sc_happybox"; next   = "sc_gameplay"; player = "multiplay_true"; label  = "gamePlay"; args   = "";
						}
						DrawWaitingOnMenuBG(true);
					}
					break; 
				case SB_HAPPYBOX_LMT:
					{
						local notFindScene = SceneManagerNotFindCurrent();

						print("from   " + from    + "\n" );
						print("next   " + next    + "\n" );
						print("player " + player  + "\n" );
						print("label  " + label   + "\n" );
						print("args   " + args    + "\n" );

						if(notFindScene=="title")
						{
							from   = "sc_happybox"; next   = "title"; player = "multiplay_true"; label  = "Start"; args   = "";
						}
						else if(notFindScene=="sc_mainmenu")
						{
							from   = "sc_happybox"; next   = "sc_mainmenu"; player = "multiplay_true"; label  = "main"; args   = "";
						}
						else
						{
							from   = "sc_happybox"; next   = "sc_gameplay"; player = "multiplay_true"; label  = "gamePlay"; args   = "";
						}
						DrawWaitingOnMenuBG(true);
					}
					break; 
				case SB_CROSSPLATFORM:
					{
						local notFindScene = SceneManagerNotFindCurrent();

						print("from   " + from    + "\n" );
						print("next   " + next    + "\n" );
						print("player " + player  + "\n" );
						print("label  " + label   + "\n" );
						print("args   " + args    + "\n" );

						if(notFindScene=="title")
						{
							from   = "crossPlatform"; next   = "title"; player = "multiplay_true"; label  = "Start"; args   = "";
						}
						else if(notFindScene=="sc_mainmenu")
						{
							from   = "crossPlatform"; next   = "sc_mainmenu"; player = "multiplay_true"; label  = "main"; args   = "";
						}
						DrawWaitingOnMenuBG(true);
					}
					break; 
				}

				GraphicsCatalogDestroy();
				DestroyScaleformMenu(false);

				RequestMenu( SQ_THREAD_GAME );

				//// シーンを解放する
				//local releaseFlags = (1<<SCENE_GROUP_MENU) | (1<<SCENE_GROUP_HUD);
				//SceneManagerOrderRelaseSceneByGroup(releaseFlags);
				
				// 念のためSyncしておく 
				loadResidentResourceThreadSync();

			} break;
		}

		preMode = nextMode;
		nextMode = gScaleformGameMode;

		gScaleformGameMode = "";

		if( ("" == nextMode) || ("exit" == nextMode) )
			break;
	}


	// Menu, HUD の開放.
	DestroyScaleformMenu(true);
	DestroyScaleformHUD();

	GeminiPostEscape();
	while(1){ suspend(); }
}

//-----------------------------------------------------------------------------
//	ゲーム実行
function relaseGeminiRunGame( thread_id ) {
	// ゲームプレイ 
	ezGamePlay( 0, thread_id, true );
}

