{@type:indicator|@guid:e69a607a4fb64353a68a51fc09789590|@path:/籌碼高手/主力進出|@hash:eab424182978270af17a55114708237f}
condition999 = symbolexchange = "TW" or symbolexchange = "TE";//台股+興櫃
condition994 = symbol = "TSE.TW" or symbol = "TWSE.FS" or symbol = "OTC.TW";//大盤
condition997 = condition999 and (symboltype = 2 or symboltype = 4);//個股+權證+興櫃

if condition999 = false and condition994 = false//大盤, 個股, 權證, 興櫃, 類股指數
	then raiseruntimeerror("不支援此商品");
	
if barfreq = "Min" then raiseruntimeerror("不支援此頻率");

if condition994 then begin
	value1 = GetField("主力買進金額");
	value2 = GetField("主力賣出金額");
	value3 = value1 - value2;
	value4 = GetField("主力累計買賣超金額");
	plot2(value4,"主力累計買賣超",checkbox:=1,axis:=1,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis1
	setplotlabel(1,"買賣超(元)");
	setplotlabel(2,"主力累計買賣超(元)");
	setplotlabel(3,"買進(元)");
	setplotlabel(4,"賣出(元)");
	plot1(value3,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //bar，axis2
	plot3(value1,"買進",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis2
	plot4(value2,"賣出",checkbox:=0,axis:=11,ScaleLabel:=sltypewy,ScaleDecimal:=sd0); //line，axis2
end else begin
	if symbolexchange <> "TE" and symboltype <> 1 then begin
		value1 = GetField("主力買張");
		value2 = GetField("主力賣張");
	end;
	value3 = GetField("主力買賣超張數");
	plot2(GetField("主力持股"),"主力持股",checkbox:=1,axis:=1,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis1
	setplotlabel(1,"買賣超(張)");
	setplotlabel(2,"主力持股(張)");
	setplotlabel(3,"買進(張)");
	setplotlabel(4,"賣出(張)");
	plot1(value3,"買賣超",checkbox:=1,axis:=2,ScaleLabel:=slfull,ScaleDecimal:=sd0); //bar，axis2
	if symbolexchange <> "TE" and symboltype <> 1 then begin
		plot3(value1,"買進",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis2
		plot4(value2,"賣出",checkbox:=0,axis:=11,ScaleLabel:=slfull,ScaleDecimal:=sd0); //line，axis2
	end;
end;

