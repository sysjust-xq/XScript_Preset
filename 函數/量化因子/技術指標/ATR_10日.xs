{@type:function}
// ATR_10日

// 設定
Input:Days(10,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// 因子
Value99 = ATR(Days)  ;
If Value99<>0 Then retVal = Value99;