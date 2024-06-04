{@type:function|@guid:8f6d04f6de7d45e4bb061907b95215e7|@path:/跨頻率/xf_EMA|@hash:e73456a3797098b318818d6d4c7e6890}
SetBarMode(2);

// 跨頻率EMA
//
// FreqType是預期要比對的期別, 支援"D", "W", "M"
// 輸入: FreqType, Series, Length
//
input:
	FreqType(string),		//引用頻率
	Series(numericseries),	//價格序列
	Length(numericsimple);	//計算期間
 
variable:
	Factor(0), lastEMA(0);

 
condition1 = xf_getdtvalue(FreqType, getFieldDate("Date")) <> xf_getdtvalue(FreqType, getFieldDate("Date")[1]);
if condition1 then
	lastEMA = xf_EMA[1];

value1 = xf_GetCurrentBar(FreqType);

if Length + 1 = 0 then Factor = 1 else Factor = 2 / (Length + 1);

if value1 = 1 then
	xf_EMA = Series
else if value1 <= Length then
    xf_EMA = (Series + (lastEMA * (value1 - 1)))/value1	
else
	xf_EMA = lastEMA + Factor * (Series - lastEMA);
	
	

 