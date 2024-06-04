{@type:indicator|@guid:8acbba3991644075bebffc8becd7ca14|@path:/主圖指標/BBand軌道線|@hash:7ab4e38b671b2cf1d307c6312073ed9a}
input: 
	Length(20, "MA的天數"), 
	UpperBand(2, "上通道標準差倍數"), 
	LowerBand(2, "下通道標準差倍數");
variable: mid(0), up(0), down(0);

up = bollingerband(Close, Length, UpperBand);
mid = average(close, Length);
down = bollingerband(Close, Length, -1 * LowerBand);

plot1(up, "UB");
plot2(mid, "BBandMA");
plot3(down, "LB");
