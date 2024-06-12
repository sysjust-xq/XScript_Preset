{@type:function}
SetBarMode(1);

// 跨頻率MACD函數
//
// FreqType是預期要引用的頻率, 支援"D", "W", "M"
// 輸入: FreqType, FastLength, SlowLength, MACDLength;
// 輸出: DifValue, MACDValue, OscValue;

input:
	FreqType(string),		//引用頻率
	Price(numericseries), 	
	FastLength(numericsimple), SlowLength(numericsimple), MACDLength(numericsimple),
	DifValue(numericref), MACDValue(numericref), OscValue(numericref);

DifValue = xf_XAverage(FreqType, Price, FastLength) - xf_XAverage(FreqType, Price, SlowLength);
MACDValue = xf_XAverage(FreqType, DifValue, MACDLength);
OscValue = DifValue - MACDValue;

xf_MACD = 1;