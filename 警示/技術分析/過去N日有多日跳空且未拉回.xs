{@type:sensor}
//中小型股  停損停利都是5%
input:day(5,"過去N日");
input:lowlimit(2,"符合條件天數");
input:period(20,"盤整區間");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
value1=highest(high[day],period);
value2=lowest(low[day],period);
value3=tselsindex(10,8);

if value1<value2*1.05
and countif(high>high[1]
and low>low[1],day)>=lowlimit
and value3[Z]=1
then ret=1;