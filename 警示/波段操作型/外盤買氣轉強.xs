{@type:sensor}
input:short1(5,"短期平均"),mid1(20,"長期平均");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
value1=GetField("內盤量");//內盤量
value2=GetField("外盤量");//外盤量
value3=value1+value2;

if value3<>0 then value4=value2/value3*100;
//外盤比重

value5=average(value4,short1);
value6=average(value4,mid1);
value7=tselsindex(10,6);

if close*1.4<close[90]
and value5 crosses above value6 
and value4>60
and average(volume,100)>1000
and value7[Z]=1
then ret=1;