{@type:indicator|@guid:6af808e6a2da418cb5fbdfedbf428f32|@path:/籌碼高手/融資維持率|@hash:a452a0586606bd4fe43255aa484a8106}
condition996 = symbolexchange = "TW" = true and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if condition994 = false and condition996 = false //大盤+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

plot1(GetField("融資維持率")*0.01, "融資維持率",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
//plot1(1, "融資維持率",checkbox:=1,axis:=1);

if symboltype = 1 then begin
	plot2(GetField("融資增減金額"),"融資增減(元)",checkbox:=0,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：元
	setplotlabel(2,"融資增減(元)");
end else begin
	plot2(GetField("融資增減張數"),"融資增減(張)",checkbox:=0,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
	setplotlabel(2,"融資增減(張)");
end;

