{@type:indicator}
input:length(5,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1=GetField("當日沖銷張數");
value2=average(value1,length);
plot1(value2,"當日沖銷張數的移動平均");

