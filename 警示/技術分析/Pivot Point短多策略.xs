{@type:sensor}
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
value2=tselsindex(10,6);

if close=value1
and value2[Z]=1
and volume>=1000
then ret=1;