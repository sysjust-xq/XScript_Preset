{@type:function}
// 股價毛利比_3

// 設定
Input:months(3,NumericSimple,"計算天期(月)");
Var:revenue(0);
Var:sharess(0);
Var:GPS(0);

Var:pr_ratio(0);
Var:gross_margin_rate(0);
Var:gross_margin(0);
settotalBar(120);
// ======================================================

// 計算
revenue = summation( GetField("月營收", "M"),months);

gross_margin_rate = average( GetField("營業毛利率", "Q") ,4) /100;
gross_margin = revenue*gross_margin_rate;

sharess = GetField("普通股股本", "Q") / 10 ;
GPS = gross_margin / sharess ;

pr_ratio = GetField("收盤價", "D") / GPS ;

// 因子
Value99 = pr_ratio ;
If Value99<>0 Then retVal = Value99;