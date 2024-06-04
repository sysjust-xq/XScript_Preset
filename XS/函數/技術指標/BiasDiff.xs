{@type:function|@guid:614da5d22ab340178b7f0d6bab7d3f6b|@path:/技術指標/BiasDiff}
SetBarMode(1);

{
Bias function (計算乖離率差值)
輸入兩個期間數值,計算並輸出此兩期間的乖離率差
Length1: 短期期數
Length2: 長期期數
}
input: length1(numericsimple),length2(numericsimple);

BiasDiff  = Bias(Length1) - Bias(Length2);
		