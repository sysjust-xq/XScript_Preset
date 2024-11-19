{@type:sensor}
Input: Length(20, "期數");
input: UpperBand(2, "通道上緣");
input: lowerband(-2,"通道下緣");
variable:Kprice(0);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if currenttime > 180000 
or currenttime < 083000 then 
	Z =0 
else 
	Z=1;
	
value1= bollingerband(Close, Length, UpperBand);
value2= bollingerband(Close, Length, lowerBand);
value3=value1-value2;
value4=average(close,20);
value5=tselsindex(10,6);

if linearregslope(value4,5)>0
and value3>average(value3,20)*1.3
and close[1] crosses over value1
and close>value1
and value5[Z]=1
then ret=1;