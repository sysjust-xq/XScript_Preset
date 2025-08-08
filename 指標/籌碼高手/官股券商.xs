{@type:indicator}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition998 = condition999 = true and (symboltype = 2 or symboltype = 1);//個股+興櫃+類股
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤

if condition994 =false and condition998 = false //大盤+個股+興櫃+類股
	then raiseruntimeerror("不支援此商品");

if barfreq <> "D" and barfreq <> "AD"
	then raiseruntimeerror("不支援此頻率");

if condition994 then begin
	value1 = GetField("官股券商買進金額");
	value2 = GetField("官股券商賣出金額");
	value3 = value1 - value2;
	value4 = GetField("官股券商累計買賣超金額");
	setplotlabel(1,"買賣超(元)");
	setplotlabel(2,"累計買賣超(元)");
	setplotlabel(3,"買進(元)");
	setplotlabel(4,"賣出(元)");
	plot1(value3,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //bar，axis2
	plot1(value3,"買賣超"); //bar，axis2
	plot2(value4,"官股券商累計買賣超",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis1
	plot3(value1,"買進(元)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
	plot4(value2,"賣出(元)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
end else if condition994 = false then begin
	value1 = GetField("官股券商買進金額");
	value2 = GetField("官股券商賣出金額");
	value3 = GetField("官股券商買賣超張數");
	value4 = value4 + value3;
	setplotlabel(1,"買賣超(張)");
	setplotlabel(2,"累計買賣超(張)");
	setplotlabel(3,"買進(張)");
	setplotlabel(4,"賣出(張)");
	plot1(value3,"買賣超(張)",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //bar，axis2
	plot2(value4,"官股券商累計買賣超(張)",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis1
	plot3(value1,"買進(張)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
	plot4(value2,"賣出(張)",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
end;