{@type:function}
// 外資10日買張佔股本比

// 設定
Input:Days(10,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);

// 因子
Value99 = summation( GetField("外資買張", "D"), Days) / GetField("股本(億)", "D") ;
If Value99<>0 Then retVal = Value99;