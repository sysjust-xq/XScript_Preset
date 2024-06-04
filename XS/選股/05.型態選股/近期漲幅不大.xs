{@type:filter|@guid:686059242586449fb769a2f717ea62a9|@path:/05.型態選股/近期漲幅不大}
input:period(20,"計算區間");
input:ratio(7,"最低漲跌幅");

if close[period-1]<>0
and (close/close[period-1]-1)*100<ratio
then ret=1;

outputfield(1,GetField("法說會日期"),0,"法說會日期", order := -1);