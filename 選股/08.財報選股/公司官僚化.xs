{@type:filter}
// 連續4期[管理費用/營業收入淨額的比例]成長
//
//input:TXT("僅適用季資料"); setinputname(1,"使用限制");
setbarfreq("Q");

if barfreq <> "Q" then raiseruntimeerror("頻率錯誤");

settotalbar(3);

Ret = TrueAll(
	GetField("管理費用","Q")/GetField("營業收入淨額","Q") > 
	GetField("管理費用","Q")[1]/GetField("營業收入淨額","Q")[1], 4);








