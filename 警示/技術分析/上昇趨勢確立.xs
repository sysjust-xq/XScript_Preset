{@type:sensor}
//市值適中的股票 20天出場

input:Length(20); //"計算期間"

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
LinearReg(close, Length, 0, value1, value2, value3, value4);
//做收盤價20天線性回歸
{value1:斜率,value4:預期值}
value5=rsquare(close,value4,20);//算收盤價與線性回歸值的R平方
value6=GetField("主力買賣超張數")[Z];
if value1> 0 and value5 crosses over 0.2
and trueall(value6>100,3)
and tselsindex(10,8)[Z]=1
then ret=1;