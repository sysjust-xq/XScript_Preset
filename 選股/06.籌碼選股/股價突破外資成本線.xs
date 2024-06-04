{@type:filter|@guid:f689f697ebf244bd9502127764e67424|@path:/06.籌碼選股/股價突破外資成本線}
Input: period(20, "期間(天)");
variable: avg_b(0);
setbarfreq("D");
settotalbar(period+7);

if GetField("Volume") > 0 then 
	Value5 = GetField("外資買張")*GetField("成交金額")*100000/GetField("Volume")
else
	Value5 = 0;

Value1 = summation(Value5, period);
Value2 = summation(GetField("外資買張"), period);
 
if Value2 > 0 then avg_b = Value1 / Value2;
if close cross over avg_b then ret=1;