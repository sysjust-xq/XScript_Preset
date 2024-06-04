{@type:filter|@guid:53a760f2d26d4fba9951cc23c4307761|@path:/04.價量選股/價量同步創N期新高}
input:period(100,"計算天數");

value1=highest(high,period);
value2=highest(volume,period);
if high=value1 and volume=value2
then ret=1;
