{@type:indicator}
{指標數值定義："大戶=特大單+大單, 散戶=小單 
資料為大戶/散戶從開盤累計到現在的(外盤-內盤)張數"

支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");
	
value91 = GetField("賣出特大單量");

value1 = GetField("賣出特大單量","D") + GetField("賣出大單量","D");
value2 = GetField("買進特大單量","D") + GetField("買進大單量","D");
value3 = value2 - value1;
value11 = GetField("賣出小單量","D");
value21 = GetField("買進小單量","D");
value31 = value21 - value11;
plot1(value3,"大戶買賣力");
plot2(value31,"散戶買賣力");