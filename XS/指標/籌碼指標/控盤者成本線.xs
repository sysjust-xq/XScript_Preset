{@type:indicator|@guid:9c4dd3732cfb4554be96d1851e66e447|@path:/籌碼指標/控盤者成本線|@hash:39e0f88db3af812c27429b4b97a25845}
if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");
	
value1=GetField("控盤者成本線");
plot1(value1,"控盤者成本線");

