{@type:function|@guid:f3f4a8b6adc7404fa1b5b478ddc82626|@path:/排行/收盤均價排行榜|@hash:18c2f367f52e8a7bd1641859562d2da9}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何針對特定欄位的N期平均進行排序
// 使用者可以自行替換成需要使用的欄位
//
// Length是期數

input:
	Length(3, numericsimple, "計算期間");

retval = Average(GetField("收盤價"),Length);

{
//如果想做均量的排行榜，只需要更換欄位為成交量：
retval = Average(GetField("成交量"),Length);
}