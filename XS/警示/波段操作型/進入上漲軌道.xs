{@type:sensor|@guid:d8b0c2b72b8b4369a25e88b20d7b185f|@path:/波段操作型/進入上漲軌道}
input:period(12,"期數");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
value1=countif(low<lowest(low[1],period),period);
value2=countif(high>highest(high[1],period),period);
value3=value2-value1;
 
if value3 crosses over 4
and tselsindex(10,6)[Z]=1 
then ret=1;