{@type:function}
// N日內跌幅超過P%天數

// 設定
 
Input:Days(10,NumericSimple,"計算天期(日)");
Input:Ratio(-5,NumericSimple,"漲幅限制(%)");
SetTotalBar(Days+10);

// 因子
Value99=CountIf(GetField("漲跌幅", "D")<Ratio,Days);
If Value99<>0 Then retVal = Value99;