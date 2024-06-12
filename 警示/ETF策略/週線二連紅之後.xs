{@type:sensor}
if rateofchange(close,2)[1]>0 
and rateofchange(close,2)[2]>0
and close<close[2]*1.07
and close[10]>close*1.15
then ret=1;
 
