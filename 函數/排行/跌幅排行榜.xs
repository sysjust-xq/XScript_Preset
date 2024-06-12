{@type:function}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何針對特定欄位的N期減幅進行排序
// 使用者可以自行替換成需要使用的欄位
//
// Length是期數

input:
	Length(20, numericsimple, "計算期間");
 
retval = -rateofchange(GetField("收盤價"),Length);