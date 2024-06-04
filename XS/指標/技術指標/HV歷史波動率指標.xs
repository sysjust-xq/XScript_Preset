{@type:indicator|@guid:9a931e12fc0a434b809ecd44fa76198d|@path:/技術指標/HV歷史波動率指標|@hash:f4c2a0f9af225a2884460fe82117cbc3}
input:LENGTH1(6,"短天期"),LENGTH2(100,"短天期");

variable:HVS(0),HVL(0),HVindex(0);
value1=log(close/close[1]);
HVS=STANDARDDEV(value1,LENGTH1,1)*100*SQUAREROOT(252);
HVL=STANDARDDEV(VALUE1,LENGTH2,1)*100*SQUAREROOT(252);
HVindex=HVS/HVL;

plot1(hvindex,"歷史波動率指標");