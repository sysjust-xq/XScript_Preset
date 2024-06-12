{@type:filter}
setbarfreq("AD");

input:period(20,"計算區間");

value2=nthhighest(1,high[1],period);//最高價
value3=nthhighest(2,high[1],period);//第二高價
value4=nthhighest(3,high[1],period);//第三高價
value5=nthhighestbar(1,high[1],period);//最高價距今幾根bar
value6=nthhighestbar(2,high[1],period);//第二高價距今幾根bar
value7=nthhighestbar(3,high[1],period);//第三高價距今幾根bar

condition1=false;
condition2=false;

if value6-value5>3 and value7-value6>3
then condition1=true;//三個高點沒有連在一起，且是愈來愈高

if maxlist(value2,value3,value4)<minlist(value2,value3,value4)*1.07
then condition2=true;//三個高點沒有差多少

 
if condition1 and condition2  
and close crosses over value2
and close[period]*1.05<value2
then ret=1;

outputfield(1, value2, 2, "前波高點", order := -1);
