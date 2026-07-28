{@type:function}
// 股價營利比_12

// 設定
Input:months(12,NumericSimple,"計算天期(月)");
Var:revenue(0);
Var:sharess(0);
Var:OPS(0);
Var:NPS(0);
Var:pr_ratio(0);
Var:operating_rate(0);
Var:operating_income(0);
settotalBar(120);

// ======================================================

// 計算
revenue = summation( GetField("月營收", "M"),months);

operating_rate = average( GetField("營業利益率", "Q") ,4)/100;
operating_income = revenue*operating_rate;

sharess = GetField("普通股股本", "Q") / 10 ;
 
OPS = operating_income / sharess ;

pr_ratio = GetField("收盤價", "D") / OPS ;

// 因子
Value99 = pr_ratio ;
If Value99<>0 Then retVal = Value99;