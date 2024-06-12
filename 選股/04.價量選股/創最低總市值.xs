{@type:filter}
input:period(36,"計算的月份數");
setbarfreq("M");

if GetField("總市值","M")=lowest(GetField("總市值","M"),period)
then ret=1;

