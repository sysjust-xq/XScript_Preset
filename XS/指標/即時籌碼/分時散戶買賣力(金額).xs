{@type:indicator|@guid:cffe1ea38fa04b7d95fde47248c7bcd7|@path:/即時籌碼/分時散戶買賣力(金額)|@hash:8187acf564d647f341a5639f8baaa283}
{指標數值定義："散戶單=小單資料為分鐘統計金額"
支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");
	
value91 = GetField("賣出小單金額");//僅提供給有權限的用戶使用

value1 = GetField("賣出小單金額");
value2 = GetField("買進小單金額");
value3 = value2 - value1;
plot1(value3,"散戶買賣力(金額)");
plot2(value2,"散戶外盤量(金額)",checkbox:=0);
plot3(value1,"散戶內盤量(金額)",checkbox:=0);