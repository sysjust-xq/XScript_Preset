{@type:filter}
input:period(100,"計算天數");
if close=highest(close,period)
then ret=1;
value2=GetField("總市值","D");
outputfield(1,value2,0,"總市值");
