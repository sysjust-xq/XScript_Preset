{@type:sensor}
input:period(20,"計算天期");

if range <> 0 and range[1] <> 0 then
	value1= ((high-low[1])-(high[1]-low))/((high-low[1])+(high[1]-low))*volume;
if summation(volume,period) <> 0 then
	value2= summation(value1,period)/summation(volume,period);

if value2 crosses over -0.5 then ret=1;