{@type:indicator|@guid:94d53db3043742bcb890318a27b58367|@path:/XQ技術指標/BBand width (布林通道寬度指標)|@hash:1ce6203596f5b06b52e9cac68a991159}
// XQ: BBandWidth指標
//
input: Length(20), UpperBand(2), LowerBand(2), EMALength(3);
variable: up(0), down(0), mid(0), bbandwidth(0), ema(0);

SetInputName(1, "天數");
SetInputName(2, "上");
SetInputName(3, "下");
SetInputName(4, "EMA");

up = bollingerband(Close, Length, UpperBand);
down = bollingerband(Close, Length, -1 * LowerBand);
mid = (up + down) / 2;

bbandwidth = 100 * (up - down) / mid;
ema = XAverage(bbandwidth, EMALength);

Plot1(bbandwidth , "BBand width(%)");
Plot2(ema, "Band% EMA");



        
		