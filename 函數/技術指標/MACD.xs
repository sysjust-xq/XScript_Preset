{@type:function}
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

 