{@type:filter}
value1=GetField("股價淨值比","Y");
value2=lowest(value1,4);
if value1<value2*1.3 and value1<=0.8
then ret=1;

outputfield(1, GetField("股價淨值比","Y"),2, "PB比", order := -1);
