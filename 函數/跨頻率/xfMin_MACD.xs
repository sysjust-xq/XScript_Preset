{@type:function|@guid:3ad4a7800de14e669b2e727f7309514f|@path:/跨頻率/xfMin_MACD|@hash:eea8e5d31ea6fdc11faa428b29786161}
SetBarMode(1);

// 跨頻率MACD函數
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType, FastLength, SlowLength, MACDLength;
// 輸出: DifValue, MACDValue, OscValue;
// 不支援XS選股、XS選股自訂排行與XS選股回測。

if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

input:
	FreqType(string),		//引用頻率
	Price(numericseries), 	
	FastLength(numericsimple), SlowLength(numericsimple), MACDLength(numericsimple),
	DifValue(numericref), MACDValue(numericref), OscValue(numericref);

DifValue = xfMin_XAverage(FreqType, Price, FastLength) - xfMin_XAverage(FreqType, Price, SlowLength);
MACDValue = xfMin_XAverage(FreqType, DifValue, MACDLength);
OscValue = DifValue - MACDValue;

xfMin_macd = 1;