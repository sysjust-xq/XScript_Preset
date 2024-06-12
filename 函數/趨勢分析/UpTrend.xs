{@type:function_bool}
{
	判斷某個序列是否趨勢朝上
	
	注意事項:
	
	- 判斷N日趨勢會判斷均線的趨勢, 所以資料必須要有Length*2以上
	- 每次計算時會讀取近Length*2筆計算, 為了效能起見, 僅需在最新筆呼叫此函數即可

	範例:
	
	SetBackBar(2 * Length);			// 需有2倍的資料筆數	
	SetTotalBar(2);					// 
	if CurrentBar <> GetTotalBar() then return;
	ret = UpTrend(Close, Length);	
}

input: TheSeries(numericseries, "序列");
input: Length(numericsimple, "天期");

{
	底下是目前選股系統腳本使用的計算邏輯

	Condition1 = rateofchange(TheSeries, Length) >= Length; 
	Condition2 = TheSeries > TheSeries[Length/2]; 
	Condition3 = TheSeries > average(TheSeries, Length); 
	Condition4 = TheSeries >= TheSeries[1];

	retval = condition1 and condition2 and condition3 and condition4; 	
}

Array: TheSeriesArray[](0);
Array: LongMA[](0);			// 儲存長MA (MA(Length))
Array: ShortMA[](0);		// 儲存短MA (MA(Length/2))

ArraySeries(TheSeries, Length, TheSeriesArray);

// Value1 = Average(TheSeries, Length);
// Value2 = Average(TheSeries, Length/2);

Var: ShortLength(Ceiling(Length/2));
ArrayMASeries(TheSeries, Length, LongMA);
ArrayMASeries(TheSeries, ShortLength, ShortMA);

if Length >= 10 then begin
	retval = 
		ShortMA[1] >= LongMA[1] and // Value2 >= Value1 and
		ArrayLinearRegSlope(LongMA, Length) > 0 and //LinearRegSlope(Value1, Length) > 0 and 
		ArrayLinearRegSlope(ShortMA, ShortLength) > 0 and //LinearRegSlope(Value2, Length/2) > 0 and
		LongMA[1] >= LongMA[2] and // Value1 >= Value1[1] and
		ShortMA[1] >= ShortMA[2] and // Value2 >= Value2[1] and
		TheSeriesArray[1] >= TheSeriesArray[2]; // TheSeries >= TheSeries[1];
end else begin
	retval = 
		ArrayLinearRegSlope(LongMA, Length) > 0 and //LinearRegSlope(Value1, Length) > 0 and 
		LongMA[1] >= LongMA[2] and // Value1 >= Value1[1] and
		TheSeriesArray[1] >= TheSeriesArray[2]; // TheSeries >= TheSeries[1];
end;
