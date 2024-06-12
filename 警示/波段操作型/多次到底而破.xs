{@type:sensor}
input:day(100,"計算區間");
input:band1(4,"三高點之高低價差");

value1=nthlowest(1,low[1],day);
value2=nthlowest(3,low[1],day);
value4=nthlowestbar(1,low,day);
value5=nthlowestbar(3,low,day);
value6=nthlowestbar(5,low,day);
value7=absvalue(value4-value6);
value8=absvalue(value5-value6);
value9=absvalue(value4-value5);

condition1=false;
if value7>3 and value8>3 and value9>3
then condition1=true;

value3=(value1-value2)/value2;
if value3<=band1/100
and close crosses under value1
and volume>2000
and condition1
then ret=1;
