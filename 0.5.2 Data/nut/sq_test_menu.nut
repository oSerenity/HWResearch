/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// メニュークラス.
//
//--------------------------------------------------------------

// メニューアイテム.
class MenuItem {
	category_ = -1;
	ID_ = -1;
	title_ = "";
	
	constructor(category, ID, title) {
		category_ = category;
		ID_ = ID;
		title_ = title;
	}
	
	function exec() {
	}
	
	function input_key( vk ) {
	}
	
	function getTitleString() {
		return title_;
	}
	
	function _tostring() {
		return title_;
	}
}

class MenuItemScript extends MenuItem {	
	fileName_ = "";
	funcName_ = "";

	constructor(category, ID, title, fileName, funcName) {
		::MenuItem.constructor( category, ID, title );
		fileName_ = fileName;
		funcName_ = funcName;
	}

	function exec() {
		if( fileName_ != null && funcName_ != null)
		{
			RunScriptFile( ::SQ_THREAD_OTHER, fileName_, funcName_ );
		}
	}

	function _tostring() {
		return title_ + ": " + fileName_ + ": " + funcName_;
	}
}

class MenuItemBool extends MenuItem {	
	getter_ = "";
	setter_ = "";

	constructor(category, ID, title, getter, setter) {
		::MenuItem.constructor( category, ID, title );
		getter_ = getter;
		setter_ = setter;
	}

	function exec() {
		if( getter_ != null && setter_ != null)
		{
			setter_( !getter_() );
		}
	}
	
	function input_key( vk ) {
		exec();
	}
	
	function getTitleString() {
		return "[" + getter_() + "] " + title_;
	}
	
	function _tostring() {
		return getTitleString();
	}
}

class MenuItemSelector extends MenuItem {
	index_ = 0;
	list_ = null;
	
	constructor( category, ID, title, list, index ) {
		::MenuItem.constructor( category, ID, title );
		index_ = index;
		list_ = list;
	}
	
	function exec() {
	//	++index_;
	//	if (list_.len() <= index_)
	//	{
	//		index_ = 0;
	//	}
	}
	
	function input_key( vk ) {
		if ( vk == ::VK_LEFT ) {
			input_prev_key();
		} else if ( vk == ::VK_RIGHT ) {
			input_next_key();
		}
	}
	
	function input_prev_key() {
		--index_;
		if (index_<0)
		{
			index_ = list_.len() - 1;
		}
	}
	
	function input_next_key() {
		++index_;
		if (list_.len() <= index_)
		{
			index_ = 0;
		}
	}
	
	function getTitleString() {
		return title_ + " [" + index_ + ":" + list_[index_] + "]";
	}
	
	function _tostring() {
		return getTitleString();
	}
	
	function getValiable() {
		return list_[index_];
	}
	
	function setValiable( val ) {
		index_ = 0;
		foreach( index, v in list_ ) {
			if (v == val)
			{
				index_ = index;
				break;
			}
		}
	}
	
	function getIndex() {
		return index_;
	}
	
	function setIndex( index ) {
		index_ = index;
	}
}

class MenuItemSelector2 extends MenuItem {
	index_ = 0;
	getter_ = null;
	setter_ = null;
	getterSize_ = null;
	size_ = 0;
	value_ = 0.0;
	
	constructor( category, ID, title, getter, setter, size ) {
		::MenuItem.constructor( category, ID, title );
		index_ = 0;
		getter_ = getter;
		setter_ = setter;
		getterSize_ = size;
		size_ = 0;
		value_ = 0.0;
	}
	
	function exec() {
	}
	
	function input_key( vk ) {
		if ( vk == ::VK_LEFT ) {
			input_prev_key();
			if( setter_ ) {
				setter_( index_, 0, 0.0 );
			}
		} else if ( vk == ::VK_RIGHT ) {
			input_next_key();
			if( setter_ ) {
				setter_( index_, 0, 0.0 );
			}
		} else if( vk == ::PAD_X ) {
			value_ -= 0.01;
			if( value_ <= 0.0 ) {
				value_ = 0.01;
			}
			if( setter_ ) {
				setter_( index_, 1, value_ );
			}
		} else if( vk == ::PAD_B ) {
			value_ += 0.01;
			if( setter_ ) {
				setter_( index_, 1, value_ );
			}
		}
	}
	
