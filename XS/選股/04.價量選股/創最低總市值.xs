{@type:filter|@guid:346cba574a714dda8629ad3626f1e5d2|@path:/04.價量選股/創最低總市值}
input:period(36,"計算的月份數");
setbarfreq("M");

if GetField("總市值","M")=lowest(GetField("總市值","M"),period)
then ret=1;

