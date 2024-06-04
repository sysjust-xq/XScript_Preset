{@type:sensor|@guid:1c9c1276dfa04cd6a3c782b4804d93c5|@path:/ETF策略/大碗底}
value1=lowestbar(low,100);
value2=lowest(low,100);
value3=highestbar(high,100);
value4=highest(high,100);
 
if value4>value2*1.15
and value3-value1>15
then begin
	if value1>15
	and value2*1.05>close[1]
	and close>close[1]*1.01
	and volume>average(volume[1],15)*1.2
	then ret=1;
end;
