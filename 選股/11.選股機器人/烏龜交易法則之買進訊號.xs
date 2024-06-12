{@type:filter}
setbarfreq("AD");

condition1=false;
condition2=false;
 
if high=highest(high,100)and barslast(high=highest(high,100))[1]>100
then condition1=true; 
//創百日新高且上一次發生時是在100個交易日之前

if average(volume[1], 5) >= 1000
then condition2=true;

//五日移動平均量大於千張
if condition1 and condition2
then ret=1;
 
outputfield(1,highest(high,100),2,"突破高點", order := -1);

