{@type:function}
// P_CFV

// 設定 
Var:VCF(0);
Var:p(0);
settotalBar(120);

// 計算
VCF = standardDev( GetField("來自營運之現金流量", "Q") / GetField("營業收入淨額", "Q") ,15,2);
p = GetField("總市值(元)", "D") /  VCF ;

// 因子
Value99 = p ;
If Value99<>0 Then retVal = Value99;