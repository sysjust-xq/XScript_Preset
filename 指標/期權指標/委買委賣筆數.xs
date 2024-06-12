{@type:indicator}
{指標數值定義：(委買)筆數 = 交易所資料(開盤到目前累計(委買)筆數)
for 大盤,  委買委賣資料不含權證, 多一個成交筆數

支援商品：大盤/期貨/選擇權}

condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
	
if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");

if condition994 then begin//大盤
	value1 = GetField("累委買筆");
	value2 = GetField("累委賣筆");
	value3 = GetField("累委買筆") - GetField("累委賣筆");
	value4 = GetField("累成交筆");
	plot1(value3,"委買委賣筆數差");
	plot2(value1,"委買筆數",checkbox:=0);
	plot3(value2,"委賣筆數",checkbox:=0);
	plot4(value4,"累成交筆");
end else begin//期貨與選擇權
	value1 = GetField("累委買筆");
	value2 = GetField("累委賣筆");
	value3 = GetField("累委買筆") - GetField("累委賣筆");
	plot1(value3,"委買委賣筆數差");
	plot2(value1,"委買筆數",checkbox:=0);
	plot3(value2,"委賣筆數",checkbox:=0);
	noplot(4);
end;
