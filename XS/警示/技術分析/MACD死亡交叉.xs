{@type:sensor|@guid:94f03c96b30140a9b89174a79b3402cd|@path:/技術分析/MACD死亡交叉|@hash:68a476b87395e44a3593345c950b22dd}
// MACD 死亡交叉 (dif向下穿越macd)
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 8);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = difValue Crosses Below macdValue;



