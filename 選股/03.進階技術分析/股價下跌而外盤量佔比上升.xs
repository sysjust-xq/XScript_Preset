{@type:filter}
input:period(20);		setinputname(1,"計算天期");

settotalbar(period * 2 + 3);

value1 = GetField("外盤量");//日的外盤量
if volume <> 0 then 
	value2 = value1 / volume
else
	value2 = 0;

value3 = average(value2, period);
if linearregslope(value3,period) > 0 and
   linearregslope(close,period) < 0 and 
   volume > 1000
then ret=1;


