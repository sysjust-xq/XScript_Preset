{@type:sensor|@guid:8775fc5fb08d41d196e24bbbc08018b7|@path:/3.出場常用警示/大黑棒|@hash:5b6c2ff812b8b40b2fc439547c8a3eaa}
input:Percent(4); setinputname(1,"實體K棒為股價絕對百分比");

settotalbar(3);

if open/close >= 1 + Percent/100  //實體(開盤-收盤)
then ret=1;