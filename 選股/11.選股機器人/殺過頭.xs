{@type:filter}
setbarfreq("AD");

input:day(5,"短期天數");
input:period(20,"波段天數");
input:r1(20,"波段最低跌幅");
input:r2(10,"短期最低跌幅");
input:r3(2,"本日急拉幅度");
input:v1(1000,"成交量下限");

condition1=false;
condition2=false;
condition3=false;
 
if highest(high,period)>=close[1]*(1+r1/100)
then condition1=true;
 
if highest(high,day)>=close[1]*(1+r2/100)
then condition2=true;
 
if close>=close[1]*(1+r3/100) and v1>=1000
then condition3=true;
 
if condition1 and condition2 and condition3
then ret=1;

outputfield(1,lowest(low,period),2,"前波低點", order := -1);
