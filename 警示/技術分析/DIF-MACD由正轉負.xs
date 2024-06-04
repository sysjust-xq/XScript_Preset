{@type:sensor|@guid:8be2def882c541a3910ab5d191d9f288|@path:/技術分析/DIF-MACD由正轉負|@hash:78c0784d6b261c2b9eab28cd0359683b}
// DIF-MACD翻負
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 8);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

Ret = oscValue Crosses Below 0;




        
        