{@type:function}
// calmar_ratio_250d

// 設定
Input:Days(250,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);
Var:dd(0);
Var:mdd(0);
Var:dd_ma(0);
Var:period_return(0);

// 計算
period_return = GetField("收盤價", "D") / GetField("收盤價", "D")[Days] -1;

dd = close / Highest(C,Days) - 1;
if dd > 0 then dd = 0 ;

mdd = lowest(C,Days) / Highest(C,Days) - 1;
if mdd > 0 then mdd = 0 ;

// 因子
Value99 = period_return / mdd ;
If Value99<>0 Then retVal = Value99;