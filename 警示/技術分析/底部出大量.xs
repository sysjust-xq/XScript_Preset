{@type:sensor}
input:period(60);
if close=lowest(close,period)
and volume=highest(volume,period)
then ret=1;