	function input_prev_key() {
		--index_;
		if (index_<0)
		{
			index_ = size_ - 1;
		}
	}
	
	function input_next_key() {
		++index_;
		if (size_ <= index_)
		{
			index_ = 0;
		}
	}
	
	function getTitleString() {
		if( getterSize_ ) {
			size_ = getterSize_( 1 );
			index_ = getterSize_( 0 );
		}
		
		local bound = size_ - 1;
		if( bound < 0 ) {
			bound = 0;
		}
		
		if( getter_ ) {
			local s = getter_( index_, 1 );
			value_ = s.tofloat();
			return title_ + " [" + index_ + "/" + bound + ":" + getter_(index_, 0) + "(" + value_ + ")]";
		} else {
			return title_ + " [" + index_ + "/" + bound + ":]";
		}
	}
	
	function _tostring() {
		return getTitleString();
	}
}

class MenuItemSelector2_2 extends MenuItem {
	getter_ = null;
	setter_ = null;
	value_ = 0;
	
	constructor( category, ID, title, getter, setter ) {
		::MenuItem.constructor( category, ID, title );
		getter_ = getter;
		setter_ = setter;
		value_ = 0;
	}
	
	function exec() {
	}
	
	function input_key( vk ) {
		if ( vk == ::VK_LEFT ) {
			input_prev_key();
		} else if ( vk == ::VK_RIGHT ) {
			input_next_key();
		} else if( vk == ::PAD_X ) {
			value_ -= 1;
			if( setter_ ) {
				setter_( 0, 1, value_.tofloat() );
			}
		} else if( vk == ::PAD_B ) {
			value_ += 1;
			if( setter_ ) {
				setter_( 0, 1, value_.tofloat() );
			}
		}
	}
	
	function input_prev_key() {
	}
	
	function input_next_key() {
	}
	
	function getTitleString() {
		if( getter_ ) {
			local s = getter_( 0, 1 );
			value_ = s.tointeger();
			return title_ + " [" + value_ + "]";
		} else {
			return title_ + " []";
		}
	}
	
	function _tostring() {
		return getTitleString();
	}
}

class MenuItemSelector3 extends MenuItem {
	index_ = 0;
	getter_ = null;
	setter_ = null;
	getterSize_ = null;
	size_ = 0;
	
	constructor( category, ID, title, getter, setter, size ) {
		::MenuItem.constructor( category, ID, title );
		index_ = 0;
		getter_ = getter;
		setter_ = setter;
		getterSize_ = size;
		size_ = 0;
	}
	
	function exec() {
	}
	
	function input_key( vk ) {
		if ( vk == ::VK_LEFT ) {
			input_prev_key();
			if( setter_ ) {
				setter_( index_ );
			}
		} else if ( vk == ::VK_RIGHT ) {
			input_next_key();
			if( setter_ ) {
				setter_( index_ );
			}
		}
	}
	
	function input_prev_key() {
		--index_;
		if (index_<0)
		{
			index_ = size_ - 1;
		}
	}
	
	function input_next_key() {
		++index_;
		if (size_ <= index_) {
			index_ = 0;
		}
	}
	
	function getTitleString() {
		if( getterSize_ ) {
			size_ = getterSize_();
		}
		
		local bound = size_ - 1;
		if( bound < 0 ) {
			bound = 0;
		}
		
		if( getter_ ) {
			local s = getter_( index_ );
			return title_ + " [" + index_ + "/" + bound + ": " + getter_(index_) + "]";
		} else {
			return title_ + " [" + index_ + "/" + bound + ": INVALID]";
		}
	}
	
	function _tostring() {
		return getTitleString();
	}
}

class MenuValueRange extends MenuItem {
	value_ = 0;
	minv_ = 0;
	maxv_ = 0;
	
	function min( a, b ) {
		return a<b ? a : b;
	}
	
	function max( a, b ) {
		return a>b ? a : b;
	}
	
	constructor( category, ID, title, value, minv, maxv ) {
		::MenuItem.constructor( category, ID, title );
		value_ = max( minv, min( value, maxv ) );
		minv_ = minv;
		maxv_ = maxv;
	}

