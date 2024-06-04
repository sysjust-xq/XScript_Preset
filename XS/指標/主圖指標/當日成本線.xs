{@type:indicator|@guid:171625c290b94208bab0cecb21a9b87b|@path:/主圖指標/當日成本線|@hash:4a3201192750b4903ec5e8f49ae3b8ad}
{均線 = 當日所有成交Tick的平均價格(sum(pv)/sum(v)), 也就是當日的成本
支援商品：台股/期貨/選擇權/陸股/港股/美股/大盤/類股}

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");
	
plot1(GetField("均價"),"均價");