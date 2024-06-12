{@type:sensor}
//小型股

input:day(66);
input:ratio(10);
variable:count(0);
 
setinputname(1,"移動平均天數");
setinputname(2,"超出均值比率");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
value1=GetField("總成交次數");
value2=average(value1,day);
value3=GetField("強弱指標")[Z];
value4=average(value3,day);
value5=GetField("外盤均量")[Z];
value6=average(value5,day);
value7=GetField("主動買力")[Z];
value8=average(value7,day);
value9=GetField("開盤委買");
value10=average(value9,day);
count=0;
if value1>=value2*(1+ratio/100)
then count=count+1;
if value3>=value4*(1+ratio/100)
then count=count+1;
if value5>=value6*(1+ratio/100)
then count=count+1;
if value7>=value8*(1+ratio/100)
then count=count+1;
if value9=value10*(1+ratio/100)
then count=count+1;
 
value11=average(count,5);
value12=average(count,20);
if value11 crosses over value12
and value12<2.2
and highest(close,20)<lowest(close,20)*1.1
and tselsindex(10,8)[Z]=1
and GetField("主力買賣超張數")[Z]>100
then ret=1;