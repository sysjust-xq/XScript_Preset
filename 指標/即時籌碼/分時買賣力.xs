{@type:indicator|@guid:96de4bbd77574d178e5fc8cb75454c3f|@path:/即時籌碼/分時買賣力|@hash:ced45e0c7ce188a1ab385e2ee7e227fa}
{支援商品：台股/期貨/選擇權}

if symbolexchange <> "TW" and symbolexchange <> "TF" then raiseruntimeerror("不支援此商品");
if SymbolType <> 2 and SymbolType <> 3 and SymbolType <> 5 then raiseruntimeerror("不支援此商品");

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");

value1 = GetField("外盤量");
value2 = GetField("內盤量");
value3 = value1 - value2;
plot1(value3,"買賣力");
plot2(value1,"外盤量",checkbox:=0);
plot3(value2,"內盤量",checkbox:=0);