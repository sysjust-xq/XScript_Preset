{@type:sensor}
//中小型股，持股20天
//漲幅3%以上
//爆大量，且一般而言會是月均量1倍以上
//主力近1日買超要相對過去的買超有成長。
//買進家數小於賣出家數

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
value1=GetField("分公司買進家數","D")[Z];
value2=GetField("分公司賣出家數","D")[Z];
value3=GetField("主力買賣超張數")[Z];
if close>close[1]*1.03
and value3>average(value3,20)
and value1<value2
and volume >2*average(volume,20)
and tselsindex(10,8)[Z]=1
then ret=1;