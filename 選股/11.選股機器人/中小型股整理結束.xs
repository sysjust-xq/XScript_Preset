{@type:filter}
setbarfreq("AD");

//盤整後噴出
input: Periods(20,"計算期數");
input: Ratio(3,"近期波動幅度%");
input: Direction(1,"方向:1突破 -1跌破");
 
condition1 = false;

if (highest(high[1],Periods-1) - lowest(low[1],Periods-1))/close[1] <= ratio*0.01 
then condition1=true//近期波動在?%以內
else return;

if condition1 and Direction > 0 and high = highest(high, Periods)
and close>close[1]*1.02
then ret=1;//盤整後往上突破

outputfield(1,highest(high[1],Periods-1),2,"整理區高點", order := -1);
