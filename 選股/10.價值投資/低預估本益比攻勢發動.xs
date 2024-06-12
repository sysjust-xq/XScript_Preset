{@type:filter}
value1=GetField("月營收","M");//單位:億元
value2=GetField("稅後淨利率","Q");
value3=GetField("最新股本");//單位:億元
if value3<>0 then
value6=(value1*value2*12)/(value3*10);//單月營收推估的本業EPS
if value6<>0 then 
value7=close/value6;

value4=GetField("總市值");
value5=average(GetField("總市值"),600);

if value4<value5*0.7
and close=highest(close,10)
then ret=1;

outputfield(1,value7,2,"推估本益比", order := -1);



 