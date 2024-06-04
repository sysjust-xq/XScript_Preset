{@type:filter|@guid:ed444227b561454e8731401d184aee26|@path:/04.價量選股/收盤價收N日來新低}
input:period(100);
setinputname(1,"計算天數");
value1=LOWEST(LOW,period);

if LOW=value1 
then ret=1; 