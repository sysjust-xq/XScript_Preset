{@type:indicator|@guid:ad38b4e11acf440486a90f93f0a62ebc|@path:/即時籌碼/散戶買賣力(金額)|@hash:e8de6d4f32ea8f0cf085f60f74ab209a}
{散戶買賣力(金額)是小單金額，資料為開盤迄今的累計
支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");

value91 = GetField("賣出小單金額");//僅提供給有權限的用戶使用

value1 = GetField("賣出小單金額","D");
value2 = GetField("買進小單金額","D");
value3 = value2 - value1;
plot1(value3,"散戶買賣力(金額)"); //bar，axis2
plot2(value2,"散戶外盤金額",checkbox:=0); //line，axis11
plot3(value1,"散戶內盤金額",checkbox:=0); //line，axis11