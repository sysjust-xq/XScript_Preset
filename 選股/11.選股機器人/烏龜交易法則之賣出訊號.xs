{@type:filter}
setbarfreq("AD");

condition1=false;
condition2=false;
 
if L=lowest(L,100)and barslast(L=lowest(L,100))[1]>100
then condition1=true; 
//創百日新低且上一次發生時是在100個交易日之前

if average(volume[1], 5) >= 1000
then condition2=true;

//五日移動平均量大於千張
if condition1 and condition2
then ret=1;
 
outputfield(1,lowest(L,100),2,"跌破低點", order := -1);
