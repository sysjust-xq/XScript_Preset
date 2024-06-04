{@type:function|@guid:21de79c68de449bfaa13668d15675404|@path:/排行/漲幅排行榜|@hash:b6805aa036b507cd47c981ac6a4f5cee}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何針對特定欄位的N期增幅進行排序
// 使用者可以自行替換成需要使用的欄位
//
// Length是期數

input:
	Length(20, numericsimple, "計算期間");
 
retval = rateofchange(GetField("收盤價"),Length);