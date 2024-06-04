{@type:sensor|@guid:f2c8c9a44cb94310b788d70ef773009c|@path:/技術分析/Pivot Point短多策略}
variable:pivot(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
pivot=(high+low+close)/3;
value1=2*pivot-low;
if close=value1
and tselsindex(10,6)[Z]=1
and volume>=1000
then ret=1;