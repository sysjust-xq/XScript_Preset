{@type:sensor|@guid:2a74ce865a124f66bc26185aeb18ff5f|@path:/技術分析/開始有人問津}
if average(truerange/close,20)*100<3
and truerange crosses over average(truerange,20)*1.2
and average(volume,30)<600
and close>close[1]*1.025
and close<30
then ret=1;