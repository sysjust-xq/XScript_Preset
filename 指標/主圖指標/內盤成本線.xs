{@type:indicator}
{內盤成本線 = 累計當日賣出金額(元) / 累計當日賣出量*1000, 就是特大+大+中+小, 不分大小單
支援商品：台股}

value91 = GetField("買進特大單金額");

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");

value1 = GetField("賣出特大單金額","D") + GetField("賣出大單金額","D") + GetField("賣出中單金額","D") + GetField("賣出小單金額","D");
value2 = GetField("賣出特大單量","D") + GetField("賣出大單量","D") + GetField("賣出中單量","D") + GetField("賣出小單量","D");
if value2 <> 0 then
	value3 = value1 / (value2 * 1000)
else
	value3 = value3[1];
	
plot1(value3,"內盤成本線");