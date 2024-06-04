{@type:sensor|@guid:1ab6815b8a7d4fcca720afbfe48a70b0|@path:/技術分析/MACD黃金交叉|@hash:eec105158af2be2ab9f91855349795e3}
// MACD 黃金交叉 (dif向上穿越macd)
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 8);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = difValue Crosses Above macdValue;



