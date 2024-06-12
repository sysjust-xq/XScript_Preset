{@type:sensor}
input: pastDays(5); setinputname(1,"計算天數");
input: _BuyRatio(10); setinputname(2,"買超佔比例(%)");
input:TXT("僅適用日線"); setinputname(3,"使用限制");

variable: SumForce(0);
variable: SumTotalVolume(0);

if BarFreq <> "D" then return;

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
value1=GetField("主力買賣超張數")[Z];
 
SumForce = Summation(GetField("投信買賣超")[Z], pastDays);
sumTotalVolume = Summation(Volume, pastDays);
if SumForce > SumTotalVolume * _BuyRatio/100 
and tselsindex(10,8)[Z]=1
then ret =1;

