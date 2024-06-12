{@type:filter}
input: t1(4,"倍數");
setbarfreq("Q");
settotalbar(4);

value1=GetField("企業價值","Q");//單位百萬
value2=GetField("來自營運之現金流量","Q");//單位百萬
value3=GetField("資本支出金額","Q");//單位百萬
value4=GetField("所得稅費用","Q");//單位百萬
value5=GetField("利息支出","Q");//單位百萬
value6=value2-value3-value4-value5;
//自由現金流量 = 營運現金流量 - 資本支出 - 利息 - 稅金
value7=summation(value6,4);
//最近四期現金流量

if value1<t1*value7 then ret=1;
outputfield(1,value1,0,"企業價值");
outputfield(2,value7,0,"近四季自由現金流合計");


