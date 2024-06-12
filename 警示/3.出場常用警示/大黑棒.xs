{@type:sensor}
input:Percent(4); setinputname(1,"實體K棒為股價絕對百分比");

settotalbar(3);

if open/close >= 1 + Percent/100  //實體(開盤-收盤)
then ret=1;