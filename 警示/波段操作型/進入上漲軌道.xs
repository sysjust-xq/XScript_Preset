{@type:sensor}
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
value4=tselsindex(10,6);
 
if value3 crosses over 4
and value4[Z]=1 
then ret=1;