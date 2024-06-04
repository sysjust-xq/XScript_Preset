{@type:sensor|@guid:a53b345e0bac4e039b3dec5ad78ed1dc|@path:/技術分析/盤整後跳空走高}
//中小型股  停損停利都是5%
input:period(20,"盤整區間");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
value1=highest(high[1],period);
value2=lowest(low[1],period);
if value1<value2*1.05
and open > high[1]*1.025
and tselsindex(10,7)[Z]=1
then ret=1;