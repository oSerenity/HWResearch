/* XDASEA_Xm8R_SPsX */ 



function NetTestMemberList( title, enable_go )
{
	suspend();
	suspend();

	local menu = MenuPage();
	menu.addMenu( 0, title );
	menu.addItem( 0, 0, "Quit" );
	
	local time = 0;
	while( true ) {
		local selected = menu.update();

		local menu_item_offset = 0;
		menu.addItem( 0, menu_item_offset++, "Quit [" + time + "]" );
		
		local ready_to_go = false;
		if (enable_go) {
			ready_to_go = NetworkIsGameHostReadyToGo();
			if (ready_to_go) {
				menu.addItem( 0, menu_item_offset++, "Ready to go!!!" );
			} else {
				menu.addItem( 0, menu_item_offset++, "Please wait a moment..." );
			}
		} else {
			ready_to_go = NetworkIsGameClientReadyToGo();
		}
		menu.draw( 400, 32, 22 );
		
		++time;
		
		suspend();
		if (0==selected || 0!=NetworkGetEndResult()) {
			return false;		// 中断選択 
		}
		else if (enable_go) {
			// GameHost
			if (ready_to_go && 1==selected) {
				NetworkGoToGame();	// ゲームに移行 
				return true;		// 開始 
			}
		} else if (ready_to_go)
		{	// GameClient 
			NetworkGoToGame();	// ゲームに移行 
			return true;		// 開始 
		}
		
		local entry_index = 0;
		for(local i=0; i<16; ++i) {
			for (local j=0; j<4; ++j) {
				local find_member = NetworkGetMemberString(i,j);
				if (find_member!=null)
				{
					menu.addItem( 0, menu_item_offset + entry_index, i + ":" + j + " " + find_member );
					++entry_index;
				} else {
					break;
				}
			}
		}
		for (local i=entry_index; i<16; ++i)
		{
			menu.addItem( 0, menu_item_offset+i, "None" );
		}
	}
}


function NetTestCreateHost( signin_mask, flag )
{
	NetworkCreateHostForDebug( signin_mask, flag );
	suspend();
	
	local title = "[Host:";
	title += (flag&1) ? "TeamMode:" : "VsMode:";
	title += (flag&2) ? "WithoutBot] MemberList" : "WithBot] MemberList";

	return NetTestMemberList( title, true );
}

function NetTestSearchHost( signin_mask )
{
	NetworkSearchHostForDebug( signin_mask );
	suspend();

	local menu = MenuPage();
	menu.addMenu( 0, "Network Matching -> Search Host" );
	menu.addItem( 0, 0, "Quit" );

	local time = 0;
	while( true ) {
		local selected = menu.update();

		menu.addItem( 0, 0, "Quit [" + time + "]" );
		menu.draw( 400, 32, 22 );
		
		++time;
		
		suspend();
		if (0==selected) {
			break;
		}
		if (1<=selected) {
			NetworkSelectHost(selected-1);
			
			if (true == NetTestMemberList( "[Client] MemberList", false )) {
				return true;
			}
			
			break;
		}

		for(local i=0; i<10; ++i) {
			local find_session = NetworkGetSearchResultString(i);
			if (find_session!=null)
			{
				menu.addItem( 0, i+1, find_session );
			}
		}
	}

	return false;
}

