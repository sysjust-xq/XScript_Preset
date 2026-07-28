{@type:function}
// N日內破低次數

// 設定

Input:Days(10,NumericSimple,"計算天期(日)");
SetTotalBar(Days+30);

// 因子
Value99=CountIf(C<Lowest(L[1],20),Days);
If Value99<>0 Then retVal = Value99;