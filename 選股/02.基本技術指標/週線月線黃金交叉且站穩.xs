{@type:filter}
setbarfreq("AD");

value1=average(close,5);
value2=average(close,20);
if value1[3] crosses over value2[3]
and trueall(close>close[1]and close>value1,5)
then ret=1 ;

outputfield(1,value1,2,"週線", order := -1);
outputfield(2,value2,2,"月線");
