{@type:indicator|@guid:5e69133f8ed04b5ca68f19e645691fcc|@path:/大盤指標/當日沖銷張數|@hash:780c630357d9bf285a5eb8b26103016a}
input:length(5,"期數");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

value1=GetField("當日沖銷張數");
value2=average(value1,length);
plot1(value2,"當日沖銷張數的移動平均");

