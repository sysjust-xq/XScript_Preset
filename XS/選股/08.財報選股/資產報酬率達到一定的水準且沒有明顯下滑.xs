{@type:filter|@guid:cf4b5173b8984f4e9b0e86c5bb608041|@path:/08.財報選股/資產報酬率達到一定的水準且沒有明顯下滑}
value1=GetField("資產報酬率","Q");
value2=average(value1,4);
value3=linearregslope(value2,5);
if value3>0
then ret=1;