{@type:filter|@guid:d98e744cdaf44cf785082560b004e543|@path:/02.基本技術指標/MACD死亡交叉|@hash:24be9d73742517110b1a17f4f3f39da7}
// MACD 死亡交叉 (dif向下穿越macd)
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 4);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = difValue Crosses Below macdValue;



