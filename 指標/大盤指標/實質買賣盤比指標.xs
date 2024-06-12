{@type:indicator}
input:length(5,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("實質買盤比");
value2=GetField("實質賣盤比");
value3=average(value1,length)-80;
plot1(value3,"實質買賣盤比");
 


