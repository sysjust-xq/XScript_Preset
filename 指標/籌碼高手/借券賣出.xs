{@type:indicator}
condition996 = symbolexchange = "TW" = true and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if condition994 = false and condition996 = false //大盤+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if symboltype = 1 then begin
	plot1(GetField("借券賣出餘額張數"),"借券賣出餘額(張)",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張
	plot2(GetField("借券賣出張數")+GetField("借券賣出庫存異動張數"),"差額(張)",checkbox:=1,axis:=2);//增減bar，請RD加"借券還券"與"借券調整"
	plot3(GetField("借券賣出張數"),"賣出(張)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
	plot4(GetField("借券賣出庫存異動張數"),"還券(張)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//請RD加
end else begin
	plot1(GetField("借券賣出餘額張數"),"借券賣出餘額(張)",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
	plot2(GetField("借券賣出張數")+GetField("借券賣出庫存異動張數"),"差額(張)",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//增減bar，請RD加"借券還券"與"借券調整"
	plot3(GetField("借券賣出張數"),"賣出(張)",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
	plot4(GetField("借券賣出庫存異動張數"),"還券(張)",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//請RD加
end;
