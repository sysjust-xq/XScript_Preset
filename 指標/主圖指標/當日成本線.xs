{@type:indicator}
{均線 = 當日所有成交Tick的平均價格(sum(pv)/sum(v)), 也就是當日的成本
支援商品：台股/期貨/選擇權/陸股/港股/美股/大盤/類股}

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");
	
plot1(GetField("均價"),"均價");