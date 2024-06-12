{@type:indicator}
{指標數值定義："口數差 = 委買口數 - 委賣口數"
支援商品：大盤/期貨/選擇權}

condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if barfreq <> "Min" and barfreq <> "D" then 
	raiseruntimeerror("僅支援分鐘與日頻率");

if condition994 then begin//大盤
	value1 = GetField("累計委買");
	value2 = GetField("累計委賣");
	value3 = GetField("累計委買") - GetField("累計委賣");
	plot1(value3,"委買委賣口數差");
	plot2(value1,"委買口數",checkbox:=0);
	plot3(value2,"委賣口數",checkbox:=0);
	setplotlabel(1,"委買委賣張數差");
	setplotlabel(2,"委買張數");
	setplotlabel(3,"委賣張數");
end else begin//期貨與選擇權
	value1 = GetField("累計委買");
	value2 = GetField("累計委賣");
	value3 = GetField("累計委買") - GetField("累計委賣");
	plot1(value3,"委買委賣口數差");
	plot2(value1,"委買口數",checkbox:=0);
	plot3(value2,"委賣口數",checkbox:=0);
	setplotlabel(1,"委買委賣口數差");
	setplotlabel(2,"委買口數");
	setplotlabel(3,"委賣口數");
end;
