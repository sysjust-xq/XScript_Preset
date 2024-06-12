{@type:function}
SetBarMode(1);

{
Bias function (計算乖離率差值)
輸入兩個期間數值,計算並輸出此兩期間的乖離率差
Length1: 短期期數
Length2: 長期期數
}
input: length1(numericsimple),length2(numericsimple);

BiasDiff  = Bias(Length1) - Bias(Length2);
		