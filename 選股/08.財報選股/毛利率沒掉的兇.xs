{@type:filter|@guid:420d321cce344498aca2ed12f83cd025|@path:/08.財報選股/毛利率沒掉的兇}
input:ratio(10,"毛利率單季衰退幅度上限");
input:period(10,"計算的期間，單位是季");

value1=GetField("營業毛利率","Q");
if trueall(value1>value1[1]*(1-ratio/100),period)
then ret=1;