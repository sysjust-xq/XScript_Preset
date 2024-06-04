{@type:sensor|@guid:62fa3e9095ce4218af76439f5c1fd0b0|@path:/3.出場常用警示/MACD出現賣出訊號|@hash:dcdf0b6ded2eb4f68685ed6863ed14d4}
input: FastLength(12), SlowLength(26), MACDLength(9);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 8);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD天數");

variable: difValue(0), macdValue(0), oscValue(0);

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = oscValue Crosses Below 0;
