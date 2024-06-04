{@type:indicator|@guid:a24a70570acd4888bc963aae77ece500|@path:/籌碼高手/借券餘額|@hash:71a8fed3687085b61ce3306a5d9450e1}
condition996 = symbolexchange = "TW" = true and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if condition994 = false and condition996 = false //大盤+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");


if symboltype = 1 then begin
	plot1(GetField("借券餘額張數"),"借券餘額(張)",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張
	plot2(GetField("借券張數") - GetField("還券張數"),"差額(張)",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張
	plot3(GetField("借券張數"),"借券(張)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
	plot4(getfield("還券張數"),"還券(張)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
end else begin
	plot1(GetField("借券餘額張數"),"借券餘額(張)",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
	plot2(GetField("借券張數") - GetField("還券張數"),"差額(張)",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
	plot3(GetField("借券張數"),"借券(張)",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
	plot4(getfield("還券張數"),"還券(張)",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
end;
