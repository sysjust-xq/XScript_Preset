{@type:indicator}
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
