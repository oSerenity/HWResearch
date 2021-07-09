/* XDASEA_Xm8R_SPsX */ 

// スレッドを起動させるだけ 
function DebugGameConfigFromDebugMenu() {
	RunScriptFunction( SQ_THREAD_GAME, "DebugGameConfigAndReturn" );
	EnableForcusThreadId( SQ_THREAD_GAME, true );
	ChangeForcusThreadId( SQ_THREAD_GAME );
}

// メニューが終わったら、デバッグメニューに行く
function DebugGameConfigAndReturn() {
	DebugGameConfig( SQ_THREAD_GAME );
	debugMenuStart();
	EnableForcusThreadId( SQ_THREAD_GAME, false );
}

class DebugGameConfigMenu {
	config_menu = null;
	bool_list = null;
	pad_list = null;
	side_list = null;
	job_list = null;
	dec_list = null;
	lang_list = null;
	diff_list = null;
	prio_list = null;
	profile_list = null;
	edit_list = null;
	rank_list = null;
	part_list = null;
	lottery_list = null;
	spi_kind_list = null;
	spi_bet_list = null;
	items = null;
	items1 = null;
	pf_items = null;
	sim_items = null;
	spi_items = null;
	demo_stage_list = null;
	demo_stage_bres = null;
	
	seed_version = 20100628;
	
