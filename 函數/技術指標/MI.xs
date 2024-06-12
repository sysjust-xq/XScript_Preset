{@type:function}
SetBarMode(1);

{
XQ: MI 質量指標
Length:計算EMA期數
SumLength:計算總和期數
}
input: Length(numeric), SumLength(numeric);
variable: ema1(0), ema2(0), divSeries(0), mit(0);


ema1 = XAverage(High - Low, length);
ema2 = XAverage(ema1, length);

if ema2 <> 0 then
	divSeries = ema1 / ema2
else
	divSeries = 0;

if CurrentBar >= sumLength then
	mit = Summation(divSeries, sumLength)
else
	mit = 0;

MI =mit;
		