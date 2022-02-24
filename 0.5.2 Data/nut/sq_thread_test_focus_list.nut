/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// デバッグのフォーカス表示スレッド.
//
//--------------------------------------------------------------


// 現在ダレがフォーカスを持っているかを描画.
function graphicsDebugFocusList() {
	local gidfb = GIDebugForcusBox();
	gidfb.SetRect( 8, 8, 256, FONT_HEIGHT );
	gidfb.SetRectColor( 0, 0, 0, 128 );
	gidfb.SetTextColor( 255, 255, 255, 255 )
	
	local monitor = GraphicsGetMonitorCount();
	
	for (local i=0; i<monitor; ++i)
	{
		gidfb.Draw(i);
	}
}

// スレッド.
function debugFocusListThread() {
	
	if (0==GAME_IS_DEMO) {
		local loop = 1;
		while( loop ) {
			// フォーカスの表示
			graphicsDebugFocusList();
			suspend();
		}
	}
	
}
