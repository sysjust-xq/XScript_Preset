{@type:function}
// Empty_line指標_20d

// 設定
Input:Days(20,NumericSimple,"計算天期(日)");
SetTotalBar(Days+10);
Var:EL(0);
Var:EL_ma3(0);
Var:EL_ma6(0);
Var:EL_ma12(0);
Var:EL_ma24(0);
Var:EL_ratio(0);
Var:EL_ratio_ma(0);

// 計算
EL_ma3 = average(close ,3);
EL_ma6 = average(close ,6);
EL_ma12 = average(close ,12);
EL_ma24 = average(close ,24);

EL = (EL_ma3 + EL_ma6 + EL_ma12 + EL_ma24) / 4;
EL_ratio = close / EL;
EL_ratio_ma = average(EL_ratio ,Days);

// 因子
Value99 = EL_ratio_ma ;
If Value99<>0 Then retVal = Value99;