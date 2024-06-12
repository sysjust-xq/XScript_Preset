{@type:indicator}
{
指標說明
https://xstrader.net/短線過熱的指標/
}

input:p1(5,"移動平均線天期");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1=GetField("融資買進張數");
value2=GetField("現股當沖張數");
value3=GetField("資券互抵張數");

value4=value1+value2+value3;

if volume>0 then 
	value5=value4/volume;
value6=average(value5,p1);

plot1(value5,"短線交易比例");
plot2(value6,"移動平均線");

