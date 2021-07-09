/* XDASEA_Xm8R_SPsX */ 
//
// JSONに関する設定を書くファイル. 
//


// 初期化時にオートロードされるJSONファイルのリスト 
// 拡張子 .json は省いてください 
gJsonInitializeLoadList <- [
	"Player#PlayerCamera"
	"Game#OutlineColorSetting"
]





// リストからJsonを読み込む関数 
function JsonLoadFromList( json_list ) {
	foreach( index, item in json_list ) {
		local pos = item.find("#");
		if (pos!=null)
		{
			local ins_name = item.slice(0,pos) + "," + item.slice(pos+1);
			local key =  item + ".json";
			local file = "json/" + key;
			JsonSerializeLoadFromFile( ins_name, file );
		}
	}
}

// 初期化時にオートオートロードするように指示 
JsonLoadFromList(gJsonInitializeLoadList);

