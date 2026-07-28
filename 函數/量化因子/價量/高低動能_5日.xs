{@type:function}
// 高低動能_5日

// 設定
Input:Days(5,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// 因子
Value99= (GetField("收盤價", "D") / FastLowest(GetField("收盤價", "D") ,Days)) / (FastHighest(GetField("收盤價", "D") ,Days) -  FastLowest(GetField("收盤價", "D") ,Days))  ;
If Value99<>0 Then retVal = Value99;