{@type:sensor}
input:period(10,"籌碼計算天期");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;

Value1=GetField("分公司買進家數","D")[Z];
value2=GetField("分公司賣出家數","D")[Z];
value3=(value2-value1);
//賣出的家數比買進家數多的部份
value4=average(close,5);
//五日移動平均

value5=tselsindex(10,7);

if countif(value3>30, period)/period >0.7
and linearregslope(value4,5)>0
and Average(Volume[1], 100) >= 500
and value5[Z]=1
then ret=1;