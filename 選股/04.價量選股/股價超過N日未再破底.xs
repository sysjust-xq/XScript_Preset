{@type:filter|@guid:0e3e78e0d27d4bea8ef30cee2573f33e|@path:/04.價量選股/股價超過N日未再破底}
input:period(30);
input:day(10);
setinputname(1,"計算期間");
setinputname(2,"未破底天數");
value1=lowestbar(low,period);
if value1>day
then ret=1;