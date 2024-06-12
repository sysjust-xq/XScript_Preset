{@type:sensor}
//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
if momentum(close,10) crosses over 0
and GetField("投信買賣超")[Z]>1000 
then ret=1;