{@type:sensor}
//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
value1=GetField("主力買賣超張數")[Z];
if value1=highest(value1,120)
and trueall(value1>0,3)
and volume>500
and close>close[1]*1.03
then ret=1;