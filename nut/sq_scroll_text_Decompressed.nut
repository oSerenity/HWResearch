/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// 横方向にスクロールするテキスト.
//
//--------------------------------------------------------------

// メニュー入れ替えテスト.
function changeMenu03a() {
	globalMenu.addMenu( 3, "menu - a -" );
	globalMenu.addItemScript( 3, 0, "item_00", "fileName_stage02", "LoadResource" );
	globalMenu.addItemScript( 3, 1, "item_01", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 2, "item_02", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 3, "item_03", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 4, "item_04", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 5, "item_05", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 6, "item_06", "fileName_stage02", "CrateInstance" );
}

// メニュー入れ替えテスト.
function changeMenu03b() {
	globalMenu.addMenu( 3, "menu - b -" );
	globalMenu.addItemScript( 3, 0, "item_00", "fileName_stage02", "LoadResource" );
	globalMenu.addItemScript( 3, 1, "item_01", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 2, "item_02", "fileName_stage02", "CrateInstance" );
	globalMenu.addItemScript( 3, 3, "item_03", "fileName_stage02", "CrateInstance" );
}

// 入れ子からのsuspendテスト.
function innerSuspend() {
	suspend();
}

// ぐるぐるテキストのコア.
function scrollTextCore(x, y, text) {
	local gitb = GITextBox();
	gitb.SetRect( x, y, 256, 24 );
	gitb.SetRectColor( 0, 64, 0, 255 );
	gitb.SetTextColor( 255, 0, 255, 255 );

	local loop = 1;
	while( loop ) {
		x -= 16;
		if( x < -256 ) {
			x = 1600;
		}
		gitb.SetPosition( x, y );
		gitb.Draw( text );
		grahicsMouse();

		innerSuspend();
	}
}

// ぐるぐるテキスト.
function scrollText() {
	scrollTextCore( 1600, 512, "TestMessage." );
}
