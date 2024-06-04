{@type:filter|@guid:432b34316ccb4922a18aedf027455c9b|@path:/04.價量選股/有一定成交值且過去三日漲幅小}
input:b1(1.5,"三日漲幅上限");
if volume*close>=30000
and close<=close[2]*(1+b1/100)
then ret=1;