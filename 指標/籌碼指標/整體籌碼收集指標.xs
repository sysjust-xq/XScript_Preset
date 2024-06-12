{@type:indicator}
{
指標說明
https://xstrader.net/一個交易策略的熟成-2/
}

input:Period(5,"MA期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("現股當沖張數","D");
value2=GetField("外資買賣超","D");
value3=GetField("投信買賣超","D");
value4=GetField("自營商買賣超","D");
value5=GetField("主力買賣超張數","D");
value6=GetField("融資增減張數","D");
value7=GetField("融券增減張數","D");
value8=volume-value1;//當日淨交易張數
value9=value2+value3+value4+value5-value6+value7;

//籌碼收集張數
if value8<>0 then 
	value10=value9/value8*100
else
	value10=value10[1];

value11=average(value10,Period);
plot1(value11,"集中度");