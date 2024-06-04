{@type:function|@guid:d6c8ec6b762c4f47b2ad9bfd806fea5f|@path:/跨頻率/xf_GetCurrentBar|@hash:793cb3b6ff0e289467a5f9a1b5ef2e52}
SetBarMode(2);

// 取得指定頻率的K棒編號（CurrentBar）
//
// FreqType是預期要引用的頻率, 支援"D", "W", "M"
// 輸入: FreqType
//
input:
	FreqType(string);		//引用頻率

condition1 = xf_getdtvalue(FreqType, getFieldDate("Date")) <> xf_getdtvalue(FreqType, getFieldDate("Date")[1]);
if currentbar = 1 then 
	xf_GetCurrentBar = 1
else if condition1 then
	xf_GetCurrentBar = xf_GetCurrentBar[1] + 1
else
	xf_GetCurrentBar = xf_GetCurrentBar[1];
