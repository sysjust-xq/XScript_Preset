{@type:indicator|@guid:fcba4a767a8e422da6a19cfe51cc1b22|@path:/大盤指標/法人買進賣出比重指標|@hash:ae6465d7d43fa056197503a243894a4f}
input:period(5,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("法人買進比重");
value2=GetField("法人賣出比重");
value3=value1-value2;
value4=average(value3,period);
plot1(value4,"法人買賣比重差額的移動平均");