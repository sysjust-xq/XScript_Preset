{@type:indicator|@guid:d884cb1ca2754294b5c7386310c840b3|@path:/即時籌碼/分時散戶買賣力|@hash:a952f8900b952a6580fe8cd6d59701c9}
{指標數值定義："散戶單=小單資料為分鐘統計張數"
支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");
	
value91 = GetField("賣出小單量");//僅提供給有權限的用戶使用

value1 = GetField("賣出小單量");
value2 = GetField("買進小單量");
value3 = value2 - value1;
plot1(value3,"散戶買賣力"); 
plot2(value2,"散戶外盤量",checkbox:=0); 
plot3(value1,"散戶內盤量",checkbox:=0); 