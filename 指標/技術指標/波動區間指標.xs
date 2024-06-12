{@type:indicator}
input:
	short1(3,"短期平均"),
	mid1(20,"長期平均");

value1=highest(high,5);
value2=lowest(low,5);
if value2 <> 0 then
	value3=(value1-value2)/value2*100;
value4=average(value3,short1);
value5=average(value3,mid1);

plot1(value4,"短期平均區間");
plot2(value5,"長期平均區間");
