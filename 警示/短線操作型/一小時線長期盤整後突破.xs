{@type:sensor}
//盤整後噴出
input: Periods(20); setinputname(1,"計算期數");
input: Ratio(3);setinputname(2,"近期波動幅度%");
input: Direction(1);setinputname(3,"方向:1突破 -1跌破");
input: TXT1("僅適用60分鐘"); setinputname(4,"使用限制");

settotalbar(3);
setbarback(Periods);


condition1 = false;

if (highest(high[1],Periods-1) - lowest(low[1],Periods-1))/close[1] <= ratio*0.01 
then condition1=true//近期波動在?%以內
else return;

if condition1 and Direction > 0 and high = highest(high, Periods)
then ret=1;//盤整後往上突破

if condition1 and Direction < 0 and low = lowest(low, Periods)
then ret=1;//盤整後往下跌破


