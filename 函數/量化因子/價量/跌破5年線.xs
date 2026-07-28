{@type:function}
// 跌破5年線

// 設定
Input:Days(1200,NumericSimple,"計算天期(日)");
Var:ma(0);
Var:period_return(0);
settotalBar(1200);
 
// 因子
ma = average( GetField("收盤價", "D") ,Days) ;
Value99 = (GetField("收盤價", "D") / ma - 1)*100;
If Value99<>0 Then retVal = Value99;