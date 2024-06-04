{@type:indicator|@guid:9d1e6cf020b64922a2848f903f7424b2|@path:/技術指標/adaptive price zone|@hash:316fb91dea71404096c3c15a72929e82}
{
指標說明
https://xstrader.net/adaptive-price-zone/
}

input: 
	Length(14,"期數"), 
	BandPct(2.0,"通道寬度");

variable: DSEMA(0), UpBand(0), DownBand(0), RangeEMA(0), period(0), var0(0);

period = squareroot(Length);
DSEMA = xaverage(xaverage(close, period), period);
RangeEMA = xaverage(xaverage(high-low, period), period);
UpBand = DSEMA + BandPct*RangeEMA;
DownBand = DSEMA - BandPct*RangeEMA;

Plot1(UpBand, "Upperband");
Plot2(close, "Close");
Plot3(DownBand, "BottomBand");
