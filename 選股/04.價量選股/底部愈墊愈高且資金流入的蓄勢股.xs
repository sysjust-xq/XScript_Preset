{@type:filter}
input:r1(7,"近來漲幅上限%");

value1 = RateOfChange(close, 12);
value2 = lowest(low,3);
value3 = lowest(low,8);
value4 = lowest(low,13);

condition1=false;
condition2=false;

if 
	value1 < r1 and
	value2 > value3 and 
	value3 > value4 and
	close = highest(close,13)
then 
	condition1=true;

Value5=average(GetField("佔全市場成交量比","D"),13);

if linearregslope(Value5,5) > 0
then condition2=true;

if condition1 and condition2
then ret=1;

outputfield(1,value2,2,"前波低點", order := -1);
