//練習キャンペーンを作ろう！ 

function loadMission() 
{
	print("[sample mission] load()\n");

}


function startMission() 
{
	print("[sample mission] start()\n");


	scr_SetMessageCallback( "miscb_GameSetWinWhite", 1100, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_WHITE );	
	scr_SetMessageCallback( "miscb_GameSetWinBlack", 1200, CB_TYPE_ONCE, MESSAGE_GAME_SET_WIN_BLACK );

//	scr_BotPlayerRegistAndCreate( 101, "NOOB01", POWER_COLOR_WHITE );
//	scr_BotPlayerRegistAndCreate( 102, "MEDIC01", POWER_COLOR_WHITE );
//	scr_BotPlayerRegistAndCreate( 103, "MAGE01", POWER_COLOR_WHITE );

	//復活時間設定 
	scr_SetRebirthTime( SCR_REBIRTH_TARGET_BLACK, SCR_REBIRTH_TYPE_SPECIAL, 32 );


	scr_WaitStart( 1.0 );
	while( scr_Waiting() )
	{
		suspend();
	}

//	scr_BotPlayerSpawnToMonument( 101, "gcmoA_001" );
//	scr_BotPlayerSpawnToMonument( 102, "gcmoA_001" );
//	scr_BotPlayerSpawnToMonument( 103, "gcmoA_001" );
//
//	scr_BotPlayerSetActionTrigger( 101, true );
//	scr_BotPlayerSetActionTrigger( 102, true );
//	scr_BotPlayerSetActionTrigger( 103, true );


	mis_WaitGameStart(); 


}
function mis_WaitGameStart()
{
	while( GAME_STATE_PLAYING != scr_GetGamePlayingStatus() )
	{
		local state;					
		state = GetGamePlayingStatus();			
		
		print("[sample mission] mis_WaitGameStart state = " + state + "\n" );
		suspend();	
	}


}

//自分のチームが勝利した時のコールバック処理を書こう！
function miscb_GameSetWinWhite()
{
	print( "Game Set Win White!\n" );
	scr_RemoveCallbackAll();
	scr_GameSetMissionClear();	
	scr_CloseMissionConditionText( 0 );	//達成条件を非表示 

}


function miscb_GameSetWinBlack()
{
	print( "Game Set Win BLACK!\n" );
	scr_RemoveCallbackAll();
	scr_GameSetMissionFailure();
}
