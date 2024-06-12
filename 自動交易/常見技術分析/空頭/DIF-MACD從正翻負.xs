{@type:autotrade}
// 宣告參數
input: FastLength(12, "DIF短期期數"), SlowLength(26, "DIF長期期數"), MACDLength(9, "MACD期數");
variable: difValue(0), macdValue(0), oscValue(0);

// 資料讀取筆數設定
SetTotalBar((maxlist(FastLength,SlowLength,6) + MACDLength) * 3 + 8);

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

// 空方進場策略：DIF-MACD由正轉負。出場策略：DIF-MACD由負轉正。
if oscValue Crosses below 0	then setposition(-1);		
if oscValue Crosses Above 0	then setposition(0);		