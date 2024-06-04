{@type:function|@guid:f8c828c35df14ae287f3bbe90c772caa|@path:/排行/乖離率排行榜|@hash:9ea1c2b21208f9e96856eac42886d8d1}
SetBarMode(1);

// 這是一個自訂排行條件的範例
// 示範如何針對內建函數的回傳值進行排序
// 使用者可以自行替換成需要使用的函數
//
// Length是期數
//

input:
	Length(5, numericsimple, "計算期間");

retval = bias(Length);
