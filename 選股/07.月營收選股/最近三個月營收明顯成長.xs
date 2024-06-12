{@type:filter}
settotalbar(3);
value1=GetField("月營收月增率","M");
value2=GetField("月營收年增率","M");
condition1=false;
condition2=false;

if average(value1,3)>10 and average(value2,3)>10
and value1>value1[1]
and value2>value2[1] 
then condition1=true;

if trueall(value1>5 and value2>5,3)
then condition2=true;
if condition1 and condition2 then ret=1;

outputfield(1,value1,1,"月營收月增率");
outputfield(2,value1[1],1,"上個月營收月增率");
outputfield(3,value2,1,"月營收年增率");
outputfield(4,value2[1],1,"上個月營收年增率");

