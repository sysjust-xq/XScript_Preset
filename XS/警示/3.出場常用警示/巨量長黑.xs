{@type:sensor|@guid:9878deebd5eb4783a2c28ddc8be3d621|@path:/3.出場常用警示/巨量長黑|@hash:761f5034bad8e32b70f1ac78f5e23889}
input:Amount(10000); setinputname(1,"依頻率設定巨量門檻");
settotalbar(3);
if open > Close * 1.025//實體 
and close[1] > Close * 1.035 //較前一日大跌
and volume >=amount 
then ret=1;