	function input_key( vk ) {
		if ( vk == ::VK_LEFT ) {
			--value_;
			if (value_<minv_)
			{
				value_ = maxv_;
			}
		} else if ( vk == ::VK_RIGHT ) {
			++value_;
			if (maxv_ < value_)
			{
				value_ = minv_;
			}
		}
	}

	function getTitleString() {
		return title_ + " " + value_ ;
	}
	
	function _tostring() {
		return getTitleString();
	}
	
	function getValiable() {
		return value_;
	}
	function setValiable( val ) {
		value_ = val;
	}
	function getIndex() {
		return value_;
	}
	function setIndex( index ) {
		value_ = index;
	}
}


// メニュー.
class MenuList {
	static MAX_MENU = 64;
	menuArray_ = null;
	num_ = 0;
	cursor_ = 0;
	selected_ = -1;
	category_ = -1;
	title_ = "";

	constructor(category, title) {
		menuArray_ = array( MAX_MENU );
		num_ = 0;
		cursor_ = 0;
		selected_ = -1;
		category_ = category;
		title_ = title;
	}

	function addItemObj(newItem) {
		foreach( index, item in menuArray_ ) {
			if( item != null && menuArray_[index].ID_ == newItem.ID_ ) {
				menuArray_[index] = newItem;
				return;
			} else if( item == null ) {
				menuArray_[index] = newItem;
				++num_;
				return;
			}
		}

		print( "fail: addItem. \n" );
	}

	function addItem(category, ID, title) {
		addItemObj( MenuItem( category, ID, title ) );
	}
	
	function addItemScript(category, ID, title, fileName, funcName) {
		addItemObj( MenuItemScript( category, ID, title, fileName, funcName ) );
	}

	function update() {
		selected_ = -1;
		if( ihp.GetGameKeyboard().IsPush( ::VK_UP ) || DebugPadIsRepeat(::PAD_UP)) {
			cursor_ = cycleValue( cursor_ - 1, 0, num_);
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( ::VK_DOWN )  || DebugPadIsRepeat(::PAD_DOWN)) {
			cursor_ = cycleValue( cursor_ + 1, 0, num_);
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( ::VK_LEFT )  || DebugPadIsRepeat(::PAD_LEFT)) {
			menuArray_[cursor_].input_key( ::VK_LEFT );
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( ::VK_RIGHT )  || DebugPadIsRepeat(::PAD_RIGHT)) {
			menuArray_[cursor_].input_key( ::VK_RIGHT );
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( 'X' ) || DebugPadIsRepeat(::PAD_X)) {
			menuArray_[cursor_].input_key( ::PAD_X );
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( 'B' ) || DebugPadIsRepeat(::PAD_B)) {
			menuArray_[cursor_].input_key( ::PAD_B );
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( 'Y' ) || DebugPadIsRepeat(::PAD_Y)) {
			menuArray_[cursor_].input_key( ::PAD_Y );
			SE_MoveCursor();
		} else if( ihp.GetGameKeyboard().IsPush( ::VK_RETURN )  || DebugPadIsTrigger(::PAD_A)) {
			cursor_ = cycleValue( cursor_, 0, num_);
			selected_ = cursor_;
			menuArray_[cursor_].exec();
			SE_Ok();
		}
		return selected_;
	}
	
	function currentTitle() {
		if ( 0 <= selected_) {
			return menuArray_[selected_].title_;
		} else {
			return null;
		}
	}

