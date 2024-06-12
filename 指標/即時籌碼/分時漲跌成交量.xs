{@type:indicator}
{支援商品類型：台股/期權/選擇權/大盤/類股指數}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");

value1 = GetField("上漲量");
value2 = GetField("下跌量");
value3 = value1 - value2;
plot1(value3,"漲跌成交(分時)");
plot2(value1,"上漲量",checkbox:=0);
plot3(value2,"下跌量",checkbox:=0);