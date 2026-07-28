{@type:function}
// N日大小單買賣超金額

// 設定
Input:Days(5,NumericSimple,"計算天期(日)"); 
SetTotalBar(Days+10);

// 大小單
Value1=GetField("買進特大單金額", "D")-GetField("賣出特大單金額", "D");

// 因子
Value99=Summation(Value1,Days);
If Value99<>0 Then retVal = Value99;