	constructor() {
		config_menu = MenuPage();

		IncludeScriptFile( "stage\\stageFileList.nut" );
		bool_list = [false, true];
		pad_list = [ "Pad1", "Pad2", "Pad3", "Pad4", "Keyboard", "Bot" ];
		side_list = ["DarkColor", "LightColor"];
		job_list = ["Warroir", "Cleric", "Mage" ];
		dec_list = [ "Decrease", "Dont Decrease", "Decrease (AllSkill)", "Dont Decrease (AllSkill)" ];
		lang_list = [ "JAPANESE", "US_ENGLISH" , "ITALIAN", "FRENCH", "GERMAN", "SPANISH", "CHINESE_H", "KOREAN" ];	//LanguageManager::Languageと順番を合わせる(UNKNOWNは省く)
		diff_list = [ "NONE", "NORMAL", "HARD", "SHARD" ];
		prio_list = [ "None", "Low", "Middle", "High" ];
		// とりあえず3スロットで各職業選択にしておく
		profile_list = [ "Slot0", "Slot1", "Slot2" ];
		edit_list = [ "Prfile", "Equipment", "Enhancement", "Synthesis" ];
		rank_list = [ "Rank1", "Rank2", "Rank3", "Rank4", "Rank5", "Rank6", "Rank7", "Rank8", "Rank9", "Rank10" ];
		part_list = [ "Head", "Body", "Weapon", "Shield", "Accessory", "Random" ];
		lottery_list = [ "Result", "Bargain", "Spinner", "Spinner DX", "Spinner GS", "All" ];
		spi_kind_list = [ "Normal", "Deluxe", "Gorgeous" ];
		spi_bet_list = [ "Weapon", "Shield", "Helmet", "Armor", "Accessory", "None" ];
		pf_items = [ null, null, null, null ];
		
		local index = 0;
		local index1 = 0;
		local pf_idx_0 = 0;
		local pf_idx_1 = 0;
		local pf_idx_2 = 0;
		local pf_idx_3 = 0;
		local sim_index = 0;
		local spi_index = 0;
		
		if (0==GAME_IS_DEMO) {
			if ( IsGameAutoLoopTest() ) {
				gStageFileList =	[	"sligA.bres"
										"sligB.bres"
										"sdesA.bres"
										"sdesB.bres"
										"sseaA.bres"
										"sdarA.bres"
									];
			}
			
		//	if (DEBUG_MENU_MODE==1)
		//	{
		//		gStageFileList = [
		//			"sligA.bres"
		//			"sligB.bres"
		//			"sdesA.bres"
		//			"sdesB.bres"
		//			"sdarA.bres"
		//			"sdarB.bres"
		//			"sseaA.bres"
		//			"sseaB.bres"
		//			"scloA.bres"
		//			"scloB.bres"
		//		];
		//	}
			
			local pad_exist_mask = GetGamePadExistMask();
		
			items = [	MenuItemSelector( 0, index++, "Stage", gStageFileList, 0 ),
						MenuValueRange( 0, index++, "PlayerEntryMax", GAME_START_PLAYER_NUM, 1, GAME_PLAYER_MAX ),
						MenuValueRange( 0, index++, "DarkPlayerEntryMax", GAME_START_TEAM_PLAYER_NUM, 0, GAME_TEAM_PLAYER_MAX ),
						MenuValueRange( 0, index++, "LightPlayerEntryMax", GAME_START_TEAM_PLAYER_NUM, 0, GAME_TEAM_PLAYER_MAX ),
						MenuValueRange( 0, index++, "GameSeed", 2010, 0, 9999 ),
						MenuItemSelector( 0, index++, "Player0 Input", pad_list, ((pad_exist_mask&(1<<0)) ? 0 : 5) ),
						MenuItemSelector( 0, index++, "   PowerColor", side_list, 0 ),
						MenuValueRange  ( 0, index++, "    EquipSeed", 1167, 0, 9999 ),	// 11/05/17 今日だけ初期値を変更
					//	MenuValueRange  ( 0, index++, "    EquipSeed", 1166, 0, 9999 ),
						MenuItemSelector( 0, index++, "    EquipEdit", bool_list, 1 ),
						MenuItemSelector( 0, index++, " HP/AP(skill)", dec_list, 2 ),	// 11/05/17 今日だけ初期値を変更
					//	MenuItemSelector( 0, index++, " HP/AP(skill)", dec_list, 0 ),
						MenuItemSelector( 0, index++, "Player1 Input", pad_list, ((pad_exist_mask&(1<<1)) ? 1 : 5) ),
						MenuItemSelector( 0, index++, "   PowerColor", side_list, 1 ),
						MenuValueRange  ( 0, index++, "    EquipSeed", 2222, 0, 9999 ),
						MenuItemSelector( 0, index++, "    EquipEdit", bool_list, 1 ),
						MenuItemSelector( 0, index++, " HP/AP(skill)", dec_list, 0 ),
						MenuItemSelector( 0, index++, "Player2 Input", pad_list, ((pad_exist_mask&(1<<2)) ? 2 : 5) ),
						MenuItemSelector( 0, index++, "   PowerColor", side_list, 0 ),
						MenuValueRange  ( 0, index++, "    EquipSeed", 3333, 0, 9999 ),
						MenuItemSelector( 0, index++, "    EquipEdit", bool_list, 1 ),
						MenuItemSelector( 0, index++, " HP/AP(skill)", dec_list, 0 ),
						MenuItemSelector( 0, index++, "Player3 Input", pad_list, ((pad_exist_mask&(1<<3)) ? 3 : 5) ),
						MenuItemSelector( 0, index++, "   PowerColor", side_list, 1 ),
						MenuValueRange  ( 0, index++, "    EquipSeed", 4444, 0, 9999 ),
						MenuItemSelector( 0, index++, "    EquipEdit", bool_list, 1 ),
						MenuItemSelector( 0, index++, " HP/AP(skill)", dec_list, 0 ),
					];
					
			items1 = [	MenuValueRange( 1, index1++, "GameStartCountDown", 5, 0, 60 ),
						MenuValueRange( 1, index1++, "TimeLimit", -1, -1, 1800 ),
						MenuValueRange( 1, index1++, "GameEndTimer", 30, 0, 60 ),
						MenuValueRange( 1, index1++, "GameResultTimer", 30, 0, 90 ),
						MenuValueRange( 1, index1++, "RebirthTimer", 8, 0, 60 ),
						MenuValueRange( 1, index1++, "PenaltyRebirthTimer", 15, 0, 60 ),
						MenuValueRange( 1, index1++, "WhiteBotEquipmentRare", 0, 0, 10 ),
						MenuValueRange( 1, index1++, "WhiteBotEquipmentLevel", 0, 0, 10 ),
						MenuValueRange( 1, index1++, "BlackBotEquipmentRare", 0, 0, 10 ),
						MenuValueRange( 1, index1++, "BlackBotEquipmentLevel", 0, 0, 10 ),
						MenuItemSelector( 1, index1++, "GameDifficulty", diff_list, 0 ),
						MenuItemSelector( 1, index1++, "SmallScreen", bool_list, 0 ),
						MenuItemSelector( 1, index1++, "Language", lang_list, 0 ),
						MenuItemSelector( 1, index1++, "BotTargetingPriority", prio_list, 2 ),
						MenuItemSelector( 1, index1++, "BotHealingPriority", prio_list, 3 ),
						MenuItemSelector( 1, index1++, "Game Auto Loop Test", bool_list, 0 ),
						MenuItemSelector( 1, index1++, "Build Gimmick", bool_list, 0 ),
						MenuItemSelector( 1, index1++, "Play BGM", bool_list, 1 ),
						MenuItemSelector( 1, index1++, "Pad Vibration", bool_list, 1 ),
						MenuItemSelector( 1, index1++, "Team Skill Test", bool_list, 1 ),
					];
					
			pf_items[0] = [	MenuItemSelector( 	2, pf_idx_0++, "      Profile", profile_list, 0 ),
							MenuItemSelector(	2, pf_idx_0++, "     EditMenu", edit_list	, 0 ),
						];
			pf_items[1] = [	MenuItemSelector( 	3, pf_idx_1++, "      Profile", profile_list, 0 ),
							MenuItemSelector(	3, pf_idx_1++, "     EditMenu", edit_list	, 0 ),
						];
			pf_items[2] = [	MenuItemSelector( 	4, pf_idx_2++, "      Profile", profile_list, 0 ),
							MenuItemSelector(	4, pf_idx_2++, "     EditMenu", edit_list	, 0 ),
						];
			pf_items[3] = [	MenuItemSelector( 	5, pf_idx_3++, "      Profile", profile_list, 0 ),
							MenuItemSelector(	5, pf_idx_3++, "     EditMenu", edit_list	, 0 ),
						];
			sim_items = [	MenuItemSelector( 	6, sim_index++, "         Rank", rank_list, 0 ),
							MenuItemSelector(	6, sim_index++, "          Job", job_list , 0 ),
							MenuItemSelector(	6, sim_index++, "    EquipPart", part_list, 5 ),
							MenuItemSelector(	6, sim_index++, "  LotteryType", lottery_list, 0 ),
							MenuValueRange(		6, sim_index++, "   LotteryNum",    1, 1 , 512 ),
							MenuValueRange(		6, sim_index++, "   RandomSeed", 2011, 0 ,9999 ),
						];
			spi_items = [	MenuItemSelector( 	7, spi_index++, "         Kind", spi_kind_list, 0 ),
							MenuItemSelector(	7, spi_index++, "         Bet1", spi_bet_list, 5 ),
							MenuItemSelector(	7, spi_index++, "         Bet2", spi_bet_list, 5 ),
							MenuItemSelector(	7, spi_index++, "         Bet3", spi_bet_list, 5 ),
							MenuItemSelector(	7, spi_index++, "         Bet4", spi_bet_list, 5 ),
							MenuItemSelector(	7, spi_index++, "         Bet5", spi_bet_list, 5 ),
							MenuItemSelector(	7, spi_index++, "         Bet6", spi_bet_list, 5 ),
							MenuValueRange(		7, spi_index++, "   LotteryNum",    1, 1 , 512 ),
							MenuValueRange(		7, spi_index++, "   RandomSeed", 2011, 0 ,9999 ),
						];
					
			items1[15].setValiable( IsGameAutoLoopTest() );
		} else {
			demo_stage_bres =	[
				"sligB.bres"
				"sseaA.bres"
				"sdesB.bres"
				"sligA.bres"
				"sdesA.bres"
				"sdarA.bres"
				"sdarB.bres"
				"sseaB.bres"
				"scloA.bres"
				"scloB.bres"
				];

			demo_stage_list =	[
				"Snowman [sligB]"
				"Coral [sseaA]"
				"Zodiac [sdesB]"
				"Rainbow [sligA]"
				"Desert [sdesA]"
				"Twilight [sdraA]"
				"Pumpkin [sdraB]"
				"Deep Sea [sseaB]"
				"Big Bird [scolA]"
				"Sunset [scolB]"
				];
		
			items = [	MenuItemSelector( 0, index++, "Stage         ", demo_stage_list, 0 ),
						MenuItemSelector( 0, index++, "TeamPowerColor", side_list, 1 ),
						MenuItemSelector( 0, index++, "Player0  Input", pad_list, 0 ),
						MenuItemSelector( 0, index++, "         HP/AP", dec_list, 2 ),
						MenuItemSelector( 0, index++, "Game Auto Loop Test", bool_list, 0 ),
					];
			items[4].setValiable( IsGameAutoLoopTest() );
		}
		
		if (0<index) {
			config_menu.addMenu( 0, "DebugGameConfig [Press X to start]" );
			foreach( item in items ) {
				config_menu.addItemObj( item );
			}
		}
		
		if (0<index1) {
			config_menu.addMenu( 1, "DebugRuleConfig [Press X to start]" );
			foreach( item in items1 ) {
				config_menu.addItemObj( item );
			}
		}
		
		if (0<pf_idx_0) {
			config_menu.addMenu( 2, "ProfileEdit Player 0 [Press Y to Enter Edit Mode] [Press X to start]" );
			foreach( item in pf_items[0] ) {
				config_menu.addItemObj( item );
			}
		}
		if (0<pf_idx_1) {
			config_menu.addMenu( 3, "ProfileEdit Player 1 [Press Y to Enter Edit Mode] [Press X to start]" );
			foreach( item in pf_items[1] ) {
				config_menu.addItemObj( item );
			}
		}
		if (0<pf_idx_2) {
			config_menu.addMenu( 4, "ProfileEdit Player 2 [Press Y to Enter Edit Mode] [Press X to start]" );
			foreach( item in pf_items[2] ) {
				config_menu.addItemObj( item );
			}
		}
		if (0<pf_idx_3) {
			config_menu.addMenu( 5, "ProfileEdit Player 3 [Press Y to Enter Edit Mode] [Press X to start]" );
			foreach( item in pf_items[3] ) {
				config_menu.addItemObj( item );
			}
		}
		if (0<sim_index) {
			config_menu.addMenu( 6, "Item Lottery Simulator [Press Y to Lottery Simulation] [Press X to start]" );
			foreach( item in sim_items ) {
				config_menu.addItemObj( item );
			}
		}
		if (0<spi_index) {
			config_menu.addMenu( 7, "Spinner Lottery Simulator [Press Y to Lottery Simulation] [Press X to start]" );
			foreach( item in spi_items ) {
				config_menu.addItemObj( item );
			}
		}
	}
	
