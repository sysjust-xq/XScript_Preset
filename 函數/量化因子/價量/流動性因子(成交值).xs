{@type:function}
// 流動性因子(成交值)

// 設定
Var:vol_ind1(0);
Var:vol_ind2(0);
settotalBar(750);

// 計算
vol_ind1 = log(summation(GetField("成交金額(元)", "D"),20));
vol_ind2 = average( GetField("週轉率", "D") ,20);

// 因子
Value99 = vol_ind1;
If Value99<>0 Then retVal = Value99;