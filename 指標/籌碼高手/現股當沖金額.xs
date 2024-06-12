{@type:indicator}
condition996 = symbolexchange = "TW" and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股

if condition994 =false and condition993 = false and condition996 = false //大盤+類股+個股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if symboltype = 1 then begin
	if volume <> 0 then
		value1 = (GetField("現股當沖買進金額")+GetField("現股當沖賣出金額"))/(volume*2)
	else
		value1 = 0;
	plot1(value1,"當沖比率",checkbox:=1,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：％
	plot2(GetField("現股當沖買進金額"),"買進",checkbox:=0,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：元，可勾選畫圖選項 (參數設定) 
	plot3(GetField("現股當沖賣出金額"),"賣出",checkbox:=0,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：元，可勾選畫圖選項 (參數設定) 
end else begin
	if GetField("成交金額(元)") <> 0 then
		value1 = (GetField("現股當沖買進金額")+GetField("現股當沖賣出金額"))/(GetField("成交金額(元)")*2)
	else
		value1 = 0;
	plot1(value1,"當沖比率",checkbox:=1,axis:=2,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位：％
	plot2(GetField("現股當沖買進金額"),"買進",checkbox:=0,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：元，可勾選畫圖選項 (參數設定) 
	plot3(GetField("現股當沖賣出金額"),"賣出",checkbox:=0,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：元，可勾選畫圖選項 (參數設定) 
end;