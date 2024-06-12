{@type:filter}
input:period(20,"計算區間");
setbarfreq("D");
settotalbar(20);

value1=GetField("同業股價指標","D");
value2=GetField("佔全市場成交量比","D");

if value1=highest(value1,period)
and value2=highest(value2,period)
then ret=1;
