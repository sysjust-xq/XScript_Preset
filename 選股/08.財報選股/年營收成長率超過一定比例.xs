{@type:filter}
setbarfreq("Y");
settotalbar(5);

value1=GetField("營收成長率","Y");
value2=average(value1,5);
if trueall(value1>0,5) and value2>=25
then ret=1;

OutputField(1,value1,"年度營收成長率");
OutputField(2,value2,"五年平均營收成長率");
