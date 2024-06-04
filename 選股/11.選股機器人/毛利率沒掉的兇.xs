{@type:filter|@guid:7bf94457f7454160acf30f767dd4ea7b|@path:/11.選股機器人/毛利率沒掉的兇}
input:ratio(10,"毛利率單季衰退幅度上限");
input:period(10,"計算的期間，單位是季");

value1=GetField("營業毛利率","Q");
if trueall(value1>value1[1]*(1-ratio/100),period)
then ret=1;