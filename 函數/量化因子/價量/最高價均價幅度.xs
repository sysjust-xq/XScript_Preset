{@type:function}
// 最高價均價幅度

// 設定
Input:Days(1,NumericSimple,"計算天期(日)");

// 因子
Value99 = GetField("最高價", "D") / GetField("均價", "D") ;
If Value99<>0 Then retVal = Value99;