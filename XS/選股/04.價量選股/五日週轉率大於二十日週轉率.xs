{@type:filter|@guid:566ed092fa9e4736b9984292aece85c6|@path:/04.價量選股/五日週轉率大於二十日週轉率}
if turnoverrate(5)>turnoverrate(20)
then ret=1;
outputfield(1,turnoverrate(5),1,"5日平均週轉率");
outputfield(2,turnoverrate(20),1,"20日平均週轉率");
