{@type:indicator|@guid:e95d376cb2654c15b644c7d87e5dc960|@path:/大盤指標/BBand寬度指標|@hash:e4025604ef9256a26896c2013eb75901}
{
指標說明
https://xstrader.net/bband-width/
}

input: 
	Length(20, "MA的天數"), 
	UpperBand(2, "上通道標準差倍數"), 
	LowerBand(2, "下通道標準差倍數");
variable: mid(0), up(0), down(0), bbandwidth(0) ;

up = bollingerband(Close, Length, UpperBand);
down = bollingerband(Close, Length, -1 * LowerBand);
mid = (up + down) / 2;

bbandwidth = 100 * (up - down) / mid;
 
Plot1(bbandwidth , "BBand width(%)");
plot2(4,"低檔");



