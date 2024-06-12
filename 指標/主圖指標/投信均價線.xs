{@type:indicator}
Input: period(20);	setinputname(1, "期間(天)");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
variable: avg_b(0), avg_s(0);

if GetField("Volume") > 0 then 
begin
	Value5 = GetField("投信買張")*GetField("成交金額")/(GetField("Volume")*1000);
	Value6 = GetField("投信賣張")*GetField("成交金額")/(GetField("Volume")*1000);
end else begin
	Value5 = 0;
	Value6 = 0;
end;

Value1 = summation(Value5, period);
Value2 = summation(GetField("投信買張"), period);
Value3 = summation(Value6, period);
Value4 = summation(GetField("投信賣張"), period);
 
if Value2 > 0 and Value2 <> Value2[1] then avg_b = Value1 / Value2;
if Value4 > 0 and Value4 <> Value4[1]  then avg_s = Value3 / Value4;

Plot1(avg_b, "投信買進均價");
Plot2(avg_s, "投信賣出均價");


