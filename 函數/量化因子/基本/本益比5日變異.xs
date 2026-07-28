{@type:function}
// 本益比N日變異

// 設定
Input:Days(5,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// 因子
Value99=100*(GetField("本益比", "D")/GetField("本益比", "D")[Days]-1) ;
If Value99<>0 Then retVal = Value99;