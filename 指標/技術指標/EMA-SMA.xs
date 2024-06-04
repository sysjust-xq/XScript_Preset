{@type:indicator|@guid:7fc1b00ba7d34f5580976fa05e3c49ec|@path:/技術指標/EMA-SMA|@hash:211bbcefdadd7a93113c3e65bd5261ef}
input:period(20,"計算期間");

value1=EMA(close,period);
value2=average(close,period);
if close<>0 then 
	value3=(value1-value2)/close*100;

plot1(value3,"EMA-SMA");