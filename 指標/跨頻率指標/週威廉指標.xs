{@type:indicator}
// 跨頻率週威廉指標
// 不支援大頻率跨小頻率，例如：
// 不支援主頻率週資料，跨頻率計算日威廉技術指標。
//
if barfreq <> "Tick" and barfreq <> "Min" and barfreq <> "D" and barfreq <> "W" and barfreq <> "AD" and barfreq <> "AW" then raiseruntimeerror("不支援大頻率跨小頻率");

input: 
	Length1(14, "天數一"), 
	Length2(28, "天數二"), 
	Length3(42, "天數三");

value1 = xf_PercentR("W", Length1) - 100;
value2 = xf_PercentR("W", Length2) - 100;
value3 = xf_PercentR("W", Length3) - 100;

Plot1(value1, "週威廉指標1");
Plot2(value2, "週威廉指標2");
Plot3(value3, "週威廉指標3");
		