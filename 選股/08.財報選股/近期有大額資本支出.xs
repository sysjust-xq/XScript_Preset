{@type:filter}
input:period(20,"計算N季");
input:lm(30,"比均值增加的幅度");
input:cm(500,"單季資本支出金額下限");
settotalbar(period+1);

value1=GetField("資本支出金額","Q");//單位: 百萬
value2=GetField("資本支出營收比","Q");//單位：%
value3=average(value1,period);
value4=average(value2,period);

if value1>cm//資本支出超過一定金額
and value1>value3*(1+lm/100)
and value2>value4*(1+lm/100)
then ret=1;