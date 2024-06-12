{@type:filter}
SetBarFreq("AW");

if rateofchange(close,2)[1]>0 and rateofchange(close,2)[2]>0
and close<close[2]*1.07
and close[10]>close*1.2
then ret=1;

outputfield(1,close[2],2,"前波低點", order := -1);
