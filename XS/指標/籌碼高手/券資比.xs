{@type:indicator|@guid:307d55046ce04aa289806de527b6e96f|@path:/籌碼高手/券資比|@hash:713b2ac082ce23f9d4cb07eba44a3828}
condition996 = symbolexchange = "TW" and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

if condition994 =false and condition993 = false and condition996 = false //大盤+類股+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if symboltype = 1 then begin
	plot1(0.01 * GetField("券資比"),"券資比",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：
	plot2(GetField("融券餘額張數"),"融券餘額",axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
	plot3(GetField("融資餘額"),"融資餘額",axis:=12,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
end else begin
	plot1(0.01 * GetField("券資比"),"券資比",axis:=1,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：
	plot2(GetField("融券餘額張數"),"融券餘額",axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
	plot3(GetField("融資餘額"),"融資餘額",axis:=12,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
end;