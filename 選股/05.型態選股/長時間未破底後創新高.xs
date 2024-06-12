{@type:filter}
setbarfreq("AD");

input:period(90,"未破底區間");
input:percent(25,"盤整區間漲幅上限");

condition1=false;
condition2=false;
value1=lowest(low,period);
if value1=low[period-1]
then condition1=true;

if highest(high[1],period)<=value1*(1+percent/100)
then condition2=true;

if condition1 and condition2 and close crosses over highest(close[1],period)
then ret=1;

outputfield(1,value1,2,"前波低點", order := -1);
