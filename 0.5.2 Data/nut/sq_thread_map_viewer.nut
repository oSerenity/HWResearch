/* XDASEA_Xm8R_SPsX */ 
//
//	MapViewerのシーケンス
//

function mapViewerStart()
{
	if ( SQ_THREAD_STATE_RUNNING != GetThreasState( SQ_THREAD_GAME ) )
	{
		RunScriptFunction( SQ_THREAD_GAME, "startMapViwerThread" );
	}
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );
	ChangeForcusThreadId( -1 );
}

function startMapViwerThread() {

	local selected = -1;
	local map_view_menu = MenuPage();
	
	IncludeScriptFile( "stage\\stageFileList.nut" );
	
	
	local index = 0;
	local items = [
		MenuItemSelector( 0, index++, "Stage", gStageFileList, 0)
	];

	map_view_menu.addMenu(0, " MapViewer ");
	foreach( item in items ) {
		map_view_menu.addItemObj(item);
	}
	map_view_menu.addItem( 0, 1, "Quit" );
	
	// フォーカスを許可し、フォーカスがある時のみスレッドが動くようにする 
	EnableForcusThreadId( SQ_THREAD_GAME, true );
	SetPatternThreadId( SQ_THREAD_GAME, SQ_THREAD_PATTERN_ALWAYS );

	// ScreenFadeStart( 0x00000000, 1.0 );

	while (true)
	{
		while(true)
		{
			selected = map_view_menu.update();
			if(0<=selected)
			{
				break;
			}
			if(DebugPadIsTrigger(::PAD_BACK) || ihp.GetGameKeyboard().IsPush( 'X' ) )
			{
				break;
			}
			map_view_menu.draw( 400, 32, 22 );
			grahicsMouse();
			suspend();
		}
		
		//print("selected: " + selected);
		if(selected==1)
		{
			break;
		}
	
		// ゲームシード用意
		local game_seed = GameSeed();
		game_seed.getStageSeed().setStageBres(items[0].getValiable());

		// ステージのロード
		StageBresLoadRequestFromSeed( game_seed.getStageSeed() );
		while ( false == StageBresIsLoadComplete() )
		{
			suspend();
		}

		StageCollisionCreateAll();


		CreateMapViewer();

		//local windowSample_ = WindowBase( 64, 608, 256, 64 );
		//windowSample_.setWindowText( "Title Press X to Abort" );
		while(true)
		{
			suspend();
			
			//windowSample_.exec();
			//windowSample_.draw();
			grahicsMouse();
			
			if (DebugPadIsTrigger(::PAD_BACK) || ihp.GetGameKeyboard().IsPush( 'X' ) )
			{
				break;
			}
		}

		DestroyMapViewer();
		suspend();
		
		// ステージ消去 
		DestroyStage()
		suspend();

		if(DebugPadIsTrigger(::PAD_BACK) || ihp.GetGameKeyboard().IsPush( 'X' ) )
		{
			break;
		}
		
		EnableForcusThreadId( SQ_THREAD_GAME, false );
		suspend();
	}

	// ScreenFadeSet( 0x00000000 );
	suspend();
	debugMenuWakeup();
}










