{@type:function}
// N日小單買賣超金額

// 設定
Input:Days(20,NumericSimple,"計算天期(日)"); 
SetTotalBar(Days+10);
Value4=GetField("買進小單金額", "D")-GetField("賣出小單金額", "D");

// 因子
Value99=Summation(Value4,Days);
If Value99<>0 Then retVal = Value99;