{@type:sensor}
//全部  持有二十天

input:period(500,"創n日新高");
settotalbar(period);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;

value1=GetField("強弱指標","D")[Z];
value2=GetField("主力買賣超張數")[Z];
if close crosses over highest(close[1],period)
and trueall(close>close[1],3)
and trueall(value2>0,3)
and tselsindex(10,6)[Z]=1

then ret=1;
