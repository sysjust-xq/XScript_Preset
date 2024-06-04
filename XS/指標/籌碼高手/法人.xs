{@type:indicator|@guid:752b618f046c4365b1ad96e4c96a4fdc|@path:/籌碼高手/法人|@hash:27e1fc5ee053a77585912219b7fc3866}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition997 = condition999 and (symboltype = 2 or symboltype = 4);//個股+權證+興櫃

if condition999 = false and condition994 = false//大盤, 個股, 權證, 興櫃, 類股指數
	then raiseruntimeerror("不支援此商品");

if barfreq = "Tick" or barfreq = "Min"
	then raiseruntimeerror("不支援此頻率");

if condition994 then begin
	value1 = GetField("法人買進金額");
	value2 = GetField("法人賣出金額");
	value3 = GetField("法人買賣超金額");
	value4 = value4 + GetField("法人買賣超金額");
	plot2(value4,"法人累計買賣超",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis1
	setplotlabel(1,"買賣超(元)");
	setplotlabel(2,"法人累計買賣超(元)");
	setplotlabel(3,"買進(元)");
	setplotlabel(4,"賣出(元)");
	plot1(value3,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //bar，axis2
	plot3(value1,"買進",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
	plot4(value2,"賣出",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sdauto); //line，axis2
end else begin
	if symbolexchange <> "TE" and symboltype <> 1 and date >= 20110106 then begin
		value1 = GetField("法人買張");
		value2 = GetField("法人賣張");
	end;
	value3 = GetField("法人買賣超張數");
	plot2(GetField("法人持股"),"法人持股",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis1
	setplotlabel(1,"買賣超(張)");
	setplotlabel(2,"法人持股(張)");
	setplotlabel(3,"買進(張)");
	setplotlabel(4,"賣出(張)");
	if symboltype <> 1 then 
		value5 = 0.01*GetField("法人持股比例");
	plot5(value5,"法人持股比例",axis:=12,ScaleLabel:=slpercent,ScaleDecimal:=sd2);
	plot1(value3,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0); //bar，axis2
	if symbolexchange <> "TE" and symboltype <> 1 then begin
		plot3(value1,"買進",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis2
		plot4(value2,"賣出",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis2
	end;
end;