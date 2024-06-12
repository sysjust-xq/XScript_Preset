{@type:filter}
setbarfreq("AD");
 
variable:aspeed(0),dspeed(0),a1(0),d1(0),p1(0),ap1(0);
if close>close[1] then aspeed=(close-close[1])/close*100
else aspeed=0;
if close<close[1] then dspeed=(close[1]-close)/close*100
else dspeed=0;

a1=average(aspeed,5);
d1=average(dspeed,5);

p1=a1-d1;
ap1=average(p1,9);

if p1 crosses over ap1
and rsi(close,6)<=75
and close*1.3<close[30]

then ret=1;

outputfield(1, nthlowest(1,low[1],9), 2, "近期低點", order := -1);
