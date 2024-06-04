{@type:indicator|@guid:81cbaaffd9084e5cb78d41defd7128a1|@path:/技術指標/加速指標|@hash:5d47cd484c6ed69adb178b546a5f8109}
input:period1(5,"計算天期");
input:period2(9,"MA天期");

variable:aspeed(0),dspeed(0),a1(0),d1(0),p1(0),ap1(0);

if close>close[1] then
	aspeed=(close-close[1])/close*100
else 
	aspeed=0;
	
if close<close[1] then
	dspeed=(close[1]-close)/close*100
else
	dspeed=0;

a1=average(aspeed,period1);
d1=average(dspeed,period1);


p1=a1-d1;
ap1=average(p1,period2);

plot1(p1,"加速度");
plot2(ap1,"移動平均");