	function popSeed()
	{
		// シードをロードする 
		loadGameSeed( 0, 0 );
		
		// シードを設定する 
		local game_seed = GameSeed();

		// シードをセットする 
		game_seed.popSeed( 0 );
		
		if (game_seed.version_ == seed_version)
		{
			if (0==GAME_IS_DEMO) {
				items[0].setValiable( game_seed.getStageSeed().getStageBres() );
				items[1].setIndex( game_seed.playerEntryMax_ );
				items[2].setIndex( game_seed.blackPlayerEntryMax_ );
				items[3].setIndex( game_seed.whitePlayerEntryMax_ );
				items[4].setIndex( game_seed.randomSeed_ );

				// プレイヤー 
				for (local i=0; i<GAME_LOCAL_PAD_MAX; ++i)
				{
					local index = 5 + 5*i;
					local player = game_seed.getLocalPlayerSeed(i);
					
					items[index+0].setIndex( player.isInputHuman_ ? player.humanPadIndex_ : 5 )
					items[index+1].setIndex( player.powerColor_ );
					items[index+2].setIndex( player.randomProfileSeed_ );
					items[index+3].setIndex( player.isEnableSavedata_ ? 1 : 0 );
					items[index+4].setIndex( player.debugStrengthDecrease_ );
					
					// 装備エディット用
					pf_items[i][0].setIndex( player.profileIndex_ );
				}
				
				items1[0].setValiable( game_seed.getGameRuleSeed().GameStartCountDownSecond_ );
				items1[1].setValiable( game_seed.getGameRuleSeed().timerRuleSecond_ );
				items1[2].setValiable( game_seed.getGameRuleSeed().GameEndTimerSecond_ );
				items1[3].setValiable( game_seed.getGameRuleSeed().GameResultTimerSecond_ );
				items1[4].setValiable( game_seed.getGameRuleSeed().normalRebirthTimer_ );
				items1[5].setValiable( game_seed.getGameRuleSeed().penaltyRebirthTimer_ );
				items1[6].setValiable( game_seed.getGameRuleSeed().whiteBotEquipmentRare_ );
				items1[7].setValiable( game_seed.getGameRuleSeed().whiteBotEquipmentLevel_ );
				items1[8].setValiable( game_seed.getGameRuleSeed().blackBotEquipmentRare_ );
				items1[9].setValiable( game_seed.getGameRuleSeed().blackBotEquipmentLevel_ );	
	
				//言語設定
				items1[12].setIndex( ScaleformGetLanguage() );
				
				items1[13].setIndex( ScaleformGetBotTargetingPriority() );
				items1[14].setIndex( ScaleformGetBotHealingPriority() );

				items1[16].setValiable( IsBuildComplete() ); 
				items1[17].setValiable( IsPlayBgm() );
				items1[18].setValiable( IsPadVibration() );
				items1[19].setValiable( IsTeamSkillTest() );
			} else {
				local temp_item = MenuItemSelector( 0, 0, "Stage", demo_stage_bres, 0 ); 
				temp_item.setValiable( game_seed.getStageSeed().getStageBres() );
				items[0].setValiable( demo_stage_list[ temp_item.getIndex() ] );

				// ループデバッグのためにここにステージを進める処理を追加 
				// items[0].setValiable( demo_stage_list[ (temp_item.getIndex() + 1)%7 ] );
				
				// プレイヤー 
				for (local i=0; i<1; ++i)
				{
					local index = 2 + 2*i;
					local player = game_seed.getLocalPlayerSeed(i);
					
					if (i==0) {
						items[1].setIndex( player.powerColor_ );
					}
					items[index+0].setIndex( player.isInputHuman_ ? player.humanPadIndex_ : 5 )
					items[index+1].setIndex( player.debugStrengthDecrease_ );
				}
			}
		}
	}
	
