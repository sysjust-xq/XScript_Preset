{@type:sensor}
input:Amount(10000); setinputname(1,"依頻率設定巨量門檻");
settotalbar(3);
if open > Close * 1.025//實體 
and close[1] > Close * 1.035 //較前一日大跌
and volume >=amount 
then ret=1;