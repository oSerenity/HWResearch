/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// utility.
//
//--------------------------------------------------------------


// ルートテーブルに登録されたコマンドを表示する.
function printRootTable() {
	foreach( key, val in getroottable() ) {
		print( "key=" + key + ", val=" + val + "\n" );
	}
}

// valueを区間 [lower, upper) に収まるようにする.
function cycleValue(value, lower, upper) {
	local range = upper - lower;
	if( 0 == range ) {
		return lower;
	}

	value %= range;
	if( value < 0 ) {
		return lower + value + range;
	}

	return lower + value;
}

// マウスを描画.
function grahicsMouse() {

//	if (SQ_TARGET_XBOX==SQ_TARGET_CURRENT) {
//		return;
//	}
//
//	if (0!=GAME_IS_DEMO) {
//		return;
//	}
//	
//	local mouseButton = ihp.GetGameMouse().GetPressButton();
//	local mousePosX = ihp.GetGameMouse().GetPointX();
//	local mousePosY = ihp.GetGameMouse().GetPointY();
//
//	local cursor = GIBox();
//	cursor.SetRect( mousePosX - 8, mousePosY - 8, 16, 16 );
//	if( mouseButton ) {
//		cursor.SetRectColor( 255, 0, 0, 128 );
//	} else {
//		cursor.SetRectColor( 0, 255, 0, 128 );
//	}
//	cursor.Draw();

//	local gitb = GITextBox();
//	local offsetX = 0;
//	if( GetScreenWidth() / 2 < mousePosX ) {
//		offsetX = -96;
//	}
//	local offsetY = 0;
//	if( GetScreenHeight() / 2 < mousePosY ) {
//		offsetY = -FONT_HEIGHT;
//	}
//	gitb.SetRect( mousePosX + offsetX, mousePosY + offsetY, 96, FONT_HEIGHT );
//	gitb.SetRectColor( 0, 0, 0, 64 );
//	gitb.SetTextColor( 255, 255, 0, 255 )
//	gitb.Draw( mousePosX + ", " + mousePosY );
}

// エディットボックスを描画.
function grahicsEditBox() {
	local gieb = GIEditBox();
	if( gieb.HasFocus() ) {
		gieb.SetRect( 8, GetScreenHeight() - 264, GetScreenWidth() - 16, 256 );
		gieb.SetRectColor( 0, 0, 0, 128 );
		gieb.SetTextColor( 255, 255, 255, 255 );
		gieb.SetMargin( 8 );
		gieb.Draw();

		local gitb = GITextBox();
		gitb.SetRect( 8, GetScreenHeight() - 264 - (FONT_HEIGHT + 2), GetScreenWidth() - 16, FONT_HEIGHT );
		gitb.SetRectColor( 0, 0, 0, 128 );
		gitb.SetTextColor( 255, 255, 255, 255 )
		gitb.Draw( " F5: run." );
	}
}


