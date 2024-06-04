{@type:indicator|@guid:335803ceee014540b9b6119a9f1a7d2a|@path:/期權指標/外資期權動態|@hash:e17ebf8eac5b0fe00037cc87b2be5310}
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
