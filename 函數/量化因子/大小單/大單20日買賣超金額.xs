{@type:function}
// N日大單買賣超金額

// 設定
Input: Days(20,NumericSimple,"計算天期(日)"); 
SetTotalBar(Days+10);

// 大小單
Value2=GetField("買進大單金額", "D")-GetField("賣出大單金額", "D");

// 因子
Value99=Summation(Value2,Days);
If Value99<>0 Then retVal = Value99;