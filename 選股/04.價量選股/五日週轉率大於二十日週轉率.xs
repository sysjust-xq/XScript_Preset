{@type:filter}
if turnoverrate(5)>turnoverrate(20)
then ret=1;
outputfield(1,turnoverrate(5),1,"5日平均週轉率");
outputfield(2,turnoverrate(20),1,"20日平均週轉率");
