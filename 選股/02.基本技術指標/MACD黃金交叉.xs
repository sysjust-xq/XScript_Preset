{@type:filter|@guid:4517c0dc9e034d0aa28e3d1ad16a0d5a|@path:/02.基本技術指標/MACD黃金交叉|@hash:be157ef5ed37a7ab2e7bdcaad14ea409}
// MACD 黃金交叉 (dif向上穿越macd)
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 4);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = difValue Crosses Above macdValue;



