{@type:indicator|@guid:1e57d3cd52d34afd82525259f44cb696|@path:/即時籌碼/散戶買賣力|@hash:43bce8dd27d1254ccb737f6b1a40d58e}
{指標數值定義："散戶單=小單資料為開盤迄今的累計張數"

支援商品：台(股票)}

if barfreq <> "Min" and barfreq <> "D" and barfreq <> "AD" then 
	raiseruntimeerror("僅支援分鐘與日頻率（含還原）");

value91 = GetField("賣出小單量");//僅提供給有權限的用戶使用

value1 = GetField("賣出小單量","D");
value2 = GetField("買進小單量","D");
value3 = value2 - value1;
plot1(value3,"散戶買賣力"); //bar，axis2
plot2(value2,"散戶外盤量",checkbox:=0); //line，axis11
plot3(value1,"散戶內盤量",checkbox:=0); //line，axis11