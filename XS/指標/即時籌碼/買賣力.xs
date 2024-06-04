{@type:indicator|@guid:df8b7d3d65bc42d88fe9d423435374cf|@path:/即時籌碼/買賣力|@hash:3ccc9020ba3274db8b6722c45898732b}
{指標數值定義：(外盤)量 = 開盤累計到目前的(外盤)成交量

支援商品：台股/期貨/選擇權}

if symbolexchange <> "TW" and symbolexchange <> "TF" then raiseruntimeerror("不支援此商品");
if SymbolType <> 2 and SymbolType <> 3 and SymbolType <> 5 then raiseruntimeerror("不支援此商品");

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");

value91 = GetField("外盤量");//僅提供給有權限的用戶使用

value1 = GetField("外盤量","D");
value2 = GetField("內盤量","D");
value3 = value1 - value2;
plot1(value3,"買賣力");
plot2(value1,"外盤量",checkbox:=0);
plot3(value2,"內盤量",checkbox:=0);