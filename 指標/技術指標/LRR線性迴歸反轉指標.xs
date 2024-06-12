{@type:indicator}
input:period(10,"期數");

variable:lrr(0);

value1=linearregslope(close,period);
if value1>value1[1] then
	lrr=1
else
	lrr=-1;

plot1(lrr,"線性迴歸反轉指標");