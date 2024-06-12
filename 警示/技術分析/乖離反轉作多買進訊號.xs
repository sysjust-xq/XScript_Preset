{@type:sensor}
//用週線  四週後出場
input:Length(20,"計算期數");
input:Ratio(21,"乖離%");
input:TXT("僅適用日線","使用限制");

settotalbar((Length+10)*5);

//透過Z的時間安排來決定現在用的是那一根Bar的資料 
variable: Z(0);
if GetFieldDate("主力買賣超張數") <> 0 then
	Z=0 
else 
	Z=1;
	
variable:KPrice(0);
if close <= average(getfield("close","W"),Length) * (1-Ratio/100) then KPrice = getfield("high","W");
value1=GetField("投信買賣超")[Z];
value2=value1*close*1000;
if countif(value2>1000000,3)>2
and close>KPrice and getfield("close","W")[1] < xf_getvalue("W",KPrice,1)
then ret=1 ;
