{@type:sensor}
//作多  中小型股  持有二十天

input: Length(5); setinputname(1,"計算天數");
input:TXT("僅適用日線以上"); setinputname(2,"使用限制");
input:limit1(20);
setinputname(3,"買超佔成交量比例");

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
variable: b1(0), v1(0),ratio(0);

b1 = summation(GetField("主力買賣超張數")[Z], Length);
v1 = summation(Volume, Length);
ratio=b1/v1*100;
value1=GetField("主力買賣超張數")[Z];
if v1<>0
then 
begin
if ratio>=limit1 and average(volume,20)>1000
and trueall(value1>100,3)
and tselsindex(10,6)[Z]=1
then ret=1;
end;

