{@type:filter}
input:peraito(10,"預估本益比上限");

value1=GetField("月營收","M");//單位:億元
value3=GetField("本期稅後淨利","Q");//單位百萬
value4=GetField("營業利益率","Q");
value5=GetField("最新股本");//單位:億元

condition1=false;
condition2=false;
if value5<>0 then
value6=(value1*value4*12)/(value5*100)*10;//單月營收推估的本業EPS
if value6<>0 then 
value7=close/value6;

if value7<peraito and value7>0 and value3>200
then ret=1;

outputfield(1,value7,0,"推估本益比", order := -1);
outputfield(2,value6,2,"推估EPS");
outputfield(3,value1,2,"月營收");
outputfield(4,value4,2,"營業利益率");
outputfield(5,value5,2,"最新股本");


 