{@type:function}
SetBarMode(2);

// 取得指定頻率的K棒編號（CurrentBar）
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType
// 不支援XS選股、XS選股自訂排行與XS選股回測。
//
input:
	FreqType(string);		//引用頻率

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

if FreqType="D" or FreqType="AD" or FreqType="W" or FreqType="AW" or FreqType="M" or FreqType="AM" then 
	condition1 = xfMin_getdtvalue(FreqType, getfieldDate("Date")) <> xfMin_getdtvalue(FreqType, getfieldDate("Date")[1])
else 
	condition1 = xfMin_getdtvalue(FreqType, datetime) <> xfMin_getdtvalue(FreqType, datetime[1]);	
if currentbar = 1 then 
	xfMin_GetCurrentBar = 1
else if condition1 then
	xfMin_GetCurrentBar = xfMin_GetCurrentBar[1] + 1
else
	xfMin_GetCurrentBar = xfMin_GetCurrentBar[1];
