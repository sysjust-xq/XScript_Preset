{@type:function}
// 股價營收比_3

// 設定
Input:months(3,NumericSimple,"計算天期(月)");
//Input:Days2(60,NumericSimple,"計算天期(日)");
Var:revenue(0);
Var:sharess(0);
Var:RPS(0);
Var:pr_ratio(0);
settotalBar(120);

// ======================================================

// 計算
revenue = summation( GetField("月營收", "M"),months);
sharess = GetField("普通股股本", "Q") / 10 ;
RPS = revenue / sharess ;
pr_ratio = GetField("收盤價", "D") / RPS ;

// 因子
Value99 = pr_ratio ;
If Value99<>0 Then retVal = Value99;