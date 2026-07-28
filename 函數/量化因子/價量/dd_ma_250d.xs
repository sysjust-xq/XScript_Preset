{@type:function}
// dd_ma_250d

// 設定
Input:Days(250,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);
Var:dd(0);
Var:mdd(0);
Var:dd_ma(0);

// 計算
dd = close / Highest(C,Days) - 1;
if dd > 0 then dd = 0 ;

mdd = lowest(C,Days) / Highest(C,Days) - 1;
if mdd > 0 then mdd = 0 ;

dd_ma = average(dd ,Days);

// 因子
Value99 = dd_ma;
If Value99<>0 Then retVal = Value99;