	function pushSeed()
	{
		// シードを設定する 
		local game_seed = GameSeed();
		
		// バージョン番号を埋め込む 
		game_seed.version_ = seed_version;
		
		// ゲームルール設定
		game_seed.getGameRuleSeed().setNormalRule();
		
		if (0==GAME_IS_DEMO) {
			// ステージ 
			game_seed.getStageSeed().setStageBres( items[0].getValiable() );
			
			// 最大参加人数 
			game_seed.playerEntryMax_ = items[1].getIndex();
			game_seed.blackPlayerEntryMax_ = items[2].getIndex();
			game_seed.whitePlayerEntryMax_ = items[3].getIndex();
			
			// 乱数シード 
			game_seed.randomSeed_ = items[4].getIndex();
			
			// プレイヤー 
			for (local i=0; i<GAME_LOCAL_PAD_MAX; ++i)
			{	
				local index = 5 + 5*i;
				
				local player = game_seed.getLocalPlayerSeed(i);
				
				local pad_index = items[index+0].getIndex();
				if (pad_index == 5)
				{	// Bot
					player.setLocalPlayerDefault(i,true);
					player.isInputHuman_ = false;
				}
				else
				{	// Human
					player.setLocalPlayerDefault(i,false);
					player.humanPadIndex_ = pad_index;
					player.isInputHuman_ = true;
				}
				
				local use_savedata = items[index+3].getIndex()==0 ? false : true;
				
				player.isEnableSeed_ = true;
				player.isEntrySeed_ = true;
				player.localScreenIndex_ = i;
				player.playerHandleIndex_ = i;
				player.profileIndex_ = 0;
				player.powerColor_ = items[index+1].getIndex();
				player.randomProfileSeed_ = items[index+2].getIndex();
				player.isEnableSavedata_ = use_savedata;
				player.debugStrengthDecrease_ = items[index+4].getIndex();
				player.setupProfile(use_savedata);
			}

			// 時間制限 
			game_seed.getGameRuleSeed().GameStartCountDownSecond_ = items1[0].getValiable();
			game_seed.getGameRuleSeed().timerRuleSecond_ = items1[1].getValiable();
			game_seed.getGameRuleSeed().GameEndTimerSecond_ = items1[2].getValiable();
			game_seed.getGameRuleSeed().GameResultTimerSecond_ = items1[3].getValiable();
			game_seed.getGameRuleSeed().normalRebirthTimer_ =  items1[4].getValiable();
			game_seed.getGameRuleSeed().penaltyRebirthTimer_ = items1[5].getValiable();
			game_seed.getGameRuleSeed().whiteBotEquipmentRare_ = items1[6].getValiable();
			game_seed.getGameRuleSeed().whiteBotEquipmentLevel_ = items1[7].getValiable();
			game_seed.getGameRuleSeed().blackBotEquipmentRare_ = items1[8].getValiable();
			game_seed.getGameRuleSeed().blackBotEquipmentLevel_ = items1[9].getValiable();
			
			// 難易度
			game_seed.getGameRuleSeed().gameDifficulty_ = items1[10].getIndex();
			
			if (items1[11].getValiable())
			{
				SetWindowSize( 720, 450 );
				SetScreenAspect( 16, 10 );
				UpdateScreenState();
			}
			else
			{
				SetDefaultScreenState();
			}
			
			// BOT用
			ScaleformSetBotTargetingPriority( items1[13].getIndex() );
			ScaleformSetBotHealingPriority( items1[14].getIndex() );
			
			SetGameAutoLoopTest( items1[15].getValiable() );
			SetBuildComplete( items1[16].getValiable() );
			SetPlayBgm( items1[17].getValiable() );
			SetPadVibration( items1[18].getValiable() );
			SetTeamSkillTest( items1[19].getValiable() );
			
			if ( IsGameAutoLoopTest() ) {
				items[0].input_next_key();	// 自動的に次に進める 
				game_seed.getStageSeed().setStageBres( items[0].getValiable() );
				game_seed.randomSeed_									= game_seed.randomSeed_ + 139;
				game_seed.getGameRuleSeed().GameStartCountDownSecond_	= 1;
				game_seed.getGameRuleSeed().timerRuleSecond_			= 5*60;
				game_seed.getGameRuleSeed().GameEndTimerSecond_			= 2;
				game_seed.getGameRuleSeed().GameResultTimerSecond_		= 2;
				game_seed.getGameRuleSeed().normalRebirthTimer_			= 5;
				game_seed.getGameRuleSeed().penaltyRebirthTimer_		= 5;
			}
			
		} else {
			// ステージ 
			game_seed.getStageSeed().setStageBres( demo_stage_bres[ items[0].getIndex() ] );
			game_seed.playerEntryMax_			= 30;
			game_seed.blackPlayerEntryMax_		= 15;
			game_seed.whitePlayerEntryMax_		= 15;
			game_seed.randomSeed_				= game_seed.randomSeed_ + 2010;
			 
			// プレイヤー 
			for (local i=0; i<1; ++i)
			{
				local index = 2 + 2*i;
				
				local player = game_seed.getLocalPlayerSeed(i);
				
				local pad_index = items[index+0].getIndex();
				if (pad_index == 5)
				{	// Bot
					player.setLocalPlayerDefault(i,true);
				}
				else
				{	// Human
					player.setLocalPlayerDefault(i,false);
					player.humanPadIndex_ = pad_index;
				}
				player.isEnableSeed_		= true;
				player.isEntrySeed_			= true;
				player.localScreenIndex_	= i;
				player.playerHandleIndex_	= i;
				player.powerColor_			= items[1].getIndex();
				player.profileIndex_		= 0;
				if (i==0) {
					player.randomProfileSeed_	= 1166;
				} else {
					player.randomProfileSeed_	= 1098;
				}
				player.isEnableSavedata_	= true;
				player.debugStrengthDecrease_ = items[index+1].getIndex();
				player.setupProfile(player.isEnableSavedata_);
			}
			for (local i=1; i<GAME_LOCAL_PAD_MAX; ++i)
			{
				local player = game_seed.getLocalPlayerSeed(i);
				player.setLocalPlayerDefault(i,true);
				player.isEnableSeed_		= true;
				player.isEntrySeed_			= true;
				player.localScreenIndex_	= i;
				player.playerHandleIndex_	= i;
				player.powerColor_			= (items[1].getIndex() + 1) % 2;
				player.profileIndex_		= 0;
				player.randomProfileSeed_	= 1111 * i;
				player.debugStrengthDecrease_ = 0;
				player.setupProfile(false);
			}
			
			game_seed.getGameRuleSeed().GameStartCountDownSecond_ = 1;
			game_seed.getGameRuleSeed().timerRuleSecond_ = 15*60;
			game_seed.getGameRuleSeed().GameEndTimerSecond_ = 5;
			game_seed.getGameRuleSeed().GameResultTimerSecond_ = 5;
			game_seed.getGameRuleSeed().normalRebirthTimer_ =  8;
			game_seed.getGameRuleSeed().penaltyRebirthTimer_ = 8;
			game_seed.getGameRuleSeed().whiteBotEquipmentRare_ = items1[6].getValiable();
			game_seed.getGameRuleSeed().whiteBotEquipmentLevel_ = items1[7].getValiable();
			game_seed.getGameRuleSeed().blackBotEquipmentRare_ = items1[8].getValiable();
			game_seed.getGameRuleSeed().blackBotEquipmentLevel_ = items1[9].getValiable();
			
			// 難易度
			game_seed.getGameRuleSeed().gameDifficulty_ = items1[10].getIndex();

			ScaleformSetLanguage( 1 );
			ScaleformSetBotTargetingPriority( 0 );
			ScaleformSetBotHealingPriority( 0 );
			
			SetGameAutoLoopTest( items[4].getValiable() );
			
			if ( IsGameAutoLoopTest() ) {
				items[0].input_next_key();	// 自動的に次に進める 
				game_seed.getStageSeed().setStageBres( demo_stage_bres[ items[0].getIndex() ] );
				game_seed.randomSeed_									= game_seed.randomSeed_ + 139;
				game_seed.getGameRuleSeed().GameStartCountDownSecond_	= 1;
				game_seed.getGameRuleSeed().timerRuleSecond_			= 5*60;
				game_seed.getGameRuleSeed().GameEndTimerSecond_			= 2;
				game_seed.getGameRuleSeed().GameResultTimerSecond_		= 2;
				game_seed.getGameRuleSeed().normalRebirthTimer_			= 5;
				game_seed.getGameRuleSeed().penaltyRebirthTimer_		= 5;
			}
		}
		
		// シードをセットする 
		game_seed.pushSeed( 0 );
		game_seed.normalizeSeed( 0 );
		
		// プッシュしたシードをセーブする 
		saveGameSeed( 0, 0 );
		
		if (0==GAME_IS_DEMO) {
			// 言語設定(セーブ対象外)
			ScaleformSetLanguage( items1[12].getIndex() );
		}
	}
}

