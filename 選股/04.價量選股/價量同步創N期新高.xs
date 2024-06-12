{@type:filter}
input:period(100,"計算天數");

value1=highest(high,period);
value2=highest(volume,period);
if high=value1 and volume=value2
then ret=1;
