/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// window.
//
//--------------------------------------------------------------


class WindowBase {
	static HIT_NONE = 0;
	static HIT_WINDOW = 1;
	static HIT_CLIENT = 2;
	static HIT_TITLE = 3;

	windowArea_ = null;
	clientArea_ = null;
	titleArea_ = null;

	titleText_ = "";

	doragStartPos_ = null;
	dorag_ = false;

	constructor(x, y, width, height) {
		windowArea_ = GIBox();
		clientArea_ = GIBox();
		titleArea_ = GITextBox();
		doragStartPos_ = syzIVector2();

		windowArea_.SetRect( x, y, width, height );
		clientArea_.SetRect( x, y + ::FONT_HEIGHT + 2, width, height - (::FONT_HEIGHT + 2) );
		clientArea_.DeflateRect( 2 );
		titleArea_.SetRect( x, y, width, ::FONT_HEIGHT + 2 );
		titleArea_.DeflateRect( 2 );

		windowArea_.SetRectColor( 36, 163, 210, 128 );
		clientArea_.SetRectColor( 255, 255, 255, 128 );
		titleArea_.SetRectColor( 6, 240, 240, 128 );
		titleArea_.SetTextColor( 128, 0, 0, 128 );
	}

	function exec() {
		local mouseButton = ihp.GetGameMouse().GetPressButton();
		local mousePosX = ihp.GetGameMouse().GetPointX();
		local mousePosY = ihp.GetGameMouse().GetPointY();
		local hitResult = hitTest( mousePosX, mousePosY );

		if( HIT_TITLE == hitResult && (::MouseLBUTTON & mouseButton) ) {
			if( !dorag_ ) {
				doragStartPos_.x = mousePosX;
				doragStartPos_.y = mousePosY;
				dorag_ = true;
			}
		} else if( dorag_ && !(::MouseLBUTTON & mouseButton) ) {
			dorag_ = false;
		}

		if( dorag_ ) {
			local moveX = mousePosX - doragStartPos_.x;
			local moveY = mousePosY - doragStartPos_.y;
			windowArea_.Move( moveX, moveY );
			clientArea_.Move( moveX, moveY );
			titleArea_.Move( moveX, moveY );

			doragStartPos_.x = mousePosX;
			doragStartPos_.y = mousePosY;
		}
	}

	function draw() {
		windowArea_.Draw();
		clientArea_.Draw();
		titleArea_.Draw( titleText_ );
	}

	function setWindowText(text) {
		titleText_ = text;
	}

	function getWindowText() {
		return titleText_;
	}

	function hitTest(x, y) {
		if( windowArea_.IsInside( x, y ) ) {
			if( clientArea_.IsInside( x, y ) ) {
				return HIT_CLIENT;
			} else if( titleArea_.IsInside( x, y ) ) {
				return HIT_TITLE;
			}
			return HIT_WINDOW;
		}
		return HIT_NONE;
	}
}

