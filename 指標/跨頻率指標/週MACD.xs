{@type:indicator}
// 跨頻率週MACD指標
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率週資料，跨頻率計算日MACD技術指標。
//
if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "W" and barfreq <> "AD" and barfreq <> "AW" then raiseruntimeerror("不支援大頻率跨小頻率");

input: FastLength(12), SlowLength(26), MACDLength(9);

SetInputName(1, "DIF短天數");
SetInputName(2, "DIF長天數");
SetInputName(3, "MACD天數");

xf_macd("W",xf_weightedclose("W"),FastLength,SlowLength,MACDLength,value1,value2,value3);

// 前面區段資料變動較大, 先不繪出
//
if CurrentBar <= SlowLength then
begin
	Value1 = 0;
	Value2 = 0;
	Value3 = 0;
end;

Plot1(Value1, "週DIF");
Plot2(Value2, "週MACD");
Plot3(Value3, "週Osc");
