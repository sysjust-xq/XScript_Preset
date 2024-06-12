{@type:function}
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