	function draw(x, y, font_height) {
		local mouseButton = ihp.GetGameMouse().GetPressButton();
		local mousePosX = ihp.GetGameMouse().GetPointX();
		local mousePosY = ihp.GetGameMouse().GetPointY();
		local w = 512;
		local vertStep = font_height + 2;
		local gitb = GITextBox();
		gitb.SetRect( x, y, w, font_height );
		gitb.SetRectColor( 0, 0, 64, 128 );
		gitb.SetTextColor( 255, 255, 255, 255 );
		gitb.Draw( "Category " + category_ + ": " + title_ );
		x += w / 10;
		y += vertStep;
		local line = 0;
		foreach( index, item in menuArray_ ) {
			if( item != null ) {
				if( selected_ == index ) {
					gitb.SetRect( x, y, w, font_height );
					gitb.SetRectColor( 128, 128, 128, 128 );
					gitb.SetTextColor( 255, 0, 0, 255 );
					if( gitb.IsInside( mousePosX, mousePosY ) ) {
						gitb.SetRectColor( 0, 128, 0, 128 );
						if( mouseButton & ::MouseLBUTTON ) {
							gitb.SetRectColor( 0, 128, 128, 128 );
							cursor_ = index;
						}
					}
					gitb.Draw( "[" + line + "] " + menuArray_[index].getTitleString() );
				} else if( cursor_ == index ) {
					gitb.SetRect( x, y, w, font_height );
					gitb.SetRectColor( 0, 0, 128, 128 );
					gitb.SetTextColor( 255, 255, 0, 255 );
					if( gitb.IsInside( mousePosX, mousePosY ) ) {
						gitb.SetRectColor( 0, 128, 0, 128 );
						if( mouseButton & ::MouseLBUTTON ) {
							gitb.SetRectColor( 0, 128, 128, 128 );
							cursor_ = index;
						}
					}
					gitb.Draw( "[" + line + "] " + menuArray_[index].getTitleString() );
				} else {
					gitb.SetRect( x, y, w, font_height );
					gitb.SetRectColor( 0, 0, 64, 128 );
					gitb.SetTextColor( 255, 255, 255, 255 );
					if( gitb.IsInside( mousePosX, mousePosY ) ) {
						gitb.SetRectColor( 0, 128, 0, 128 );
						if( mouseButton & ::MouseLBUTTON ) {
							gitb.SetRectColor( 0, 128, 128, 128 );
							cursor_ = index;
						}
					}
					gitb.Draw( "[" + line + "] " + menuArray_[index].getTitleString() );
				}
				y += vertStep;
				++line;
				// if( 40 < line ) { break; }
			}
		}
	}
}

// カテゴリ別表示機能を持ったメニュー.
class MenuPage {
	static MAX_MENU = 64;
	menuArray_ = null;
	num_ = 0;
	cursor_ = 0;

	constructor() {
		menuArray_ = array( MAX_MENU );
		num_ = 0;
		cursor_ = 0;
	}

	function addMenuObj(newMenu) {
		foreach( index, item in menuArray_ ) {
			if( item != null && menuArray_[ index ].category_ == newMenu.category_ ) {
				menuArray_[ index ] = newMenu;
				return;
			} else if( item == null ) {
				menuArray_[ index ] = newMenu;
				++num_;
				return;
			}
		}

		print( "fail: addMenu. \n" );
	}
	
	function clearMenu() {
		menuArray_ = array( MAX_MENU );
		num_ = 0;
		cursor_ = 0;
	}

	function addMenu(category, title) {
		addMenuObj( MenuList( category, title ) );
	}

	function addItemObj(newItem) {
		foreach( index, item in menuArray_ ) {
			if( item != null && menuArray_[ index ].category_ == newItem.category_ ) {
				menuArray_[ index ].addItemObj( newItem );
				break;
			}
		}
	}

	function addItem(category, ID, title) {
		addItemObj( MenuItem( category, ID, title ) );
	}

	function addItemScript(category, ID, title, fileName, funcName) {
		addItemObj( MenuItemScript( category, ID, title, fileName, funcName ) );
	}

	function currentTitle() {
		if( menuArray_[ cursor_ ] != null ) {
			return menuArray_[ cursor_ ].currentTitle();
		}
		return null;
	}
	
	function currentPage() {
		return cursor_;
	}

	function update() {
		if( ihp.GetGameKeyboard().IsPush( ::VK_NEXT ) || DebugPadIsRepeat(::PAD_LT)) {
			cursor_ = cycleValue( cursor_ - 1, 0, num_);
		} else if( ihp.GetGameKeyboard().IsPush( ::VK_PRIOR ) || DebugPadIsRepeat(::PAD_RT)) {
			cursor_ = cycleValue( cursor_ + 1, 0, num_);
		}

		if( menuArray_[ cursor_ ] != null ) {
			return menuArray_[ cursor_ ].update();
		}
		return -1;
	}

	function draw(x, y, font_height) {
		if( menuArray_[ cursor_ ] != null ) {
			menuArray_[ cursor_ ].draw( x, y, font_height );
		}
	}
}



