{@type:indicator}
// 跨頻率週RSI指標
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率週資料，跨頻率計算日RSI技術指標。
//
if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "W" and barfreq <> "AD" and barfreq <> "AW" then raiseruntimeerror("不支援大頻率跨小頻率");

input: Length1(6), Length2(12);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

Plot1(xf_RSI("W", GetField("Close","W"), Length1), "週RSI1");
Plot2(xf_RSI("W", GetField("Close","W"), Length2), "週RSI2");        
		