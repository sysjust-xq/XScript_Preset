{@type:sensor}
{L.J.R. Sep.2014}
// DIF-MACD翻正
//
input: FastLength(12), SlowLength(26), MACDLength(9);
variable: difValue(0), macdValue(0), oscValue(0);

SetInputName(1, "DIF短期期數");
SetInputName(2, "DIF長期期數");
SetInputName(3, "MACD期數");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;

MACD(weightedclose(), FastLength, SlowLength, MACDLength, difValue, macdValue, oscValue);

value1=GetField("主力買賣超張數")[Z];
if oscValue Crosses Above 0
and trueall(value1>300,3)
and tselsindex(10,8)[Z]=1
then ret=1;

