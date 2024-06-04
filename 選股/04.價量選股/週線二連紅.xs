{@type:filter|@guid:f07cdd2b3ff6457c85096d792624eacc|@path:/04.價量選股/週線二連紅}
SetBarFreq("AW");

if rateofchange(close,2)[1]>0 and rateofchange(close,2)[2]>0
and close<close[2]*1.07
and close[10]>close*1.2
then ret=1;

outputfield(1,close[2],2,"前波低點", order := -1);
