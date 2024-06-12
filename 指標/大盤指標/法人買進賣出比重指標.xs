{@type:indicator}
input:period(5,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("法人買進比重");
value2=GetField("法人賣出比重");
value3=value1-value2;
value4=average(value3,period);
plot1(value4,"法人買賣比重差額的移動平均");