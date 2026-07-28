{@type:function}
// 價量動能_20日

// 設定
Input:Days(20,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// 因子
Value99= (GetField("收盤價", "D") - GetField("收盤價", "D")[Days]) / summation(GetField("成交量", "D") ,Days)-1 ;
If Value99<>0 Then retVal = Value99;