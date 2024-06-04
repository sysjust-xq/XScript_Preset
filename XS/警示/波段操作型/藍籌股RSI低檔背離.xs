{@type:sensor|@guid:e1fca2b9125d45aca56be59cce5e3045|@path:/波段操作型/藍籌股RSI低檔背離|@hash:e71f5f755b03830f1ee6d67f91f75889}
input: Periods(50); setinputname(1,"計算期間");
input: Length(6); setinputname(2,"RSI");
input: LowFilter(25); setinputname(3,"RSI低檔區");

settotalbar(maxlist(Periods,maxlist(Length,6) * 8) + 3);

variable: rsivalue(0);

condition1 = false;
condition2 = false;
condition3 = false;
condition4 = false;

rsivalue = RSI(Close,Length);
value1 = highestbar(high,Periods);//轉折高點距離
value2 = lowestbar(low,Periods);//轉折低點距離

if value2 = 0	//今日為創新低的第二隻腳
then condition1 = true
else return;

if rsivalue <= LowFilter	//RSI位於低檔區
then condition2 = true
else return;

if value2[value1] + value1 < Periods //在計算區間內存在第一隻腳
then condition3 = true
else return;

if rsivalue[value2[value1] + value1] < rsivalue //RSI不再創新低
then condition4 = true
else return;

if condition1 and condition2 and condition3 and condition4
then ret = 1;

        
        