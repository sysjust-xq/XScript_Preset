{@type:indicator}
{
指標說明
https://xstrader.net/交易異常活躍指標/
}

input:day(66,"移動平均天數");
input:ratio(10,"超出均值比率");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

variable:count(0);

value3=GetField("強弱指標");
value4=average(value3,day);
value5=GetField("外盤均量");
value6=average(value5,day);
value7=GetField("主動買力");
value8=average(value7,day);
value9=GetField("開盤委買");
value10=average(value9,day);

count=0;
if value3>=value4*(1+ratio/100) then
	count=count+1;
if value5>=value6*(1+ratio/100) then
	count=count+1;
if value7>=value8*(1+ratio/100) then
	count=count+1;
if value9=value10*(1+ratio/100) then
	count=count+1;

value11=average(count,5);

plot1(value11,"交易活躍度指標");
