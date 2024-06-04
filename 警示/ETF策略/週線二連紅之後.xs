{@type:sensor|@guid:787295dc047a45b3b7a119df3f1b86c3|@path:/ETF策略/週線二連紅之後}
if rateofchange(close,2)[1]>0 
and rateofchange(close,2)[2]>0
and close<close[2]*1.07
and close[10]>close*1.15
then ret=1;
 
