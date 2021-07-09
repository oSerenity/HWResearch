/* XDASEA_Xm8R_SPsX */ 
//--------------------------------------------------------------
//
// INIFILEセレクター.
//
//--------------------------------------------------------------

gIniFileList <- [
	MenuItemScript( 0, 0, "==Reload Effect Resource==", "nut\\sq_lib_gfx.nut", "ReloadGfxAllFromMenuItem" ),
	MenuItemScript( 0, 1, "==Reload Stage Effect ==", "nut\\sq_lib_stage.nut", "ReloadStageEffectArrangeFromMenuItem" ),
	MenuItemBool( 0, 2,  "Local Character Model",		function() { return IniBoolGetter(0); }, function(sw){ IniBoolSetter(0,sw) } ),
	MenuItemBool( 0, 3,  "Local Character Motion", 		function() { return IniBoolGetter(1); }, function(sw){ IniBoolSetter(1,sw) } ),
	MenuItemBool( 0, 4,  "Local Stage Model",			function() { return IniBoolGetter(2); }, function(sw){ IniBoolSetter(2,sw) } ),
	MenuItemBool( 0, 5,  "Local Gimmick Model",			function() { return IniBoolGetter(3); }, function(sw){ IniBoolSetter(3,sw) } ),
	MenuItemBool( 0, 6,  "Local Effect",				function() { return IniBoolGetter(4); }, function(sw){ IniBoolSetter(4,sw) } ),
	MenuItemBool( 0, 7,  "Local Json",					function() { return IniBoolGetter(5); }, function(sw){ IniBoolSetter(5,sw) } ),
	MenuItemBool( 0, 8,  "Local Nut",					function() { return IniBoolGetter(6); }, function(sw){ IniBoolSetter(6,sw) } ),
	MenuItemBool( 0, 9,  "Local Scaleform",				function() { return IniBoolGetter(17); }, function(sw){ IniBoolSetter(17,sw) } ),
	MenuItemBool( 0, 10, "Local Campaign",				function() { return IniBoolGetter(47); }, function(sw){ IniBoolSetter(47,sw) } ),
	MenuItemBool( 1, 0, "PerfPrint",					function() { return IniBoolGetter(7); }, function(sw){ IniBoolSetter(7,sw) } ),
	MenuItemBool( 1, 1, "ActorPrint",					function() { return IniBoolGetter(8); }, function(sw){ IniBoolSetter(8,sw) } ),
	MenuItemBool( 1, 2, "ModelPrint",					function() { return IniBoolGetter(9); }, function(sw){ IniBoolSetter(9,sw) } ),
	MenuItemBool( 1, 3, "NetPrint",						function() { return IniBoolGetter(10); }, function(sw){ IniBoolSetter(10,sw) } ),
	MenuItemBool( 1, 4, "HudDraw",						function() { return IniBoolGetter(11); }, function(sw){ IniBoolSetter(11,sw) } ),
	MenuItemBool( 1, 5, "TrapDraw",						function() { return IniBoolGetter(12); }, function(sw){ IniBoolSetter(12,sw) } ),
	MenuItemBool( 1, 6, "GimmickNameDraw",				function() { return IniBoolGetter(13); }, function(sw){ IniBoolSetter(13,sw) } ),
	MenuItemBool( 1, 7, "GimmickTest",					function() { return IniBoolGetter(14); }, function(sw){ IniBoolSetter(14,sw) } ),
	MenuItemBool( 1, 8, "AudioEnable",					function() { return IniBoolGetter(18); }, function(sw){ IniBoolSetter(18,sw) } ),
	MenuItemBool( 1, 9, "FxDisp",						function() { return IniBoolGetter(41); }, function(sw){ IniBoolSetter(41,sw) } ),
	MenuItemBool( 1, 10, "FxCreate",					function() { return IniBoolGetter(19); }, function(sw){ IniBoolSetter(19,sw) } ),
	MenuItemBool( 1, 11, "FxDraw",						function() { return IniBoolGetter(20); }, function(sw){ IniBoolSetter(20,sw) } ),
	MenuItemBool( 1, 12, "StageFxCreate",				function() { return IniBoolGetter(21); }, function(sw){ IniBoolSetter(21,sw) } ),
	MenuItemBool( 1, 13, "CharaAccesary",				function() { return IniBoolGetter(22); }, function(sw){ IniBoolSetter(22,sw) } ),
	MenuItemBool( 1, 14, "StageAreaDraw",				function() { return IniBoolGetter(35); }, function(sw){ IniBoolSetter(35,sw) } ),
	MenuItemBool( 1, 15, "ScriptAreaDraw",				function() { return IniBoolGetter(45); }, function(sw){ IniBoolSetter(45,sw) } ),
	MenuItemBool( 1, 16, "DebugLog ItemReward",			function() { return IniBoolGetter(36); }, function(sw){ IniBoolSetter(36,sw) } ),
	MenuItemBool( 1, 17, "DebugLog Experience",			function() { return IniBoolGetter(37); }, function(sw){ IniBoolSetter(37,sw) } ),
	MenuItemBool( 1, 18, "DebugLog HeroPopup",			function() { return IniBoolGetter(38); }, function(sw){ IniBoolSetter(38,sw) } ),
	MenuItemBool( 1, 19, "DebugLog Quest",				function() { return IniBoolGetter(51); }, function(sw){ IniBoolSetter(51,sw) } ),
	MenuItemBool( 1, 20, "DebugShow GameRecord",		function() { return IniBoolGetter(40); }, function(sw){ IniBoolSetter(40,sw) } ),
	MenuItemBool( 1, 21, "DebugShow ScriptInfomation",	function() { return IniBoolGetter(48); }, function(sw){ IniBoolSetter(48,sw) } ),
	MenuItemBool( 1, 22, "isDrawPrimitive",	        	function() { return IniBoolGetter(46); }, function(sw){ IniBoolSetter(46,sw) } ),
	MenuItemBool( 2, 0, "JC_Gimmick Camera Param",		function() { return IniBoolGetter(34); }, function(sw){ IniBoolSetter(34,sw) } ),
	MenuItemBool( 2, 1, "Path Editor",					function() { return IniBoolGetter(15); }, function(sw){ IniBoolSetter(15,sw) } ),
	MenuItemBool( 2, 2, "Navi Mesh Editor",				function() { return IniBoolGetter(16); }, function(sw){ IniBoolSetter(16,sw) } ),
	MenuItemBool( 2, 3, "Height Map Editor",			function() { return IniBoolGetter(39); }, function(sw){ IniBoolSetter(39,sw) } ),
	MenuItemBool( 2, 4, "Use Navigation Mesh",			function() { return IniBoolGetter(42); }, function(sw){ IniBoolSetter(42,sw) } ),
	MenuItemBool( 2, 5, "Use Height Map",				function() { return IniBoolGetter(43); }, function(sw){ IniBoolSetter(43,sw) } ),
	MenuItemBool( 2, 6, "Collision Climb Angle",		function() { return IniBoolGetter(44); }, function(sw){ IniBoolSetter(44,sw) } ),
	MenuItemBool( 3, 0, "CReport",						function() { return IniBoolGetter(33); }, function(sw){ IniBoolSetter(33,sw) } ),
	MenuItemBool( 3, 1, "LogToConsole",					function() { return IniBoolGetter(23); }, function(sw){ IniBoolSetter(23,sw) } ),
	MenuItemBool( 3, 2, "LogSystem",					function() { return IniBoolGetter(24); }, function(sw){ IniBoolSetter(24,sw) } ),
	MenuItemBool( 3, 3, "LogGame",						function() { return IniBoolGetter(25); }, function(sw){ IniBoolSetter(25,sw) } ),
	MenuItemBool( 3, 4, "LogPlayer",					function() { return IniBoolGetter(26); }, function(sw){ IniBoolSetter(26,sw) } ),
	MenuItemBool( 3, 5, "LogGimmick",					function() { return IniBoolGetter(27); }, function(sw){ IniBoolSetter(27,sw) } ),
	MenuItemBool( 3, 6, "LogCollision",					function() { return IniBoolGetter(28); }, function(sw){ IniBoolSetter(28,sw) } ),
	MenuItemBool( 3, 7, "LogBot",						function() { return IniBoolGetter(29); }, function(sw){ IniBoolSetter(29,sw) } ),
	MenuItemBool( 3, 8, "LogSquirrel",					function() { return IniBoolGetter(30); }, function(sw){ IniBoolSetter(30,sw) } ),
	MenuItemBool( 3, 9, "LogScaleForm",					function() { return IniBoolGetter(31); }, function(sw){ IniBoolSetter(31,sw) } ),
	MenuItemBool( 3,10, "LogSyz",						function() { return IniBoolGetter(32); }, function(sw){ IniBoolSetter(32,sw) } ),
	MenuItemSelector2( 4, 0, "Gamma red",				function(sw,sw2) { return CameraStringLabelGetter(0,sw,sw2); }, function(sw,sw2,i){ CameraStringLabelSetter(0,sw,sw2,i); }, function(sw){ return CameraStringLabelMax(0,sw); } ),
	MenuItemSelector2( 4, 1, "Gamma green",				function(sw,sw2) { return CameraStringLabelGetter(1,sw,sw2); }, function(sw,sw2,i){ CameraStringLabelSetter(1,sw,sw2,i); }, function(sw){ return CameraStringLabelMax(1,sw); } ),
	MenuItemSelector2( 4, 2, "Gamma blue",				function(sw,sw2) { return CameraStringLabelGetter(2,sw,sw2); }, function(sw,sw2,i){ CameraStringLabelSetter(2,sw,sw2,i); }, function(sw){ return CameraStringLabelMax(2,sw); } ),
	MenuItemSelector2_2( 4, 3, "Gamma offset brightness",	function(sw,sw2) { return CameraStringLabelGetter(3,sw,sw2); }, function(sw,sw2,i){ CameraStringLabelSetter(3,sw,sw2,i); } ),
	
	MenuItemBool(		5, 0, "BannerText",				function()		{ return IniBoolGetter(49); },				function(sw){ IniBoolSetter(49,sw) } ),
	MenuItemSelector3(	5, 1, "BannerText Request",		function(sw)	{ return BannerTextRequestGetter(sw); },	function(sw){ BannerTextRequestSetter(sw); },	function(){ return BannerTextRequestMax(); } ),
	MenuItemBool(		5, 2, "HeroPopUp",				function()		{ return IniBoolGetter(50); },				function(sw){ IniBoolSetter(50,sw) } ),
	MenuItemSelector3(	5, 3, "HeroPopUp Kind",			function(sw)	{ return HeroPopUpGetter(sw); },			function(sw){ HeroPopUpSetter(sw); },			function(){ return HeroPopUpMax(); } ),
	MenuItemBool( 5, 4, "DebugHUD HeroPopup",			function()		{ return IniBoolGetter(52); }, function(sw){ IniBoolSetter(52,sw) } ),
	MenuItemBool( 5, 5, "DebugHUD LevelUp",				function()		{ return IniBoolGetter(53); }, function(sw){ IniBoolSetter(53,sw) } ),
	MenuItemBool( 5, 6, "DebugHUD BannerText",			function()		{ return IniBoolGetter(54); }, function(sw){ IniBoolSetter(54,sw) } ),
	MenuItemBool( 5, 7, "DebugHUD VoiceReaction",		function()		{ return IniBoolGetter(55); }, function(sw){ IniBoolSetter(55,sw) } ),
	MenuItemBool( 5, 8, "DebugHUD PresentBox",			function()		{ return IniBoolGetter(56); }, function(sw){ IniBoolSetter(56,sw) } ),
	MenuItemBool( 5, 9, "DebugHUD SkillHelp",			function()		{ return IniBoolGetter(57); }, function(sw){ IniBoolSetter(57,sw) } ),
	
]


function iniSelectorThread() {
	
	local iniSelectorMenu = MenuPage();
	iniSelectorMenu.addMenu( 0, "Setting" );
	iniSelectorMenu.addMenu( 1, "Screen Setting" );
	iniSelectorMenu.addMenu( 2, "Tools" );
	iniSelectorMenu.addMenu( 3, "Logs Setting" );
	iniSelectorMenu.addMenu( 4, "Camera Setting" );
	iniSelectorMenu.addMenu( 5, "HUD Check" );
	foreach( index, item in gIniFileList ) {
		iniSelectorMenu.addItemObj( item );
	}

	EnableForcusThreadId( SQ_THREAD_INI_SELECTOR, true );
	while( true )
	{
		while( OnForcusThreadId( SQ_THREAD_INI_SELECTOR ) ) {
			local selected = iniSelectorMenu.update();
			iniSelectorMenu.draw( 400, 32, 22 );
			grahicsMouse();
			suspend();
		}
		suspend();
	}
	EnableForcusThreadId( SQ_THREAD_INI_SELECTOR, false );
}

