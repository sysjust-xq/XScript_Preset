{@type:function|@guid:8216021f4b11489b8faca5f2af7d0750|@path:/技術指標/MACD|@hash:623ff02ce0c65b8a85919ef012349d8a}
SetBarMode(1);

// MACD function
//	Input: Price序列, FastLength, SlowLength, MACDLength
//  Output: DifValue, MACDValue, OscValue
// 
Input: Price(numericseries), FastLength(numericsimple), SlowLength(numericsimple), MACDLength(numericsimple);
Input: DifValue(numericref), MACDValue(numericref), OscValue(numericref);

DifValue = XAverage(price, FastLength) - XAverage(price, SlowLength);
MACDValue = XAverage(DifValue, MACDLength) ;
OscValue = DifValue - MACDValue;

 