{@type:filter}
Input: period(20, "期間(天)");

variable: avg_b(0);

settotalbar(period + 5);

if GetField("Volume") > 0 then 
	Value5 = GetField("投信買張")*GetField("成交金額(元)")/(GetField("Volume")*1000)	 
else 
	Value5 = 0;

Value1 = summation(Value5, period);
Value2 = summation(GetField("投信買張"), period);
  
if Value2 > 0 and Value2 <> Value2[1] then avg_b = Value1 / Value2;

if close cross over avg_b then ret=1;
 