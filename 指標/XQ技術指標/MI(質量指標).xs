{@type:indicator|@guid:d050d61b5097421fbf92b41f2e4fbbd2|@path:/XQ技術指標/MI(質量指標)|@hash:f34c9e18aa067e9c39030bdf9cddf7dc}
// XQ: MI指標
//
input: Length(9), SumLength(25);
variable: ema1(0), ema2(0), divSeries(0), mi(0);

SetInputName(1, "天數一");
SetInputName(2, "天數二");

ema1 = XAverage(High - Low, length);
ema2 = XAverage(ema1, length);

if ema2 <> 0 then
	divSeries = ema1 / ema2
else
	divSeries = 0;

if CurrentBar >= sumLength then
	mi = Summation(divSeries, sumLength)
else
	mi = 0;
	
Plot1(mi, "MI");

        
		