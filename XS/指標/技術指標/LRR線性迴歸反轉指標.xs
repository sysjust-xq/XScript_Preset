{@type:indicator|@guid:a33223bbca00486ea41228a61d4bcd33|@path:/技術指標/LRR線性迴歸反轉指標|@hash:75a7563d43e5a2d0ab83c31df5380e8e}
input:period(10,"期數");

variable:lrr(0);

value1=linearregslope(close,period);
if value1>value1[1] then
	lrr=1
else
	lrr=-1;

plot1(lrr,"線性迴歸反轉指標");