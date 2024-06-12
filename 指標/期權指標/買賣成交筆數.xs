{@type:indicator}
{指標數值定義："委買委賣成筆差 = 委賣成交筆數 - 委買成交筆數"
支援商品：期貨/選擇權}

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");

value1 = GetField("累買成筆");
value2 = GetField("累賣成筆");
value3 = GetField("累賣成筆") - GetField("累買成筆");

plot1(value3,"委買委賣成筆差");
plot2(value1,"委買成筆",checkbox:=0);
plot3(value2,"委賣成筆",checkbox:=0);
