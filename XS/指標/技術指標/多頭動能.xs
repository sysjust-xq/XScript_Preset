{@type:indicator|@guid:9bb57be62cf845b5996c14adf9099896|@path:/技術指標/多頭動能|@hash:626a07378916805794ed3b17f0c28a9d}
input:period(10,"平均值天期");

value1=high-close[1]+low-low[1];
value2=average(value1,period);

plot1(value2,"多頭動能平均值");