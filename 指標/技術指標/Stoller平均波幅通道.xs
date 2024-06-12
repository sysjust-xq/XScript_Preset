{@type:indicator}
input:
	avlength(5,"均線期數"),
	atrlength(15,"ATR平均期數"),
	k(1.35,"常數");
variable:hband(0),lband(0);

hband=average(close,avlength)+average(truerange,atrlength)*k;
lband=average(close,avlength)-average(truerange,atrlength)*k;

plot1(hband,"通道上限");
plot2(close,"收盤價");
plot3(lband,"通道下限");
