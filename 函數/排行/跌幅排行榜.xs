{@type:function|@guid:72af3195150d41ae9a7c2d266f51a469|@path:/排行/跌幅排行榜|@hash:6a0c7c1894724ab23365c6d8b95a8b9b}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何針對特定欄位的N期減幅進行排序
// 使用者可以自行替換成需要使用的欄位
//
// Length是期數

input:
	Length(20, numericsimple, "計算期間");
 
retval = -rateofchange(GetField("收盤價"),Length);