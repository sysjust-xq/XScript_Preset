{@type:filter}
setbarfreq("Y");
settotalbar(8);

value1=GetField("總市值","Y");
value2=lowest(value1,8);
if value1<value2*1.1
then ret=1;