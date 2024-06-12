{@type:sensor}
if average(truerange/close,20)*100<3
and truerange crosses over average(truerange,20)*1.2
and average(volume,30)<600
and close>close[1]*1.025
and close<30
then ret=1;