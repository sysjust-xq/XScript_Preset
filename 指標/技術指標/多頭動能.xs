{@type:indicator}
input:period(10,"平均值天期");

value1=high-close[1]+low-low[1];
value2=average(value1,period);

plot1(value2,"多頭動能平均值");