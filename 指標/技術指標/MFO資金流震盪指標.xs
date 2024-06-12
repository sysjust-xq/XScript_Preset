{@type:indicator}
{
指標說明
https://xstrader.net/大盤多空轉換點之探討系列三-mfo資金流震盪指標/
}

input:period(20,"計算天期");

if ((high-low[1])+(high[1]-low)) <> 0 then
	value1= ((high-low[1])-(high[1]-low))/((high-low[1])+(high[1]-low))*volume
else
	value1=value1[1];
	
value2= summation(value1,period)/summation(volume,period);

plot1(value2,"MFO資金流震盪指標");
