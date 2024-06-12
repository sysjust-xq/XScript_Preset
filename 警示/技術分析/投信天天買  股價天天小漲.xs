{@type:sensor}
//中小型股  持有二十天

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
value1=GetField("投信買賣超")[Z];
value2=GetField("主力買賣超張數")[Z];
input:day(8);
if countif(value1>0,day)>=7
//八天裡至少七天投信買超
and countif(close>close[1],day)>=5
//八天裡至少五天上漲
and average(volume,10)<2000
and trueall(value2>0,3)
and tselsindex(10,8)[Z]=1

then ret=1;