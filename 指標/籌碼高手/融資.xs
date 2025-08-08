{@type:indicator}
input: _input1(1,"大盤融資單位",inputkind:= Dict(["金額",1],["張數",2]));//1=金額、2=張數

condition996 = symbolexchange = "TW" and symboltype = 2;//個股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition993 = symbolexchange = "TW" and symboltype = 1;//類股
condition991 = symbolexchange = "SH" and symboltype = 2;//滬股
condition990 = symbolexchange = "SZ" and symboltype = 2;//深股

if condition994 =false and condition993 = false and condition996 = false //大盤+類股+個股
	and condition991 = false and condition990 = false //陸股
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if condition994 and _input1 = 1 then begin
	plot1(GetField("融資餘額金額"),"融資(元)",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張
	plot2(GetField("融資增減金額"),"差額(元)",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//單位：張
	plot3(GetField("融資買進金額"),"買進(元)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//可勾選畫圖選項 (參數設定) 
	plot4(GetField("融資賣出金額"),"賣出(元)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//可勾選畫圖選項 (參數設定) 
	plot5(GetField("現金償還張數"),"現償(張)",checkbox:=0,axis:=12,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto);//可勾選畫圖選項 (參數設定) 
	setplotlabel(1,"融資(元)");
	setplotlabel(2,"差額(元)");
	setplotlabel(3,"買進(元)");
	setplotlabel(4,"賣出(元)");
end else begin
	plot1(GetField("融資餘額張數"),"融資(張)",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
	plot2(GetField("融資增減張數"),"差額(張)",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0);//單位：張
	if condition996 then begin
		value1 = GetField("融資買進張數");
		value2 = GetField("融資賣出張數");
		value3 = GetField("現金償還張數");
	end;
	plot3(value1,"買進(張)",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//可勾選畫圖選項 (參數設定) 
	plot4(value2,"賣出(張)",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0);//可勾選畫圖選項 (參數設定) 
	plot5(value3,"現償(張)",checkbox:=0,axis:=12,ScaleLabel:=slfull,ScaleDecimal:=sd0);//可勾選畫圖選項 (參數設定) 
	setplotlabel(1,"融資(張)");
	setplotlabel(2,"差額(張)");
	setplotlabel(3,"買進(張)");
	setplotlabel(4,"賣出(張)");
end;
if condition996 then
	plot6(GetField("融資使用率")*0.01,"使用率",axis:=13,ScaleLabel:=slpercent,ScaleDecimal:=sd2);//單位%，隱藏，不畫圖，僅查價

