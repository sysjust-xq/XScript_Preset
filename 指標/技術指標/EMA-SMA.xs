{@type:indicator}
input:period(20,"計算期間");

value1=EMA(close,period);
value2=average(close,period);
if close<>0 then 
	value3=(value1-value2)/close*100;

plot1(value3,"EMA-SMA");