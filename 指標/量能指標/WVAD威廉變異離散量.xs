{@type:indicator}
{
指標說明
https://xstrader.net/wvad威廉變異離散量/
}

input:length(5,"期數");

variable:wvad(0);

value1=close-open;
value2=high-low;

if high<>low then 
	value3=value1/value2*volume
else
	value3=value3[1];

wvad=summation(value3,length);

plot1(wvad,"威廉變異離散量");

