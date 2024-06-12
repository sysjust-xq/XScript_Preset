{@type:filter}
value1=GetField("月營收年增率","M");
input:period(3);
if trueall(value1>0,period) and value1[3]<0
then ret=1;