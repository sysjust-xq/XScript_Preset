{@type:filter}
setbarfreq("AD");

input:Period(15, "平台區間");
input:ratio(7, "整理幅度(%)");
input:ratio1(2,"各高點(低點)間的差異幅度");

variable:h1(0),h2(0),L1(0),L2(0);

h1=nthhighest(1,high[1],period);
h2=nthhighest(4,high[1],period);
l1=nthlowest(1,low[1],period);
l2=nthlowest(4,low[1],period);
 
if (h1-l1)/l1<=ratio/100
and (h1-h2)/h2<=ratio1/100
and (l2-l1)/l1<=ratio1/100
and close crosses below l1
and close[period+30]>l1*1.1
then ret=1;

outputfield(1, l1, 2, "區間低點", order := -1);
