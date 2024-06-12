{@type:filter}
input:period(30);
input:day(10);
setinputname(1,"計算期間");
setinputname(2,"未破底天數");
value1=lowestbar(low,period);
if value1>day
then ret=1;