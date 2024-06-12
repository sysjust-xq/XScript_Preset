{@type:filter}
setbarfreq("AD");

input:Period(20, "平台區間");
input:ratio(10, "整理幅度(%)");
input:ratio1(3,"各高點(低點)間的差異幅度");

variable:h1(0),h2(0),L1(0),L2(0);

h1=nthhighest(1,high[1],period);
h2=nthhighest(4,high[1],period);
l1=nthlowest(1,low[1],period);
l2=nthlowest(4,low[1],period);

if (h1-l1)/l1<=ratio/100
  and (h1-h2)/h2<=ratio1/100
  and (l2-l1)/l1<=ratio1/100
  and close crosses over h1
  and close[period+30]*1.1<h1
  and volume> average(volume,period)
then ret=1;

outputfield(1, h1, 2, "區間高點", order := -1);
