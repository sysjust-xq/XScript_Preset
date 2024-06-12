{@type:indicator}
Input: period(20);	setinputname(1, "期間(天)");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

variable: avg(0);

if GetField("Volume") > 0 then 
	Value3 = GetField("融資買進張數")*GetField("成交金額")/(GetField("Volume")*1000)
else
	Value3 = 0;

Value1 = summation(Value3, period);
Value2 = summation(GetField("融資買進張數"), period);
 
if Value2 > 0 and Value2 <> Value2[1] then avg = Value1 / Value2;

Plot1(avg, "融資買進均價");

