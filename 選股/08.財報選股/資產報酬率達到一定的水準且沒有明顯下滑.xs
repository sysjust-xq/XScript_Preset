{@type:filter}
value1=GetField("資產報酬率","Q");
value2=average(value1,4);
value3=linearregslope(value2,5);
if value3>0
then ret=1;