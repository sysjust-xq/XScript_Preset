{@type:filter}
settotalbar(3);

value1=GetField("來自營運之現金流量","Q");
value2=GetField("本期稅後淨利","Q");
if value1 > value2
then ret=1;