// 初回起動フラグ
gIsFirstBoot <- true;

// メニューだけの処理 
function DebugGameConfig( thread_id ) {

	local thread_pattern = SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_ALWAYS );
	
	SetDefaultScreenState();
	
	// このインスタンスが初期化されるまで、メニューの状態は保存される 
	local gDebugGameConfigMenu = DebugGameConfigMenu();
	
	// 初回時だけセーブデータを読み込む
	if( gIsFirstBoot ) {
		ezLoadData( false, true );
		gIsFirstBoot = false;
	}
	
	gDebugGameConfigMenu.popSeed();

	EnableForcusThreadId( thread_id, true );
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_DEBUG_FOCUS );
	ChangeForcusThreadId( thread_id );
	
	local selected = -1;
	local edit_menu = -1;
	while(selected<0) {
		while( thread_id<0 || OnForcusThreadId( thread_id ) ) {
			local menu_update = true;
			local now_page = gDebugGameConfigMenu.config_menu.currentPage();
			if( 2 <= now_page && now_page <= 5 )
			{	// 各種エディット
				if(DebugPadIsTrigger(::PAD_Y) || ihp.GetGameKeyboard().IsPush( 'Y' ) )
				{
					if( edit_menu < 0 )
					{
						local player_id = now_page-2;
						local profile_index = gDebugGameConfigMenu.pf_items[player_id][0].getIndex();
						
						edit_menu = gDebugGameConfigMenu.pf_items[player_id][1].getIndex();
						
						if( edit_menu == 0 )
						{	// プロファイルエディット開始
							DebugEditProfileInitialize( player_id, profile_index );
						}
						else if( edit_menu == 1 )
						{	// 装備エディット開始
							DebugEditEquipInitialize( player_id, profile_index );
						}
						else if( edit_menu == 2 )
						{	// 強化エディット開始
							DebugItemEnhancementInitialize( player_id, profile_index );
						}
						else if( edit_menu == 3 )
						{	// 合成エディット開始
							DebugItemSynthesisInitialize( player_id, profile_index );
						}
						else
						{	// 無効
							edit_menu = -1;
						}
					}
					else
					{
						if( edit_menu == 0 )
						{	// プロファイルエディット終了
							DebugEditProfileFinalize();
						}
						else if( edit_menu == 1 )
						{	// 装備エディット終了
							DebugEditEquipFinalize();
						}
						else if( edit_menu == 2 )
						{	// 強化エディット終了
							DebugItemEnhancementFinalize();
						}
						else if( edit_menu == 3 )
						{	// 合成エディット終了
							DebugItemSynthesisFinalize();
						}
						
						edit_menu = -1;
					}
				}
				
				if( edit_menu == 0 )
				{
					menu_update = false;
					DebugEditProfileUpdate();
					DebugEditProfileDraw();
				}
				else if( edit_menu == 1 )
				{
					menu_update = false;
					DebugEditEquipUpdate();
					DebugEditEquipDraw();
				}
				else if( edit_menu == 2 )
				{
					menu_update = false;
					DebugItemEnhancementUpdate();
					DebugItemEnhancementDraw();
				}
				else if( edit_menu == 3 )
				{
					menu_update = false;
					DebugItemSynthesisUpdate();
					DebugItemSynthesisDraw();
				}
			}
			else if( now_page == 6 )
			{
				if(DebugPadIsTrigger(::PAD_Y) || ihp.GetGameKeyboard().IsPush( 'Y' ) )
				{
					local rank 		= gDebugGameConfigMenu.sim_items[0].getIndex();
					local job_type	= gDebugGameConfigMenu.sim_items[1].getIndex();
					local part 		= gDebugGameConfigMenu.sim_items[2].getIndex();
					local lottery 	= gDebugGameConfigMenu.sim_items[3].getIndex();
					local num 		= gDebugGameConfigMenu.sim_items[4].getIndex();
					local seed 		= gDebugGameConfigMenu.sim_items[5].getIndex();
					DebugLotterySimulation( rank, job_type, part, lottery, num, seed );
				}
			}
			else if( now_page == 7 )
			{
				if(DebugPadIsTrigger(::PAD_Y) || ihp.GetGameKeyboard().IsPush( 'Y' ) )
				{
					local kind 	= gDebugGameConfigMenu.spi_items[0].getIndex();
					local bet1	= gDebugGameConfigMenu.spi_items[1].getIndex();
					local bet2 	= gDebugGameConfigMenu.spi_items[2].getIndex();
					local bet3 	= gDebugGameConfigMenu.spi_items[3].getIndex();
					local bet4 	= gDebugGameConfigMenu.spi_items[4].getIndex();
					local bet5 	= gDebugGameConfigMenu.spi_items[5].getIndex();
					local bet6 	= gDebugGameConfigMenu.spi_items[6].getIndex();
					local num 	= gDebugGameConfigMenu.spi_items[7].getIndex();
					local seed 	= gDebugGameConfigMenu.spi_items[8].getIndex();
					
					local bet_mask = bet1 + (bet2*16) + (bet3*256) + (bet4*4096) + (bet5*65536) + (bet6*1048576);
					DebugSpinnerSimulation( kind, bet_mask, num, seed );
				}
			}
			
			if( edit_menu < 0 )
			{	// ゲームスタート
				if (DebugPadIsTrigger(::PAD_X) || ihp.GetGameKeyboard().IsPush( 'X' ) || IsGameAutoLoopTest() )
				{
					SE_Ok();
					selected = 0;
					break;
				}
			}
			
			if( menu_update )
			{
				gDebugGameConfigMenu.config_menu.update();
			}
			
			gDebugGameConfigMenu.config_menu.draw( 400, 32, 22 );
			grahicsMouse();
			suspend();
		}
		suspend();
	}
	
	SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_ALWAYS );
	EnableForcusThreadId( thread_id, false );
	ChangeForcusThreadId( -1 );
	
	gDebugGameConfigMenu.pushSeed();
	
	// セーブしてみる
	ezSaveData( false, true );
	
	SetPatternThreadId( thread_id, thread_pattern );
}

function DebugGameConfigLoadOnly( thread_id ) {
	local thread_pattern = SetPatternThreadId( thread_id, SQ_THREAD_PATTERN_ALWAYS );
	
	// このインスタンスが初期化されるまで、メニューの状態は保存される 
	local gDebugGameConfigMenu = DebugGameConfigMenu();
	gDebugGameConfigMenu.popSeed();
	gDebugGameConfigMenu.pushSeed();
	
	SetPatternThreadId( thread_id, thread_pattern );
}
