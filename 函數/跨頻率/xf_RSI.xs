{@type:function}
SetBarMode(2);

// 跨頻率RSI函數
//
// FreqType是預期要引用的頻率, 支援"D", "W", "M"
// 輸入: FreqType, Series, Length
//
input:
	FreqType(string),		//引用頻率
	Series(numericseries),	//價格序列
	Length(numericsimple);	//計算期間

variable: 
	SumUp(0), SumDown(0), 
	LastSumUp(0), LastSumDown(0),LastRefSeries(Series), 
	up(0), down(0),
	closePeriod(0);

condition1 = xf_getdtvalue(FreqType, getFieldDate("Date")) <> xf_getdtvalue(FreqType, getFieldDate("Date")[1]);
if condition1 then
begin
	LastSumUp = SumUp[1];
	LastSumDown = SumDown[1];
	LastRefSeries = Series[1];
end;

if xf_GetCurrentBar(FreqType) = 1 then
  begin
	SumUp = Average(maxlist(Series - LastRefSeries, 0), Length); 
	SumDown = Average(maxlist(LastRefSeries - Series, 0), Length); 
  end
else
  begin
	up = maxlist(Series - LastRefSeries, 0);
	down = maxlist(LastRefSeries - Series, 0);
	
	SumUp = LastSumUp + (up - LastSumUp) / Length;
	SumDown = LastSumDown + (down - LastSumDown) / Length;
  end;

if SumUp + SumDown = 0 then
	xf_RSI = 0
else
	xf_RSI = 100 * SumUp / (SumUp + SumDown);


