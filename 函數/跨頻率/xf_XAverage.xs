{@type:function}
SetBarMode(2);

// 跨頻率XAverage
//
// FreqType是預期要比對的期別, 支援"D", "W", "M"
// 輸入: FreqType, Series, Length
//
input:
	FreqType(string),		//引用頻率
	Series(numericseries),	//價格序列
	Length(numericsimple);	//計算期間
 
variable:
	Factor(0), lastXAverage(0);

 
condition1 = xf_getdtvalue(FreqType, getFieldDate("Date")) <> xf_getdtvalue(FreqType, getFieldDate("Date")[1]);
if condition1 then
	lastXAverage = xf_XAverage[1];

value1 = xf_GetCurrentBar(FreqType);

if Length + 1 = 0 then Factor = 1 else Factor = 2 / (Length + 1);

if value1 = 1 then
	xf_XAverage = Series
else
	xf_XAverage = lastXAverage + Factor * (Series - lastXAverage);
