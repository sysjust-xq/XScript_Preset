{@type:sensor|@guid:9968ed8227eb4f39b8d84f6e8a2f75bc|@path:/技術分析/DIF-MACD由負轉正|@hash:2a8d3011d9728d4d015061c05ec5cbd9}
// DIF-MACD翻正
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 8);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = oscValue Crosses Above 0;




        
        