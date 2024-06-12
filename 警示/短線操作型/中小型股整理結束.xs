{@type:sensor}
input: Periods(20); setinputname(1,"計算期數");
input: Ratio(3);setinputname(2,"近期波動幅度%");

settotalbar(300);
setbarback(50);

condition1 = false;

if (highest(high[1],Periods-1) - lowest(low[1],Periods-1)) <= ratio*0.01*close[1]
then condition1=true//近期波動在?%以內
else return;

if condition1 
and high = highest(high, Periods)
and GetSymbolField("tse.tw","收盤價")>average(GetSymbolField("tse.tw","收盤價"),10)
and average(GetSymbolField("tse.tw","收盤價"),5)>average(GetSymbolField("tse.tw","收盤價"),20)
then ret=1;//盤整後往上突破
