{@type:filter|@guid:96cadb5ad4c741a5ba882984c8742e30|@path:/04.價量選股/收盤價創N日來新高}
input:period(100,"計算天數");
if close=highest(close,period)
then ret=1;
value2=GetField("總市值","D");
outputfield(1,value2,0,"總市值");
