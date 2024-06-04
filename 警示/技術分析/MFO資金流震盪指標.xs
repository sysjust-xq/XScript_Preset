{@type:sensor|@guid:a5b20defdac245bb9e7f9a4816aef3bc|@path:/技術分析/MFO資金流震盪指標}
input:period(20,"計算天期");

if range <> 0 and range[1] <> 0 then
	value1= ((high-low[1])-(high[1]-low))/((high-low[1])+(high[1]-low))*volume;
if summation(volume,period) <> 0 then
	value2= summation(value1,period)/summation(volume,period);

if value2 crosses over -0.5 then ret=1;