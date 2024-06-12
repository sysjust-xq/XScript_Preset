{@type:indicator}
input:length(3,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1=GetField("外資交易買口");
value2=GetField("外資交易賣口");
value3=GetField("外資買方未平倉口數");
value4=GetField("外資賣方未平倉口數");
value5=value1-value2;//外資今日淨買賣口數
plot1(value5,"外資今日淨買賣口數");
plot2(average(value5,length),"移動平均");
