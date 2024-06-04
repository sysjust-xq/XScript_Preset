{@type:filter|@guid:a8205a0fb8e44734a77697f0b3ec80a9|@path:/10.價值投資/PB跌到歷年低點區且低於0.8}
value1=GetField("股價淨值比","Y");
value2=lowest(value1,4);
if value1<value2*1.3 and value1<=0.8
then ret=1;

outputfield(1, GetField("股價淨值比","Y"),2, "PB比", order := -1);
