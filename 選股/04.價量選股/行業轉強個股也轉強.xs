{@type:filter|@guid:392686f5e75c4f5bbbd38fc05f21208d|@path:/04.價量選股/行業轉強個股也轉強}
input:period(20,"計算區間");
setbarfreq("D");
settotalbar(20);

value1=GetField("同業股價指標","D");
value2=GetField("佔全市場成交量比","D");

if value1=highest(value1,period)
and value2=highest(value2,period)
then ret=1;
