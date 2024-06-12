{@type:filter}
input:lowlimit(20);//單位:%
variable:FEPS(0);
setinputname(1,"成長百分比");

value1=GetField("月營收","M");//億
value2=GetField("營業利益率","Q");
value3=value1*12*value2/100;
value4=GetField("最新股本");//億
FEPS=value3/value4*10;
if feps<>0 then value5=close/feps;
condition1 = value5<12 and value5>0;
value6=GetField("月營收月增率","M");
value7=GetField("月營收年增率","M");
condition2 = value6>=lowlimit and value7>=lowlimit and value6[1]>0;
if condition1 and condition2 then ret=1;
setoutputname1("用月營收預估的本業EPS");
outputfield1(FEPS);
setoutputname2("用月營收預估的本益比");
outputfield2(value5);