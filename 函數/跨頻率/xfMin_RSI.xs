{@type:function}
SetBarMode(2);

// 跨頻率RSI函數
//
// FreqType是預期要比對的期別, 支援 "1", "5", "10", "15", "30", "60", "D", "W", "M", "AD", "AW", "AM"
// 輸入: FreqType, Series, Length
// 不支援XS選股、XS選股自訂排行與XS選股回測。
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
	
if getinfo("Instance")=3 or getinfo("Instance")=31 then raiseruntimeerror("此函數不支援XS選股與XS選股自訂排行");

if FreqType="D" or FreqType="AD" or FreqType="W" or FreqType="AW" or FreqType="M" or FreqType="AM" then 
	condition1 = xfMin_getdtvalue(FreqType, getfieldDate("Date")) <> xfMin_getdtvalue(FreqType, getfieldDate("Date")[1])
else 
	condition1 = xfMin_getdtvalue(FreqType, datetime) <> xfMin_getdtvalue(FreqType, datetime[1]);	
if condition1 then
begin
	LastSumUp = SumUp[1];
	LastSumDown = SumDown[1];
	LastRefSeries = Series[1];
end;

if xfMin_GetCurrentBar(FreqType) = 1 then
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
	xfMin_RSI = 0
else
	xfMin_RSI = 100 * SumUp / (SumUp + SumDown);


