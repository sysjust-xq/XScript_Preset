{@type:function}
SetBarMode(2);

// 跨頻率XAverage
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType, Series, Length
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string),		//引用頻率
	Series(numericseries),	//價格序列
	Length(numericsimple);	//計算期間
 
variable:
	Factor(0), lastXAverage(0);

if getinfo("Instance")=3 and getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

if FreqType="D" or FreqType="AD" or FreqType="W" or FreqType="AW" or FreqType="M" or FreqType="AM" then 
	condition1 = xfMin_getdtvalue(FreqType, getfieldDate("Date")) <> xfMin_getdtvalue(FreqType, getfieldDate("Date")[1])
else 
	condition1 = xfMin_getdtvalue(FreqType, datetime) <> xfMin_getdtvalue(FreqType, datetime[1]);

if condition1 then
	lastXAverage = xfMin_XAverage[1];

value1 = xfMin_GetCurrentBar(FreqType);

if Length + 1 = 0 then Factor = 1 else Factor = 2 / (Length + 1);

if value1 = 1 then
	xfMin_XAverage = Series
else
	xfMin_XAverage = lastXAverage + Factor * (Series - lastXAverage);
