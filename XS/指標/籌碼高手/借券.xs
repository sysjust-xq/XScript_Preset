{@type:indicator|@guid:c0b7451788f948fca34252c325c17eae|@path:/籌碼高手/借券|@hash:c5e6eb667f4b32085ce3b5dd05340bd3}
//借券餘額市值公式參考：
//http://www.twse.com.tw/ch/trading/SBL/TWT72U/TWT72U.php

condition996 = symbolexchange = "TW" = true and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if condition994 = false and condition996 = false //大盤+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if symboltype = 1 then begin
	plot1(GetField("借券賣出餘額張數"),"借券賣出餘額(張)",axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);			//單位：張
	plot2(GetField("借券餘額張數"),"借券餘額(張)",axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);				//單位：張
	//plot3(GetField("借券餘額張數")*1000*close,"借券餘額市值(元)",axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);	//單位：元，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
end else begin
	plot1(GetField("借券賣出餘額張數"),"借券賣出餘額(張)",axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);			//單位：張
	plot2(GetField("借券餘額張數"),"借券餘額(張)",axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);				//單位：張
	plot3(GetField("借券餘額張數")*1000*close,"借券餘額市值(元)",axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);	//單位：元，新增查價顯示 (繪圖形式->隱藏, 不畫圖)
end;