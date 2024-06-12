{@type:filter}
setbarfreq("Q");
settotalbar(10);
value1=GetField("營業利益","Q");
if linearregslope(average(value1,5),5)>0
then ret=1;